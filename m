Return-Path: <linuxppc-dev+bounces-14410-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A26AC77D01
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 09:13:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCSdh2xPBz2yD5;
	Fri, 21 Nov 2025 19:13:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763712792;
	cv=none; b=D+b+EiastFbR+du5ydz9uD7fsfmKFZid8E+OJM5eb7ulWdse9bif4mYcJHhyN5IS5vs9fRyOcCib4mB9tRkW+UjzRQfMNMQmyV8R1/7TaJ4YlFGF1t7oAGWFErYCx8B45/FBiER2lajCDCY/rGOZE2NPuycbepw6+dEftasJbtc33SI7j8mR0BigX+3vk5b1hsJwQ//2Y8ylLl2sNpHV6r1E+BcRq90X7af1oTllyJbHVb6vJdnaxcMJ+0d+ccbLces7kk9qKkhY1Hcwy9bdV8+5hXzJ63Zv2CKbrd2jT68iIKASPBjOAOq/OfCg6g9oeZpVOBm+MnVsVhJ0AANaWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763712792; c=relaxed/relaxed;
	bh=47f3t2quGh0AzMkGBd1vq9EFL0ZXErTFAI2lHjxXT9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XAB/tfXzIo2xKDLONRvzf4nXYDr3Ob3BEyStiIFP0+7vvrTXdK4KG9EqAIWieR6nFAlNZDLkX9e2M6dkrEcj+08tGp4TO4QlZIboBrWjZjO7wNioFcduujv2To7m3LTTxxsoQ9dhyv6+RswWtnHXcme/pwUgk2Trxu4+HWFg1636+7c9VWOFGtA8Fpa9Q9w48VnAOoPNLLykAPzOQRLoyuxcQU8YuZAs0fnUBR4r3kUjPbmRYDBXeIfk2nUfG1Xk3FAOGosYigWslmGcSLO75WJ2eOjiwuQNxXXxXYqKvWmvv8YCanWCEzM/26ZwruetfTmsnQ0e/YX+dtclqUlfYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=j76ldxl3; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UL7ECpFF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=j76ldxl3; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UL7ECpFF; dkim-atps=neutral; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=j76ldxl3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UL7ECpFF;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=j76ldxl3;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UL7ECpFF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCSdf6Qhrz2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 19:13:10 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AC25121900;
	Fri, 21 Nov 2025 08:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763712782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=47f3t2quGh0AzMkGBd1vq9EFL0ZXErTFAI2lHjxXT9Y=;
	b=j76ldxl3RJ2z6jfuSLhlmbehzI8pOG5XXfb9WeHkvsRza7uzJe2qGY7nciPuRdSHx4M1uz
	7thdIdr8+0H+EnYi47ArlBMtxLuIGBleLBTfZl62NPaqrUaLhyNtTmAUEsz0b60eMf9ndq
	7QNzWwo53jiMeSLxCjktDUrmvikBTSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763712782;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=47f3t2quGh0AzMkGBd1vq9EFL0ZXErTFAI2lHjxXT9Y=;
	b=UL7ECpFFa9/WhLy8Xa7NY065ENt/7AGP+3lDf9QVuhwpzMKTUfFzK0ox2Nwvy++KWwBhnV
	f7W8JY+BUMuAOZCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763712782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=47f3t2quGh0AzMkGBd1vq9EFL0ZXErTFAI2lHjxXT9Y=;
	b=j76ldxl3RJ2z6jfuSLhlmbehzI8pOG5XXfb9WeHkvsRza7uzJe2qGY7nciPuRdSHx4M1uz
	7thdIdr8+0H+EnYi47ArlBMtxLuIGBleLBTfZl62NPaqrUaLhyNtTmAUEsz0b60eMf9ndq
	7QNzWwo53jiMeSLxCjktDUrmvikBTSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763712782;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=47f3t2quGh0AzMkGBd1vq9EFL0ZXErTFAI2lHjxXT9Y=;
	b=UL7ECpFFa9/WhLy8Xa7NY065ENt/7AGP+3lDf9QVuhwpzMKTUfFzK0ox2Nwvy++KWwBhnV
	f7W8JY+BUMuAOZCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 898313EA61;
	Fri, 21 Nov 2025 08:13:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GWmnHw4fIGmWKwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 21 Nov 2025 08:13:02 +0000
Message-ID: <2766a9d5-1a8f-451e-b018-993563715629@suse.de>
Date: Fri, 21 Nov 2025 09:13:02 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/ast: Fix framebuffer color swapping on ppc64
 systems
To: Timothy Pearson <tpearson@raptorengineering.com>,
 Dave Airlie <airlied@redhat.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <407388289.1798972.1760725035958.JavaMail.zimbra@raptorengineeringinc.com>
 <705534604.1798975.1760725076596.JavaMail.zimbra@raptorengineeringinc.com>
 <109693647.1798978.1760725111876.JavaMail.zimbra@raptorengineeringinc.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <109693647.1798978.1760725111876.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,suse.com:url,raptorengineering.com:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,suse.com:url,raptorengineering.com:email]
X-Spam-Score: -4.30
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi

Am 17.10.25 um 20:18 schrieb Timothy Pearson:
> On certain big endian systems, such as the POWER9 operating in big endian
> mode, PCI MMIO BAR accesses are transparently endian-swapped by hardware.
> On the AST2xx0 series devices, this results in the little endian framebuffer
> appearing to the host as a big endian device, resulting in unwanted color
> swapping.
>
> Furthermore, per ASpeed technical support, the big endian mode on these devices
> is not supported and, per Raptor's internal testing, does not function at a
> hardware level.
>
> Detect transparent PCI swapping via CONFIG_PCI_ARCH_ENDIAN_AUTOSWAP, and
> expose the framebuffer as a big endian device with software swapping.
>
> Tested on a POWER9 Blackbird system with Debian sid/ppc64.
>
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 33 +++++++++++++++++++++++++++++++--
>   1 file changed, 31 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 30b011ed0a05..07f04668ef92 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -105,9 +105,11 @@ static void ast_crtc_fill_gamma(struct ast_device *ast,
>   		drm_crtc_fill_palette_8(crtc, ast_set_gamma_lut);
>   		break;
>   	case DRM_FORMAT_RGB565:
> +	case DRM_FORMAT_HOST_RGB565:
>   		/* also uses 8-bit gamma ramp on low-color modes */
>   		fallthrough;
>   	case DRM_FORMAT_XRGB8888:
> +	case DRM_FORMAT_HOST_XRGB8888:
>   		drm_crtc_fill_gamma_888(crtc, ast_set_gamma_lut);
>   		break;
>   	default:
> @@ -129,9 +131,11 @@ static void ast_crtc_load_gamma(struct ast_device *ast,
>   		drm_crtc_load_palette_8(crtc, lut, ast_set_gamma_lut);
>   		break;
>   	case DRM_FORMAT_RGB565:
> +	case DRM_FORMAT_HOST_RGB565:
>   		/* also uses 8-bit gamma ramp on low-color modes */
>   		fallthrough;
>   	case DRM_FORMAT_XRGB8888:
> +	case DRM_FORMAT_HOST_XRGB8888:
>   		drm_crtc_load_gamma_888(crtc, lut, ast_set_gamma_lut);
>   		break;
>   	default:
> @@ -502,8 +506,13 @@ void __iomem *ast_plane_vaddr(struct ast_plane *ast_plane)
>    */
>   
>   static const uint32_t ast_primary_plane_formats[] = {
> +#if defined(__BIG_ENDIAN) && defined(CONFIG_PCI_ARCH_ENDIAN_AUTOSWAP)
> +	DRM_FORMAT_HOST_XRGB8888,
> +	DRM_FORMAT_HOST_RGB565,
> +#else
>   	DRM_FORMAT_XRGB8888,
>   	DRM_FORMAT_RGB565,
> +#endif
>   	DRM_FORMAT_C8,
>   };
>   
> @@ -541,12 +550,24 @@ static int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
>   
>   static void ast_handle_damage(struct ast_plane *ast_plane, struct iosys_map *src,
>   			      struct drm_framebuffer *fb,
> -			      const struct drm_rect *clip)
> +			      const struct drm_rect *clip,
> +			      struct drm_format_conv_state *fmtcnv_state)
>   {
>   	struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(ast_plane_vaddr(ast_plane));
>   
>   	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
> +#if defined(__BIG_ENDIAN) && defined(CONFIG_PCI_ARCH_ENDIAN_AUTOSWAP)
> +	switch (fb->format->format) {
> +		case DRM_FORMAT_HOST_XRGB8888:
> +		case DRM_FORMAT_HOST_RGB565:
> +			drm_fb_swab(&dst, fb->pitches, src, fb, clip, false, fmtcnv_state);

DRM formats are always little endian. I'm not sure if most user space 
even supports anything else.  Can we just drop the whole _FORMAT_HOST_ 
formats and do a swap here if we're on BE PPC64?

Best regards
Thomas

> +			break;
> +		default:
> +			drm_fb_memcpy(&dst, fb->pitches, src, fb, clip);
> +	}
> +#else
>   	drm_fb_memcpy(&dst, fb->pitches, src, fb, clip);
> +#endif
>   }
>   
>   static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
> @@ -574,7 +595,7 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>   
>   	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
>   	drm_atomic_for_each_plane_damage(&iter, &damage) {
> -		ast_handle_damage(ast_plane, shadow_plane_state->data, fb, &damage);
> +		ast_handle_damage(ast_plane, shadow_plane_state->data, fb, &damage, &shadow_plane_state->fmtcnv_state);
>   	}
>   
>   	/*
> @@ -766,10 +787,13 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
>   		ast_state->std_table = &vbios_stdtable[VGAModeIndex];
>   		break;
>   	case DRM_FORMAT_RGB565:
> +	case DRM_FORMAT_HOST_RGB565:
>   		ast_state->std_table = &vbios_stdtable[HiCModeIndex];
>   		break;
>   	case DRM_FORMAT_RGB888:
> +	case DRM_FORMAT_BGR888:
>   	case DRM_FORMAT_XRGB8888:
> +	case DRM_FORMAT_HOST_XRGB8888:
>   		ast_state->std_table = &vbios_stdtable[TrueCModeIndex];
>   		break;
>   	default:
> @@ -978,7 +1002,11 @@ static const struct drm_mode_config_helper_funcs ast_mode_config_helper_funcs =
>   static enum drm_mode_status ast_mode_config_mode_valid(struct drm_device *dev,
>   						       const struct drm_display_mode *mode)
>   {
> +#if defined(__BIG_ENDIAN) && defined(CONFIG_PCI_ARCH_ENDIAN_AUTOSWAP)
> +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_HOST_XRGB8888);
> +#else
>   	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_XRGB8888);
> +#endif
>   	struct ast_device *ast = to_ast_device(dev);
>   	unsigned long max_fb_size = ast_fb_vram_size(ast);
>   	u64 pitch;
> @@ -1021,6 +1049,7 @@ int ast_mode_config_init(struct ast_device *ast)
>   	dev->mode_config.min_width = 0;
>   	dev->mode_config.min_height = 0;
>   	dev->mode_config.preferred_depth = 24;
> +	dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
>   
>   	if (ast->support_fullhd) {
>   		dev->mode_config.max_width = 1920;

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



