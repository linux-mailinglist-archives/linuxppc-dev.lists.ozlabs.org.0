Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C9533EF58
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 12:17:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0ngF5QtWz3bsf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 22:17:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0nfv3cGdz30Gs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 22:16:51 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F0nfj2rTDzB09ZW;
 Wed, 17 Mar 2021 12:16:45 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id iJOc5MavERfd; Wed, 17 Mar 2021 12:16:45 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F0nfj1D2GzB09ZV;
 Wed, 17 Mar 2021 12:16:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5AA448B839;
 Wed, 17 Mar 2021 12:16:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id U2BdR0nXF4_F; Wed, 17 Mar 2021 12:16:46 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7FD3B8B82F;
 Wed, 17 Mar 2021 12:16:45 +0100 (CET)
Subject: Re: [PATCH -next] powerpc: kernel/time.c - cleanup warnings
To: He Ying <heying24@huawei.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com,
 msuchanek@suse.de, peterz@infradead.org, geert+renesas@glider.be,
 kernelfans@gmail.com, frederic@kernel.org
References: <20210317103438.177428-1-heying24@huawei.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <3f4d196b-0a8e-d4c9-cabe-591f5916a2b9@csgroup.eu>
Date: Wed, 17 Mar 2021 12:16:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210317103438.177428-1-heying24@huawei.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 17/03/2021 à 11:34, He Ying a écrit :
> We found these warnings in arch/powerpc/kernel/time.c as follows:
> warning: symbol 'decrementer_max' was not declared. Should it be static?
> warning: symbol 'rtc_lock' was not declared. Should it be static?
> warning: symbol 'dtl_consumer' was not declared. Should it be static?
> 
> Declare 'decrementer_max' in arch/powerpc/include/asm/time.h. And include
> proper header in which 'rtc_lock' is declared. Move 'dtl_consumer'
> definition behind "include <asm/dtl.h>" because 'dtl_consumer' is declared
> there.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: He Ying <heying24@huawei.com>
> ---
>   arch/powerpc/include/asm/time.h | 1 +
>   arch/powerpc/kernel/time.c      | 7 +++----
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
> index 8dd3cdb25338..2cd2b50bedda 100644
> --- a/arch/powerpc/include/asm/time.h
> +++ b/arch/powerpc/include/asm/time.h
> @@ -22,6 +22,7 @@ extern unsigned long tb_ticks_per_jiffy;
>   extern unsigned long tb_ticks_per_usec;
>   extern unsigned long tb_ticks_per_sec;
>   extern struct clock_event_device decrementer_clockevent;
> +extern u64 decrementer_max;
>   
>   
>   extern void generic_calibrate_decr(void);
> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index b67d93a609a2..409967713ca6 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -55,6 +55,7 @@
>   #include <linux/sched/cputime.h>
>   #include <linux/sched/clock.h>
>   #include <linux/processor.h>
> +#include <linux/mc146818rtc.h>

I don't think that's the good place. It has no link to powerpc, it is only by chance that it has the 
same name.

As rtc_lock is defined in powerpc time.c, I think you should declare it in powerpc asm/time.h


>   #include <asm/trace.h>
>   
>   #include <asm/interrupt.h>
> @@ -150,10 +151,6 @@ bool tb_invalid;
>   u64 __cputime_usec_factor;
>   EXPORT_SYMBOL(__cputime_usec_factor);
>   
> -#ifdef CONFIG_PPC_SPLPAR
> -void (*dtl_consumer)(struct dtl_entry *, u64);
> -#endif
> -
>   static void calc_cputime_factors(void)
>   {
>   	struct div_result res;
> @@ -179,6 +176,8 @@ static inline unsigned long read_spurr(unsigned long tb)
>   
>   #include <asm/dtl.h>
>   
> +void (*dtl_consumer)(struct dtl_entry *, u64);
> +
>   /*
>    * Scan the dispatch trace log and count up the stolen time.
>    * Should be called with interrupts disabled.
> 
