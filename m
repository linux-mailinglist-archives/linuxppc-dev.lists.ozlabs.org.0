Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 379AC544074
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 02:16:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJPlx0pLVz3gpD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 10:16:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=itZGmiVK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=itZGmiVK;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJ97K2fR8z3bkJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 00:47:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=KHvAe13dC0TrHBuyrT47ebjbzLfzhz60TYCCkk8vbtw=; b=itZGmiVK2icgGpaxEUa4cF4lIi
	+0YlKT5EyDMJU/MWxEIYXD0gdpmN61uIirZw23P88WQR972g9551F5GQf2PqyIZiGqSM7Xb3E9Bfo
	5FJC2KAaPRvPAyYdtPgdvQXWbuqPmfD46eyn+WecUdijp92GxIoao/oz7pLSvWG+zLdB395Gr6udf
	SnHkd2/tnr0TU6wUvVXi0bK4I9GCbQFvJd8NnUWdzoAGBSqxHc+lDSifdza+NoDEIQlsu/cUajh/n
	135EoBmasvrh3QQ0nBdIwhHcrUsDu7hkMdqwZ9EbvT5fVJqK+jxBGdYTIkn8tf2ChYh88coEYmRqG
	IpB+K9xg==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nywwz-00ChWK-Ba; Wed, 08 Jun 2022 14:46:25 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CE1C8302E1D;
	Wed,  8 Jun 2022 16:46:22 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 6A05E20C10EA5; Wed,  8 Jun 2022 16:46:18 +0200 (CEST)
Message-ID: <20220608144516.677524509@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 08 Jun 2022 16:27:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Subject: [PATCH 12/36] cpuidle,omap2: Push RCU-idle into driver
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

Doing RCU-idle outside the driver, only to then temporarily enable it
again, some *four* times, before going idle is daft.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/arm/mach-omap2/cpuidle44xx.c |   29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

--- a/arch/arm/mach-omap2/cpuidle44xx.c
+++ b/arch/arm/mach-omap2/cpuidle44xx.c
@@ -105,7 +105,9 @@ static int omap_enter_idle_smp(struct cp
 	}
 	raw_spin_unlock_irqrestore(&mpu_lock, flag);
 
+	rcu_idle_enter();
 	omap4_enter_lowpower(dev->cpu, cx->cpu_state);
+	rcu_idle_exit();
 
 	raw_spin_lock_irqsave(&mpu_lock, flag);
 	if (cx->mpu_state_vote == num_online_cpus())
@@ -151,10 +153,10 @@ static int omap_enter_idle_coupled(struc
 				 (cx->mpu_logic_state == PWRDM_POWER_OFF);
 
 	/* Enter broadcast mode for periodic timers */
-	RCU_NONIDLE(tick_broadcast_enable());
+	tick_broadcast_enable();
 
 	/* Enter broadcast mode for one-shot timers */
-	RCU_NONIDLE(tick_broadcast_enter());
+	tick_broadcast_enter();
 
 	/*
 	 * Call idle CPU PM enter notifier chain so that
@@ -166,7 +168,7 @@ static int omap_enter_idle_coupled(struc
 
 	if (dev->cpu == 0) {
 		pwrdm_set_logic_retst(mpu_pd, cx->mpu_logic_state);
-		RCU_NONIDLE(omap_set_pwrdm_state(mpu_pd, cx->mpu_state));
+		omap_set_pwrdm_state(mpu_pd, cx->mpu_state);
 
 		/*
 		 * Call idle CPU cluster PM enter notifier chain
@@ -178,14 +180,16 @@ static int omap_enter_idle_coupled(struc
 				index = 0;
 				cx = state_ptr + index;
 				pwrdm_set_logic_retst(mpu_pd, cx->mpu_logic_state);
-				RCU_NONIDLE(omap_set_pwrdm_state(mpu_pd, cx->mpu_state));
+				omap_set_pwrdm_state(mpu_pd, cx->mpu_state);
 				mpuss_can_lose_context = 0;
 			}
 		}
 	}
 
+	rcu_idle_enter();
 	omap4_enter_lowpower(dev->cpu, cx->cpu_state);
 	cpu_done[dev->cpu] = true;
+	rcu_idle_exit();
 
 	/* Wakeup CPU1 only if it is not offlined */
 	if (dev->cpu == 0 && cpumask_test_cpu(1, cpu_online_mask)) {
@@ -194,9 +198,9 @@ static int omap_enter_idle_coupled(struc
 		    mpuss_can_lose_context)
 			gic_dist_disable();
 
-		RCU_NONIDLE(clkdm_deny_idle(cpu_clkdm[1]));
-		RCU_NONIDLE(omap_set_pwrdm_state(cpu_pd[1], PWRDM_POWER_ON));
-		RCU_NONIDLE(clkdm_allow_idle(cpu_clkdm[1]));
+		clkdm_deny_idle(cpu_clkdm[1]);
+		omap_set_pwrdm_state(cpu_pd[1], PWRDM_POWER_ON);
+		clkdm_allow_idle(cpu_clkdm[1]);
 
 		if (IS_PM44XX_ERRATUM(PM_OMAP4_ROM_SMP_BOOT_ERRATUM_GICD) &&
 		    mpuss_can_lose_context) {
@@ -222,7 +226,7 @@ static int omap_enter_idle_coupled(struc
 	cpu_pm_exit();
 
 cpu_pm_out:
-	RCU_NONIDLE(tick_broadcast_exit());
+	tick_broadcast_exit();
 
 fail:
 	cpuidle_coupled_parallel_barrier(dev, &abort_barrier);
@@ -247,7 +251,8 @@ static struct cpuidle_driver omap4_idle_
 			/* C2 - CPU0 OFF + CPU1 OFF + MPU CSWR */
 			.exit_latency = 328 + 440,
 			.target_residency = 960,
-			.flags = CPUIDLE_FLAG_COUPLED,
+			.flags = CPUIDLE_FLAG_COUPLED |
+				 CPUIDLE_FLAG_RCU_IDLE,
 			.enter = omap_enter_idle_coupled,
 			.name = "C2",
 			.desc = "CPUx OFF, MPUSS CSWR",
@@ -256,7 +261,8 @@ static struct cpuidle_driver omap4_idle_
 			/* C3 - CPU0 OFF + CPU1 OFF + MPU OSWR */
 			.exit_latency = 460 + 518,
 			.target_residency = 1100,
-			.flags = CPUIDLE_FLAG_COUPLED,
+			.flags = CPUIDLE_FLAG_COUPLED |
+				 CPUIDLE_FLAG_RCU_IDLE,
 			.enter = omap_enter_idle_coupled,
 			.name = "C3",
 			.desc = "CPUx OFF, MPUSS OSWR",
@@ -282,7 +288,8 @@ static struct cpuidle_driver omap5_idle_
 			/* C2 - CPU0 RET + CPU1 RET + MPU CSWR */
 			.exit_latency = 48 + 60,
 			.target_residency = 100,
-			.flags = CPUIDLE_FLAG_TIMER_STOP,
+			.flags = CPUIDLE_FLAG_TIMER_STOP |
+				 CPUIDLE_FLAG_RCU_IDLE,
 			.enter = omap_enter_idle_smp,
 			.name = "C2",
 			.desc = "CPUx CSWR, MPUSS CSWR",


