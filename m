Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA2657B88F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 16:31:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnynY5lBxz3dqg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 00:31:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=B8u1dwz1;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=5WRX5S6L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=B8u1dwz1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=5WRX5S6L;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lnyhw5zzlz3bdK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 00:27:44 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1DEAE20151;
	Wed, 20 Jul 2022 14:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1658327256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HcM1TyenBIZW16ak+Xu3LhPRX5q3T7h/+L0HPlZ4uu8=;
	b=B8u1dwz1Fua/vbKf6SUVc5xMZdMCE1stKPcVKDEi7lfKepxFfZl6tCBEjewSMznz51W8dw
	I6GHdW1gQSAMmXIRL/sVQAxAOw5sxh83Z//gHmJ1PiMBMrnqUEAp4UeT3xJHWeTulSoqal
	P/IoYeF8I3+5tbXGP/l/QUWa6VYUsTQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1658327256;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HcM1TyenBIZW16ak+Xu3LhPRX5q3T7h/+L0HPlZ4uu8=;
	b=5WRX5S6LfvnRAHZUdzLioN2xfuvj8VHQ88LCC3oesI7eEuFBam0pedKMEVsgrfKDscYeir
	D4HaNNUvw0GZvSBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C394D13ABB;
	Wed, 20 Jul 2022 14:27:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8CvnLtcQ2GLfHgAAMHmgww
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
Subject: [PATCH v2 06/10] drm/simpledrm: Move some functionality into fwfb helper library
Date: Wed, 20 Jul 2022 16:27:28 +0200
Message-Id: <20220720142732.32041-7-tzimmermann@suse.de>
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

Move some of simpledrm's functionality into a helper library. Other
drivers for firmware-provided framebuffers will also need functions
to handle fixed modes and color formats, or update the back buffer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/gpu/drm-kms-helpers.rst |  12 +
 MAINTAINERS                           |   2 +
 drivers/gpu/drm/Kconfig               |   6 +
 drivers/gpu/drm/Makefile              |   3 +-
 drivers/gpu/drm/drm_fwfb_helper.c     | 301 ++++++++++++++++++++++++++
 drivers/gpu/drm/tiny/Kconfig          |   1 +
 drivers/gpu/drm/tiny/simpledrm.c      | 163 ++------------
 include/drm/drm_fwfb_helper.h         |  51 +++++
 8 files changed, 398 insertions(+), 141 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_fwfb_helper.c
 create mode 100644 include/drm/drm_fwfb_helper.h

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 2d473bc64c9f..0a8815b4243e 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -421,6 +421,18 @@ OF/DT Helpers
 .. kernel-doc:: drivers/gpu/drm/drm_of.c
    :export:
 
+Firmware Framebuffer Helper Reference
+=====================================
+
+.. kernel-doc:: drivers/gpu/drm/drm_fwfb_helper.c
+   :doc: overview
+
+.. kernel-doc:: include/drm/drm_fwfb_helper.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/drm_fwfb_helper.c
+   :export:
+
 Legacy Plane Helper Reference
 =============================
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 0f9366144d31..138680415e79 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6572,9 +6572,11 @@ L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	drivers/gpu/drm/drm_aperture.c
+F:	drivers/gpu/drm/drm_fwfb_helper.c
 F:	drivers/gpu/drm/tiny/simpledrm.c
 F:	drivers/video/aperture.c
 F:	include/drm/drm_aperture.h
+F:	include/drm/drm_fwfb_helper.h
 F:	include/linux/aperture.h
 
 DRM DRIVER FOR SIS VIDEO CARDS
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 1c91e1e861a5..47a82705e052 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -78,6 +78,12 @@ config DRM_KMS_HELPER
 	help
 	  CRTC helpers for KMS drivers.
 
