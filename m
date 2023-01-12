Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA70668543
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 22:24:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtHd32ncXz3fL9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 08:24:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=CDjE30SH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtFjF1Yg7z3c90
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 06:58:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=nPi2VaSnukDemWiv4/ra3+urtWJi7QCVP16nY4QbOXo=; b=CDjE30SHxh/MHeshq7LcxCyRnB
	pAloIyE5xsjlMTbeKB6u/sxCgYnoL1p+OYgspBL5pFU5mK2BmQ486B/NcumbPG/RDRvRocqku+/+w
	9uMl5zfVPVAo7sN1COzJFktYLeZ5aZ36fFLW3kVxdMQ9rGWvI/TrmA4iM2REwC6E89NJG4BtwXdYh
	Cf3lKWPZyztC126H0PkFylComcCFMahDJ0ywksznJkEyMohG+lfLKIpWv0CU/+S3YKvbiUVd/D8wg
	UbT7ahOD8OTpISXQDxoK1saIUM6+KxGwdAqH9AqOxzOt3IA8iSNroHtgP/sEIC13R1sHdOMtNIcT9
	tVhxTauA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pG3hG-0045oz-1Q;
	Thu, 12 Jan 2023 19:57:12 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8DF5D303438;
	Thu, 12 Jan 2023 20:57:13 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 156E92CCF62AD; Thu, 12 Jan 2023 20:57:08 +0100 (CET)
Message-ID: <20230112195540.927904612@infradead.org>
User-Agent: quilt/0.66
Date: Thu, 12 Jan 2023 20:43:40 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Subject: [PATCH v3 26/51] time/tick-broadcast: Remove RCU_NONIDLE usage
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
 x-foundation.org>, linux-trace-kernel@vger.kernel.org, mark.rutland@arm.com, linux-ia64@vger.kernel.org, alim.akhtar@samsung.com, dave.hansen@linux.intel.com, virtualization@lists.linux-foundation.org, James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, will@kernel.org, brgl@bgdev.pl, daniel.lezcano@linaro.org, jonathanh@nvidia.com, dennis@kernel.org, frederic@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, shorne@gmail.com, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, Ulf Hansson <ulf.hansson@linaro.org>, alexander.shishkin@linux.intel.com, lpieralisi@kernel.org, atishp@atishpatra.org, l
 inux@rasmusvillemoes.dk, kasan-dev@googlegroups.com, festevam@gmail.com, boris.ostrovsky@oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org, pv-drivers@vmware.com, linux-snps-arc@lists.infradead.org, mgorman@suse.de, jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, linux-clk@vger.kernel.org, rostedt@goodmis.org, ink@jurassic.park.msu.ru, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, konrad.dybcio@linaro.org, ryabinin.a.a@gmail.com, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, tony@atomide.com, amakhalov@vmware.com, linux-mm@kvack.org, glider@google.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, mhiramat@kernel.org, aou@eecs.berkeley.ed
 u, paulmck@kernel.org, hca@linux.ibm.com, richard.henderson@linaro.org, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, acme@kernel.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, dvyukov@google.com, jgross@suse.com, monstr@monstr.eu, andersson@kernel.org, linux-mips@vger.kernel.org, krzysztof.kozlowski@linaro.org, palmer@dabbelt.com, anup@brainfault.org, bp@alien8.de, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org, deller@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No callers left that have already disabled RCU.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Acked-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Tony Lindgren <tony@atomide.com>
Tested-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 kernel/time/tick-broadcast-hrtimer.c |   29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

--- a/kernel/time/tick-broadcast-hrtimer.c
+++ b/kernel/time/tick-broadcast-hrtimer.c
@@ -56,25 +56,20 @@ static int bc_set_next(ktime_t expires,
 	 * hrtimer callback function is currently running, then
 	 * hrtimer_start() cannot move it and the timer stays on the CPU on
 	 * which it is assigned at the moment.
+	 */
+	hrtimer_start(&bctimer, expires, HRTIMER_MODE_ABS_PINNED_HARD);
+	/*
+	 * The core tick broadcast mode expects bc->bound_on to be set
+	 * correctly to prevent a CPU which has the broadcast hrtimer
+	 * armed from going deep idle.
 	 *
-	 * As this can be called from idle code, the hrtimer_start()
-	 * invocation has to be wrapped with RCU_NONIDLE() as
-	 * hrtimer_start() can call into tracing.
+	 * As tick_broadcast_lock is held, nothing can change the cpu
+	 * base which was just established in hrtimer_start() above. So
+	 * the below access is safe even without holding the hrtimer
+	 * base lock.
 	 */
-	RCU_NONIDLE( {
-		hrtimer_start(&bctimer, expires, HRTIMER_MODE_ABS_PINNED_HARD);
-		/*
-		 * The core tick broadcast mode expects bc->bound_on to be set
-		 * correctly to prevent a CPU which has the broadcast hrtimer
-		 * armed from going deep idle.
-		 *
-		 * As tick_broadcast_lock is held, nothing can change the cpu
-		 * base which was just established in hrtimer_start() above. So
-		 * the below access is safe even without holding the hrtimer
-		 * base lock.
-		 */
-		bc->bound_on = bctimer.base->cpu_base->cpu;
-	} );
+	bc->bound_on = bctimer.base->cpu_base->cpu;
+
 	return 0;
 }
 


