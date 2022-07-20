Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE0657B88D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 16:31:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lnymq1Bmkz3f6W
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 00:31:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=RFXr9r9B;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ln8aHQrX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=RFXr9r9B;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ln8aHQrX;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lnyhw6NmNz3bkG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 00:27:44 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C375C1FF9C;
	Wed, 20 Jul 2022 14:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1658327254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0qnqY2MQp33YyQo28BI9kr6EQfE0l0pCMd+jyz1TCK4=;
	b=RFXr9r9Bc1Uea7vVVV/MoAQ4QPQUCYdT85+F7OZMYSmyEvzkMrX9zCmNqn6sE6r7DOQV3r
	jEgEQG7SSeUJD2vgLOhWndqKWBxPtWeGBr3ioMqnR/jhZ6AGdqv9XLWiolO8INvRB0zs5L
	v3JlZuBhF/Uwf/s2/DF+HVFuT1OxCkk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1658327254;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0qnqY2MQp33YyQo28BI9kr6EQfE0l0pCMd+jyz1TCK4=;
	b=ln8aHQrXFGk3e8GKg439GZH0vmqgQvFLzomsCfYl99c6ZQl04W7FZZaheyB+iyJhWOVbG6
	R5gye4UmvkXgaLBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 76B6613AAD;
	Wed, 20 Jul 2022 14:27:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id cK05HNYQ2GLfHgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 20 Jul 2022 14:27:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	airlied@linux.ie,
	daniel@ffwll.ch,
	deller@gmx.de,
	maxime@cerno.tech,
	sam@ravnborg.org,
	msuchanek@suse.de,
	mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	geert@linux-m68k.org,
	mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 02/10] drm/simpledrm: Inline device-init helpers
Date: Wed, 20 Jul 2022 16:27:24 +0200
Message-Id: <20220720142732.32041-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720142732.32041-1-tzimmermann@suse.de>
References: <20220720142732.32041-1-tzimmermann@suse.de>
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

Inline the helpers for initializing the hardware FB, the memory
management and the modesetting into the device-creation function.
No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/simpledrm.c | 291 ++++++++++++++-----------------
 1 file changed, 128 insertions(+), 163 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 9fd507119372..9bc9ecf6d964 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -449,119 +449,6 @@ static int simpledrm_device_init_regulators(struct simpledrm_device *sdev)
 }
 #endif
 
-/*
- *  Simplefb settings
- */
-
-static struct drm_display_mode simpledrm_mode(unsigned int width,
-					      unsigned int height)
-{
-	struct drm_display_mode mode = { SIMPLEDRM_MODE(width, height) };
-
-	mode.clock = mode.hdisplay * mode.vdisplay * 60 / 1000 /* kHz */;
-	drm_mode_set_name(&mode);
-
-	return mode;
-}
-
-static int simpledrm_device_init_fb(struct simpledrm_device *sdev)
-{
-	int width, height, stride;
-	const struct drm_format_info *format;
-	struct drm_device *dev = &sdev->dev;
-	struct platform_device *pdev = sdev->pdev;
-	const struct simplefb_platform_data *pd = dev_get_platdata(&pdev->dev);
-	struct device_node *of_node = pdev->dev.of_node;
-
-	if (pd) {
-		width = simplefb_get_width_pd(dev, pd);
-		if (width < 0)
-			return width;
-		height = simplefb_get_height_pd(dev, pd);
-		if (height < 0)
-			return height;
-		stride = simplefb_get_stride_pd(dev, pd);
-		if (stride < 0)
-			return stride;
-		format = simplefb_get_format_pd(dev, pd);
-		if (IS_ERR(format))
-			return PTR_ERR(format);
-	} else if (of_node) {
-		width = simplefb_get_width_of(dev, of_node);
-		if (width < 0)
-			return width;
-		height = simplefb_get_height_of(dev, of_node);
-		if (height < 0)
-			return height;
-		stride = simplefb_get_stride_of(dev, of_node);
-		if (stride < 0)
-			return stride;
-		format = simplefb_get_format_of(dev, of_node);
-		if (IS_ERR(format))
-			return PTR_ERR(format);
-	} else {
-		drm_err(dev, "no simplefb configuration found\n");
-		return -ENODEV;
-	}
-
-	sdev->mode = simpledrm_mode(width, height);
-	sdev->format = format;
-	sdev->pitch = stride;
-
-	drm_dbg_kms(dev, "display mode={" DRM_MODE_FMT "}\n",
-		    DRM_MODE_ARG(&sdev->mode));
-	drm_dbg_kms(dev,
-		    "framebuffer format=%p4cc, size=%dx%d, stride=%d byte\n",
-		    &format->format, width, height, stride);
-
-	return 0;
-}
-
-/*
- * Memory management
- */
-
-static int simpledrm_device_init_mm(struct simpledrm_device *sdev)
-{
-	struct drm_device *dev = &sdev->dev;
-	struct platform_device *pdev = sdev->pdev;
-	struct resource *res, *mem;
-	void __iomem *screen_base;
-	int ret;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -EINVAL;
-
-	ret = devm_aperture_acquire_from_firmware(dev, res->start, resource_size(res));
-	if (ret) {
-		drm_err(dev, "could not acquire memory range %pr: error %d\n",
-			res, ret);
-		return ret;
-	}
-
-	mem = devm_request_mem_region(&pdev->dev, res->start, resource_size(res),
-				      sdev->dev.driver->name);
-	if (!mem) {
-		/*
-		 * We cannot make this fatal. Sometimes this comes from magic
-		 * spaces our resource handlers simply don't know about. Use
-		 * the I/O-memory resource as-is and try to map that instead.
-		 */
-		drm_warn(dev, "could not acquire memory region %pr\n", res);
-		mem = res;
-	}
-
-	screen_base = devm_ioremap_wc(&pdev->dev, mem->start,
-				      resource_size(mem));
-	if (!screen_base)
-		return -ENOMEM;
-
-	sdev->screen_base = screen_base;
-
-	return 0;
-}
-
 /*
  * Modesetting
  */
