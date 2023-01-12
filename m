Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A72E3668539
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 22:22:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtHZ23yNgz3fVk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 08:22:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Qqod01hb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Qqod01hb;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtFjH3382z3f9x
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 06:58:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=9z+4CWfQMO+ElFQ60iDcVJO2pPanU43MIsqpSKsLu08=; b=Qqod01hbcDRSoMsHp2FGB2yRt/
	657wthIO1WvpTIc8UJxry1BepGtlDwE7epFhhEiyVvYd20FumrIlq3K+vaV0ZtQy7OHhU1Ha6Vy+d
	u0SWb3lIPqXVymeSnZvxVUtagcGxMJy0Xe74jYFZx3+0fLic59abuep7mI8xDIZhMBlZ3t6vzavRb
	Uv1EVPbqUKMaMYAg9feMtnwldJEBNOwkWJYHJ9H531eMj1aqNuc6W4X31PojT7WMjEw5m15cdtiiL
	lKCURu3mZO9ph5F7yR6vShuu1trhYOgXzpxqstDK3EURxd4NXPx8gIyyUp3NSoc32+cD1hUu18TSA
	o+sF+wjQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG3hu-005P7h-G4; Thu, 12 Jan 2023 19:57:50 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3736830347E;
	Thu, 12 Jan 2023 20:57:14 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 725472CD066E4; Thu, 12 Jan 2023 20:57:08 +0100 (CET)
Message-ID: <20230112195542.274096325@infradead.org>
User-Agent: quilt/0.66
Date: Thu, 12 Jan 2023 20:44:02 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Subject: [PATCH v3 48/51] cpuidle,arch: Mark all ct_cpuidle_enter() callers __cpuidle
References: <20230112194314.845371875@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Fri, 13 Jan 2023 07:59:45 +1100
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
Cc: juri.lelli@redhat.com, rafael@kernel.org, catalin.marinas@arm.com, linus.walleij@linaro.org, nsekhar@ti.com, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, srivatsa@csail.mit.edu, linux-arch@vger.kernel.org, linux-samsung-soc@vger.kernel.org, vincent.guittot@linaro.org, chenhuacai@kernel.org, linux-acpi@vger.kernel.org, agross@kernel.org, geert@linux-m68k.org, linux-imx@nxp.com, vgupta@kernel.org, mattst88@gmail.com, borntraeger@linux.ibm.com, mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, npiggin@gmail.com, tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, andreyknvl@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org, tj@kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-trace-kernel@vger.kernel.
 org, mark.rutland@arm.com, linux-ia64@vger.kernel.org, alim.akhtar@samsung.com, dave.hansen@linux.intel.com, virtualization@lists.linux-foundation.org, James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, will@kernel.org, brgl@bgdev.pl, daniel.lezcano@linaro.org, jonathanh@nvidia.com, dennis@kernel.org, frederic@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, shorne@gmail.com, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, alexander.shishkin@linux.intel.com, lpieralisi@kernel.org, atishp@atishpatra.org, linux@rasmusvillemoes.dk, kasan-dev@googlegroups.com, festevam@gmail.com, boris.ostrovsky
 @oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org, pv-drivers@vmware.com, linux-snps-arc@lists.infradead.org, mgorman@suse.de, jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, linux-clk@vger.kernel.org, rostedt@goodmis.org, ink@jurassic.park.msu.ru, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, konrad.dybcio@linaro.org, ryabinin.a.a@gmail.com, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, tony@atomide.com, amakhalov@vmware.com, linux-mm@kvack.org, glider@google.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, mhiramat@kernel.org, aou@eecs.berkeley.edu, paulmck@kernel.org, hca@linux.ibm.com, richard.henderson@linaro.org, stefan.kristians
 son@saunalahti.fi, openrisc@lists.librecores.org, acme@kernel.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, dvyukov@google.com, jgross@suse.com, monstr@monstr.eu, andersson@kernel.org, linux-mips@vger.kernel.org, krzysztof.kozlowski@linaro.org, palmer@dabbelt.com, anup@brainfault.org, bp@alien8.de, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org, deller@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For all cpuidle drivers that use CPUIDLE_FLAG_RCU_IDLE, ensure that
all functions that call ct_cpuidle_enter() are marked __cpuidle.

