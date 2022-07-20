Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5A857B897
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 16:34:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnyrS63S2z3fTQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 00:34:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DIDOCowv;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=d0AC5CW+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DIDOCowv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=d0AC5CW+;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lnyj03Nzdz3bl7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 00:27:48 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8272835021;
	Wed, 20 Jul 2022 14:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1658327257; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oeQDMoXrJcaQf78V1izqW+LNkllTNRER/MG1oqngfiQ=;
	b=DIDOCowvtbRhptyfG+k4evpB8z+R3IWPE2+fU+Ybq4xoT47xdrLh6HiD+p62MvG033os2p
	XHn8lJM7cip6YJqWiyq/cVRQHoOyrH1WtZ3QEk0USi4SlxxgBiN6cCEUkjRzaYMUbu95tA
	YhFlSZDR8XYNl5UDYKbRS8yK3WWJLh4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1658327257;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oeQDMoXrJcaQf78V1izqW+LNkllTNRER/MG1oqngfiQ=;
	b=d0AC5CW+ErKZ/sWukp0EWM25l7LsYMjcr5zgdXun3ZQaFdM+7mjX7zrajV7FJDZBFlBisi
	kz5pq3H7albweNAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E1CD13ABB;
	Wed, 20 Jul 2022 14:27:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id qO5oCtkQ2GLfHgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 20 Jul 2022 14:27:37 +0000
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
Subject: [PATCH v2 10/10] drm/ofdrm: Support color management
Date: Wed, 20 Jul 2022 16:27:32 +0200
Message-Id: <20220720142732.32041-11-tzimmermann@suse.de>
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

Support the CRTC's color-management property and implement each model's
palette support.

The OF hardware has different methods of setting the palette. The
respective code has been taken from fbdev's offb and refactored into
per-model device functions. The device functions integrate this
functionality into the overall modesetting.

As palette handling is a CRTC property that depends on the primary
plane's color format, the plane's atomic_check helper now updates the
format field in ofdrm's custom CRTC state. The CRTC's atomic_flush
helper updates the palette for the format as needed.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/ofdrm.c | 434 ++++++++++++++++++++++++++++++++++-
 1 file changed, 433 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 62136b8ab975..2964eb9951c5 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -13,6 +13,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_format_helper.h>
+#include <drm/drm_framebuffer.h>
 #include <drm/drm_fwfb_helper.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -29,6 +30,44 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
