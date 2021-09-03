local name
local player = game.Players.LocalPlayer
-- i do this incase the user is using auto launch + auto exec,
-- using this combination normally will break the script due to
-- it being executed before player is defined.
while not player do
	player = game.Players.LocalPlayer;
	wait(1)
end

function DoIt()
	game.StarterGui:SetCore("SendNotification", {
		Title = name;
		Text = "Has followed you into game";
		Duration = 7;
	})
end

game.Players.PlayerAdded:Connect(function(plr)
	print('New player!', plr.FollowUserId, player.UserId)
	if (plr.FollowUserId == player.UserId) then 
		name = plr.Name
		DoIt()
	end
end)

DoIt()
player.CharacterAdded:Connect(DoIt)
