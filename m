Return-Path: <linuxppc-dev+bounces-1504-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0F697DAD2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2024 01:43:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X9TV40ncwz2yNB;
	Sat, 21 Sep 2024 09:43:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726847687;
	cv=none; b=c1eRO3PBDrYS3o/aVKpFSvc07Pq96Hmnkmeui6L3bTZihv+2tmiaQuFgKc3KRm4/x7sJ5EoBv5BB1QoXe4kRFIRCCdOr9jya2mkLdRpM+aX1eJMpGYLlzGmK3SLdS7GDBIxnoBkJ3EzGKyO6bJVLyfYC9M7ilVgRzZOppSBfcdppzAUF6SdZQBBPSpdt8Zrf9c/radfkHTy44Y0vhSvq0rk/to2J6ZWFV6/pQxLUmb1yw0hh7P+qzXnXs7tuwUhS1TliX1NF/OcTW9G5BDchHGBmGMTobUPmAlANMm7styRp/Y6tUNOsROUTRCFuYLXGw35/+cQS8oIYpSsFMDM3CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726847687; c=relaxed/relaxed;
	bh=rCD/QsG0Xo4UKv1MPeE4+wDq+pLvtC4iH5hpxA1/l3M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VrdZ0PFPGIkt9O92aYBaKiU4hiHtgIy1WMjZZNi0WTgHhtQtIDWlKsS44s01MKT7eWT+1MVlYkaVouhBsRb7kXCWdUF8hWm5ndhQW/eh2RmXfx0LIzw31za80HS8K4C9VSFf128jKs9hoMNp5MFROYvwoKZ6PmCB3finTDHUpT59q2QgizoGrCkPEsVrtaMtEr4DZ+hdckXv19spsu2VGvrM7gizkpAn7qO6o0NIVyjWUzByVNkL29CyKQYPql3/Q8DFmpXOLWddMQo0QSXA4N+yCFkkF+ZbnMorro1nF1oWyBjX4OjrzgwKWxmYXTElHVNKIhxlPs7mWyZojI8WiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 588 seconds by postgrey-1.37 at boromir; Sat, 21 Sep 2024 01:54:47 AEST
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X9H5M1hMMz2yMX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2024 01:54:46 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7A2801F7F1;
	Fri, 20 Sep 2024 15:44:53 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1FBC413AE1;
	Fri, 20 Sep 2024 15:44:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id izqLBnWY7WZuYwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Sep 2024 15:44:53 +0000
Date: Fri, 20 Sep 2024 17:45:44 +0200
Message-ID: <87ed5enxav.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	linuxppc-dev@lists.ozlabs.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ALSA: Drop explicit initialization of struct i2c_device_id::driver_data to 0
In-Reply-To: <20240920151009.499188-2-u.kleine-koenig@baylibre.com>
References: <20240920151009.499188-2-u.kleine-koenig@baylibre.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 7A2801F7F1
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Fri, 20 Sep 2024 17:10:08 +0200,
Uwe Kleine-König wrote:
> 
> These drivers don't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
> 
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Thanks, applied.


Takashi

