Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FDE687808
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 09:57:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6t3T3mFnz3f55
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 19:57:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=GYcVPrBP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=GYcVPrBP;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6t2Q6qGmz3cdZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Feb 2023 19:57:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fZ2qGIEG1+HHCeVmgMD6WYjReeu6GPcoIzM/OMi6JCs=; b=GYcVPrBPR7qarxKP1K5DxZ4EaF
	hQbIx1OZxgX7QEjJL1YqTWz2K7Sfk1VQouNH2s/ZRAuSioNtKgc+RHdxolQZPotvK7OrlgUaP5igH
	DSCKicvs2A16BXdLQ54R1U+touWs33VeDnOFRd/ugrimVHKndfZrbDQRcvNer7bdYOmB8naX78yHt
	QCJ4UqutBn9PaR7pdyvZ6ZgwX0BUIPBh7KsQKMO+9coaOt+gWHGaE23VqGWeTJBzF1Pzq1JS5H8LW
	0Qx9lqO4vVz9tTsW3wVT2w+G8n/3+KXqTnGuusDu+Acmraq0LupFsHQtyk6+00HEb24LZaw1n8bLL
	SkwDi/gQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNVOe-00DF3Q-8O; Thu, 02 Feb 2023 08:56:44 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C16A6300137;
	Thu,  2 Feb 2023 09:56:42 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9F50223F2C5B0; Thu,  2 Feb 2023 09:56:42 +0100 (CET)
