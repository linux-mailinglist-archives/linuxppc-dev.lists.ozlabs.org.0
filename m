Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A032FDB96
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 07:40:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44stlt1XV7zDqNP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 15:40:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="J9Diuxq2"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44stkN40yqzDqNN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 15:38:51 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44stkC0TTWz9v2FH;
 Mon, 29 Apr 2019 07:38:43 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=J9Diuxq2; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id QfqWnvAqRgfA; Mon, 29 Apr 2019 07:38:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44stkB6Pcmz9v2FG;
 Mon, 29 Apr 2019 07:38:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556516322; bh=ZKKrFmF/Qg7y1/xbUklGb27c326MUz9UlbNLYXon2fI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=J9Diuxq2CKRI5daT6QxO9P+maJQTTshn/k9aWCkJaN+4TLYCGUrR8BHuHJ6VekJxd
 VHYNNTVFbFqLw/Z+MPa2LxVAUyT4VmZfltRR8jO8hNjdiSk7/7xFFD+ilCM55ogcSU
 sCTnqdoE5VFPs2q8IWq44XrcNdIbR6dv3wohMXG8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4FC8D8B798;
 Mon, 29 Apr 2019 07:38:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qBvGq3zh-Vxg; Mon, 29 Apr 2019 07:38:47 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 25E2E8B795;
 Mon, 29 Apr 2019 07:38:47 +0200 (CEST)
Subject: Re: [PATCH v2 1/2] powerpc/perf: init pmu from core-book3s
To: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, mpe@ellerman.id.au
References: <1556506368-29329-1-git-send-email-maddy@linux.vnet.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <b3678667-a550-8ab2-c904-99f92e4251be@c-s.fr>
Date: Mon, 29 Apr 2019 07:38:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556506368-29329-1-git-send-email-maddy@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 29/04/2019 à 04:52, Madhavan Srinivasan a écrit :
> Currenty pmu driver file for each ppc64 generation processor
> has a __init call in itself. Refactor the code by moving the
> __init call to core-books.c. This also clean's up compat mode
> pmu driver registration.

Can you explain the advantage of doing so ?
For me it makes more sense to have independant drivers with their own 
init call.


> 
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
> ---
> Changelog v1:
> - Added "internal.h" file and moved the extern definitions to that file
> 
>   arch/powerpc/perf/core-book3s.c | 28 ++++++++++++++++++++++++++++
>   arch/powerpc/perf/internal.h    | 16 ++++++++++++++++
>   arch/powerpc/perf/power5+-pmu.c |  4 +---
>   arch/powerpc/perf/power5-pmu.c  |  4 +---
>   arch/powerpc/perf/power6-pmu.c  |  4 +---
>   arch/powerpc/perf/power7-pmu.c  |  4 +---
>   arch/powerpc/perf/power8-pmu.c  |  3 +--
>   arch/powerpc/perf/power9-pmu.c  |  3 +--
>   arch/powerpc/perf/ppc970-pmu.c  |  4 +---
>   9 files changed, 51 insertions(+), 19 deletions(-)
>   create mode 100644 arch/powerpc/perf/internal.h
> 
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index b0723002a396..a96f9420139c 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -22,6 +22,10 @@
>   #include <asm/ptrace.h>
>   #include <asm/code-patching.h>
>   
> +#ifdef CONFIG_PPC64

Can we avoid that CONFIG_PPC64 ifdef ? Why isn't it compatible with PPC32 ?

> +#include "internal.h"
> +#endif
> +
>   #define BHRB_MAX_ENTRIES	32
>   #define BHRB_TARGET		0x0000000000000002
>   #define BHRB_PREDICTION		0x0000000000000001
> @@ -2294,3 +2298,27 @@ int register_power_pmu(struct power_pmu *pmu)
>   			  power_pmu_prepare_cpu, NULL);
>   	return 0;
>   }
> +
> +#ifdef CONFIG_PPC64

Same, why PPC64 ?

> +static int __init init_ppc64_pmu(void)
> +{
> +	/* run through all the pmu drivers one at a time */
> +	if (!init_power5_pmu())
> +		return 0;
> +	else if (!init_power5p_pmu())
> +		return 0;
> +	else if (!init_power6_pmu())
> +		return 0;
> +	else if (!init_power7_pmu())
> +		return 0;
> +	else if (!init_power8_pmu())
> +		return 0;
> +	else if (!init_power9_pmu())
> +		return 0;
> +	else if (!init_ppc970_pmu())
> +		return 0;
> +	else
> +		return -ENODEV;
> +}
> +early_initcall(init_ppc64_pmu);
> +#endif
> diff --git a/arch/powerpc/perf/internal.h b/arch/powerpc/perf/internal.h
> new file mode 100644
> index 000000000000..e54d524d4283
> --- /dev/null
> +++ b/arch/powerpc/perf/internal.h
> @@ -0,0 +1,16 @@
> +/*
> + * Copyright 2019 Madhavan Srinivasan, IBM Corporation.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + */
> +
> +extern int init_ppc970_pmu(void);
> +extern int init_power5_pmu(void);
> +extern int init_power5p_pmu(void);
> +extern int init_power6_pmu(void);
> +extern int init_power7_pmu(void);
> +extern int init_power8_pmu(void);
> +extern int init_power9_pmu(void);

'extern' keyword is pointless, please remove it (checkpatch --strict 
probably told it to you).


Christophe


