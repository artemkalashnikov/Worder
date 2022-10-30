ARG PYTHON_VERSION

FROM python:${PYTHON_VERSION}

ARG USERNAME
ARG USER_UID
ARG USER_GID=${USER_UID}
ARG APP_PORT

RUN groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME}

USER ${USERNAME}

WORKDIR /app

ENV PATH=$PATH:/home/${USERNAME}/.local/bin
COPY --chown=${USERNAME}:${USERNAME} requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY --chown=${USERNAME}:${USERNAME} . .

EXPOSE ${APP_PORT}

WORKDIR /app/src

CMD [ "flask", "run" ]
