Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA84753463
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 09:55:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FiCxuuRg;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+Lj70mtC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2P0T3hJwz30PY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 17:55:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FiCxuuRg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+Lj70mtC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2Nwd2dgLz301r
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 17:52:01 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 77648220D0;
	Fri, 14 Jul 2023 07:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1689321117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sWCVV7wJiemOx2M9P2wz1m/QXnYnbGSsQYJ48wiDA5o=;
	b=FiCxuuRgjeBg/xoExLC9yTE5L7LaBt5SUYCMx34HW12T0/lrXS3LS4llyhoAm+F7pEMHjS
	PxTLSdY1od69+BJwO8AEtsZJXtoViPo5XWy1ALC6q6CUO0sT0lAwNlWnCGZV2zJPMQ6SnE
	M563f0p47fey33bA7ioXZDxkJVDYx0o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689321117;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sWCVV7wJiemOx2M9P2wz1m/QXnYnbGSsQYJ48wiDA5o=;
	b=+Lj70mtCwrt+Zf6K3n0Z5ytQjf8UZK7ETR4Sxgd90QQP8Xm/6hpxMXqHTmzg9On/LFh1x4
	aRwqDVLFm20VmvCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 152FA13A92;
	Fri, 14 Jul 2023 07:51:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id UM9jBJ3+sGQCQwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Fri, 14 Jul 2023 07:51:57 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH v3 01/18] drm: Remove flag FBINFO_DEFAULT from fbdev emulation
Date: Fri, 14 Jul 2023 09:49:27 +0200
Message-ID: <20230714075155.5686-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714075155.5686-1-tzimmermann@suse.de>
References: <20230714075155.5686-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, linux-fbdev@vger.kernel.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org, dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>, linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The flag FBINFO_DEFAULT is 0 and has no effect, as struct fbinfo.flags
has been allocated to zero by framebuffer_alloc(). So do not set it.

Flags should signal differences from the default values. After cleaning
up all occurrences of FBINFO_DEFAULT, the token will be removed.

v2:
	* fix commit message (Miguel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
---
 drivers/gpu/drm/drm_fbdev_dma.c       | 1 -
 drivers/gpu/drm/drm_fbdev_generic.c   | 1 -
 drivers/gpu/drm/gma500/fbdev.c        | 2 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c | 2 +-
 4 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index f9b1f7cd31b7..ee7c265b0585 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -123,7 +123,6 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
 	drm_fb_helper_fill_info(info, fb_helper, sizes);
 
 	info->fbops = &drm_fbdev_dma_fb_ops;
-	info->flags = FBINFO_DEFAULT;
 
 	/* screen */
 	info->flags |= FBINFO_VIRTFB; /* system memory */
diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index b9343fb6cf13..a0ea042b1526 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -109,7 +109,6 @@ static int drm_fbdev_generic_helper_fb_probe(struct drm_fb_helper *fb_helper,
 	drm_fb_helper_fill_info(info, fb_helper, sizes);
 
 	info->fbops = &drm_fbdev_generic_fb_ops;
-	info->flags = FBINFO_DEFAULT;
 
 	/* screen */
 	info->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index 054426549fc6..be8f5fbd5260 100644
--- a/drivers/gpu/drm/gma500/fbdev.c
+++ b/drivers/gpu/drm/gma500/fbdev.c
@@ -215,7 +215,7 @@ static int psb_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
 	}
 
 	info->fbops = &psb_fbdev_fb_ops;
-	info->flags = FBINFO_DEFAULT;
+
 	/* Accessed stolen memory directly */
 	info->screen_base = dev_priv->vram_addr + backing->offset;
 	info->screen_size = size;
diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
index f941e2e7cae6..68c06ac9acce 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -253,7 +253,7 @@ static int radeon_fbdev_fb_helper_fb_probe(struct drm_fb_helper *fb_helper,
 	}
 
 	info->fbops = &radeon_fbdev_fb_ops;
-	info->flags = FBINFO_DEFAULT;
+
 	/* radeon resume is fragile and needs a vt switch to help it along */
 	info->skip_vt_switch = false;
 
-- 
2.41.0