+config DRM_FWFB_HELPER
+	bool
+	depends on DRM_KMS_HELPER
+	help
+	  Helpers for firmware-provided framebuffers.
+
 config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
         bool "Enable refcount backtrace history in the DP MST helpers"
 	depends on STACKTRACE_SUPPORT
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 25016dcab55e..be51018a3cbf 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -67,8 +67,9 @@ drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o \
 		drm_gem_framebuffer_helper.o \
 		drm_atomic_state_helper.o drm_damage_helper.o \
 		drm_format_helper.o drm_self_refresh_helper.o drm_rect.o
-drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
 drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
+drm_kms_helper-$(CONFIG_DRM_FWFB_HELPER) += drm_fwfb_helper.o
+drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
 obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
 
 #
diff --git a/drivers/gpu/drm/drm_fwfb_helper.c b/drivers/gpu/drm/drm_fwfb_helper.c
new file mode 100644
index 000000000000..522294f459c8
--- /dev/null
+++ b/drivers/gpu/drm/drm_fwfb_helper.c
@@ -0,0 +1,301 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_format_helper.h>
+#include <drm/drm_fwfb_helper.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_plane_helper.h>
+#include <drm/drm_print.h>
+
+/**
+ * DOC: overview
+ *
+ * The Firmware Framebuffer library FWFB provides helpers for devices with
+ * fixed-mode backing storage. It helps drivers to export a display mode of
+ * te correct size and copy updates to the backing storage.
+ */
+
+/*
+ * Assume a monitor resolution of 96 dpi to
+ * get a somewhat reasonable screen size.
+ */
+#define RES_MM(d)	\
+	(((d) * 254ul) / (96ul * 10ul))
+
+#define DRM_FWFB_MODE(hd, vd)	\
+	DRM_SIMPLE_MODE(hd, vd, RES_MM(hd), RES_MM(vd))
+
+static struct drm_display_mode drm_fwfb_mode(unsigned int width, unsigned int height)
+{
+	struct drm_display_mode mode = { DRM_FWFB_MODE(width, height) };
+
+	mode.clock = mode.hdisplay * mode.vdisplay * 60 / 1000 /* kHz */;
+	drm_mode_set_name(&mode);
+
+	return mode;
+}
+
+/**
+ * drm_fwfb_init - Initializes an fwfb buffer
+ * @fwfb: fwfb buffer
+ * @screen_base: Address of the backing buffer in kernel address space
+ * @width: Number of pixels per scanline
+ * @height: Number of scanlines
+ * @format: Color format
+ * @pitch: Distance between two consecutive scanlines in bytes
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
+ */
+int drm_fwfb_init(struct drm_fwfb *fwfb, struct iosys_map *screen_base,
+		  unsigned int width, unsigned int height,
+		  const struct drm_format_info *format, unsigned int pitch)
+{
+	fwfb->screen_base = *screen_base;
+	fwfb->mode = drm_fwfb_mode(width, height);
+	fwfb->format = format;
+	fwfb->pitch = pitch;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_fwfb_init);
+
+static bool is_listed_fourcc(const uint32_t *fourccs, size_t nfourccs, uint32_t fourcc)
+{
+	const uint32_t *fourccs_end = fourccs + nfourccs;
+
+	while (fourccs < fourccs_end) {
+		if (*fourccs == fourcc)
+			return true;
+		++fourccs;
+	}
+	return false;
+}
+
+/**
+ * drm_fwfb_extra_formats - Filters a list of supported color formats against
+ *                          the device's native formats
+ * @dev: DRM device
+ * @native_fourccs: 4CC codes of natively supported color formats
+ * @native_nfourccs: The number of entries in @native_fourccs
+ * @extra_fourccs: 4CC codes of additionally supported color formats
+ * @extra_nfourccs: The number of entries in @extra_fourccs
+ * @fourccs_out: Returns 4CC codes of supported color formats
+ * @nfourccs_out: The number of available entries in @fourccs_out
+ *
+ * This function create a list of supported color format from the device's
+ * native formats and the driver's emulated formats. The returned list can
+ * be handed over to drm_universal_plane_init() et al.
+ *
+ * Returns:
+ * The number of color formats returned in @fourccs_out.
+ */
+size_t drm_fwfb_extra_formats(struct drm_device *dev,
+			      const uint32_t *native_fourccs, size_t native_nfourccs,
+			      const uint32_t *extra_fourccs, size_t extra_nfourccs,
+			      uint32_t *fourccs_out, size_t nfourccs_out)
+{
+	uint32_t *fourccs = fourccs_out;
+	const uint32_t *fourccs_end = fourccs_out + nfourccs_out;
+	bool found_native = false;
+	size_t nfourccs, i;
+
+	/* native formats go first */
+
+	nfourccs = min_t(size_t, native_nfourccs, nfourccs_out);
+
+	for (i = 0; i < nfourccs; ++i) {
+		uint32_t fourcc = native_fourccs[i];
+
+		drm_dbg_kms(dev, "adding native format %p4cc\n", &fourcc);
+
+		if (!found_native)
+			found_native = is_listed_fourcc(extra_fourccs, extra_nfourccs, fourcc);
+		*fourccs = fourcc;
+		++fourccs;
+	}
+
+	/*
+	 * The plane's atomic_update helper converts the framebuffer's color format
+	 * to the native format when copying them to device memory.
+	 *
+	 * If there is not a single format supported by both, device and
+	 * plane, the native formats are likely not supported by the conversion
+	 * helpers. Therefore *only* support the native formats and add a
+	 * conversion helper ASAP.
+	 */
+	if (!found_native) {
+		drm_warn(dev, "format conversion helpers required to add extra formats\n");
+		goto out;
+	}
+
+	/* extra formats go second */
+
+	nfourccs = min_t(size_t, extra_nfourccs, fourccs_end - fourccs);
+
+	for (i = 0; i < nfourccs; ++i) {
+		uint32_t fourcc = extra_fourccs[i];
+
+		if (is_listed_fourcc(native_fourccs, native_nfourccs, fourcc))
+			continue; /* native formats already went first */
+		*fourccs = fourcc;
+		++fourccs;
+	}
+
+out:
+	return fourccs - fourccs_out;
+}
+EXPORT_SYMBOL(drm_fwfb_extra_formats);
+
+/*
+ * Plane
+ */
+
+/**
+ * drm_fwfb_plane_helper_atomic_update - Helper for implementing atomic plane updates
+ * @fwfb: fwfb buffer
+ * @plane: the plane to update
+ * @old_state: the old state
+ *
+ * This function updates the plane's damaged areas in the fwfb buffer.
+ */
+void drm_fwfb_plane_helper_atomic_update(struct drm_fwfb *fwfb, struct drm_plane *plane,
+					 struct drm_atomic_state *old_state)
+{
+	struct drm_device *dev = plane->dev;
+	struct iosys_map dst = fwfb->screen_base;
+	struct drm_plane_state *plane_state = plane->state;
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(old_state, plane);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	void *vmap = shadow_plane_state->data[0].vaddr; /* TODO: Use mapping abstraction */
+	struct drm_framebuffer *fb = plane_state->fb;
+	void __iomem *dst_vmap = dst.vaddr_iomem; /* TODO: Use mapping abstraction */
+	unsigned int dst_pitch = fwfb->pitch;
+	const struct drm_format_info *dst_format = fwfb->format;
+	struct drm_rect src_clip, dst_clip;
+	int idx;
+
+	if (!fb)
+		return;
+
+	if (!drm_atomic_helper_damage_merged(old_plane_state, plane_state, &src_clip))
+		return;
+
+	dst_clip = plane_state->dst;
+	if (!drm_rect_intersect(&dst_clip, &src_clip))
+		return;
+
+	if (!drm_dev_enter(dev, &idx))
+		return;
+
+	dst_vmap += drm_fb_clip_offset(dst_pitch, dst_format, &dst_clip);
+	drm_fb_blit_toio(dst_vmap, dst_pitch, dst_format->format, vmap, fb, &src_clip);
+
+	drm_dev_exit(idx);
+}
+EXPORT_SYMBOL(drm_fwfb_plane_helper_atomic_update);
+
+/**
+ * drm_fwfb_plane_helper_atomic_disable - Helper for disabling planes
+ * @fwfb: fwfb buffer
+ * @plane: the plane to disable
+ * @old_state: the old state
+ *
+ * This function clears the plane's fwfb buffer to zero.
+ */
+void drm_fwfb_plane_helper_atomic_disable(struct drm_fwfb *fwfb, struct drm_plane *plane,
+					  struct drm_atomic_state *old_state)
+{
+	struct drm_device *dev = plane->dev;
+	struct iosys_map dst = fwfb->screen_base;
+	struct drm_plane_state *plane_state = plane->state;
+	void __iomem *dst_vmap = dst.vaddr_iomem; /* TODO: Use mapping abstraction */
+	unsigned int dst_pitch = fwfb->pitch;
+	const struct drm_format_info *dst_format = fwfb->format;
+	struct drm_rect dst_clip;
+	unsigned long lines, linepixels, i;
+	int idx;
+
+	drm_rect_init(&dst_clip, plane_state->src_x >> 16, plane_state->src_y >> 16,
+		      plane_state->src_w >> 16, plane_state->src_h >> 16);
+	lines = drm_rect_height(&dst_clip);
+	linepixels = drm_rect_width(&dst_clip);
+
+	if (!drm_dev_enter(dev, &idx))
+		return;
+
+	/* Clear buffer to black if disabled */
+	dst_vmap += drm_fb_clip_offset(dst_pitch, dst_format, &dst_clip);
+	for (i = 0; i < lines; ++i) {
+		memset_io(dst_vmap, 0, linepixels * dst_format->cpp[0]);
+		dst_vmap += dst_pitch;
+	}
+
+	drm_dev_exit(idx);
+}
+EXPORT_SYMBOL(drm_fwfb_plane_helper_atomic_disable);
+
+/*
+ * CRTC
+ */
+
+/**
+ * drm_fwfb_crtc_helper_mode_valid - Validates a display mode
+ * @fwfb: fwfb buffer
+ * @crtc: the crtc
+ * @mode: the mode to validate
+ */
+enum drm_mode_status drm_fwfb_crtc_helper_mode_valid(struct drm_fwfb *fwfb, struct drm_crtc *crtc,
+						     const struct drm_display_mode *mode)
+{
+
+	if (mode->hdisplay != fwfb->mode.hdisplay && mode->vdisplay != fwfb->mode.vdisplay)
+		return MODE_ONE_SIZE;
+	else if (mode->hdisplay != fwfb->mode.hdisplay)
+		return MODE_ONE_WIDTH;
+	else if (mode->vdisplay != fwfb->mode.vdisplay)
+		return MODE_ONE_HEIGHT;
+
+	return MODE_OK;
+}
+EXPORT_SYMBOL(drm_fwfb_crtc_helper_mode_valid);
+
+/*
+ * Connector
+ */
+
+/**
+ * drm_fwfb_connector_helper_get_modes - Creates a list of display modes for a connector
+ * @fwfb: fwfb buffer
+ * @connector: the connector
+ *
+ * This function creates a list of display modes for a connector.
+ *
+ * Returns:
+ * The number of created modes.
+ */
+int drm_fwfb_connector_helper_get_modes(struct drm_fwfb *fwfb, struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &fwfb->mode);
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
+}
+EXPORT_SYMBOL(drm_fwfb_connector_helper_get_modes);
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 027cd87c3d0d..f3d6e4713dc6 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -70,6 +70,7 @@ config DRM_SIMPLEDRM
 	tristate "Simple framebuffer driver"
 	depends on DRM && MMU
 	select APERTURE_HELPERS
