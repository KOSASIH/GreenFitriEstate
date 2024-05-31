module ApplicationHelper
  # Returns the full title on the page.
  def full_title(page_title)
    base_title = "Your App Name"
    page_title.empty? ? base_title : "#{base_title} | #{page_title}"
  end

  # Returns a formatted date string.
  def format_date(date)
    date.strftime("%B %d, %Y")
  end

  # Returns a formatted price string.
  def format_price(price)
    number_to_currency(price, unit: "$")
  end

  # Returns a formatted phone number string.
  def format_phone(phone)
    phone.gsub(/[^0-9]/, "").insert(3, "-").insert(7, "-")
  end

  # Returns a link to the user's profile picture.
  def user_avatar(user)
    image_tag user.avatar.url, class: "rounded-circle", width: "100", height: "100"
  end

  # Returns a link to the user's profile page.
  def user_profile_link(user)
    link_to user.name, user_path(user), class: "text-decoration-none"
  end

  # Returns a link to the user's edit page.
  def user_edit_link(user)
    link_to "Edit Profile", edit_user_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's activity feed.
  def user_activity_link(user)
    link_to "Activity Feed", user_activity_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's messages.
  def user_messages_link(user)
    link_to "Messages", user_messages_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's settings.
  def user_settings_link(user)
    link_to "Settings", user_settings_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's notifications.
  def user_notifications_link(user)
    link_to "Notifications", user_notifications_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's followers.
  def user_followers_link(user)
    link_to "Followers", user_followers_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's following.
  def user_following_link(user)
    link_to "Following", user_following_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's favorites.
  def user_favorites_link(user)
    link_to "Favorites", user_favorites_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's reviews.
  def user_reviews_link(user)
    link_to "Reviews", user_reviews_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's bookmarks.
  def user_bookmarks_link(user)
    link_to "Bookmarks", user_bookmarks_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's badges.
  def user_badges_link(user)
    link_to "Badges", user_badges_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's points.
  def user_points_link(user)
    link_to "Points", user_points_path(user), class: "btn btn-primary btn-sm"
 end

  # Returns a link to the user's leaderboard.
  def user_leaderboard_link(user)
    link_to "Leaderboard", user_leaderboard_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's achievements.
  def user_achievements_link(user)
    link_to "Achievements", user_achievements_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's friends.
  def user_friends_link(user)
    link_to "Friends", user_friends_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's groups.
  def user_groups_link(user)
    link_to "Groups", user_groups_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's events.
  def user_events_link(user)
    link_to "Events", user_events_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's photos.
  def user_photos_link(user)
    link_to "Photos", user_photos_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's videos.
  def user_videos_link(user)
    link_to "Videos", user_videos_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's music.
  def user_music_link(user)
    link_to "Music", user_music_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's documents.
  def user_documents_link(user)
    link_to "Documents", user_documents_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's notes.
  def user_notes_link(user)
    link_to "Notes", user_notes_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's tasks.
  def user_tasks_link(user)
    link_to "Tasks", user_tasks_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's projects.
  def user_projects_link(user)
    link_to "Projects", user_projects_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's goals.
  def user_goals_link(user)
    link_to "Goals", user_goals_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's habits.
  def user_habits_link(user)
    link_to "Habits", user_habits_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's reminders.
  def user_reminders_link(user)
    link_to "Reminders", user_reminders_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's calendar.
  def user_calendar_link(user)
    link_to "Calendar", user_calendar_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's to-do list.
  def user_todo_list_link(user)
    link_to "To-Do List", user_todo_list_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's wishlist.
  def user_wishlist_link(user)
    link_to "Wishlist", user_wishlist_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's shopping cart.
  def user_shopping_cart_link(user)
    link_to "Shopping Cart", user_shopping_cart_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's orders.
  def user_orders_link(user)
    link_to "Orders", user_orders_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's payments.
  def user_payments_link(user)
    link_to "Payments", user_payments_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's subscriptions.
  def user_subscriptions_link(user)
    link_to "Subscriptions", user_subscriptions_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's donations.
  def user_donations_link(user)
    link_to "Donations", user_donations_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's tips.
  def user_tips_link(user)
    link_to "Tips", user_tips_path(user), class: "btn btn-primary btn-sm"
