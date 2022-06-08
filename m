Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 931BE544051
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 02:07:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJPYj2ZCfz3f9v
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 10:07:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=E6cr+j5s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=E6cr+j5s;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJ96r05Qtz3bkR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 00:47:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=tnA3wPqNh+XrpwQVOnpJL5IWoR32uxOYSq9ZeZNPVI0=; b=E6cr+j5sSXZ8GGphavK9qnd7+N
	nSY0hCAsEVgofgOUTaPMjXeH9fBrlzJVRkmzWwePjKPAgQD+c7y/qDFJlPV1JWEjs5+fD3YShsNI1
	amqZHcD/4E577ioc5qBMYzKqejMRhgd3CALXdnfS65RmjQjuUT0GnljmbHD+8OcdekhOIlhyPeiiK
	EgjVG7WYEO4Ln23h4oHtnHs6IWQNkcQvoDLhNBYPXyCcxELae17cJVba2SVQa9lUVbBg+lwGZuS0G
	24S8FrujRWom0XP3cd9BaFyIXDHECD/BF/vy/d1gw8+LeZJSYxH1bc9JwiizKACgIho7RnJP8/1Ao
	tQpHp77w==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nywwz-0066Be-OR; Wed, 08 Jun 2022 14:46:26 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E0912302E3B;
	Wed,  8 Jun 2022 16:46:22 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 71E0D20C10EAA; Wed,  8 Jun 2022 16:46:18 +0200 (CEST)
Message-ID: <20220608144516.808451191@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 08 Jun 2022 16:27:37 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Subject: [PATCH 14/36] cpuidle: Fix rcu_idle_*() usage
References: <20220608142723.103523089@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Thu, 09 Jun 2022 09:55:19 +1000
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
Cc: juri.lelli@redhat.com, rafael@kernel.org, linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, srivatsa@csail.mit.edu, linux-arch@vger.kernel.org, vincent.guittot@linaro.org, chenhuacai@kernel.org, linux-acpi@vger.kernel.org, agross@kernel.org, geert@linux-m68k.org, linux-imx@nxp.com, catalin.marinas@arm.com, xen-devel@lists.xenproject.org, mattst88@gmail.com, borntraeger@linux.ibm.com, mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, jiangshanlai@gmail.com, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, acme@kernel.org, tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, rth@twiddle.net, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org, paulus@samba.org, mark.rutland@arm.com, linux-ia64@vger.kernel.org, dave.hansen@linux.intel.com, virtualizatio
 n@lists.linux-foundation.org, James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, quic_neeraju@quicinc.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, festevam@gmail.com, deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com, mathieu.desnoyers@efficios.com, frederic@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, shorne@gmail.com, linux-arm-kernel@lists.infradead.org, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, alexander.shishkin@linux.intel.com, lpieralisi@kernel.org, linux@rasmusvillemoes.dk, joel@joelfernandes.org, will@kernel.org, boris.ostrovsky@oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org, pv-drivers@vmware.com, linux-snps-arc@lists.infradea
 d.org, mgorman@suse.de, jacob.jun.pan@linux.intel.com

, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, vgupta@kernel.org, linux-clk@vger.kernel.org, josh@joshtriplett.org, rostedt@goodmis.org, rcu@vger.kernel.org, bp@alien8.de, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, tony@atomide.com, amakhalov@vmware.com, bjorn.andersson@linaro.org, hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, aou@eecs.berkeley.edu, paulmck@kernel.org, hca@linux.ibm.com, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, jgross@suse.com, monstr@monstr.eu, linux-mips@vger.kernel.org, palmer@dab
 belt.com, anup@brainfault.org, ink@jurassic.park.msu.ru, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
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
 drivers/acpi/processor_idle.c        |   18 ++++++++------
 drivers/cpuidle/cpuidle-big_little.c |    4 +--
 drivers/cpuidle/cpuidle-mvebu-v7.c   |    4 +--
 drivers/cpuidle/cpuidle-psci.c       |    4 +--
 drivers/cpuidle/cpuidle-riscv-sbi.c  |    4 +--
 drivers/cpuidle/cpuidle-tegra.c      |    8 +++---
 drivers/cpuidle/cpuidle.c            |   11 ++++----
 include/linux/cpuidle.h              |   37 +++++++++++++++++++++++++---
 kernel/sched/idle.c                  |   45 ++++++++++-------------------------
 kernel/time/tick-broadcast.c         |    6 +++-
 14 files changed, 90 insertions(+), 71 deletions(-)