> diff --git a/arch/powerpc/perf/power5+-pmu.c b/arch/powerpc/perf/power5+-pmu.c
> index 0526dac66007..9aa803504cb2 100644
> --- a/arch/powerpc/perf/power5+-pmu.c
> +++ b/arch/powerpc/perf/power5+-pmu.c
> @@ -677,7 +677,7 @@ static struct power_pmu power5p_pmu = {
>   	.cache_events		= &power5p_cache_events,
>   };
>   
> -static int __init init_power5p_pmu(void)
> +int init_power5p_pmu(void)
>   {
>   	if (!cur_cpu_spec->oprofile_cpu_type ||
>   	    (strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power5+")
> @@ -686,5 +686,3 @@ static int __init init_power5p_pmu(void)
>   
>   	return register_power_pmu(&power5p_pmu);
>   }
> -
> -early_initcall(init_power5p_pmu);
> diff --git a/arch/powerpc/perf/power5-pmu.c b/arch/powerpc/perf/power5-pmu.c
> index 4dc99f9f7962..30cb13d081a9 100644
> --- a/arch/powerpc/perf/power5-pmu.c
> +++ b/arch/powerpc/perf/power5-pmu.c
> @@ -618,7 +618,7 @@ static struct power_pmu power5_pmu = {
>   	.flags			= PPMU_HAS_SSLOT,
>   };
>   
> -static int __init init_power5_pmu(void)
> +int init_power5_pmu(void)
>   {
>   	if (!cur_cpu_spec->oprofile_cpu_type ||
>   	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power5"))
> @@ -626,5 +626,3 @@ static int __init init_power5_pmu(void)
>   
>   	return register_power_pmu(&power5_pmu);
>   }
> -
> -early_initcall(init_power5_pmu);
> diff --git a/arch/powerpc/perf/power6-pmu.c b/arch/powerpc/perf/power6-pmu.c
> index 9c9d646b68a1..80ec48632cfe 100644
> --- a/arch/powerpc/perf/power6-pmu.c
> +++ b/arch/powerpc/perf/power6-pmu.c
> @@ -540,7 +540,7 @@ static struct power_pmu power6_pmu = {
>   	.cache_events		= &power6_cache_events,
>   };
>   
> -static int __init init_power6_pmu(void)
> +int init_power6_pmu(void)
>   {
>   	if (!cur_cpu_spec->oprofile_cpu_type ||
>   	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power6"))
> @@ -548,5 +548,3 @@ static int __init init_power6_pmu(void)
>   
>   	return register_power_pmu(&power6_pmu);
>   }
> -
> -early_initcall(init_power6_pmu);
> diff --git a/arch/powerpc/perf/power7-pmu.c b/arch/powerpc/perf/power7-pmu.c
> index 6dbae9884ec4..bb6efd5d2530 100644
> --- a/arch/powerpc/perf/power7-pmu.c
> +++ b/arch/powerpc/perf/power7-pmu.c
> @@ -445,7 +445,7 @@ static struct power_pmu power7_pmu = {
>   	.cache_events		= &power7_cache_events,
>   };
>   
> -static int __init init_power7_pmu(void)
> +int init_power7_pmu(void)
>   {
>   	if (!cur_cpu_spec->oprofile_cpu_type ||
>   	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power7"))
> @@ -456,5 +456,3 @@ static int __init init_power7_pmu(void)
>   
>   	return register_power_pmu(&power7_pmu);
>   }
> -
> -early_initcall(init_power7_pmu);
> diff --git a/arch/powerpc/perf/power8-pmu.c b/arch/powerpc/perf/power8-pmu.c
> index d12a2db26353..bcc3409a06de 100644
> --- a/arch/powerpc/perf/power8-pmu.c
> +++ b/arch/powerpc/perf/power8-pmu.c
> @@ -379,7 +379,7 @@ static struct power_pmu power8_pmu = {
>   	.bhrb_nr		= 32,
>   };
>   
> -static int __init init_power8_pmu(void)
> +int init_power8_pmu(void)
>   {
>   	int rc;
>   
> @@ -399,4 +399,3 @@ static int __init init_power8_pmu(void)
>   
>   	return 0;
>   }
> -early_initcall(init_power8_pmu);
> diff --git a/arch/powerpc/perf/power9-pmu.c b/arch/powerpc/perf/power9-pmu.c
> index 030544e35959..3a31ac6f4805 100644
> --- a/arch/powerpc/perf/power9-pmu.c
> +++ b/arch/powerpc/perf/power9-pmu.c
> @@ -437,7 +437,7 @@ static struct power_pmu power9_pmu = {
>   	.bhrb_nr		= 32,
>   };
>   
> -static int __init init_power9_pmu(void)
> +int init_power9_pmu(void)
>   {
>   	int rc = 0;
>   	unsigned int pvr = mfspr(SPRN_PVR);
> @@ -467,4 +467,3 @@ static int __init init_power9_pmu(void)
>   
>   	return 0;
>   }
> -early_initcall(init_power9_pmu);
> diff --git a/arch/powerpc/perf/ppc970-pmu.c b/arch/powerpc/perf/ppc970-pmu.c
> index 8b6a8a36fa38..1d3370914022 100644
> --- a/arch/powerpc/perf/ppc970-pmu.c
> +++ b/arch/powerpc/perf/ppc970-pmu.c
> @@ -490,7 +490,7 @@ static struct power_pmu ppc970_pmu = {
>   	.flags			= PPMU_NO_SIPR | PPMU_NO_CONT_SAMPLING,
>   };
>   
> -static int __init init_ppc970_pmu(void)
> +int init_ppc970_pmu(void)
>   {
>   	if (!cur_cpu_spec->oprofile_cpu_type ||
>   	    (strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/970")
> @@ -499,5 +499,3 @@ static int __init init_ppc970_pmu(void)
>   
>   	return register_power_pmu(&ppc970_pmu);
>   }
> -
> -early_initcall(init_ppc970_pmu);
> 
