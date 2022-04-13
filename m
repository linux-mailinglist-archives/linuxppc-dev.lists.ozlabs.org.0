Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 551814FF9EA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 17:20:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdmWM2t1rz3bc9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Apr 2022 01:20:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.219.172;
 helo=mail-yb1-f172.google.com; envelope-from=rjwysocki@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdmVz5YYRz2x9V
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Apr 2022 01:20:25 +1000 (AEST)
Received: by mail-yb1-f172.google.com with SMTP id g34so4403020ybj.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 08:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w2Lgy0xxZ/kq35mN9jTEDe99/KAY+dTqIri9HO0ska8=;
 b=wmcRmXjHt3exdVlOQN2HdVyrr4bQF3bCpZQfS/FDw4nQhFB3hD6NcIlxL+UrIJJc7c
 8AyUUcGZBhnGeTOQFRUrGlgw1GVFc+T+M/jDisnN3G235MoCG8AjerxKKUagVce4gzUr
 3por/PEI1om8AmfsPdKAiKQHHuLtJNGbCXh+iOzagz+FrWn5peIIFK17st5oFWz/eyvl
 lsb3FlqxT6UCeYAMScDvacn2Lk+hOlJE/MbiyehzxW2VnYF2tQgWt6gtJ1MycZ13ZiOH
 apHA1s2Tc0DkIhiJDmixbYcQeNdkcP2gsB+T/QzGw2OPu5CP0Fb37krC3L0kw9XTPZWw
 cu/w==
X-Gm-Message-State: AOAM533lbTezgudC/Udar7Fm+9nYCUVVHZrbdScpJp+mI1LXqR5BvPoo
 OURgMQ5ZWA5SWytmzwxwU4AsBz0tLo3JZ+iieDY=
X-Google-Smtp-Source: ABdhPJwOIpKOGRh6wLe+b2eqyMIagCZXSSwKkMG4Q0iaM3xYCmKqKl32u8IbpWSAjNHIgVdbn8Ltt5Bh6VA0YsVmI+o=
X-Received: by 2002:a25:3cc3:0:b0:63e:6ee9:4840 with SMTP id
 j186-20020a253cc3000000b0063e6ee94840mr22598626yba.153.1649863222281; Wed, 13
 Apr 2022 08:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <4cb0c4573cce165657ad1f7275c4b3852cbcd115.1648833416.git.christophe.leroy@csgroup.eu>
 <20220404062710.m6bzpg5gsx4x7tm5@vireshk-i7>
In-Reply-To: <20220404062710.m6bzpg5gsx4x7tm5@vireshk-i7>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 13 Apr 2022 17:20:11 +0200
Message-ID: <CAJZ5v0itEsDDWPYPYJkY5xbs1t97uMx3P3pL1Qg_jrA63aXw_Q@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: Prepare cleanup of powerpc's asm/prom.h
To: Viresh Kumar <viresh.kumar@linaro.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Linux PM <linux-pm@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 4, 2022 at 8:27 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 01-04-22, 19:24, Christophe Leroy wrote:
> > powerpc's asm/prom.h brings some headers that it doesn't
> > need itself.
> >
> > In order to clean it up, first add missing headers in
> > users of asm/prom.h
> >
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > ---
> >  drivers/cpufreq/pasemi-cpufreq.c      | 1 -
> >  drivers/cpufreq/pmac32-cpufreq.c      | 2 +-
> >  drivers/cpufreq/pmac64-cpufreq.c      | 2 +-
> >  drivers/cpufreq/ppc_cbe_cpufreq.c     | 1 -
> >  drivers/cpufreq/ppc_cbe_cpufreq_pmi.c | 2 +-
> >  5 files changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasemi-cpufreq.c
> > index 815645170c4d..039a66bbe1be 100644
> > --- a/drivers/cpufreq/pasemi-cpufreq.c
> > +++ b/drivers/cpufreq/pasemi-cpufreq.c
> > @@ -18,7 +18,6 @@
> >
> >  #include <asm/hw_irq.h>
> >  #include <asm/io.h>
> > -#include <asm/prom.h>
> >  #include <asm/time.h>
> >  #include <asm/smp.h>
> >
> > diff --git a/drivers/cpufreq/pmac32-cpufreq.c b/drivers/cpufreq/pmac32-cpufreq.c
> > index 4f20c6a9108d..20f64a8b0a35 100644
> > --- a/drivers/cpufreq/pmac32-cpufreq.c
> > +++ b/drivers/cpufreq/pmac32-cpufreq.c
> > @@ -24,7 +24,7 @@
> >  #include <linux/device.h>
> >  #include <linux/hardirq.h>
> >  #include <linux/of_device.h>
> > -#include <asm/prom.h>
> > +
> >  #include <asm/machdep.h>
> >  #include <asm/irq.h>
> >  #include <asm/pmac_feature.h>
> > diff --git a/drivers/cpufreq/pmac64-cpufreq.c b/drivers/cpufreq/pmac64-cpufreq.c
> > index d7542a106e6b..ba9c31d98bd6 100644
> > --- a/drivers/cpufreq/pmac64-cpufreq.c
> > +++ b/drivers/cpufreq/pmac64-cpufreq.c
> > @@ -22,7 +22,7 @@
> >  #include <linux/completion.h>
> >  #include <linux/mutex.h>
> >  #include <linux/of_device.h>
> > -#include <asm/prom.h>
> > +
> >  #include <asm/machdep.h>
> >  #include <asm/irq.h>
> >  #include <asm/sections.h>
> > diff --git a/drivers/cpufreq/ppc_cbe_cpufreq.c b/drivers/cpufreq/ppc_cbe_cpufreq.c
> > index c58abb4cca3a..e3313ce63b38 100644
> > --- a/drivers/cpufreq/ppc_cbe_cpufreq.c
> > +++ b/drivers/cpufreq/ppc_cbe_cpufreq.c
> > @@ -12,7 +12,6 @@
> >  #include <linux/of_platform.h>
> >
> >  #include <asm/machdep.h>
> > -#include <asm/prom.h>
> >  #include <asm/cell-regs.h>
> >
> >  #include "ppc_cbe_cpufreq.h"
> > diff --git a/drivers/cpufreq/ppc_cbe_cpufreq_pmi.c b/drivers/cpufreq/ppc_cbe_cpufreq_pmi.c
> > index 037fe23bc6ed..4fba3637b115 100644
> > --- a/drivers/cpufreq/ppc_cbe_cpufreq_pmi.c
> > +++ b/drivers/cpufreq/ppc_cbe_cpufreq_pmi.c
> > @@ -13,9 +13,9 @@
> >  #include <linux/init.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/pm_qos.h>
> > +#include <linux/slab.h>
> >
> >  #include <asm/processor.h>
> > -#include <asm/prom.h>
> >  #include <asm/pmi.h>
> >  #include <asm/cell-regs.h>
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Applied as 5.19 material.

If the powerpc folks decide to take it, I can drop it, so please let me know.
