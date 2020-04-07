Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 215521A06CE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 07:54:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xGn52plzzDqg8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 15:54:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=DMRlPXM1; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xGRc0q5qzDr4R
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 15:38:52 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48xGRX2X7rz9tyl0;
 Tue,  7 Apr 2020 07:38:48 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=DMRlPXM1; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id hLuwsCtw1kpH; Tue,  7 Apr 2020 07:38:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48xGRX0xJZz9tykx;
 Tue,  7 Apr 2020 07:38:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586237928; bh=HWz6MS7lTAi3uXy84h5BXT3D81kIcUyUUFUZeGSSns4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=DMRlPXM1JPEei9rDIiad0eEXgUR6yu0goL732ewszFzENm8cAA3tre3MZbusCnAiX
 Xafr3sIMdpd4/WGfMirjzIagobPxx1BYksPWR3nMoyF1TmF+Ccd0/nGdloyjbNW0Dk
 cmXxfSwYsJ/F9mdMZHWlqTjkz7EaRuSlTviePH/E=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E866B8B76E;
 Tue,  7 Apr 2020 07:38:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id f6tr5ICfRfgC; Tue,  7 Apr 2020 07:38:48 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F2E698B75E;
 Tue,  7 Apr 2020 07:38:47 +0200 (CEST)
Subject: Re: [PATCH v3 09/15] powerpc/pseries: limit machine check stack to 4GB
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200407051636.648369-1-npiggin@gmail.com>
 <20200407051636.648369-10-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <d2b8d560-c444-14a8-c0d3-58844e31c64f@c-s.fr>
Date: Tue, 7 Apr 2020 07:38:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407051636.648369-10-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/04/2020 à 07:16, Nicholas Piggin a écrit :
> This allows rtas_args to be put on the machine check stack, which
> avoids a lot of complications with re-entrancy deadlocks.
> 
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
>   arch/powerpc/kernel/setup_64.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index 438a9befce41..defe05b6b7a9 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -709,7 +709,7 @@ void __init exc_lvl_early_init(void)
>    */
>   void __init emergency_stack_init(void)
>   {
> -	u64 limit;
> +	u64 limit, mce_limit;
>   	unsigned int i;
>   
>   	/*
> @@ -726,7 +726,16 @@ void __init emergency_stack_init(void)
>   	 * initialized in kernel/irq.c. These are initialized here in order
>   	 * to have emergency stacks available as early as possible.
>   	 */
> -	limit = min(ppc64_bolted_size(), ppc64_rma_size);
> +	limit = mce_limit = min(ppc64_bolted_size(), ppc64_rma_size);
> +
> +	/*
> +	 * Machine check on pseries calls rtas, but can't use the static
> +	 * rtas_args due to a machine check hitting while the lock is held.
> +	 * rtas args have to be under 4GB, so the machine check stack is
> +	 * limited to 4GB so args can be put on stack.
> +	 */
> +	if (firmware_has_feature(FW_FEATURE_LPAR) && mce_limit > SZ_4G)
> +		mce_limit = SZ_4G;
>   
>   	for_each_possible_cpu(i) {
>   		paca_ptrs[i]->emergency_sp = alloc_stack(limit, i) + THREAD_SIZE;
> @@ -736,7 +745,7 @@ void __init emergency_stack_init(void)
>   		paca_ptrs[i]->nmi_emergency_sp = alloc_stack(limit, i) + THREAD_SIZE;
>   
>   		/* emergency stack for machine check exception handling. */
> -		paca_ptrs[i]->mc_emergency_sp = alloc_stack(limit, i) + THREAD_SIZE;
> +		paca_ptrs[i]->mc_emergency_sp = alloc_stack(mce_limit, i) + THREAD_SIZE;
>   #endif
>   	}
>   }
> 