( due to lack of noinstr validation on these platforms it is entirely
  possible this isn't complete )

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/arm/mach-imx/cpuidle-imx6q.c         |    4 ++--
 arch/arm/mach-imx/cpuidle-imx6sx.c        |    4 ++--
 arch/arm/mach-omap2/omap-mpuss-lowpower.c |    4 ++--
 arch/arm/mach-omap2/pm34xx.c              |    2 +-
 arch/arm64/kernel/cpuidle.c               |    2 +-
 drivers/cpuidle/cpuidle-arm.c             |    4 ++--
 drivers/cpuidle/cpuidle-big_little.c      |    4 ++--
 drivers/cpuidle/cpuidle-mvebu-v7.c        |    6 +++---
 drivers/cpuidle/cpuidle-psci.c            |   17 ++++++-----------
 drivers/cpuidle/cpuidle-qcom-spm.c        |    4 ++--
 drivers/cpuidle/cpuidle-riscv-sbi.c       |   10 +++++-----
 drivers/cpuidle/cpuidle-tegra.c           |   10 +++++-----
 12 files changed, 33 insertions(+), 38 deletions(-)

--- a/arch/arm/mach-imx/cpuidle-imx6q.c
+++ b/arch/arm/mach-imx/cpuidle-imx6q.c
@@ -17,8 +17,8 @@
 static int num_idle_cpus = 0;
 static DEFINE_RAW_SPINLOCK(cpuidle_lock);
 
-static int imx6q_enter_wait(struct cpuidle_device *dev,
-			    struct cpuidle_driver *drv, int index)
+static __cpuidle int imx6q_enter_wait(struct cpuidle_device *dev,
+				      struct cpuidle_driver *drv, int index)
 {
 	raw_spin_lock(&cpuidle_lock);
 	if (++num_idle_cpus == num_online_cpus())
--- a/arch/arm/mach-imx/cpuidle-imx6sx.c
+++ b/arch/arm/mach-imx/cpuidle-imx6sx.c
@@ -30,8 +30,8 @@ static int imx6sx_idle_finish(unsigned l
 	return 0;
 }
 
-static int imx6sx_enter_wait(struct cpuidle_device *dev,
-			    struct cpuidle_driver *drv, int index)
+static __cpuidle int imx6sx_enter_wait(struct cpuidle_device *dev,
+				       struct cpuidle_driver *drv, int index)
 {
 	imx6_set_lpm(WAIT_UNCLOCKED);
 
--- a/arch/arm/mach-omap2/omap-mpuss-lowpower.c
+++ b/arch/arm/mach-omap2/omap-mpuss-lowpower.c
@@ -224,8 +224,8 @@ static void __init save_l2x0_context(voi
  *	2 - CPUx L1 and logic lost + GIC lost: MPUSS OSWR
  *	3 - CPUx L1 and logic lost + GIC + L2 lost: DEVICE OFF
  */
-int omap4_enter_lowpower(unsigned int cpu, unsigned int power_state,
-			 bool rcuidle)
+__cpuidle int omap4_enter_lowpower(unsigned int cpu, unsigned int power_state,
+				   bool rcuidle)
 {
 	struct omap4_cpu_pm_info *pm_info = &per_cpu(omap4_pm_info, cpu);
 	unsigned int save_state = 0, cpu_logic_state = PWRDM_POWER_RET;
--- a/arch/arm/mach-omap2/pm34xx.c
+++ b/arch/arm/mach-omap2/pm34xx.c
@@ -175,7 +175,7 @@ static int omap34xx_do_sram_idle(unsigne
 	return 0;
 }
 
-void omap_sram_idle(bool rcuidle)
+__cpuidle void omap_sram_idle(bool rcuidle)
 {
 	/* Variable to tell what needs to be saved and restored
 	 * in omap_sram_idle*/
--- a/arch/arm64/kernel/cpuidle.c
+++ b/arch/arm64/kernel/cpuidle.c
@@ -62,7 +62,7 @@ int acpi_processor_ffh_lpi_probe(unsigne
 	return psci_acpi_cpu_init_idle(cpu);
 }
 
-int acpi_processor_ffh_lpi_enter(struct acpi_lpi_state *lpi)
+__cpuidle int acpi_processor_ffh_lpi_enter(struct acpi_lpi_state *lpi)
 {
 	u32 state = lpi->address;
 
--- a/drivers/cpuidle/cpuidle-arm.c
+++ b/drivers/cpuidle/cpuidle-arm.c
@@ -31,8 +31,8 @@
  * Called from the CPUidle framework to program the device to the
  * specified target state selected by the governor.
  */
-static int arm_enter_idle_state(struct cpuidle_device *dev,
-				struct cpuidle_driver *drv, int idx)
+static __cpuidle int arm_enter_idle_state(struct cpuidle_device *dev,
+					  struct cpuidle_driver *drv, int idx)
 {
 	/*
 	 * Pass idle state index to arm_cpuidle_suspend which in turn
--- a/drivers/cpuidle/cpuidle-big_little.c
+++ b/drivers/cpuidle/cpuidle-big_little.c
@@ -122,8 +122,8 @@ static int notrace bl_powerdown_finisher
  * Called from the CPUidle framework to program the device to the
  * specified target state selected by the governor.
  */
-static int bl_enter_powerdown(struct cpuidle_device *dev,
-				struct cpuidle_driver *drv, int idx)
+static __cpuidle int bl_enter_powerdown(struct cpuidle_device *dev,
+					struct cpuidle_driver *drv, int idx)
 {
 	cpu_pm_enter();
 	ct_cpuidle_enter();
--- a/drivers/cpuidle/cpuidle-mvebu-v7.c
+++ b/drivers/cpuidle/cpuidle-mvebu-v7.c
@@ -25,9 +25,9 @@
 
 static int (*mvebu_v7_cpu_suspend)(int);
 
-static int mvebu_v7_enter_idle(struct cpuidle_device *dev,
-				struct cpuidle_driver *drv,
-				int index)
+static __cpuidle int mvebu_v7_enter_idle(struct cpuidle_device *dev,
+					 struct cpuidle_driver *drv,
+					 int index)
 {
 	int ret;
 	bool deepidle = false;
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -49,14 +49,9 @@ static inline u32 psci_get_domain_state(
 	return __this_cpu_read(domain_state);
 }
 
-static inline int psci_enter_state(int idx, u32 state)
-{
-	return CPU_PM_CPU_IDLE_ENTER_PARAM(psci_cpu_suspend_enter, idx, state);
-}
-
-static int __psci_enter_domain_idle_state(struct cpuidle_device *dev,
-					  struct cpuidle_driver *drv, int idx,
-					  bool s2idle)
+static __cpuidle int __psci_enter_domain_idle_state(struct cpuidle_device *dev,
+						    struct cpuidle_driver *drv, int idx,
+						    bool s2idle)
 {
 	struct psci_cpuidle_data *data = this_cpu_ptr(&psci_cpuidle_data);
 	u32 *states = data->psci_states;
@@ -192,12 +187,12 @@ static void psci_idle_init_cpuhp(void)
 		pr_warn("Failed %d while setup cpuhp state\n", err);
 }
 
-static int psci_enter_idle_state(struct cpuidle_device *dev,
-				struct cpuidle_driver *drv, int idx)
+static __cpuidle int psci_enter_idle_state(struct cpuidle_device *dev,
+					   struct cpuidle_driver *drv, int idx)
 {
 	u32 *state = __this_cpu_read(psci_cpuidle_data.psci_states);
 
-	return psci_enter_state(idx, state[idx]);
+	return CPU_PM_CPU_IDLE_ENTER_PARAM(psci_cpu_suspend_enter, idx, state[idx]);
 }
 
 static const struct of_device_id psci_idle_state_match[] = {
--- a/drivers/cpuidle/cpuidle-qcom-spm.c
+++ b/drivers/cpuidle/cpuidle-qcom-spm.c
@@ -58,8 +58,8 @@ static int qcom_cpu_spc(struct spm_drive
 	return ret;
 }
 
-static int spm_enter_idle_state(struct cpuidle_device *dev,
-				struct cpuidle_driver *drv, int idx)
+static __cpuidle int spm_enter_idle_state(struct cpuidle_device *dev,
+					  struct cpuidle_driver *drv, int idx)
 {
 	struct cpuidle_qcom_spm_data *data = container_of(drv, struct cpuidle_qcom_spm_data,
 							  cpuidle_driver);
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -93,8 +93,8 @@ static int sbi_suspend(u32 state)
 		return sbi_suspend_finisher(state, 0, 0);
 }
 
-static int sbi_cpuidle_enter_state(struct cpuidle_device *dev,
-				   struct cpuidle_driver *drv, int idx)
+static __cpuidle int sbi_cpuidle_enter_state(struct cpuidle_device *dev,
+					     struct cpuidle_driver *drv, int idx)
 {
 	u32 *states = __this_cpu_read(sbi_cpuidle_data.states);
 	u32 state = states[idx];
@@ -106,9 +106,9 @@ static int sbi_cpuidle_enter_state(struc
 							     idx, state);
 }
 
-static int __sbi_enter_domain_idle_state(struct cpuidle_device *dev,
-					  struct cpuidle_driver *drv, int idx,
-					  bool s2idle)
+static __cpuidle int __sbi_enter_domain_idle_state(struct cpuidle_device *dev,
+						   struct cpuidle_driver *drv, int idx,
+						   bool s2idle)
 {
 	struct sbi_cpuidle_data *data = this_cpu_ptr(&sbi_cpuidle_data);
 	u32 *states = data->states;
--- a/drivers/cpuidle/cpuidle-tegra.c
+++ b/drivers/cpuidle/cpuidle-tegra.c
@@ -160,8 +160,8 @@ static int tegra_cpuidle_coupled_barrier
 	return 0;
 }
 
-static int tegra_cpuidle_state_enter(struct cpuidle_device *dev,
-				     int index, unsigned int cpu)
+static __cpuidle int tegra_cpuidle_state_enter(struct cpuidle_device *dev,
+					       int index, unsigned int cpu)
 {
 	int err;
 
@@ -226,9 +226,9 @@ static int tegra_cpuidle_adjust_state_in
 	return index;
 }
 
-static int tegra_cpuidle_enter(struct cpuidle_device *dev,
-			       struct cpuidle_driver *drv,
-			       int index)
+static __cpuidle int tegra_cpuidle_enter(struct cpuidle_device *dev,
+					 struct cpuidle_driver *drv,
+					 int index)
 {
 	bool do_rcu = drv->states[index].flags & CPUIDLE_FLAG_RCU_IDLE;
 	unsigned int cpu = cpu_logical_map(dev->cpu);


