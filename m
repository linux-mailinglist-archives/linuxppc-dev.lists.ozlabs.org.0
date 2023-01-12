Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C952966852F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 22:17:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtHSz54sDz3fhN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 08:17:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=sAS+cVfJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=sAS+cVfJ;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtFjC0Qwqz3cBX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 06:58:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=grsvYP38q4MnN8oBsFSgy8h24Veck5RfPmpq2ugRYPM=; b=sAS+cVfJZnxSjVZ+cWnQizLCZi
	uzGVUsOf3anafnENfDcz5DBxNwmF2u/05pvc6A0c+OdcaX2m7Qx3mQCWD2r8+RXAQmr6AABwQQUqG
	Xnn1+diWHWxMGA10WHWQkPrlviiLNwKR8l/igNBPuc/Urss/XPLwrgEzGEkTLbJF2i3zM2wEUdQId
	iXvs8/Thb5QmoGtDr5BpPsofdym80GCpPly/+P1kmFfpKKXI1eKi4k9Kt5ZS1McOXBTe8WNh0qvx1
	Mira4VG3zNGY/eh9MdDKDjG1vDtIkJ7jl+e56WDxEl8scNd8fDZtJTeB77Tp7XyQzYbmD4z6YExxk
	sfEhC80A==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG3hs-005P5q-UH; Thu, 12 Jan 2023 19:57:49 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3351230347B;
	Thu, 12 Jan 2023 20:57:14 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 6E8FA2CD066EC; Thu, 12 Jan 2023 20:57:08 +0100 (CET)
Message-ID: <20230112195542.212914195@infradead.org>
User-Agent: quilt/0.66
Date: Thu, 12 Jan 2023 20:44:01 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Subject: [PATCH v3 47/51] cpuidle: Ensure ct_cpuidle_enter() is always called from noinstr/__cpuidle
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

Tracing (kprobes included) and other compiler instrumentation relies
on a normal kernel runtime. Therefore all functions that disable RCU
should be noinstr, as should all functions that are called while RCU
is disabled.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 drivers/cpuidle/cpuidle.c |   37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

--- a/drivers/cpuidle/cpuidle.c
+++ b/drivers/cpuidle/cpuidle.c
@@ -137,11 +137,13 @@ int cpuidle_find_deepest_state(struct cp
 }
 
 #ifdef CONFIG_SUSPEND
-static void enter_s2idle_proper(struct cpuidle_driver *drv,
-				struct cpuidle_device *dev, int index)
+static noinstr void enter_s2idle_proper(struct cpuidle_driver *drv,
+					 struct cpuidle_device *dev, int index)
 {
-	ktime_t time_start, time_end;
 	struct cpuidle_state *target_state = &drv->states[index];
+	ktime_t time_start, time_end;
+
+	instrumentation_begin();
 
 	time_start = ns_to_ktime(local_clock());
 
@@ -152,13 +154,18 @@ static void enter_s2idle_proper(struct c
 	 * suspended is generally unsafe.
 	 */
 	stop_critical_timings();
-	if (!(target_state->flags & CPUIDLE_FLAG_RCU_IDLE))
+	if (!(target_state->flags & CPUIDLE_FLAG_RCU_IDLE)) {
 		ct_cpuidle_enter();
+		/* Annotate away the indirect call */
+		instrumentation_begin();
+	}
 	target_state->enter_s2idle(dev, drv, index);
 	if (WARN_ON_ONCE(!irqs_disabled()))
 		raw_local_irq_disable();
-	if (!(target_state->flags & CPUIDLE_FLAG_RCU_IDLE))
+	if (!(target_state->flags & CPUIDLE_FLAG_RCU_IDLE)) {
+		instrumentation_end();
 		ct_cpuidle_exit();
+	}
 	tick_unfreeze();
 	start_critical_timings();
 
@@ -166,6 +173,7 @@ static void enter_s2idle_proper(struct c
 
 	dev->states_usage[index].s2idle_time += ktime_us_delta(time_end, time_start);
 	dev->states_usage[index].s2idle_usage++;
+	instrumentation_end();
 }
 
 /**
@@ -200,8 +208,9 @@ int cpuidle_enter_s2idle(struct cpuidle_
  * @drv: cpuidle driver for this cpu
  * @index: index into the states table in @drv of the state to enter
  */
-int cpuidle_enter_state(struct cpuidle_device *dev, struct cpuidle_driver *drv,
-			int index)
+noinstr int cpuidle_enter_state(struct cpuidle_device *dev,
+				 struct cpuidle_driver *drv,
+				 int index)
 {
 	int entered_state;
 
@@ -209,6 +218,8 @@ int cpuidle_enter_state(struct cpuidle_d
 	bool broadcast = !!(target_state->flags & CPUIDLE_FLAG_TIMER_STOP);
 	ktime_t time_start, time_end;
 
+	instrumentation_begin();
+
 	/*
 	 * Tell the time framework to switch to a broadcast timer because our
 	 * local timer will be shut down.  If a local timer is used from another
@@ -235,15 +246,21 @@ int cpuidle_enter_state(struct cpuidle_d
 	time_start = ns_to_ktime(local_clock());
 
 	stop_critical_timings();
-	if (!(target_state->flags & CPUIDLE_FLAG_RCU_IDLE))
+	if (!(target_state->flags & CPUIDLE_FLAG_RCU_IDLE)) {
 		ct_cpuidle_enter();
+		/* Annotate away the indirect call */
+		instrumentation_begin();
+	}
 
 	entered_state = target_state->enter(dev, drv, index);
+
 	if (WARN_ONCE(!irqs_disabled(), "%ps leaked IRQ state", target_state->enter))
 		raw_local_irq_disable();
 
-	if (!(target_state->flags & CPUIDLE_FLAG_RCU_IDLE))
+	if (!(target_state->flags & CPUIDLE_FLAG_RCU_IDLE)) {
+		instrumentation_end();
 		ct_cpuidle_exit();
+	}
 	start_critical_timings();
 
 	sched_clock_idle_wakeup_event();
@@ -306,6 +323,8 @@ int cpuidle_enter_state(struct cpuidle_d
 		dev->states_usage[index].rejected++;
 	}
 
+	instrumentation_end();
+
 	return entered_state;
 }
 


