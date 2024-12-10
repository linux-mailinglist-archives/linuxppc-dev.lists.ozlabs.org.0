Return-Path: <linuxppc-dev+bounces-3913-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDA19EB368
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 15:33:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y71Rj64Q9z301Y;
	Wed, 11 Dec 2024 01:33:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733841185;
	cv=none; b=FVkvQj5ShO0hh9veTfhhOyQNuiiaoBAIl2AYdlUlpLJPG4UKNRJ91L5DvfM8rA5PEpQufXU8gx6Z7WsdBDCE1BUej+/ZlNMORDBQ6+lcON1NazrNW2IDpROghAAIcM4EH8x0fMqzC9JgdUY5fYX4AGr8ZBVLFjEZNrrxERX2H975bxYhUZUSAFslW72LEiAzHkTN5Luh1w2CRxrhBU44+gZtLd31oHZ14kSTEiIj1rUOqkTs2XmYz5Ler3rPNPu91gAX/2fTF8l7HYFZCOyU1d6kfcc/aXQ8SJldnunDQHbIUgSrI3/q8tUcuXCs+rpGNcrCm17dFHFpYNCw4fCAKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733841185; c=relaxed/relaxed;
	bh=9oHn4Px8sCE9GuGbm+YClAdpyeEgZgPk1FU7mXaP2Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QNQ32ZJnJbrOndF3QArryGTQKyW1wv18zsk4YnhtYYlwy2/S6PLci1Re6OlMRPgKHJIb9Dzfn1VDy/iqUj4H976UZLmv5VpMFdwW/bHNKN1/Gz4xEAceN3hoB3JpihxbUZ6tgXC2jQQ0aU9JQQik3F6Pq2dFn6EnCKoGTwU87m+owQBgBMEXpK8rz9P8wvsqzxLrYotvXH1VERUKv79qVYnC+9R9R3e97F0ucNhev5mLwivOdRE6r8c6s3qOqvC+fofh6lJwR4cc4FQwPDA+sS8hRIz9/em1YU3kBROtmlzfRfKD6JrkzQzrjEnNtDN5Hv/Kl8KUnt3Fly+gGwyNkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rBXdD+bV; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+dfBV1a3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tXS6FWhf; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CpJJR89O; dkim-atps=neutral; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rBXdD+bV;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+dfBV1a3;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tXS6FWhf;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CpJJR89O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y71Rh40y6z2ysX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 01:33:04 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5088E21125;
	Tue, 10 Dec 2024 14:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733840616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9oHn4Px8sCE9GuGbm+YClAdpyeEgZgPk1FU7mXaP2Fw=;
	b=rBXdD+bVeilSF5QsrEQ7+vzGTOf2YlE2cztJxx+jLJUl1C1ec4vBZURallo2zKE1TXwAFp
	yRcbALNl+eAT88vEW/RRLqO0tTRUaSn9Gelvt/MLM9JlTzixOBDuzTSpdT36rMEZrs18s3
	BAbOPfoDNieBMNKmZf6lruinF5B+v/4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733840616;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9oHn4Px8sCE9GuGbm+YClAdpyeEgZgPk1FU7mXaP2Fw=;
	b=+dfBV1a33TPLCt0IDC0sRGxiqMbTxQUvovRoiqh2/Pim2h9gl0zrKuirwWf2bR9bR8zU+8
	X8S7ZBJaDvZLj7AQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tXS6FWhf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CpJJR89O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733840615; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9oHn4Px8sCE9GuGbm+YClAdpyeEgZgPk1FU7mXaP2Fw=;
	b=tXS6FWhfXNf3BNSzYLO/DJYQ7I/rDm1prgq2nkhWOe7/IDKCwj99qRaNvHsFbWS25Y8onj
	PNvFIqyEbvHZgfpJeSrdQ04g9cNBXKv2rIlEG2ymWFkTkYYgMWabVhQJjWJr1RW/fgSY9W
	SpjT4y5MgxosrD9N1L4ReWBKwImf0Ts=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733840615;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9oHn4Px8sCE9GuGbm+YClAdpyeEgZgPk1FU7mXaP2Fw=;
	b=CpJJR89OnZ5xqskwiCN8EnVBumtl+09ZBRtcBCN2f4ZYoo4fZg2czUqE1ZcRFn1PxEOd04
	W/4VVSMegrlgIxCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0716513A3D;
	Tue, 10 Dec 2024 14:23:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GPZ9AOdOWGfREwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Dec 2024 14:23:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	arnd@arndb.de,
	deller@gmx.de,
	simona@ffwll.ch,
	airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/3] fbdev: Fix recursive dependencies wrt BACKLIGHT_CLASS_DEVICE