+#if !defined(CONFIG_PPC)
+static inline void out_8(void __iomem *addr, int val)
+{ }
+static inline void out_le32(void __iomem *addr, int val)
+{ }
+static inline unsigned int in_le32(const void __iomem *addr)
+{
+	return 0;
+}
+#endif
+
+#define OFDRM_GAMMA_LUT_SIZE	256
+
+/* Definitions used by the Avivo palette  */
+#define AVIVO_DC_LUT_RW_SELECT                  0x6480
+#define AVIVO_DC_LUT_RW_MODE                    0x6484
+#define AVIVO_DC_LUT_RW_INDEX                   0x6488
+#define AVIVO_DC_LUT_SEQ_COLOR                  0x648c
+#define AVIVO_DC_LUT_PWL_DATA                   0x6490
+#define AVIVO_DC_LUT_30_COLOR                   0x6494
+#define AVIVO_DC_LUT_READ_PIPE_SELECT           0x6498
+#define AVIVO_DC_LUT_WRITE_EN_MASK              0x649c
+#define AVIVO_DC_LUT_AUTOFILL                   0x64a0
+#define AVIVO_DC_LUTA_CONTROL                   0x64c0
+#define AVIVO_DC_LUTA_BLACK_OFFSET_BLUE         0x64c4
+#define AVIVO_DC_LUTA_BLACK_OFFSET_GREEN        0x64c8
+#define AVIVO_DC_LUTA_BLACK_OFFSET_RED          0x64cc
+#define AVIVO_DC_LUTA_WHITE_OFFSET_BLUE         0x64d0
+#define AVIVO_DC_LUTA_WHITE_OFFSET_GREEN        0x64d4
+#define AVIVO_DC_LUTA_WHITE_OFFSET_RED          0x64d8
+#define AVIVO_DC_LUTB_CONTROL                   0x6cc0
+#define AVIVO_DC_LUTB_BLACK_OFFSET_BLUE         0x6cc4
+#define AVIVO_DC_LUTB_BLACK_OFFSET_GREEN        0x6cc8
+#define AVIVO_DC_LUTB_BLACK_OFFSET_RED          0x6ccc
+#define AVIVO_DC_LUTB_WHITE_OFFSET_BLUE         0x6cd0
+#define AVIVO_DC_LUTB_WHITE_OFFSET_GREEN        0x6cd4
+#define AVIVO_DC_LUTB_WHITE_OFFSET_RED          0x6cd8
+
 enum ofdrm_model {
 	OFDRM_MODEL_UNKNOWN,
 	OFDRM_MODEL_MACH64, /* ATI Mach64 */
@@ -209,7 +248,14 @@ static enum ofdrm_model display_get_model_of(struct drm_device *dev, struct devi
  * Open Firmware display device
  */
 
+struct ofdrm_device;
+
 struct ofdrm_device_funcs {
+	void __iomem *(*cmap_ioremap)(struct ofdrm_device *odev,
+				      struct device_node *of_node,
+				      u64 fb_bas);
+	void (*cmap_write)(struct ofdrm_device *odev, unsigned char index,
+			   unsigned char r, unsigned char g, unsigned char b);
 };
 
 struct ofdrm_device {
@@ -221,6 +267,9 @@ struct ofdrm_device {
 	/* firmware framebuffer */
 	struct drm_fwfb fwfb;
 
+	/* colormap */
+	void __iomem *cmap_base;
+
 	/* modesetting */
 	uint32_t formats[8];
 	struct drm_plane primary_plane;
@@ -333,12 +382,322 @@ static struct resource *ofdrm_find_fb_resource(struct ofdrm_device *odev,
 	return max_res;
 }
 
+/*
+ * Colormap / Palette
+ */
+
+static void __iomem *get_cmap_address_of(struct ofdrm_device *odev, struct device_node *of_node,
+					 int bar_no, unsigned long offset, unsigned long size)
+{
+	struct drm_device *dev = &odev->dev;
+	const __be32 *addr_p;
+	u64 max_size, address;
+	unsigned int flags;
+	void __iomem *mem;
+
+	addr_p = of_get_pci_address(of_node, bar_no, &max_size, &flags);
+	if (!addr_p)
+		addr_p = of_get_address(of_node, bar_no, &max_size, &flags);
+	if (!addr_p)
+		return ERR_PTR(-ENODEV);
+
+	if ((flags & (IORESOURCE_IO | IORESOURCE_MEM)) == 0)
+		return ERR_PTR(-ENODEV);
+
+	if ((offset + size) >= max_size)
+		return ERR_PTR(-ENODEV);
+
+	address = of_translate_address(of_node, addr_p);
+	if (address == OF_BAD_ADDR)
+		return ERR_PTR(-ENODEV);
+
+	mem = devm_ioremap(dev->dev, address + offset, size);
+	if (!mem)
+		return ERR_PTR(-ENOMEM);
+
+	return mem;
+}
+
+static void __iomem *ofdrm_mach64_cmap_ioremap(struct ofdrm_device *odev,
+					       struct device_node *of_node,
+					       u64 fb_base)
+{
+	struct drm_device *dev = &odev->dev;
+	u64 address;
+	void __iomem *cmap_base;
+
+	address = fb_base & 0xff000000ul;
+	address += 0x7ff000;
+
+	cmap_base = devm_ioremap(dev->dev, address, 0x1000);
+	if (!cmap_base)
+		return ERR_PTR(-ENOMEM);
+
+	return cmap_base;
+}
+
+static void ofdrm_mach64_cmap_write(struct ofdrm_device *odev, unsigned char index,
+				    unsigned char r, unsigned char g, unsigned char b)
+{
+	void __iomem *addr = odev->cmap_base + 0xcc0;
+	void __iomem *data = odev->cmap_base + 0xcc0 + 1;
+
+	writeb(index, addr);
+	writeb(r, data);
+	writeb(g, data);
+	writeb(b, data);
+}
+
+static void __iomem *ofdrm_rage128_cmap_ioremap(struct ofdrm_device *odev,
+						struct device_node *of_node,
+						u64 fb_base)
+{
+	return get_cmap_address_of(odev, of_node, 2, 0, 0x1fff);
+}
+
+static void ofdrm_rage128_cmap_write(struct ofdrm_device *odev, unsigned char index,
+				     unsigned char r, unsigned char g, unsigned char b)
+{
+	void __iomem *addr = odev->cmap_base + 0xb0;
+	void __iomem *data = odev->cmap_base + 0xb4;
+	int color = (r << 16) | (g << 8) | b;
+
+	out_8(addr, index);
+	out_le32(data, color);
+}
+
+static void __iomem *ofdrm_rage_m3a_cmap_ioremap(struct ofdrm_device *odev,
+						 struct device_node *of_node,
+						 u64 fb_base)
+{
+	return get_cmap_address_of(odev, of_node, 2, 0, 0x1fff);
+}
+
+static void ofdrm_rage_m3a_cmap_write(struct ofdrm_device *odev, unsigned char index,
+				      unsigned char r, unsigned char g, unsigned char b)
+{
+	void __iomem *dac_ctl = odev->cmap_base + 0x58;
+	void __iomem *addr = odev->cmap_base + 0xb0;
+	void __iomem *data = odev->cmap_base + 0xb4;
+	int color = (r << 16) | (g << 8) | b;
+	unsigned int val;
+
+	/* Clear PALETTE_ACCESS_CNTL in DAC_CNTL */
+	val = in_le32(dac_ctl);
+	val &= ~0x20;
+	out_le32(dac_ctl, val);
+
+	/* Set color at palette index */
+	out_8(addr, index);
+	out_le32(data, color);
+}
+
+static void __iomem *ofdrm_rage_m3b_cmap_ioremap(struct ofdrm_device *odev,
+						 struct device_node *of_node,
+						 u64 fb_base)
+{
+	return get_cmap_address_of(odev, of_node, 2, 0, 0x1fff);
+}
+
+static void ofdrm_rage_m3b_cmap_write(struct ofdrm_device *odev, unsigned char index,
+				      unsigned char r, unsigned char g, unsigned char b)
+{
+	void __iomem *dac_ctl = odev->cmap_base + 0x58;
+	void __iomem *addr = odev->cmap_base + 0xb0;
+	void __iomem *data = odev->cmap_base + 0xb4;
+	int color = (r << 16) | (g << 8) | b;
+	unsigned int val;
+
+	/* Set PALETTE_ACCESS_CNTL in DAC_CNTL */
+	val = in_le32(dac_ctl);
+	val |= 0x20;
+	out_le32(dac_ctl, val);
+
+	/* Set color at palette index */
+	out_8(addr, index);
+	out_le32(data, color);
+}
+
+static void __iomem *ofdrm_radeon_cmap_ioremap(struct ofdrm_device *odev,
+					       struct device_node *of_node,
+					       u64 fb_base)
+{
+	return get_cmap_address_of(odev, of_node, 1, 0, 0x1fff);
+}
+
+static void __iomem *ofdrm_gxt2000_cmap_ioremap(struct ofdrm_device *odev,
+						struct device_node *of_node,
+						u64 fb_base)
+{
+	return get_cmap_address_of(odev, of_node, 0, 0x6000, 0x1000);
+}
+
+static void ofdrm_gxt2000_cmap_write(struct ofdrm_device *odev, unsigned char index,
+				     unsigned char r, unsigned char g, unsigned char b)
+{
+	void __iomem *data = ((unsigned int __iomem *)odev->cmap_base) + index;
+	int color = (r << 16) | (g << 8) | b;
+
+	out_le32(data, color);
+}
+
+static void __iomem *ofdrm_avivo_cmap_ioremap(struct ofdrm_device *odev,
+					      struct device_node *of_node,
+					      u64 fb_base)
+{
+	struct device_node *of_parent;
+	void __iomem *cmap_base;
+
+	of_parent = of_get_parent(of_node);
+	cmap_base = get_cmap_address_of(odev, of_parent, 0, 0, 0x10000);
+	of_node_put(of_parent);
+
+	return cmap_base;
+}
+
+static void ofdrm_avivo_cmap_write(struct ofdrm_device *odev, unsigned char index,
+				   unsigned char r, unsigned char g, unsigned char b)
+{
+	void __iomem *lutsel = odev->cmap_base + AVIVO_DC_LUT_RW_SELECT;
+	void __iomem *addr = odev->cmap_base + AVIVO_DC_LUT_RW_INDEX;
+	void __iomem *data = odev->cmap_base + AVIVO_DC_LUT_30_COLOR;
+	u32 color = (r << 22) | (g << 12) | (b << 2);
+
+	/* Write to both LUTs for now */
+
+	writel(1, lutsel);
+	writeb(index, addr);
+	writel(color, data);
+
+	writel(0, lutsel);
+	writeb(index, addr);
+	writel(color, data);
+}
+
+static void __iomem *ofdrm_qemu_cmap_ioremap(struct ofdrm_device *odev,
+					     struct device_node *of_node,
+					     u64 fb_base)
+{
+#ifdef __BIG_ENDIAN
+	static const __be32 io_of_addr[3] = { 0x01000000, 0x0, 0x0 };
+#else
+	static const __be32 io_of_addr[3] = { 0x00000001, 0x0, 0x0 };
+#endif
+
+	struct drm_device *dev = &odev->dev;
+	u64 address;
+	void __iomem *cmap_base;
+
+	address = of_translate_address(of_node, io_of_addr);
+	if (address == OF_BAD_ADDR)
+		return ERR_PTR(-ENODEV);
+
+	cmap_base = devm_ioremap(dev->dev, address + 0x3c8, 2);
+	if (!cmap_base)
+		return ERR_PTR(-ENOMEM);
+
+	return cmap_base;
+}
+
+static void ofdrm_qemu_cmap_write(struct ofdrm_device *odev, unsigned char index,
+				  unsigned char r, unsigned char g, unsigned char b)
+{
+	void __iomem *addr = odev->cmap_base;
+	void __iomem *data = odev->cmap_base + 1;
+
+	writeb(index, addr);
+	writeb(r, data);
+	writeb(g, data);
+	writeb(b, data);
+}
+
+static void ofdrm_device_set_gamma_linear(struct ofdrm_device *odev,
+					  const struct drm_format_info *format)
+{
+	struct drm_device *dev = &odev->dev;
+	int i;
+
+	switch (format->format) {
+	case DRM_FORMAT_RGB565:
+		/* Use better interpolation, to take 32 values from 0 to 255 */
+		for (i = 0; i < OFDRM_GAMMA_LUT_SIZE / 8; i++) {
+			unsigned char r = i * 8 + i / 4;
+			unsigned char g = i * 4 + i / 16;
+			unsigned char b = i * 8 + i / 4;
+
+			odev->funcs->cmap_write(odev, i, r, g, b);
+		}
+		/* Green has one more bit, so add padding with 0 for red and blue. */
+		for (i = OFDRM_GAMMA_LUT_SIZE / 8; i < OFDRM_GAMMA_LUT_SIZE / 4; i++) {
+			unsigned char r = 0;
+			unsigned char g = i * 4 + i / 16;
+			unsigned char b = 0;
+
+			odev->funcs->cmap_write(odev, i, r, g, b);
+		}
+		break;
+	case DRM_FORMAT_XRGB8888:
+		for (i = 0; i < OFDRM_GAMMA_LUT_SIZE; i++)
+			odev->funcs->cmap_write(odev, i, i, i, i);
+		break;
+	default:
+		drm_warn_once(dev, "Unsupported format %p4cc for gamma correction\n",
+			      &format->format);
+		break;
+	}
+}
+
+static void ofdrm_device_set_gamma(struct ofdrm_device *odev,
+				   const struct drm_format_info *format,
+				   struct drm_color_lut *lut)
+{
+	struct drm_device *dev = &odev->dev;
+	int i;
+
+	switch (format->format) {
+	case DRM_FORMAT_RGB565:
+		/* Use better interpolation, to take 32 values from lut[0] to lut[255] */
+		for (i = 0; i < OFDRM_GAMMA_LUT_SIZE / 8; i++) {
+			unsigned char r = lut[i * 8 + i / 4].red >> 8;
+			unsigned char g = lut[i * 4 + i / 16].green >> 8;
+			unsigned char b = lut[i * 8 + i / 4].blue >> 8;
+
+			odev->funcs->cmap_write(odev, i, r, g, b);
+		}
+		/* Green has one more bit, so add padding with 0 for red and blue. */
+		for (i = OFDRM_GAMMA_LUT_SIZE / 8; i < OFDRM_GAMMA_LUT_SIZE / 4; i++) {
+			unsigned char r = 0;
+			unsigned char g = lut[i * 4 + i / 16].green >> 8;
+			unsigned char b = 0;
+
+			odev->funcs->cmap_write(odev, i, r, g, b);
+		}
+		break;
+	case DRM_FORMAT_XRGB8888:
+		for (i = 0; i < OFDRM_GAMMA_LUT_SIZE; i++) {
+			unsigned char r = lut[i].red >> 8;
+			unsigned char g = lut[i].green >> 8;
+			unsigned char b = lut[i].blue >> 8;
+
+			odev->funcs->cmap_write(odev, i, r, g, b);
+		}
+		break;
+	default:
+		drm_warn_once(dev, "Unsupported format %p4cc for gamma correction\n",
+			      &format->format);
+		break;
+	}
+}
+
 /*
  * Modesetting
  */
 
 struct ofdrm_crtc_state {
 	struct drm_crtc_state base;
+
+	/* Primary-plane format; required for color mgmt. */
+	const struct drm_format_info *format;
 };
 
 static struct ofdrm_crtc_state *to_ofdrm_crtc_state(struct drm_crtc_state *base)
@@ -376,10 +735,12 @@ static int ofdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
 						   struct drm_atomic_state *new_state)
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
+	struct drm_framebuffer *new_fb = new_plane_state->fb;
 	struct drm_crtc_state *new_crtc_state;
+	struct ofdrm_crtc_state *new_ofdrm_crtc_state;
 	int ret;
 
-	if (!new_plane_state->fb)
+	if (!new_fb)
 		return 0;
 
 	new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_plane_state->crtc);
@@ -391,6 +752,14 @@ static int ofdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	if (!new_plane_state->visible)
+		return 0;
+
+	new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_plane_state->crtc);
+
+	new_ofdrm_crtc_state = to_ofdrm_crtc_state(new_crtc_state);
+	new_ofdrm_crtc_state->format = new_fb->format;
+
 	return 0;
 }
 
