Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB285BD6ED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 00:12:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWf6k2B2xz3g96
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 08:12:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=JbVpe9aV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=JbVpe9aV;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWLGc2VrLz304j
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 20:18:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=09Q+uBv4m8ezDZdYZ5KakXIYsVymlhYhZfz4mEDH0tE=; b=JbVpe9aV8H6kYx8ftu67Y3u9r0
	gXNnU5LaPVCfpK5iLi7o0zM7rJjvu4xaBPEmot/099oNetn8DzfAbl4uJxIS10v0vloCqGMVM719t
	+p8U3dMyhrhRPGkeTXRqUB1okkHDXCK11tZ1P7PI6eTZGX1Dlu2Nmay6p1IwLD52fcJ7ojBGZrbFi
	VDDdZsf17fz7HNr0qYV+IW9I4J1uqmliO7c3IvKaBeKm/Lj/utimTnStwbzt4LNAbJTRbM/PLYySH
	8SVxqwjN00rLR7TeeQctulS9yYSXO5jaHXgkF/kHPDIWJ1mjwdm2yU9y/TIZMKPk+UJKe0mFMDfE+
	1EYUDx8A==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaDq5-004b7e-9z; Mon, 19 Sep 2022 10:17:21 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 05E68302EE7;
	Mon, 19 Sep 2022 12:16:25 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 1E1F72BA4ABC9; Mon, 19 Sep 2022 12:16:22 +0200 (CEST)
Message-ID: <20220919101521.475195632@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 19 Sep 2022 11:59:56 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Subject: [PATCH v2 17/44] objtool/idle: Validate __cpuidle code as noinstr
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

Idle code is very like entry code in that RCU isn't available. As
such, add a little validation.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/alpha/kernel/vmlinux.lds.S      |    1 -
 arch/arc/kernel/vmlinux.lds.S        |    1 -
 arch/arm/include/asm/vmlinux.lds.h   |    1 -
 arch/arm64/kernel/vmlinux.lds.S      |    1 -
 arch/csky/kernel/vmlinux.lds.S       |    1 -
 arch/hexagon/kernel/vmlinux.lds.S    |    1 -
 arch/ia64/kernel/vmlinux.lds.S       |    1 -
 arch/loongarch/kernel/vmlinux.lds.S  |    1 -
 arch/m68k/kernel/vmlinux-nommu.lds   |    1 -
 arch/m68k/kernel/vmlinux-std.lds     |    1 -
 arch/m68k/kernel/vmlinux-sun3.lds    |    1 -
 arch/microblaze/kernel/vmlinux.lds.S |    1 -
 arch/mips/kernel/vmlinux.lds.S       |    1 -
 arch/nios2/kernel/vmlinux.lds.S      |    1 -
 arch/openrisc/kernel/vmlinux.lds.S   |    1 -
 arch/parisc/kernel/vmlinux.lds.S     |    1 -
 arch/powerpc/kernel/vmlinux.lds.S    |    1 -
 arch/riscv/kernel/vmlinux-xip.lds.S  |    1 -
 arch/riscv/kernel/vmlinux.lds.S      |    1 -
 arch/s390/kernel/vmlinux.lds.S       |    1 -
 arch/sh/kernel/vmlinux.lds.S         |    1 -
 arch/sparc/kernel/vmlinux.lds.S      |    1 -
 arch/um/kernel/dyn.lds.S             |    1 -
 arch/um/kernel/uml.lds.S             |    1 -
 arch/x86/include/asm/irqflags.h      |   11 ++++-------
 arch/x86/include/asm/mwait.h         |    2 +-
 arch/x86/kernel/vmlinux.lds.S        |    1 -
 arch/xtensa/kernel/vmlinux.lds.S     |    1 -
 include/asm-generic/vmlinux.lds.h    |    9 +++------
 include/linux/compiler_types.h       |    8 ++++++--
 include/linux/cpu.h                  |    3 ---
 tools/objtool/check.c                |   13 +++++++++++++
 32 files changed, 27 insertions(+), 45 deletions(-)

--- a/arch/alpha/kernel/vmlinux.lds.S
+++ b/arch/alpha/kernel/vmlinux.lds.S
@@ -27,7 +27,6 @@ SECTIONS
 		HEAD_TEXT
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		*(.fixup)
 		*(.gnu.warning)
