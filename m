Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BD066DD10
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 13:00:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nx6sm1DVCz3cd7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 23:00:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=GQsHqdtN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=GQsHqdtN;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nx4np4MzNz3bNs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 21:27:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oxrJBZkAaCeFAHBiyHLFWLeqn2s4gXmFVHT68O/MsFk=; b=GQsHqdtN/iREDQ8vi1O4Be1MrZ
	rseA9/3ogzxQ6xZE4SqLUZG4sV/QDZjvMovg65N0xIIgCnRPbkND1+nwy51nHnBc5DWNJS4XUBAN9
	DGhO4XvtgUfXh3DGTlKQTq1yWaZoEocA9mKp7m7181bsUQeP0yUWn9Ocr+1xM7l1a0UxxyRm82Zw+
	z3mRAtrbo2NEuxCbyqDel031QfZM7HOcrBLOGqBY1RekqMov5sENJSTJquxMwFQpH1Z5aFuaq2SxP
	yues13giahhBFOzG58JwmbeFuKGXFy4M+qN2H/Xcy0ClAmlPum6BOEWDZwYNw11AStmRYs4JMNKUo
	mE/sBfbw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHjB0-009alj-Ie; Tue, 17 Jan 2023 10:26:46 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E6A7A300129;
	Tue, 17 Jan 2023 11:26:29 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id C3475201C94B3; Tue, 17 Jan 2023 11:26:29 +0100 (CET)
Date: Tue, 17 Jan 2023 11:26:29 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 00/51] cpuidle,rcu: Clean up the mess
Message-ID: <Y8Z31UbzG3LJgAXE@hirez.programming.kicks-ass.net>
References: <20230112194314.845371875@infradead.org>
 <Y8WCWAuQSHN651dA@FVFF77S0Q05N.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8WCWAuQSHN651dA@FVFF77S0Q05N.cambridge.arm.com>
X-Mailman-Approved-At: Tue, 17 Jan 2023 22:59:57 +1100
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
 org, linux-ia64@vger.kernel.org, alim.akhtar@samsung.com, dave.hansen@linux.intel.com, virtualization@lists.linux-foundation.org, James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, will@kernel.org, brgl@bgdev.pl, daniel.lezcano@linaro.org, jonathanh@nvidia.com, dennis@kernel.org, frederic@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, shorne@gmail.com, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, alexander.shishkin@linux.intel.com, lpieralisi@kernel.org, atishp@atishpatra.org, linux@rasmusvillemoes.dk, kasan-dev@googlegroups.com, festevam@gmail.com, boris.ostrovsky@oracle.com, khilman@k
 ernel.org, linux-csky@vger.kernel.org, pv-drivers@vmware.com, linux-snps-arc@lists.infradead.org, mgorman@suse.de, jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, linux-clk@vger.kernel.org, rostedt@goodmis.org, ink@jurassic.park.msu.ru, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, konrad.dybcio@linaro.org, ryabinin.a.a@gmail.com, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, tony@atomide.com, amakhalov@vmware.com, linux-mm@kvack.org, glider@google.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, mhiramat@kernel.org, aou@eecs.berkeley.edu, paulmck@kernel.org, hca@linux.ibm.com, richard.henderson@linaro.org, stefan.kristiansson@saunalahti.fi, ope
 nrisc@lists.librecores.org, acme@kernel.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, dvyukov@google.com, jgross@suse.com, monstr@monstr.eu, andersson@kernel.org, linux-mips@vger.kernel.org, krzysztof.kozlowski@linaro.org, palmer@dabbelt.com, anup@brainfault.org, bp@alien8.de, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org, deller@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 16, 2023 at 04:59:04PM +0000, Mark Rutland wrote:

> I'm sorry to have to bear some bad news on that front. :(

Moo, something had to give..


> IIUC what's happenign here is the PSCI cpuidle driver has entered idle and RCU
> is no longer watching when arm64's cpu_suspend() manipulates DAIF. Our
> local_daif_*() helpers poke lockdep and tracing, hence the call to
> trace_hardirqs_off() and the RCU usage.

Right, strictly speaking not needed at this point, IRQs should have been
traced off a long time ago.

> I think we need RCU to be watching all the way down to cpu_suspend(), and it's
> cpu_suspend() that should actually enter/exit idle context. That and we need to
> make cpu_suspend() and the low-level PSCI invocation noinstr.
> 
> I'm not sure whether 32-bit will have a similar issue or not.

