Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 178B03474A1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 10:29:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F52xk0wjnz30Kl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 20:29:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com;
 receiver=<UNKNOWN>)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F52xM6Cclz2yyj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 20:29:10 +1100 (AEDT)
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr
 [90.65.108.55]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B4B024000A;
 Wed, 24 Mar 2021 09:29:06 +0000 (UTC)
Date: Wed, 24 Mar 2021 10:29:06 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: He Ying <heying24@huawei.com>
Subject: Re: [PATCH V3 -next] powerpc: kernel/time.c - cleanup warnings
Message-ID: <YFsGYgdNH5HrlqDJ@piout.net>
References: <20210324090939.143477-1-heying24@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324090939.143477-1-heying24@huawei.com>
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
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, geert+renesas@glider.be,
 peterz@infradead.org, frederic@kernel.org, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, kernelfans@gmail.com, paulus@samba.org,
 geert@linux-m68k.org, tglx@linutronix.de, msuchanek@suse.de,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24/03/2021 05:09:39-0400, He Ying wrote:
> We found these warnings in arch/powerpc/kernel/time.c as follows:
> warning: symbol 'decrementer_max' was not declared. Should it be static?
> warning: symbol 'rtc_lock' was not declared. Should it be static?
> warning: symbol 'dtl_consumer' was not declared. Should it be static?
> 
> Declare 'decrementer_max' in powerpc asm/time.h.
> Include linux/mc146818rtc.h in powerpc kernel/time.c where 'rtc_lock'
> is declared. And remove duplicated declaration of 'rtc_lock' in powerpc
> platforms/chrp/time.c because it has included linux/mc146818rtc.h.
> Move 'dtl_consumer' definition behind "include <asm/dtl.h>" because it
> is declared there.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: He Ying <heying24@huawei.com>
> ---
> V2:
> - Instead of including linux/mc146818rtc.h in powerpc kernel/time.c, declare
>   rtc_lock in powerpc asm/time.h.
> V3:
> - Recover to V1, that is including linux/mc146818rtc.h in powerpc
>   kernel/time.c. And remove duplicated declaration of 'rtc_lock' in powerpc
>   platforms/chrp/time.c because it has included linux/mc146818rtc.h.
> 
>  arch/powerpc/include/asm/time.h    | 1 +
>  arch/powerpc/kernel/time.c         | 9 ++++-----
>  arch/powerpc/platforms/chrp/time.c | 2 --
>  3 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
> index 8dd3cdb25338..2cd2b50bedda 100644
> --- a/arch/powerpc/include/asm/time.h
> +++ b/arch/powerpc/include/asm/time.h
> @@ -22,6 +22,7 @@ extern unsigned long tb_ticks_per_jiffy;
>  extern unsigned long tb_ticks_per_usec;
>  extern unsigned long tb_ticks_per_sec;
>  extern struct clock_event_device decrementer_clockevent;
> +extern u64 decrementer_max;
>  
>  
>  extern void generic_calibrate_decr(void);
> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index b67d93a609a2..ac81f043bf49 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -55,8 +55,9 @@
>  #include <linux/sched/cputime.h>
>  #include <linux/sched/clock.h>
>  #include <linux/processor.h>
> -#include <asm/trace.h>
> +#include <linux/mc146818rtc.h>

I'm fine with that but I really think my suggestion to make the rtc_lock
local to the platforms was better because it is only used to synchronize
between concurrent invocations of chrp_set_rtc_time or
maple_set_rtc_time. The rtc core will never do that and the only case
would be concurrent calls to rtc_ops.set_time and
update_persistent_clock64 (which should also be removed at some point).

>  
> +#include <asm/trace.h>
>  #include <asm/interrupt.h>
>  #include <asm/io.h>
>  #include <asm/nvram.h>
> @@ -150,10 +151,6 @@ bool tb_invalid;
>  u64 __cputime_usec_factor;
>  EXPORT_SYMBOL(__cputime_usec_factor);
>  
> -#ifdef CONFIG_PPC_SPLPAR
> -void (*dtl_consumer)(struct dtl_entry *, u64);
> -#endif
> -
>  static void calc_cputime_factors(void)
>  {
>  	struct div_result res;
> @@ -179,6 +176,8 @@ static inline unsigned long read_spurr(unsigned long tb)
>  
>  #include <asm/dtl.h>
>  
> +void (*dtl_consumer)(struct dtl_entry *, u64);
> +
>  /*
>   * Scan the dispatch trace log and count up the stolen time.
>   * Should be called with interrupts disabled.
> diff --git a/arch/powerpc/platforms/chrp/time.c b/arch/powerpc/platforms/chrp/time.c
> index acde7bbe0716..b94dfd5090d8 100644
> --- a/arch/powerpc/platforms/chrp/time.c
> +++ b/arch/powerpc/platforms/chrp/time.c
> @@ -30,8 +30,6 @@
>  
>  #include <platforms/chrp/chrp.h>
>  
> -extern spinlock_t rtc_lock;
> -
>  #define NVRAM_AS0  0x74
>  #define NVRAM_AS1  0x75
>  #define NVRAM_DATA 0x77
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
