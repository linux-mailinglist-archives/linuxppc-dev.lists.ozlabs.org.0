Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1E457B892
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 16:32:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnypG6Rsrz3fC8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 00:32:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l1ll9c/J;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9VoN34+k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l1ll9c/J;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9VoN34+k;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lnyhw6Qsqz3bkH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 00:27:44 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BD0DE34AF6;
	Wed, 20 Jul 2022 14:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1658327255; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQOru1/bKRNv5YM8YDVIZA5LvElwHXApiCtqfowZBdU=;
	b=l1ll9c/J4cqvrCFXxcshTQ6+zNLHHCv7G/0V19CqnCaJ/MtsFSkbl/t3k4chaqw5hajv1r
	GgK28ksFVd9tKkCOCvLJAPuEBiiUn4o8vXr5yDS3r4PIokJzAcmhvhXXirE9y+0/TcjWuZ
	3w0tG2wbaLIf7iWnvSEsx69EtJRdvvg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1658327255;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQOru1/bKRNv5YM8YDVIZA5LvElwHXApiCtqfowZBdU=;
	b=9VoN34+ke3Iin6b0GLS+pkyM7x15QJE1WLWQr+1kaOYlCKs8H0lpjQ2KOa4BsTb9u3ePkh
	i60XGgx6znjUDwBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 72A2213AAD;
	Wed, 20 Jul 2022 14:27:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uBsCG9cQ2GLfHgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 20 Jul 2022 14:27:35 +0000
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
Subject: [PATCH v2 05/10] drm/simpledrm: Convert to atomic helpers
Date: Wed, 20 Jul 2022 16:27:27 +0200
Message-Id: <20220720142732.32041-6-tzimmermann@suse.de>
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

Replace the simple-KMS helpers with the regular atomic helpers. The
regular helpers are better architectured and therefore allow for easier
code sharing among drivers. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/simpledrm.c | 283 ++++++++++++++++++++-----------
 1 file changed, 180 insertions(+), 103 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index cff9e7f71f80..727ab9d86bcc 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -8,6 +8,7 @@
 #include <linux/regulator/consumer.h>
 
 #include <drm/drm_aperture.h>
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_damage_helper.h>
@@ -20,8 +21,8 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #define DRIVER_NAME	"simpledrm"
 #define DRIVER_DESC	"DRM driver for simple-framebuffer platform devices"
@@ -221,8 +222,10 @@ struct simpledrm_device {
 	/* modesetting */
 	uint32_t formats[8];
 	size_t nformats;
+	struct drm_plane primary_plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
 	struct drm_connector connector;
-	struct drm_simple_display_pipe pipe;
 };
 
 static struct simpledrm_device *simpledrm_device_of_dev(struct drm_device *dev)
@@ -460,7 +463,7 @@ static int simpledrm_device_init_regulators(struct simpledrm_device *sdev)
  * TODO: Add blit helpers for remaining formats and uncomment
  *       constants.
  */
-static const uint32_t simpledrm_default_formats[] = {
+static const uint32_t simpledrm_primary_plane_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_RGB565,
@@ -471,73 +474,43 @@ static const uint32_t simpledrm_default_formats[] = {
 	DRM_FORMAT_ARGB2101010,
 };
 
-static const uint64_t simpledrm_format_modifiers[] = {
+static const uint64_t simpledrm_primary_plane_format_modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_INVALID
 };
 
-static int simpledrm_connector_helper_get_modes(struct drm_connector *connector)
+static int simpledrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
+						       struct drm_atomic_state *new_state)
 {
-	struct simpledrm_device *sdev = simpledrm_device_of_dev(connector->dev);
-	struct drm_display_mode *mode;
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
+	struct drm_crtc_state *new_crtc_state;
+	int ret;
 
-	mode = drm_mode_duplicate(connector->dev, &sdev->mode);
-	if (!mode)
+	if (!new_plane_state->fb)
 		return 0;
 
-	if (mode->name[0] == '\0')
-		drm_mode_set_name(mode);
-
-	mode->type |= DRM_MODE_TYPE_PREFERRED;
-	drm_mode_probed_add(connector, mode);
-
-	if (mode->width_mm)
-		connector->display_info.width_mm = mode->width_mm;
-	if (mode->height_mm)
-		connector->display_info.height_mm = mode->height_mm;
-
-	return 1;
-}
+	new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_plane_state->crtc);
 
