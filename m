Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4885640A21
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 17:05:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNyT74qtWz3fCQ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Dec 2022 03:05:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h/Twuz11;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h/Twuz11;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vschneid@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h/Twuz11;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h/Twuz11;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNyLV2m6sz3bgH
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Dec 2022 02:59:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669996767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S0rn6ibspmsa/u6Ppq7nR0uXkFaRdafaQGMWAeCDkWQ=;
	b=h/Twuz11bt8BxFSaIx8yFek6GAjHe6cukA2xks27rfZvHiIzk2KCDJ75ta+CQB7HjP/IfF
	DGcDRV3J7xLgNqINWuC1aM4NSWMV4wuPH6D1No3sIOQ8FdpWx15B6e3jc4nhqnA3ZlI7Sq
	e7fOitmkKAcwS3bZH1XP24ZQ2O1hxhs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669996767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S0rn6ibspmsa/u6Ppq7nR0uXkFaRdafaQGMWAeCDkWQ=;
	b=h/Twuz11bt8BxFSaIx8yFek6GAjHe6cukA2xks27rfZvHiIzk2KCDJ75ta+CQB7HjP/IfF
	DGcDRV3J7xLgNqINWuC1aM4NSWMV4wuPH6D1No3sIOQ8FdpWx15B6e3jc4nhqnA3ZlI7Sq
	e7fOitmkKAcwS3bZH1XP24ZQ2O1hxhs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-k2L3t5y8Nr-GYd2qSxoR8w-1; Fri, 02 Dec 2022 10:59:23 -0500
X-MC-Unique: k2L3t5y8Nr-GYd2qSxoR8w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 405EB800B23;
	Fri,  2 Dec 2022 15:59:22 +0000 (UTC)
Received: from vschneid.remote.csb (unknown [10.33.36.77])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1AEE2028E96;
	Fri,  2 Dec 2022 15:59:17 +0000 (UTC)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	x86@kernel.org
Subject: [PATCH v3 6/8] treewide: Trace IPIs sent via smp_send_reschedule()
Date: Fri,  2 Dec 2022 15:58:15 +0000
Message-Id: <20221202155817.2102944-7-vschneid@redhat.com>
In-Reply-To: <20221202155817.2102944-1-vschneid@redhat.com>
References: <20221202155817.2102944-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Mark Rutland <mark.rutland@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Marcelo Tosatti <mtosatti@redhat.com>, Russell King <linux@armlinux.org.uk>, Steven Rostedt <rostedt@goodmis.org>, "David S. Miller" <davem@davemloft.net>, Ingo Molnar <mingo@redhat.com>, Guo Ren <guoren@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Daniel Bristot de Oliveira <bristot@redhat.com>, Frederic Weisbecker <frederic@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To be able to trace invocations of smp_send_reschedule(), rename the
arch-specific definitions of it to arch_smp_send_reschedule() and wrap it
into an smp_send_reschedule() that contains a tracepoint.

