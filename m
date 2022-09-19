Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DDD5BD729
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 00:20:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWfHm5zz4z3gv4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 08:20:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=UWI2IQDg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=UWI2IQDg;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWLH05HFxz30JR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 20:18:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=qeP5TW9pPwNmun+WKlC/DjHHSTDp0gQF0cfrlfUPbu0=; b=UWI2IQDgtEULeeN7l/DQJxWgFu
	B37hAfK3zOtkwboGloxOBqYzSsxkUs0Fj3ZZhlKQQHtJA0o37bVRJNelEk6Iaa2KvSqBfqZs9Bz/+
	ZSW2zt2dBaytCf+iGLxrwnbDfcIcuQG98+HTlbULW7BkeSz2oUkeBn5Ufk1Ddby1IeJpYB7AwKbJ6
	XAiC6AZJ/35x+BF3A70NPMbqpF9Cqg5fW+ayrOfiBlAq5Ump2MHkiGrlKCSzoDN0+1KIV1SkxGVak
	twNSViu3rIOpAPu3t56p2QNO2OAHpsnVp50LhtKXZUpkkculCzySHsvBp49mgFetHwIrtVaoBmZCg
	ItgK4JDw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaDq5-00E2BI-Ub; Mon, 19 Sep 2022 10:17:23 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 4E25A302F45;
	Mon, 19 Sep 2022 12:16:25 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 690642BAC75A9; Mon, 19 Sep 2022 12:16:22 +0200 (CEST)
Message-ID: <20220919101522.358582588@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 19 Sep 2022 12:00:09 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Subject: [PATCH v2 30/44] cpuidle,xenpv: Make more PARAVIRT_XXL noinstr clean
References: <20220919095939.761690562@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Tue, 20 Sep 2022 07:59:18 +1000
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
Cc: juri.lelli@redhat.com, rafael@kernel.org, catalin.marinas@arm.com, linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, srivatsa@csail.mit.edu, linux-arch@vger.kernel.org, vincent.guittot@linaro.org, chenhuacai@kernel.org, linux-acpi@vger.kernel.org, agross@kernel.org, geert@linux-m68k.org, linux-imx@nxp.com, vgupta@kernel.org, mattst88@gmail.com, borntraeger@linux.ibm.com, mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, npiggin@gmail.com, tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, andreyknvl@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org, tj@kernel.org, Andrew Morton <akpm@linux-foundation.org>, mark.rutland@arm.com, linux-ia64@vger.kernel.org, dave.hansen@linux.intel.com, vir
 tualization@lists.linux-foundation.org, James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, festevam@gmail.com, deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com, dennis@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, shorne@gmail.com, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, alexander.shishkin@linux.intel.com, fweisbec@gmail.com, lpieralisi@kernel.org, atishp@atishpatra.org, linux@rasmusvillemoes.dk, kasan-dev@googlegroups.com, will@kernel.org, boris.ostrovsky@oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org, pv-drivers@vmware.com, linux-snps-arc@lists.infradea
 d.org, mgorman@suse.de, jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, linux-clk@vger.kernel.org, rostedt@goodmis.org, ink@jurassic.park.msu.ru, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, ryabinin.a.a@gmail.com, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, tony@atomide.com, amakhalov@vmware.com, konrad.dybcio@somainline.org, bjorn.andersson@linaro.org, glider@google.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, aou@eecs.berkeley.edu, hca@linux.ibm.com, richard.henderson@linaro.org, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, acme@kernel.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org,
  andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, dvyukov@google.com, jgross@suse.com, monstr@monstr.eu, linux-mips@vger.kernel.org, palmer@dabbelt.com, anup@brainfault.org, bp@alien8.de, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0xde: call to wbinvd() leaves .noinstr.text section
vmlinux.o: warning: objtool: default_idle+0x4: call to arch_safe_halt() leaves .noinstr.text section
vmlinux.o: warning: objtool: xen_safe_halt+0xa: call to HYPERVISOR_sched_op.constprop.0() leaves .noinstr.text section

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>
---
 arch/x86/include/asm/paravirt.h      |    6 ++++--
 arch/x86/include/asm/special_insns.h |    4 ++--
 arch/x86/include/asm/xen/hypercall.h |    2 +-
 arch/x86/kernel/paravirt.c           |   14 ++++++++++++--
 arch/x86/xen/enlighten_pv.c          |    2 +-
 arch/x86/xen/irq.c                   |    2 +-
 6 files changed, 21 insertions(+), 9 deletions(-)