-static const struct drm_connector_helper_funcs simpledrm_connector_helper_funcs = {
-	.get_modes = simpledrm_connector_helper_get_modes,
-};
-
-static const struct drm_connector_funcs simpledrm_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static int
-simpledrm_simple_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
-				    const struct drm_display_mode *mode)
-{
-	struct simpledrm_device *sdev = simpledrm_device_of_dev(pipe->crtc.dev);
-
-	if (mode->hdisplay != sdev->mode.hdisplay &&
-	    mode->vdisplay != sdev->mode.vdisplay)
-		return MODE_ONE_SIZE;
-	else if (mode->hdisplay != sdev->mode.hdisplay)
-		return MODE_ONE_WIDTH;
-	else if (mode->vdisplay != sdev->mode.vdisplay)
-		return MODE_ONE_HEIGHT;
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  false, false);
+	if (ret)
+		return ret;
 
-	return MODE_OK;
+	return 0;
 }
 
-static void
-simpledrm_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
-				     struct drm_crtc_state *crtc_state,
-				     struct drm_plane_state *plane_state)
+static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
+							 struct drm_atomic_state *old_state)
 {
-	struct simpledrm_device *sdev = simpledrm_device_of_dev(pipe->crtc.dev);
+	struct drm_plane_state *plane_state = plane->state;
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(old_state, plane);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
-	struct drm_framebuffer *fb = plane_state->fb;
 	void *vmap = shadow_plane_state->data[0].vaddr; /* TODO: Use mapping abstraction */
-	struct drm_device *dev = &sdev->dev;
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_device *dev = plane->dev;
+	struct simpledrm_device *sdev = simpledrm_device_of_dev(dev);
 	void __iomem *dst = sdev->screen_base;
 	struct drm_rect src_clip, dst_clip;
 	int idx;
@@ -545,7 +518,8 @@ simpledrm_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	if (!fb)
 		return;
 
-	drm_rect_fp_to_int(&src_clip, &plane_state->src);
+	if (!drm_atomic_helper_damage_merged(old_plane_state, plane_state, &src_clip))
+		return;
 
 	dst_clip = plane_state->dst;
 	if (!drm_rect_intersect(&dst_clip, &src_clip))
@@ -560,11 +534,11 @@ simpledrm_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	drm_dev_exit(idx);
 }
 
-static void
-simpledrm_simple_display_pipe_disable(struct drm_simple_display_pipe *pipe)
+static void simpledrm_primary_plane_helper_atomic_disable(struct drm_plane *plane,
+							  struct drm_atomic_state *old_state)
 {
-	struct simpledrm_device *sdev = simpledrm_device_of_dev(pipe->crtc.dev);
-	struct drm_device *dev = &sdev->dev;
+	struct drm_device *dev = plane->dev;
+	struct simpledrm_device *sdev = simpledrm_device_of_dev(dev);
 	int idx;
 
 	if (!drm_dev_enter(dev, &idx))
@@ -576,46 +550,120 @@ simpledrm_simple_display_pipe_disable(struct drm_simple_display_pipe *pipe)
 	drm_dev_exit(idx);
 }
 