--- a/arch/arm/mach-imx/cpuidle-imx6q.c
+++ b/arch/arm/mach-imx/cpuidle-imx6q.c
@@ -24,9 +24,9 @@ static int imx6q_enter_wait(struct cpuid
 		imx6_set_lpm(WAIT_UNCLOCKED);
 	raw_spin_unlock(&cpuidle_lock);
 
-	rcu_idle_enter();
+	cpuidle_rcu_enter();
 	cpu_do_idle();
-	rcu_idle_exit();
+	cpuidle_rcu_exit();
 
 	raw_spin_lock(&cpuidle_lock);
 	if (num_idle_cpus-- == num_online_cpus())
--- a/arch/arm/mach-imx/cpuidle-imx6sx.c
+++ b/arch/arm/mach-imx/cpuidle-imx6sx.c
@@ -47,9 +47,9 @@ static int imx6sx_enter_wait(struct cpui
 		cpu_pm_enter();
 		cpu_cluster_pm_enter();
 
-		rcu_idle_enter();
+		cpuidle_rcu_enter();
 		cpu_suspend(0, imx6sx_idle_finish);
-		rcu_idle_exit();
+		cpuidle_rcu_exit();
 
 		cpu_cluster_pm_exit();
 		cpu_pm_exit();
--- a/arch/arm/mach-omap2/cpuidle34xx.c
+++ b/arch/arm/mach-omap2/cpuidle34xx.c
@@ -133,9 +133,9 @@ static int omap3_enter_idle(struct cpuid
 	}
 
 	/* Execute ARM wfi */
-	rcu_idle_enter();
+	cpuidle_rcu_enter();
 	omap_sram_idle();
-	rcu_idle_exit();
+	cpuidle_rcu_exit();
 
 	/*
 	 * Call idle CPU PM enter notifier chain to restore
--- a/arch/arm/mach-omap2/cpuidle44xx.c
+++ b/arch/arm/mach-omap2/cpuidle44xx.c
@@ -105,9 +105,9 @@ static int omap_enter_idle_smp(struct cp
 	}
 	raw_spin_unlock_irqrestore(&mpu_lock, flag);
 
-	rcu_idle_enter();
+	cpuidle_rcu_enter();
 	omap4_enter_lowpower(dev->cpu, cx->cpu_state);
-	rcu_idle_exit();
+	cpuidle_rcu_exit();
 
 	raw_spin_lock_irqsave(&mpu_lock, flag);
 	if (cx->mpu_state_vote == num_online_cpus())
@@ -186,10 +186,10 @@ static int omap_enter_idle_coupled(struc
 		}
 	}
 
-	rcu_idle_enter();
+	cpuidle_rcu_enter();
 	omap4_enter_lowpower(dev->cpu, cx->cpu_state);
 	cpu_done[dev->cpu] = true;
-	rcu_idle_exit();
+	cpuidle_rcu_exit();
 
 	/* Wakeup CPU1 only if it is not offlined */
 	if (dev->cpu == 0 && cpumask_test_cpu(1, cpu_online_mask)) {
--- a/drivers/acpi/processor_idle.c
+++ b/drivers/acpi/processor_idle.c
@@ -607,7 +607,7 @@ static DEFINE_RAW_SPINLOCK(c3_lock);
  * @cx: Target state context
  * @index: index of target state
  */
-static int acpi_idle_enter_bm(struct cpuidle_driver *drv,
+static noinstr int acpi_idle_enter_bm(struct cpuidle_driver *drv,
 			       struct acpi_processor *pr,
 			       struct acpi_processor_cx *cx,
 			       int index)
@@ -626,6 +626,8 @@ static int acpi_idle_enter_bm(struct cpu
 	 */
 	bool dis_bm = pr->flags.bm_control;
 
+	instrumentation_begin();
+
 	/* If we can skip BM, demote to a safe state. */
 	if (!cx->bm_sts_skip && acpi_idle_bm_check()) {
 		dis_bm = false;
@@ -647,11 +649,11 @@ static int acpi_idle_enter_bm(struct cpu
 		raw_spin_unlock(&c3_lock);
 	}
 
-	rcu_idle_enter();
+	cpuidle_rcu_enter();
 
 	acpi_idle_do_entry(cx);
 
-	rcu_idle_exit();
+	cpuidle_rcu_exit();
 
 	/* Re-enable bus master arbitration */
 	if (dis_bm) {
@@ -661,11 +663,13 @@ static int acpi_idle_enter_bm(struct cpu
 		raw_spin_unlock(&c3_lock);
 	}
 
+	instrumentation_end();
+
 	return index;
 }
 
-static int acpi_idle_enter(struct cpuidle_device *dev,
-			   struct cpuidle_driver *drv, int index)
+static noinstr int acpi_idle_enter(struct cpuidle_device *dev,
+				   struct cpuidle_driver *drv, int index)
 {
 	struct acpi_processor_cx *cx = per_cpu(acpi_cstate[index], dev->cpu);
 	struct acpi_processor *pr;
@@ -693,8 +697,8 @@ static int acpi_idle_enter(struct cpuidl
 	return index;
 }
 
-static int acpi_idle_enter_s2idle(struct cpuidle_device *dev,
-				  struct cpuidle_driver *drv, int index)
+static noinstr int acpi_idle_enter_s2idle(struct cpuidle_device *dev,
+					  struct cpuidle_driver *drv, int index)
 {
 	struct acpi_processor_cx *cx = per_cpu(acpi_cstate[index], dev->cpu);
 
--- a/drivers/cpuidle/cpuidle-big_little.c
+++ b/drivers/cpuidle/cpuidle-big_little.c
@@ -126,13 +126,13 @@ static int bl_enter_powerdown(struct cpu
 				struct cpuidle_driver *drv, int idx)
 {
 	cpu_pm_enter();
-	rcu_idle_enter();
+	cpuidle_rcu_enter();
 
 	cpu_suspend(0, bl_powerdown_finisher);
 
 	/* signals the MCPM core that CPU is out of low power state */
 	mcpm_cpu_powered_up();
-	rcu_idle_exit();
+	cpuidle_rcu_exit();
 
 	cpu_pm_exit();
 
--- a/drivers/cpuidle/cpuidle-mvebu-v7.c
+++ b/drivers/cpuidle/cpuidle-mvebu-v7.c
@@ -36,9 +36,9 @@ static int mvebu_v7_enter_idle(struct cp
 	if (drv->states[index].flags & MVEBU_V7_FLAG_DEEP_IDLE)
 		deepidle = true;
 
-	rcu_idle_enter();
+	cpuidle_rcu_enter();
 	ret = mvebu_v7_cpu_suspend(deepidle);
-	rcu_idle_exit();
+	cpuidle_rcu_exit();
 
 	cpu_pm_exit();
 
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -74,7 +74,7 @@ static int __psci_enter_domain_idle_stat
 	else
 		pm_runtime_put_sync_suspend(pd_dev);
 
-	rcu_idle_enter();
+	cpuidle_rcu_enter();
 
 	state = psci_get_domain_state();
 	if (!state)
@@ -82,7 +82,7 @@ static int __psci_enter_domain_idle_stat
 
 	ret = psci_cpu_suspend_enter(state) ? -1 : idx;
 
-	rcu_idle_exit();
+	cpuidle_rcu_exit();
 
 	if (s2idle)
 		dev_pm_genpd_resume(pd_dev);
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -121,7 +121,7 @@ static int __sbi_enter_domain_idle_state
 	else
 		pm_runtime_put_sync_suspend(pd_dev);
 
-	rcu_idle_enter();
+	cpuidle_rcu_enter();
 
 	if (sbi_is_domain_state_available())
 		state = sbi_get_domain_state();
@@ -130,7 +130,7 @@ static int __sbi_enter_domain_idle_state
 
 	ret = sbi_suspend(state) ? -1 : idx;
 
-	rcu_idle_exit();
+	cpuidle_rcu_exit();
 
 	if (s2idle)
 		dev_pm_genpd_resume(pd_dev);
--- a/drivers/cpuidle/cpuidle-tegra.c
+++ b/drivers/cpuidle/cpuidle-tegra.c
@@ -183,7 +183,7 @@ static int tegra_cpuidle_state_enter(str
 	tegra_pm_set_cpu_in_lp2();
 	cpu_pm_enter();
 
-	rcu_idle_enter();
+	cpuidle_rcu_enter();
 
 	switch (index) {
 	case TEGRA_C7:
@@ -199,7 +199,7 @@ static int tegra_cpuidle_state_enter(str
 		break;
 	}
 
-	rcu_idle_exit();
+	cpuidle_rcu_exit();
 
 	cpu_pm_exit();
 	tegra_pm_clear_cpu_in_lp2();
@@ -240,10 +240,10 @@ static int tegra_cpuidle_enter(struct cp
 
 	if (index == TEGRA_C1) {
 		if (do_rcu)
-			rcu_idle_enter();
+			cpuidle_rcu_enter();
 		ret = arm_cpuidle_simple_enter(dev, drv, index);
 		if (do_rcu)
-			rcu_idle_exit();
+			cpuidle_rcu_exit();
 	} else
 		ret = tegra_cpuidle_state_enter(dev, index, cpu);
 
--- a/drivers/cpuidle/cpuidle.c
+++ b/drivers/cpuidle/cpuidle.c
@@ -13,6 +13,7 @@
 #include <linux/mutex.h>
 #include <linux/sched.h>
 #include <linux/sched/clock.h>
+#include <linux/sched/idle.h>
 #include <linux/notifier.h>
 #include <linux/pm_qos.h>
 #include <linux/cpu.h>
@@ -150,12 +151,12 @@ static void enter_s2idle_proper(struct c
 	 */
 	stop_critical_timings();
 	if (!(target_state->flags & CPUIDLE_FLAG_RCU_IDLE))
-		rcu_idle_enter();
+		cpuidle_rcu_enter();
 	target_state->enter_s2idle(dev, drv, index);
 	if (WARN_ON_ONCE(!irqs_disabled()))
-		local_irq_disable();
+		raw_local_irq_disable();
 	if (!(target_state->flags & CPUIDLE_FLAG_RCU_IDLE))
-		rcu_idle_exit();
+		cpuidle_rcu_exit();
 	tick_unfreeze();
 	start_critical_timings();
 
@@ -233,14 +234,14 @@ int cpuidle_enter_state(struct cpuidle_d
 
 	stop_critical_timings();
 	if (!(target_state->flags & CPUIDLE_FLAG_RCU_IDLE))
-		rcu_idle_enter();
+		cpuidle_rcu_enter();
 
 	entered_state = target_state->enter(dev, drv, index);
 	if (WARN_ONCE(!irqs_disabled(), "%ps leaked IRQ state", target_state->enter))
 		raw_local_irq_disable();
 
 	if (!(target_state->flags & CPUIDLE_FLAG_RCU_IDLE))
-		rcu_idle_exit();
+		cpuidle_rcu_exit();
 	start_critical_timings();
 
 	sched_clock_idle_wakeup_event();
--- a/include/linux/cpuidle.h
+++ b/include/linux/cpuidle.h
@@ -115,6 +115,35 @@ struct cpuidle_device {
 DECLARE_PER_CPU(struct cpuidle_device *, cpuidle_devices);
 DECLARE_PER_CPU(struct cpuidle_device, cpuidle_dev);
 
+static __always_inline void cpuidle_rcu_enter(void)
+{
+	lockdep_assert_irqs_disabled();
+	/*
+	 * Idle is allowed to (temporary) enable IRQs. It
+	 * will return with IRQs disabled.
+	 *
+	 * Trace IRQs enable here, then switch off RCU, and have
+	 * arch_cpu_idle() use raw_local_irq_enable(). Note that
+	 * rcu_idle_enter() relies on lockdep IRQ state, so switch that
+	 * last -- this is very similar to the entry code.
+	 */
+	trace_hardirqs_on_prepare();
+	lockdep_hardirqs_on_prepare();
+	instrumentation_end();
+	rcu_idle_enter();
+	lockdep_hardirqs_on(_THIS_IP_);
+}
+
+static __always_inline void cpuidle_rcu_exit(void)
+{
+	/*
+	 * Carefully undo the above.
+	 */
+	lockdep_hardirqs_off(_THIS_IP_);
+	rcu_idle_exit();
+	instrumentation_begin();
+}
+
 /****************************
  * CPUIDLE DRIVER INTERFACE *
  ****************************/
@@ -282,18 +311,18 @@ extern s64 cpuidle_governor_latency_req(
 	int __ret = 0;							\
 									\
 	if (!idx) {							\
-		rcu_idle_enter();					\
+		cpuidle_rcu_enter();					\
 		cpu_do_idle();						\
-		rcu_idle_exit();					\
+		cpuidle_rcu_exit();					\
 		return idx;						\
 	}								\
 									\
 	if (!is_retention)						\
 		__ret =  cpu_pm_enter();				\
 	if (!__ret) {							\
-		rcu_idle_enter();					\
+		cpuidle_rcu_enter();					\
 		__ret = low_level_idle_enter(state);			\
-		rcu_idle_exit();					\
+		cpuidle_rcu_exit();					\
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
-	rcu_idle_enter();
-	local_irq_enable();
+	cpuidle_rcu_enter();
 
+	raw_local_irq_enable();
 	while (!tif_need_resched() &&
 	       (cpu_idle_force_poll || tick_check_broadcast_expired()))
 		cpu_relax();
+	raw_local_irq_disable();
 
-	rcu_idle_exit();
+	cpuidle_rcu_exit();
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
-		 * rcu_idle_enter() relies on lockdep IRQ state, so switch that
-		 * last -- this is very similar to the entry code.
-		 */
-		trace_hardirqs_on_prepare();
-		lockdep_hardirqs_on_prepare();
-		rcu_idle_enter();
-		lockdep_hardirqs_on(_THIS_IP_);
-
+		cpuidle_rcu_enter();
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
-		rcu_idle_exit();
-		lockdep_hardirqs_on(_THIS_IP_);
-		raw_local_irq_enable();
+		cpuidle_rcu_exit();
 
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


