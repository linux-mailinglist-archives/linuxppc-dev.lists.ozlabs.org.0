Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1EF868B88
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 10:03:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=rzlV55dA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkWjw6Mr8z3vZ1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 20:03:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=rzlV55dA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.124; helo=out30-124.freemail.mail.aliyun.com; envelope-from=liusong@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkWj8459Tz3c5J
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 20:02:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1709024565; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=bKyExLaJsMJFtDGzvQca2erL9AyFIbFelzMrpVgTicU=;
	b=rzlV55dA/EulHOyzrz+tKIVP/GSIUV5b5wsi3x62+7/vlLRTp0R5+AOujcj0MTbXU/IbbX+RAnUNwYfLbzCYihy9bffR23tuPwGJ6b5Odfkf7R7sGNbEeN4D2Jt/RBhvF9S6UqzOiePdPz4MYefYcMxOPvDrviPaL4aGJG+33OA=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R311e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=liusong@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0W1M9Gjj_1709024562;
Received: from 30.178.80.107(mailfrom:liusong@linux.alibaba.com fp:SMTPD_---0W1M9Gjj_1709024562)
          by smtp.aliyun-inc.com;
          Tue, 27 Feb 2024 17:02:44 +0800
Message-ID: <49144bb6-dd90-44ef-965a-aa5af8d568b1@linux.alibaba.com>
Date: Tue, 27 Feb 2024 17:02:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv10 4/4] watchdog/softlockup: report the most frequent
 interrupts
To: Bitao Hu <yaoma@linux.alibaba.com>, dianders@chromium.org,
 tglx@linutronix.de, akpm@linux-foundation.org, pmladek@suse.com,
 kernelfans@gmail.com, deller@gmx.de, npiggin@gmail.com,
 tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com,
 jan.kiszka@siemens.com
References: <20240226020939.45264-1-yaoma@linux.alibaba.com>
 <20240226020939.45264-5-yaoma@linux.alibaba.com>
From: Liu Song <liusong@linux.alibaba.com>
In-Reply-To: <20240226020939.45264-5-yaoma@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