end

  # Returns a link to the user's reviews.
  def user_reviews_link(user)
    link_to "Reviews", user_reviews_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's ratings.
  def user_ratings_link(user)
    link_to "Ratings", user_ratings_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's testimonials.
  def user_testimonials_link(user)
    link_to "Testimonials", user_testimonials_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's endorsements.
  def user_endorsements_link(user)
    link_to "Endorsements", user_endorsements_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's referrals.
  def user_referrals_link(user)
    link_to "Referrals", user_referrals_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's invoices.
  def user_invoices_link(user)
    link_to "Invoices", user_invoices_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's quotes.
  def user_quotes_link(user)
    link_to "Quotes", user_quotes_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's estimates.
  def user_estimates_link(user)
    link_to "Estimates", user_estimates_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's proposals.
  def user_proposals_link(user)
    link_to "Proposals", user_proposals_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's contracts.
  def user_contracts_link(user)
    link_to "Contracts", user_contracts_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's agreements.
  def user_agreements_link(user)
    link_to "Agreements", user_agreements_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's policies.
  def user_policies_link(user)
    link_to "Policies", user_policies_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's terms.
  def user_terms_link(user)
    link_to "Terms", user_terms_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's conditions.
  def user_conditions_link(user)
    link_to "Conditions", user_conditions_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's faqs.
  def user_faqs_link(user)
    link_to "FAQs", user_faqs_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's help.
  def user_help_link(user)
    link_to "Help", user_help_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's support.
  def user_support_link(user)
    link_to "Support", user_support_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the  end

  # Returns a link to the user's news feed.
  def user_news_feed_link(user)
    link_to "News Feed", user_news_feed_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's timeline.
  def user_timeline_link(user)
    link_to "Timeline", user_timeline_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's forum.
  def user_forum_link(user)
    link_to "Forum", user_forum_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's wiki.
  def user_wiki_link(user)
    link_to "Wiki", user_wiki_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's podcast.
  def user_podcast_link(user)
    link_to "Podcast", user_podcast_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's videos.
  def user_videos_link(user)
    link_to "Videos", user_videos_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's gallery.
  def user_gallery_link(user)
    link_to "Gallery", user_gallery_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's photos.
  def user_photos_link(user)
    link_to "Photos", user_photos_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's maps.
  def user_maps_link(user)
    link_to "Maps", user_maps_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's log.
  def user_log_link(user)
    link_to "Log", user_log_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's log in/log out button.
  def user_login_link(user)
    if user_signed_in?
      link_to "Log Out", destroy_user_session_path, method: :delete, class: "btn btn-primary btn-sm"
    else
      link_to "Log In", new_user_session_path, class: "btn btn-primary btn-sm"
    end
  end

  # Returns a link to the user's settings.
  def user_settings_link(user)
    link_to "Settings", user_settings_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's preferences.
  def user_preferences_link(user)
    link_to "Preferences", user_preferences_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's subscribers.
  def user_subscribers_link(user)
    link_to "Subscribers", user_subscribers_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's statistics.
  def user_statistics_link(user)
    link_to "Statistics", user_statistics_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's roles.
  def user_roles_link(user)
    link_to "Roles", user_roles_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's activities.
  def user_activities_link(user)
    link_to "Activities", user_activities_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's mentions.
  def user_mentions_link(user)
    link_to "Mentions", user_mentions_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's friendships.
  def user_friendships_link(user)
    link_to "Friendships", user_friendships_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's following.
  def user_following_link(user)
    link_to "Following", user_following_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's followers.
  def user_followers_link(user)
    link_to "Followers", user_followers_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's blocking.
  def user_blocking_link(user)
    link_to "Blocking", user_blocking_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's blocked users.
  def user_blocked_users_link(user)
    link_to "Blocked Users", user_blocked_users_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's blockers.
  def user_blockers_link(user)
    link_to "Blockers", user_blockers_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's reported users.
  def user_reported_users_link(user)
    link_to "Reported Users", user_reported_users_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's reports.
  def user_reports_link(user)
    link_to "Reports", user_reports_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's post categories.
  def user_post_categories_link(user)
    link_to "Post Categories", user_post_categories_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's subscriptions.
  def user_subscriptions_link(user)
    link_to "Subscriptions", user_subscriptions_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's events.
  def user_events_link(user)
    link_to "Events", user_events_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's locations.
  def user_locations_link(user)
    link_to "Locations", user_locations_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's friend requests.
  def user_friend_requests_link(user)
    link_to "Friend Requests", user_friend_requests_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's roles.
  def user_role_requests_link(user)
    link_to "Role Requests", user_role_requests_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's groups.
  def user_groups_link(user)
    link_to "Groups", user_groups_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's memberships.
  def user_memberships_link(user)
    link_to "Memberships", user_memberships_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's affiliations.
  def user_affiliations_link(user)
    link_to "Affiliations", user_affiliations_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's associations.
  def user_associations_link(user)
    link_to "Associations", user_associations_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's connections.
  def user_connections_link(user)
    link_to "Connections", user_connections_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's relationships.
  def user_relationships_link(user)
    link_to "Relationships", user_relationships_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's interactions.
  def user_interactions_link(user)
    link_to "Interactions", user_interactions_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's engagements.
  def user_engagements_link(user)
    link_to "Engagements", user_engagements_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's impressions.
  def user_impressions_link(user)
    link_to "Impressions", user_impressions_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's clicks.
  def user_clicks_link(user)
    link_to "Clicks", user_clicks_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's conversions.
  def user_conversions_link(user)
    link_to "Conversions", user_conversions_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's transactions.
  def user_transactions_link(user)
    link_to "Transactions", user_transactions_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's orders.
  def user_orders_link(user)
    link_to "Orders", user_orders_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's invoices.
  def user_invoices_link(user)
    link_to "Invoices", user_invoices_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's payments.
  def user_payments_link(user)
    link_to "Payments", user_payments_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's subscriptions.
  def user_subscriptions_link(user)
    link_to "Subscriptions", user_subscriptions_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's donations.
  def user_donations_link(user)
    link_to "Donations", user_donations_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's tips.
  def user_tips_link(user)
    link_to "Tips", user_tips_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's reviews.
  def user_reviews_link(user)
    link_to "Reviews", user_reviews_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's ratings.
  def user_ratings_link(user)
    link_to "Ratings", user_ratings_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's testimonials.
  def user_testimonials_link(user)
    link_to "Testimonials", user_testimonials_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's endorsements.
  def user_endorsements_link(user)
    link_to "Endorsements", user_endorsements_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's referrals.
  def user_referrals_link(user)
    link_to "Referrals", user_referrals_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's invoices.
  def user_invoices_link(user)
    link_to "Invoices", user_invoices_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's quotes.
  def user_quotes_link(user)
    link_to "Quotes", user_quotes_path(user), class: "btn btn-primary btn-sm"
  end

  # Returns a link to the user's estimates.
  def user_estimates_link(user
