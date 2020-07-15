Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4F2220568
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 08:49:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B67Jr0PNHzDqFB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 16:49:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lixom.net
 (client-ip=2607:f8b0:4864:20::143; helo=mail-il1-x143.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=D+l25n5b; dkim-atps=neutral
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B67GV6tzdzDqg8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 16:46:58 +1000 (AEST)
Received: by mail-il1-x143.google.com with SMTP id h16so1044420ilj.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 23:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ia+M7c1s6u4QzvRmg9F+yYUkSaBCxJOCiZePFvIuDVc=;
 b=D+l25n5bcv1TSbCDuyiTk2BK9pkdINNUwW67aGOacRlIyk0ySLjsGWzDcPBj31btQV
 uDr2HcZeXtm3d3NwwZOa3vRzLezh5c0YssPAMkbS4z+ueh4VLm6jhtIsezInCY+VOLYl
 BWZMjKveeau7A9dBxlUHol1MsZAX4gMmGiQ22HEQSAMHuE1v8qFSSyrhqJ/IvSH0bD1O
 mBebeftKbgCJRjoXd4nqNPwbuhndA7VOSBCMd+m7SUzXm4ERmEfKnrRO9kPL69Dl3KM4
 KsO97+80nmLk1lFqu5rINAAxsAApi+EPfJlcn8P3YWd2UyctKlIKgf7jwSTcD25f0bRS
 0frg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ia+M7c1s6u4QzvRmg9F+yYUkSaBCxJOCiZePFvIuDVc=;
 b=Ooyev9+Z7KOxb1ZrQava0C4q5EZNTjJZWNe0a0pv/IiZds6HSbjAzMyLh4azXCTTeg
 MYQq/TLvLO3DD2B23JL53C5nN8QTQCgjuTueNPlVp9EOTCXj7orjcV4wnyXSWz7vY0Ry
 dzon6roFUrFPtyhWqpFDOnljYOYaJR/vkWsOnRaYh5VxTx93QtePoLXvWQJhpScsk14y
 VgMsXC9fPrXJuPwW5dfIpdY+1oLtGNDmKAltRUTEYWGiNP9OktYbQpuoM9rlJJ5TaxhN
 OOgWGbmMmDwDsPRol7SATorSRzx6CTuQwGOUb/sbVo30cGkcPlT4iSLIXV/nq3sRuV3E
 aWpw==
X-Gm-Message-State: AOAM530qJV0UtLHuegOPkqlAuUNTWMmIXv8gLYEo6JYzXh+28T/6WpLM
 e8ppP57sBxShPem8Is+dGinEv0UQ4fLzZHjDwhjwcg==
X-Google-Smtp-Source: ABdhPJyNtTQ6tjiuB0fOsiGMKDn204hJD42fgcPc/S+ZwIlU4lbiCn47FJ7HiWLEM0DrOPmZUmzgdMVyttDg+xz5UnM=
X-Received: by 2002:a92:49c3:: with SMTP id k64mr7793042ilg.278.1594795615165; 
 Tue, 14 Jul 2020 23:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200714145049.2496163-1-lee.jones@linaro.org>
 <20200714145049.2496163-6-lee.jones@linaro.org>
 <CAOesGMjCZMyWLe+tpNFstC88odeSCKS8bM6Oj9cpaj6j7U94rQ@mail.gmail.com>
 <20200715063311.GP1398296@dell>
In-Reply-To: <20200715063311.GP1398296@dell>
From: Olof Johansson <olof@lixom.net>
Date: Tue, 14 Jul 2020 23:46:44 -0700
Message-ID: <CAOesGMjnyq7iRQBopBQ2Dn7ziNGo4cjdKhceL0=gxrt1MuZY1g@mail.gmail.com>
Subject: Re: [PATCH 05/13] cpufreq/arch: powerpc: pasemi: Move prototypes to
 shared header
To: Lee Jones <lee.jones@linaro.org>
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
Cc: linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, viresh kumar <viresh.kumar@linaro.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 14, 2020 at 11:33 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Tue, 14 Jul 2020, Olof Johansson wrote:
>
> > On Tue, Jul 14, 2020 at 7:50 AM Lee Jones <lee.jones@linaro.org> wrote:
> > >
> > > If function callers and providers do not share the same prototypes th=
e
> > > compiler complains of missing prototypes.  Fix this by moving the
> > > already existing prototypes out to a mutually convenient location.
> > >
> > > Fixes the following W=3D1 kernel build warning(s):
> > >
> > >  drivers/cpufreq/pasemi-cpufreq.c:109:5: warning: no previous prototy=
pe for =E2=80=98check_astate=E2=80=99 [-Wmissing-prototypes]
> > >  109 | int check_astate(void)
> > >  | ^~~~~~~~~~~~
> > >  drivers/cpufreq/pasemi-cpufreq.c:114:6: warning: no previous prototy=
pe for =E2=80=98restore_astate=E2=80=99 [-Wmissing-prototypes]
> > >  114 | void restore_astate(int cpu)
> > >  | ^~~~~~~~~~~~~~
> > >
> > > Cc: Olof Johansson <olof@lixom.net>
> > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > > Cc: Paul Mackerras <paulus@samba.org>
> > > Cc: linuxppc-dev@lists.ozlabs.org
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > ---
> > >  arch/powerpc/platforms/pasemi/pasemi.h    | 15 ------------
> > >  arch/powerpc/platforms/pasemi/powersave.S |  2 ++
> > >  drivers/cpufreq/pasemi-cpufreq.c          |  1 +
> > >  include/linux/platform_data/pasemi.h      | 28 +++++++++++++++++++++=
++
> > >  4 files changed, 31 insertions(+), 15 deletions(-)
> > >  create mode 100644 include/linux/platform_data/pasemi.h
> > >
> > > diff --git a/arch/powerpc/platforms/pasemi/pasemi.h b/arch/powerpc/pl=
atforms/pasemi/pasemi.h
> > > index 70b56048ed1be..528d81ef748ad 100644
> > > --- a/arch/powerpc/platforms/pasemi/pasemi.h
> > > +++ b/arch/powerpc/platforms/pasemi/pasemi.h
> > > @@ -15,21 +15,6 @@ extern void __init pasemi_map_registers(void);
> > >  extern void idle_spin(void);
> > >  extern void idle_doze(void);
> > >
> > > -/* Restore astate to last set */
> > > -#ifdef CONFIG_PPC_PASEMI_CPUFREQ
> > > -extern int check_astate(void);
> > > -extern void restore_astate(int cpu);
> > > -#else
> > > -static inline int check_astate(void)
> > > -{
> > > -       /* Always return >0 so we never power save */
> > > -       return 1;
> > > -}
> > > -static inline void restore_astate(int cpu)
> > > -{
> > > -}
> > > -#endif
> > > -
> > >  extern struct pci_controller_ops pasemi_pci_controller_ops;
> > >
> > >  #endif /* _PASEMI_PASEMI_H */
> > > diff --git a/arch/powerpc/platforms/pasemi/powersave.S b/arch/powerpc=
/platforms/pasemi/powersave.S
> > > index d0215d5329ca7..7747b48963286 100644
> > > --- a/arch/powerpc/platforms/pasemi/powersave.S
> > > +++ b/arch/powerpc/platforms/pasemi/powersave.S
> > > @@ -5,6 +5,8 @@
> > >   * Maintained by: Olof Johansson <olof@lixom.net>
> > >   */
> > >
> > > +#include <linux/platform_data/pasemi.h>
> > > +
> > >  #include <asm/processor.h>
> > >  #include <asm/page.h>
> > >  #include <asm/ppc_asm.h>
> > > diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasem=
i-cpufreq.c
> > > index c66f566a854cb..c6bb3ecc90ef3 100644
> > > --- a/drivers/cpufreq/pasemi-cpufreq.c
> > > +++ b/drivers/cpufreq/pasemi-cpufreq.c
> > > @@ -15,6 +15,7 @@
> > >  #include <linux/timer.h>
> > >  #include <linux/module.h>
> > >  #include <linux/of_address.h>
> > > +#include <linux/platform_data/pasemi.h>
> > >
> > >  #include <asm/hw_irq.h>
> > >  #include <asm/io.h>
> > > diff --git a/include/linux/platform_data/pasemi.h b/include/linux/pla=
tform_data/pasemi.h
> > > new file mode 100644
> > > index 0000000000000..3fed0687fcc9a
> > > --- /dev/null
> > > +++ b/include/linux/platform_data/pasemi.h
> > > @@ -0,0 +1,28 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * Copyright (C) 2020 Linaro Ltd.
> > > + *
> > > + * Author: Lee Jones <lee.jones@linaro.org>
> > > + */
> >
> > Absolutely not. It's neither your copyright, nor your authorship.
>
> The file was new.  Anyway, the point is now moot.

The contents was copied and pasted from other material, not originally
produced by you.

I suggest you consult with Linaro lawyers on how to handle this if you
have to do something like it in the future.


-Olof