Changes to include the declaration of the tracepoint were driven by the
following coccinelle script:

  @func_use@
  @@
  smp_send_reschedule(...);

  @include@
  @@
  #include <trace/events/ipi.h>

  @no_include depends on func_use && !include@
  @@
    #include <...>
  +
  + #include <trace/events/ipi.h>

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
[csky bits]
Acked-by: Guo Ren <guoren@kernel.org>
---
 arch/alpha/kernel/smp.c                  | 2 +-
 arch/arc/kernel/smp.c                    | 2 +-
 arch/arm/kernel/smp.c                    | 2 +-
 arch/arm/mach-actions/platsmp.c          | 2 ++
 arch/arm64/kernel/smp.c                  | 2 +-
 arch/csky/kernel/smp.c                   | 2 +-
 arch/hexagon/kernel/smp.c                | 2 +-
 arch/ia64/kernel/smp.c                   | 4 ++--
 arch/loongarch/include/asm/smp.h         | 2 +-
 arch/mips/include/asm/smp.h              | 2 +-
 arch/mips/kernel/rtlx-cmp.c              | 2 ++
 arch/openrisc/kernel/smp.c               | 2 +-
 arch/parisc/kernel/smp.c                 | 4 ++--
 arch/powerpc/kernel/smp.c                | 6 ++++--
 arch/powerpc/kvm/book3s_hv.c             | 3 +++
 arch/powerpc/platforms/powernv/subcore.c | 2 ++
 arch/riscv/kernel/smp.c                  | 4 ++--
 arch/s390/kernel/smp.c                   | 2 +-
 arch/sh/kernel/smp.c                     | 2 +-
 arch/sparc/kernel/smp_32.c               | 2 +-
 arch/sparc/kernel/smp_64.c               | 2 +-
 arch/x86/include/asm/smp.h               | 2 +-
 arch/x86/kvm/svm/svm.c                   | 4 ++++
 arch/x86/kvm/x86.c                       | 2 ++
 arch/xtensa/kernel/smp.c                 | 2 +-
 include/linux/smp.h                      | 8 ++++++--
 virt/kvm/kvm_main.c                      | 1 +
 27 files changed, 47 insertions(+), 25 deletions(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index f4e20f75438f8..38637eb9eebd5 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -562,7 +562,7 @@ handle_ipi(struct pt_regs *regs)
 }
 
 void
-smp_send_reschedule(int cpu)
+arch_smp_send_reschedule(int cpu)
 {
 #ifdef DEBUG_IPI_MSG
 	if (cpu == hard_smp_processor_id())
diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
index ad93fe6e4b77d..409cfa4675b40 100644
--- a/arch/arc/kernel/smp.c
+++ b/arch/arc/kernel/smp.c
@@ -292,7 +292,7 @@ static void ipi_send_msg(const struct cpumask *callmap, enum ipi_msg_type msg)
 		ipi_send_msg_one(cpu, msg);
 }
 
-void smp_send_reschedule(int cpu)
+void arch_smp_send_reschedule(int cpu)
 {
 	ipi_send_msg_one(cpu, IPI_RESCHEDULE);
 }
diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index 3b280d55c1c40..f216ac890b6f9 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -745,7 +745,7 @@ void __init set_smp_ipi_range(int ipi_base, int n)
 	ipi_setup(smp_processor_id());
 }
 
-void smp_send_reschedule(int cpu)
+void arch_smp_send_reschedule(int cpu)
 {
 	smp_cross_call(cpumask_of(cpu), IPI_RESCHEDULE);
 }
diff --git a/arch/arm/mach-actions/platsmp.c b/arch/arm/mach-actions/platsmp.c
index f26618b435145..7b208e96fbb67 100644
--- a/arch/arm/mach-actions/platsmp.c
+++ b/arch/arm/mach-actions/platsmp.c
@@ -20,6 +20,8 @@
 #include <asm/smp_plat.h>
 #include <asm/smp_scu.h>
 
+#include <trace/events/ipi.h>
+
 #define OWL_CPU1_ADDR	0x50
 #define OWL_CPU1_FLAG	0x5c
 
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 937d2623e06ba..8d108edc4a89f 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -976,7 +976,7 @@ void __init set_smp_ipi_range(int ipi_base, int n)
 	ipi_setup(smp_processor_id());
 }
 
-void smp_send_reschedule(int cpu)
+void arch_smp_send_reschedule(int cpu)
 {
 	smp_cross_call(cpumask_of(cpu), IPI_RESCHEDULE);
 }
diff --git a/arch/csky/kernel/smp.c b/arch/csky/kernel/smp.c
index 4b605aa2e1d65..fd7f81be16dd6 100644
--- a/arch/csky/kernel/smp.c
+++ b/arch/csky/kernel/smp.c
@@ -140,7 +140,7 @@ void smp_send_stop(void)
 	on_each_cpu(ipi_stop, NULL, 1);
 }
 
-void smp_send_reschedule(int cpu)
+void arch_smp_send_reschedule(int cpu)
 {
 	send_ipi_message(cpumask_of(cpu), IPI_RESCHEDULE);
 }
