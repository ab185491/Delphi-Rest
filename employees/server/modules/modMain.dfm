object WebModule1: TWebModule1
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule1DefaultHandlerAction
    end
    item
      Name = 'WebActionItem1'
      PathInfo = '/home'
      OnAction = WebModule1WebActionItem1Action
    end
    item
      Name = 'TestConnection'
      PathInfo = '/api/TestConnection'
      OnAction = WebModule1TestConnectionAction
    end
    item
      MethodType = mtGet
      Name = 'add'
      PathInfo = '/api/add'
      OnAction = WebModule1addAction
    end
    item
      Name = 'AddJson'
      PathInfo = '/api/AddJson'
      OnAction = WebModule1AddJsonAction
    end>
  Height = 230
  Width = 415
end