-static void
-simpledrm_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
-				     struct drm_plane_state *old_plane_state)
+static const struct drm_plane_helper_funcs simpledrm_primary_plane_helper_funcs = {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check = simpledrm_primary_plane_helper_atomic_check,
+	.atomic_update = simpledrm_primary_plane_helper_atomic_update,
+	.atomic_disable = simpledrm_primary_plane_helper_atomic_disable,
+};
+
+static const struct drm_plane_funcs simpledrm_primary_plane_funcs = {
+	.update_plane = drm_atomic_helper_update_plane,
+	.disable_plane = drm_atomic_helper_disable_plane,
+	.destroy = drm_plane_cleanup,
+	DRM_GEM_SHADOW_PLANE_FUNCS,
+};
+
+static enum drm_mode_status simpledrm_crtc_helper_mode_valid(struct drm_crtc *crtc,
+							     const struct drm_display_mode *mode)
 {
-	struct simpledrm_device *sdev = simpledrm_device_of_dev(pipe->crtc.dev);
-	struct drm_plane_state *plane_state = pipe->plane.state;
-	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
-	void *vmap = shadow_plane_state->data[0].vaddr; /* TODO: Use mapping abstraction */
-	struct drm_framebuffer *fb = plane_state->fb;
-	struct drm_device *dev = &sdev->dev;
-	void __iomem *dst = sdev->screen_base;
-	struct drm_rect src_clip, dst_clip;
-	int idx;
+	struct simpledrm_device *sdev = simpledrm_device_of_dev(crtc->dev);
 
-	if (!fb)
-		return;
+	if (mode->hdisplay != sdev->mode.hdisplay &&
+	    mode->vdisplay != sdev->mode.vdisplay)
+		return MODE_ONE_SIZE;
+	else if (mode->hdisplay != sdev->mode.hdisplay)
+		return MODE_ONE_WIDTH;
+	else if (mode->vdisplay != sdev->mode.vdisplay)
+		return MODE_ONE_HEIGHT;
 
-	if (!drm_atomic_helper_damage_merged(old_plane_state, plane_state, &src_clip))
-		return;
+	return MODE_OK;
+}
 
-	dst_clip = plane_state->dst;
-	if (!drm_rect_intersect(&dst_clip, &src_clip))
-		return;
+static int simpledrm_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					      struct drm_atomic_state *new_state)
+{
+	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(new_state, crtc);
+	int ret;
 
-	if (!drm_dev_enter(dev, &idx))
-		return;
+	ret = drm_atomic_helper_check_crtc_state(new_crtc_state, false);
+	if (ret)
+		return ret;
 
-	dst += drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip);
-	drm_fb_blit_toio(dst, sdev->pitch, sdev->format->format, vmap, fb, &src_clip);
+	return drm_atomic_add_affected_planes(new_state, crtc);
+}
 
-	drm_dev_exit(idx);
+static void simpledrm_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+						struct drm_atomic_state *old_state)
+{
+	/*
+	 * Always enabled; screen updates are performed by
+	 * the primary plane's atomic_update function.
+	 */
+}
+
+static void simpledrm_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+						 struct drm_atomic_state *old_state)
+{
+	/*
+	 * Always enabled; disabling clears the screen in the
+	 * primary plane's atomic_disable function.
+	 */
+}
+
+static const struct drm_crtc_helper_funcs simpledrm_crtc_helper_funcs = {
+	.mode_valid = simpledrm_crtc_helper_mode_valid,
+	.atomic_check = simpledrm_crtc_helper_atomic_check,
+	.atomic_enable = simpledrm_crtc_helper_atomic_enable,
+	.atomic_disable = simpledrm_crtc_helper_atomic_disable,
+};
+
+static const struct drm_crtc_funcs simpledrm_crtc_funcs = {
+	.reset = drm_atomic_helper_crtc_reset,
+	.destroy = drm_crtc_cleanup,
+	.set_config = drm_atomic_helper_set_config,
+	.page_flip = drm_atomic_helper_page_flip,
+	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_encoder_funcs simpledrm_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+static int simpledrm_connector_helper_get_modes(struct drm_connector *connector)
+{
+	struct simpledrm_device *sdev = simpledrm_device_of_dev(connector->dev);
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &sdev->mode);
+	if (!mode)
+		return 0;
+
+	if (mode->name[0] == '\0')
+		drm_mode_set_name(mode);
+
+	mode->type |= DRM_MODE_TYPE_PREFERRED;
+	drm_mode_probed_add(connector, mode);
+
+	if (mode->width_mm)
+		connector->display_info.width_mm = mode->width_mm;
+	if (mode->height_mm)
+		connector->display_info.height_mm = mode->height_mm;
+
+	return 1;
 }
 