Date: Thu, 2 Feb 2023 09:56:42 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: WARN include/linux/trace_recursion.h:162 (powerpc)
Message-ID: <Y9t6yoafrO5YqVgM@hirez.programming.kicks-ass.net>
References: <4C073F6A-C812-4C4A-BB7A-ECD10B75FB88@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4C073F6A-C812-4C4A-BB7A-ECD10B75FB88@linux.ibm.com>
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
Cc: open list <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 02, 2023 at 01:46:32PM +0530, Sachin Sant wrote:
> Following warning is seen with 6.2.0-rc6-next-20230201 on a
> Power10 server.
> 
> ------------[ cut here ]------------
> RCU not on for: check_return_regs_valid+0xc/0x1e0
> WARNING: CPU: 9 PID: 0 at include/linux/trace_recursion.h:162 arch_ftrace_ops_list_func+0x2c0/0x2e0
> Modules linked in: kmem device_dax rpadlpar_io rpaphp uinput torture vmac poly1305_generic chacha_generic chacha20poly1305 n_gsm pps_ldisc ppp_synctty ppp_async ppp_generic serport slcan can_dev slip slhc snd_hrtimer snd_seq snd_seq_device snd_timer snd soundcore pcrypt crypto_user n_hdlc dummy veth tun nfsv3 nfs_acl nfs lockd grace fscache netfs brd overlay exfat vfat fat btrfs blake2b_generic xor raid6_pq zstd_compress xfs loop sctp ip6_udp_tunnel udp_tunnel libcrc32c dm_mod bonding tls rfkill sunrpc nd_pmem nd_btt dax_pmem papr_scm pseries_rng libnvdimm vmx_crypto ext4 mbcache jbd2 sd_mod t10_pi crc64_rocksoft crc64 sg ibmvscsi scsi_transport_srp ibmveth fuse [last unloaded: ipistorm(O)]
> CPU: 9 PID: 0 Comm: swapper/9 Tainted: G O 6.2.0-rc6-next-20230201 #1
> Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1030.00 (NH1030_026) hv:phyp pSeries
> NIP: c0000000002ee8a0 LR: c0000000002ee89c CTR: 0000000000725d90
> REGS: c0000003c372f530 TRAP: 0700 Tainted: G O (6.2.0-rc6-next-20230201)
> MSR: 8000000000021033 <SF,ME,IR,DR,RI,LE> CR: 28002824 XER: 00000002
> CFAR: c000000000159fe0 IRQMASK: 3 
> GPR00: c0000000002ee89c c0000003c372f7d0 c0000000013d0e00 0000000000000031 
> GPR04: 00000001000055ef c0000003c372f5a0 c0000003c372f598 0000000000000027 
> GPR08: c000000efef48010 000000000559c4c9 0000000000000027 c000000002928150 
> GPR12: 0000000048002824 c000000effff5300 c000000000034fc0 0000000000000000 
> GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> GPR24: 0000000000000000 c000000000035770 c000000000034fbc c0000003c372f8a0 
> GPR28: 0000000000000000 c0000003c3686600 0000000000000000 0000000000000000 
> NIP [c0000000002ee8a0] arch_ftrace_ops_list_func+0x2c0/0x2e0
> LR [c0000000002ee89c] arch_ftrace_ops_list_func+0x2bc/0x2e0
> Call Trace:
> [c0000003c372f7d0] [c0000000002ee89c] arch_ftrace_ops_list_func+0x2bc/0x2e0 (unreliable)
> [c0000003c372f870] [c000000000080bb4] ftrace_call+0x4/0x50
> [c0000003c372fa20] [c000000000035770] interrupt_exit_kernel_prepare+0xb0/0x250
> [c0000003c372fa70] [c00000000000da68] interrupt_return_srr_kernel+0x8/0x18c
> --- interrupt: 900 at plpar_hcall_norets_notrace+0x18/0x2c
> NIP: c0000000000faf80 LR: c000000000b5c5f8 CTR: 0000000000000000
> REGS: c0000003c372faa0 TRAP: 0900 Tainted: G O (6.2.0-rc6-next-20230201)
> MSR: 800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> CR: 22000284 XER: 00000000
> CFAR: 0000000000000000 IRQMASK: 0 
> GPR00: 0000000000000000 c0000003c372fd40 c0000000013d0e00 0000000000000000 
> GPR04: 00000000000000c0 0000000000000080 00132735029f6191 0000000000000110 
> GPR08: 000000000001f400 0000000000000001 0000000000000000 0000000000000000 
> GPR12: 0000000000000090 c000000effff5300 0000000000000000 000000001eef7920 
> GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> GPR20: 0000000000000000 0000000000000000 0000000000000000 c0000000029f9a00 
> GPR24: 0000000000000001 0000073e58cd47b6 0000000000000000 0000000000000001 
> GPR28: c0000000029f9a00 0000000000000001 c0000000021620a8 c0000000021620b0 
> NIP [c0000000000faf80] plpar_hcall_norets_notrace+0x18/0x2c
> LR [c000000000b5c5f8] check_and_cede_processor+0x48/0x60
> --- interrupt: 900
> [c0000003c372fd40] [c0000003c372fd70] 0xc0000003c372fd70 (unreliable)
> [c0000003c372fda0] [c000000000b5c8d8] shared_cede_loop+0x78/0x170
> [c0000003c372fde0] [c000000000efb518] cpuidle_enter_state+0xa8/0x558
> [c0000003c372fe80] [c000000000b59660] cpuidle_enter+0x50/0x70
> [c0000003c372fec0] [c0000000001ccd2c] call_cpuidle+0x4c/0x80
> [c0000003c372fee0] [c0000000001d3fa0] do_idle+0x350/0x3b0
> [c0000003c372ff60] [c0000000001d4238] cpu_startup_entry+0x38/0x40
> [c0000003c372ff90] [c000000000065360] start_secondary+0x290/0x2a0
> [c0000003c372ffe0] [c00000000000e358] start_secondary_prolog+0x10/0x14
> Code: 3b800000 4bfffdbc 60000000 60000000 3c62ffe0 39200001 3d420164 7f44d378 386330a8 992a7de9 4be6b661 60000000 <0fe00000> fb010060 60000000 60000000 
> ---[ end trace 0000000000000000 ]---
> ------------[ cut here ]------------
> RCU not on for: shared_cede_loop+0xc/0x170
> 
> The code in question was added by
> commit d099dbfd330686a8c09cd8944bcc77a56f9e7815
>     cpuidle: tracing: Warn about !rcu_is_watching()

Note that by selecting ARCH_WANTS_NO_INSTR you effectively state to
abide by its rules.

  41b7a347bf14 ("powerpc: Book3S 64-bit outline-only KASAN support")

AFAICT the power code does not even attempt to do this.

For your idle path you want at least something like the below, but given
you don't have build time validation of noinstr I can't really tell and
you'll just have to run chase the stragglers.

