Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 384D55E74A5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 09:15:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYk1l0Wv9z3cjH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 17:15:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.46; helo=mail-qv1-f46.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYk1G6N6Gz3bSS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 17:14:40 +1000 (AEST)
Received: by mail-qv1-f46.google.com with SMTP id y9so8495933qvo.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 00:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=S3UyUtioqiLswQVfydApgd1DWgeD5a9i4NJMAx10xfU=;
        b=l7vaUoh/hE+toxrBZimcI6Zu4mKUl9naScoXOITpceXII/p1onOAzJ4agpTrkn+5de
         LPVERJDgGAiaHol1TgCY1268r+p0cztv728ZXJDqsKc4ikVUysQxyUO7LITiWImzJGDU
         hGv5R7yh1HGGttk5xfKn3DcI2ebViQ6OLqBIy6Ns7xhx4Pr39Wl2jLaeO6Ntf3p/u+iF
         LYgAGS6aXtkcQL+pszM6L1/gsB0wmiMHfXjwtfMVmbN+yU3M8PeATk2d0de8qYe+sKtS
         N95Ln26Bo1bBq6QfvjUBpVOjix7FcoIzn/BdCoGRRebIAS7bVb0e2EzlbxMs19jT7BZl
         3p2w==
X-Gm-Message-State: ACrzQf0k3o/IRlEZsFwYyh4qjTSIuz8a8nCn5dt79RuK7NB15dT09vvY
	ZB6eP+cBQdfuhXnMehfA4+DhEtdDTDywlg==
X-Google-Smtp-Source: AMsMyM42s+6yZnK6bBguvIQ7XcltteLDwP3cPQzbaTRaTIP/XLPAPyYa+rC+kc/aXi5J6CB6drLdiA==
X-Received: by 2002:a05:6214:2486:b0:4a5:8b:9ba0 with SMTP id gi6-20020a056214248600b004a5008b9ba0mr5949694qvb.70.1663917277307;
        Fri, 23 Sep 2022 00:14:37 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id v6-20020a05620a0f0600b006bc0980db76sm5553517qkl.126.2022.09.23.00.14.36
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 00:14:36 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-324ec5a9e97so123034647b3.7
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 00:14:36 -0700 (PDT)
X-Received: by 2002:a0d:de43:0:b0:349:31bd:e8d5 with SMTP id
 h64-20020a0dde43000000b0034931bde8d5mr6762932ywe.283.1663917276015; Fri, 23
 Sep 2022 00:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220922113306.11251-1-tzimmermann@suse.de> <20220922113306.11251-2-tzimmermann@suse.de>
In-Reply-To: <20220922113306.11251-2-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Sep 2022 09:14:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW1echz6wc6Y2cfjrkPa2vZW+X4s83rXo7VebJ0E+qaqg@mail.gmail.com>
Message-ID: <CAMuHMdW1echz6wc6Y2cfjrkPa2vZW+X4s83rXo7VebJ0E+qaqg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] drm/ofdrm: Add ofdrm for Open Firmware framebuffers
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
Cc: linux-fbdev@vger.kernel.org, airlied@linux.ie, deller@gmx.de, linuxppc-dev@lists.ozlabs.org, mark.cave-ayland@ilande.co.uk, javierm@redhat.com, dri-devel@lists.freedesktop.org, paulus@samba.org, maxime@cerno.tech, daniel@ffwll.ch, msuchanek@suse.de, sam@ravnborg.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Thomas,

On Thu, Sep 22, 2022 at 1:33 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Open Firmware provides basic display output via the 'display' node.
> DT platform code already provides a device that represents the node's
> framebuffer. Add a DRM driver for the device. The display mode and
> color format is pre-initialized by the system's firmware. Runtime
> modesetting via DRM is not possible. The display is useful during
> early boot stages or as error fallback.
>
> Similar functionality is already provided by fbdev's offb driver,
> which is insufficient for modern userspace. The old driver includes
> support for BootX device tree, which can be found on old 32-bit
> PowerPC Macintosh systems. If these are still in use, the
> functionality can be added to ofdrm or implemented in a new
> driver. As with simpledrm, the fbdev driver cannot be selected if
> ofdrm is already enabled.

Thanks for your patch!

> The driver has been tested on qemu's ppc64le emulation. The device
> hand-over has been tested with bochs.

Oh, tested on little-endian only ;-)

> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/ofdrm.c
> +static const struct drm_format_info *display_get_validated_format(struct drm_device *dev,
> +                                                                 u32 depth)
> +{
> +       const struct drm_format_info *info;
> +       u32 format;
> +
> +       switch (depth) {
> +       case 8:
> +               format = drm_mode_legacy_fb_format(8, 8);
> +               break;
> +       case 15:
> +       case 16:
> +               format = drm_mode_legacy_fb_format(16, depth);
> +               break;
> +       case 32:
> +               format = drm_mode_legacy_fb_format(32, 24);

Shouldn't all of these use drm_driver_legacy_fb_format() (and the
driver set drm_mode_config.quirk_addfb_prefer_host_byte_order) to have
a chance of working on traditional big-endian PPC?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
