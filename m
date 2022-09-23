Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFC35E74B8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 09:18:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYk661jZ7z3cdX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 17:18:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.50; helo=mail-qv1-f50.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYk5j5Vmyz30R7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 17:18:33 +1000 (AEST)
Received: by mail-qv1-f50.google.com with SMTP id z9so8474719qvn.9
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 00:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=6vg6B8D/hQyHxlC2HaS8TXm7SR0b9itjbd+F1YgR9rg=;
        b=3vE8kehNUtKltbOFDJUqKDwLTDFYHc7d9pLzSnw1JDSOm/KQoS2x5+Y7FoE3S1asFm
         1FUuuDtqDmhBfmyLiCUIkFp2ytsclBWsnUtySsfr2woCB+K5CMuJqqKeWwpLunc0Zoz5
         PQrA2ikvkSKG1IQXV/aSpzaIS0TSlfD9n7dDzx63aemIMYfbZFc2nxF6uaRqjuU/oC0f
         ehyNZj8tLlPG+Qx+4pLFjaMkvt75beiKILFXdBMW03uXolAr1M2j+N9An0n3xMbJRry5
         4hevEcArH8YmEeijVtK20QdLbq1tf3PCg30ryq8wyk9eY97W5cLcV7r+JM1gKALiV0fA
         DHhg==
X-Gm-Message-State: ACrzQf1/uyVdDCuWgfijf8X27/zH8HE2XanLmo8RykIuzFTksCvV6GhK
	6bad87OfIxYwX2xk5ZTZe1RJzLZSVh/6JQ==
X-Google-Smtp-Source: AMsMyM45CmJa3EBYh3zQm8jPYHY7n/CuGoFISUIBn37Q9iDuWZ3clGjcTD5Mo+PwBzncYUhmzc1ARw==
X-Received: by 2002:a0c:da14:0:b0:4aa:aad9:e450 with SMTP id x20-20020a0cda14000000b004aaaad9e450mr5870952qvj.130.1663917510971;
        Fri, 23 Sep 2022 00:18:30 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id cp4-20020a05622a420400b0035cdd7a42d0sm4739050qtb.22.2022.09.23.00.18.28
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 00:18:29 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-345528ceb87so122858257b3.11
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 00:18:28 -0700 (PDT)
X-Received: by 2002:a81:78f:0:b0:34d:74c0:1110 with SMTP id
 137-20020a81078f000000b0034d74c01110mr7049955ywh.383.1663917508700; Fri, 23
 Sep 2022 00:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220922113306.11251-1-tzimmermann@suse.de> <20220922113306.11251-5-tzimmermann@suse.de>
In-Reply-To: <20220922113306.11251-5-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Sep 2022 09:18:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXM2JmnVAgCjSAAf2swX=2T7h5wtFcfWZ5uJEbs5GCvqg@mail.gmail.com>
Message-ID: <CAMuHMdXM2JmnVAgCjSAAf2swX=2T7h5wtFcfWZ5uJEbs5GCvqg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/ofdrm: Support color management
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
> Support the CRTC's color-management property and implement each model's
> palette support.
>
> The OF hardware has different methods of setting the palette. The
> respective code has been taken from fbdev's offb and refactored into
> per-model device functions. The device functions integrate this
> functionality into the overall modesetting.
>
> As palette handling is a CRTC property that depends on the primary
> plane's color format, the plane's atomic_check helper now updates the
> format field in ofdrm's custom CRTC state. The CRTC's atomic_flush
> helper updates the palette for the format as needed.
>
> v3:
>         * lookup CRTC state with drm_atomic_get_new_crtc_state()
>         * access HW palette with writeb(), writel(), and readl() (Ben)
>         * declare register values as u32
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks for your patch!


> --- a/drivers/gpu/drm/tiny/ofdrm.c
> +++ b/drivers/gpu/drm/tiny/ofdrm.c

> +static void __iomem *ofdrm_qemu_cmap_ioremap(struct ofdrm_device *odev,
> +                                            struct device_node *of_node,
> +                                            u64 fb_base)
> +{
> +#ifdef __BIG_ENDIAN
> +       static const __be32 io_of_addr[3] = { 0x01000000, 0x0, 0x0 };
> +#else
> +       static const __be32 io_of_addr[3] = { 0x00000001, 0x0, 0x0 };
> +#endif

You can easily get rid of the #ifdef:

    static const __be32 io_of_addr[3] = { cpu_to_be32(0x01000000), 0x0, 0x0 };

And probably sparse ("make C=2") will complain about the plain zeros,
so "cpu_to_be32(0x0)" as well.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
