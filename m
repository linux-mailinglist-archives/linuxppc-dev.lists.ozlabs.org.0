Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4C5470BF2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 21:39:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9jSc4J3lz3bmr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 07:39:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=BRCUsPR0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.123;
 helo=smtp-relay-internal-1.canonical.com;
 envelope-from=alexandre.ghiti@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=BRCUsPR0; 
 dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9jRw66Nrz2yng
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 07:39:08 +1100 (AEDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 30B3A3F1BA
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 20:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1639168739;
 bh=5yoGUr7pzPnZBDOdChvpH3bNEBPR4tkHUNd2RR7JJH4=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=BRCUsPR06OVqA3BSsD2JDjbk0HpixY2uxOL+YPspNWLiElif4YZ/QmhfKPeNczP17
 kt7Lm2ZJbHUmiPzO+Ow4d3qOY2kQfEeaUFUnW7TS2SYvychOKysswYMLNh/FSS/CH5
 a7QEzF7+Tpned5dvgBdKfCfCNoM7+yV6M7DtZJdWJtr2yj3EEOFc6OIo1Fmu/0LbeR
 BhAmQ29pvEZHK592tlMl5l9hFP5OoCBJDNAJRWoFd/CxH24OR34Xe8HbhZ4yyzd8J3
 gbIX64rcF1/C/s+ReLqKPbtPFk0z6kySgnRaLhMrigwqK2VLGYVRvH/UER1lgkkUEI
 5pENmOAe6qpMQ==
Received: by mail-ed1-f70.google.com with SMTP id
 c1-20020aa7c741000000b003e7bf1da4bcso9125034eds.21
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 12:38:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5yoGUr7pzPnZBDOdChvpH3bNEBPR4tkHUNd2RR7JJH4=;
 b=S9dDSQ2+0y61OfFJfeCcgyNmftIXl2nYAWgBzLeZUmXTmSYj8R04dgRdWHevZLxvg6
 B1Q8bCIEtc3C6KHtSuWSpfhKcb8yUejrmiF5uOpZgfyNxiG/35GInL1I4aSleQL17KAz
 x7RANrl/6tBjACJOQeVdD7FScoIrPthBbBG+t3B2Z63ehR4t8sAeNbhWUGE2is1EHbHV
 osjlOUQZwxu8CFPrFgYQVF/d4gVtbc8o/CeuQkYXZiKzp4/CDoPzqTUBgAPafeNSGWzt
 R+GVT9BoE3mCtI+IfBTExM60rx6Z9fpeIboUSDwiqG8Dw7cjV5QvVojQPNpOlxTuLcK2
 yLzg==
X-Gm-Message-State: AOAM531qsnZ6Lxgv2WWM9NRGt9v/ONQRbAlv9QxouvYZy7xqYQfPrkHs
 KYSP1X1BOuBPMGFZ+UHNNyMIpckXVEF9M5dRjGFpmbM89pKgEgh2z5kwDkRE7zzajNonRXYxZnp
 a8D+V322EhCtNFHvzRll4h7t7qtnIrsAHHXzYUzRoQ+ut1ybQHSAjFnwrIVg=
X-Received: by 2002:a05:6402:274c:: with SMTP id
 z12mr43261404edd.294.1639168738751; 
 Fri, 10 Dec 2021 12:38:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgA236x/yjx6TWkXOleXezvnEgrIAVa1yzBQb8Ze+JaO9/0KXgBOBtxlFprZiSdLFnjBlcdw/PZl80G6UL+y4=
X-Received: by 2002:a05:6402:274c:: with SMTP id
 z12mr43261361edd.294.1639168738589; 
 Fri, 10 Dec 2021 12:38:58 -0800 (PST)
MIME-Version: 1.0
References: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
 <CAK8P3a2AnLJgGNBFvjUQqXd-Az9vjgE7yJQXGDwCav5E0btSsg@mail.gmail.com>
In-Reply-To: <CAK8P3a2AnLJgGNBFvjUQqXd-Az9vjgE7yJQXGDwCav5E0btSsg@mail.gmail.com>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Fri, 10 Dec 2021 21:38:47 +0100
Message-ID: <CA+zEjCtajRJhs8zSdR_oFBOO3P5FWWZJ3L6N-GK+JnUjdymTiA@mail.gmail.com>
Subject: Re: [PATCH 0/7] Cleanup after removal of configs
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: Rich Felker <dalias@libc.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Lee Jones <lee.jones@linaro.org>, linux-cifs@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Linux-sh list <linux-sh@vger.kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-cachefs@redhat.com, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Kalle Valo <kvalo@codeaurora.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 samba-technical@lists.samba.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-power@fi.rohmeurope.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 5, 2021 at 4:56 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Nov 5, 2021 at 4:43 PM Alexandre Ghiti
> <alexandre.ghiti@canonical.com> wrote:
> >
> > While bumping from 5.13 to 5.15, I found that a few deleted configs had
> > left some pieces here and there: this patchset cleans that.
> >
> > Alexandre Ghiti (7):
> >   Documentation, arch: Remove leftovers from fscache/cachefiles
> >     histograms
> >   Documentation, arch: Remove leftovers from raw device
> >   Documentation, arch: Remove leftovers from CIFS_WEAK_PW_HASH
> >   arch: Remove leftovers from mandatory file locking
> >   Documentation, arch, fs: Remove leftovers from fscache object list
> >   include: mfd: Remove leftovers from bd70528 watchdog
> >   arch: Remove leftovers from prism54 wireless driver
>
> Looks all good to me, thanks a lot for the cleanup!
>
> For arch/arm/configs:
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
>
> assuming this goes through someone else's tree. Let me know if you need me
> to pick up the patches in the asm-generic tree for cross-architecture work.

Arnd, do you mind taking the whole series except patch 6 ("include:
mfd: Remove leftovers from bd70528 watchdog") as this will be handled
separately. I can ask Jonathan for the doc patches if needed.

Thanks,

Alex

>
>          Arnd