diff --git a/arch/hexagon/kernel/smp.c b/arch/hexagon/kernel/smp.c
index 4ba93e59370c4..4e8bee25b8c68 100644
--- a/arch/hexagon/kernel/smp.c
+++ b/arch/hexagon/kernel/smp.c
@@ -217,7 +217,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	}
 }
 
-void smp_send_reschedule(int cpu)
+void arch_smp_send_reschedule(int cpu)
 {
 	send_ipi(cpumask_of(cpu), IPI_RESCHEDULE);
 }
diff --git a/arch/ia64/kernel/smp.c b/arch/ia64/kernel/smp.c
index e2cc59db86bc2..ea4f009a232b4 100644
--- a/arch/ia64/kernel/smp.c
+++ b/arch/ia64/kernel/smp.c
@@ -220,11 +220,11 @@ kdump_smp_send_init(void)
  * Called with preemption disabled.
  */
 void
-smp_send_reschedule (int cpu)
+arch_smp_send_reschedule (int cpu)
 {
 	ia64_send_ipi(cpu, IA64_IPI_RESCHEDULE, IA64_IPI_DM_INT, 0);
 }
-EXPORT_SYMBOL_GPL(smp_send_reschedule);
+EXPORT_SYMBOL_GPL(arch_smp_send_reschedule);
 
 /*
  * Called with preemption disabled.
diff --git a/arch/loongarch/include/asm/smp.h b/arch/loongarch/include/asm/smp.h
index 3dd172d9ffea0..99f6f6d51d33a 100644
--- a/arch/loongarch/include/asm/smp.h
+++ b/arch/loongarch/include/asm/smp.h
@@ -83,7 +83,7 @@ extern void show_ipi_list(struct seq_file *p, int prec);
  * it goes straight through and wastes no time serializing
  * anything. Worst case is that we lose a reschedule ...
  */
-static inline void smp_send_reschedule(int cpu)
+static inline void arch_smp_send_reschedule(int cpu)
 {
 	loongson_send_ipi_single(cpu, SMP_RESCHEDULE);
 }
diff --git a/arch/mips/include/asm/smp.h b/arch/mips/include/asm/smp.h
index 5d9ff61004ca7..9806e79895d99 100644
--- a/arch/mips/include/asm/smp.h
+++ b/arch/mips/include/asm/smp.h
@@ -66,7 +66,7 @@ extern void calculate_cpu_foreign_map(void);
  * it goes straight through and wastes no time serializing
  * anything. Worst case is that we lose a reschedule ...
  */
-static inline void smp_send_reschedule(int cpu)
+static inline void arch_smp_send_reschedule(int cpu)
 {
 	extern const struct plat_smp_ops *mp_ops;	/* private */
 
diff --git a/arch/mips/kernel/rtlx-cmp.c b/arch/mips/kernel/rtlx-cmp.c
index d26dcc4b46e74..e991cc936c1cd 100644
--- a/arch/mips/kernel/rtlx-cmp.c
+++ b/arch/mips/kernel/rtlx-cmp.c
@@ -17,6 +17,8 @@
 #include <asm/vpe.h>
 #include <asm/rtlx.h>
 
+#include <trace/events/ipi.h>
+
 static int major;
 
 static void rtlx_interrupt(void)
diff --git a/arch/openrisc/kernel/smp.c b/arch/openrisc/kernel/smp.c
index e1419095a6f0a..0a7a059e2dff4 100644
--- a/arch/openrisc/kernel/smp.c
+++ b/arch/openrisc/kernel/smp.c
@@ -173,7 +173,7 @@ void handle_IPI(unsigned int ipi_msg)
 	}
 }
 
-void smp_send_reschedule(int cpu)
+void arch_smp_send_reschedule(int cpu)
 {
 	smp_cross_call(cpumask_of(cpu), IPI_RESCHEDULE);
 }
diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 7dbd92cafae38..b7fc859fa87db 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -246,8 +246,8 @@ void kgdb_roundup_cpus(void)
 inline void 
 smp_send_stop(void)	{ send_IPI_allbutself(IPI_CPU_STOP); }
 
