Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D53CB5BD6EC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 00:11:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWf633fNKz3f5l
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 08:11:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=hxc9HxCk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=hxc9HxCk;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWLGb36NCz303m
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 20:17:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=aIisfZps5gh8CFbGfWo9r3lQVFXbgWOaMv4QJgU4z04=; b=hxc9HxCkAPKmwd/87KXlu+DlQX
	JXvV6SJli6qLykLjwa3DGp+tiVWY117rlVRlL635wg8nynhmchkZD7XkvfubwxdyxpcPx/54eWMrp
	0dSLsw0UAYWnyA1Lx3s1R6z0O3Tv4aW8iIQazebv8JXPs6X3HMOveAj+ROL7wibtRRA0i6DT5jNgj
	x+1KcZn/Mu3bHSeGzFAjW0W7H9qe3oUepsswWD4KUYyi2OnwsT9LhYW7cDpJHqkk2IGmPHPCLbu0y
	jBFv0H8m0QpQ0raAMYFKyqq70mwP+Ef1jpdhpyqrxPY1/RK/qRouCli9t+kJofknpsGrHAW71iMe7
	6n+pk0XA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaDq5-004b7c-8Y; Mon, 19 Sep 2022 10:17:21 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E4D09302ED3;
	Mon, 19 Sep 2022 12:16:24 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 0AC522BA49044; Mon, 19 Sep 2022 12:16:22 +0200 (CEST)
Message-ID: <20220919101521.206622076@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 19 Sep 2022 11:59:52 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Subject: [PATCH v2 13/44] cpuidle: Fix ct_idle_*() usage
References: <20220919095939.761690562@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Tue, 20 Sep 2022 07:59:18 +1000
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
Cc: juri.lelli@redhat.com, rafael@kernel.org, catalin.marinas@arm.com, linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, srivatsa@csail.mit.edu, linux-arch@vger.kernel.org, vincent.guittot@linaro.org, chenhuacai@kernel.org, linux-acpi@vger.kernel.org, agross@kernel.org, geert@linux-m68k.org, linux-imx@nxp.com, vgupta@kernel.org, mattst88@gmail.com, borntraeger@linux.ibm.com, mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, npiggin@gmail.com, tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, andreyknvl@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org, tj@kernel.org, Andrew Morton <akpm@linux-foundation.org>, mark.rutland@arm.com, linux-ia64@vger.kernel.org, dave.hansen@linux.intel.com, vir
 tualization@lists.linux-foundation.org, James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, festevam@gmail.com, deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com, dennis@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, shorne@gmail.com, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, alexander.shishkin@linux.intel.com, fweisbec@gmail.com, lpieralisi@kernel.org, atishp@atishpatra.org, linux@rasmusvillemoes.dk, kasan-dev@googlegroups.com, will@kernel.org, boris.ostrovsky@oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org, pv-drivers@vmware.com, linux-snps-arc@lists.infradea
 d.org, mgorman@suse.de, jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, linux-clk@vger.kernel.org, rostedt@goodmis.org, ink@jurassic.park.msu.ru, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, ryabinin.a.a@gmail.com, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, tony@atomide.com, amakhalov@vmware.com, konrad.dybcio@somainline.org, bjorn.andersson@linaro.org, glider@google.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, aou@eecs.berkeley.edu, hca@linux.ibm.com, richard.henderson@linaro.org, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, acme@kernel.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org,
  andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, dvyukov@google.com, jgross@suse.com, monstr@monstr.eu, linux-mips@vger.kernel.org, palmer@dabbelt.com, anup@brainfault.org, bp@alien8.de, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The whole disable-RCU, enable-IRQS dance is very intricate since
changing IRQ state is traced, which depends on RCU.

