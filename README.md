# Rails-Avanzado

En un inicio la aplicacion no corre por que debemos crear la tabla moviegoer. Para hacer esto ejecutamos el siguiente comando

```Shell
rails generate model Moviegoer name:string provider:string uid:string
```

Una vez hecho esto ejecutamos `rake db:migrate` para correr nuestra migracion y tener la tabla creada correctamente.

***
- Explica el código siguiente:
```Ruby
class MoviesController < ApplicationController
  # 'index' and 'show' methods from Section 4.4 omitted for clarity
  def new
    @movie = Movie.new
  end 
  def create
    if (@movie = Movie.create(movie_params))
      redirect_to movies_path, :notice => "#{@movie.title} created."
    else
      flash[:alert] = "Movie #{@movie.title} could not be created: " +
        @movie.errors.full_messages.join(",")
      render 'new'
    end
  end
  def edit
    @movie = Movie.find params[:id]
  end
  def update
    @movie = Movie.find params[:id]
    if (@movie.update_attributes(movie_params))
      redirect_to movie_path(@movie), :notice => "#{@movie.title} updated."
    else
      flash[:alert] = "#{@movie.title} could not be updated: " +
        @movie.errors.full_messages.join(",")
      render 'edit'
    end
  end
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path, :notice => "#{@movie.title} deleted."
  end
  private
  def movie_params
    params.require(:movie)
    params[:movie].permit(:title,:rating,:release_date)
  end
end
```


- ¿Qué sucede si un atacante malintencionado crea un envío de formulario que intenta modificar `params[:moviegoer][:uid]` o `params[:moviegoer][:provider]` (campos que solo deben modificarse mediante la lógica de autenticación) publicando campos de formulario ocultos denominados `params[moviegoer][uid]` y así sucesivamente?.
    

***