-void 
-smp_send_reschedule(int cpu) { send_IPI_single(cpu, IPI_RESCHEDULE); }
+void
+arch_smp_send_reschedule(int cpu) { send_IPI_single(cpu, IPI_RESCHEDULE); }
 
 void
 smp_send_all_nop(void)
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 0da6e59161cd4..11cfa76fd3699 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -61,6 +61,8 @@
 #include <asm/kup.h>
 #include <asm/fadump.h>
 
+#include <trace/events/ipi.h>
+
 #ifdef DEBUG
 #include <asm/udbg.h>
 #define DBG(fmt...) udbg_printf(fmt)
@@ -364,12 +366,12 @@ static inline void do_message_pass(int cpu, int msg)
 #endif
 }
 
-void smp_send_reschedule(int cpu)
+void arch_smp_send_reschedule(int cpu)
 {
 	if (likely(smp_ops))
 		do_message_pass(cpu, PPC_MSG_RESCHEDULE);
 }
-EXPORT_SYMBOL_GPL(smp_send_reschedule);
+EXPORT_SYMBOL_GPL(arch_smp_send_reschedule);
 
 void arch_send_call_function_single_ipi(int cpu)
 {
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 6ba68dd6190bd..3b70b5f80bd56 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -43,6 +43,7 @@
 #include <linux/compiler.h>
 #include <linux/of.h>
 #include <linux/irqdomain.h>
+#include <linux/smp.h>
 
 #include <asm/ftrace.h>
 #include <asm/reg.h>
@@ -80,6 +81,8 @@
 #include <asm/dtl.h>
 #include <asm/plpar_wrappers.h>
 
+#include <trace/events/ipi.h>
+
 #include "book3s.h"
 #include "book3s_hv.h"
 
diff --git a/arch/powerpc/platforms/powernv/subcore.c b/arch/powerpc/platforms/powernv/subcore.c
index 7e98b00ea2e84..c53c4c7977680 100644
--- a/arch/powerpc/platforms/powernv/subcore.c
+++ b/arch/powerpc/platforms/powernv/subcore.c
@@ -20,6 +20,8 @@
 #include <asm/opal.h>
 #include <asm/smp.h>
 
+#include <trace/events/ipi.h>
+
 #include "subcore.h"
 #include "powernv.h"
 
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 760a64518c585..213602e89a8b2 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -235,8 +235,8 @@ void smp_send_stop(void)
 			   cpumask_pr_args(cpu_online_mask));
 }
 
-void smp_send_reschedule(int cpu)
+void arch_smp_send_reschedule(int cpu)
 {
 	send_ipi_single(cpu, IPI_RESCHEDULE);
 }
-EXPORT_SYMBOL_GPL(smp_send_reschedule);
+EXPORT_SYMBOL_GPL(arch_smp_send_reschedule);
diff --git a/arch/s390/kernel/smp.c b/arch/s390/kernel/smp.c
index 0031325ce4bc9..6c4da1e26e568 100644
--- a/arch/s390/kernel/smp.c
+++ b/arch/s390/kernel/smp.c
@@ -553,7 +553,7 @@ void arch_send_call_function_single_ipi(int cpu)
  * it goes straight through and wastes no time serializing
  * anything. Worst case is that we lose a reschedule ...
  */
-void smp_send_reschedule(int cpu)
+void arch_smp_send_reschedule(int cpu)
 {
 	pcpu_ec_call(pcpu_devices + cpu, ec_schedule);
 }
diff --git a/arch/sh/kernel/smp.c b/arch/sh/kernel/smp.c
index 65924d9ec2459..5cf35a774dc70 100644
--- a/arch/sh/kernel/smp.c
+++ b/arch/sh/kernel/smp.c
@@ -256,7 +256,7 @@ void __init smp_cpus_done(unsigned int max_cpus)
 	       (bogosum / (5000/HZ)) % 100);
 }
 
-void smp_send_reschedule(int cpu)
+void arch_smp_send_reschedule(int cpu)
 {
 	mp_ops->send_ipi(cpu, SMP_MSG_RESCHEDULE);
 }
