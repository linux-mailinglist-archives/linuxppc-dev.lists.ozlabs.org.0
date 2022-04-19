Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF1B506847
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 12:04:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjKCz6ybBz3bf9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 20:04:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=iI1MwWhw;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tkyPMDKC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=iI1MwWhw; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tkyPMDKC; 
 dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjKCH2ngHz2yZd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 20:04:10 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C0A1B1F74E;
 Tue, 19 Apr 2022 10:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650362647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=55fGSSrZuY3xqEH2rkNZv2XFbGNN8mqER7gd+O57G9Y=;
 b=iI1MwWhw7pVRCmImvj+KlZQbL4CDkIYjOI2ZusWKA4W/y4DQWexj6Ag+u75U27wTJHdAzo
 /2V20u04leQQ0hse26s+UeDb7UkxYKg+OjBKqldZcUaJ7O0Cyu8xWyO69YjhXglH1LggqN
 0NbilFktS5HLDp+KyZ5oxO4saVy7OiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650362647;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=55fGSSrZuY3xqEH2rkNZv2XFbGNN8mqER7gd+O57G9Y=;
 b=tkyPMDKCepdhp37voplcTyrRBFByT0x3PM3P2HOUCPZAay+jaEdN8pimaVOu9HmxyAs4V2
 hnrwvWmwlmmzPzBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 74E77139F6;
 Tue, 19 Apr 2022 10:04:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oJWVGxeJXmJzJQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 19 Apr 2022 10:04:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: robh+dt@kernel.org, frowand.list@gmail.com, daniel@ffwll.ch, deller@gmx.de,
 sam@ravnborg.org, linux@roeck-us.net, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, javierm@redhat.com
Subject: [PATCH v2 1/2] of: Create platform devices for OF framebuffers
Date: Tue, 19 Apr 2022 12:04:04 +0200
Message-Id: <20220419100405.12600-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419100405.12600-1-tzimmermann@suse.de>
References: <20220419100405.12600-1-tzimmermann@suse.de>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Create a platform device for each OF-declared framebuffer and have
offb bind to these devices. Allows for real hot-unplugging and other
drivers besides offb.

Originally, offb created framebuffer devices while initializing its
module by parsing the OF device tree. No actual Linux device was set
up. This tied OF framebuffers to offb and makes writing other drivers
for the OF framebuffers complicated. The absence of a Linux device
further prevented real hot-unplugging. Adding a distinct platform
device for each OF framebuffer solves both problems. Specifically, a
DRM driver can now provide graphics output for modern userspace.

Some of the offb init code is now located in the OF initialization.
There's now also an implementation of of_platform_default_populate_init(),
which was missing before. The OF side creates different devices for
either OF display nodes or BootX displays as they require different
handling by the driver. The offb drivers picks up each type of device
and runs the appropriate fbdev initialization.

Tested with OF display nodes on qemu's ppc64le target.

