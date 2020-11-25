Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D06092C41EA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 15:15:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch2wr2bmCzDqVk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 01:15:40 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch2SR2fxYzDqpG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 00:54:30 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Ch2SK2cHFzB09ZG;
 Wed, 25 Nov 2020 14:54:25 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 4jm7-KhAdYFg; Wed, 25 Nov 2020 14:54:25 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Ch2SK0vvJzB09ZC;
 Wed, 25 Nov 2020 14:54:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 735D98B7D9;
 Wed, 25 Nov 2020 14:54:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id m6XK8pDP-eJM; Wed, 25 Nov 2020 14:54:26 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 08E518B7D3;
 Wed, 25 Nov 2020 14:54:25 +0100 (CET)
Subject: Re: [PATCH v6 11/22] powerpc/book3s64/pkeys: Inherit correctly on
 fork.
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
 <20201125051634.509286-12-aneesh.kumar@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <38a05d5e-5009-9a00-c1fb-5dd60bba1802@csgroup.eu>
Date: Wed, 25 Nov 2020 14:54:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201125051634.509286-12-aneesh.kumar@linux.ibm.com>
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
Cc: Sandipan Das <sandipan@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 25/11/2020 à 06:16, Aneesh Kumar K.V a écrit :
> Child thread.kuap value is inherited from the parent in copy_thread_tls. We still
> need to make sure when the child returns from a fork in the kernel we start with the kernel
> default AMR value.
> 
> Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   arch/powerpc/kernel/process.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index b6b8a845e454..733680de0ba4 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1768,6 +1768,17 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
>   		childregs->ppr = DEFAULT_PPR;
>   
>   	p->thread.tidr = 0;
> +#endif
> +	/*
> +	 * Run with the current AMR value of the kernel
> +	 */
> +#ifdef CONFIG_PPC_KUAP
> +	if (mmu_has_feature(MMU_FTR_KUAP))
> +		kregs->kuap = AMR_KUAP_BLOCKED;
> +#endif

Do we need that ifdef at all ?

Shouldn't mmu_has_feature(MMU_FTR_KUAP) be always false and get optimised out when CONFIG_PPC_KUAP 
is not defined ?

> +#ifdef CONFIG_PPC_KUEP
> +	if (mmu_has_feature(MMU_FTR_KUEP))
> +		kregs->iamr = AMR_KUEP_BLOCKED;

Same ?

>   #endif
>   	kregs->nip = ppc_function_entry(f);
>   	return 0;
> 
