Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4FC54D789
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 03:55:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNlc238yvz3000
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 11:54:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=OliYmJSi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=OliYmJSi;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LN2k34Dsjz3g6r
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 08:12:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ieYeEcrodnP9d8uMI6KazQ9YDccjAyjy/+PGF5Ov/Sc=; b=OliYmJSibamFQ0oRl2XkG2+oLG
	eUVxb3PF2WQS3d9O+63gY5P/Th5g3W0k/p07zjSFtfSstgpe5sY3UKPuYKK8U3d61xav16z47xA5h
	tkNVX1vBm9t+GM0XpJtkUArdAr+6C0D6QPwa3LyJL5W3wePUH4pa4u9UPo+aiZ0VxHDbCXoe4qfJ4
	E8Y2M6s9A8SopwISJUuliIWAcL2CXospZ4jCBSi0ba1Zs/HL4wyLHhGRHBuILPFIW3paG1eAzYhHw
	AXd8m8CPomKQfchnKb7uAGftq4wK1SsdTGzKQsjqacjeCk0RsPVRrEJUUy3okfnQk1gM5l81agP/h
	arzWLEHQ==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=worktop.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Elc-000Y9d-O5; Tue, 14 Jun 2022 22:12:08 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id ED8F2981518; Wed, 15 Jun 2022 00:12:06 +0200 (CEST)
Date: Wed, 15 Jun 2022 00:12:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 34.5/36] cpuidle,omap4: Push RCU-idle into
 omap4_enter_lowpower()
Message-ID: <YqkHto+zgAPs4kQI@worktop.programming.kicks-ass.net>
References: <20220608142723.103523089@infradead.org>
 <20220608144518.073801916@infradead.org>
 <Yqcv6crSNKuSWoTu@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yqcv6crSNKuSWoTu@atomide.com>
X-Mailman-Approved-At: Thu, 16 Jun 2022 11:54:30 +1000
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
 n@lists.linux-foundation.org, James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, quic_neeraju@quicinc.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, festevam@gmail.com, deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com, mathieu.desnoyers@efficios.com, frederic@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, shorne@gmail.com, linux-arm-kernel@lists.infradead.org, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, alexander.shishkin@linux.intel.com, lpieralisi@kernel.org, linux@rasmusvillemoes.dk, joel@joelfernandes.org, will@kernel.org, boris.ostrovsky@oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org, linux-snps-arc@lists.infradead.org, mgorman@suse.de,
  jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@a

rndb.de>, ulli.kroll@googlemail.com, vgupta@kernel.org, linux-clk@vger.kernel.org, josh@joshtriplett.org, rostedt@goodmis.org, rcu@vger.kernel.org, bp@alien8.de, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, pv-drivers@vmware.com, amakhalov@vmware.com, bjorn.andersson@linaro.org, hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, aou@eecs.berkeley.edu, paulmck@kernel.org, hca@linux.ibm.com, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, jgross@suse.com, monstr@monstr.eu, linux-mips@vger.kernel.org, palmer@dabbelt.com, anup@bra
 infault.org, ink@jurassic.park.msu.ru, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 13, 2022 at 03:39:05PM +0300, Tony Lindgren wrote:
> OMAP4 uses full SoC suspend modes as idle states, as such it needs the
> whole power-domain and clock-domain code from the idle path.
> 
> All that code is not suitable to run with RCU disabled, as such push
> RCU-idle deeper still.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
> 
> Peter here's one more for your series, looks like this is needed to avoid
> warnings similar to what you did for omap3.

Thanks Tony!

I've had a brief look at omap2_pm_idle() and do I understand it right
that something like the below patch would reduce it to a simple 'WFI'?

What do I do with the rest of that code, because I don't think this
thing has a cpuidle driver to take over, effectively turning it into
dead code.

--- a/arch/arm/mach-omap2/pm24xx.c
+++ b/arch/arm/mach-omap2/pm24xx.c
@@ -126,10 +126,20 @@ static int omap2_allow_mpu_retention(voi
 	return 1;
 }
 
-static void omap2_enter_mpu_retention(void)
+static void omap2_do_wfi(void)
 {
 	const int zero = 0;
 
+	/* WFI */
+	asm("mcr p15, 0, %0, c7, c0, 4" : : "r" (zero) : "memory", "cc");
+}
+
+#if 0
+/*
+ * possible cpuidle implementation between WFI and full_retention above
+ */
+static void omap2_enter_mpu_retention(void)
+{
 	/* The peripherals seem not to be able to wake up the MPU when
 	 * it is in retention mode. */
 	if (omap2_allow_mpu_retention()) {
@@ -146,8 +157,7 @@ static void omap2_enter_mpu_retention(vo
 		pwrdm_set_next_pwrst(mpu_pwrdm, PWRDM_POWER_ON);
 	}
 
-	/* WFI */
-	asm("mcr p15, 0, %0, c7, c0, 4" : : "r" (zero) : "memory", "cc");
+	omap2_do_wfi();
 
 	pwrdm_set_next_pwrst(mpu_pwrdm, PWRDM_POWER_ON);
 }
@@ -161,6 +171,7 @@ static int omap2_can_sleep(void)
 
 	return 1;
 }
+#endif
 
 static void omap2_pm_idle(void)
 {
@@ -169,6 +180,7 @@ static void omap2_pm_idle(void)
 	if (omap_irq_pending())
 		return;
 
+#if 0
 	error = cpu_cluster_pm_enter();
 	if (error || !omap2_can_sleep()) {
 		omap2_enter_mpu_retention();
@@ -179,6 +191,9 @@ static void omap2_pm_idle(void)
 
 out_cpu_cluster_pm:
 	cpu_cluster_pm_exit();
+#else
+	omap2_do_wfi();
+#endif
 }
 
 static void __init prcm_setup_regs(void)