@@ -435,6 +804,9 @@ static enum drm_mode_status ofdrm_crtc_helper_mode_valid(struct drm_crtc *crtc,
 static int ofdrm_crtc_helper_atomic_check(struct drm_crtc *crtc,
 					  struct drm_atomic_state *new_state)
 {
+	static const size_t gamma_lut_length = OFDRM_GAMMA_LUT_SIZE * sizeof(struct drm_color_lut);
+
+	struct drm_device *dev = crtc->dev;
 	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(new_state, crtc);
 	int ret;
 
@@ -442,9 +814,35 @@ static int ofdrm_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	if (ret)
 		return ret;
 
+	if (new_crtc_state->color_mgmt_changed) {
+		struct drm_property_blob *gamma_lut = new_crtc_state->gamma_lut;
+
+		if (gamma_lut && (gamma_lut->length != gamma_lut_length)) {
+			drm_dbg(dev, "Incorrect gamma_lut length %zu\n", gamma_lut->length);
+			return -EINVAL;
+		}
+	}
+
 	return drm_atomic_add_affected_planes(new_state, crtc);
 }
 
+static void ofdrm_crtc_helper_atomic_flush(struct drm_crtc *crtc,
+					   struct drm_atomic_state *old_state)
+{
+	struct ofdrm_device *odev = ofdrm_device_of_dev(crtc->dev);
+	struct drm_crtc_state *crtc_state = crtc->state;
+	struct ofdrm_crtc_state *ofdrm_crtc_state = to_ofdrm_crtc_state(crtc_state);
+
+	if (crtc_state->enable && crtc_state->color_mgmt_changed) {
+		const struct drm_format_info *format = ofdrm_crtc_state->format;
+
+		if (crtc_state->gamma_lut)
+			ofdrm_device_set_gamma(odev, format, crtc_state->gamma_lut->data);
+		else
+			ofdrm_device_set_gamma_linear(odev, format);
+	}
+}
+
 static void ofdrm_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 					    struct drm_atomic_state *old_state)
 {
@@ -466,6 +864,7 @@ static void ofdrm_crtc_helper_atomic_disable(struct drm_crtc *crtc,
 static const struct drm_crtc_helper_funcs ofdrm_crtc_helper_funcs = {
 	.mode_valid = ofdrm_crtc_helper_mode_valid,
 	.atomic_check = ofdrm_crtc_helper_atomic_check,
+	.atomic_flush = ofdrm_crtc_helper_atomic_flush,
 	.atomic_enable = ofdrm_crtc_helper_atomic_enable,
 	.atomic_disable = ofdrm_crtc_helper_atomic_disable,
 };
@@ -501,6 +900,7 @@ static struct drm_crtc_state *ofdrm_crtc_atomic_duplicate_state(struct drm_crtc
 		return NULL;
 
 	__drm_atomic_helper_crtc_duplicate_state(crtc, &new_ofdrm_crtc_state->base);
+	new_ofdrm_crtc_state->format = ofdrm_crtc_state->format;
 
 	return &new_ofdrm_crtc_state->base;
 }
@@ -553,27 +953,43 @@ static const struct ofdrm_device_funcs ofdrm_unknown_device_funcs = {
 };
 
 static const struct ofdrm_device_funcs ofdrm_mach64_device_funcs = {
+	.cmap_ioremap = ofdrm_mach64_cmap_ioremap,
+	.cmap_write = ofdrm_mach64_cmap_write,
 };
 
 static const struct ofdrm_device_funcs ofdrm_rage128_device_funcs = {
+	.cmap_ioremap = ofdrm_rage128_cmap_ioremap,
+	.cmap_write = ofdrm_rage128_cmap_write,
 };
 
 static const struct ofdrm_device_funcs ofdrm_rage_m3a_device_funcs = {
+	.cmap_ioremap = ofdrm_rage_m3a_cmap_ioremap,
+	.cmap_write = ofdrm_rage_m3a_cmap_write,
 };
 
 static const struct ofdrm_device_funcs ofdrm_rage_m3b_device_funcs = {
+	.cmap_ioremap = ofdrm_rage_m3b_cmap_ioremap,
+	.cmap_write = ofdrm_rage_m3b_cmap_write,
 };
 
 static const struct ofdrm_device_funcs ofdrm_radeon_device_funcs = {
+	.cmap_ioremap = ofdrm_radeon_cmap_ioremap,
+	.cmap_write = ofdrm_rage128_cmap_write, /* same as Rage128 */
 };
 
 static const struct ofdrm_device_funcs ofdrm_gxt2000_device_funcs = {
+	.cmap_ioremap = ofdrm_gxt2000_cmap_ioremap,
+	.cmap_write = ofdrm_gxt2000_cmap_write,
 };
 
 static const struct ofdrm_device_funcs ofdrm_avivo_device_funcs = {
+	.cmap_ioremap = ofdrm_avivo_cmap_ioremap,
+	.cmap_write = ofdrm_avivo_cmap_write,
 };
 
 static const struct ofdrm_device_funcs ofdrm_qemu_device_funcs = {
+	.cmap_ioremap = ofdrm_qemu_cmap_ioremap,
+	.cmap_write = ofdrm_qemu_cmap_write,
 };
 
 static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
@@ -716,6 +1132,17 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 		return ERR_PTR(-ENOMEM);
 	iosys_map_set_vaddr_iomem(&screen_base_vmap, screen_base);
 
+	if (odev->funcs->cmap_ioremap) {
+		void __iomem *cmap_base = odev->funcs->cmap_ioremap(odev, of_node, fb_base);
+
+		if (IS_ERR(cmap_base)) {
+			/* Don't fail; continue without colormap */
+			ret = PTR_ERR(cmap_base);
+		} else {
+			odev->cmap_base = cmap_base;
+		}
+	}
+
 	/*
 	 * Firmware framebuffer
 	 */
@@ -769,6 +1196,11 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 		return ERR_PTR(ret);
 	drm_crtc_helper_add(crtc, &ofdrm_crtc_helper_funcs);
 
+	if (odev->cmap_base) {
+		drm_mode_crtc_set_gamma_size(crtc, OFDRM_GAMMA_LUT_SIZE);
+		drm_crtc_enable_color_mgmt(crtc, 0, false, OFDRM_GAMMA_LUT_SIZE);
+	}
+
 	/* Encoder */
 
 	encoder = &odev->encoder;
-- 
2.36.1

