Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A76DA346D60
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 23:40:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4mXm5H5Wz2yx2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 09:40:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.178.242;
 helo=mslow2.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1301 seconds by postgrey-1.36 at boromir;
 Wed, 24 Mar 2021 09:40:06 AEDT
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4mXQ4Fmfz2yhJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 09:40:04 +1100 (AEDT)
Received: from relay13.mail.gandi.net (unknown [217.70.178.233])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id A814A3ABD2F
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 22:18:45 +0000 (UTC)
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr
 [90.65.108.55]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay13.mail.gandi.net (Postfix) with ESMTPSA id BCF098000B;
 Tue, 23 Mar 2021 22:18:14 +0000 (UTC)
Date: Tue, 23 Mar 2021 23:18:14 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: He Ying <heying24@huawei.com>
Subject: Re: [PATCH v2 -next] powerpc: kernel/time.c - cleanup warnings
Message-ID: <YFppJkpZRHMJFay0@piout.net>
References: <20210323091257.90054-1-heying24@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323091257.90054-1-heying24@huawei.com>
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
 npiggin@gmail.com, paulus@samba.org, kernelfans@gmail.com, tglx@linutronix.de,
 msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On 23/03/2021 05:12:57-0400, He Ying wrote:
> We found these warnings in arch/powerpc/kernel/time.c as follows:
> warning: symbol 'decrementer_max' was not declared. Should it be static?
> warning: symbol 'rtc_lock' was not declared. Should it be static?
> warning: symbol 'dtl_consumer' was not declared. Should it be static?
> 
> Declare 'decrementer_max' and 'rtc_lock' in powerpc asm/time.h.
> Rename 'rtc_lock' in drviers/rtc/rtc-vr41xx.c to 'vr41xx_rtc_lock' to
> avoid the conflict with the variable in powerpc asm/time.h.
> Move 'dtl_consumer' definition behind "include <asm/dtl.h>" because it
> is declared there.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: He Ying <heying24@huawei.com>
> ---
> v2:
> - Instead of including linux/mc146818rtc.h in powerpc kernel/time.c, declare
>   rtc_lock in powerpc asm/time.h.
> 

V1 was actually the correct thing to do. rtc_lock is there exactly
because chrp and maple are using mc146818 compatible RTCs. This is then
useful because then drivers/char/nvram.c is enabled. The proper fix
would be to scrap all of that and use rtc-cmos for those platforms as
this drives the RTC properly and exposes the NVRAM for the mc146818.

Or at least, if there are no users for the char/nvram driver on those
two platforms, remove the spinlock and stop enabling CONFIG_NVRAM or
more likely rename the symbol as it seems to be abused by both chrp and
powermac.

I'm not completely against the rename in vr41xxx but the fix for the
warnings can and should be contained in arch/powerpc.

