Return-Path: <linuxppc-dev+bounces-11537-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CECEB3C943
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 10:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDSkY4jmMz2yvv;
	Sat, 30 Aug 2025 18:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756542037;
	cv=none; b=Quz/6CzRaxAfLxzwxWFr0YCbf8j2gxpGQTtsq+ZkhOGvh868tKAZfYqBQdNcOjyhdNLXJTv1qu3FUpoOtmsIhXdR3DINojRIq1DIDRmsQf5aIXSSwOD3UIEx9ur0oeudjltc23LiBeJeb/xGolU/F3DULFqJvK8+qytfQDJ4FG9w0JIgKmUPW9thIM6orw4Nu9sYOMNNhQg68mGR/bTwyI4v5EYTBHotbk2DyzM0dwGrXsCxnkw9mYMRRzugkMQ1cxR7Q6Ch1RMlZkqMaXvncEObK/Vjx329G9UNl/UAngCZbZn9iXvPrRbu6NThl9+LLMkVCxgHsrhpjwW3izgeJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756542037; c=relaxed/relaxed;
	bh=jAvXw/QR6bsP9c6qeEOzBkWDsDxh35E9KIM0Ku/2+Yo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TmKRNFJWJwZUybUdCxSlJ+ZNVNGFNUzJI/vKyXWUc96pBQN5BQA17tFTSkCqJSmn2Mt19LS09cXgF2wbtxK0iuP6w4R1htuBJ7uyJQgA1w1BoouHew/KF3n4hVmO+eQvS4cTugLHft+hVJo8j6OFiuaGTeiDo8o/VYBDYZ9q6lgn4sDoJgNLoktBhe18s8c/PSoShhAehlS1Wk3fR+cVGEvM2mwcWwEJPjs/zl1mf1+PHUOE2kcfx4/UEyQhepQeJXVzk0ZNJJt3YHMflCQ20GHNh9ya5bMym6A01TTMZl6usxL1M4GFntjWpfYpKouAPu8R2+FvaWrMrCsGbS+3lg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDSkX6hM0z2xPw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 18:20:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cDQYb6q8nz9sSS;
	Sat, 30 Aug 2025 08:42:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xHcUPbJ8eh2x; Sat, 30 Aug 2025 08:42:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cDQYb5nwxz9sSR;
	Sat, 30 Aug 2025 08:42:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B208E8B778;
	Sat, 30 Aug 2025 08:42:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 8yOE3de8N-yO; Sat, 30 Aug 2025 08:42:43 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2ADAE8B776;
	Sat, 30 Aug 2025 08:42:43 +0200 (CEST)
Message-ID: <70d03b12-86a9-4f6b-bbec-334cfd439e26@csgroup.eu>
Date: Sat, 30 Aug 2025 08:42:42 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 7/8] powerpc/book3s64/slb: Add no_slb_preload early cmdline
 param
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Donet Tom <donettom@linux.ibm.com>
References: <cover.1756522067.git.ritesh.list@gmail.com>
 <8a654cb9cc8bfc872df0cff5558c787ec44c8f28.1756522067.git.ritesh.list@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <8a654cb9cc8bfc872df0cff5558c787ec44c8f28.1756522067.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 30/08/2025 à 05:51, Ritesh Harjani (IBM) a écrit :
