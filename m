Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FD9294A4B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 11:15:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGPwd1BJTzDqT1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 20:15:29 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGPtv3423zDqQ5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Oct 2020 20:13:52 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CGPtf2HxbzB09ZW;
 Wed, 21 Oct 2020 11:13:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id V8PzQvw1CliL; Wed, 21 Oct 2020 11:13:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CGPtf1F1jzB09ZV;
 Wed, 21 Oct 2020 11:13:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3899D8B7F2;
 Wed, 21 Oct 2020 11:13:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pzXYUd5YMPRD; Wed, 21 Oct 2020 11:13:47 +0200 (CEST)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E76708B7F1;
 Wed, 21 Oct 2020 11:13:46 +0200 (CEST)
Subject: Re: [PATCH 5/5] powerpc/perf: use regs->nip when siar is zero
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au
References: <20201021085329.384535-1-maddy@linux.ibm.com>
 <20201021085329.384535-5-maddy@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <6ad49bc4-6fc8-0cb9-2228-3da9fea3f0dc@csgroup.eu>
Date: Wed, 21 Oct 2020 11:13:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201021085329.384535-5-maddy@linux.ibm.com>
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
Cc: atrajeev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/10/2020 à 10:53, Madhavan Srinivasan a écrit :
> In power10 DD1, there is an issue where the
> Sampled Instruction Address Register (SIAR)
> not latching to the sampled address during
> random sampling. This results in value of 0s
> in the SIAR. Patch adds a check to use regs->nip
> when SIAR is zero.

Why not use regs->nip at all time in that case, and not read SPRN_SIAR at all ?

Christophe


> 
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
>   arch/powerpc/perf/core-book3s.c | 21 +++++++++++++++++----
>   1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index e675c7c8ce0e..63de77eb0ac0 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -263,9 +263,16 @@ static inline u32 perf_get_misc_flags(struct pt_regs *regs)
>   	 * DD1.
>   	 */
>   	if (marked && (ppmu->flags & PPMU_P10_DD1)) {
> -		if (is_kernel_addr(mfspr(SPRN_SIAR)))
> -			return PERF_RECORD_MISC_KERNEL;
> -		return PERF_RECORD_MISC_USER;
> +		unsigned long siar = mfspr(SPRN_SIAR);
> +		if (siar) {
> +			if (is_kernel_addr(siar))
> +				return PERF_RECORD_MISC_KERNEL;
> +			return PERF_RECORD_MISC_USER;
> +		} else {
> +			if (is_kernel_addr(regs->nip))
> +				return PERF_RECORD_MISC_KERNEL;
> +			return PERF_RECORD_MISC_USER;
> +		}
>   	}
>   
>   	/*
> @@ -2211,8 +2218,14 @@ unsigned long perf_misc_flags(struct pt_regs *regs)
>   unsigned long perf_instruction_pointer(struct pt_regs *regs)
>   {
>   	bool use_siar = regs_use_siar(regs);
> +	unsigned long siar = mfspr(SPRN_SIAR);
>   
> -	if (use_siar && siar_valid(regs))
> +	if (ppmu->flags & PPMU_P10_DD1) {
> +		if (siar)
> +			return siar;
> +		else
> +			return regs->nip;
> +	} else if (use_siar && siar_valid(regs))
>   		return mfspr(SPRN_SIAR) + perf_ip_adjust(regs);
>   	else if (use_siar)
>   		return 0;		// no valid instruction pointer
> 