在 2024/2/26 10:09, Bitao Hu 写道:
> When the watchdog determines that the current soft lockup is due
> to an interrupt storm based on CPU utilization, reporting the
> most frequent interrupts could be good enough for further
> troubleshooting.
>
> Below is an example of interrupt storm. The call tree does not
> provide useful information, but we can analyze which interrupt
> caused the soft lockup by comparing the counts of interrupts.
>
> [  638.870231] watchdog: BUG: soft lockup - CPU#9 stuck for 26s! [swapper/9:0]
> [  638.870825] CPU#9 Utilization every 4s during lockup:
> [  638.871194]  #1:   0% system,          0% softirq,   100% hardirq,     0% idle
> [  638.871652]  #2:   0% system,          0% softirq,   100% hardirq,     0% idle
> [  638.872107]  #3:   0% system,          0% softirq,   100% hardirq,     0% idle
> [  638.872563]  #4:   0% system,          0% softirq,   100% hardirq,     0% idle
> [  638.873018]  #5:   0% system,          0% softirq,   100% hardirq,     0% idle
> [  638.873494] CPU#9 Detect HardIRQ Time exceeds 50%. Most frequent HardIRQs:
> [  638.873994]  #1: 330945      irq#7
> [  638.874236]  #2: 31          irq#82
> [  638.874493]  #3: 10          irq#10
> [  638.874744]  #4: 2           irq#89
> [  638.874992]  #5: 1           irq#102
> ...
> [  638.875313] Call trace:
> [  638.875315]  __do_softirq+0xa8/0x364
>
> Signed-off-by: Bitao Hu <yaoma@linux.alibaba.com>
> ---
>   kernel/watchdog.c | 115 ++++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 111 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> index 69e72d7e461d..c9d49ae8d045 100644
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -12,22 +12,25 @@
>   
>   #define pr_fmt(fmt) "watchdog: " fmt
>   
> -#include <linux/mm.h>
>   #include <linux/cpu.h>
> -#include <linux/nmi.h>
>   #include <linux/init.h>
> +#include <linux/irq.h>
> +#include <linux/irqdesc.h>
>   #include <linux/kernel_stat.h>
> +#include <linux/kvm_para.h>
>   #include <linux/math64.h>
> +#include <linux/mm.h>
>   #include <linux/module.h>
> +#include <linux/nmi.h>
> +#include <linux/stop_machine.h>
>   #include <linux/sysctl.h>
>   #include <linux/tick.h>
> +
>   #include <linux/sched/clock.h>
>   #include <linux/sched/debug.h>
>   #include <linux/sched/isolation.h>
> -#include <linux/stop_machine.h>
>   
>   #include <asm/irq_regs.h>
> -#include <linux/kvm_para.h>
>   
>   static DEFINE_MUTEX(watchdog_mutex);
>   
> @@ -417,13 +420,104 @@ static void print_cpustat(void)
>   	}
>   }
>   
> +#define HARDIRQ_PERCENT_THRESH          50
> +#define NUM_HARDIRQ_REPORT              5
> +struct irq_counts {
> +	int irq;
> +	u32 counts;
> +};
> +
> +static DEFINE_PER_CPU(bool, snapshot_taken);
> +
> +/* Tabulate the most frequent interrupts. */
> +static void tabulate_irq_count(struct irq_counts *irq_counts, int irq, u32 counts, int rank)
> +{
> +	int i;
> +	struct irq_counts new_count = {irq, counts};
> +
> +	for (i = 0; i < rank; i++) {
> +		if (counts > irq_counts[i].counts)
> +			swap(new_count, irq_counts[i]);
> +	}
> +}
> +
> +/*
> + * If the hardirq time exceeds HARDIRQ_PERCENT_THRESH% of the sample_period,
> + * then the cause of softlockup might be interrupt storm. In this case, it
> + * would be useful to start interrupt counting.
> + */
> +static bool need_counting_irqs(void)
> +{
> +	u8 util;
> +	int tail = __this_cpu_read(cpustat_tail);
> +
> +	tail = (tail + NUM_HARDIRQ_REPORT - 1) % NUM_HARDIRQ_REPORT;
> +	util = __this_cpu_read(cpustat_util[tail][STATS_HARDIRQ]);
> +	return util > HARDIRQ_PERCENT_THRESH;
> +}
> +
> +static void start_counting_irqs(void)
> +{
> +	if (!__this_cpu_read(snapshot_taken)) {
> +		kstat_snapshot_irqs();
> +		__this_cpu_write(snapshot_taken, true);
> +	}
> +}
> +
> +static void stop_counting_irqs(void)
> +{
> +	__this_cpu_write(snapshot_taken, false);
> +}
> +
> +static void print_irq_counts(void)
> +{
> +	unsigned int i, count;
> +	struct irq_counts irq_counts_sorted[NUM_HARDIRQ_REPORT] = {
> +		{-1, 0}, {-1, 0}, {-1, 0}, {-1, 0}, {-1, 0}
> +	};
> +
> +	if (__this_cpu_read(snapshot_taken)) {
> +		for_each_active_irq(i) {
> +			count = kstat_get_irq_since_snapshot(i);
> +			tabulate_irq_count(irq_counts_sorted, i, count, NUM_HARDIRQ_REPORT);
> +		}
> +
> +		/*
> +		 * We do not want the "watchdog: " prefix on every line,
> +		 * hence we use "printk" instead of "pr_crit".
> +		 */
> +		printk(KERN_CRIT "CPU#%d Detect HardIRQ Time exceeds %d%%. Most frequent HardIRQs:\n",
> +		       smp_processor_id(), HARDIRQ_PERCENT_THRESH);
> +
> +		for (i = 0; i < NUM_HARDIRQ_REPORT; i++) {
> +			if (irq_counts_sorted[i].irq == -1)
> +				break;
> +
> +			printk(KERN_CRIT "\t#%u: %-10u\tirq#%d\n",
> +			       i + 1, irq_counts_sorted[i].counts,
> +			       irq_counts_sorted[i].irq);
> +		}
> +
> +		/*
> +		 * If the hardirq time is less than HARDIRQ_PERCENT_THRESH% in the last
> +		 * sample_period, then we suspect the interrupt storm might be subsiding.
> +		 */
> +		if (!need_counting_irqs())
> +			stop_counting_irqs();
> +	}
> +}
> +
>   static void report_cpu_status(void)
>   {
>   	print_cpustat();
> +	print_irq_counts();
>   }
>   #else
>   static inline void update_cpustat(void) { }
>   static inline void report_cpu_status(void) { }
> +static inline bool need_counting_irqs(void) { return false; }
> +static inline void start_counting_irqs(void) { }
> +static inline void stop_counting_irqs(void) { }
>   #endif
>   
>   /*
> @@ -527,6 +621,18 @@ static int is_softlockup(unsigned long touch_ts,
>   			 unsigned long now)
>   {
>   	if ((watchdog_enabled & WATCHDOG_SOFTOCKUP_ENABLED) && watchdog_thresh) {
> +		/*
> +		 * If period_ts has not been updated during a sample_period, then
> +		 * in the subsequent few sample_periods, period_ts might also not
> +		 * be updated, which could indicate a potential softlockup. In
> +		 * this case, if we suspect the cause of the potential softlockup
> +		 * might be interrupt storm, then we need to count the interrupts
> +		 * to find which interrupt is storming.
> +		 */
> +		if (time_after_eq(now, period_ts + get_softlockup_thresh() / NUM_SAMPLE_PERIODS) &&
> +		    need_counting_irqs())
> +			start_counting_irqs();
> +
>   		/* Warn about unreasonable delays. */
>   		if (time_after(now, period_ts + get_softlockup_thresh()))
>   			return now - touch_ts;
> @@ -549,6 +655,7 @@ static DEFINE_PER_CPU(struct cpu_stop_work, softlockup_stop_work);
>   static int softlockup_fn(void *data)
>   {
>   	update_touch_ts();
> +	stop_counting_irqs();
>   	complete(this_cpu_ptr(&softlockup_completion));
>   
>   	return 0;

Looks good.

Reviewed-by: Liu Song <liusong@linux.alibaba.com>

