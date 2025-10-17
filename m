Return-Path: <linuxppc-dev+bounces-13027-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F585BEB2EC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 20:18:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cpCkR1kPYz3cYN;
	Sat, 18 Oct 2025 05:18:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760725119;
	cv=none; b=hORkLvpzLpNQUh0bOWiCl+9NdSGORTaVRy6K8Ob9AVYmkjPHx/XsfZfh2yMt01S3vMczycuCgxCRTr1JEc/6nMfU2CyxvJPJ76ygTuScEYnR7ooAh3QR2cZgDDdsV2B1lEiNdKZsVHEjoVa5QP7/p9brETKlCa5gVM64b5ft7tGdBdyziLWEzXig4u522AV6XsRaud+kZOB7S8P/Cny2rRarsDzS0WMxMVzfuT88IVXuOYKaemf3CnR2eXfCyuK0yPMNJofSZjQEg/j/8HyrlYrrw/TTkwG9sh6FMSHSN4Hg1+y5+os2lVE099RWeo7IejZCjgildtXIZEKF4yowow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760725119; c=relaxed/relaxed;
	bh=8B+Pu3OFVHHqTRw6rrRr3aw9QhIaUN4G64FX1iL7h2U=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=i6bB+RrzMt5V96zr0TXFYkdAasuSmnTafFTI2wibvL++TLfbv0NyjRQE9ELLxISe/GvGiVAdX5k+Q9JZjQ5mwKkfxQZDjvYQ7Sd5QSlEKEH1PUx7Y6d0ySpz1/2LvkQGX6W0cPehAlqp5kKWgx6LN5GUtrQdZCIXLuQ0HScPeBzDvO8mMgxuZLT/7iEY3pu9BESXcJj1J4zXEmW97aakLkB7gBprfYQ5iJfxh4gmC5JrbTh4d/JHf8Q8j3fLFsa0F+oPGXiafzrMaNPRjbDzQMJVvLfcePeyGirgteSytvbtI3AHyZ5ibfBSVk72vQlXapZ3LDo6P3B/gDTSL7nS/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=F70RHgFM; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=F70RHgFM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cpCkQ0PKvz3cYG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Oct 2025 05:18:38 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 45694828916F;
	Fri, 17 Oct 2025 13:18:36 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id queNuPcw8-0f; Fri, 17 Oct 2025 13:18:33 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id DF28882891F4;
	Fri, 17 Oct 2025 13:18:32 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com DF28882891F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1760725112; bh=8B+Pu3OFVHHqTRw6rrRr3aw9QhIaUN4G64FX1iL7h2U=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=F70RHgFMgzlVDPGNBhPs4c8/DtuEbjZxkBeeJuuq8JK/D3lv1mKmslOQXhOuEHm5L
	 3IQ96sl/kA8pTXEbiNA1jF+TXfRC85z92qEKoh3XGcH9I8rN/boDhzd7DipL4m9FN4
	 Y1DCQFqtP1xxJ0oKsP+JMSkBqz2jP4ZyvWad0hkw=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id zwr3o-fUcvZX; Fri, 17 Oct 2025 13:18:32 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id BF88E828916F;
	Fri, 17 Oct 2025 13:18:32 -0500 (CDT)
Date: Fri, 17 Oct 2025 13:18:32 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Dave Airlie <airlied@redhat.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: <109693647.1798978.1760725111876.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <705534604.1798975.1760725076596.JavaMail.zimbra@raptorengineeringinc.com>
References: <407388289.1798972.1760725035958.JavaMail.zimbra@raptorengineeringinc.com> <705534604.1798975.1760725076596.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 2/2] drm/ast: Fix framebuffer color swapping on ppc64
 systems
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC141 (Linux)/8.5.0_GA_3042)
Thread-Topic: drm/ast: Fix framebuffer color swapping on ppc64 systems
Thread-Index: LUG2F4YDIH+Na1U3fGLanAwWnSRh1m0u5uA+lqB5l/A=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On certain big endian systems, such as the POWER9 operating in big endian
mode, PCI MMIO BAR accesses are transparently endian-swapped by hardware.
On the AST2xx0 series devices, this results in the little endian framebuffer
appearing to the host as a big endian device, resulting in unwanted color
swapping.

Furthermore, per ASpeed technical support, the big endian mode on these devices
is not supported and, per Raptor's internal testing, does not function at a
hardware level.

Detect transparent PCI swapping via CONFIG_PCI_ARCH_ENDIAN_AUTOSWAP, and
expose the framebuffer as a big endian device with software swapping.

