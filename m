Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DE92055F1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 17:31:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rqxm69tGzDqJj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 01:31:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.150.177; helo=15.mo3.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1051 seconds by postgrey-1.36 at bilbo;
 Wed, 24 Jun 2020 01:26:16 AEST
Received: from 15.mo3.mail-out.ovh.net (15.mo3.mail-out.ovh.net
 [87.98.150.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rqqr0dqqzDqSv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 01:26:12 +1000 (AEST)
Received: from player798.ha.ovh.net (unknown [10.110.171.238])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id BF26D259BF5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 17:08:36 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-921-245.w86-210.abo.wanadoo.fr
 [86.210.152.245]) (Authenticated sender: clg@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id C552413C3C203;
 Tue, 23 Jun 2020 15:08:29 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0011b9a0027-edf8-442a-be60-5d401cd56ded,EED1DA90FC9B795DFFB5AB62ED4F19E3D36D96F8)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH] KVM: PPC: Book3S HV: increase KVMPPC_NR_LPIDS on POWER8
 and POWER9
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20200608115714.1139735-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d73950f5-131a-962c-aea3-ac7e4275b85b@kaod.org>
Date: Tue, 23 Jun 2020 17:08:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608115714.1139735-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1942177340510145415
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudekhedgheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefffdvtddugeeifeduuefghfejgfeigeeigeeltedthefgieeiveeuiefhgeefgfenucfkpheptddrtddrtddrtddpkeeirddvuddtrdduhedvrddvgeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 kvm-ppc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/8/20 1:57 PM, Cédric Le Goater wrote:
> POWER8 and POWER9 have 12-bit LPIDs. Change LPID_RSVD to support up to
> (4096 - 2) guests on these processors. POWER7 is kept the same with a
> limitation of (1024 - 2), but it might be time to drop KVM support for
> POWER7.
> 
> Tested with 2048 guests * 4 vCPUs on a witherspoon system with 512G
> RAM and a bit of swap.

For the record, it is possible to run 4094 guests * 4 vCPUs on a POWER9 
system with 1TB. It takes ~5m to boot them all.

CONFIG_NR_IRQS needs to be increased to support 4094 * 4 escalation 
interrupts.

Cheers,

C.


> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  arch/powerpc/include/asm/reg.h      | 3 ++-
>  arch/powerpc/kvm/book3s_64_mmu_hv.c | 8 ++++++--
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
> index 88e6c78100d9..b70bbfb0ea3c 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -473,7 +473,8 @@
>  #ifndef SPRN_LPID
>  #define SPRN_LPID	0x13F	/* Logical Partition Identifier */
>  #endif
> -#define   LPID_RSVD	0x3ff		/* Reserved LPID for partn switching */
> +#define   LPID_RSVD_POWER7	0x3ff	/* Reserved LPID for partn switching */
> +#define   LPID_RSVD		0xfff	/* Reserved LPID for partn switching */
>  #define	SPRN_HMER	0x150	/* Hypervisor maintenance exception reg */
>  #define   HMER_DEBUG_TRIG	(1ul << (63 - 17)) /* Debug trigger */
>  #define	SPRN_HMEER	0x151	/* Hyp maintenance exception enable reg */
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> index 18aed9775a3c..23035ab2ec50 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> @@ -260,11 +260,15 @@ int kvmppc_mmu_hv_init(void)
>  	if (!mmu_has_feature(MMU_FTR_LOCKLESS_TLBIE))
>  		return -EINVAL;
>  
> -	/* POWER7 has 10-bit LPIDs (12-bit in POWER8) */
>  	host_lpid = 0;
>  	if (cpu_has_feature(CPU_FTR_HVMODE))
>  		host_lpid = mfspr(SPRN_LPID);
> -	rsvd_lpid = LPID_RSVD;
> +
> +	/* POWER8 and above have 12-bit LPIDs (10-bit in POWER7) */
> +	if (cpu_has_feature(CPU_FTR_ARCH_207S))
> +		rsvd_lpid = LPID_RSVD;
> +	else
> +		rsvd_lpid = LPID_RSVD_POWER7;
>  
>  	kvmppc_init_lpid(rsvd_lpid + 1);
>  
> 

