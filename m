Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D8B690B2E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 15:01:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCJSQ2L6Rz3fW7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 01:01:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Gt5F6caP;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IgTwud9Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Gt5F6caP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IgTwud9Q;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCJKN5rvcz3f2y
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 00:55:20 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DF0E35D032;
	Thu,  9 Feb 2023 13:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1675950914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cc/wkb7CTrIJff5YFI4h23UKqUPZFJYr44axR8SHoNs=;
	b=Gt5F6caPF2qChBJDy5VnxjBO/iiwDrvc+HWHA01om5JijVH0w8mETcvJjcd8qTpv5IhTaf
	oPBpJACWKJLXcHCXd0ZKUU3C27Li1XyBcbEqmJVevcRkVjldk7oAoCld0Srg/WVy6wEAPp
	IHCqgz7wduWxeB5MymKRO/R6Tf5+W/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1675950914;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cc/wkb7CTrIJff5YFI4h23UKqUPZFJYr44axR8SHoNs=;
	b=IgTwud9Qm7Xo/p2iAptM9D+xs2u5m8g49x6bhlhnCKXJavD6OCPVoVW/EeB7GjF/hst2Js
	k4UW4L4KgWIYsmDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 92A84138E4;
	Thu,  9 Feb 2023 13:55:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uCfQIkL75GNTfwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 09 Feb 2023 13:55:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	deller@gmx.de,
	javierm@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	geoff@infradead.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH 08/11] fbdev: Handle video= parameter in video/cmdline.c
Date: Thu,  9 Feb 2023 14:55:06 +0100
Message-Id: <20230209135509.7786-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209135509.7786-1-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Handle the command-line parameter video= in video/cmdline.c. Implement
the fbdev helper fb_get_options() on top. Will allows to handle the
kernel parameter in DRM without fbdev dependencies.

Note that __video_get_options() has the meaning of its return value
inverted compared to fb_get_options(). The new helper returns true if
the adapter has been enabled, and false otherwise.

There is the ofonly parameter, which disables output for non-OF-based
framebuffers. It is only for offb and looks like a workaround. The actual
purpose it not clear to me. Use 'video=off' or 'nomodeset' instead.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Kconfig               |   2 +-
 drivers/video/Kconfig                 |   3 +
 drivers/video/Makefile                |   1 +
 drivers/video/cmdline.c               | 133 ++++++++++++++++++++++++++
 drivers/video/fbdev/Kconfig           |   5 +-
 drivers/video/fbdev/core/Makefile     |   3 +-
 drivers/video/fbdev/core/fb_cmdline.c |  93 +++---------------
 include/video/cmdline.h               |  20 ++++
 8 files changed, 172 insertions(+), 88 deletions(-)
 create mode 100644 drivers/video/cmdline.c
 create mode 100644 include/video/cmdline.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index dc0f94f02a82..81c8a99c744a 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -10,13 +10,13 @@ menuconfig DRM
 	depends on (AGP || AGP=n) && !EMULATED_CMPXCHG && HAS_DMA
 	select DRM_PANEL_ORIENTATION_QUIRKS
 	select HDMI
-	select FB_CMDLINE
 	select I2C
 	select DMA_SHARED_BUFFER
 	select SYNC_FILE
 # gallium uses SYS_kcmp for os_same_file_description() to de-duplicate
 # device and dmabuf fd. Let's make sure that is available for our userspace.
 	select KCMP
+	select VIDEO_CMDLINE
 	select VIDEO_NOMODESET
 	help
 	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 6d2fde6c5d11..bf05363d8906 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -11,6 +11,9 @@ config APERTURE_HELPERS
 	  Support tracking and hand-over of aperture ownership. Required
 	  by graphics drivers for firmware-provided framebuffers.
 
+config VIDEO_CMDLINE
+	bool
+
 config VIDEO_NOMODESET
 	bool
 	default n
diff --git a/drivers/video/Makefile b/drivers/video/Makefile
index a50eb528ed3c..831c9fa57a6c 100644
--- a/drivers/video/Makefile
+++ b/drivers/video/Makefile
@@ -2,6 +2,7 @@
 
 obj-$(CONFIG_APERTURE_HELPERS)    += aperture.o
 obj-$(CONFIG_VGASTATE)            += vgastate.o
+obj-$(CONFIG_VIDEO_CMDLINE)       += cmdline.o
 obj-$(CONFIG_VIDEO_NOMODESET)     += nomodeset.o
 obj-$(CONFIG_HDMI)                += hdmi.o
 
