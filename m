Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 216FA5EDB6F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 13:13:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mcv4B66JZz3cH1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 21:13:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wi33yjM4;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=GcyCBwYm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wi33yjM4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=GcyCBwYm;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mcv3T2cgnz2xGD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 21:12:36 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 5612621E46;
	Wed, 28 Sep 2022 11:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1664363553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x5QiDkGTtWW3TyyfDNp+cQMUarRxbXPZeZ1xe1IztRY=;
	b=wi33yjM4KkYImAU0p+583YWmEIPJkk44lVkw738yxB6PuCshvNc0s0HlRrspcZhpTKSxKB
	00gyKOJyAyCpGdYSoUVjr5CG4VHBwMsNQWDzaALTDglQEm/+bvKHjgRtZdU/DkTdHwmTkM
	FdxEuCUP8TVUjsmIdZb6ihckIQQkp1Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1664363553;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x5QiDkGTtWW3TyyfDNp+cQMUarRxbXPZeZ1xe1IztRY=;
	b=GcyCBwYmx+BT/5vBrC5JzWxxyK8Xr28Crh8RVhxfi5nv7OBQu1tnCOk+D9U4wYBxORJGlQ
	LRy7wHbS3DUs/aAw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 0679B2C171;
	Wed, 28 Sep 2022 11:12:33 +0000 (UTC)
Date: Wed, 28 Sep 2022 13:12:31 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
Message-ID: <20220928111231.GO28810@kitsune.suse.cz>
References: <20220928105010.18880-1-tzimmermann@suse.de>
 <20220928105010.18880-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928105010.18880-6-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-fbdev@vger.kernel.org, airlied@linux.ie, deller@gmx.de, linuxppc-dev@lists.ozlabs.org, mark.cave-ayland@ilande.co.uk, javierm@redhat.com, dri-devel@lists.freedesktop.org, paulus@samba.org, maxime@cerno.tech, daniel@ffwll.ch, geert@linux-m68k.org, sam@ravnborg.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Wed, Sep 28, 2022 at 12:50:10PM +0200, Thomas Zimmermann wrote:
> All DRM formats assume little-endian byte order. On big-endian systems,
> it is likely that the scanout buffer is in big endian as well. Update
> the format accordingly and add endianess conversion to the format-helper
> library. Also opt-in to allocated buffers in host format by default.

This sounds backwards to me.

Skimming through the code it sounds like the buffer is in fact in the
same format all the time but when the CPU is switched to BE it sees the
data loaded from it differently.

Or am I missing something?

Thanks

Michal