---
diff --git a/arch/powerpc/kernel/irq_64.c b/arch/powerpc/kernel/irq_64.c
index eb2b380e52a0..4dfd4caff1b7 100644
--- a/arch/powerpc/kernel/irq_64.c
+++ b/arch/powerpc/kernel/irq_64.c
@@ -323,7 +323,7 @@ EXPORT_SYMBOL(arch_local_irq_restore);
  * disabled and marked as such, so the local_irq_enable() call
  * in arch_cpu_idle() will properly re-enable everything.
  */
-bool prep_irq_for_idle(void)
+__cpuidle bool prep_irq_for_idle(void)
 {
 	/*
 	 * First we need to hard disable to ensure no interrupt
@@ -339,9 +339,6 @@ bool prep_irq_for_idle(void)
 	if (lazy_irq_pending())
 		return false;
 
-	/* Tell lockdep we are about to re-enable */
-	trace_hardirqs_on();
-
 	/*
 	 * Mark interrupts as soft-enabled and clear the
 	 * PACA_IRQ_HARD_DIS from the pending mask since we
diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
index 1bad4d2b7be3..96737a8a979b 100644
--- a/drivers/cpuidle/cpuidle-pseries.c
+++ b/drivers/cpuidle/cpuidle-pseries.c
@@ -33,16 +33,17 @@ static struct cpuidle_state *cpuidle_state_table __read_mostly;
 static u64 snooze_timeout __read_mostly;
 static bool snooze_timeout_en __read_mostly;
 
-static int snooze_loop(struct cpuidle_device *dev,
-			struct cpuidle_driver *drv,
-			int index)
+static __cpuidle
+int snooze_loop(struct cpuidle_device *dev,
+		struct cpuidle_driver *drv,
+		int index)
 {
 	u64 snooze_exit_time;
 
 	set_thread_flag(TIF_POLLING_NRFLAG);
 
 	pseries_idle_prolog();
-	local_irq_enable();
+	raw_local_irq_enable();
 	snooze_exit_time = get_tb() + snooze_timeout;
 	dev->poll_time_limit = false;
 
@@ -65,14 +66,14 @@ static int snooze_loop(struct cpuidle_device *dev,
 	HMT_medium();
 	clear_thread_flag(TIF_POLLING_NRFLAG);
 
-	local_irq_disable();
+	raw_local_irq_disable();
 
 	pseries_idle_epilog();
 
 	return index;
 }
 
-static void check_and_cede_processor(void)
+static __cpuidle void check_and_cede_processor(void)
 {
 	/*
 	 * Ensure our interrupt state is properly tracked,
@@ -216,9 +217,10 @@ static int __init parse_cede_parameters(void)
 #define NR_DEDICATED_STATES	2 /* snooze, CEDE */
 static u8 cede_latency_hint[NR_DEDICATED_STATES];
 
-static int dedicated_cede_loop(struct cpuidle_device *dev,
-				struct cpuidle_driver *drv,
-				int index)
+static __cpuidle
+int dedicated_cede_loop(struct cpuidle_device *dev,
+			struct cpuidle_driver *drv,
+			int index)
 {
 	u8 old_latency_hint;
 
@@ -230,7 +232,7 @@ static int dedicated_cede_loop(struct cpuidle_device *dev,
 	HMT_medium();
 	check_and_cede_processor();
 
-	local_irq_disable();
+	raw_local_irq_disable();
 	get_lppaca()->donate_dedicated_cpu = 0;
 	get_lppaca()->cede_latency_hint = old_latency_hint;
 
@@ -239,9 +241,10 @@ static int dedicated_cede_loop(struct cpuidle_device *dev,
 	return index;
 }
 
-static int shared_cede_loop(struct cpuidle_device *dev,
-			struct cpuidle_driver *drv,
-			int index)
+static __cpuidle
+int shared_cede_loop(struct cpuidle_device *dev,
+		     struct cpuidle_driver *drv,
+		     int index)
 {
 
 	pseries_idle_prolog();
@@ -255,7 +258,7 @@ static int shared_cede_loop(struct cpuidle_device *dev,
 	 */
 	check_and_cede_processor();
 
-	local_irq_disable();
+	raw_local_irq_disable();
 	pseries_idle_epilog();
 
 	return index;
