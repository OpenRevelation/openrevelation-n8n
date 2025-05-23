
FROM docker.n8n.io/n8nio/n8n:1.93.0
USER root

# Устанавливаем существующие зависимости + fontconfig (для управления шрифтами)
# ttf-dejavu - хороший набор шрифтов общего назначения, полезно иметь
RUN apk add --no-cache ffmpeg curl imagemagick fontconfig ttf-dejavu

# Создаем директорию для шрифта Lora
RUN mkdir -p /usr/share/fonts/lora

# Копируем ваш шрифт из папки 'assets' (которую вы создали в репозитории)
# в созданную директорию внутри образа Docker
# Убедитесь, что путь 'assets/Lora-Medium.ttf' соответствует тому,
# куда вы положили шрифт в своем репозитории относительно Dockerfile.
COPY assets/Lora-Medium.ttf /usr/share/fonts/lora/Lora-Medium.ttf

# Обновляем кэш шрифтов, чтобы система и ImageMagick "увидели" новый шрифт
RUN fc-cache -f -v

# Ваша существующая команда для прав доступа к .n8n
RUN chown -R node:node /home/node/.n8n

USER node