> 
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_format_helper.c | 10 ++++++
>  drivers/gpu/drm/tiny/ofdrm.c        | 55 +++++++++++++++++++++++++++--
>  2 files changed, 63 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 4afc4ac27342..fca7936db083 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -659,6 +659,11 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
>  			drm_fb_xrgb8888_to_rgb565(dst, dst_pitch, src, fb, clip, false);
>  			return 0;
>  		}
> +	} else if (dst_format == (DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN)) {
> +		if (fb_format == DRM_FORMAT_RGB565) {
> +			drm_fb_swab(dst, dst_pitch, src, fb, clip, false);
> +			return 0;
> +		}
>  	} else if (dst_format == DRM_FORMAT_RGB888) {
>  		if (fb_format == DRM_FORMAT_XRGB8888) {
>  			drm_fb_xrgb8888_to_rgb888(dst, dst_pitch, src, fb, clip);
> @@ -677,6 +682,11 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
>  			drm_fb_xrgb8888_to_xrgb2101010(dst, dst_pitch, src, fb, clip);
>  			return 0;
>  		}
> +	} else if (dst_format == DRM_FORMAT_BGRX8888) {
> +		if (fb_format == DRM_FORMAT_XRGB8888) {
> +			drm_fb_swab(dst, dst_pitch, src, fb, clip, false);
> +			return 0;
> +		}
>  	}
>  
>  	drm_warn_once(fb->dev, "No conversion helper from %p4cc to %p4cc found.\n",
> diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
> index 0bf5eebf6678..6e100a7f5db7 100644
> --- a/drivers/gpu/drm/tiny/ofdrm.c
> +++ b/drivers/gpu/drm/tiny/ofdrm.c
> @@ -94,7 +94,7 @@ static int display_get_validated_int0(struct drm_device *dev, const char *name,
>  }
>  
>  static const struct drm_format_info *display_get_validated_format(struct drm_device *dev,
> -								  u32 depth)
> +								  u32 depth, bool big_endian)
>  {
>  	const struct drm_format_info *info;
>  	u32 format;
> @@ -115,6 +115,29 @@ static const struct drm_format_info *display_get_validated_format(struct drm_dev
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> +	/*
> +	 * DRM formats assume little-endian byte order. Update the format
> +	 * if the scanout buffer uses big-endian ordering.
> +	 */
> +	if (big_endian) {
> +		switch (format) {
> +		case DRM_FORMAT_XRGB8888:
> +			format = DRM_FORMAT_BGRX8888;
> +			break;
> +		case DRM_FORMAT_ARGB8888:
> +			format = DRM_FORMAT_BGRA8888;
> +			break;
> +		case DRM_FORMAT_RGB565:
> +			format = DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN;
> +			break;
> +		case DRM_FORMAT_XRGB1555:
> +			format = DRM_FORMAT_XRGB1555 | DRM_FORMAT_BIG_ENDIAN;
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
>  	info = drm_format_info(format);
>  	if (!info) {
>  		drm_err(dev, "cannot find framebuffer format for depth %u\n", depth);
> @@ -134,6 +157,23 @@ static int display_read_u32_of(struct drm_device *dev, struct device_node *of_no
>  	return ret;
>  }
>  
> +static bool display_get_big_endian_of(struct drm_device *dev, struct device_node *of_node)
> +{
> +	bool big_endian;
> +
> +#ifdef __BIG_ENDIAN
> +	big_endian = true;
> +	if (of_get_property(of_node, "little-endian", NULL))
> +		big_endian = false;
> +#else
> +	big_endian = false;
> +	if (of_get_property(of_node, "big-endian", NULL))
> +		big_endian = true;
> +#endif
> +
> +	return big_endian;
> +}
> +
>  static int display_get_width_of(struct drm_device *dev, struct device_node *of_node)
>  {
>  	u32 width;
> @@ -613,6 +653,7 @@ static void ofdrm_device_set_gamma_linear(struct ofdrm_device *odev,
>  
>  	switch (format->format) {
>  	case DRM_FORMAT_RGB565:
> +	case DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN:
>  		/* Use better interpolation, to take 32 values from 0 to 255 */
>  		for (i = 0; i < OFDRM_GAMMA_LUT_SIZE / 8; i++) {
>  			unsigned char r = i * 8 + i / 4;
> @@ -631,6 +672,7 @@ static void ofdrm_device_set_gamma_linear(struct ofdrm_device *odev,
>  		}
>  		break;
>  	case DRM_FORMAT_XRGB8888:
> +	case DRM_FORMAT_BGRX8888:
>  		for (i = 0; i < OFDRM_GAMMA_LUT_SIZE; i++)
>  			odev->funcs->cmap_write(odev, i, i, i, i);
>  		break;
> @@ -650,6 +692,7 @@ static void ofdrm_device_set_gamma(struct ofdrm_device *odev,
>  
>  	switch (format->format) {
>  	case DRM_FORMAT_RGB565:
> +	case DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN:
>  		/* Use better interpolation, to take 32 values from lut[0] to lut[255] */
>  		for (i = 0; i < OFDRM_GAMMA_LUT_SIZE / 8; i++) {
>  			unsigned char r = lut[i * 8 + i / 4].red >> 8;
> @@ -668,6 +711,7 @@ static void ofdrm_device_set_gamma(struct ofdrm_device *odev,
>  		}
>  		break;
>  	case DRM_FORMAT_XRGB8888:
> +	case DRM_FORMAT_BGRX8888:
>  		for (i = 0; i < OFDRM_GAMMA_LUT_SIZE; i++) {
>  			unsigned char r = lut[i].red >> 8;
>  			unsigned char g = lut[i].green >> 8;
> @@ -718,6 +762,9 @@ static const uint32_t ofdrm_primary_plane_formats[] = {
>  	DRM_FORMAT_RGB565,
>  	//DRM_FORMAT_XRGB1555,
>  	//DRM_FORMAT_C8,
> +	/* Big-endian formats below */
> +	DRM_FORMAT_BGRX8888,
> +	DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN,
>  };
>  
>  static const uint64_t ofdrm_primary_plane_format_modifiers[] = {
> @@ -1048,6 +1095,7 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
>  	struct ofdrm_device *odev;
>  	struct drm_device *dev;
>  	enum ofdrm_model model;
> +	bool big_endian;
>  	int width, height, depth, linebytes;
>  	const struct drm_format_info *format;
>  	u64 address;
> @@ -1109,6 +1157,8 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
>  		break;
>  	}
>  
> +	big_endian = display_get_big_endian_of(dev, of_node);
> +
>  	width = display_get_width_of(dev, of_node);
>  	if (width < 0)
>  		return ERR_PTR(width);
> @@ -1122,7 +1172,7 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
>  	if (linebytes < 0)
>  		return ERR_PTR(linebytes);
>  
> -	format = display_get_validated_format(dev, depth);
> +	format = display_get_validated_format(dev, depth, big_endian);
>  	if (IS_ERR(format))
>  		return ERR_CAST(format);
>  	if (!linebytes) {
> @@ -1234,6 +1284,7 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
>  		dev->mode_config.preferred_depth = depth;
>  		break;
>  	}
> +	dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
>  
>  	/* Primary plane */
>  
> -- 
> 2.37.3
> 