I'm not seeing 32bit or Risc-V have similar issues here, but who knows,
maybe I missed somsething.

In any case, the below ought to cure the ARM64 case and remove that last
known RCU_NONIDLE() user as a bonus.

---
diff --git a/arch/arm64/kernel/cpuidle.c b/arch/arm64/kernel/cpuidle.c
index 41974a1a229a..42e19fff40ee 100644
--- a/arch/arm64/kernel/cpuidle.c
+++ b/arch/arm64/kernel/cpuidle.c
@@ -67,10 +67,10 @@ __cpuidle int acpi_processor_ffh_lpi_enter(struct acpi_lpi_state *lpi)
 	u32 state = lpi->address;
 
 	if (ARM64_LPI_IS_RETENTION_STATE(lpi->arch_flags))
-		return CPU_PM_CPU_IDLE_ENTER_RETENTION_PARAM(psci_cpu_suspend_enter,
+		return CPU_PM_CPU_IDLE_ENTER_RETENTION_PARAM_RCU(psci_cpu_suspend_enter,
 						lpi->index, state);
 	else
-		return CPU_PM_CPU_IDLE_ENTER_PARAM(psci_cpu_suspend_enter,
+		return CPU_PM_CPU_IDLE_ENTER_PARAM_RCU(psci_cpu_suspend_enter,
 					     lpi->index, state);
 }
 #endif
diff --git a/arch/arm64/kernel/suspend.c b/arch/arm64/kernel/suspend.c
index e7163f31f716..0fbdf5fe64d8 100644
--- a/arch/arm64/kernel/suspend.c
+++ b/arch/arm64/kernel/suspend.c
@@ -4,6 +4,7 @@
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/pgtable.h>
+#include <linux/cpuidle.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
@@ -104,6 +105,10 @@ int cpu_suspend(unsigned long arg, int (*fn)(unsigned long))
 	 * From this point debug exceptions are disabled to prevent
 	 * updates to mdscr register (saved and restored along with
 	 * general purpose registers) from kernel debuggers.
+	 *
+	 * Strictly speaking the trace_hardirqs_off() here is superfluous,
+	 * hardirqs should be firmly off by now. This really ought to use
+	 * something like raw_local_daif_save().
 	 */
 	flags = local_daif_save();
 
@@ -120,6 +125,8 @@ int cpu_suspend(unsigned long arg, int (*fn)(unsigned long))
 	 */
 	arm_cpuidle_save_irq_context(&context);
 
+	ct_cpuidle_enter();
+
 	if (__cpu_suspend_enter(&state)) {
 		/* Call the suspend finisher */
 		ret = fn(arg);
@@ -133,8 +140,11 @@ int cpu_suspend(unsigned long arg, int (*fn)(unsigned long))
 		 */
 		if (!ret)
 			ret = -EOPNOTSUPP;
+
+		ct_cpuidle_exit();
 	} else {
-		RCU_NONIDLE(__cpu_suspend_exit());
+		ct_cpuidle_exit();
+		__cpu_suspend_exit();
 	}
 
 	arm_cpuidle_restore_irq_context(&context);
diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index 4fc4e0381944..312a34ef28dc 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -69,16 +69,12 @@ static __cpuidle int __psci_enter_domain_idle_state(struct cpuidle_device *dev,
 	else
 		pm_runtime_put_sync_suspend(pd_dev);
 
-	ct_cpuidle_enter();
-
 	state = psci_get_domain_state();
 	if (!state)
 		state = states[idx];
 
 	ret = psci_cpu_suspend_enter(state) ? -1 : idx;
 
-	ct_cpuidle_exit();
-
 	if (s2idle)
 		dev_pm_genpd_resume(pd_dev);
 	else
@@ -192,7 +188,7 @@ static __cpuidle int psci_enter_idle_state(struct cpuidle_device *dev,
 {
 	u32 *state = __this_cpu_read(psci_cpuidle_data.psci_states);
 
-	return CPU_PM_CPU_IDLE_ENTER_PARAM(psci_cpu_suspend_enter, idx, state[idx]);
+	return CPU_PM_CPU_IDLE_ENTER_PARAM_RCU(psci_cpu_suspend_enter, idx, state[idx]);
 }
 
 static const struct of_device_id psci_idle_state_match[] = {
diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index e7bcfca4159f..f3a044fa4652 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -462,11 +462,22 @@ int psci_cpu_suspend_enter(u32 state)
 	if (!psci_power_state_loses_context(state)) {
 		struct arm_cpuidle_irq_context context;
 
+		ct_cpuidle_enter();
 		arm_cpuidle_save_irq_context(&context);
 		ret = psci_ops.cpu_suspend(state, 0);
 		arm_cpuidle_restore_irq_context(&context);
+		ct_cpuidle_exit();
 	} else {
+		/*
+		 * ARM64 cpu_suspend() wants to do ct_cpuidle_*() itself.
+		 */
+		if (!IS_ENABLED(CONFIG_ARM64))
+			ct_cpuidle_enter();
+
 		ret = cpu_suspend(state, psci_suspend_finisher);
+
+		if (!IS_ENABLED(CONFIG_ARM64))
+			ct_cpuidle_exit();
 	}
 
 	return ret;
diff --git a/include/linux/cpuidle.h b/include/linux/cpuidle.h
index 630c879143c7..3183aeb7f5b4 100644
--- a/include/linux/cpuidle.h
+++ b/include/linux/cpuidle.h
@@ -307,7 +307,7 @@ extern s64 cpuidle_governor_latency_req(unsigned int cpu);
 #define __CPU_PM_CPU_IDLE_ENTER(low_level_idle_enter,			\
 				idx,					\
 				state,					\
-				is_retention)				\
+				is_retention, is_rcu)			\
 ({									\
 	int __ret = 0;							\
 									\
@@ -319,9 +319,11 @@ extern s64 cpuidle_governor_latency_req(unsigned int cpu);
 	if (!is_retention)						\
 		__ret =  cpu_pm_enter();				\
 	if (!__ret) {							\
-		ct_cpuidle_enter();					\
+		if (!is_rcu)						\
+			ct_cpuidle_enter();				\
 		__ret = low_level_idle_enter(state);			\
-		ct_cpuidle_exit();					\
+		if (!is_rcu)						\
+			ct_cpuidle_exit();				\
 		if (!is_retention)					\
 			cpu_pm_exit();					\
 	}								\
@@ -330,15 +332,21 @@ extern s64 cpuidle_governor_latency_req(unsigned int cpu);
 })
 
 #define CPU_PM_CPU_IDLE_ENTER(low_level_idle_enter, idx)	\
-	__CPU_PM_CPU_IDLE_ENTER(low_level_idle_enter, idx, idx, 0)
+	__CPU_PM_CPU_IDLE_ENTER(low_level_idle_enter, idx, idx, 0, 0)
 
 #define CPU_PM_CPU_IDLE_ENTER_RETENTION(low_level_idle_enter, idx)	\
-	__CPU_PM_CPU_IDLE_ENTER(low_level_idle_enter, idx, idx, 1)
+	__CPU_PM_CPU_IDLE_ENTER(low_level_idle_enter, idx, idx, 1, 0)
 
 #define CPU_PM_CPU_IDLE_ENTER_PARAM(low_level_idle_enter, idx, state)	\
-	__CPU_PM_CPU_IDLE_ENTER(low_level_idle_enter, idx, state, 0)
+	__CPU_PM_CPU_IDLE_ENTER(low_level_idle_enter, idx, state, 0, 0)
+
+#define CPU_PM_CPU_IDLE_ENTER_PARAM_RCU(low_level_idle_enter, idx, state)	\
+	__CPU_PM_CPU_IDLE_ENTER(low_level_idle_enter, idx, state, 0, 1)
 
 #define CPU_PM_CPU_IDLE_ENTER_RETENTION_PARAM(low_level_idle_enter, idx, state)	\
-	__CPU_PM_CPU_IDLE_ENTER(low_level_idle_enter, idx, state, 1)
+	__CPU_PM_CPU_IDLE_ENTER(low_level_idle_enter, idx, state, 1, 0)
+
+#define CPU_PM_CPU_IDLE_ENTER_RETENTION_PARAM_RCU(low_level_idle_enter, idx, state)	\
+	__CPU_PM_CPU_IDLE_ENTER(low_level_idle_enter, idx, state, 1, 1)
 
 #endif /* _LINUX_CPUIDLE_H */
