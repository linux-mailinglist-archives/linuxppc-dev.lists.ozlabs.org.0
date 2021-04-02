Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 620DB35267A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 08:10:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBV652tzgz3c45
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 17:10:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.49.213; helo=5.mo51.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 5.mo51.mail-out.ovh.net (5.mo51.mail-out.ovh.net
 [188.165.49.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBV5k45Nlz3bt8
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 17:10:16 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.84])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id F3DE5279058;
 Fri,  2 Apr 2021 08:10:11 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 2 Apr 2021
 08:10:11 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0067449dc00-6eec-4dd1-bbec-fd954f9f7f0e,
 CED0CE0CC895D647B8CFE0BE9502FE01F599FB05) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH] powerpc/powernv: Enable HAIL (HV AIL) for ISA v3.1
 processors
To: Nicholas Piggin <npiggin@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
References: <20210402024124.545826-1-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0f41c067-7b9f-5b98-0993-c81cbaeea265@kaod.org>
Date: Fri, 2 Apr 2021 08:10:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210402024124.545826-1-npiggin@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 59314cfa-0682-43bc-9f62-42437b654e0b
X-Ovh-Tracer-Id: 13061283347797740442
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeihedguddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegvdeijeefvdfhudfhffeuveehledufffhvdekheelgedttddthfeigeevgefhffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepnhhpihhgghhinhesghhmrghilhdrtghomh
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/2/21 4:41 AM, Nicholas Piggin wrote:
> Starting with ISA v3.1, LPCR[AIL] no longer controls the interrupt
> mode for HV=1 interrupts. Instead, a new LPCR[HAIL] bit is defined
> which behaves like AIL=3 for HV interrupts when set.

Will QEMU need an update ? 

Thanks,

C.


> Set HAIL on bare metal to give us mmu-on interrupts and improve
> performance.
> 
> This also fixes an scv bug: we don't implement scv real mode (AIL=0)
> vectors because they are at an inconvenient location, so we just
> disable scv support when AIL can not be set. However powernv assumes
> that LPCR[AIL] will enable AIL mode so it enables scv support despite
> HV interrupts being AIL=0, which causes scv interrupts to go off into
> the weeds.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/reg.h |  1 +
>  arch/powerpc/kernel/setup_64.c | 19 ++++++++++++++++---
>  2 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
> index 1be20bc8dce2..9086a2644c89 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -441,6 +441,7 @@
>  #define   LPCR_VRMA_LP1		ASM_CONST(0x0000800000000000)
>  #define   LPCR_RMLS		0x1C000000	/* Implementation dependent RMO limit sel */
>  #define   LPCR_RMLS_SH		26
> +#define   LPCR_HAIL		ASM_CONST(0x0000000004000000)   /* HV AIL (ISAv3.1) */
>  #define   LPCR_ILE		ASM_CONST(0x0000000002000000)   /* !HV irqs set MSR:LE */
>  #define   LPCR_AIL		ASM_CONST(0x0000000001800000)	/* Alternate interrupt location */
>  #define   LPCR_AIL_0		ASM_CONST(0x0000000000000000)	/* MMU off exception offset 0x0 */
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index 04a31586f760..671192afcdfd 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -233,10 +233,23 @@ static void cpu_ready_for_interrupts(void)
>  	 * If we are not in hypervisor mode the job is done once for
>  	 * the whole partition in configure_exceptions().
>  	 */
> -	if (cpu_has_feature(CPU_FTR_HVMODE) &&
> -	    cpu_has_feature(CPU_FTR_ARCH_207S)) {
> +	if (cpu_has_feature(CPU_FTR_HVMODE)) {
>  		unsigned long lpcr = mfspr(SPRN_LPCR);
> -		mtspr(SPRN_LPCR, lpcr | LPCR_AIL_3);
> +		unsigned long new_lpcr = lpcr;
> +
> +		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> +			/* P10 DD1 does not have HAIL */
> +			if (pvr_version_is(PVR_POWER10) &&
> +					(mfspr(SPRN_PVR) & 0xf00) == 0x100)
> +				new_lpcr |= LPCR_AIL_3;
> +			else
> +				new_lpcr |= LPCR_HAIL;
> +		} else if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
> +			new_lpcr |= LPCR_AIL_3;
> +		}
> +
> +		if (new_lpcr != lpcr)
> +			mtspr(SPRN_LPCR, new_lpcr);
>  	}
>  
>  	/*
> 

