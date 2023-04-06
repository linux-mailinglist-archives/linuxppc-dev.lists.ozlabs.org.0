Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1465B6D9A93
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 16:38:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PskdN6qzRz3fx2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 00:38:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wEfv7+1J;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=aFAjkf9l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wEfv7+1J;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=aFAjkf9l;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PskS458ZHz3fRl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Apr 2023 00:30:28 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CCC921FE5D;
	Thu,  6 Apr 2023 14:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680791425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YNg0lz+7KBHL0Jy2/T4bI8sg52Xj/iVvmLTbUyEhSFc=;
	b=wEfv7+1J4otnnvmRowr+pIln77ZzKGlBi4G5b99ro7yE1gWM/bkgFTgw3pjXDIWkUNwptv
	WR+4YQAFQDK4ar5r2ID+UPl0HDOffFm60cxKOQR5HCkQ5a3lFtDN4GtbTuiqQwsLaOHQmJ
	eRycN/ZncNM0UWKQ7+5Raz4y7MxkR2g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680791425;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YNg0lz+7KBHL0Jy2/T4bI8sg52Xj/iVvmLTbUyEhSFc=;
	b=aFAjkf9lsH0s8dpfHjahQXAnrCLBp+AjlMGYhJLwZgQ5a2x6sPnXRu3DfBaTgdkGtXUvZR
	DOloP3kVgDdZq5Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7899613A1D;
	Thu,  6 Apr 2023 14:30:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iG+WHIHXLmS4LgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 06 Apr 2023 14:30:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	daniel.vetter@ffwll.ch,
	deller@gmx.de,
	javierm@redhat.com,
	gregkh@linuxfoundation.org
Subject: [PATCH v2 11/19] video: Move HP PARISC STI core code to shared location
Date: Thu,  6 Apr 2023 16:30:11 +0200
Message-Id: <20230406143019.6709-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406143019.6709-1-tzimmermann@suse.de>
References: <20230406143019.6709-1-tzimmermann@suse.de>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

STI core files have been located in console and fbdev code. Move
the source code and header to the directories for video helpers.
Also update the config and build rules such that the code depends
on the config symbol CONFIG_STI_CORE, which STI console and STI
framebuffer select automatically.

Cleans up the console makefile and prepares PARISC to implement
fb_is_primary_device() within the arch/ directory. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/Kconfig                            | 7 +++++++
 drivers/video/Makefile                           | 1 +
 drivers/video/console/Kconfig                    | 1 +
 drivers/video/console/Makefile                   | 4 +---
 drivers/video/console/sticon.c                   | 2 +-
 drivers/video/fbdev/Kconfig                      | 3 +--
 drivers/video/fbdev/stifb.c                      | 2 +-
 drivers/video/{console => }/sticore.c            | 2 +-
 {drivers/video/fbdev => include/video}/sticore.h | 0
 9 files changed, 14 insertions(+), 8 deletions(-)
 rename drivers/video/{console => }/sticore.c (99%)
 rename {drivers/video/fbdev => include/video}/sticore.h (100%)

diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index bf05363d8906..8b2b9ac37c3d 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -11,6 +11,13 @@ config APERTURE_HELPERS
 	  Support tracking and hand-over of aperture ownership. Required
 	  by graphics drivers for firmware-provided framebuffers.
 
+config STI_CORE
+	bool
+	depends on PARISC
+	help
+	  STI refers to the HP "Standard Text Interface" which is a set of
+	  BIOS routines contained in a ROM chip in HP PA-RISC based machines.
+
 config VIDEO_CMDLINE
 	bool
 
diff --git a/drivers/video/Makefile b/drivers/video/Makefile
index 831c9fa57a6c..6bbc03950899 100644
--- a/drivers/video/Makefile
+++ b/drivers/video/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_APERTURE_HELPERS)    += aperture.o
+obj-$(CONFIG_STI_CORE)            += sticore.o
 obj-$(CONFIG_VGASTATE)            += vgastate.o
 obj-$(CONFIG_VIDEO_CMDLINE)       += cmdline.o
 obj-$(CONFIG_VIDEO_NOMODESET)     += nomodeset.o
diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
index 22cea5082ac4..a2a88d42edf0 100644
--- a/drivers/video/console/Kconfig
+++ b/drivers/video/console/Kconfig
@@ -141,6 +141,7 @@ config STI_CONSOLE
 	depends on PARISC && HAS_IOMEM
 	select FONT_SUPPORT
 	select CRC32
+	select STI_CORE
 	default y
 	help
 	  The STI console is the builtin display/keyboard on HP-PARISC
diff --git a/drivers/video/console/Makefile b/drivers/video/console/Makefile
index db07b784bd2c..fd79016a0d95 100644
--- a/drivers/video/console/Makefile
+++ b/drivers/video/console/Makefile
@@ -5,8 +5,6 @@
 
 obj-$(CONFIG_DUMMY_CONSOLE)       += dummycon.o
 obj-$(CONFIG_SGI_NEWPORT_CONSOLE) += newport_con.o
-obj-$(CONFIG_STI_CONSOLE)         += sticon.o sticore.o
+obj-$(CONFIG_STI_CONSOLE)         += sticon.o
 obj-$(CONFIG_VGA_CONSOLE)         += vgacon.o
 obj-$(CONFIG_MDA_CONSOLE)         += mdacon.o
-
-obj-$(CONFIG_FB_STI)              += sticore.o
diff --git a/drivers/video/console/sticon.c b/drivers/video/console/sticon.c
index 89ad7ade6cf9..d11cfd2d68b5 100644
--- a/drivers/video/console/sticon.c
+++ b/drivers/video/console/sticon.c
@@ -50,7 +50,7 @@
 
 #include <asm/io.h>
 
-#include "../fbdev/sticore.h"
+#include <video/sticore.h>
 
 /* switching to graphics mode */
 #define BLANK 0
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 96e91570cdd3..485e8c35d5c6 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -551,10 +551,9 @@ config FB_STI
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select STI_CORE
 	default y
 	help
-	  STI refers to the HP "Standard Text Interface" which is a set of
-	  BIOS routines contained in a ROM chip in HP PA-RISC based machines.
 	  Enabling this option will implement the linux framebuffer device
 	  using calls to the STI BIOS routines for initialisation.
 
diff --git a/drivers/video/fbdev/stifb.c b/drivers/video/fbdev/stifb.c
index 99996bc7e6d9..baca6974e288 100644
--- a/drivers/video/fbdev/stifb.c
+++ b/drivers/video/fbdev/stifb.c
@@ -69,7 +69,7 @@
 #include <asm/grfioctl.h>	/* for HP-UX compatibility */
 #include <linux/uaccess.h>
 
-#include "sticore.h"
+#include <video/sticore.h>
 
 /* REGION_BASE(fb_info, index) returns the virtual address for region <index> */
 #define REGION_BASE(fb_info, index) \
diff --git a/drivers/video/console/sticore.c b/drivers/video/sticore.c
similarity index 99%
rename from drivers/video/console/sticore.c
rename to drivers/video/sticore.c
index 6ea9596a3c4b..f8aaedea437d 100644
--- a/drivers/video/console/sticore.c
+++ b/drivers/video/sticore.c
@@ -32,7 +32,7 @@
 #include <asm/grfioctl.h>
 #include <asm/fb.h>
 
-#include "../fbdev/sticore.h"
+#include <video/sticore.h>
 
 #define STI_DRIVERVERSION "Version 0.9c"
 
diff --git a/drivers/video/fbdev/sticore.h b/include/video/sticore.h
similarity index 100%
rename from drivers/video/fbdev/sticore.h
rename to include/video/sticore.h
-- 
2.40.0

