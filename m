Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9392C4150
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 14:43:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch2C50Yy0zDqWK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 00:42:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch1yr6XCyzDqlZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 00:32:20 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Ch1ym2mdlz9v1MK;
 Wed, 25 Nov 2020 14:32:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ilsDWQLuvjqT; Wed, 25 Nov 2020 14:32:16 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Ch1ym1knSz9v1MJ;
 Wed, 25 Nov 2020 14:32:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9ED648B7D9;
 Wed, 25 Nov 2020 14:32:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id z43mLr35TVrp; Wed, 25 Nov 2020 14:32:17 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 257C48B7D3;
 Wed, 25 Nov 2020 14:32:17 +0100 (CET)
Subject: Re: [PATCH v6 04/22] powerpc/book3s64/kuap/kuep: Move uamor setup to
 pkey init
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
 <20201125051634.509286-5-aneesh.kumar@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <b2274336-bbed-b120-0e5d-c7fc2979b5c3@csgroup.eu>
Date: Wed, 25 Nov 2020 14:32:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201125051634.509286-5-aneesh.kumar@linux.ibm.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 25/11/2020 à 06:16, Aneesh Kumar K.V a écrit :
> This patch consolidates UAMOR update across pkey, kuap and kuep features.
> The boot cpu initialize UAMOR via pkey init and both radix/hash do the
> secondary cpu UAMOR init in early_init_mmu_secondary.
> 
> We don't check for mmu_feature in radix secondary init because UAMOR
> is a supported SPRN with all CPUs supporting radix translation.
> The old code was not updating UAMOR if we had smap disabled and smep enabled.
> This change handles that case.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   arch/powerpc/mm/book3s64/radix_pgtable.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 3adcf730f478..bfe441af916a 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -620,9 +620,6 @@ void setup_kuap(bool disabled)
>   		cur_cpu_spec->mmu_features |= MMU_FTR_RADIX_KUAP;
>   	}
>   
> -	/* Make sure userspace can't change the AMR */
> -	mtspr(SPRN_UAMOR, 0);
> -
>   	/*
>   	 * Set the default kernel AMR values on all cpus.
>   	 */
> @@ -721,6 +718,11 @@ void radix__early_init_mmu_secondary(void)
>   
>   	radix__switch_mmu_context(NULL, &init_mm);
>   	tlbiel_all();
> +
> +#ifdef CONFIG_PPC_PKEY

It should be possible to use an 'if' with IS_ENABLED(CONFIG_PPC_PKEY) instead of this #ifdef

> +	/* Make sure userspace can't change the AMR */
> +	mtspr(SPRN_UAMOR, 0);
> +#endif
>   }
>   
>   void radix__mmu_cleanup_all(void)
> 
