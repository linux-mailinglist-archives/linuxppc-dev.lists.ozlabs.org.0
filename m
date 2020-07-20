Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FE522594B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 09:53:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9DVz4CVNzDqcM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 17:53:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::242;
 helo=mail-oi1-x242.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oCL2Rm8r; dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9DS24cDbzDqRD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 17:50:58 +1000 (AEST)
Received: by mail-oi1-x242.google.com with SMTP id e4so13750486oib.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 00:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=imEPoWPH8pxEZZLWgHSKw+O7wsYom1fFsNXxdzGBe+k=;
 b=oCL2Rm8r4aEZ5wyeuwGKIUbeKmOYVFp1GnlwrNNCxZK+MjhH26AWaBFXbnuQFpMh1o
 WzE36QP/lGptlxPuSbeh8/GaM/L9zAeq3pWfqLF/cL3tGbo5v7c/rnmbaxTGm6mdA7jP
 tX2H0oWRjSIty9bdhP3rY8UynoDHtbBiMy+HzVp/jXeUgXEdBTKgrTmPmPPYWB2qlVDe
 03+2NVW6GNS1oYhu4wcGwJotiSp869wp5m3atjdaOQxxbnJBvics20wMAW62fkTaVNiW
 Hd9ZYCeUUBARSSL7qwa8bY64HLsIb2qRrL33CnykqXbyaMBqJ2pApOcOyFZox8o4FXPG
 FzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=imEPoWPH8pxEZZLWgHSKw+O7wsYom1fFsNXxdzGBe+k=;
 b=r1Z2CU5SXfkhJrXeFlDomsYdZa0s3V2EhoYDH7o/WNP/HfvnoDKA/jI30B85cTYfvx
 TWn6oIDAwhnHDQMcDj8ZxecoUCKPT10i1zgx+AgL2dcGgxRQj6BwTmwUSWAFJctcQ0cZ
 Qt9ZO2pwCVOZZWZBb5P52UDQP48mk+64s0SBjU349vuBYeMpNPMCV9eNlwja6/ECJQfo
 O83XujUqzstogHhOpQjfmkIw/8JBKG/fHH1B7PpYykXDtn7Khq6draPsJlEtv/IkaHHr
 CaHOTmcKL9SakLu6mf4TIJZF2ccDyBOdGysUSlefNpGgXR4a+/Vdd27NFVi3w44QGKAQ
 nFEA==
X-Gm-Message-State: AOAM531vdMyrloqI/oxwJnI0c8XA2p7eMZGqzqgz4yreqQD/4x53uvq1
 G6w5XorKx9MUut90l86bZAZcIN06LT0wWOm7pr4=
X-Google-Smtp-Source: ABdhPJzHM8SUxJBLzQrx/IXNQgbIFUAtTq+W4djQi1qmbHN6OQzNoL5nybH99ObpR5XAHdrC9eWu8etnHr9Gi8fi/s8=
X-Received: by 2002:a54:4418:: with SMTP id k24mr16434637oiw.126.1595231454104; 
 Mon, 20 Jul 2020 00:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200714043624.5648-1-srikar@linux.vnet.ibm.com>
 <20200714043624.5648-5-srikar@linux.vnet.ibm.com>
In-Reply-To: <20200714043624.5648-5-srikar@linux.vnet.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 20 Jul 2020 17:47:27 +1000
Message-ID: <CACzsE9qoyh++qfTrNq5BXc5eAJeg8Gz2WxrWs4spG40t3c+MBg@mail.gmail.com>
Subject: Re: [PATCH 04/11] powerpc/smp: Enable small core scheduling sooner
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

On Tue, Jul 14, 2020 at 2:44 PM Srikar Dronamraju
<srikar@linux.vnet.ibm.com> wrote:
>
> Enable small core scheduling as soon as we detect that we are in a
> system that supports thread group. Doing so would avoid a redundant
> check.
>
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
>  arch/powerpc/kernel/smp.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 24529f6134aa..7d430fc536cc 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -892,6 +892,12 @@ static int init_big_cores(void)
>         }
>
>         has_big_cores = true;
> +
> +#ifdef CONFIG_SCHED_SMT
> +       pr_info("Big cores detected. Using small core scheduling\n");
Why change the wording from "Big cores detected but using small core
scheduling\n"?
> +       powerpc_topology[0].mask = smallcore_smt_mask;
> +#endif
> +
>         return 0;
>  }
>
> @@ -1383,12 +1389,6 @@ void __init smp_cpus_done(unsigned int max_cpus)
>
>         dump_numa_cpu_topology();
>
> -#ifdef CONFIG_SCHED_SMT
> -       if (has_big_cores) {
> -               pr_info("Big cores detected but using small core scheduling\n");
> -               powerpc_topology[0].mask = smallcore_smt_mask;
> -       }
> -#endif
>         set_sched_topology(powerpc_topology);
>  }
>
> --
> 2.17.1
>
