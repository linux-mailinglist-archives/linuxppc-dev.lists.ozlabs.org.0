Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D8A2FE513
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 09:34:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLwgH709qzDqWN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 19:34:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ffwll.ch
 (client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com;
 envelope-from=daniel.vetter@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256
 header.s=google header.b=YufljbHl; dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLwdF6Xx6zDqCY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 19:33:04 +1100 (AEDT)
Received: by mail-oi1-x22a.google.com with SMTP id w8so1375678oie.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 00:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dcZ1FYPsDBKXN3hC2IcAkzYMcxDaDlTQqW6wszGPCkA=;
 b=YufljbHlHbmx/xR31VlXerp95BT7cxahfNrgURan972flhmsJdRcjQQZPRQWrNUYh4
 CnnyhIjhUyKVgMeBMcRkWiTtjRH1msLOlPhiWTVc6MPBTrLwIF55Jy/g9n0z5adm/DV4
 9g0IgTn9NeBXXyMQuIXUYV37SgwCy062PaU3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dcZ1FYPsDBKXN3hC2IcAkzYMcxDaDlTQqW6wszGPCkA=;
 b=oIB66tqlNYl9RFy15BqH8T84Ra/X/w7GIIBhSzlJLph5ll21dhRRf5Q6NO2GvepsRL
 7wHZQWc5Yo8k8rPH99+UmuqtWWZ96G8ph/WjyDf64JcF2tsfLYPIw4ufFWHo4aGwhzDA
 KC65VuIU9qiMwy3Nwk5PJN5wOwHcH4FhGBZuGUpuSzRZyBGnOkOC26DZUSDdJqC3vIvf
 C80XbfAiPWTzDLnZEQ2DxT9eiKZQrb6bUWbagsAaVpOzzudVAAIAWnFpqBmEF3ZUt8q9
 XlrPqOOqKDph59XhTa15kOeQ4RyZzU8ed4J3Zdp5mdT8CFXZ5Saw1DGmmxoTKsvKez5Y
 5LtA==
X-Gm-Message-State: AOAM531sTivEOcywsS/hYiyRJjYXUXP29xkTIWxkUK+AUCWsZd0A12MZ
 5S6spvIicU6CEtmoWT/kLz1kCljIGcRdIT5tPptO2MsUXEOmbA==
X-Google-Smtp-Source: ABdhPJzz0JkV/k4V0avoNCaP5d/Ro05hcp5CHt9s45BuCIcuqAorp3oRURqBTkqgwJQymAvgou+9FyRGO03Vf0s8NqQ=
X-Received: by 2002:aca:ad92:: with SMTP id w140mr5398682oie.128.1611217551051; 
 Thu, 21 Jan 2021 00:25:51 -0800 (PST)
MIME-Version: 1.0
References: <20210121074959.313333-1-hch@lst.de>
 <20210121074959.313333-9-hch@lst.de>
In-Reply-To: <20210121074959.313333-9-hch@lst.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 21 Jan 2021 09:25:40 +0100
Message-ID: <CAKMK7uFo3epNAUdcp0vvW=VyWMMTZghGyRTPbz_Z37S6nem_2A@mail.gmail.com>
Subject: Re: [PATCH 08/13] drm: remove drm_fb_helper_modinit
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
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
 Andrew Donnellan <ajd@linux.ibm.com>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Masahiro Yamada <masahiroy@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Marek <michal.lkml@markovi.net>,
 Joe Lawrence <joe.lawrence@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jessica Yu <jeyu@kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, live-patching@vger.kernel.org,
 Miroslav Benes <mbenes@suse.cz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 21, 2021 at 8:55 AM Christoph Hellwig <hch@lst.de> wrote:
>
> drm_fb_helper_modinit has a lot of boilerplate for what is not very
> simple functionality.  Just open code it in the only caller using
> IS_ENABLED and IS_MODULE.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

I didn't spot any dependencies with your series, should I just merge
this through drm trees? Or do you want an ack?
-Daniel

> ---
>  drivers/gpu/drm/drm_crtc_helper_internal.h | 10 ---------
>  drivers/gpu/drm/drm_fb_helper.c            | 16 -------------
>  drivers/gpu/drm/drm_kms_helper_common.c    | 26 +++++++++++-----------
>  3 files changed, 13 insertions(+), 39 deletions(-)
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
> -       return 0;
> -}
> -#endif
> -
>  /* drm_dp_aux_dev.c */
>  #ifdef CONFIG_DRM_DP_AUX_CHARDEV
>  int drm_dp_aux_dev_init(void);
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index ce6d63ca75c32a..0b9f1ae1b7864c 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -2499,19 +2499,3 @@ void drm_fbdev_generic_setup(struct drm_device *dev,
>         drm_client_register(&fb_helper->client);
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
> -       const char name[] = "fbcon";
> -
> -       if (!module_loaded(name))
> -               request_module_nowait(name);
> -#endif
> -       return 0;
> -}
> -EXPORT_SYMBOL(drm_fb_helper_modinit);
> diff --git a/drivers/gpu/drm/drm_kms_helper_common.c b/drivers/gpu/drm/drm_kms_helper_common.c
> index 221a8528c9937a..b694a7da632eae 100644
> --- a/drivers/gpu/drm/drm_kms_helper_common.c
> +++ b/drivers/gpu/drm/drm_kms_helper_common.c
> @@ -64,19 +64,19 @@ MODULE_PARM_DESC(edid_firmware,
>
>  static int __init drm_kms_helper_init(void)
>  {
> -       int ret;
> -
> -       /* Call init functions from specific kms helpers here */
> -       ret = drm_fb_helper_modinit();
> -       if (ret < 0)
> -               goto out;
> -
> -       ret = drm_dp_aux_dev_init();
> -       if (ret < 0)
> -               goto out;
> -
> -out:
> -       return ret;
> +       /*
> +        * The Kconfig DRM_KMS_HELPER selects FRAMEBUFFER_CONSOLE (if !EXPERT)
> +        * but the module doesn't depend on any fb console symbols.  At least
> +        * attempt to load fbcon to avoid leaving the system without a usable
> +        * console.
> +        */
> +       if (IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION) &&
> +           IS_MODULE(CONFIG_FRAMEBUFFER_CONSOLE) &&
> +           !IS_ENABLED(CONFIG_EXPERT) &&
> +           !module_loaded("fbcon"))
> +               request_module_nowait("fbcon");
> +
> +       return drm_dp_aux_dev_init();
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
