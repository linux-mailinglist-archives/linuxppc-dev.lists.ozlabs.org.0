Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E63622F4E0C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 16:01:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG9cm0b1yzDrfG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 02:01:12 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DG9Zb1RPczDr5R
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 01:59:17 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DG9ZT0JrTz9twtP;
 Wed, 13 Jan 2021 15:59:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id OFxThglivUI2; Wed, 13 Jan 2021 15:59:12 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DG9ZS6cWfz9twtM;
 Wed, 13 Jan 2021 15:59:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7CEE98B7DF;
 Wed, 13 Jan 2021 15:59:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CintK_kxJalp; Wed, 13 Jan 2021 15:59:14 +0100 (CET)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 17CE68B772;
 Wed, 13 Jan 2021 15:59:14 +0100 (CET)
Subject: Re: [PATCH v5 16/21] powerpc/64: move account_stolen_time into its
 own function
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210113073215.516986-1-npiggin@gmail.com>
 <20210113073215.516986-17-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <fa2c9884-81c8-d4cc-a33d-3aacdacfafd7@csgroup.eu>
Date: Wed, 13 Jan 2021 15:59:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210113073215.516986-17-npiggin@gmail.com>
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



Le 13/01/2021 à 08:32, Nicholas Piggin a écrit :
> This will be used by interrupt entry as well.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/cputime.h | 15 +++++++++++++++
>   arch/powerpc/kernel/syscall_64.c   | 10 +---------
>   2 files changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/include/asm/cputime.h
> index ed75d1c318e3..3f61604e1fcf 100644
> --- a/arch/powerpc/include/asm/cputime.h
> +++ b/arch/powerpc/include/asm/cputime.h
> @@ -87,6 +87,18 @@ static notrace inline void account_cpu_user_exit(void)
>   	acct->starttime_user = tb;
>   }
>   
> +static notrace inline void account_stolen_time(void)
> +{
> +#ifdef CONFIG_PPC_SPLPAR
> +	if (IS_ENABLED(CONFIG_VIRT_CPU_ACCOUNTING_NATIVE) &&

Arent' you already inside a CONFIG_VIRT_CPU_ACCOUNTING_NATIVE section ?

> +	    firmware_has_feature(FW_FEATURE_SPLPAR)) {
> +		struct lppaca *lp = local_paca->lppaca_ptr;
> +
> +		if (unlikely(local_paca->dtl_ridx != be64_to_cpu(lp->dtl_idx)))
> +			accumulate_stolen_time();
> +	}
> +#endif
> +}
>   
>   #endif /* __KERNEL__ */
>   #else /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
> @@ -96,5 +108,8 @@ static inline void account_cpu_user_entry(void)
>   static inline void account_cpu_user_exit(void)
>   {
>   }
> +static notrace inline void account_stolen_time(void)
> +{
> +}
>   #endif /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
>   #endif /* __POWERPC_CPUTIME_H */
> diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
> index 42f0ad4b2fbb..32f72965da26 100644
> --- a/arch/powerpc/kernel/syscall_64.c
> +++ b/arch/powerpc/kernel/syscall_64.c
> @@ -69,15 +69,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
>   
>   	account_cpu_user_entry();
>   
> -#ifdef CONFIG_PPC_SPLPAR
> -	if (IS_ENABLED(CONFIG_VIRT_CPU_ACCOUNTING_NATIVE) &&
> -	    firmware_has_feature(FW_FEATURE_SPLPAR)) {
> -		struct lppaca *lp = local_paca->lppaca_ptr;
> -
> -		if (unlikely(local_paca->dtl_ridx != be64_to_cpu(lp->dtl_idx)))
> -			accumulate_stolen_time();
> -	}
> -#endif
> +	account_stolen_time();
>   
>   	/*
>   	 * This is not required for the syscall exit path, but makes the
> 
