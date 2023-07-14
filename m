Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B5D75376E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 12:04:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2Rst3ynTz3cJC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 20:04:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.41; helo=mail-ot1-f41.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2RsL5NlMz30Pr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 20:04:22 +1000 (AEST)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6b9b89627c3so529060a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 03:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689329058; x=1691921058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbFWyufa2I/dKrp5bYUBMB1ESShCcC04UZ0ziSB/4oc=;
        b=WW6GT68mkHLpaGT38EDUKWNKhEXkIUqnOXYoC03cx1d8ZtbWBG263Cf2FEjxitN2NO
         4T9ktN5/RdhALJuZzvUV8mihmL12AYyBhSJRzyJPX7A2ReYn7krz3MMQTekfKAJVp/kX
         uxj9Fhww+Ag3Dt1PNIT/3M3dEhc05EJbo3YG6C0iRCgkv5q6kUYJMZidwg7auCZ87LUz
         guM4Pb+YtjyTZol6lPYpQDOI4MQTMjtUKOCH1sAKfuQR7wGahapSA3PLBtqJazXaf4n3
         0n15OtTFaV8cRnJf5+Mmgp9P1NM+KrrTm/qyd+ne94QY5Yaxhib7Gmq66gSyvXV4+694
         ZEWg==
X-Gm-Message-State: ABy/qLbn1pC9IRRutX2SsQMT3HvCr3uPSIIe9zY3yEKW+kqUBxHB5ap1
	mFlrDNYHYm/NclEaQj7sSseAzaTyGlUjvA==
X-Google-Smtp-Source: APBJJlHUdykSp0I+ukd4DXpSzJ6xV3mPtEQgvzl6zBYpeAzfInIilNA58jhhEzDiXai3b3RPjg4o+A==
X-Received: by 2002:a05:6808:1645:b0:3a3:6e8e:5168 with SMTP id az5-20020a056808164500b003a36e8e5168mr4610998oib.39.1689329058612;
        Fri, 14 Jul 2023 03:04:18 -0700 (PDT)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com. [209.85.210.43])
        by smtp.gmail.com with ESMTPSA id k2-20020a544702000000b003a422b6ff4csm2840586oik.49.2023.07.14.03.04.18
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 03:04:18 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6b87d505e28so1385073a34.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 03:04:18 -0700 (PDT)
X-Received: by 2002:a05:6358:591d:b0:135:43da:b16d with SMTP id
 g29-20020a056358591d00b0013543dab16dmr4868202rwf.11.1689329058168; Fri, 14
 Jul 2023 03:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230714075155.5686-1-tzimmermann@suse.de>
In-Reply-To: <20230714075155.5686-1-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jul 2023 12:04:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWoeyJPAgPgFi545SJFcaVCgZi1-zW2N5cBeU9BnHgo1w@mail.gmail.com>
Message-ID: <CAMuHMdWoeyJPAgPgFi545SJFcaVCgZi1-zW2N5cBeU9BnHgo1w@mail.gmail.com>
Subject: Re: [PATCH v3 00/18] fbdev: Remove FBINFO_DEFAULT and
 FBINFO_FLAG_DEFAULT flags
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org, deller@gmx.de, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, javierm@redhat.com, dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-geode@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Thomas,

On Fri, Jul 14, 2023 at 9:53=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Remove the unused flags FBINFO_DEFAULT and FBINFO_FLAG_DEFAULT from
> fbdev and drivers, as briefly discussed at [1]. Both flags were maybe
> useful when fbdev had special handling for driver modules. With
> commit 376b3ff54c9a ("fbdev: Nuke FBINFO_MODULE"), they are both 0
> and have no further effect.
>
> Patches 1 to 7 remove FBINFO_DEFAULT from drivers. Patches 2 to 5
> split this by the way the fb_info struct is being allocated. All flags
> are cleared to zero during the allocation.
>
> Patches 8 to 16 do the same for FBINFO_FLAG_DEFAULT. Patch 8 fixes
> an actual bug in how arch/sh uses the token for struct fb_videomode,
> which is unrelated.
>
> Patch 17 removes both flag constants from <linux/fb.h> and patch 18
> documents the zero'ed memory returned by framebuffer_alloc().
>
> v3:
>         * sh: include board name in commit message (Adrian)
>         * docs: reword text (Miguel)

Thanks for the update!

>   fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
>   fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
>   fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
>   fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers

Four patches with the exact same one-line summary. Please make them
unique.

>   fbdev: Remove flag FBINFO_FLAG_DEFAULT from fbdev drivers
>   fbdev: Remove flag FBINFO_FLAG_DEFAULT from fbdev drivers

Two patches with the exact same one-line summary. Please make them
unique.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