@@ -738,6 +625,21 @@ static const struct drm_mode_config_funcs simpledrm_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
+/*
+ * Init / Cleanup
+ */
+
+static struct drm_display_mode simpledrm_mode(unsigned int width,
+					      unsigned int height)
+{
+	struct drm_display_mode mode = { SIMPLEDRM_MODE(width, height) };
+
+	mode.clock = mode.hdisplay * mode.vdisplay * 60 / 1000 /* kHz */;
+	drm_mode_set_name(&mode);
+
+	return mode;
+}
+
 static const uint32_t *simpledrm_device_formats(struct simpledrm_device *sdev,
 						size_t *nformats_out)
 {
@@ -777,88 +679,151 @@ static const uint32_t *simpledrm_device_formats(struct simpledrm_device *sdev,
 	return sdev->formats;
 }
 
-static int simpledrm_device_init_modeset(struct simpledrm_device *sdev)
+static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
+							struct platform_device *pdev)
 {
-	struct drm_device *dev = &sdev->dev;
-	struct drm_display_mode *mode = &sdev->mode;
-	struct drm_connector *connector = &sdev->connector;
-	struct drm_simple_display_pipe *pipe = &sdev->pipe;
+	const struct simplefb_platform_data *pd = dev_get_platdata(&pdev->dev);
+	struct device_node *of_node = pdev->dev.of_node;
+	struct simpledrm_device *sdev;
+	struct drm_device *dev;
+	int width, height, stride;
+	const struct drm_format_info *format;
+	struct resource *res, *mem;
+	void __iomem *screen_base;
+	struct drm_connector *connector;
+	struct drm_simple_display_pipe *pipe;
 	unsigned long max_width, max_height;
 	const uint32_t *formats;
 	size_t nformats;
 	int ret;
 
+	sdev = devm_drm_dev_alloc(&pdev->dev, drv, struct simpledrm_device, dev);
+	if (IS_ERR(sdev))
+		return ERR_CAST(sdev);
+	dev = &sdev->dev;
+	sdev->pdev = pdev;
+	platform_set_drvdata(pdev, sdev);
+
+	/*
+	 * Hardware settings
+	 */
+
+	ret = simpledrm_device_init_clocks(sdev);
+	if (ret)
+		return ERR_PTR(ret);
+	ret = simpledrm_device_init_regulators(sdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (pd) {
+		width = simplefb_get_width_pd(dev, pd);
+		if (width < 0)
+			return ERR_PTR(width);
+		height = simplefb_get_height_pd(dev, pd);
+		if (height < 0)
+			return ERR_PTR(height);
+		stride = simplefb_get_stride_pd(dev, pd);
+		if (stride < 0)
+			return ERR_PTR(stride);
+		format = simplefb_get_format_pd(dev, pd);
+		if (IS_ERR(format))
+			return ERR_CAST(format);
+	} else if (of_node) {
+		width = simplefb_get_width_of(dev, of_node);
+		if (width < 0)
+			return ERR_PTR(width);
+		height = simplefb_get_height_of(dev, of_node);
+		if (height < 0)
+			return ERR_PTR(height);
+		stride = simplefb_get_stride_of(dev, of_node);
+		if (stride < 0)
+			return ERR_PTR(stride);
+		format = simplefb_get_format_of(dev, of_node);
+		if (IS_ERR(format))
+			return ERR_CAST(format);
+	} else {
+		drm_err(dev, "no simplefb configuration found\n");
+		return ERR_PTR(-ENODEV);
+	}
+	sdev->mode = simpledrm_mode(width, height);
+	sdev->format = format;
+	sdev->pitch = stride;
+
+	drm_dbg(dev, "display mode={" DRM_MODE_FMT "}\n", DRM_MODE_ARG(&sdev->mode));
+	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, stride=%d byte\n",
+		&format->format, width, height, stride);
+
+	/*
+	 * Memory management
+	 */
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return ERR_PTR(-EINVAL);
+
+	ret = devm_aperture_acquire_from_firmware(dev, res->start, resource_size(res));
+	if (ret) {
+		drm_err(dev, "could not acquire memory range %pr: error %d\n", res, ret);
+		return ERR_PTR(ret);
+	}
+
+	mem = devm_request_mem_region(&pdev->dev, res->start, resource_size(res), drv->name);
+	if (!mem) {
+		/*
+		 * We cannot make this fatal. Sometimes this comes from magic
+		 * spaces our resource handlers simply don't know about. Use
+		 * the I/O-memory resource as-is and try to map that instead.
+		 */
+		drm_warn(dev, "could not acquire memory region %pr\n", res);
+		mem = res;
+	}
+
+	screen_base = devm_ioremap_wc(&pdev->dev, mem->start, resource_size(mem));
+	if (!screen_base)
+		return ERR_PTR(-ENOMEM);
+	sdev->screen_base = screen_base;
+
+	/*
+	 * Modesetting
+	 */
+
 	ret = drmm_mode_config_init(dev);
 	if (ret)
-		return ret;
+		return ERR_PTR(ret);
 
-	max_width = max_t(unsigned long, mode->hdisplay, DRM_SHADOW_PLANE_MAX_WIDTH);
-	max_height = max_t(unsigned long, mode->vdisplay, DRM_SHADOW_PLANE_MAX_HEIGHT);
+	max_width = max_t(unsigned long, width, DRM_SHADOW_PLANE_MAX_WIDTH);
+	max_height = max_t(unsigned long, height, DRM_SHADOW_PLANE_MAX_HEIGHT);
 
-	dev->mode_config.min_width = mode->hdisplay;
+	dev->mode_config.min_width = width;
 	dev->mode_config.max_width = max_width;
-	dev->mode_config.min_height = mode->vdisplay;
+	dev->mode_config.min_height = height;
 	dev->mode_config.max_height = max_height;
-	dev->mode_config.preferred_depth = sdev->format->cpp[0] * 8;
+	dev->mode_config.preferred_depth = format->cpp[0] * 8;
 	dev->mode_config.funcs = &simpledrm_mode_config_funcs;
 
+	connector = &sdev->connector;
 	ret = drm_connector_init(dev, connector, &simpledrm_connector_funcs,
 				 DRM_MODE_CONNECTOR_Unknown);
 	if (ret)
-		return ret;
+		return ERR_PTR(ret);
 	drm_connector_helper_add(connector, &simpledrm_connector_helper_funcs);
 	drm_connector_set_panel_orientation_with_quirk(connector,
 						       DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
-						       mode->hdisplay, mode->vdisplay);
+						       width, height);
 
 	formats = simpledrm_device_formats(sdev, &nformats);
 