diff --git a/arch/sparc/kernel/smp_32.c b/arch/sparc/kernel/smp_32.c
index ad8094d955eba..87eaa7719fa27 100644
--- a/arch/sparc/kernel/smp_32.c
+++ b/arch/sparc/kernel/smp_32.c
@@ -120,7 +120,7 @@ void cpu_panic(void)
 
 struct linux_prom_registers smp_penguin_ctable = { 0 };
 
-void smp_send_reschedule(int cpu)
+void arch_smp_send_reschedule(int cpu)
 {
 	/*
 	 * CPU model dependent way of implementing IPI generation targeting
diff --git a/arch/sparc/kernel/smp_64.c b/arch/sparc/kernel/smp_64.c
index a55295d1b9244..e5964d1d8b37d 100644
--- a/arch/sparc/kernel/smp_64.c
+++ b/arch/sparc/kernel/smp_64.c
@@ -1430,7 +1430,7 @@ static unsigned long send_cpu_poke(int cpu)
 	return hv_err;
 }
 
-void smp_send_reschedule(int cpu)
+void arch_smp_send_reschedule(int cpu)
 {
 	if (cpu == smp_processor_id()) {
 		WARN_ON_ONCE(preemptible());
diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
index a73bced40e241..5ff5815149bd3 100644
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -99,7 +99,7 @@ static inline void play_dead(void)
 	smp_ops.play_dead();
 }
 
-static inline void smp_send_reschedule(int cpu)
+static inline void arch_smp_send_reschedule(int cpu)
 {
 	smp_ops.smp_send_reschedule(cpu);
 }
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index ce362e88a5676..cfc622d8fc2d8 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -26,6 +26,7 @@
 #include <linux/swap.h>
 #include <linux/rwsem.h>
 #include <linux/cc_platform.h>
+#include <linux/smp.h>
 
 #include <asm/apic.h>
 #include <asm/perf_event.h>
@@ -40,6 +41,9 @@
 #include <asm/fpu/api.h>
 
 #include <asm/virtext.h>
+
+#include <trace/events/ipi.h>
+
 #include "trace.h"
 
 #include "svm.h"
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 2835bd7966391..4c2baf8090bdc 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -58,7 +58,9 @@
 #include <linux/mem_encrypt.h>
 #include <linux/entry-kvm.h>
 #include <linux/suspend.h>
+#include <linux/smp.h>
 
+#include <trace/events/ipi.h>
 #include <trace/events/kvm.h>
 
 #include <asm/debugreg.h>
diff --git a/arch/xtensa/kernel/smp.c b/arch/xtensa/kernel/smp.c
index 4dc109dd6214e..d95907b8e4d38 100644
--- a/arch/xtensa/kernel/smp.c
+++ b/arch/xtensa/kernel/smp.c
@@ -389,7 +389,7 @@ void arch_send_call_function_single_ipi(int cpu)
 	send_ipi_message(cpumask_of(cpu), IPI_CALL_FUNC);
 }
 
-void smp_send_reschedule(int cpu)
+void arch_smp_send_reschedule(int cpu)
 {
 	send_ipi_message(cpumask_of(cpu), IPI_RESCHEDULE);
 }
diff --git a/include/linux/smp.h b/include/linux/smp.h
index a80ab58ae3f1d..96836af927893 100644
--- a/include/linux/smp.h
+++ b/include/linux/smp.h
@@ -125,8 +125,12 @@ extern void smp_send_stop(void);
 /*
  * sends a 'reschedule' event to another CPU:
  */
-extern void smp_send_reschedule(int cpu);
-
+extern void arch_smp_send_reschedule(int cpu);
+#define smp_send_reschedule(cpu) ({				  \
+	/* XXX scheduler_ipi is inline :/ */                      \
+	trace_ipi_send_cpumask(cpumask_of(cpu), _RET_IP_, NULL);  \
+	arch_smp_send_reschedule(cpu);				  \
+})
 
 /*
  * Prepare machine for booting other CPUs.
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index fab4d37905785..a1fc2c947edfe 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -62,6 +62,7 @@
 #include "kvm_mm.h"
 #include "vfio.h"
 
+#include <trace/events/ipi.h>
 #define CREATE_TRACE_POINTS
 #include <trace/events/kvm.h>
 
-- 
2.31.1

