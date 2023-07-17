Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F9F75657A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 15:52:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XQxrKqum;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4NnD57Dnz2ygc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 23:52:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XQxrKqum;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=vincent.guittot@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4NmK15BBz2yDk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 23:51:42 +1000 (AEST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51e57874bfdso6513837a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 06:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689601896; x=1692193896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NulYZ8ud4nInsNBQFR40gOVy/EmAPlV46bxx7L81M2Y=;
        b=XQxrKqumcE5BJeMv4hSTn+OmzCSSE+ZvJaS9+fzmjERjYVI9DkoIxm7qHAwhh1FGtK
         qSjzC5UPjBecrY1rlDFPNzhzE6q35bPflZHDjSBICuCjGZliXW/JPKfrxWhiYkjXwJxk
         G96ok6hZ94+HTmSG6+n6+fGoHyiCmmowwZD/FmnA2SJls3LfQB/ntw5AmPmeEbs9O8q0
         QXU6RACOZB3y/CdqS3zm9mpNlrrVQy/1WmoWiQmKZvwVDx1kYXjIgzQfCQ8CMOoV/j9Y
         8RUv7mYOvNW7emgWj4SU/i4gO/YtbZxOjCikvlswf1TvktCfNg0ubhC5tiTYoAB14vQ0
         Qzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689601896; x=1692193896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NulYZ8ud4nInsNBQFR40gOVy/EmAPlV46bxx7L81M2Y=;
        b=PpJlPYiWWTiX7ckNXS/iIWlrZI1Ns2hYfZMOfCnHkxBx/kBSIR/7oAvhpXDffdBVPi
         CJSLH8tx2Cc0Cp4FfMeJ9vKmQpKoS4cj0MOOgBuUDf1yJrQJnzxAG90qKOrykDRTzHlK
         RozLD09FHph7dJKzVVchV0sgw7CGg46aqDWf96l9Vs1xx8dYbbuNYPYlJEvLKAyqYJs8
         Vb7GIfBdBqbNq11WaZ7632n6VHaDZqWJZxB3CRWl1my/G8DP6kkolD5iY5o2dht2Oh6J
         udERF972XwKZEiSnMqhJkJYsGK5bSG38tkYQusou4WhPRZaGiQhMMrr/QgvkyeZy1wyE
         a6mA==
X-Gm-Message-State: ABy/qLbeK9Ixmp8wHHumMj0j34x2RC2Nvzvnv5/tI1HhDJLdLbRFFR67
	WjM2KSoz8XeOTdv9yvvy3EKSDMPnM1vEP29yZ9t7UA==
X-Google-Smtp-Source: APBJJlHRA1Kd6KxmUkMK+sDmqVQDSQxRd9Zs6lwubeUK+Y99P8Hyjgw+sj58YmkdcatBITyjrQr3mA6+X5fviJN0q80=
X-Received: by 2002:aa7:d98c:0:b0:521:8817:cc5d with SMTP id
 u12-20020aa7d98c000000b005218817cc5dmr3807048eds.34.1689601896196; Mon, 17
 Jul 2023 06:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230712141056.GI3100107@hirez.programming.kicks-ass.net>
In-Reply-To: <20230712141056.GI3100107@hirez.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 17 Jul 2023 15:51:25 +0200
Message-ID: <CAKfTPtBga3CMVNGt5YEJiyfWDiWWQ0c+5_EAzY0spMFiUQBMmA@mail.gmail.com>
Subject: Re: [RFC][PATCH] sched: Rename DIE domain
To: Peter Zijlstra <peterz@infradead.org>
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
Cc: juri.lelli@redhat.com, dave.hansen@linux.intel.com, bsegall@google.com, hpa@zytor.com, agordeev@linux.ibm.com, linux-s390@vger.kernel.org, vschneid@redhat.com, x86@kernel.org, mingo@redhat.com, mgorman@suse.de, borntraeger@linux.ibm.com, gor@linux.ibm.com, hca@linux.ibm.com, npiggin@gmail.com, bp@alien8.de, rostedt@goodmis.org, Thomas Gleixner <tglx@linutronix.de>, dietmar.eggemann@arm.com, bristot@redhat.com, linux-kernel@vger.kernel.org, svens@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 12 Jul 2023 at 16:11, Peter Zijlstra <peterz@infradead.org> wrote:
>
> Hi
>
> Thomas just tripped over the x86 topology setup creating a 'DIE' domain
> for the package mask :-)

May be a link to the change that triggers this patch could be useful

>
> Since these names are SCHED_DEBUG only, rename them.
> I don't think anybody *should* be relying on this, but who knows.

Apart the remaining reference to DIE already mentioned by others,
looks good to me

>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  arch/powerpc/kernel/smp.c   | 2 +-
>  arch/s390/kernel/topology.c | 2 +-
>  arch/x86/kernel/smpboot.c   | 2 +-
>  kernel/sched/topology.c     | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index fbbb695bae3d..5ed6b9fe5094 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1050,7 +1050,7 @@ static struct sched_domain_topology_level powerpc_topology[] = {
>  #endif
>         { shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE) },
>         { cpu_mc_mask, SD_INIT_NAME(MC) },
> -       { cpu_cpu_mask, SD_INIT_NAME(DIE) },
> +       { cpu_cpu_mask, SD_INIT_NAME(PKG) },
>         { NULL, },
>  };
>
> diff --git a/arch/s390/kernel/topology.c b/arch/s390/kernel/topology.c
> index 68adf1de8888..c803f5e6ab46 100644
> --- a/arch/s390/kernel/topology.c
> +++ b/arch/s390/kernel/topology.c
> @@ -522,7 +522,7 @@ static struct sched_domain_topology_level s390_topology[] = {
>         { cpu_coregroup_mask, cpu_core_flags, SD_INIT_NAME(MC) },
>         { cpu_book_mask, SD_INIT_NAME(BOOK) },
>         { cpu_drawer_mask, SD_INIT_NAME(DRAWER) },
> -       { cpu_cpu_mask, SD_INIT_NAME(DIE) },
> +       { cpu_cpu_mask, SD_INIT_NAME(PKG) },
>         { NULL, },
>  };
>
> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> index e1aa2cd7734b..09cc9d0aa358 100644
> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c
> @@ -653,7 +653,7 @@ static void __init build_sched_topology(void)
>          */
>         if (!x86_has_numa_in_package) {
>                 x86_topology[i++] = (struct sched_domain_topology_level){
> -                       cpu_cpu_mask, SD_INIT_NAME(DIE)
> +                       cpu_cpu_mask, SD_INIT_NAME(PKG)
>                 };
>         }
>
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index d3a3b2646ec4..e9d9cf776b7a 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -1670,7 +1670,7 @@ static struct sched_domain_topology_level default_topology[] = {
>  #ifdef CONFIG_SCHED_MC
>         { cpu_coregroup_mask, cpu_core_flags, SD_INIT_NAME(MC) },
>  #endif
> -       { cpu_cpu_mask, SD_INIT_NAME(DIE) },
> +       { cpu_cpu_mask, SD_INIT_NAME(PKG) },
>         { NULL, },
>  };
>
>