Date: Tue, 10 Dec 2024 15:09:54 +0100
Message-ID: <20241210142329.660801-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210142329.660801-1-tzimmermann@suse.de>
References: <20241210142329.660801-1-tzimmermann@suse.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5088E21125
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,arndb.de,gmx.de,ffwll.ch,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RLtfyjk8sg4x43ngtem9djprcp)];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Do not select BACKLIGHT_CLASS_DEVICE from FB_BACKLIGHT. The latter
only controls backlight support within fbdev core code and data
structures.

Make fbdev drivers depend on BACKLIGHT_CLASS_DEVICE and let users
select it explicitly. Fixes warnings about recursive dependencies,
such as

error: recursive dependency detected!
	symbol BACKLIGHT_CLASS_DEVICE is selected by FB_BACKLIGHT
	symbol FB_BACKLIGHT is selected by FB_SH_MOBILE_LCDC
	symbol FB_SH_MOBILE_LCDC depends on FB_DEVICE
	symbol FB_DEVICE depends on FB_CORE
	symbol FB_CORE is selected by DRM_GEM_DMA_HELPER
	symbol DRM_GEM_DMA_HELPER is selected by DRM_PANEL_ILITEK_ILI9341
	symbol DRM_PANEL_ILITEK_ILI9341 depends on BACKLIGHT_CLASS_DEVICE

BACKLIGHT_CLASS_DEVICE is user-selectable, so making drivers adapt to
it is the correct approach in any case. For most drivers, backlight
support is also configurable separately.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/auxdisplay/Kconfig       |  2 +-
 drivers/macintosh/Kconfig        |  1 +
 drivers/staging/fbtft/Kconfig    |  1 +
 drivers/video/fbdev/Kconfig      | 18 +++++++++++++-----
 drivers/video/fbdev/core/Kconfig |  3 +--
 5 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
index 21545ffba065..8934e6ad5772 100644
--- a/drivers/auxdisplay/Kconfig
+++ b/drivers/auxdisplay/Kconfig
@@ -489,7 +489,7 @@ config IMG_ASCII_LCD
 
 config HT16K33
 	tristate "Holtek Ht16K33 LED controller with keyscan"
-	depends on FB && I2C && INPUT
+	depends on FB && I2C && INPUT && BACKLIGHT_CLASS_DEVICE
 	select FB_SYSMEM_HELPERS
 	select INPUT_MATRIXKMAP
 	select FB_BACKLIGHT
diff --git a/drivers/macintosh/Kconfig b/drivers/macintosh/Kconfig
index fb38f684444f..bf3824032d61 100644
--- a/drivers/macintosh/Kconfig
+++ b/drivers/macintosh/Kconfig
@@ -120,6 +120,7 @@ config PMAC_MEDIABAY
 config PMAC_BACKLIGHT
 	bool "Backlight control for LCD screens"
 	depends on PPC_PMAC && ADB_PMU && FB = y && (BROKEN || !PPC64)
+	depends on BACKLIGHT_CLASS_DEVICE
 	select FB_BACKLIGHT
 	help
 	  Say Y here to enable Macintosh specific extensions of the generic
diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconfig
index 77ab44362f16..577e91ff7bf6 100644
--- a/drivers/staging/fbtft/Kconfig
+++ b/drivers/staging/fbtft/Kconfig
@@ -3,6 +3,7 @@ menuconfig FB_TFT
 	tristate "Support for small TFT LCD display modules"
 	depends on FB && SPI
 	depends on FB_DEVICE
+	depends on BACKLIGHT_DEVICE_CLASS
 	depends on GPIOLIB || COMPILE_TEST
 	select FB_BACKLIGHT
 	select FB_SYSMEM_HELPERS_DEFERRED
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index de035071fedb..7f2f08748a27 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -649,6 +649,7 @@ config FB_S1D13XXX
 config FB_ATMEL
 	tristate "AT91 LCD Controller support"
 	depends on FB && OF && HAVE_CLK && HAS_IOMEM
+	depends on BACKLIGHT_CLASS_DEVICE
 	depends on HAVE_FB_ATMEL || COMPILE_TEST
 	select FB_BACKLIGHT
 	select FB_IOMEM_HELPERS
@@ -660,7 +661,6 @@ config FB_ATMEL
 config FB_NVIDIA
 	tristate "nVidia Framebuffer Support"
 	depends on FB && PCI