--- a/arch/arc/kernel/vmlinux.lds.S
+++ b/arch/arc/kernel/vmlinux.lds.S
@@ -85,7 +85,6 @@ SECTIONS
 		_stext = .;
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		IRQENTRY_TEXT
--- a/arch/arm/include/asm/vmlinux.lds.h
+++ b/arch/arm/include/asm/vmlinux.lds.h
@@ -96,7 +96,6 @@
 		SOFTIRQENTRY_TEXT					\
 		TEXT_TEXT						\
 		SCHED_TEXT						\
-		CPUIDLE_TEXT						\
 		LOCK_TEXT						\
 		KPROBES_TEXT						\
 		ARM_STUBS_TEXT						\
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -163,7 +163,6 @@ SECTIONS
 			ENTRY_TEXT
 			TEXT_TEXT
 			SCHED_TEXT
-			CPUIDLE_TEXT
 			LOCK_TEXT
 			KPROBES_TEXT
 			HYPERVISOR_TEXT
--- a/arch/csky/kernel/vmlinux.lds.S
+++ b/arch/csky/kernel/vmlinux.lds.S
@@ -38,7 +38,6 @@ SECTIONS
 		SOFTIRQENTRY_TEXT
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		*(.fixup)
--- a/arch/hexagon/kernel/vmlinux.lds.S
+++ b/arch/hexagon/kernel/vmlinux.lds.S
@@ -41,7 +41,6 @@ SECTIONS
 		IRQENTRY_TEXT
 		SOFTIRQENTRY_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		*(.fixup)
