Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B4E21E7A5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 07:42:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5Tt92mKfzDqYJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 15:42:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::141;
 helo=mail-il1-x141.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nbRZ2QQC; dkim-atps=neutral
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5Tr86GDKzDqM1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 15:40:24 +1000 (AEST)
Received: by mail-il1-x141.google.com with SMTP id a11so13274534ilk.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 22:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oxSuKo34ZHVOPmDk3m1umIsfNowOjSxwsF9+a++GflE=;
 b=nbRZ2QQCM/mSzcSVzrzFaiLsIXuqnvdgRKyEENm/lglZZye484fA/O0y+kQJ0Hh2WG
 WpL5KRwjXeh6bYVoqrNmI/xYK+U8PVfaZBhtKwL31OkkSIAOUG9qNQj+lQjyhTWUIiH4
 Ln0Tb1VvCOAL0ahrFpRF269YIV2NN6Sh6iqRSRlctRvOk6j9YLptCM7SymfhZDu/J2H7
 SFv9N4Mp+uCTVi2DWPevwwC8iYN/PrTFLWp5/EbdtKt2acKVW890PZJ/n8dD7qcBh9uV
 AmKJTSCYCUG0VZOG/whfIP76tkQiuZgTV8U7hXD8xHRCLJcXspwu65FnOlr9VUX7ZIsj
 JKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oxSuKo34ZHVOPmDk3m1umIsfNowOjSxwsF9+a++GflE=;
 b=exmSUHNymfTnEitjyhbbOM8ySPlrbZZJStalM/i4vWSruxlQgn69l3fInOvGkYMWjV
 yE4azopcIKZqjabNmSs+U5FMRhjDv8e8bwCD6lQzJXbZry3I6lPgDZlv2czEv6lxMRGJ
 4G7SjdZEjeXPYFQ4zqbFD90/PmymMRTOI3wCr/uIMVvttyrkEj61DyTuMYIOlHNGHdK3
 30Crf0zpTon2e8RZIHJ1p3iZNQEelD/IgPGy7yqTCmKXKfrSElJNO8+nDUyJddvZwMtM
 BXbOQaQQCU5TuV7edBkENiTm04ICe21Z4ESD5Pp/HlJGLR9pvX+k8E3/MKJmC+uCa+qG
 T8Kw==
X-Gm-Message-State: AOAM531vXwLvNhgNOce81Gpf3SyXoc+ecatHiOABgl2dodN1jyJDqf+n
 4JnJfqZ8aJNysTNibGGATvbuwRaOKI0O6dT0oBU=
X-Google-Smtp-Source: ABdhPJyRxljjSY0QfBoEz80UXzJm2yKb7P2ST+eJfI3KFbO+qAdhO/otthwDS30w3LnHFU4VQvItCPU7v/xSEgm6Zgo=
X-Received: by 2002:a92:cf51:: with SMTP id c17mr3072956ilr.122.1594705221101; 
 Mon, 13 Jul 2020 22:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200714043624.5648-1-srikar@linux.vnet.ibm.com>
 <20200714043624.5648-6-srikar@linux.vnet.ibm.com>
In-Reply-To: <20200714043624.5648-6-srikar@linux.vnet.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 14 Jul 2020 15:40:09 +1000
Message-ID: <CAOSf1CGmHuyiW_s6DgaNbBEzUhq0qsuQ0ODPYvH+X9je3VWxwA@mail.gmail.com>
Subject: Re: [PATCH 05/11] powerpc/smp: Dont assume l2-cache to be superset of
 sibling
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Oliver OHalloran <oliveroh@au1.ibm.com>, Michael Neuling <mikey@linux.ibm.com>,
 Michael Ellerman <michaele@au1.ibm.com>, Anton Blanchard <anton@au1.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nick Piggin <npiggin@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 14, 2020 at 2:45 PM Srikar Dronamraju
<srikar@linux.vnet.ibm.com> wrote:
>
> Current code assumes that cpumask of cpus sharing a l2-cache mask will
> always be a superset of cpu_sibling_mask.
>
> Lets stop that assumption.

It's been a while since I looked, but I'm pretty sure the scheduler
requires child domains to be subsets of their parents. Why is this
necessary or a good idea?

> Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
> Cc: Michael Ellerman <michaele@au1.ibm.com>
> Cc: Nick Piggin <npiggin@au1.ibm.com>
> Cc: Oliver OHalloran <oliveroh@au1.ibm.com>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Michael Neuling <mikey@linux.ibm.com>
> Cc: Anton Blanchard <anton@au1.ibm.com>
> Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
> Cc: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/smp.c | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
>
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 7d430fc536cc..875f57e41355 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1198,6 +1198,7 @@ static bool update_mask_by_l2(int cpu, struct cpumask *(*mask_fn)(int))
>         struct device_node *l2_cache, *np;
>         int i;
>
> +       cpumask_set_cpu(cpu, mask_fn(cpu));

?

>         l2_cache = cpu_to_l2cache(cpu);
>         if (!l2_cache)
>                 return false;
> @@ -1284,29 +1285,30 @@ static void add_cpu_to_masks(int cpu)
>          * add it to it's own thread sibling mask.
>          */
>         cpumask_set_cpu(cpu, cpu_sibling_mask(cpu));
> +       cpumask_set_cpu(cpu, cpu_core_mask(cpu));
>
>         for (i = first_thread; i < first_thread + threads_per_core; i++)
>                 if (cpu_online(i))
>                         set_cpus_related(i, cpu, cpu_sibling_mask);
>
>         add_cpu_to_smallcore_masks(cpu);
> -       /*
> -        * Copy the thread sibling mask into the cache sibling mask
> -        * and mark any CPUs that share an L2 with this CPU.
> -        */
> -       for_each_cpu(i, cpu_sibling_mask(cpu))
> -               set_cpus_related(cpu, i, cpu_l2_cache_mask);
>         update_mask_by_l2(cpu, cpu_l2_cache_mask);
>
> -       /*
> -        * Copy the cache sibling mask into core sibling mask and mark
> -        * any CPUs on the same chip as this CPU.
> -        */
> -       for_each_cpu(i, cpu_l2_cache_mask(cpu))
> -               set_cpus_related(cpu, i, cpu_core_mask);
> +       if (pkg_id == -1) {
> +               struct cpumask *(*mask)(int) = cpu_sibling_mask;
> +
> +               /*
> +                * Copy the sibling mask into core sibling mask and
> +                * mark any CPUs on the same chip as this CPU.
> +                */
> +               if (shared_caches)
> +                       mask = cpu_l2_cache_mask;
> +
> +               for_each_cpu(i, mask(cpu))
> +                       set_cpus_related(cpu, i, cpu_core_mask);
>
> -       if (pkg_id == -1)
>                 return;
> +       }
>
>         for_each_cpu(i, cpu_online_mask)
>                 if (get_physical_package_id(i) == pkg_id)
> --
> 2.17.1
>