-static const struct drm_simple_display_pipe_funcs
-simpledrm_simple_display_pipe_funcs = {
-	.mode_valid = simpledrm_simple_display_pipe_mode_valid,
-	.enable = simpledrm_simple_display_pipe_enable,
-	.disable = simpledrm_simple_display_pipe_disable,
-	.update = simpledrm_simple_display_pipe_update,
-	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
+static const struct drm_connector_helper_funcs simpledrm_connector_helper_funcs = {
+	.get_modes = simpledrm_connector_helper_get_modes,
+};
+
+static const struct drm_connector_funcs simpledrm_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 static const struct drm_mode_config_funcs simpledrm_mode_config_funcs = {
@@ -653,10 +701,10 @@ static const uint32_t *simpledrm_device_formats(struct simpledrm_device *sdev,
 	sdev->nformats = 1;
 
 	/* default formats go second */
-	for (i = 0; i < ARRAY_SIZE(simpledrm_default_formats); ++i) {
-		if (simpledrm_default_formats[i] == sdev->format->format)
+	for (i = 0; i < ARRAY_SIZE(simpledrm_primary_plane_formats); ++i) {
+		if (simpledrm_primary_plane_formats[i] == sdev->format->format)
 			continue; /* native format already went first */
-		sdev->formats[sdev->nformats] = simpledrm_default_formats[i];
+		sdev->formats[sdev->nformats] = simpledrm_primary_plane_formats[i];
 		sdev->nformats++;
 	}
 
@@ -689,8 +737,10 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	const struct drm_format_info *format;
 	struct resource *res, *mem;
 	void __iomem *screen_base;
+	struct drm_plane *primary_plane;
+	struct drm_crtc *crtc;
+	struct drm_encoder *encoder;
 	struct drm_connector *connector;
-	struct drm_simple_display_pipe *pipe;
 	unsigned long max_width, max_height;
 	const uint32_t *formats;
 	size_t nformats;
@@ -802,6 +852,40 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	dev->mode_config.preferred_depth = format->cpp[0] * 8;
 	dev->mode_config.funcs = &simpledrm_mode_config_funcs;
 
+	/* Primary plane */
+
+	formats = simpledrm_device_formats(sdev, &nformats);
+
+	primary_plane = &sdev->primary_plane;
+	ret = drm_universal_plane_init(dev, primary_plane, 0, &simpledrm_primary_plane_funcs,
+				       formats, nformats,
+				       simpledrm_primary_plane_format_modifiers,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+	drm_plane_helper_add(primary_plane, &simpledrm_primary_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(primary_plane);
+
+	/* CRTC */
+
+	crtc = &sdev->crtc;
+	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
+					&simpledrm_crtc_funcs, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+	drm_crtc_helper_add(crtc, &simpledrm_crtc_helper_funcs);
+
+	/* Encoder */
+
+	encoder = &sdev->encoder;
+	ret = drm_encoder_init(dev, encoder, &simpledrm_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	/* Connector */
+
 	connector = &sdev->connector;
 	ret = drm_connector_init(dev, connector, &simpledrm_connector_funcs,
 				 DRM_MODE_CONNECTOR_Unknown);
@@ -812,17 +896,10 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 						       DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
 						       width, height);
 
-	formats = simpledrm_device_formats(sdev, &nformats);
-
-	pipe = &sdev->pipe;
-	ret = drm_simple_display_pipe_init(dev, pipe, &simpledrm_simple_display_pipe_funcs,
-					   formats, nformats, simpledrm_format_modifiers,
-					   connector);
+	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret)
 		return ERR_PTR(ret);
 
-	drm_plane_enable_fb_damage_clips(&pipe->plane);
-
 	drm_mode_config_reset(dev);
 
 	return sdev;
-- 
2.36.1

