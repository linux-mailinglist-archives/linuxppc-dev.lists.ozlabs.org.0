Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6CB668514
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 22:10:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtHHx27XCz3fKx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 08:10:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=jacsBVte;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=jacsBVte;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtFj23pWWz3cCD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 06:58:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=REiFsq8Cu55BI5UIL8KISCBnMH5PlDDv/02JyaHCfws=; b=jacsBVtew76U0uVdyT/s4IP8jr
	GtFJuqoX/fTEhe6iRFRexCm1jXkTxzLVYW/jcOvJ0fcg1GH3zJ0VOMMq38KNB3hYcQO6ydqU6Pi8T
	aQIWbAT4z6h98bNMpozlieRMTrJMS4S6RqhrEff1G1lvb6/Qj0ZJ2PZTCoqJhHzSexCsbfft31Kgl
	nDOmzt618M5lwlBtRFllX/uUp9iZXSp1lY72+9iiVyi9YVVjwG/UBK+Nt2D8rJ5EvFjqmWDoGKlr0
	4J2aw5Y8AHSjp5K9dnsERD/LPM5LxvNw6Y1oo53MnwCdNqbBPY8YqRl2QQ8k5x/NM/tBOT4vkOt1U
	dTYOfX1g==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG3hX-005OcO-JK; Thu, 12 Jan 2023 19:57:27 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 016403033E9;
	Thu, 12 Jan 2023 20:57:13 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id A81F92CCF1F5A; Thu, 12 Jan 2023 20:57:07 +0100 (CET)
Message-ID: <20230112195539.760296658@infradead.org>
User-Agent: quilt/0.66
Date: Thu, 12 Jan 2023 20:43:21 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Subject: [PATCH v3 07/51] cpuidle,psci: Push RCU-idle into driver
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
Cc: juri.lelli@redhat.com, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, rafael@kernel.org, catalin.marinas@arm.com, linus.walleij@linaro.org, nsekhar@ti.com, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, srivatsa@csail.mit.edu, linux-arch@vger.kernel.org, linux-samsung-soc@vger.kernel.org, vincent.guittot@linaro.org, chenhuacai@kernel.org, linux-acpi@vger.kernel.org, agross@kernel.org, geert@linux-m68k.org, linux-imx@nxp.com, vgupta@kernel.org, mattst88@gmail.com, borntraeger@linux.ibm.com, mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, npiggin@gmail.com, tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, andreyknvl@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org, tj@kernel.org, Andrew Morton <akpm@linu
 x-foundation.org>, linux-trace-kernel@vger.kernel.org, mark.rutland@arm.com, linux-ia64@vger.kernel.org, alim.akhtar@samsung.com, Kajetan Puchalski <kajetan.puchalski@arm.com>, dave.hansen@linux.intel.com, virtualization@lists.linux-foundation.org, James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, will@kernel.org, brgl@bgdev.pl, daniel.lezcano@linaro.org, jonathanh@nvidia.com, dennis@kernel.org, frederic@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, shorne@gmail.com, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, Ulf Hansson <ulf.hansson@linaro.org>, alexander.shishkin@linux.intel.com, 
 lpieralisi@kernel.org, atishp@atishpatra.org, linux@rasmusvillemoes.dk, kasan-dev@googlegroups.com, festevam@gmail.com, boris.ostrovsky@oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org, pv-drivers@vmware.com, linux-snps-arc@lists.infradead.org, mgorman@suse.de, jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, linux-clk@vger.kernel.org, rostedt@goodmis.org, ink@jurassic.park.msu.ru, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, konrad.dybcio@linaro.org, ryabinin.a.a@gmail.com, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, tony@atomide.com, amakhalov@vmware.com, linux-mm@kvack.org, glider@google.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat
 .com, mhiramat@kernel.org, aou@eecs.berkeley.edu, paulmck@kernel.org, hca@linux.ibm.com, richard.henderson@linaro.org, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, acme@kernel.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, dvyukov@google.com, jgross@suse.com, monstr@monstr.eu, andersson@kernel.org, linux-mips@vger.kernel.org, krzysztof.kozlowski@linaro.org, palmer@dabbelt.com, anup@brainfault.org, bp@alien8.de, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org, deller@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Doing RCU-idle outside the driver, only to then temporarily enable it
again, at least twice, before going idle is daft.

Notably once implicitly through the cpu_pm_*() calls and once
explicitly doing ct_irq_*_irqon().

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
Reviewed-by: Guo Ren <guoren@kernel.org>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Tested-by: Kajetan Puchalski <kajetan.puchalski@arm.com>
Tested-by: Tony Lindgren <tony@atomide.com>
Tested-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/cpuidle/cpuidle-psci.c |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -69,12 +69,12 @@ static int __psci_enter_domain_idle_stat
 		return -1;
 
 	/* Do runtime PM to manage a hierarchical CPU toplogy. */
-	ct_irq_enter_irqson();
 	if (s2idle)
 		dev_pm_genpd_suspend(pd_dev);
 	else
 		pm_runtime_put_sync_suspend(pd_dev);
-	ct_irq_exit_irqson();
+
+	ct_idle_enter();
 
 	state = psci_get_domain_state();
 	if (!state)
@@ -82,12 +82,12 @@ static int __psci_enter_domain_idle_stat
 
 	ret = psci_cpu_suspend_enter(state) ? -1 : idx;
 
-	ct_irq_enter_irqson();
+	ct_idle_exit();
+
 	if (s2idle)
 		dev_pm_genpd_resume(pd_dev);
 	else
 		pm_runtime_get_sync(pd_dev);
-	ct_irq_exit_irqson();
 
 	cpu_pm_exit();
 
@@ -240,6 +240,7 @@ static int psci_dt_cpu_init_topology(str
 	 * of a shared state for the domain, assumes the domain states are all
 	 * deeper states.
 	 */
+	drv->states[state_count - 1].flags |= CPUIDLE_FLAG_RCU_IDLE;
 	drv->states[state_count - 1].enter = psci_enter_domain_idle_state;
 	drv->states[state_count - 1].enter_s2idle = psci_enter_s2idle_domain_idle_state;
 	psci_cpuidle_use_cpuhp = true;


