FROM ruby:3.2.2

# Définissez le répertoire de travail dans le conteneur
WORKDIR /app

# Copiez les fichiers du projet dans le conteneur
COPY . /app

# Installez les dépendances du projet

# Exposez le port sur lequel l'application Ruby s'exécutera
EXPOSE 3000

# Commande par défaut pour démarrer votre application Ruby
# CMD ["rails", "server", "-b", "0.0.0.0"]

CMD ["sh", "-c", "bundle install && rails server -b 0.0.0.0"]