+	pipe = &sdev->pipe;
 	ret = drm_simple_display_pipe_init(dev, pipe, &simpledrm_simple_display_pipe_funcs,
 					   formats, nformats, simpledrm_format_modifiers,
 					   connector);
 	if (ret)
-		return ret;
+		return ERR_PTR(ret);
 
 	drm_plane_enable_fb_damage_clips(&pipe->plane);
 
 	drm_mode_config_reset(dev);
 
-	return 0;
-}
-
-/*
- * Init / Cleanup
- */
-
-static struct simpledrm_device *
-simpledrm_device_create(struct drm_driver *drv, struct platform_device *pdev)
-{
-	struct simpledrm_device *sdev;
-	int ret;
-
-	sdev = devm_drm_dev_alloc(&pdev->dev, drv, struct simpledrm_device,
-				  dev);
-	if (IS_ERR(sdev))
-		return ERR_CAST(sdev);
-	sdev->pdev = pdev;
-	platform_set_drvdata(pdev, sdev);
-
-	ret = simpledrm_device_init_clocks(sdev);
-	if (ret)
-		return ERR_PTR(ret);
-	ret = simpledrm_device_init_regulators(sdev);
-	if (ret)
-		return ERR_PTR(ret);
-	ret = simpledrm_device_init_fb(sdev);
-	if (ret)
-		return ERR_PTR(ret);
-	ret = simpledrm_device_init_mm(sdev);
-	if (ret)
-		return ERR_PTR(ret);
-	ret = simpledrm_device_init_modeset(sdev);
-	if (ret)
-		return ERR_PTR(ret);
-
 	return sdev;
 }
 
-- 
2.36.1