--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -168,7 +168,7 @@ static inline void __write_cr4(unsigned
 	PVOP_VCALL1(cpu.write_cr4, x);
 }
 
-static inline void arch_safe_halt(void)
+static __always_inline void arch_safe_halt(void)
 {
 	PVOP_VCALL0(irq.safe_halt);
 }
@@ -178,7 +178,9 @@ static inline void halt(void)
 	PVOP_VCALL0(irq.halt);
 }
 
-static inline void wbinvd(void)
+extern noinstr void pv_native_wbinvd(void);
+
+static __always_inline void wbinvd(void)
 {
 	PVOP_ALT_VCALL0(cpu.wbinvd, "wbinvd", ALT_NOT(X86_FEATURE_XENPV));
 }
--- a/arch/x86/include/asm/special_insns.h
+++ b/arch/x86/include/asm/special_insns.h
@@ -115,7 +115,7 @@ static inline void wrpkru(u32 pkru)
 }
 #endif
 
-static inline void native_wbinvd(void)
+static __always_inline void native_wbinvd(void)
 {
 	asm volatile("wbinvd": : :"memory");
 }
@@ -179,7 +179,7 @@ static inline void __write_cr4(unsigned
 	native_write_cr4(x);
 }
 
-static inline void wbinvd(void)
+static __always_inline void wbinvd(void)
 {
 	native_wbinvd();
 }
--- a/arch/x86/include/asm/xen/hypercall.h
+++ b/arch/x86/include/asm/xen/hypercall.h
@@ -382,7 +382,7 @@ MULTI_stack_switch(struct multicall_entr
 }
 #endif
 
-static inline int
+static __always_inline int
 HYPERVISOR_sched_op(int cmd, void *arg)
 {
 	return _hypercall2(int, sched_op, cmd, arg);
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -233,6 +233,11 @@ static noinstr void pv_native_set_debugr
 	native_set_debugreg(regno, val);
 }
 
+noinstr void pv_native_wbinvd(void)
+{
+	native_wbinvd();
+}
+
 static noinstr void pv_native_irq_enable(void)
 {
 	native_irq_enable();
@@ -242,6 +247,11 @@ static noinstr void pv_native_irq_disabl
 {
 	native_irq_disable();
 }
+
+static noinstr void pv_native_safe_halt(void)
+{
+	native_safe_halt();
+}
 #endif
 
 enum paravirt_lazy_mode paravirt_get_lazy_mode(void)
@@ -273,7 +283,7 @@ struct paravirt_patch_template pv_ops =
 	.cpu.read_cr0		= native_read_cr0,
 	.cpu.write_cr0		= native_write_cr0,
 	.cpu.write_cr4		= native_write_cr4,
-	.cpu.wbinvd		= native_wbinvd,
+	.cpu.wbinvd		= pv_native_wbinvd,
 	.cpu.read_msr		= native_read_msr,
 	.cpu.write_msr		= native_write_msr,
 	.cpu.read_msr_safe	= native_read_msr_safe,
@@ -307,7 +317,7 @@ struct paravirt_patch_template pv_ops =
 	.irq.save_fl		= __PV_IS_CALLEE_SAVE(native_save_fl),
 	.irq.irq_disable	= __PV_IS_CALLEE_SAVE(pv_native_irq_disable),
 	.irq.irq_enable		= __PV_IS_CALLEE_SAVE(pv_native_irq_enable),
-	.irq.safe_halt		= native_safe_halt,
+	.irq.safe_halt		= pv_native_safe_halt,
 	.irq.halt		= native_halt,
 #endif /* CONFIG_PARAVIRT_XXL */
 
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1019,7 +1019,7 @@ static const typeof(pv_ops) xen_cpu_ops
 
 		.write_cr4 = xen_write_cr4,
 
-		.wbinvd = native_wbinvd,
+		.wbinvd = pv_native_wbinvd,
 
 		.read_msr = xen_read_msr,
 		.write_msr = xen_write_msr,
--- a/arch/x86/xen/irq.c
+++ b/arch/x86/xen/irq.c
@@ -24,7 +24,7 @@ noinstr void xen_force_evtchn_callback(v
 	(void)HYPERVISOR_xen_version(0, NULL);
 }
 
-static void xen_safe_halt(void)
+static noinstr void xen_safe_halt(void)
 {
 	/* Blocking includes an implicit local_irq_enable(). */
 	if (HYPERVISOR_sched_op(SCHEDOP_block, NULL) != 0)


