Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD82D19D94B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 16:39:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v2dX6nrMzDr45
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 01:39:44 +1100 (AEDT)
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
 header.s=mail header.b=Ln2pbIhK; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v2BS5T0TzDsgr
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 01:19:43 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48v2BJ5fFYz9vBLs;
 Fri,  3 Apr 2020 16:19:36 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Ln2pbIhK; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ixU8MjsmeI1j; Fri,  3 Apr 2020 16:19:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48v2BJ3cTWz9vBLr;
 Fri,  3 Apr 2020 16:19:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585923576; bh=3uWybhJdMqLfvTH8SxHA2Cug0YcXDxjcZMjJKXks8LE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Ln2pbIhKeL3RAzqfLQlvpdYPtrT3t0NPhaEb/VBWyCe8HrxUj2DC1F/cc0IjtBqC9
 LijY4bzyqEux99TiBYI+wAxF0KOLRCBOSLoksdiiWzXapeFGpMQO/p06V8komF4ugA
 aK4Vna8y2P1Erf06PEyJZ7ILhuBNxS1BFkxTsvOU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B65DA8B955;
 Fri,  3 Apr 2020 16:19:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yLcXXF7hgnQE; Fri,  3 Apr 2020 16:19:37 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F06F28B951;
 Fri,  3 Apr 2020 16:19:36 +0200 (CEST)
Subject: Re: [PATCH v2 09/14] powerpc/pseries: limit machine check stack to 4GB
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200403132622.130394-1-npiggin@gmail.com>
 <20200403132622.130394-10-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <2b114363-7fa9-8383-0b95-93540e00f2a8@c-s.fr>
Date: Fri, 3 Apr 2020 16:19:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403132622.130394-10-npiggin@gmail.com>
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



Le 03/04/2020 à 15:26, Nicholas Piggin a écrit :
> This allows rtas_args to be put on the machine check stack, which
> avoids a lot of complications with re-entrancy deadlocks.
> 
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/kernel/setup_64.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index e05e6dd67ae6..3a2428aa3d9a 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -692,6 +692,9 @@ void __init exc_lvl_early_init(void)
>   void __init emergency_stack_init(void)
>   {
>   	u64 limit;
> +#ifdef CONFIG_PPC_BOOK3S_64

#ifdef not needed, see below

> +	u64 mce_limit;
> +#endif
>   	unsigned int i;
>   
>   	/*
> @@ -710,6 +713,18 @@ void __init emergency_stack_init(void)
>   	 */
>   	limit = min(ppc64_bolted_size(), ppc64_rma_size);
>   
> +	/*
> +	 * Machine check on pseries calls rtas, but can't use the static
> +	 * rtas_args due to a machine check hitting while the lock is held.
> +	 * rtas args have to be under 4GB, so the machine check stack is
> +	 * limited to 4GB so args can be put on stack.
> +	 */
> +#ifdef CONFIG_PPC_BOOK3S_64

This ifdef is not needed. FW_FEATURE_LPAR is only possible on 
CONFIG_PPC_BOOK3S_64 (indeed only on PSERIES or PS3). On others 
firmware_has_feature(FW_FEATURE_LPAR) should return 0 at compile time.

> +	mce_limit = limit;
> +	if (firmware_has_feature(FW_FEATURE_LPAR) && mce_limit > 4UL*1024*1024*1024)
> +		mce_limit = 4UL*1024*1024*1024;

You should use SZ_4G instead of hardcoding.

> +#endif
> +
>   	for_each_possible_cpu(i) {
>   		paca_ptrs[i]->emergency_sp = alloc_stack(limit, i) + THREAD_SIZE;
>   
> @@ -718,7 +733,7 @@ void __init emergency_stack_init(void)
>   		paca_ptrs[i]->nmi_emergency_sp = alloc_stack(limit, i) + THREAD_SIZE;
>   
>   		/* emergency stack for machine check exception handling. */
> -		paca_ptrs[i]->mc_emergency_sp = alloc_stack(limit, i) + THREAD_SIZE;
> +		paca_ptrs[i]->mc_emergency_sp = alloc_stack(mce_limit, i) + THREAD_SIZE;
>   #endif
>   	}
>   }
> 

Christophe