+	select DRM_FWFB_HELPER
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
 	help
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 727ab9d86bcc..e2bf2f8abc74 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -16,6 +16,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_format_helper.h>
+#include <drm/drm_fwfb_helper.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
@@ -30,16 +31,6 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
-/*
- * Assume a monitor resolution of 96 dpi to
- * get a somewhat reasonable screen size.
- */
-#define RES_MM(d)	\
-	(((d) * 254ul) / (96ul * 10ul))
-
-#define SIMPLEDRM_MODE(hd, vd)	\
-	DRM_SIMPLE_MODE(hd, vd, RES_MM(hd), RES_MM(vd))
-
 /*
  * Helpers for simplefb
  */
@@ -211,13 +202,8 @@ struct simpledrm_device {
 	struct regulator **regulators;
 #endif
 
-	/* simplefb settings */
-	struct drm_display_mode mode;
-	const struct drm_format_info *format;
-	unsigned int pitch;
-
-	/* memory management */
-	void __iomem *screen_base;
+	/* firmware framebuffer */
+	struct drm_fwfb fwfb;
 
 	/* modesetting */
 	uint32_t formats[8];
@@ -504,50 +490,17 @@ static int simpledrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
 static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
 							 struct drm_atomic_state *old_state)
 {
-	struct drm_plane_state *plane_state = plane->state;
-	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(old_state, plane);
-	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
-	void *vmap = shadow_plane_state->data[0].vaddr; /* TODO: Use mapping abstraction */
-	struct drm_framebuffer *fb = plane_state->fb;
-	struct drm_device *dev = plane->dev;
-	struct simpledrm_device *sdev = simpledrm_device_of_dev(dev);
-	void __iomem *dst = sdev->screen_base;
-	struct drm_rect src_clip, dst_clip;
-	int idx;
-
-	if (!fb)
-		return;
-
-	if (!drm_atomic_helper_damage_merged(old_plane_state, plane_state, &src_clip))
-		return;
-
-	dst_clip = plane_state->dst;
-	if (!drm_rect_intersect(&dst_clip, &src_clip))
-		return;
-
-	if (!drm_dev_enter(dev, &idx))
-		return;
-
-	dst += drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip);
-	drm_fb_blit_toio(dst, sdev->pitch, sdev->format->format, vmap, fb, &src_clip);
-
-	drm_dev_exit(idx);
+	struct simpledrm_device *sdev = simpledrm_device_of_dev(plane->dev);
+
+	drm_fwfb_plane_helper_atomic_update(&sdev->fwfb, plane, old_state);
 }
 
 static void simpledrm_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 							  struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = plane->dev;
