Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ABC3F04C6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 15:29:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqTJF4c2zz3ckr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 23:29:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqTHq4vJVz3bTR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 23:28:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GqTHg3QByz9sVb;
 Wed, 18 Aug 2021 15:28:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1LR2hN1K61Q5; Wed, 18 Aug 2021 15:28:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GqTHg2K26z9sVX;
 Wed, 18 Aug 2021 15:28:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 351528B80B;
 Wed, 18 Aug 2021 15:28:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Rc3l7k_E9JEH; Wed, 18 Aug 2021 15:28:31 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C23368B7F3;
 Wed, 18 Aug 2021 15:28:30 +0200 (CEST)
Subject: Re: [PATCH v3 3/3] powerpc/perf: Fix the check for SIAR value
To: Kajol Jain <kjain@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org
References: <20210818131949.32008-1-kjain@linux.ibm.com>
 <20210818131949.32008-3-kjain@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1a32a009-160d-a665-f6a5-2a2be53ae2bd@csgroup.eu>
Date: Wed, 18 Aug 2021 15:28:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210818131949.32008-3-kjain@linux.ibm.com>
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
Cc: atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 18/08/2021 à 15:19, Kajol Jain a écrit :
> Incase of random sampling, there can be scenarios where
> Sample Instruction Address Register(SIAR) may not latch
> to the sampled instruction and could result in
> the value of 0. In these scenarios it is preferred to
> return regs->nip. These corner cases are seen in the
> previous generation (p9) also.
> 
> Patch adds the check for SIAR value along with use_siar and
> siar_valid checks so that the function will return regs->nip
> incase SIAR is zero.
> 
> Patch drops the code under PPMU_P10_DD1 flag check
> which handles SIAR 0 case only for Power10 DD1.
> 
> Fixes: 2ca13a4cc56c9 ("powerpc/perf: Use regs->nip when SIAR is zero")
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
> 
> Changelog:
> - Drop adding new ternary condition to check siar value.
> - Remove siar check specific for PPMU_P10_DD1 and add
>    it along with common checks as suggested by Christophe Leroy
>    and Michael Ellermen
> 
>   arch/powerpc/perf/core-book3s.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index 23ec89a59893..55efbba7572b 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -2254,12 +2254,7 @@ unsigned long perf_instruction_pointer(struct pt_regs *regs)
>   	bool use_siar = regs_use_siar(regs);
>   	unsigned long siar = mfspr(SPRN_SIAR);
>   
> -	if (ppmu && (ppmu->flags & PPMU_P10_DD1)) {
> -		if (siar)
> -			return siar;
> -		else
> -			return regs->nip;
> -	} else if (use_siar && siar_valid(regs))
> +	if (use_siar && siar_valid(regs) && siar)

You can probably now do

+	if (regs_use_siar(regs) && siar_valid(regs) && siar)

and remove use_siar

>   		return siar + perf_ip_adjust(regs);
>   	else
>   		return regs->nip;
> 