diff --git a/drivers/video/cmdline.c b/drivers/video/cmdline.c
new file mode 100644
index 000000000000..d3d257489c3d
--- /dev/null
+++ b/drivers/video/cmdline.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Based on the fbdev code in drivers/video/fbdev/core/fb_cmdline:
+ *
+ *  Copyright (C) 2014 Intel Corp
+ *  Copyright (C) 1994 Martin Schaller
+ *
+ *	2001 - Documented with DocBook
+ *	- Brad Douglas <brad@neruo.com>
+ *
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file COPYING in the main directory of this archive
+ * for more details.
+ *
+ * Authors:
+ *    Daniel Vetter <daniel.vetter@ffwll.ch>
+ */
+
+#include <linux/fb.h> /* for FB_MAX */
+#include <linux/init.h>
+
+#include <video/cmdline.h>
+
+/*
+ * FB_MAX is the maximum number of framebuffer devices and also
+ * the maximum number of video= parameters. Although not directly
+ * related to each other, it makes sense to keep it that way.
+ */
+static const char *video_options[FB_MAX] __read_mostly;
+static const char *video_option __read_mostly;
+static int video_of_only __read_mostly;
+
+static const char *__video_get_option_string(const char *name)
+{
+	const char *options = NULL;
+	size_t name_len = 0;
+
+	if (name)
+		name_len = strlen(name);
+
+	if (name_len) {
+		unsigned int i;
+		const char *opt;
+
+		for (i = 0; i < ARRAY_SIZE(video_options); ++i) {
+			if (!video_options[i])
+				continue;
+			if (video_options[i][0] == '\0')
+				continue;
+			opt = video_options[i];
+			if (!strncmp(opt, name, name_len) && opt[name_len] == ':')
+				options = opt + name_len + 1;
+		}
+	}
+
+	/* No match, return global options */
+	if (!options)
+		options = video_option;
+
+	return options;
+}
+
+/**
+ * video_get_options - get kernel boot parameters
+ * @name:	name of the output as it would appear in the boot parameter
+ *		line (video=<name>:<options>)
+ *
+ * Looks up the video= options for the given name. Names are connector
+ * names with DRM, or driver names with fbdev. If no video option for
+ * the name has been specified, the function returns the global video=
+ * setting. A @name of NULL always returns the global video setting.
+ *
+ * Returns:
+ * The string of video options for the given name, or NULL if no video
+ * option has been specified.
+ */
+const char *video_get_options(const char *name)
+{
+	return __video_get_option_string(name);
+}
+EXPORT_SYMBOL(video_get_options);
+
+bool __video_get_options(const char *name, const char **options, bool is_of)
+{
+	bool enabled = true;
+	const char *opt = NULL;
+
+	if (video_of_only && !is_of)
+		enabled = false;
+
+	opt = __video_get_option_string(name);
+
+	if (options)
+		*options = opt;
+
+	return enabled;
+}
+EXPORT_SYMBOL(__video_get_options);
+
+/*
+ * Process command line options for video adapters. This function is
+ * a __setup and __init function. It only stores the options. Drivers
+ * have to call video_get_options() as necessary.
+ */
+static int __init video_setup(char *options)
+{
+	if (!options || !*options)
+		goto out;
+
+	if (!strncmp(options, "ofonly", 6)) {
+		video_of_only = true;
+		goto out;
+	}
+
+	if (strchr(options, ':')) {
+		/* named */
+		size_t i;
+
+		for (i = 0; i < ARRAY_SIZE(video_options); i++) {
+			if (!video_options[i]) {
+				video_options[i] = options;
+				break;
+			}
+		}
+	} else {
+		/* global */
+		video_option = options;
+	}
+
+out:
+	return 1;
+}
+__setup("video=", video_setup);
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index b2bed599e6c6..3623c1c0d34d 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -3,16 +3,13 @@
 # fbdev configuration
 #
 
-config FB_CMDLINE
-	bool
-
 config FB_NOTIFY
 	bool
 
 menuconfig FB
 	tristate "Support for frame buffer devices"
-	select FB_CMDLINE
 	select FB_NOTIFY
+	select VIDEO_CMDLINE
 	help
 	  The frame buffer device provides an abstraction for the graphics
 	  hardware. It represents the frame buffer of some video hardware and
diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
index 26cbc965497c..08fabce76b74 100644
--- a/drivers/video/fbdev/core/Makefile
+++ b/drivers/video/fbdev/core/Makefile
@@ -1,9 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_FB_CMDLINE)          += fb_cmdline.o
 obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
 obj-$(CONFIG_FB)                  += fb.o
 fb-y                              := fbmem.o fbmon.o fbcmap.o fbsysfs.o \
