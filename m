Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D3457CE12
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 16:46:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lpb4c1GCJz3dqZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jul 2022 00:46:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.222.181; helo=mail-qk1-f181.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lpb4B636Qz3blB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jul 2022 00:46:34 +1000 (AEST)
Received: by mail-qk1-f181.google.com with SMTP id o21so1419016qkm.10
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 07:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uRb/kpCM2Tp3RADIUm8HgY748KiyFCtoEV6JEoibXAk=;
        b=X2cEfnSzZ0et8hS8AtCoj5l+q53d2QaMa7+L/vq4ZS0MgCq306rkZBZcgMgjOxwntN
         unFgwhAaJFFJ5tWjLubjSGs8m2cjZnI1ca6BHXMX8kfkCdzK1jnQIGcjFuNN2EW4dH54
         g5lrdG1y2DMWCI9I/meeirMPDGzW70WjM8VpQXwFHRx1XXbMQq0Vw9VYFXC+1drTdgqb
         pMwXMpMtsr0Z1DPBDnc7ZBJk7gRN7rBJEk0GK6cdN7Eq/1eJg4LXxFViu5m2X8w4JYak
         CFZEuTOMYGzncckxiWUUnrgLWAQqBBX3F+q7l8q0FRBrT+YyDlHU99P5EOBimR/bY4FI
         fTPg==
X-Gm-Message-State: AJIora+YbPxDa0FtY/roAuzo3IsweaVGzVMmPVtHNOnDwJopxK2GecNr
	GGONW1NklUC7MCeJIoY5fNayaB25My1j1A==
X-Google-Smtp-Source: AGRyM1siCYdjBNDSpP7iEEyy8s1R4SinK8JOUlFMtjejt6cym60tPo5s7MyAlSib1v9t6+34s9yXOA==
X-Received: by 2002:a37:815:0:b0:6b5:ce31:31bf with SMTP id 21-20020a370815000000b006b5ce3131bfmr21295297qki.560.1658414790712;
        Thu, 21 Jul 2022 07:46:30 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id k20-20020a05622a03d400b0031eb5648b86sm1446546qtx.41.2022.07.21.07.46.29
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 07:46:30 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id f73so3110965yba.10
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 07:46:29 -0700 (PDT)
X-Received: by 2002:a05:6902:154f:b0:66e:e2d3:ce1 with SMTP id
 r15-20020a056902154f00b0066ee2d30ce1mr38429480ybu.365.1658414789102; Thu, 21
 Jul 2022 07:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220720142732.32041-1-tzimmermann@suse.de> <20220720142732.32041-5-tzimmermann@suse.de>
In-Reply-To: <20220720142732.32041-5-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Jul 2022 16:46:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEah62Ho4C8NQr-qwz62pKQiJiTi8Fa4KcXNRzo7ySJA@mail.gmail.com>
Message-ID: <CAMuHMdWEah62Ho4C8NQr-qwz62pKQiJiTi8Fa4KcXNRzo7ySJA@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] drm/simpledrm: Compute framebuffer stride if not set
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>, David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Javier Martinez Canillas <javierm@redhat.com>, DRI Development <dri-devel@lists.freedesktop.org>, Paul Mackerras <paulus@samba.org>, Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>, Michal Suchanek <msuchanek@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Thomas,

On Wed, Jul 20, 2022 at 4:27 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Compute the framebuffer's scanline stride length if not given by
> the simplefb data.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -743,6 +743,9 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
>                 drm_err(dev, "no simplefb configuration found\n");
>                 return ERR_PTR(-ENODEV);
>         }
> +       if (!stride)
> +               stride = format->cpp[0] * width;

DIV_ROUND_UP(drm_format_info_bpp(format) * width, 8)

> +
>         sdev->mode = simpledrm_mode(width, height);
>         sdev->format = format;
>         sdev->pitch = stride;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
