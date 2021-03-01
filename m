Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C021A327E0A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 13:15:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DpzkM5LLMz3cTF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 23:15:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dpzk15Gf4z30KQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Mar 2021 23:15:36 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dpzjp52Pzz9txvV;
 Mon,  1 Mar 2021 13:15:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0KGczwcSMyaq; Mon,  1 Mar 2021 13:15:26 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dpzjp2J9qz9txvT;
 Mon,  1 Mar 2021 13:15:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A5A288B798;
 Mon,  1 Mar 2021 13:15:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pAgutptj3gh6; Mon,  1 Mar 2021 13:15:31 +0100 (CET)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 680258B75B;
 Mon,  1 Mar 2021 13:15:31 +0100 (CET)
Subject: Re: [PATCH v2] powerpc/perf: Use PVR rather than oprofile field to
 determine CPU version
To: Rashmica Gupta <rashmica.g@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190206063024.8489-1-rashmica.g@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1dece1b9-a131-1121-f89c-a30b421c3c03@csgroup.eu>
Date: Mon, 1 Mar 2021 13:15:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20190206063024.8489-1-rashmica.g@gmail.com>
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
Cc: maddy@linux.vnet.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/02/2019 à 07:30, Rashmica Gupta a écrit :
> Currently the perf CPU backend drivers detect what CPU they're on using
> cur_cpu_spec->oprofile_cpu_type.
> 
> Although that works, it's a bit crufty to be using oprofile related fields,
> especially seeing as oprofile is more or less unused these days.
> 
> It also means perf is reliant on the fragile logic in setup_cpu_spec()
> which detects when we're using a logical PVR and copies back the PMU
> related fields from the raw CPU entry. So lets check the PVR directly.
> 
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
> ---
> v2: fixed misspelling of PVR_VER_E500V2

I sent out v3, adding power10 and fixing checkpatch warnings.

Christophe

