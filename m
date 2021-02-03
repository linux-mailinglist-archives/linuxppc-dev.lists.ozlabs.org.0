Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B7E30D7A2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 11:36:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVylS6ZfvzDx0L
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 21:36:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ffwll.ch
 (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=daniel@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256
 header.s=google header.b=M75pCStw; dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVyk04H13zDqMy
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 21:34:58 +1100 (AEDT)
Received: by mail-wm1-x32c.google.com with SMTP id f16so4934313wmq.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Feb 2021 02:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ucutE9tVrKg8bG1XX/lcHYR1DORerY7wTTSfiDErO4Y=;
 b=M75pCStwd1CD5X+AE8fVhstTS+X4mKfTg66UmMyLV/4dbGEYA6QHxZzUVBaPMOz7xx
 F9+edfLoc2Vlmx1emXKW6xZgu7oWNOjz1WTgd2M5J2gnXE54FmGLbHHBb8oKBNcpCTS4
 6/gH/3v5zILbDOnuxcfqarN4OjvcB8d9ja9AA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ucutE9tVrKg8bG1XX/lcHYR1DORerY7wTTSfiDErO4Y=;
 b=YSH8j5fSfZGnXk4T2jvN5yDHoLssj3cYDJ7UNFtuFHZOwF4YBz9VO64e4lIZgvFRLJ
 g3KdLuuTAla7zdP1DnNXiJRAvZsaLR8Eujas/dpQflSDnHFK3B+Q+EWoJBu1gWsonSAr
 zhtJ6ZE13bwZ1789RmXH+TL5Cn89wbqAYtduh5PluFe+4a9mzMfbDGOa6eUqGO2jpNKI
 VwwPxJvSbZv5F89gLq2+GwtOJ3e9iCvzm4P6SBJJqT0aCGSL/2pTtg5DYLs9gWQJcYWQ
 MYz531wwXmFqeqahoLYjegu8RjkLfp6tp1Ll5btjHB53uIt0EDfGZgNW5OLzOYxBng5M
 +1Wg==
X-Gm-Message-State: AOAM531dYL34CnjHKqaqWMk1gihc2JEtmcjh5kk2CuZeG7+OnWH1+Jb+
 X3iREHtx59OoI/5mG+PeJ7Egqw==
X-Google-Smtp-Source: ABdhPJz4SARPNc66CChB2hShzHi2iGX8D1M1gjyOuRd3fn77dLJW2FXa5gHf0Q6IrbHt0pXvjzsdvQ==
X-Received: by 2002:a1c:a90f:: with SMTP id s15mr2203893wme.154.1612348493733; 
 Wed, 03 Feb 2021 02:34:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b11sm2957419wrp.60.2021.02.03.02.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 02:34:53 -0800 (PST)
Date: Wed, 3 Feb 2021 11:34:50 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 02/13] drm: remove drm_fb_helper_modinit
Message-ID: <YBp8ShiKbQSPCcRx@phenom.ffwll.local>
Mail-Followup-To: Christoph Hellwig <hch@lst.de>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Jessica Yu <jeyu@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, live-patching@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20210128181421.2279-1-hch@lst.de>
 <20210128181421.2279-3-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128181421.2279-3-hch@lst.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Petr Mladek <pmladek@suse.com>, Jiri Kosina <jikos@kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Masahiro Yamada <masahiroy@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 live-patching@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
 Joe Lawrence <joe.lawrence@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Jessica Yu <jeyu@kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miroslav Benes <mbenes@suse.cz>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 28, 2021 at 07:14:10PM +0100, Christoph Hellwig wrote:
> drm_fb_helper_modinit has a lot of boilerplate for what is not very
> simple functionality.  Just open code it in the only caller using
> IS_ENABLED and IS_MODULE, and skip the find_module check as a
> request_module is harmless if the module is already loaded (and not
> other caller has this find_module check either).
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Hm I thought I've acked this one already somewhere for merging through
your tree.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_crtc_helper_internal.h | 10 ---------
>  drivers/gpu/drm/drm_fb_helper.c            | 21 ------------------
>  drivers/gpu/drm/drm_kms_helper_common.c    | 25 +++++++++++-----------
>  3 files changed, 12 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_crtc_helper_internal.h b/drivers/gpu/drm/drm_crtc_helper_internal.h
> index 25ce42e799952c..61e09f8a8d0ff0 100644
> --- a/drivers/gpu/drm/drm_crtc_helper_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_helper_internal.h
> @@ -32,16 +32,6 @@
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_modes.h>
>  
> -/* drm_fb_helper.c */
> -#ifdef CONFIG_DRM_FBDEV_EMULATION
> -int drm_fb_helper_modinit(void);
> -#else
> -static inline int drm_fb_helper_modinit(void)
> -{
> -	return 0;
> -}
> -#endif
> -
>  /* drm_dp_aux_dev.c */
>  #ifdef CONFIG_DRM_DP_AUX_CHARDEV
>  int drm_dp_aux_dev_init(void);
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 4b81195106875d..0b9f1ae1b7864c 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -2499,24 +2499,3 @@ void drm_fbdev_generic_setup(struct drm_device *dev,
>  	drm_client_register(&fb_helper->client);
>  }
>  EXPORT_SYMBOL(drm_fbdev_generic_setup);
> -
> -/* The Kconfig DRM_KMS_HELPER selects FRAMEBUFFER_CONSOLE (if !EXPERT)
> - * but the module doesn't depend on any fb console symbols.  At least
> - * attempt to load fbcon to avoid leaving the system without a usable console.
> - */
> -int __init drm_fb_helper_modinit(void)
> -{
> -#if defined(CONFIG_FRAMEBUFFER_CONSOLE_MODULE) && !defined(CONFIG_EXPERT)
> -	const char name[] = "fbcon";
> -	struct module *fbcon;
> -
> -	mutex_lock(&module_mutex);
> -	fbcon = find_module(name);
> -	mutex_unlock(&module_mutex);
> -
> -	if (!fbcon)
> -		request_module_nowait(name);
> -#endif
> -	return 0;
> -}
> -EXPORT_SYMBOL(drm_fb_helper_modinit);
> diff --git a/drivers/gpu/drm/drm_kms_helper_common.c b/drivers/gpu/drm/drm_kms_helper_common.c
> index 221a8528c9937a..f933da1656eb52 100644
> --- a/drivers/gpu/drm/drm_kms_helper_common.c
> +++ b/drivers/gpu/drm/drm_kms_helper_common.c
> @@ -64,19 +64,18 @@ MODULE_PARM_DESC(edid_firmware,
>  
>  static int __init drm_kms_helper_init(void)
>  {
> -	int ret;
> -
> -	/* Call init functions from specific kms helpers here */
> -	ret = drm_fb_helper_modinit();
> -	if (ret < 0)
> -		goto out;
> -
> -	ret = drm_dp_aux_dev_init();
> -	if (ret < 0)
> -		goto out;
> -
> -out:
> -	return ret;
> +	/*
> +	 * The Kconfig DRM_KMS_HELPER selects FRAMEBUFFER_CONSOLE (if !EXPERT)
> +	 * but the module doesn't depend on any fb console symbols.  At least
> +	 * attempt to load fbcon to avoid leaving the system without a usable
> +	 * console.
> +	 */
> +	if (IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION) &&
> +	    IS_MODULE(CONFIG_FRAMEBUFFER_CONSOLE) &&
> +	    !IS_ENABLED(CONFIG_EXPERT))
> +		request_module_nowait("fbcon");
> +
> +	return drm_dp_aux_dev_init();
>  }
>  
>  static void __exit drm_kms_helper_exit(void)
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