-                                     modedb.o fbcvt.o
+                                     modedb.o fbcvt.o fb_cmdline.o
 fb-$(CONFIG_FB_DEFERRED_IO)       += fb_defio.o
 
 ifeq ($(CONFIG_FRAMEBUFFER_CONSOLE),y)
diff --git a/drivers/video/fbdev/core/fb_cmdline.c b/drivers/video/fbdev/core/fb_cmdline.c
index f811c7b679e1..4d1634c492ec 100644
--- a/drivers/video/fbdev/core/fb_cmdline.c
+++ b/drivers/video/fbdev/core/fb_cmdline.c
@@ -14,42 +14,12 @@
  * Authors:
  *    Daniel Vetter <daniel.vetter@ffwll.ch>
  */
-#include <linux/init.h>
-#include <linux/fb.h>
-
-static char *video_options[FB_MAX] __read_mostly;
-static const char *fb_mode_option __read_mostly;
-static int ofonly __read_mostly;
-
-static const char *__fb_get_options(const char *name)
-{
-	const char *options = NULL;
-	size_t name_len = 0;
-
-	if (name)
-		name_len = strlen(name);
 
-	if (name_len) {
-		unsigned int i;
-		const char *opt;
-
-		for (i = 0; i < ARRAY_SIZE(video_options); ++i) {
-			if (!video_options[i])
-				continue;
-			if (video_options[i][0] == '\0')
-				continue;
-			opt = video_options[i];
-			if (!strncmp(opt, name, name_len) && opt[name_len] == ':')
-				options = opt + name_len + 1;
-		}
-	}
+#include <linux/export.h>
+#include <linux/fb.h>
+#include <linux/string.h>
 
-	/* No match, return global options */
-	if (!options)
-		options = fb_mode_option;
-
-	return options;
-}
+#include <video/cmdline.h>
 
 /**
  * fb_get_options - get kernel boot parameters
@@ -65,17 +35,18 @@ static const char *__fb_get_options(const char *name)
  */
 int fb_get_options(const char *name, char **option)
 {
-	int retval = 0;
-	const char *options;
+	const char *options = NULL;
+	bool is_of = false;
+	bool enabled;
 
-	if (name && ofonly && strncmp(name, "offb", 4))
-		retval = 1;
+	if (name)
+		is_of = strncmp(name, "offb", 4);
 
-	options = __fb_get_options(name);
+	enabled = __video_get_options(name, &options, is_of);
 
 	if (options) {
 		if (!strncmp(options, "off", 3))
-			retval = 1;
+			enabled = false;
 	}
 
 	if (option) {
@@ -85,46 +56,6 @@ int fb_get_options(const char *name, char **option)
 			*option = NULL;
 	}
 
-	return retval;
+	return enabled ? 0 : 1; // 0 on success, 1 otherwise
 }
 EXPORT_SYMBOL(fb_get_options);
-
-/**
- *	video_setup - process command line options
- *	@options: string of options
- *
- *	Process command line options for frame buffer subsystem.
- *
- *	NOTE: This function is a __setup and __init function.
- *            It only stores the options.  Drivers have to call
- *            fb_get_options() as necessary.
- */
-static int __init video_setup(char *options)
-{
-	if (!options || !*options)
-		goto out;
-
-	if (!strncmp(options, "ofonly", 6)) {
-		ofonly = 1;
-		goto out;
-	}
-
-	if (strchr(options, ':')) {
-		/* named */
-		int i;
-
-		for (i = 0; i < FB_MAX; i++) {
-			if (video_options[i] == NULL) {
-				video_options[i] = options;
-				break;
-			}
-		}
-	} else {
-		/* global */
-		fb_mode_option = options;
-	}
-
-out:
-	return 1;
-}
-__setup("video=", video_setup);
diff --git a/include/video/cmdline.h b/include/video/cmdline.h
new file mode 100644
index 000000000000..26b80cdaef79
--- /dev/null
+++ b/include/video/cmdline.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef VIDEO_CMDLINE_H
+#define VIDEO_CMDLINE_H
+
+#include <linux/types.h>
+
+#if defined(CONFIG_VIDEO_CMDLINE)
+const char *video_get_options(const char *name);
+
+/* exported for compatibility with fbdev; don't use in new code */
+bool __video_get_options(const char *name, const char **option, bool is_of);
+#else
+static inline const char *video_get_options(const char *name)
+{
+	return NULL;
+}
+#endif
+
+#endif
-- 
2.39.1