> 
>   arch/powerpc/perf/e500-pmu.c    | 10 ++++++----
>   arch/powerpc/perf/e6500-pmu.c   |  5 +++--
>   arch/powerpc/perf/hv-24x7.c     |  6 +++---
>   arch/powerpc/perf/mpc7450-pmu.c |  5 +++--
>   arch/powerpc/perf/power5+-pmu.c |  6 +++---
>   arch/powerpc/perf/power5-pmu.c  |  5 +++--
>   arch/powerpc/perf/power6-pmu.c  |  5 +++--
>   arch/powerpc/perf/power7-pmu.c  |  7 ++++---
>   arch/powerpc/perf/power8-pmu.c  |  5 +++--
>   arch/powerpc/perf/power9-pmu.c  |  4 +---
>   arch/powerpc/perf/ppc970-pmu.c  |  8 +++++---
>   11 files changed, 37 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/powerpc/perf/e500-pmu.c b/arch/powerpc/perf/e500-pmu.c
> index fb664929f5da..e1a185a30928 100644
> --- a/arch/powerpc/perf/e500-pmu.c
> +++ b/arch/powerpc/perf/e500-pmu.c
> @@ -122,12 +122,14 @@ static struct fsl_emb_pmu e500_pmu = {
>   
>   static int init_e500_pmu(void)
>   {
> -	if (!cur_cpu_spec->oprofile_cpu_type)
> -		return -ENODEV;
> +	unsigned int pvr = mfspr(SPRN_PVR);
>   
> -	if (!strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc/e500mc"))
> +	/* ec500mc */
> +	if ((PVR_VER(pvr) == PVR_VER_E500MC) || (PVR_VER(pvr) == PVR_VER_E5500))
>   		num_events = 256;
> -	else if (strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc/e500"))
> +	/* e500 */
> +	else if ((PVR_VER(pvr) != PVR_VER_E500V1) &&
> +			(PVR_VER(pvr) != PVR_VER_E500V2))
>   		return -ENODEV;
>   
>   	return register_fsl_emb_pmu(&e500_pmu);
> diff --git a/arch/powerpc/perf/e6500-pmu.c b/arch/powerpc/perf/e6500-pmu.c
> index 3d877aa777b5..47c93d13da1a 100644
> --- a/arch/powerpc/perf/e6500-pmu.c
> +++ b/arch/powerpc/perf/e6500-pmu.c
> @@ -111,8 +111,9 @@ static struct fsl_emb_pmu e6500_pmu = {
>   
>   static int init_e6500_pmu(void)
>   {
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -		strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc/e6500"))
> +	unsigned int pvr = mfspr(SPRN_PVR);
> +
> +	if (PVR_VER(pvr) != PVR_VER_E6500)
>   		return -ENODEV;
>   
>   	return register_fsl_emb_pmu(&e6500_pmu);
> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
> index 72238eedc360..30dd379ddcd3 100644
> --- a/arch/powerpc/perf/hv-24x7.c
> +++ b/arch/powerpc/perf/hv-24x7.c
> @@ -1583,16 +1583,16 @@ static int hv_24x7_init(void)
>   {
>   	int r;
>   	unsigned long hret;
> +	unsigned int pvr = mfspr(SPRN_PVR);
>   	struct hv_perf_caps caps;
>   
>   	if (!firmware_has_feature(FW_FEATURE_LPAR)) {
>   		pr_debug("not a virtualized system, not enabling\n");
>   		return -ENODEV;
> -	} else if (!cur_cpu_spec->oprofile_cpu_type)
> -		return -ENODEV;
> +	}
>   
>   	/* POWER8 only supports v1, while POWER9 only supports v2. */
> -	if (!strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power8"))
> +	if (PVR_VER(pvr) == PVR_POWER8)
>   		interface_version = 1;
>   	else {
>   		interface_version = 2;
> diff --git a/arch/powerpc/perf/mpc7450-pmu.c b/arch/powerpc/perf/mpc7450-pmu.c
> index d115c5635bf3..17e69cabbcac 100644
> --- a/arch/powerpc/perf/mpc7450-pmu.c
> +++ b/arch/powerpc/perf/mpc7450-pmu.c
> @@ -413,8 +413,9 @@ struct power_pmu mpc7450_pmu = {
>   
>   static int __init init_mpc7450_pmu(void)
>   {
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc/7450"))
> +	unsigned int pvr = mfspr(SPRN_PVR);
> +
> +	if (PVR_VER(pvr) != PVR_7450)
>   		return -ENODEV;
>   
>   	return register_power_pmu(&mpc7450_pmu);
> diff --git a/arch/powerpc/perf/power5+-pmu.c b/arch/powerpc/perf/power5+-pmu.c
> index 0526dac66007..17a32e7ef234 100644
> --- a/arch/powerpc/perf/power5+-pmu.c
> +++ b/arch/powerpc/perf/power5+-pmu.c
> @@ -679,9 +679,9 @@ static struct power_pmu power5p_pmu = {
>   
>   static int __init init_power5p_pmu(void)
>   {
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    (strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power5+")
> -	     && strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power5++")))
> +	unsigned int pvr = mfspr(SPRN_PVR);
> +
> +	if (PVR_VER(pvr) != PVR_POWER5p)
>   		return -ENODEV;
>   
>   	return register_power_pmu(&power5p_pmu);
> diff --git a/arch/powerpc/perf/power5-pmu.c b/arch/powerpc/perf/power5-pmu.c
> index 4dc99f9f7962..844782e6d367 100644
> --- a/arch/powerpc/perf/power5-pmu.c
> +++ b/arch/powerpc/perf/power5-pmu.c
> @@ -620,8 +620,9 @@ static struct power_pmu power5_pmu = {
>   
>   static int __init init_power5_pmu(void)
>   {
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power5"))
> +	unsigned int pvr = mfspr(SPRN_PVR);
> +
> +	if (PVR_VER(pvr) != PVR_POWER5)
>   		return -ENODEV;
>   
>   	return register_power_pmu(&power5_pmu);
> diff --git a/arch/powerpc/perf/power6-pmu.c b/arch/powerpc/perf/power6-pmu.c
> index 9c9d646b68a1..9659b781f588 100644
> --- a/arch/powerpc/perf/power6-pmu.c
> +++ b/arch/powerpc/perf/power6-pmu.c
> @@ -542,8 +542,9 @@ static struct power_pmu power6_pmu = {
>   
>   static int __init init_power6_pmu(void)
>   {
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power6"))
> +	unsigned int pvr = mfspr(SPRN_PVR);
> +
> +	if (PVR_VER(pvr) != PVR_POWER6)
>   		return -ENODEV;
>   
>   	return register_power_pmu(&power6_pmu);
> diff --git a/arch/powerpc/perf/power7-pmu.c b/arch/powerpc/perf/power7-pmu.c
> index 6dbae9884ec4..79f05a7f28c6 100644
> --- a/arch/powerpc/perf/power7-pmu.c
> +++ b/arch/powerpc/perf/power7-pmu.c
> @@ -447,11 +447,12 @@ static struct power_pmu power7_pmu = {
>   
>   static int __init init_power7_pmu(void)
>   {
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power7"))
> +	unsigned int pvr = mfspr(SPRN_PVR);
> +
> +	if ((PVR_VER(pvr) != PVR_POWER7) && (PVR_VER(pvr) != PVR_POWER7p))
>   		return -ENODEV;
>   
> -	if (pvr_version_is(PVR_POWER7p))
> +	if (PVR_VER(pvr) == PVR_POWER7p)
>   		power7_pmu.flags |= PPMU_SIAR_VALID;
>   
>   	return register_power_pmu(&power7_pmu);
> diff --git a/arch/powerpc/perf/power8-pmu.c b/arch/powerpc/perf/power8-pmu.c
> index d12a2db26353..81a5142efab0 100644
> --- a/arch/powerpc/perf/power8-pmu.c
> +++ b/arch/powerpc/perf/power8-pmu.c
> @@ -382,9 +382,10 @@ static struct power_pmu power8_pmu = {
>   static int __init init_power8_pmu(void)
>   {
>   	int rc;
> +	unsigned int pvr = mfspr(SPRN_PVR);
>   
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power8"))
> +	if ((PVR_VER(pvr) != PVR_POWER8E) && (PVR_VER(pvr) != PVR_POWER8NVL)
> +			&& PVR_VER(pvr) != PVR_POWER8)
>   		return -ENODEV;
>   
>   	rc = register_power_pmu(&power8_pmu);
> diff --git a/arch/powerpc/perf/power9-pmu.c b/arch/powerpc/perf/power9-pmu.c
> index 0ff9c43733e9..6b414b8bedfd 100644
> --- a/arch/powerpc/perf/power9-pmu.c
> +++ b/arch/powerpc/perf/power9-pmu.c
> @@ -438,9 +438,7 @@ static int __init init_power9_pmu(void)
>   	int rc = 0;
>   	unsigned int pvr = mfspr(SPRN_PVR);
>   
> -	/* Comes from cpu_specs[] */
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power9"))
> +	if (PVR_VER(pvr) != PVR_POWER9)
>   		return -ENODEV;
>   
>   	/* Blacklist events */
> diff --git a/arch/powerpc/perf/ppc970-pmu.c b/arch/powerpc/perf/ppc970-pmu.c
> index 8b6a8a36fa38..5832de10e073 100644
> --- a/arch/powerpc/perf/ppc970-pmu.c
> +++ b/arch/powerpc/perf/ppc970-pmu.c
> @@ -492,9 +492,11 @@ static struct power_pmu ppc970_pmu = {
>   
>   static int __init init_ppc970_pmu(void)
>   {
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    (strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/970")
> -	     && strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/970MP")))
> +	unsigned int pvr = mfspr(SPRN_PVR);
> +
> +	if ((PVR_VER(pvr) != PVR_970) && (PVR_VER(pvr) != PVR_970MP)
> +			&& (PVR_VER(pvr) != PVR_970FX)
> +			&& (PVR_VER(pvr) != PVR_970GX))
>   		return -ENODEV;
>   
>   	return register_power_pmu(&ppc970_pmu);
> 