Tested on a POWER9 Blackbird system with Debian sid/ppc64.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 30b011ed0a05..07f04668ef92 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -105,9 +105,11 @@ static void ast_crtc_fill_gamma(struct ast_device *ast,
 		drm_crtc_fill_palette_8(crtc, ast_set_gamma_lut);
 		break;
 	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_HOST_RGB565:
 		/* also uses 8-bit gamma ramp on low-color modes */
 		fallthrough;
 	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_HOST_XRGB8888:
 		drm_crtc_fill_gamma_888(crtc, ast_set_gamma_lut);
 		break;
 	default:
@@ -129,9 +131,11 @@ static void ast_crtc_load_gamma(struct ast_device *ast,
 		drm_crtc_load_palette_8(crtc, lut, ast_set_gamma_lut);
 		break;
 	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_HOST_RGB565:
 		/* also uses 8-bit gamma ramp on low-color modes */
 		fallthrough;
 	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_HOST_XRGB8888:
 		drm_crtc_load_gamma_888(crtc, lut, ast_set_gamma_lut);
 		break;
 	default:
@@ -502,8 +506,13 @@ void __iomem *ast_plane_vaddr(struct ast_plane *ast_plane)
  */
 
 static const uint32_t ast_primary_plane_formats[] = {
+#if defined(__BIG_ENDIAN) && defined(CONFIG_PCI_ARCH_ENDIAN_AUTOSWAP)
+	DRM_FORMAT_HOST_XRGB8888,
+	DRM_FORMAT_HOST_RGB565,
+#else
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_RGB565,
+#endif
 	DRM_FORMAT_C8,
 };
 
@@ -541,12 +550,24 @@ static int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
 
 static void ast_handle_damage(struct ast_plane *ast_plane, struct iosys_map *src,
 			      struct drm_framebuffer *fb,
-			      const struct drm_rect *clip)
+			      const struct drm_rect *clip,
+			      struct drm_format_conv_state *fmtcnv_state)
 {
 	struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(ast_plane_vaddr(ast_plane));
 
 	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
+#if defined(__BIG_ENDIAN) && defined(CONFIG_PCI_ARCH_ENDIAN_AUTOSWAP)
+	switch (fb->format->format) {
+		case DRM_FORMAT_HOST_XRGB8888:
+		case DRM_FORMAT_HOST_RGB565:
+			drm_fb_swab(&dst, fb->pitches, src, fb, clip, false, fmtcnv_state);
+			break;
+		default:
+			drm_fb_memcpy(&dst, fb->pitches, src, fb, clip);
+	}
+#else
 	drm_fb_memcpy(&dst, fb->pitches, src, fb, clip);
+#endif
 }
 
 static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
@@ -574,7 +595,7 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
-		ast_handle_damage(ast_plane, shadow_plane_state->data, fb, &damage);
+		ast_handle_damage(ast_plane, shadow_plane_state->data, fb, &damage, &shadow_plane_state->fmtcnv_state);
 	}
 
 	/*
@@ -766,10 +787,13 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 		ast_state->std_table = &vbios_stdtable[VGAModeIndex];
 		break;
 	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_HOST_RGB565:
 		ast_state->std_table = &vbios_stdtable[HiCModeIndex];
 		break;
 	case DRM_FORMAT_RGB888:
+	case DRM_FORMAT_BGR888:
 	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_HOST_XRGB8888:
 		ast_state->std_table = &vbios_stdtable[TrueCModeIndex];
 		break;
 	default:
@@ -978,7 +1002,11 @@ static const struct drm_mode_config_helper_funcs ast_mode_config_helper_funcs =
 static enum drm_mode_status ast_mode_config_mode_valid(struct drm_device *dev,
 						       const struct drm_display_mode *mode)
 {
+#if defined(__BIG_ENDIAN) && defined(CONFIG_PCI_ARCH_ENDIAN_AUTOSWAP)
+	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_HOST_XRGB8888);
+#else
 	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_XRGB8888);
+#endif
 	struct ast_device *ast = to_ast_device(dev);
 	unsigned long max_fb_size = ast_fb_vram_size(ast);
 	u64 pitch;
@@ -1021,6 +1049,7 @@ int ast_mode_config_init(struct ast_device *ast)
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
 	dev->mode_config.preferred_depth = 24;
+	dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
 
 	if (ast->support_fullhd) {
 		dev->mode_config.max_width = 1920;
-- 
2.51.0