Add two helpers for the cpuidle case that mirror the entry code.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/arm/mach-imx/cpuidle-imx6q.c    |    4 +--
 arch/arm/mach-imx/cpuidle-imx6sx.c   |    4 +--
 arch/arm/mach-omap2/cpuidle34xx.c    |    4 +--
 arch/arm/mach-omap2/cpuidle44xx.c    |    8 +++---
 drivers/acpi/processor_idle.c        |    8 ++++--
 drivers/cpuidle/cpuidle-big_little.c |    4 +--
 drivers/cpuidle/cpuidle-mvebu-v7.c   |    4 +--
 drivers/cpuidle/cpuidle-psci.c       |    4 +--
 drivers/cpuidle/cpuidle-riscv-sbi.c  |    4 +--
 drivers/cpuidle/cpuidle-tegra.c      |    8 +++---
 drivers/cpuidle/cpuidle.c            |   11 ++++----
 include/linux/cpuidle.h              |   38 ++++++++++++++++++++++++++---
 kernel/sched/idle.c                  |   45 ++++++++++-------------------------
 kernel/time/tick-broadcast.c         |    6 +++-
 14 files changed, 86 insertions(+), 66 deletions(-)

--- a/arch/arm/mach-imx/cpuidle-imx6q.c
+++ b/arch/arm/mach-imx/cpuidle-imx6q.c
@@ -25,9 +25,9 @@ static int imx6q_enter_wait(struct cpuid
 		imx6_set_lpm(WAIT_UNCLOCKED);
 	raw_spin_unlock(&cpuidle_lock);
 
-	ct_idle_enter();
+	ct_cpuidle_enter();
 	cpu_do_idle();
-	ct_idle_exit();
+	ct_cpuidle_exit();
 
 	raw_spin_lock(&cpuidle_lock);
 	if (num_idle_cpus-- == num_online_cpus())
--- a/arch/arm/mach-imx/cpuidle-imx6sx.c
+++ b/arch/arm/mach-imx/cpuidle-imx6sx.c
@@ -47,9 +47,9 @@ static int imx6sx_enter_wait(struct cpui
 		cpu_pm_enter();
 		cpu_cluster_pm_enter();
 
-		ct_idle_enter();
+		ct_cpuidle_enter();
 		cpu_suspend(0, imx6sx_idle_finish);
-		ct_idle_exit();
+		ct_cpuidle_exit();
 
 		cpu_cluster_pm_exit();
 		cpu_pm_exit();
--- a/arch/arm/mach-omap2/cpuidle34xx.c
+++ b/arch/arm/mach-omap2/cpuidle34xx.c
@@ -133,9 +133,9 @@ static int omap3_enter_idle(struct cpuid
 	}
 
 	/* Execute ARM wfi */
-	ct_idle_enter();
+	ct_cpuidle_enter();
 	omap_sram_idle();
-	ct_idle_exit();
+	ct_cpuidle_exit();
 
 	/*
 	 * Call idle CPU PM enter notifier chain to restore
--- a/arch/arm/mach-omap2/cpuidle44xx.c
+++ b/arch/arm/mach-omap2/cpuidle44xx.c
@@ -105,9 +105,9 @@ static int omap_enter_idle_smp(struct cp
 	}
 	raw_spin_unlock_irqrestore(&mpu_lock, flag);
 
-	ct_idle_enter();
+	ct_cpuidle_enter();
 	omap4_enter_lowpower(dev->cpu, cx->cpu_state);
-	ct_idle_exit();
+	ct_cpuidle_exit();
 
 	raw_spin_lock_irqsave(&mpu_lock, flag);
 	if (cx->mpu_state_vote == num_online_cpus())
@@ -186,10 +186,10 @@ static int omap_enter_idle_coupled(struc
 		}
 	}
 
-	ct_idle_enter();
+	ct_cpuidle_enter();
 	omap4_enter_lowpower(dev->cpu, cx->cpu_state);
 	cpu_done[dev->cpu] = true;
-	ct_idle_exit();
+	ct_cpuidle_exit();
 
 	/* Wakeup CPU1 only if it is not offlined */
 	if (dev->cpu == 0 && cpumask_test_cpu(1, cpu_online_mask)) {
--- a/drivers/acpi/processor_idle.c
+++ b/drivers/acpi/processor_idle.c
@@ -627,6 +627,8 @@ static int __cpuidle acpi_idle_enter_bm(
 	 */
 	bool dis_bm = pr->flags.bm_control;
 
+	instrumentation_begin();
+
 	/* If we can skip BM, demote to a safe state. */
 	if (!cx->bm_sts_skip && acpi_idle_bm_check()) {
 		dis_bm = false;
@@ -648,11 +650,11 @@ static int __cpuidle acpi_idle_enter_bm(
 		raw_spin_unlock(&c3_lock);
 	}
 
-	ct_idle_enter();
+	ct_cpuidle_enter();
 
 	acpi_idle_do_entry(cx);
 
-	ct_idle_exit();
+	ct_cpuidle_exit();
 
 	/* Re-enable bus master arbitration */
 	if (dis_bm) {
@@ -662,6 +664,8 @@ static int __cpuidle acpi_idle_enter_bm(
 		raw_spin_unlock(&c3_lock);
 	}
 
+	instrumentation_end();
+
 	return index;
 }
 
--- a/drivers/cpuidle/cpuidle-big_little.c
+++ b/drivers/cpuidle/cpuidle-big_little.c
@@ -126,13 +126,13 @@ static int bl_enter_powerdown(struct cpu
 				struct cpuidle_driver *drv, int idx)
 {
 	cpu_pm_enter();
-	ct_idle_enter();
+	ct_cpuidle_enter();
 
 	cpu_suspend(0, bl_powerdown_finisher);
 
 	/* signals the MCPM core that CPU is out of low power state */
 	mcpm_cpu_powered_up();
-	ct_idle_exit();
+	ct_cpuidle_exit();
 
 	cpu_pm_exit();
 
--- a/drivers/cpuidle/cpuidle-mvebu-v7.c
+++ b/drivers/cpuidle/cpuidle-mvebu-v7.c
@@ -36,9 +36,9 @@ static int mvebu_v7_enter_idle(struct cp
 	if (drv->states[index].flags & MVEBU_V7_FLAG_DEEP_IDLE)
 		deepidle = true;
 
-	ct_idle_enter();
+	ct_cpuidle_enter();
 	ret = mvebu_v7_cpu_suspend(deepidle);
-	ct_idle_exit();
+	ct_cpuidle_exit();
 
 	cpu_pm_exit();
 
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -74,7 +74,7 @@ static int __psci_enter_domain_idle_stat
 	else
 		pm_runtime_put_sync_suspend(pd_dev);
 
-	ct_idle_enter();
+	ct_cpuidle_enter();
 
 	state = psci_get_domain_state();
 	if (!state)
@@ -82,7 +82,7 @@ static int __psci_enter_domain_idle_stat
 
 	ret = psci_cpu_suspend_enter(state) ? -1 : idx;
 
-	ct_idle_exit();
+	ct_cpuidle_exit();
 
 	if (s2idle)
 		dev_pm_genpd_resume(pd_dev);
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -121,7 +121,7 @@ static int __sbi_enter_domain_idle_state
 	else
 		pm_runtime_put_sync_suspend(pd_dev);
 
-	ct_idle_enter();
+	ct_cpuidle_enter();
 
 	if (sbi_is_domain_state_available())
 		state = sbi_get_domain_state();
@@ -130,7 +130,7 @@ static int __sbi_enter_domain_idle_state
 
 	ret = sbi_suspend(state) ? -1 : idx;
 
-	ct_idle_exit();
+	ct_cpuidle_exit();
 
 	if (s2idle)
 		dev_pm_genpd_resume(pd_dev);
--- a/drivers/cpuidle/cpuidle-tegra.c
+++ b/drivers/cpuidle/cpuidle-tegra.c
@@ -183,7 +183,7 @@ static int tegra_cpuidle_state_enter(str
 	tegra_pm_set_cpu_in_lp2();
 	cpu_pm_enter();
 
-	ct_idle_enter();
+	ct_cpuidle_enter();
 
 	switch (index) {
 	case TEGRA_C7:
@@ -199,7 +199,7 @@ static int tegra_cpuidle_state_enter(str
 		break;
 	}
 
-	ct_idle_exit();
+	ct_cpuidle_exit();
 
 	cpu_pm_exit();
 	tegra_pm_clear_cpu_in_lp2();
@@ -240,10 +240,10 @@ static int tegra_cpuidle_enter(struct cp
 
 	if (index == TEGRA_C1) {
 		if (do_rcu)
-			ct_idle_enter();
+			ct_cpuidle_enter();
 		ret = arm_cpuidle_simple_enter(dev, drv, index);
 		if (do_rcu)
-			ct_idle_exit();
+			ct_cpuidle_exit();
 	} else
 		ret = tegra_cpuidle_state_enter(dev, index, cpu);
 
--- a/drivers/cpuidle/cpuidle.c
+++ b/drivers/cpuidle/cpuidle.c
@@ -14,6 +14,7 @@
 #include <linux/mutex.h>
 #include <linux/sched.h>
 #include <linux/sched/clock.h>
+#include <linux/sched/idle.h>
 #include <linux/notifier.h>
 #include <linux/pm_qos.h>
 #include <linux/cpu.h>
@@ -152,12 +153,12 @@ static void enter_s2idle_proper(struct c
 	 */
 	stop_critical_timings();
 	if (!(target_state->flags & CPUIDLE_FLAG_RCU_IDLE))
-		ct_idle_enter();
+		ct_cpuidle_enter();
 	target_state->enter_s2idle(dev, drv, index);
 	if (WARN_ON_ONCE(!irqs_disabled()))
-		local_irq_disable();
+		raw_local_irq_disable();
 	if (!(target_state->flags & CPUIDLE_FLAG_RCU_IDLE))
-		ct_idle_exit();
+		ct_cpuidle_exit();
 	tick_unfreeze();
 	start_critical_timings();
 
@@ -235,14 +236,14 @@ int cpuidle_enter_state(struct cpuidle_d
 
 	stop_critical_timings();
 	if (!(target_state->flags & CPUIDLE_FLAG_RCU_IDLE))
-		ct_idle_enter();
+		ct_cpuidle_enter();
 
 	entered_state = target_state->enter(dev, drv, index);
 	if (WARN_ONCE(!irqs_disabled(), "%ps leaked IRQ state", target_state->enter))
 		raw_local_irq_disable();
 
 	if (!(target_state->flags & CPUIDLE_FLAG_RCU_IDLE))
-		ct_idle_exit();
+		ct_cpuidle_exit();
 	start_critical_timings();
 
 	sched_clock_idle_wakeup_event();
--- a/include/linux/cpuidle.h
+++ b/include/linux/cpuidle.h
@@ -14,6 +14,7 @@
 #include <linux/percpu.h>
 #include <linux/list.h>
 #include <linux/hrtimer.h>
+#include <linux/context_tracking.h>
 
 #define CPUIDLE_STATE_MAX	10
 #define CPUIDLE_NAME_LEN	16
@@ -115,6 +116,35 @@ struct cpuidle_device {
 DECLARE_PER_CPU(struct cpuidle_device *, cpuidle_devices);
 DECLARE_PER_CPU(struct cpuidle_device, cpuidle_dev);
 
+static __always_inline void ct_cpuidle_enter(void)
+{
+	lockdep_assert_irqs_disabled();
+	/*
+	 * Idle is allowed to (temporary) enable IRQs. It
+	 * will return with IRQs disabled.
+	 *
+	 * Trace IRQs enable here, then switch off RCU, and have
+	 * arch_cpu_idle() use raw_local_irq_enable(). Note that
+	 * ct_idle_enter() relies on lockdep IRQ state, so switch that
+	 * last -- this is very similar to the entry code.
+	 */
+	trace_hardirqs_on_prepare();
+	lockdep_hardirqs_on_prepare();
+	instrumentation_end();
+	ct_idle_enter();
+	lockdep_hardirqs_on(_THIS_IP_);
+}
+
+static __always_inline void ct_cpuidle_exit(void)
+{
+	/*
+	 * Carefully undo the above.
+	 */
+	lockdep_hardirqs_off(_THIS_IP_);
+	ct_idle_exit();
+	instrumentation_begin();
+}
+
 /****************************
  * CPUIDLE DRIVER INTERFACE *
  ****************************/
@@ -282,18 +312,18 @@ extern s64 cpuidle_governor_latency_req(
 	int __ret = 0;							\
 									\
 	if (!idx) {							\
-		ct_idle_enter();					\
+		ct_cpuidle_enter();					\
 		cpu_do_idle();						\
-		ct_idle_exit();						\
+		ct_cpuidle_exit();					\
 		return idx;						\
 	}								\
 									\
 	if (!is_retention)						\
 		__ret =  cpu_pm_enter();				\
 	if (!__ret) {							\
-		ct_idle_enter();					\
+		ct_cpuidle_enter();					\
 		__ret = low_level_idle_enter(state);			\
-		ct_idle_exit();						\
+		ct_cpuidle_exit();					\
 		if (!is_retention)					\
 			cpu_pm_exit();					\
 	}								\
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -51,18 +51,22 @@ __setup("hlt", cpu_idle_nopoll_setup);
 
 static noinline int __cpuidle cpu_idle_poll(void)
 {
+	instrumentation_begin();
 	trace_cpu_idle(0, smp_processor_id());
 	stop_critical_timings();
-	ct_idle_enter();
-	local_irq_enable();
+	ct_cpuidle_enter();
 
+	raw_local_irq_enable();
 	while (!tif_need_resched() &&
 	       (cpu_idle_force_poll || tick_check_broadcast_expired()))
 		cpu_relax();
+	raw_local_irq_disable();
 
-	ct_idle_exit();
+	ct_cpuidle_exit();
 	start_critical_timings();
 	trace_cpu_idle(PWR_EVENT_EXIT, smp_processor_id());
+	local_irq_enable();
+	instrumentation_end();
 
 	return 1;
 }
@@ -85,44 +89,21 @@ void __weak arch_cpu_idle(void)
  */
 void __cpuidle default_idle_call(void)
 {
-	if (current_clr_polling_and_test()) {
-		local_irq_enable();
-	} else {
-
+	instrumentation_begin();
+	if (!current_clr_polling_and_test()) {
 		trace_cpu_idle(1, smp_processor_id());
 		stop_critical_timings();
 
-		/*
-		 * arch_cpu_idle() is supposed to enable IRQs, however
-		 * we can't do that because of RCU and tracing.
-		 *
-		 * Trace IRQs enable here, then switch off RCU, and have
-		 * arch_cpu_idle() use raw_local_irq_enable(). Note that
-		 * ct_idle_enter() relies on lockdep IRQ state, so switch that
-		 * last -- this is very similar to the entry code.
-		 */
-		trace_hardirqs_on_prepare();
-		lockdep_hardirqs_on_prepare();
-		ct_idle_enter();
-		lockdep_hardirqs_on(_THIS_IP_);
-
+		ct_cpuidle_enter();
 		arch_cpu_idle();
-
-		/*
-		 * OK, so IRQs are enabled here, but RCU needs them disabled to
-		 * turn itself back on.. funny thing is that disabling IRQs
-		 * will cause tracing, which needs RCU. Jump through hoops to
-		 * make it 'work'.
-		 */
 		raw_local_irq_disable();
-		lockdep_hardirqs_off(_THIS_IP_);
-		ct_idle_exit();
-		lockdep_hardirqs_on(_THIS_IP_);
-		raw_local_irq_enable();
+		ct_cpuidle_exit();
 
 		start_critical_timings();
 		trace_cpu_idle(PWR_EVENT_EXIT, smp_processor_id());
 	}
+	local_irq_enable();
+	instrumentation_end();
 }
 
 static int call_cpuidle_s2idle(struct cpuidle_driver *drv,
--- a/kernel/time/tick-broadcast.c
+++ b/kernel/time/tick-broadcast.c
@@ -622,9 +622,13 @@ struct cpumask *tick_get_broadcast_onesh
  * to avoid a deep idle transition as we are about to get the
  * broadcast IPI right away.
  */
-int tick_check_broadcast_expired(void)
+noinstr int tick_check_broadcast_expired(void)
 {
+#ifdef _ASM_GENERIC_BITOPS_INSTRUMENTED_NON_ATOMIC_H
+	return arch_test_bit(smp_processor_id(), cpumask_bits(tick_broadcast_force_mask));
+#else
 	return cpumask_test_cpu(smp_processor_id(), tick_broadcast_force_mask);
+#endif
 }
 
 /*


