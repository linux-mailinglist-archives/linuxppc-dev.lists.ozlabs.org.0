Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ABA74F45B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 18:05:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0m1P3snNz3f8k
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 02:05:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.45; helo=mail-ot1-f45.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0m0s2KRfz3bZK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 02:05:00 +1000 (AEST)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6b708b97418so5224240a34.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 09:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689091497; x=1691683497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7zt5pO69xVTkx3WPA+RT/byFcn7lDWoK0rY+7VhmSY=;
        b=Ny/QS9C/uXSDaG+tU914fu7Ne27RdePEZQbvamRCnGR1kOJYFqEJvBCBSzm2ZQFw7l
         xfARvLRcfSgYDmU5FRNVOKr6Rkf15rd126A/hf0qrOrnOdhxH39pFnwQu/BIMBq/26cP
         NjpxXs9w0T2CbtK1PWRuab0TqF5kaHw5fndovKp/M2EbC8nMB31x4sYA46uem4G1nLNf
         GBI0CWVbwHmn39ykuI3Ytmjz5NtkSJXAsZFTq9tMRfrDXXEQaakmQ7WtT7yBtKTBxX1+
         CgQj6cqdnwYJA0YuH37BTtOVt8Hp0agQqSx5kxpBuKdHr/AqBFJFGz6RK/JbQ7y10qpt
         JCFg==
X-Gm-Message-State: ABy/qLZwtD7cFnrvWo0rfXl6tgCX0RMM2edeWxH+ZMI3i/z6TVZNORqB
	qvXKzPb/Oz54wioWQEtqPukKbmzLNCgKZA==
X-Google-Smtp-Source: APBJJlEUrtgSZhTsEWsmFXAPdX7FiPm1y2EgDFBszl9hIfK1ouarZdHeIaRJZUgEHg7fy+N7cvB4aw==
X-Received: by 2002:a9d:7d94:0:b0:6b9:741a:a410 with SMTP id j20-20020a9d7d94000000b006b9741aa410mr4888660otn.6.1689091497465;
        Tue, 11 Jul 2023 09:04:57 -0700 (PDT)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com. [209.85.167.181])
        by smtp.gmail.com with ESMTPSA id r7-20020a9d7507000000b006b79a338581sm1026726otk.64.2023.07.11.09.04.56
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 09:04:56 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3a3b7fafd61so4811030b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 09:04:56 -0700 (PDT)
X-Received: by 2002:a05:6358:4198:b0:132:7a2e:87bc with SMTP id
 w24-20020a056358419800b001327a2e87bcmr13654687rwc.5.1689091495810; Tue, 11
 Jul 2023 09:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230710130113.14563-1-tzimmermann@suse.de> <20230710171903.GA14712@ravnborg.org>
 <ab92f8d9-36ab-06bc-b85b-d52b7a1bfe9a@suse.de> <20230711144744.GA117276@ravnborg.org>
 <bf439387-6b13-0fd9-f61b-1a5cbf731187@gmx.de>
In-Reply-To: <bf439387-6b13-0fd9-f61b-1a5cbf731187@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Jul 2023 18:04:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXnTDK6uZNhNR=NFTiy4F+2nLJd1E47vDoXUV3zFSCGOA@mail.gmail.com>
Message-ID: <CAMuHMdXnTDK6uZNhNR=NFTiy4F+2nLJd1E47vDoXUV3zFSCGOA@mail.gmail.com>
Subject: Re: [PATCH 00/17] fbdev: Remove FBINFO_DEFAULT and
 FBINFO_FLAG_DEFAULT flags
To: Helge Deller <deller@gmx.de>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org, amd-gfx@lists.freedesktop.org, javierm@redhat.com, dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org, linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, linux-geode@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Helge,

