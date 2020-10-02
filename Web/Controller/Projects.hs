module Web.Controller.Projects where

import Web.Controller.Prelude
import Web.View.Projects.Index
import Web.View.Projects.New
import Web.View.Projects.Edit
import Web.View.Projects.Show
import Web.View.Projects.Index
import Web.View.Projects.New
import Web.View.Projects.Show
import Web.View.Projects.Edit

instance Controller ProjectsController where
    action ProjectsAction = do
        projects <- query @Project |> fetch
        render IndexView { .. }

    action NewProjectAction = do
        let project = newRecord
        render NewView { .. }

    action ShowProjectAction { projectId } = do
        project <- fetch projectId
        render ShowView { .. }

    action EditProjectAction { projectId } = do
        project <- fetch projectId
        render EditView { .. }

    action UpdateProjectAction { projectId } = do
        project <- fetch projectId
        project
            |> buildProject
            |> ifValid \case
                Left project -> render EditView { .. }
                Right project -> do
                    project <- project |> updateRecord
                    setSuccessMessage "Project updated"
                    redirectTo EditProjectAction { .. }

    action CreateProjectAction = do
        let project = newRecord @Project
        project
            |> buildProject
            |> ifValid \case
                Left project -> render NewView { .. } 
                Right project -> do
                    project <- project |> createRecord
                    setSuccessMessage "Project created"
                    redirectTo ProjectsAction

    action DeleteProjectAction { projectId } = do
        project <- fetch projectId
        deleteRecord project
        setSuccessMessage "Project deleted"
        redirectTo ProjectsAction

buildProject project = project
<<<<<<< HEAD
    |> fill @'[]
=======
    |> fill @'["title"]
>>>>>>> e85f1aa3eb2488addc3c47d3f51d34cb531020cd