> no_slb_preload cmdline can come useful in quickly disabling and/or
> testing the performance impact of userspace slb preloads. Recently there
> was a slb multi-hit issue due to slb preload cache which was very
> difficult to triage. This cmdline option allows to quickly disable
> preloads and verify if the issue exists in preload cache or somewhere
> else. This can also be a useful option to see the effect of slb preloads
> for any application workload e.g. number of slb faults with or w/o slb
> preloads.
> 
> For e.g. with the next patch where we added slb_faults counter to /proc/vmstat:
> 
> with slb_preload:
> slb_faults (minimal initrd boot): 15
> slb_faults (full systemd boot): 300
> 
> with no_slb_preload:
> slb_faults (minimal initrd boot): 33
> slb_faults (full systemd boot): 138180
> 
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Paul Mackerras <paulus@ozlabs.org>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Cc: Donet Tom <donettom@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
>   Documentation/admin-guide/kernel-parameters.txt |  3 +++
>   arch/powerpc/mm/book3s64/hash_utils.c           |  3 +++
>   arch/powerpc/mm/book3s64/internal.h             |  7 +++++++
>   arch/powerpc/mm/book3s64/slb.c                  | 15 +++++++++++++++
>   4 files changed, 28 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 747a55abf494..9a66f255b659 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -7135,6 +7135,9 @@
>   			them frequently to increase the rate of SLB faults
>   			on kernel addresses.
> 
> +	no_slb_preload	[PPC,EARLY]
> +			Disables slb preloading for userspace.
> +
>   	sunrpc.min_resvport=
>   	sunrpc.max_resvport=
>   			[NFS,SUNRPC]
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index 495b6da6f5d4..abf703563ea3 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -1319,6 +1319,9 @@ static void __init htab_initialize(void)
>   	if (stress_slb_enabled)
>   		static_branch_enable(&stress_slb_key);
> 
> +	if (no_slb_preload)
> +		static_branch_enable(&no_slb_preload_key);
> +
>   	if (stress_hpt_enabled) {
>   		unsigned long tmp;
>   		static_branch_enable(&stress_hpt_key);
> diff --git a/arch/powerpc/mm/book3s64/internal.h b/arch/powerpc/mm/book3s64/internal.h
> index c26a6f0c90fc..cad08d83369c 100644
> --- a/arch/powerpc/mm/book3s64/internal.h
> +++ b/arch/powerpc/mm/book3s64/internal.h
> @@ -22,6 +22,13 @@ static inline bool stress_hpt(void)
>   	return static_branch_unlikely(&stress_hpt_key);
>   }
> 
> +extern bool no_slb_preload;
> +DECLARE_STATIC_KEY_FALSE(no_slb_preload_key);
> +static inline bool slb_preload_disabled(void)
> +{
> +	return static_branch_unlikely(&no_slb_preload_key);
> +}
> +
>   void hpt_do_stress(unsigned long ea, unsigned long hpte_group);
> 
>   void exit_lazy_flush_tlb(struct mm_struct *mm, bool always_flush);
> diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
> index 780792b9a1e5..297ab0e93c1e 100644
> --- a/arch/powerpc/mm/book3s64/slb.c
> +++ b/arch/powerpc/mm/book3s64/slb.c
> @@ -42,6 +42,15 @@ early_param("stress_slb", parse_stress_slb);
> 
>   __ro_after_init DEFINE_STATIC_KEY_FALSE(stress_slb_key);
> 
> +bool no_slb_preload __initdata;
> +static int __init parse_no_slb_preload(char *p)
> +{
> +	no_slb_preload = true;
> +	return 0;

Can't you call static_branch_disable() directly from here and avoid 
doing it in hash_utils.c ?

> +}
> +early_param("no_slb_preload", parse_no_slb_preload);
> +__ro_after_init DEFINE_STATIC_KEY_FALSE(no_slb_preload_key);
> +
>   static void assert_slb_presence(bool present, unsigned long ea)
>   {
>   #ifdef CONFIG_DEBUG_VM
> @@ -299,6 +308,9 @@ static void preload_add(struct thread_info *ti, unsigned long ea)
>   	unsigned char idx;
>   	unsigned long esid;
> 
> +	if (slb_preload_disabled())
> +		return;
> +
>   	if (mmu_has_feature(MMU_FTR_1T_SEGMENT)) {
>   		/* EAs are stored >> 28 so 256MB segments don't need clearing */
>   		if (ea & ESID_MASK_1T)
> @@ -414,6 +426,9 @@ void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
> 
>   	copy_mm_to_paca(mm);
> 
> +	if (slb_preload_disabled())
> +		return;
> +
>   	/*
>   	 * We gradually age out SLBs after a number of context switches to
>   	 * reduce reload overhead of unused entries (like we do with FP/VEC
> --
> 2.50.1
> 