-	select FB_BACKLIGHT if FB_NVIDIA_BACKLIGHT
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
@@ -700,6 +700,8 @@ config FB_NVIDIA_DEBUG
 config FB_NVIDIA_BACKLIGHT
 	bool "Support for backlight control"
 	depends on FB_NVIDIA
+	depends on BACKLIGHT_CLASS_DEVICE
+	select FB_BACKLIGHT
 	default y
 	help
 	  Say Y here if you want to control the backlight of your display.
@@ -707,7 +709,6 @@ config FB_NVIDIA_BACKLIGHT
 config FB_RIVA
 	tristate "nVidia Riva support"
 	depends on FB && PCI
-	select FB_BACKLIGHT if FB_RIVA_BACKLIGHT
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
@@ -747,6 +748,8 @@ config FB_RIVA_DEBUG
 config FB_RIVA_BACKLIGHT
 	bool "Support for backlight control"
 	depends on FB_RIVA
+	depends on BACKLIGHT_CLASS_DEVICE
+	select FB_BACKLIGHT
 	default y
 	help
 	  Say Y here if you want to control the backlight of your display.
@@ -934,7 +937,6 @@ config FB_MATROX_MAVEN
 config FB_RADEON
 	tristate "ATI Radeon display support"
 	depends on FB && PCI
-	select FB_BACKLIGHT if FB_RADEON_BACKLIGHT
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
@@ -960,6 +962,8 @@ config FB_RADEON_I2C
 config FB_RADEON_BACKLIGHT
 	bool "Support for backlight control"
 	depends on FB_RADEON
+	depends on BACKLIGHT_CLASS_DEVICE
+	select FB_BACKLIGHT
 	default y
 	help
 	  Say Y here if you want to control the backlight of your display.
@@ -975,7 +979,6 @@ config FB_RADEON_DEBUG
 config FB_ATY128
 	tristate "ATI Rage128 display support"
 	depends on FB && PCI
-	select FB_BACKLIGHT if FB_ATY128_BACKLIGHT
 	select FB_IOMEM_HELPERS
 	select FB_MACMODES if PPC_PMAC
 	help
@@ -989,6 +992,8 @@ config FB_ATY128
 config FB_ATY128_BACKLIGHT
 	bool "Support for backlight control"
 	depends on FB_ATY128
+	depends on BACKLIGHT_CLASS_DEVICE
+	select FB_BACKLIGHT
 	default y
 	help
 	  Say Y here if you want to control the backlight of your display.
@@ -999,7 +1004,6 @@ config FB_ATY
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-	select FB_BACKLIGHT if FB_ATY_BACKLIGHT
 	select FB_IOMEM_FOPS
 	select FB_MACMODES if PPC
 	select FB_ATY_CT if SPARC64 && PCI
@@ -1040,6 +1044,8 @@ config FB_ATY_GX
 config FB_ATY_BACKLIGHT
 	bool "Support for backlight control"
 	depends on FB_ATY
+	depends on BACKLIGHT_CLASS_DEVICE
+	select FB_BACKLIGHT
 	default y
 	help
 	  Say Y here if you want to control the backlight of your display.
@@ -1528,6 +1534,7 @@ config FB_SH_MOBILE_LCDC
 	depends on FB && HAVE_CLK && HAS_IOMEM
 	depends on SUPERH || COMPILE_TEST
 	depends on FB_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
 	select FB_BACKLIGHT
 	select FB_DEFERRED_IO
 	select FB_DMAMEM_HELPERS
@@ -1793,6 +1800,7 @@ config FB_SSD1307
 	tristate "Solomon SSD1307 framebuffer support"
 	depends on FB && I2C
 	depends on GPIOLIB || COMPILE_TEST
+	depends on BACKLIGHT_CLASS_DEVICE
 	select FB_BACKLIGHT
 	select FB_SYSMEM_HELPERS_DEFERRED
 	help
diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
index 0ab8848ba2f1..d554d8c543d4 100644
--- a/drivers/video/fbdev/core/Kconfig
+++ b/drivers/video/fbdev/core/Kconfig
@@ -183,9 +183,8 @@ config FB_SYSMEM_HELPERS_DEFERRED
 	select FB_SYSMEM_HELPERS
 
 config FB_BACKLIGHT
-	tristate
+	bool
 	depends on FB
-	select BACKLIGHT_CLASS_DEVICE
 
 config FB_MODE_HELPERS
 	bool "Enable Video Mode Handling Helpers"
-- 
2.47.1


