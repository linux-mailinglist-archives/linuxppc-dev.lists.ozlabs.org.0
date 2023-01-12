Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4AB6685B5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 22:44:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtJ356pRwz3gK5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 08:44:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=FKLIwXsL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=FKLIwXsL;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtFjs3ccdz3cKM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 06:58:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=NQmAgIg3861PdWRPD/+8zQmqygF5xIi/7qaj1X27QYY=; b=FKLIwXsLqSMTkfdrjYpRPs50iC
	/dZ8/rA7866IY1bP7MOMwGhQbwW0iJuXrxREmjWWzVcbzOSaZlDGTrUePB2nwarC2Yh1+X6s4N3V9
	6cu76+LFHrZw0YNXmRxk7duxL9iqjz4iP0/30O/+/kXmWBYebdlus1yGQHEgBjwu8/3IhcMSjrE1/
	5igyOlZ7sKcztcJOY8on0ND65FJOhkbkvb0J6fFhWMzAqiflihKu/CriWYb93+MxlnQrAbdaq6Dkq
	GjWpP25XbP5Xvw0SdnOMreWPCRBsKKxhe+LwtJ+c/LTLhtbM/XP+ep478hFz3O2SEuR/27ZTMra+B
	xSlHMQYQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pG3hD-0045oH-1K;
	Thu, 12 Jan 2023 19:57:08 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 23977303405;
	Thu, 12 Jan 2023 20:57:13 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id BF3F52CCF1F5E; Thu, 12 Jan 2023 20:57:07 +0100 (CET)
Message-ID: <20230112195540.068981667@infradead.org>
User-Agent: quilt/0.66
Date: Thu, 12 Jan 2023 20:43:26 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Subject: [PATCH v3 12/51] cpuidle,dt: Push RCU-idle into driver
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

Doing RCU-idle outside the driver, only to then temporarily enable it
again before going idle is daft.

Notably: this converts all dt_init_idle_driver() and
__CPU_PM_CPU_IDLE_ENTER() users for they are inextrably intertwined.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Acked-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Tony Lindgren <tony@atomide.com>
Tested-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/acpi/processor_idle.c        |    2 ++
 drivers/cpuidle/cpuidle-arm.c        |    1 +
 drivers/cpuidle/cpuidle-big_little.c |    8 ++++++--
 drivers/cpuidle/cpuidle-psci.c       |    1 +
 drivers/cpuidle/cpuidle-qcom-spm.c   |    1 +
 drivers/cpuidle/cpuidle-riscv-sbi.c  |    1 +
 drivers/cpuidle/dt_idle_states.c     |    2 +-
 include/linux/cpuidle.h              |    2 ++
 8 files changed, 15 insertions(+), 3 deletions(-)

--- a/drivers/acpi/processor_idle.c
+++ b/drivers/acpi/processor_idle.c
@@ -1219,6 +1219,8 @@ static int acpi_processor_setup_lpi_stat
 		state->target_residency = lpi->min_residency;
 		if (lpi->arch_flags)
 			state->flags |= CPUIDLE_FLAG_TIMER_STOP;
+		if (i != 0 && lpi->entry_method == ACPI_CSTATE_FFH)
+			state->flags |= CPUIDLE_FLAG_RCU_IDLE;
 		state->enter = acpi_idle_lpi_enter;
 		drv->safe_state_index = i;
 	}
--- a/drivers/cpuidle/cpuidle-big_little.c
+++ b/drivers/cpuidle/cpuidle-big_little.c
@@ -64,7 +64,8 @@ static struct cpuidle_driver bl_idle_lit
 		.enter			= bl_enter_powerdown,
 		.exit_latency		= 700,
 		.target_residency	= 2500,
-		.flags			= CPUIDLE_FLAG_TIMER_STOP,
+		.flags			= CPUIDLE_FLAG_TIMER_STOP |
+					  CPUIDLE_FLAG_RCU_IDLE,
 		.name			= "C1",
 		.desc			= "ARM little-cluster power down",
 	},
@@ -85,7 +86,8 @@ static struct cpuidle_driver bl_idle_big
 		.enter			= bl_enter_powerdown,
 		.exit_latency		= 500,
 		.target_residency	= 2000,
-		.flags			= CPUIDLE_FLAG_TIMER_STOP,
+		.flags			= CPUIDLE_FLAG_TIMER_STOP |
+					  CPUIDLE_FLAG_RCU_IDLE,
 		.name			= "C1",
 		.desc			= "ARM big-cluster power down",
 	},
@@ -124,11 +126,13 @@ static int bl_enter_powerdown(struct cpu
 				struct cpuidle_driver *drv, int idx)
 {
 	cpu_pm_enter();
+	ct_idle_enter();
 
 	cpu_suspend(0, bl_powerdown_finisher);
 
 	/* signals the MCPM core that CPU is out of low power state */
 	mcpm_cpu_powered_up();
+	ct_idle_exit();
 
 	cpu_pm_exit();
 
--- a/drivers/cpuidle/dt_idle_states.c
+++ b/drivers/cpuidle/dt_idle_states.c
@@ -77,7 +77,7 @@ static int init_state_node(struct cpuidl
 	if (err)
 		desc = state_node->name;
 
-	idle_state->flags = 0;
+	idle_state->flags = CPUIDLE_FLAG_RCU_IDLE;
 	if (of_property_read_bool(state_node, "local-timer-stop"))
 		idle_state->flags |= CPUIDLE_FLAG_TIMER_STOP;
 	/*
--- a/include/linux/cpuidle.h
+++ b/include/linux/cpuidle.h
@@ -289,7 +289,9 @@ extern s64 cpuidle_governor_latency_req(
 	if (!is_retention)						\
 		__ret =  cpu_pm_enter();				\
 	if (!__ret) {							\
+		ct_idle_enter();					\
 		__ret = low_level_idle_enter(state);			\
+		ct_idle_exit();						\
 		if (!is_retention)					\
 			cpu_pm_exit();					\
 	}								\


