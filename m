Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29202668528
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 22:15:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtHPy6qWCz3fmB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 08:15:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ATlfmILW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ATlfmILW;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtFj7170tz3cBX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 06:58:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=53PdPXBrlefs7aSWYtbVMctVqERBXlbNfkzlUyuHUdw=; b=ATlfmILWtdBMS162SLdQ7satXH
	lRrHA+Oo8xPovKk8FQq7RK98sDcnma5GRSfOFtLwNMoVkAXDXisud5eoVVLDZihpqE49vRJxWIbw2
	/Y9OujIMxZk1pbjWaqUFjWo75kJhYQD0AKKQKJ+8CiSaiG3IgyCVvD8TMNqCScPpUugqNp41+I7do
	5xU2L9cP7LTkQIolwptF5b7/KAQ9UdyvdXN5gS5y15We2Sa4zjrnXtrvDhbcZWdaP3QN6BMMn3InU
	Lq/+IhZFycZWB1LH1o2Fy8Qq8PGKdb6bDkxa8FbpQ30yPWc9p7g6EIAFIzA6F77JVZkL+nzT6pZrb
	3DJjl/xg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG3hu-005P7G-BC; Thu, 12 Jan 2023 19:57:50 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 41FAD303481;
	Thu, 12 Jan 2023 20:57:14 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 767D32CD066F4; Thu, 12 Jan 2023 20:57:08 +0100 (CET)
Message-ID: <20230112195542.335211484@infradead.org>
User-Agent: quilt/0.66
Date: Thu, 12 Jan 2023 20:44:03 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Subject: [PATCH v3 49/51] cpuidle,arch: Mark all regular cpuidle_state::enter methods __cpuidle
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

For all cpuidle drivers that do not use CPUIDLE_FLAG_RCU_IDLE (iow,
the simple ones) make sure all the functions are marked __cpuidle.

( due to lack of noinstr validation on these platforms it is entirely
  possible this isn't complete )

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/arm/kernel/cpuidle.c           |    4 ++--
 arch/arm/mach-davinci/cpuidle.c     |    4 ++--
 arch/arm/mach-imx/cpuidle-imx5.c    |    4 ++--
 arch/arm/mach-imx/cpuidle-imx6sl.c  |    4 ++--
 arch/arm/mach-imx/cpuidle-imx7ulp.c |    4 ++--
 arch/arm/mach-s3c/cpuidle-s3c64xx.c |    5 ++---
 arch/mips/kernel/idle.c             |    6 +++---
 7 files changed, 15 insertions(+), 16 deletions(-)

--- a/arch/arm/kernel/cpuidle.c
+++ b/arch/arm/kernel/cpuidle.c
@@ -26,8 +26,8 @@ static struct cpuidle_ops cpuidle_ops[NR
  *
  * Returns the index passed as parameter
  */
-int arm_cpuidle_simple_enter(struct cpuidle_device *dev,
-		struct cpuidle_driver *drv, int index)
+__cpuidle int arm_cpuidle_simple_enter(struct cpuidle_device *dev, struct
+				       cpuidle_driver *drv, int index)
 {
 	cpu_do_idle();
 
--- a/arch/arm/mach-davinci/cpuidle.c
+++ b/arch/arm/mach-davinci/cpuidle.c
@@ -44,8 +44,8 @@ static void davinci_save_ddr_power(int e
 }
 
 /* Actual code that puts the SoC in different idle states */
-static int davinci_enter_idle(struct cpuidle_device *dev,
-			      struct cpuidle_driver *drv, int index)
+static __cpuidle int davinci_enter_idle(struct cpuidle_device *dev,
+					struct cpuidle_driver *drv, int index)
 {
 	davinci_save_ddr_power(1, ddr2_pdown);
 	cpu_do_idle();
--- a/arch/arm/mach-imx/cpuidle-imx5.c
+++ b/arch/arm/mach-imx/cpuidle-imx5.c
@@ -8,8 +8,8 @@
 #include <asm/system_misc.h>
 #include "cpuidle.h"
 
-static int imx5_cpuidle_enter(struct cpuidle_device *dev,
-			      struct cpuidle_driver *drv, int index)
+static __cpuidle int imx5_cpuidle_enter(struct cpuidle_device *dev,
+					struct cpuidle_driver *drv, int index)
 {
 	arm_pm_idle();
 	return index;
--- a/arch/arm/mach-imx/cpuidle-imx6sl.c
+++ b/arch/arm/mach-imx/cpuidle-imx6sl.c
@@ -11,8 +11,8 @@
 #include "common.h"
 #include "cpuidle.h"
 
-static int imx6sl_enter_wait(struct cpuidle_device *dev,
-			    struct cpuidle_driver *drv, int index)
+static __cpuidle int imx6sl_enter_wait(struct cpuidle_device *dev,
+				       struct cpuidle_driver *drv, int index)
 {
 	imx6_set_lpm(WAIT_UNCLOCKED);
 	/*
--- a/arch/arm/mach-imx/cpuidle-imx7ulp.c
+++ b/arch/arm/mach-imx/cpuidle-imx7ulp.c
@@ -12,8 +12,8 @@
 #include "common.h"
 #include "cpuidle.h"
 
-static int imx7ulp_enter_wait(struct cpuidle_device *dev,
-			    struct cpuidle_driver *drv, int index)
+static __cpuidle int imx7ulp_enter_wait(struct cpuidle_device *dev,
+					struct cpuidle_driver *drv, int index)
 {
 	if (index == 1)
 		imx7ulp_set_lpm(ULP_PM_WAIT);
--- a/arch/arm/mach-s3c/cpuidle-s3c64xx.c
+++ b/arch/arm/mach-s3c/cpuidle-s3c64xx.c
@@ -19,9 +19,8 @@
 #include "regs-sys-s3c64xx.h"
 #include "regs-syscon-power-s3c64xx.h"
 
-static int s3c64xx_enter_idle(struct cpuidle_device *dev,
-			      struct cpuidle_driver *drv,
-			      int index)
+static __cpuidle int s3c64xx_enter_idle(struct cpuidle_device *dev,
+					struct cpuidle_driver *drv, int index)
 {
 	unsigned long tmp;
 
--- a/arch/mips/kernel/idle.c
+++ b/arch/mips/kernel/idle.c
@@ -241,7 +241,7 @@ void __init check_wait(void)
 	}
 }
 
-void arch_cpu_idle(void)
+__cpuidle void arch_cpu_idle(void)
 {
 	if (cpu_wait)
 		cpu_wait();
@@ -249,8 +249,8 @@ void arch_cpu_idle(void)
 
 #ifdef CONFIG_CPU_IDLE
 
-int mips_cpuidle_wait_enter(struct cpuidle_device *dev,
-			    struct cpuidle_driver *drv, int index)
+__cpuidle int mips_cpuidle_wait_enter(struct cpuidle_device *dev,
+				      struct cpuidle_driver *drv, int index)
 {
 	arch_cpu_idle();
 	return index;