>  arch/powerpc/include/asm/time.h |  3 +++
>  arch/powerpc/kernel/time.c      |  6 ++----
>  drivers/rtc/rtc-vr41xx.c        | 22 +++++++++++-----------
>  3 files changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
> index 8dd3cdb25338..64a3ef0b4270 100644
> --- a/arch/powerpc/include/asm/time.h
> +++ b/arch/powerpc/include/asm/time.h
> @@ -12,6 +12,7 @@
>  #ifdef __KERNEL__
>  #include <linux/types.h>
>  #include <linux/percpu.h>
> +#include <linux/spinlock.h>
>  
>  #include <asm/processor.h>
>  #include <asm/cpu_has_feature.h>
> @@ -22,6 +23,8 @@ extern unsigned long tb_ticks_per_jiffy;
>  extern unsigned long tb_ticks_per_usec;
>  extern unsigned long tb_ticks_per_sec;
>  extern struct clock_event_device decrementer_clockevent;
> +extern u64 decrementer_max;
> +extern spinlock_t rtc_lock;
>  
>  
>  extern void generic_calibrate_decr(void);
> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index b67d93a609a2..60b6ac7d3685 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -150,10 +150,6 @@ bool tb_invalid;
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
> @@ -179,6 +175,8 @@ static inline unsigned long read_spurr(unsigned long tb)
>  
>  #include <asm/dtl.h>
>  
> +void (*dtl_consumer)(struct dtl_entry *, u64);
> +
>  /*
>   * Scan the dispatch trace log and count up the stolen time.
>   * Should be called with interrupts disabled.
> diff --git a/drivers/rtc/rtc-vr41xx.c b/drivers/rtc/rtc-vr41xx.c
> index 5a9f9ad86d32..cc31db058197 100644
> --- a/drivers/rtc/rtc-vr41xx.c
> +++ b/drivers/rtc/rtc-vr41xx.c
> @@ -72,7 +72,7 @@ static void __iomem *rtc2_base;
>  
>  static unsigned long epoch = 1970;	/* Jan 1 1970 00:00:00 */
>  
> -static DEFINE_SPINLOCK(rtc_lock);
> +static DEFINE_SPINLOCK(vr41xx_rtc_lock);
>  static char rtc_name[] = "RTC";
>  static unsigned long periodic_count;
>  static unsigned int alarm_enabled;
> @@ -101,13 +101,13 @@ static inline time64_t read_elapsed_second(void)
>  
>  static inline void write_elapsed_second(time64_t sec)
>  {
> -	spin_lock_irq(&rtc_lock);
> +	spin_lock_irq(&vr41xx_rtc_lock);
>  
>  	rtc1_write(ETIMELREG, (uint16_t)(sec << 15));
>  	rtc1_write(ETIMEMREG, (uint16_t)(sec >> 1));
>  	rtc1_write(ETIMEHREG, (uint16_t)(sec >> 17));
>  
> -	spin_unlock_irq(&rtc_lock);
> +	spin_unlock_irq(&vr41xx_rtc_lock);
>  }
>  
>  static int vr41xx_rtc_read_time(struct device *dev, struct rtc_time *time)
> @@ -139,14 +139,14 @@ static int vr41xx_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
>  	unsigned long low, mid, high;
>  	struct rtc_time *time = &wkalrm->time;
>  
> -	spin_lock_irq(&rtc_lock);
> +	spin_lock_irq(&vr41xx_rtc_lock);
>  
>  	low = rtc1_read(ECMPLREG);
>  	mid = rtc1_read(ECMPMREG);
>  	high = rtc1_read(ECMPHREG);
>  	wkalrm->enabled = alarm_enabled;
>  
> -	spin_unlock_irq(&rtc_lock);
> +	spin_unlock_irq(&vr41xx_rtc_lock);
>  
>  	rtc_time64_to_tm((high << 17) | (mid << 1) | (low >> 15), time);
>  
> @@ -159,7 +159,7 @@ static int vr41xx_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
>  
>  	alarm_sec = rtc_tm_to_time64(&wkalrm->time);
>  
> -	spin_lock_irq(&rtc_lock);
> +	spin_lock_irq(&vr41xx_rtc_lock);
>  
>  	if (alarm_enabled)
>  		disable_irq(aie_irq);
> @@ -173,7 +173,7 @@ static int vr41xx_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
>  
>  	alarm_enabled = wkalrm->enabled;
>  
> -	spin_unlock_irq(&rtc_lock);
> +	spin_unlock_irq(&vr41xx_rtc_lock);
>  
>  	return 0;
>  }
> @@ -202,7 +202,7 @@ static int vr41xx_rtc_ioctl(struct device *dev, unsigned int cmd, unsigned long
>  
>  static int vr41xx_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
>  {
> -	spin_lock_irq(&rtc_lock);
> +	spin_lock_irq(&vr41xx_rtc_lock);
>  	if (enabled) {
>  		if (!alarm_enabled) {
>  			enable_irq(aie_irq);
> @@ -214,7 +214,7 @@ static int vr41xx_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
>  			alarm_enabled = 0;
>  		}
>  	}
> -	spin_unlock_irq(&rtc_lock);
> +	spin_unlock_irq(&vr41xx_rtc_lock);
>  	return 0;
>  }
>  
> @@ -296,7 +296,7 @@ static int rtc_probe(struct platform_device *pdev)
>  	rtc->range_max = (1ULL << 33) - 1;
>  	rtc->max_user_freq = MAX_PERIODIC_RATE;
>  
> -	spin_lock_irq(&rtc_lock);
> +	spin_lock_irq(&vr41xx_rtc_lock);
>  
>  	rtc1_write(ECMPLREG, 0);
>  	rtc1_write(ECMPMREG, 0);
> @@ -304,7 +304,7 @@ static int rtc_probe(struct platform_device *pdev)
>  	rtc1_write(RTCL1LREG, 0);
>  	rtc1_write(RTCL1HREG, 0);
>  
> -	spin_unlock_irq(&rtc_lock);
> +	spin_unlock_irq(&vr41xx_rtc_lock);
>  
>  	aie_irq = platform_get_irq(pdev, 0);
>  	if (aie_irq <= 0) {
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