--- a/arch/ia64/kernel/vmlinux.lds.S
+++ b/arch/ia64/kernel/vmlinux.lds.S
@@ -51,7 +51,6 @@ SECTIONS {
 		__end_ivt_text = .;
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		IRQENTRY_TEXT
--- a/arch/loongarch/kernel/vmlinux.lds.S
+++ b/arch/loongarch/kernel/vmlinux.lds.S
@@ -41,7 +41,6 @@ SECTIONS
 	.text : {
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		IRQENTRY_TEXT
--- a/arch/m68k/kernel/vmlinux-nommu.lds
+++ b/arch/m68k/kernel/vmlinux-nommu.lds
@@ -48,7 +48,6 @@ SECTIONS {
 		IRQENTRY_TEXT
 		SOFTIRQENTRY_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		*(.fixup)
 		. = ALIGN(16);
--- a/arch/m68k/kernel/vmlinux-std.lds
+++ b/arch/m68k/kernel/vmlinux-std.lds
@@ -19,7 +19,6 @@ SECTIONS
 	IRQENTRY_TEXT
 	SOFTIRQENTRY_TEXT
 	SCHED_TEXT
-	CPUIDLE_TEXT
 	LOCK_TEXT
 	*(.fixup)
 	*(.gnu.warning)
--- a/arch/m68k/kernel/vmlinux-sun3.lds
+++ b/arch/m68k/kernel/vmlinux-sun3.lds
@@ -19,7 +19,6 @@ SECTIONS
 	IRQENTRY_TEXT
 	SOFTIRQENTRY_TEXT
 	SCHED_TEXT
-	CPUIDLE_TEXT
 	LOCK_TEXT
 	*(.fixup)
 	*(.gnu.warning)
--- a/arch/microblaze/kernel/vmlinux.lds.S
+++ b/arch/microblaze/kernel/vmlinux.lds.S
@@ -36,7 +36,6 @@ SECTIONS {
 		EXIT_TEXT
 		EXIT_CALL
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		IRQENTRY_TEXT
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -61,7 +61,6 @@ SECTIONS
 	.text : {
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		IRQENTRY_TEXT
--- a/arch/nios2/kernel/vmlinux.lds.S
+++ b/arch/nios2/kernel/vmlinux.lds.S
@@ -24,7 +24,6 @@ SECTIONS
 	.text : {
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		IRQENTRY_TEXT
 		SOFTIRQENTRY_TEXT
--- a/arch/openrisc/kernel/vmlinux.lds.S
+++ b/arch/openrisc/kernel/vmlinux.lds.S
@@ -52,7 +52,6 @@ SECTIONS
           _stext = .;
 	  TEXT_TEXT
 	  SCHED_TEXT
-	  CPUIDLE_TEXT
 	  LOCK_TEXT
 	  KPROBES_TEXT
 	  IRQENTRY_TEXT
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -86,7 +86,6 @@ SECTIONS
 		TEXT_TEXT
 		LOCK_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		KPROBES_TEXT
 		IRQENTRY_TEXT
 		SOFTIRQENTRY_TEXT
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -107,7 +107,6 @@ SECTIONS
 #endif
 		NOINSTR_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		IRQENTRY_TEXT
--- a/arch/riscv/kernel/vmlinux-xip.lds.S
+++ b/arch/riscv/kernel/vmlinux-xip.lds.S
@@ -39,7 +39,6 @@ SECTIONS
 		_stext = .;
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		ENTRY_TEXT
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -42,7 +42,6 @@ SECTIONS
 		_stext = .;
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		ENTRY_TEXT
--- a/arch/s390/kernel/vmlinux.lds.S
+++ b/arch/s390/kernel/vmlinux.lds.S
@@ -42,7 +42,6 @@ SECTIONS
 		HEAD_TEXT
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		IRQENTRY_TEXT
--- a/arch/sh/kernel/vmlinux.lds.S
+++ b/arch/sh/kernel/vmlinux.lds.S
@@ -29,7 +29,6 @@ SECTIONS
 		HEAD_TEXT
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		IRQENTRY_TEXT
--- a/arch/sparc/kernel/vmlinux.lds.S
+++ b/arch/sparc/kernel/vmlinux.lds.S
@@ -50,7 +50,6 @@ SECTIONS
 		HEAD_TEXT
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		IRQENTRY_TEXT
--- a/arch/um/kernel/dyn.lds.S
+++ b/arch/um/kernel/dyn.lds.S
@@ -74,7 +74,6 @@ SECTIONS
     _stext = .;
     TEXT_TEXT
     SCHED_TEXT
-    CPUIDLE_TEXT
     LOCK_TEXT
     IRQENTRY_TEXT
     SOFTIRQENTRY_TEXT
--- a/arch/um/kernel/uml.lds.S
+++ b/arch/um/kernel/uml.lds.S
@@ -35,7 +35,6 @@ SECTIONS
     _stext = .;
     TEXT_TEXT
     SCHED_TEXT
-    CPUIDLE_TEXT
     LOCK_TEXT
     IRQENTRY_TEXT
     SOFTIRQENTRY_TEXT
--- a/arch/x86/include/asm/irqflags.h
+++ b/arch/x86/include/asm/irqflags.h
@@ -8,9 +8,6 @@
 
 #include <asm/nospec-branch.h>
 
-/* Provide __cpuidle; we can't safely include <linux/cpu.h> */
-#define __cpuidle __section(".cpuidle.text")
-
 /*
  * Interrupt control:
  */
@@ -45,13 +42,13 @@ static __always_inline void native_irq_e
 	asm volatile("sti": : :"memory");
 }
 
-static inline __cpuidle void native_safe_halt(void)
+static __always_inline void native_safe_halt(void)
 {
 	mds_idle_clear_cpu_buffers();
 	asm volatile("sti; hlt": : :"memory");
 }
 
-static inline __cpuidle void native_halt(void)
+static __always_inline void native_halt(void)
 {
 	mds_idle_clear_cpu_buffers();
 	asm volatile("hlt": : :"memory");
@@ -84,7 +81,7 @@ static __always_inline void arch_local_i
  * Used in the idle loop; sti takes one instruction cycle
  * to complete:
  */
-static inline __cpuidle void arch_safe_halt(void)
+static __always_inline void arch_safe_halt(void)
 {
 	native_safe_halt();
 }
@@ -93,7 +90,7 @@ static inline __cpuidle void arch_safe_h
  * Used when interrupts are already enabled or to
  * shutdown the processor:
  */
-static inline __cpuidle void halt(void)
+static __always_inline void halt(void)
 {
 	native_halt();
 }
--- a/arch/x86/include/asm/mwait.h
+++ b/arch/x86/include/asm/mwait.h
@@ -104,7 +104,7 @@ static inline void __sti_mwait(unsigned
  * New with Core Duo processors, MWAIT can take some hints based on CPU
  * capability.
  */
-static inline void mwait_idle_with_hints(unsigned long eax, unsigned long ecx)
+static __always_inline void mwait_idle_with_hints(unsigned long eax, unsigned long ecx)
 {
 	if (static_cpu_has_bug(X86_BUG_MONITOR) || !current_set_polling_and_test()) {
 		if (static_cpu_has_bug(X86_BUG_CLFLUSH_MONITOR)) {
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -129,7 +129,6 @@ SECTIONS
 		HEAD_TEXT
 		TEXT_TEXT
 		SCHED_TEXT
-		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
 		ALIGN_ENTRY_TEXT_BEGIN
--- a/arch/xtensa/kernel/vmlinux.lds.S
+++ b/arch/xtensa/kernel/vmlinux.lds.S
@@ -125,7 +125,6 @@ SECTIONS
     ENTRY_TEXT
     TEXT_TEXT
     SCHED_TEXT
-    CPUIDLE_TEXT
     LOCK_TEXT
     *(.fixup)
   }
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -559,6 +559,9 @@
 		ALIGN_FUNCTION();					\
 		__noinstr_text_start = .;				\
 		*(.noinstr.text)					\
+		__cpuidle_text_start = .;				\
+		*(.cpuidle.text)					\
+		__cpuidle_text_end = .;					\
 		__noinstr_text_end = .;
 
 /*
@@ -600,12 +603,6 @@
 		*(.spinlock.text)					\
 		__lock_text_end = .;
 
-#define CPUIDLE_TEXT							\
-		ALIGN_FUNCTION();					\
-		__cpuidle_text_start = .;				\
-		*(.cpuidle.text)					\
-		__cpuidle_text_end = .;
-
 #define KPROBES_TEXT							\
 		ALIGN_FUNCTION();					\
 		__kprobes_text_start = .;				\
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -227,10 +227,14 @@ struct ftrace_likely_data {
 #endif
 
 /* Section for code which can't be instrumented at all */
-#define noinstr								\
-	noinline notrace __attribute((__section__(".noinstr.text")))	\
+#define __noinstr_section(section)					\
+	noinline notrace __attribute((__section__(section)))		\
 	__no_kcsan __no_sanitize_address __no_profile __no_sanitize_coverage
 
+#define noinstr __noinstr_section(".noinstr.text")
+
+#define __cpuidle __noinstr_section(".cpuidle.text")
+
 #endif /* __KERNEL__ */
 
 #endif /* __ASSEMBLY__ */
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -176,9 +176,6 @@ void __noreturn cpu_startup_entry(enum c
 
 void cpu_idle_poll_ctrl(bool enable);
 
-/* Attach to any functions which should be considered cpuidle. */
-#define __cpuidle	__section(".cpuidle.text")
-
 bool cpu_in_idle(unsigned long pc);
 
 void arch_cpu_idle(void);
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -377,6 +377,7 @@ static int decode_instructions(struct ob
 
 		if (!strcmp(sec->name, ".noinstr.text") ||
 		    !strcmp(sec->name, ".entry.text") ||
+		    !strcmp(sec->name, ".cpuidle.text") ||
 		    !strncmp(sec->name, ".text.__x86.", 12))
 			sec->noinstr = true;
 
@@ -3187,6 +3188,12 @@ static inline bool noinstr_call_dest(str
 		return true;
 
 	/*
+	 * If the symbol is a static_call trampoline, we can't tell.
+	 */
+	if (func->static_call_tramp)
+		return true;
+
+	/*
 	 * The __ubsan_handle_*() calls are like WARN(), they only happen when
 	 * something 'BAD' happened. At the risk of taking the machine down,
 	 * let them proceed to get the message out.
@@ -3932,6 +3939,12 @@ static int validate_noinstr_sections(str
 	if (sec) {
 		warnings += validate_section(file, sec);
 		warnings += validate_unwind_hints(file, sec);
+	}
+
+	sec = find_section_by_name(file->elf, ".cpuidle.text");
+	if (sec) {
+		warnings += validate_section(file, sec);
+		warnings += validate_unwind_hints(file, sec);
 	}
 
 	return warnings;


