Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0035D75342F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 09:52:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=anxAp1fd;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xpPIOncR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2NxZ6P3Fz3cFL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 17:52:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=anxAp1fd;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xpPIOncR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2Nwd6z3Pz30MY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 17:52:01 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D419022138;
	Fri, 14 Jul 2023 07:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1689321117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CXr4BB0oj6JKkl5nx+4UTwhEgFQBdrO4bA0J1U4BuDM=;
	b=anxAp1fdL5Ny+EW8lqrFCnyB199dfmlBinoXpJYcvTt25HK/fDI1j13j//ljCNjxbxWyZl
	AwGy91hhx80vvo7QI5DyuakojmBVl4+D9SnTpDGZwuH/H7P0iendYalH5wCfs/UmZm9WK3
	3JHA6sDKC7MvXXJYzYPGP+UMlYhbF5w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689321117;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CXr4BB0oj6JKkl5nx+4UTwhEgFQBdrO4bA0J1U4BuDM=;
	b=xpPIOncRHeqeYcP8TRD+DSpegzn30nDCF+zM7Khyx/O6KGXC3C7if5wTusK77CnqyPBPyS
	7N3yiw1Kexutn7BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7DB9513A15;
	Fri, 14 Jul 2023 07:51:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2IPCHZ3+sGQCQwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Fri, 14 Jul 2023 07:51:57 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH v3 02/18] fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
Date: Fri, 14 Jul 2023 09:49:28 +0200
Message-ID: <20230714075155.5686-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714075155.5686-1-tzimmermann@suse.de>
References: <20230714075155.5686-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org, dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org, linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The flag FBINFO_DEFAULT is 0 and has no effect, as struct fbinfo.flags
has been allocated to zero by a static declaration. So do not set it.

Flags should signal differences from the default values. After cleaning
up all occurrences of FBINFO_DEFAULT, the token will be removed.

v2:
	* fix commit message (Miguel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/68328fb.c  | 2 +-
 drivers/video/fbdev/acornfb.c  | 2 +-
 drivers/video/fbdev/g364fb.c   | 2 +-
 drivers/video/fbdev/hpfb.c     | 1 -
 drivers/video/fbdev/macfb.c    | 1 -
 drivers/video/fbdev/maxinefb.c | 1 -
 6 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/68328fb.c b/drivers/video/fbdev/68328fb.c
index 07d6e8dc686b..956dd2399cc0 100644
--- a/drivers/video/fbdev/68328fb.c
+++ b/drivers/video/fbdev/68328fb.c
@@ -448,7 +448,7 @@ static int __init mc68x328fb_init(void)
 		fb_info.var.red.offset = fb_info.var.green.offset = fb_info.var.blue.offset = 0;
 	}
 	fb_info.pseudo_palette = &mc68x328fb_pseudo_palette;
-	fb_info.flags = FBINFO_DEFAULT | FBINFO_HWACCEL_YPAN;
+	fb_info.flags = FBINFO_HWACCEL_YPAN;
 
 	if (fb_alloc_cmap(&fb_info.cmap, 256, 0))
 		return -ENOMEM;
diff --git a/drivers/video/fbdev/acornfb.c b/drivers/video/fbdev/acornfb.c
index 1b72edc01cfb..8fec21dfca09 100644
--- a/drivers/video/fbdev/acornfb.c
+++ b/drivers/video/fbdev/acornfb.c
@@ -694,7 +694,7 @@ static void acornfb_init_fbinfo(void)
 	first = 0;
 
 	fb_info.fbops		= &acornfb_ops;
-	fb_info.flags		= FBINFO_DEFAULT | FBINFO_HWACCEL_YPAN;
+	fb_info.flags		= FBINFO_HWACCEL_YPAN;
 	fb_info.pseudo_palette	= current_par.pseudo_palette;
 
 	strcpy(fb_info.fix.id, "Acorn");
diff --git a/drivers/video/fbdev/g364fb.c b/drivers/video/fbdev/g364fb.c
index c5b7673ddc6c..0825cbde116e 100644
--- a/drivers/video/fbdev/g364fb.c
+++ b/drivers/video/fbdev/g364fb.c
@@ -219,7 +219,7 @@ int __init g364fb_init(void)
 	fb_info.screen_base = (char *) G364_MEM_BASE;	/* virtual kernel address */
 	fb_info.var = fb_var;
 	fb_info.fix = fb_fix;
-	fb_info.flags = FBINFO_DEFAULT | FBINFO_HWACCEL_YPAN;
+	fb_info.flags = FBINFO_HWACCEL_YPAN;
 
 	fb_alloc_cmap(&fb_info.cmap, 255, 0);
 
diff --git a/drivers/video/fbdev/hpfb.c b/drivers/video/fbdev/hpfb.c
index 77fbff47b1a8..406c1383cbda 100644
--- a/drivers/video/fbdev/hpfb.c
+++ b/drivers/video/fbdev/hpfb.c
@@ -287,7 +287,6 @@ static int hpfb_init_one(unsigned long phys_base, unsigned long virt_base)
 	else
 		strcat(fb_info.fix.id, "Catseye");
 	fb_info.fbops = &hpfb_ops;
-	fb_info.flags = FBINFO_DEFAULT;
 	fb_info.var   = hpfb_defined;
 	fb_info.screen_base = (char *)fb_start;
 
diff --git a/drivers/video/fbdev/macfb.c b/drivers/video/fbdev/macfb.c
index 44ff860a3f37..5ca208d992cc 100644
--- a/drivers/video/fbdev/macfb.c
+++ b/drivers/video/fbdev/macfb.c
@@ -876,7 +876,6 @@ static int __init macfb_init(void)
 	fb_info.var		= macfb_defined;
 	fb_info.fix		= macfb_fix;
 	fb_info.pseudo_palette	= pseudo_palette;
-	fb_info.flags		= FBINFO_DEFAULT;
 
 	err = fb_alloc_cmap(&fb_info.cmap, video_cmap_len, 0);
 	if (err)
diff --git a/drivers/video/fbdev/maxinefb.c b/drivers/video/fbdev/maxinefb.c
index 4e6b05232ae2..0ac1873b2acb 100644
--- a/drivers/video/fbdev/maxinefb.c
+++ b/drivers/video/fbdev/maxinefb.c
@@ -155,7 +155,6 @@ int __init maxinefb_init(void)
 	fb_info.screen_base = (char *)maxinefb_fix.smem_start;
 	fb_info.var = maxinefb_defined;
 	fb_info.fix = maxinefb_fix;
-	fb_info.flags = FBINFO_DEFAULT;
 
 	fb_alloc_cmap(&fb_info.cmap, 256, 0);
 
-- 
2.41.0