v2:
	* run PPC code as part of existing initialization (Rob)
	* add a few more error warnings (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/of/platform.c      | 88 ++++++++++++++++++++++++++--------
 drivers/video/fbdev/offb.c | 98 +++++++++++++++++++++++++-------------
 2 files changed, 132 insertions(+), 54 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index a16b74f32aa9..738ba2e2838c 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -507,7 +507,6 @@ int of_platform_default_populate(struct device_node *root,
 }
 EXPORT_SYMBOL_GPL(of_platform_default_populate);
 
-#ifndef CONFIG_PPC
 static const struct of_device_id reserved_mem_matches[] = {
 	{ .compatible = "qcom,rmtfs-mem" },
 	{ .compatible = "qcom,cmd-db" },
@@ -520,33 +519,81 @@ static const struct of_device_id reserved_mem_matches[] = {
 
 static int __init of_platform_default_populate_init(void)
 {
-	struct device_node *node;
-
 	device_links_supplier_sync_state_pause();
 
 	if (!of_have_populated_dt())
 		return -ENODEV;
 
-	/*
-	 * Handle certain compatibles explicitly, since we don't want to create
-	 * platform_devices for every node in /reserved-memory with a
-	 * "compatible",
-	 */
-	for_each_matching_node(node, reserved_mem_matches)
-		of_platform_device_create(node, NULL, NULL);
+	if (IS_ENABLED(CONFIG_PPC)) {
+		struct device_node *boot_display = NULL;
+		struct device_node *node;
+		struct platform_device *dev;
+		int ret;
+
+		/* Check if we have a MacOS display without a node spec */
+		if (of_get_property(of_chosen, "linux,bootx-noscreen", NULL)) {
+			/*
+			 * The old code tried to work out which node was the MacOS
+			 * display based on the address. I'm dropping that since the
+			 * lack of a node spec only happens with old BootX versions
+			 * (users can update) and with this code, they'll still get
+			 * a display (just not the palette hacks).
+			 */
+			dev = platform_device_alloc("bootx-noscreen", 0);
+			if (WARN_ON(!dev))
+				return -ENOMEM;
+			ret = platform_device_add(dev);
+			if (WARN_ON(ret)) {
+				platform_device_put(dev);
+				return ret;
+			}
+		}
 
-	node = of_find_node_by_path("/firmware");
-	if (node) {
-		of_platform_populate(node, NULL, NULL, NULL);
-		of_node_put(node);
-	}
+		/*
+		 * For OF framebuffers, first create the device for the boot display,
+		 * then for the other framebuffers. Only fail for the boot display;
+		 * ignore errors for the rest.
+		 */
+		for_each_node_by_type(node, "display") {
+			if (!of_get_property(node, "linux,opened", NULL) ||
+			    !of_get_property(node, "linux,boot-display", NULL))
+				continue;
+			dev = of_platform_device_create(node, "of-display", NULL);
+			if (WARN_ON(!dev))
+				return -ENOMEM;
+			boot_display = node;
+			break;
+		}
+		for_each_node_by_type(node, "display") {
+			if (!of_get_property(node, "linux,opened", NULL) || node == boot_display)
+				continue;
+			of_platform_device_create(node, "of-display", NULL);
+		}
 
-	node = of_get_compatible_child(of_chosen, "simple-framebuffer");
-	of_platform_device_create(node, NULL, NULL);
-	of_node_put(node);
+	} else {
+		struct device_node *node;
+
+		/*
+		 * Handle certain compatibles explicitly, since we don't want to create
+		 * platform_devices for every node in /reserved-memory with a
+		 * "compatible",
+		 */
+		for_each_matching_node(node, reserved_mem_matches)
+			of_platform_device_create(node, NULL, NULL);
 
-	/* Populate everything else. */
-	of_platform_default_populate(NULL, NULL, NULL);
+		node = of_find_node_by_path("/firmware");
+		if (node) {
+			of_platform_populate(node, NULL, NULL, NULL);
+			of_node_put(node);
+		}
+
+		node = of_get_compatible_child(of_chosen, "simple-framebuffer");
+		of_platform_device_create(node, NULL, NULL);
+		of_node_put(node);
+
+		/* Populate everything else. */
+		of_platform_default_populate(NULL, NULL, NULL);
+	}
 
 	return 0;
 }
@@ -558,7 +605,6 @@ static int __init of_platform_sync_state_init(void)
 	return 0;
 }
 late_initcall_sync(of_platform_sync_state_init);
-#endif
 
 int of_platform_device_destroy(struct device *dev, void *data)
 {
diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
index afdb6aa48add..b1acb1ebebe9 100644
--- a/drivers/video/fbdev/offb.c
+++ b/drivers/video/fbdev/offb.c
@@ -386,10 +386,10 @@ static void offb_init_palette_hacks(struct fb_info *info, struct device_node *dp
 		FB_VISUAL_PSEUDOCOLOR : FB_VISUAL_STATIC_PSEUDOCOLOR;
 }
 
-static void __init offb_init_fb(const char *name,
-				int width, int height, int depth,
-				int pitch, unsigned long address,
-				int foreign_endian, struct device_node *dp)
+static void offb_init_fb(struct platform_device *parent, const char *name,
+			 int width, int height, int depth,
+			 int pitch, unsigned long address,
+			 int foreign_endian, struct device_node *dp)
 {
 	unsigned long res_size = pitch * height;
 	struct offb_par *par = &default_par;
@@ -410,12 +410,13 @@ static void __init offb_init_fb(const char *name,
 		return;
 	}
 
-	info = framebuffer_alloc(sizeof(u32) * 16, NULL);
+	info = framebuffer_alloc(sizeof(u32) * 16, &parent->dev);
 
 	if (!info) {
 		release_mem_region(res_start, res_size);
 		return;
 	}
+	platform_set_drvdata(parent, info);
 
 	fix = &info->fix;
 	var = &info->var;
@@ -535,7 +536,8 @@ static void __init offb_init_fb(const char *name,
 }
 
 
-static void __init offb_init_nodriver(struct device_node *dp, int no_real_node)
+static void offb_init_nodriver(struct platform_device *parent, struct device_node *dp,
+			       int no_real_node)
 {
 	unsigned int len;
 	int i, width = 640, height = 480, depth = 8, pitch = 640;
@@ -650,46 +652,76 @@ static void __init offb_init_nodriver(struct device_node *dp, int no_real_node)
 		/* kludge for valkyrie */
 		if (of_node_name_eq(dp, "valkyrie"))
 			address += 0x1000;
-		offb_init_fb(no_real_node ? "bootx" : NULL,
+		offb_init_fb(parent, no_real_node ? "bootx" : NULL,
 			     width, height, depth, pitch, address,
 			     foreign_endian, no_real_node ? NULL : dp);
 	}
 }
 
-static int __init offb_init(void)
+static int offb_remove(struct platform_device *pdev)
 {
-	struct device_node *dp = NULL, *boot_disp = NULL;
+	struct fb_info *info = platform_get_drvdata(pdev);
 
-	if (fb_get_options("offb", NULL))
-		return -ENODEV;
+	if (info)
+		unregister_framebuffer(info);
 
-	/* Check if we have a MacOS display without a node spec */
-	if (of_get_property(of_chosen, "linux,bootx-noscreen", NULL) != NULL) {
-		/* The old code tried to work out which node was the MacOS
-		 * display based on the address. I'm dropping that since the
-		 * lack of a node spec only happens with old BootX versions
-		 * (users can update) and with this code, they'll still get
-		 * a display (just not the palette hacks).
-		 */
-		offb_init_nodriver(of_chosen, 1);
-	}
+	return 0;
+}
 
-	for_each_node_by_type(dp, "display") {
-		if (of_get_property(dp, "linux,opened", NULL) &&
-		    of_get_property(dp, "linux,boot-display", NULL)) {
-			boot_disp = dp;
-			offb_init_nodriver(dp, 0);
-		}
-	}
-	for_each_node_by_type(dp, "display") {
-		if (of_get_property(dp, "linux,opened", NULL) &&
-		    dp != boot_disp)
-			offb_init_nodriver(dp, 0);
-	}
+static int offb_probe_bootx_noscreen(struct platform_device *pdev)
+{
+	offb_init_nodriver(pdev, of_chosen, 1);
 
 	return 0;
 }
 
+static struct platform_driver offb_driver_bootx_noscreen = {
+	.driver = {
+		.name = "bootx-noscreen",
+	},
+	.probe = offb_probe_bootx_noscreen,
+	.remove = offb_remove,
+};
+
+static int offb_probe_display(struct platform_device *pdev)
+{
+	offb_init_nodriver(pdev, pdev->dev.of_node, 0);
+
+	return 0;
+}
 
+static const struct of_device_id offb_of_match_display[] = {
+	{ .compatible = "display", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, offb_of_match_display);
+
+static struct platform_driver offb_driver_display = {
+	.driver = {
+		.name = "of-display",
+		.of_match_table = offb_of_match_display,
+	},
+	.probe = offb_probe_display,
+	.remove = offb_remove,
+};
+
+static int __init offb_init(void)
+{
+	if (fb_get_options("offb", NULL))
+		return -ENODEV;
+
+	platform_driver_register(&offb_driver_bootx_noscreen);
+	platform_driver_register(&offb_driver_display);
+
+	return 0;
+}
 module_init(offb_init);
+
+static void __exit offb_exit(void)
+{
+	platform_driver_unregister(&offb_driver_display);
+	platform_driver_unregister(&offb_driver_bootx_noscreen);
+}
+module_exit(offb_exit);
+
 MODULE_LICENSE("GPL");
-- 
2.35.1