-	struct simpledrm_device *sdev = simpledrm_device_of_dev(dev);
-	int idx;
-
-	if (!drm_dev_enter(dev, &idx))
-		return;
-
-	/* Clear screen to black if disabled */
-	memset_io(sdev->screen_base, 0, sdev->pitch * sdev->mode.vdisplay);
+	struct simpledrm_device *sdev = simpledrm_device_of_dev(plane->dev);
 
-	drm_dev_exit(idx);
+	drm_fwfb_plane_helper_atomic_disable(&sdev->fwfb, plane, old_state);
 }
 
 static const struct drm_plane_helper_funcs simpledrm_primary_plane_helper_funcs = {
@@ -569,15 +522,7 @@ static enum drm_mode_status simpledrm_crtc_helper_mode_valid(struct drm_crtc *cr
 {
 	struct simpledrm_device *sdev = simpledrm_device_of_dev(crtc->dev);
 
-	if (mode->hdisplay != sdev->mode.hdisplay &&
-	    mode->vdisplay != sdev->mode.vdisplay)
-		return MODE_ONE_SIZE;
-	else if (mode->hdisplay != sdev->mode.hdisplay)
-		return MODE_ONE_WIDTH;
-	else if (mode->vdisplay != sdev->mode.vdisplay)
-		return MODE_ONE_HEIGHT;
-
-	return MODE_OK;
+	return drm_fwfb_crtc_helper_mode_valid(&sdev->fwfb, crtc, mode);
 }
 
 static int simpledrm_crtc_helper_atomic_check(struct drm_crtc *crtc,
@@ -634,24 +579,8 @@ static const struct drm_encoder_funcs simpledrm_encoder_funcs = {
 static int simpledrm_connector_helper_get_modes(struct drm_connector *connector)
 {
 	struct simpledrm_device *sdev = simpledrm_device_of_dev(connector->dev);
-	struct drm_display_mode *mode;
-
-	mode = drm_mode_duplicate(connector->dev, &sdev->mode);
-	if (!mode)
-		return 0;
-
-	if (mode->name[0] == '\0')
-		drm_mode_set_name(mode);
-
-	mode->type |= DRM_MODE_TYPE_PREFERRED;
-	drm_mode_probed_add(connector, mode);
 
-	if (mode->width_mm)
-		connector->display_info.width_mm = mode->width_mm;
-	if (mode->height_mm)
-		connector->display_info.height_mm = mode->height_mm;
-
-	return 1;
+	return drm_fwfb_connector_helper_get_modes(&sdev->fwfb, connector);
 }
 
 static const struct drm_connector_helper_funcs simpledrm_connector_helper_funcs = {
@@ -676,56 +605,6 @@ static const struct drm_mode_config_funcs simpledrm_mode_config_funcs = {
  * Init / Cleanup
  */
 
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
-static const uint32_t *simpledrm_device_formats(struct simpledrm_device *sdev,
-						size_t *nformats_out)
-{
-	struct drm_device *dev = &sdev->dev;
-	size_t i;
-
-	if (sdev->nformats)
-		goto out; /* don't rebuild list on recurring calls */
-
-	/* native format goes first */
-	sdev->formats[0] = sdev->format->format;
-	sdev->nformats = 1;
-
-	/* default formats go second */
-	for (i = 0; i < ARRAY_SIZE(simpledrm_primary_plane_formats); ++i) {
-		if (simpledrm_primary_plane_formats[i] == sdev->format->format)
-			continue; /* native format already went first */
-		sdev->formats[sdev->nformats] = simpledrm_primary_plane_formats[i];
-		sdev->nformats++;
-	}
-
-	/*
-	 * TODO: The simpledrm driver converts framebuffers to the native
-	 * format when copying them to device memory. If there are more
-	 * formats listed than supported by the driver, the native format
-	 * is not supported by the conversion helpers. Therefore *only*
-	 * support the native format and add a conversion helper ASAP.
-	 */
-	if (drm_WARN_ONCE(dev, i != sdev->nformats,
-			  "format conversion helpers required for %p4cc",
-			  &sdev->format->format)) {
-		sdev->nformats = 1;
-	}
-
-out:
-	*nformats_out = sdev->nformats;
-	return sdev->formats;
-}
-
 static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 							struct platform_device *pdev)
 {
@@ -737,12 +616,13 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	const struct drm_format_info *format;
 	struct resource *res, *mem;
 	void __iomem *screen_base;
+	struct iosys_map screen_base_vmap;
+	struct drm_fwfb *fwfb;
 	struct drm_plane *primary_plane;
 	struct drm_crtc *crtc;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
 	unsigned long max_width, max_height;
-	const uint32_t *formats;
 	size_t nformats;
 	int ret;
 
@@ -796,11 +676,6 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	if (!stride)
 		stride = format->cpp[0] * width;
 
-	sdev->mode = simpledrm_mode(width, height);
-	sdev->format = format;
-	sdev->pitch = stride;
-
-	drm_dbg(dev, "display mode={" DRM_MODE_FMT "}\n", DRM_MODE_ARG(&sdev->mode));
 	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, stride=%d byte\n",
 		&format->format, width, height, stride);
 
@@ -832,12 +707,17 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	screen_base = devm_ioremap_wc(&pdev->dev, mem->start, resource_size(mem));
 	if (!screen_base)
 		return ERR_PTR(-ENOMEM);
-	sdev->screen_base = screen_base;
+	iosys_map_set_vaddr_iomem(&screen_base_vmap, screen_base);
 
 	/*
 	 * Modesetting
 	 */
 
+	fwfb = &sdev->fwfb;
+	ret = drm_fwfb_init(fwfb, &screen_base_vmap, width, height, format, stride);
+	if (ret)
+		return ERR_PTR(ret);
+
 	ret = drmm_mode_config_init(dev);
 	if (ret)
 		return ERR_PTR(ret);
@@ -854,11 +734,14 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 
 	/* Primary plane */
 
-	formats = simpledrm_device_formats(sdev, &nformats);
+	nformats = drm_fwfb_extra_formats(dev, &format->format, 1,
+					  simpledrm_primary_plane_formats,
+					  ARRAY_SIZE(simpledrm_primary_plane_formats),
+					  sdev->formats, ARRAY_SIZE(sdev->formats));
 
 	primary_plane = &sdev->primary_plane;
 	ret = drm_universal_plane_init(dev, primary_plane, 0, &simpledrm_primary_plane_funcs,
-				       formats, nformats,
+				       sdev->formats, nformats,
 				       simpledrm_primary_plane_format_modifiers,
 				       DRM_PLANE_TYPE_PRIMARY, NULL);
 	if (ret)
diff --git a/include/drm/drm_fwfb_helper.h b/include/drm/drm_fwfb_helper.h
new file mode 100644
index 000000000000..2ad674e6564f
--- /dev/null
+++ b/include/drm/drm_fwfb_helper.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __DRM_FWFB_HELPER_H__
+#define __DRM_FWFB_HELPER_H__
+
+#include <linux/iosys-map.h>
+
+#include <drm/drm_modes.h>
+
+/**
+ * struct drm_fwfb - Represents fixed-mode backing storage
+ */
+struct drm_fwfb {
+	/**
+	 * @screen_base: Address of the screen memory
+	 */
+	struct iosys_map screen_base;
+	/**
+	 * @mode: Display mode
+	 */
+	struct drm_display_mode mode;
+	/**
+	 * @format: Color format
+	 */
+	const struct drm_format_info *format;
+	/**
+	 * @pitch: Distance between two consecutive scanlines in bytes
+	 */
+	unsigned int pitch;
+};
+
+int drm_fwfb_init(struct drm_fwfb *fwfb, struct iosys_map *screen_base,
+		  unsigned int width, unsigned int height,
+		  const struct drm_format_info *format, unsigned int pitch);
+
+size_t drm_fwfb_extra_formats(struct drm_device *dev,
+			      const uint32_t *native_fourccs, size_t native_nfourccs,
+			      const uint32_t *extra_fourccs, size_t extra_nfourccs,
+			      uint32_t *fourccs_out, size_t nfourccs_out);
+
+void drm_fwfb_plane_helper_atomic_update(struct drm_fwfb *fwfb, struct drm_plane *plane,
+					 struct drm_atomic_state *state);
+void drm_fwfb_plane_helper_atomic_disable(struct drm_fwfb *fwfb, struct drm_plane *plane,
+					  struct drm_atomic_state *state);
+
+enum drm_mode_status drm_fwfb_crtc_helper_mode_valid(struct drm_fwfb *fwfb, struct drm_crtc *crtc,
+						     const struct drm_display_mode *mode);
+
+int drm_fwfb_connector_helper_get_modes(struct drm_fwfb *fwfb, struct drm_connector *connector);
+
+#endif
-- 
2.36.1