On Tue, Jul 11, 2023 at 5:26=E2=80=AFPM Helge Deller <deller@gmx.de> wrote:
> On 7/11/23 16:47, Sam Ravnborg wrote:
> > On Tue, Jul 11, 2023 at 08:24:40AM +0200, Thomas Zimmermann wrote:
> >> Am 10.07.23 um 19:19 schrieb Sam Ravnborg:
> >>> On Mon, Jul 10, 2023 at 02:50:04PM +0200, Thomas Zimmermann wrote:
> >>>> Remove the unused flags FBINFO_DEFAULT and FBINFO_FLAG_DEFAULT from
> >>>> fbdev and drivers, as briefly discussed at [1]. Both flags were mayb=
e
> >>>> useful when fbdev had special handling for driver modules. With
> >>>> commit 376b3ff54c9a ("fbdev: Nuke FBINFO_MODULE"), they are both 0
> >>>> and have no further effect.
> >>>>
> >>>> Patches 1 to 7 remove FBINFO_DEFAULT from drivers. Patches 2 to 5
> >>>> split this by the way the fb_info struct is being allocated. All fla=
gs
> >>>> are cleared to zero during the allocation.
> >>>>
> >>>> Patches 8 to 16 do the same for FBINFO_FLAG_DEFAULT. Patch 8 fixes
> >>>> an actual bug in how arch/sh uses the tokne for struct fb_videomode,
> >>>> which is unrelated.
> >>>>
> >>>> Patch 17 removes both flag constants from <linux/fb.h>
> >>>
> >>> We have a few more flags that are unused - should they be nuked too?
> >>> FBINFO_HWACCEL_FILLRECT
> >>> FBINFO_HWACCEL_ROTATE
> >>> FBINFO_HWACCEL_XPAN
> >>
> >> It seems those are there for completeness. Nothing sets _ROTATE,
>
> I think some fbdev drivers had hardware acceleration for ROTATE in the
> past. HWACCEL_XPAN is still in some drivers.
>
> >> the others are simply never checked. According to the comments,
> >> some are required, some are optional. I don't know what that
> >> means.
>
> I think it's OK if you remove those flags which aren't used anywhere,
> e.g. FBINFO_HWACCEL_ROTATE.

Indeed.

> >> IIRC there were complains about performance when Daniel tried to remov=
e
> >> fbcon acceleration, so not all _HWACCEL_ flags are unneeded.
>
> Correct. I think COPYAREA and FILLRECT are the bare minimum to accelerate
> fbcon, IMAGEBLIT is for showing the tux penguin (?),
> XPAN/YPAN and YWRAP for some hardware screen panning needed by some drive=
rs
> (not sure if this is still used as I don't have such hardware, Geert?).

Yes, they are used.  Anything that is handled in drivers/video/fbdev/core/
is used:

$ git grep  HWACCEL_ -- drivers/video/fbdev/core/
drivers/video/fbdev/core/fbcon.c:       if ((info->flags &
FBINFO_HWACCEL_COPYAREA) &&
drivers/video/fbdev/core/fbcon.c:           !(info->flags &
FBINFO_HWACCEL_DISABLED))
drivers/video/fbdev/core/fbcon.c:       int good_pan =3D (cap &
FBINFO_HWACCEL_YPAN) &&
drivers/video/fbdev/core/fbcon.c:       int good_wrap =3D (cap &
FBINFO_HWACCEL_YWRAP) &&
drivers/video/fbdev/core/fbcon.c:       int fast_copyarea =3D (cap &
FBINFO_HWACCEL_COPYAREA) &&
drivers/video/fbdev/core/fbcon.c:               !(cap &
FBINFO_HWACCEL_DISABLED);
drivers/video/fbdev/core/fbcon.c:       int fast_imageblit =3D (cap &
FBINFO_HWACCEL_IMAGEBLIT) &&
drivers/video/fbdev/core/fbcon.c:               !(cap &
FBINFO_HWACCEL_DISABLED);

BTW, I'm surprised FBINFO_HWACCEL_FILLRECT is not handled.
But looking at the full history, it never was...

> >> Leaving them in for reference/completeness might be an option; or not.=
 I
> >> have no strong feelings about those flags.
>
> I'd say drop FBINFO_HWACCEL_ROTATE at least ?

Agreed.

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
