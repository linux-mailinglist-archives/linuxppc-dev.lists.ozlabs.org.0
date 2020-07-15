Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BC122053C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 08:38:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B67564YlfzDqfq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 16:38:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=h4/iE3yx; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B66yk4dXJzDqVP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 16:33:18 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id f18so1207974wrs.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 23:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=y2qcTFRplfCRbFvrbAjUi/DYmcVFTMj5+qY7L5YUn3g=;
 b=h4/iE3yxYK2RYq6qpnojpD6+UR6MvFYLI+m+LMjY3IiZ31k0422hJntIJgNyudY6Mr
 +2mRz6PdJyKG6sp16kW8JHuEkSyk5dn7gJs4yHaPj57fCMkHuPWy64zn/JjB60ShP5RO
 YXsTdIYy4WCBuE9kcKFwRmmZSFvlM/ZeJ0pYS1hQ+DkU8ESol734oWaCOXrxrY0xOoSt
 lBHGH9st9rHW7LnOtIxDPj4SGE8xhb296UajDEpMqg2BzcVlbtwrLSaS9UfJIcHy3o8G
 xSRKrtE5qXquE8ZoHoa5tZabj1UUClxA5eqa7A/bS0PUWsBcjzvy5Cm1+s5grty0Ieh/
 M4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=y2qcTFRplfCRbFvrbAjUi/DYmcVFTMj5+qY7L5YUn3g=;
 b=SEuN8UVyc281Acei8237/gKjqQkZtnKICz+jBvq1qpthDR3J/cXOAYK4O/dzbsFsR9
 0DhrVqIcd8KL/R2cTUcBoyGhZ2ZZV6B79O5yNRbhqci5KTB82zisvXsJYkqcbF2y07Bq
 5m45RizGBO+BhWdpKO6TAIMEF4mooeoqbkGXYvQEz5HP1cWX3KquIsq5jf8fZotH8MIy
 FHnQuCMkZvsbyD4L4v2jYZU23CpLairDz4wXV73VIRBnr9E98buVD4XfiAyWvYcT7D2B
 4auL/fW4hMmOIhPGxJhB+aLXYa+WeCGb72zk0jDp0K764SkfbDwEmF/FGGn042QI7aTP
 N6/Q==
X-Gm-Message-State: AOAM531UuOIP772TxJbC40GPwA5gyC2rQRQnOGgMAW11RuYOUl9i9CV3
 CdlPS1nKZrFVylzaCe2s8KWfKg==
X-Google-Smtp-Source: ABdhPJxgAooVf8n6ZWE9GYzvdRZD0S2ak/Kw75UBc2D120epcdLLt5p8ihYwrvyL1wj8a8x4nZJYXQ==
X-Received: by 2002:a5d:6651:: with SMTP id f17mr10310242wrw.29.1594794793952; 
 Tue, 14 Jul 2020 23:33:13 -0700 (PDT)
Received: from dell ([2.31.163.61])
 by smtp.gmail.com with ESMTPSA id o21sm1868151wmh.18.2020.07.14.23.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 23:33:13 -0700 (PDT)
Date: Wed, 15 Jul 2020 07:33:11 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 05/13] cpufreq/arch: powerpc: pasemi: Move prototypes to
 shared header
Message-ID: <20200715063311.GP1398296@dell>
References: <20200714145049.2496163-1-lee.jones@linaro.org>
 <20200714145049.2496163-6-lee.jones@linaro.org>
 <CAOesGMjCZMyWLe+tpNFstC88odeSCKS8bM6Oj9cpaj6j7U94rQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOesGMjCZMyWLe+tpNFstC88odeSCKS8bM6Oj9cpaj6j7U94rQ@mail.gmail.com>
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

On Tue, 14 Jul 2020, Olof Johansson wrote:

> On Tue, Jul 14, 2020 at 7:50 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > If function callers and providers do not share the same prototypes the
> > compiler complains of missing prototypes.  Fix this by moving the
> > already existing prototypes out to a mutually convenient location.
> >
> > Fixes the following W=1 kernel build warning(s):
> >
> >  drivers/cpufreq/pasemi-cpufreq.c:109:5: warning: no previous prototype for ‘check_astate’ [-Wmissing-prototypes]
> >  109 | int check_astate(void)
> >  | ^~~~~~~~~~~~
> >  drivers/cpufreq/pasemi-cpufreq.c:114:6: warning: no previous prototype for ‘restore_astate’ [-Wmissing-prototypes]
> >  114 | void restore_astate(int cpu)
> >  | ^~~~~~~~~~~~~~
> >
> > Cc: Olof Johansson <olof@lixom.net>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Paul Mackerras <paulus@samba.org>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  arch/powerpc/platforms/pasemi/pasemi.h    | 15 ------------
> >  arch/powerpc/platforms/pasemi/powersave.S |  2 ++
> >  drivers/cpufreq/pasemi-cpufreq.c          |  1 +
> >  include/linux/platform_data/pasemi.h      | 28 +++++++++++++++++++++++
> >  4 files changed, 31 insertions(+), 15 deletions(-)
> >  create mode 100644 include/linux/platform_data/pasemi.h
> >
> > diff --git a/arch/powerpc/platforms/pasemi/pasemi.h b/arch/powerpc/platforms/pasemi/pasemi.h
> > index 70b56048ed1be..528d81ef748ad 100644
> > --- a/arch/powerpc/platforms/pasemi/pasemi.h
> > +++ b/arch/powerpc/platforms/pasemi/pasemi.h
> > @@ -15,21 +15,6 @@ extern void __init pasemi_map_registers(void);
> >  extern void idle_spin(void);
> >  extern void idle_doze(void);
> >
> > -/* Restore astate to last set */
> > -#ifdef CONFIG_PPC_PASEMI_CPUFREQ
> > -extern int check_astate(void);
> > -extern void restore_astate(int cpu);
> > -#else
> > -static inline int check_astate(void)
> > -{
> > -       /* Always return >0 so we never power save */
> > -       return 1;
> > -}
> > -static inline void restore_astate(int cpu)
> > -{
> > -}
> > -#endif
> > -
> >  extern struct pci_controller_ops pasemi_pci_controller_ops;
> >
> >  #endif /* _PASEMI_PASEMI_H */
> > diff --git a/arch/powerpc/platforms/pasemi/powersave.S b/arch/powerpc/platforms/pasemi/powersave.S
> > index d0215d5329ca7..7747b48963286 100644
> > --- a/arch/powerpc/platforms/pasemi/powersave.S
> > +++ b/arch/powerpc/platforms/pasemi/powersave.S
> > @@ -5,6 +5,8 @@
> >   * Maintained by: Olof Johansson <olof@lixom.net>
> >   */
> >
> > +#include <linux/platform_data/pasemi.h>
> > +
> >  #include <asm/processor.h>
> >  #include <asm/page.h>
> >  #include <asm/ppc_asm.h>
> > diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasemi-cpufreq.c
> > index c66f566a854cb..c6bb3ecc90ef3 100644
> > --- a/drivers/cpufreq/pasemi-cpufreq.c
> > +++ b/drivers/cpufreq/pasemi-cpufreq.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/timer.h>
> >  #include <linux/module.h>
> >  #include <linux/of_address.h>
> > +#include <linux/platform_data/pasemi.h>
> >
> >  #include <asm/hw_irq.h>
> >  #include <asm/io.h>
> > diff --git a/include/linux/platform_data/pasemi.h b/include/linux/platform_data/pasemi.h
> > new file mode 100644
> > index 0000000000000..3fed0687fcc9a
> > --- /dev/null
> > +++ b/include/linux/platform_data/pasemi.h
> > @@ -0,0 +1,28 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (C) 2020 Linaro Ltd.
> > + *
> > + * Author: Lee Jones <lee.jones@linaro.org>
> > + */
> 
> Absolutely not. It's neither your copyright, nor your authorship.

The file was new.  Anyway, the point is now moot.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
