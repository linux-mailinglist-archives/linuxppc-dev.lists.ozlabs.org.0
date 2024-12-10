Return-Path: <linuxppc-dev+bounces-3911-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 809AD9EB365
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 15:33:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y71Rg5rXNz2ytp;
	Wed, 11 Dec 2024 01:33:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733841183;
	cv=none; b=RvUhutK2cY+tDSdMjp3uQOn+8LTa9bKHyU7j0WE9lWu6CunvZFR45PjkXlvhEh1xSYpSQo7MtsL0xhWvc3haRXdEYvtnt4zYOIYhk8+ZKT9wf4B6yatpSg/03dl70lRdUI4FOEfEE/eLK8kzN3xdkd6UMG7yD29wIx3+7mMArjNccnNxvVlL13h2N3Xbt6xzoV5qnQgi5C7DSJqZw8n76Jm45OhfE0zXz2FlAZ2w1nT1DDgKbRRQhBU+7wvM2n7aS5WuMlRWysvms7ls51NrAW/j44yIzeNIJDzeqj6OuKjCI+kUhXGYUh4w48NpQ8SDpLSFU9lxsUMDyVAt/8LUzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733841183; c=relaxed/relaxed;
	bh=HOfG7Gw/bCptWLlIWvRh2S9GG0Yyaxi6VYuw6+qdsZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nofWXsf7Aczopdjg1sqMOr3YyXxvLFfkUdabuRHPbaPsq+1vfh9v/5MMruIHDqXU8MyMAfecP27QzNaVSOMKTMCOQbd7VM2howMBrSOmrYjj8H8u/l5Yv+r7tSDsieH/5hqdVe06HKiMwFWXd3+LfXBrX+IrdiFCpElkJ2Ro9z+ZU0jNCJXIL7JCXEjdidelnlViDrQvcGRhOw5N946BXiU8tuMCFt0h0Sf92YIGZyzwdPBIZUHz0fWTTY5KYsKrgH9O4V7jVHK9+01FFpUNJCZqMjQ6sAUmgIkow8hJ/7A0FhH2siAGcxTg0QuX0fdEaH3JI/XUCm2U1hyq9dnapQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GCBZ8MYa; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=j03dPbEh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=OnOtlPal; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WWa2EuLZ; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GCBZ8MYa;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=j03dPbEh;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=OnOtlPal;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WWa2EuLZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 560 seconds by postgrey-1.37 at boromir; Wed, 11 Dec 2024 01:33:02 AEDT
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y71Rf2KYbz2ysX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 01:33:02 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 00E291F441;
	Tue, 10 Dec 2024 14:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733840616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HOfG7Gw/bCptWLlIWvRh2S9GG0Yyaxi6VYuw6+qdsZg=;
	b=GCBZ8MYa5ZgjJ0xhl5sKuL9MuD8VC5yF1HQlmsPjKSYPP1g42dGaX0lzcFACT0ddtFC1Zy
	gXmRbEo2zGIOj9z1pEqyxQA+bhc3oWs0RmDM7oDWVswler8B0CYdcR2JzZh61+/PQULIPM
	DNE3zAghKi41uS13xKW/KdFr85mFRn8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733840616;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HOfG7Gw/bCptWLlIWvRh2S9GG0Yyaxi6VYuw6+qdsZg=;
	b=j03dPbEhFD/AMuSmZfXYJOFn61e9Zzxrj6/l9D79yXDzOGQKDlrwn61nK4DXZtUoMaE1Ty
	IrW9LLzdGrOU1VCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OnOtlPal;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WWa2EuLZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733840615; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HOfG7Gw/bCptWLlIWvRh2S9GG0Yyaxi6VYuw6+qdsZg=;
	b=OnOtlPalTphqc9d7qaKl8/LpJ620C3/rg1a5mn8JeamL/7WSlBiedJMUdwHCZKE/fHyTCk
	UtoI/fDNYjun9pzZf6QRVlglII5mVgUhY0KqBhZVRFPaJP8PaAIsu4LRI7g57doktSvAaL
	kaeEEBnZRdwT25cBOBwyptvMtsYGzCU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733840615;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HOfG7Gw/bCptWLlIWvRh2S9GG0Yyaxi6VYuw6+qdsZg=;
	b=WWa2EuLZNR4Z2FCdYS1TV9fpEN23yVNYtIPhGO1u/vT8Ed2SQEjsf6kpNToCchUswr/DCf
	s4E7lSfOu3xT5vCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE14013A15;
	Tue, 10 Dec 2024 14:23:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2Fg3KeZOWGfREwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Dec 2024 14:23:34 +0000
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
Subject: [PATCH 0/3] drm,fbdev: Fix module dependencies
Date: Tue, 10 Dec 2024 15:09:53 +0100
Message-ID: <20241210142329.660801-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
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
X-Rspamd-Queue-Id: 00E291F441
X-Spam-Score: -3.01
X-Rspamd-Action: no action
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
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,patchwork.freedesktop.org:url];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Fix the dependencies among the various graphics modules.

Before addressing the FB_CORE issue, patch 1 first resolves a problem
with BACKLIGHT_CLASS_DEVICE. A number of fbdev drivers select it, which
results in a recursive-dependency error after patch has been applied.
Making these drivers (or parts of them) depend on BACKLIGHT_CLASS_DEVICE
fixes this.

Patch 2 selects FB_CORE for DRM_GEM_DMA_HELPER and DRM_TTM_HELPER.
This is necessary with the recently added DRM client library.

Patch 3 is the second half of the patch provided by Arnd at [1]. It
could not yet be merged because of the issues fixed by patch 1.

Side note: For the majority of graphics drivers, backlight functionality
depends on BACKLIGHT_CLASS_DEVICE. In a few cases drivers select the
Kconfig token automatically. These drivers should be updated to depends
on the token as well, such that backlight functionality is fully user-
controlled.

[1] https://patchwork.freedesktop.org/series/141411/

Arnd Bergmann (1):
  drm: rework FB_CORE dependency

Thomas Zimmermann (2):
  fbdev: Fix recursive dependencies wrt BACKLIGHT_CLASS_DEVICE
  drm/fbdev: Select FB_CORE dependency for fbdev on DMA and TTM

 drivers/auxdisplay/Kconfig       |  2 +-
 drivers/gpu/drm/Kconfig          |  3 +++
 drivers/macintosh/Kconfig        |  1 +
 drivers/staging/fbtft/Kconfig    |  1 +
 drivers/video/fbdev/Kconfig      | 18 +++++++++++++-----
 drivers/video/fbdev/core/Kconfig |  3 +--
 6 files changed, 20 insertions(+), 8 deletions(-)

-- 
2.47.1


