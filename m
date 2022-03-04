Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F8E4CD9B3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Mar 2022 18:06:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K9DlL19Yzz3bbw
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Mar 2022 04:06:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K9Djf3RBtz3bVX
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Mar 2022 04:04:38 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4K9DjK5mkgz9sT7;
 Fri,  4 Mar 2022 18:04:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dWqXcCtO9DgH; Fri,  4 Mar 2022 18:04:21 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4K9DjG2pY7z9sTD;
 Fri,  4 Mar 2022 18:04:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 36E808B77E;
 Fri,  4 Mar 2022 18:04:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Sx5HboqOTe1T; Fri,  4 Mar 2022 18:04:18 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.129])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B8DE18B763;
 Fri,  4 Mar 2022 18:04:17 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 224H48qh1979768
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 4 Mar 2022 18:04:08 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 224H48BA1979767;
 Fri, 4 Mar 2022 18:04:08 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 4/4] powerpc: Move C prototypes out of asm-prototypes.h
Date: Fri,  4 Mar 2022 18:04:05 +0100
Message-Id: <62d46904eca74042097acf4cb12c175e3067f3d1.1646413435.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3ed660a585df2080ea8412ec20fbf652f5bf013a.1646413435.git.christophe.leroy@csgroup.eu>
References: <3ed660a585df2080ea8412ec20fbf652f5bf013a.1646413435.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1646413443; l=19837; s=20211009;
 h=from:subject:message-id; bh=rQsHq4s5wGAhdPnBG5J2Z1lHDdtX0LaOjot8iA13Zvg=;
 b=7ZYIrTsGMt2Dg1ePZClnZNXwT7Irv95E0vYEckqnwehKMksthBeL44V3xnque+muB9buQceJ+61b
 KdgUGneBBI/UId+oc4NVRXBuhOOBNjjYdg2VJRLka4nTCyykdJQy
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We originally added asm-prototypes.h in commit 42f5b4cacd78 ("powerpc:
Introduce asm-prototypes.h"). It's purpose was for prototypes of C
functions that are only called from asm, in order to fix sparse
warnings about missing prototypes.

A few months later Nick added a different use case in
commit 4efca4ed05cb ("kbuild: modversions for EXPORT_SYMBOL() for asm")
for C prototypes for exported asm functions. This is basically the
inverse of our original usage.

Since then we've added various prototypes to asm-prototypes.h for both
reasons, meaning we now need to unstitch it all.

Dispatch prototypes of C functions into relevant headers and keep
only the prototypes for functions defined in assembly.

For the time being, leave prom_init() there because moving it
into asm/prom.h or asm/setup.h conflicts with
drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.o
This will be fixed later by untaggling asm/pci.h and asm/prom.h
or by renaming the function in shadowrom.c

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/asm-prototypes.h     | 51 -------------------
 arch/powerpc/include/asm/ftrace.h             |  3 ++
 arch/powerpc/include/asm/hvcall.h             |  5 ++
 arch/powerpc/include/asm/interrupt.h          | 11 ++++
 arch/powerpc/include/asm/kexec.h              |  2 +
 arch/powerpc/include/asm/processor.h          |  8 +++
 arch/powerpc/include/asm/setup.h              |  7 +++
 arch/powerpc/include/asm/smp.h                |  3 ++
 arch/powerpc/include/asm/syscalls.h           |  4 ++
 arch/powerpc/kernel/early_32.c                |  1 -
 arch/powerpc/kernel/interrupt.c               |  1 -
 arch/powerpc/kernel/irq.c                     |  1 -
 arch/powerpc/kernel/mce.c                     |  1 -
 arch/powerpc/kernel/prom_init.c               |  1 -
 arch/powerpc/kernel/ptrace/ptrace.c           |  1 -
 arch/powerpc/kernel/setup_64.c                |  1 -
 arch/powerpc/kernel/smp.c                     |  1 -
 arch/powerpc/kernel/syscalls.c                |  1 -
 arch/powerpc/kernel/tau_6xx.c                 |  1 -
 arch/powerpc/kernel/time.c                    |  1 -
 arch/powerpc/kernel/trace/ftrace.c            |  1 -
 arch/powerpc/kexec/core_64.c                  |  1 -
 arch/powerpc/kvm/book3s_hv_builtin.c          |  1 -
 arch/powerpc/kvm/book3s_hv_rm_xive.c          |  1 -
 arch/powerpc/lib/vmx-helper.c                 |  1 -
 arch/powerpc/mm/book3s64/slb.c                |  1 -
 arch/powerpc/mm/fault.c                       |  1 -
 arch/powerpc/platforms/powernv/idle.c         |  1 -
 .../platforms/powernv/opal-tracepoints.c      |  1 -
 arch/powerpc/platforms/pseries/lpar.c         |  1 -
 30 files changed, 43 insertions(+), 72 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index 83ef106923e6..65b7de62f7ec 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -19,19 +19,6 @@
 
 #include <uapi/asm/ucontext.h>
 
-/* SMP */
-extern struct task_struct *secondary_current;
-void start_secondary(void *unused);
-
-/* kexec */
-struct kimage;
-void kexec_copy_flush(struct kimage *image);
-
-/* pseries hcall tracing */
-extern struct static_key hcall_tracepoint_key;
-void __trace_hcall_entry(unsigned long opcode, unsigned long *args);
-void __trace_hcall_exit(long opcode, long retval, unsigned long *retbuf);
-
 /* Ultravisor */
 #if defined(CONFIG_PPC_POWERNV) || defined(CONFIG_PPC_SVM)
 long ucall_norets(unsigned long opcode, ...);
@@ -47,43 +34,12 @@ int64_t __opal_call(int64_t a0, int64_t a1, int64_t a2, int64_t a3,
 		    int64_t a4, int64_t a5, int64_t a6, int64_t a7,
 		    int64_t opcode, uint64_t msr);
 
-/* VMX copying */
-int enter_vmx_usercopy(void);
-int exit_vmx_usercopy(void);
-int enter_vmx_ops(void);
-void *exit_vmx_ops(void *dest);
-
-/* signals, syscalls and interrupts */
-#ifdef CONFIG_PPC32
-int
-ppc_select(int n, fd_set __user *inp, fd_set __user *outp, fd_set __user *exp,
-	   struct __kernel_old_timeval __user *tvp);
-unsigned long __init early_init(unsigned long dt_ptr);
-void __init machine_init(u64 dt_ptr);
-#endif
-long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8, unsigned long r0, struct pt_regs *regs);
-notrace unsigned long syscall_exit_prepare(unsigned long r3, struct pt_regs *regs, long scv);
-notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs);
-notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs);
-#ifdef CONFIG_PPC64
-unsigned long syscall_exit_restart(unsigned long r3, struct pt_regs *regs);
-unsigned long interrupt_exit_user_restart(struct pt_regs *regs);
-unsigned long interrupt_exit_kernel_restart(struct pt_regs *regs);
-#endif
-
-long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
-		      u32 len_high, u32 len_low);
-
 /* prom_init (OpenFirmware) */
 unsigned long __init prom_init(unsigned long r3, unsigned long r4,
 			       unsigned long pp,
 			       unsigned long r6, unsigned long r7,
 			       unsigned long kbase);
 
-/* setup */
-void __init early_setup(unsigned long dt_ptr);
-void early_setup_secondary(void);
-
 /* misc runtime */
 extern u64 __bswapdi2(u64);
 extern s64 __lshrdi3(s64, int);
@@ -92,13 +48,6 @@ extern s64 __ashrdi3(s64, int);
 extern int __cmpdi2(s64, s64);
 extern int __ucmpdi2(u64, u64);
 
-/* tracing */
-unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip,
-						unsigned long sp);
-
-void pnv_power9_force_smt4_catch(void);
-void pnv_power9_force_smt4_release(void);
-
 /* Transaction memory related */
 void tm_enable(void);
 void tm_disable(void);
diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index ff034ae4e472..d83758acd1c7 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -19,6 +19,9 @@ static inline unsigned long ftrace_call_adjust(unsigned long addr)
        return addr;
 }
 
+unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip,
+				    unsigned long sp);
+
 struct dyn_arch_ftrace {
 	struct module *mod;
 };
diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index 9bcf345cb208..e52f6175b2c3 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -500,6 +500,11 @@ long plpar_hcall_raw(unsigned long opcode, unsigned long *retbuf, ...);
 long plpar_hcall9(unsigned long opcode, unsigned long *retbuf, ...);
 long plpar_hcall9_raw(unsigned long opcode, unsigned long *retbuf, ...);
 
+/* pseries hcall tracing */
+extern struct static_key hcall_tracepoint_key;
+void __trace_hcall_entry(unsigned long opcode, unsigned long *args);
+void __trace_hcall_exit(long opcode, long retval, unsigned long *retbuf);
+
 struct hvcall_mpp_data {
 	unsigned long entitled_mem;
 	unsigned long mapped_mem;
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index f3b2c93a5db1..f964ef5c57d8 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -636,6 +636,17 @@ static inline void interrupt_cond_local_irq_enable(struct pt_regs *regs)
 		local_irq_enable();
 }
 
+long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8,
+			   unsigned long r0, struct pt_regs *regs);
+notrace unsigned long syscall_exit_prepare(unsigned long r3, struct pt_regs *regs, long scv);
+notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs);
+notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs);
+#ifdef CONFIG_PPC64
+unsigned long syscall_exit_restart(unsigned long r3, struct pt_regs *regs);
+unsigned long interrupt_exit_user_restart(struct pt_regs *regs);
+unsigned long interrupt_exit_kernel_restart(struct pt_regs *regs);
+#endif
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_INTERRUPT_H */
diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 8ebdd23d987c..2aefe14e1442 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -96,6 +96,8 @@ static inline bool kdump_in_progress(void)
 void relocate_new_kernel(unsigned long indirection_page, unsigned long reboot_code_buffer,
 			 unsigned long start_address) __noreturn;
 
+void kexec_copy_flush(struct kimage *image);
+
 #ifdef CONFIG_KEXEC_FILE
 extern const struct kexec_file_ops kexec_elf64_ops;
 
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 2c8686d9e964..39c25021030f 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -411,6 +411,8 @@ extern int powersave_nap;	/* set if nap mode can be used in idle loop */
 extern void power7_idle_type(unsigned long type);
 extern void arch300_idle_type(unsigned long stop_psscr_val,
 			      unsigned long stop_psscr_mask);
+void pnv_power9_force_smt4_catch(void);
+void pnv_power9_force_smt4_release(void);
 
 extern int fix_alignment(struct pt_regs *);
 
@@ -427,6 +429,12 @@ extern int fix_alignment(struct pt_regs *);
 
 int do_mathemu(struct pt_regs *regs);
 
+/* VMX copying */
+int enter_vmx_usercopy(void);
+int exit_vmx_usercopy(void);
+int enter_vmx_ops(void);
+void *exit_vmx_ops(void *dest);
+
 #endif /* __KERNEL__ */
 #endif /* __ASSEMBLY__ */
 #endif /* _ASM_POWERPC_PROCESSOR_H */
diff --git a/arch/powerpc/include/asm/setup.h b/arch/powerpc/include/asm/setup.h
index d0d3dd531c7f..049ca26893e6 100644
--- a/arch/powerpc/include/asm/setup.h
+++ b/arch/powerpc/include/asm/setup.h
@@ -76,6 +76,13 @@ static inline void setup_spectre_v2(void) {}
 #endif
 void __init do_btb_flush_fixups(void);
 
+#ifdef CONFIG_PPC32
+unsigned long __init early_init(unsigned long dt_ptr);
+void __init machine_init(u64 dt_ptr);
+#endif
+void __init early_setup(unsigned long dt_ptr);
+void early_setup_secondary(void);
+
 #endif /* !__ASSEMBLY__ */
 
 #endif	/* _ASM_POWERPC_SETUP_H */
diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index 007332a4a732..60ab739a5e3b 100644
--- a/arch/powerpc/include/asm/smp.h
+++ b/arch/powerpc/include/asm/smp.h
@@ -60,6 +60,9 @@ struct smp_ops_t {
 #endif
 };
 
+extern struct task_struct *secondary_current;
+
+void start_secondary(void *unused);
 extern int smp_send_nmi_ipi(int cpu, void (*fn)(struct pt_regs *), u64 delay_us);
 extern int smp_send_safe_nmi_ipi(int cpu, void (*fn)(struct pt_regs *), u64 delay_us);
 extern void smp_send_debugger_break(void);
diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/asm/syscalls.h
index 7ee66ae5444d..a2b13e55254f 100644
--- a/arch/powerpc/include/asm/syscalls.h
+++ b/arch/powerpc/include/asm/syscalls.h
@@ -18,6 +18,10 @@ asmlinkage long sys_mmap2(unsigned long addr, size_t len,
 		unsigned long fd, unsigned long pgoff);
 asmlinkage long ppc64_personality(unsigned long personality);
 asmlinkage long sys_rtas(struct rtas_args __user *uargs);
+int ppc_select(int n, fd_set __user *inp, fd_set __user *outp,
+	       fd_set __user *exp, struct __kernel_old_timeval __user *tvp);
+long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
+		      u32 len_high, u32 len_low);
 
 #ifdef CONFIG_COMPAT
 unsigned long compat_sys_mmap2(unsigned long addr, size_t len,
diff --git a/arch/powerpc/kernel/early_32.c b/arch/powerpc/kernel/early_32.c
index ef2ad4945904..03f1135ef64f 100644
--- a/arch/powerpc/kernel/early_32.c
+++ b/arch/powerpc/kernel/early_32.c
@@ -8,7 +8,6 @@
 #include <linux/kernel.h>
 #include <asm/setup.h>
 #include <asm/sections.h>
-#include <asm/asm-prototypes.h>
 
 /*
  * We're called here very early in the boot.
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 7cd6ce3ec423..784ea3289c84 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -5,7 +5,6 @@
 #include <linux/compat.h>
 #include <linux/sched/debug.h> /* for show_regs */
 
-#include <asm/asm-prototypes.h>
 #include <asm/kup.h>
 #include <asm/cputime.h>
 #include <asm/hw_irq.h>
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 2cf31a97126c..752fb182eacb 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -64,7 +64,6 @@
 #include <asm/udbg.h>
 #include <asm/smp.h>
 #include <asm/livepatch.h>
-#include <asm/asm-prototypes.h>
 #include <asm/hw_irq.h>
 #include <asm/softirq_stack.h>
 
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 2503dd4713b9..a29c0a65d03b 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -24,7 +24,6 @@
 #include <asm/machdep.h>
 #include <asm/mce.h>
 #include <asm/nmi.h>
-#include <asm/asm-prototypes.h>
 
 #include "setup.h"
 
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 0ac5faacc909..3b49065daf21 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -41,7 +41,6 @@
 #include <asm/btext.h>
 #include <asm/sections.h>
 #include <asm/machdep.h>
-#include <asm/asm-prototypes.h>
 #include <asm/ultravisor-api.h>
 
 #include <linux/linux_logo.h>
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index c43f77e2ac31..6a9272433d99 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -22,7 +22,6 @@
 #include <linux/syscalls.h>
 
 #include <asm/switch_to.h>
-#include <asm/asm-prototypes.h>
 #include <asm/debug.h>
 
 #define CREATE_TRACE_POINTS
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index be8577ac9397..e547066a06aa 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -67,7 +67,6 @@
 #include <asm/kup.h>
 #include <asm/early_ioremap.h>
 #include <asm/pgalloc.h>
-#include <asm/asm-prototypes.h>
 
 #include "setup.h"
 
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 7e30a6fe5adf..de0f6f09a5dd 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -57,7 +57,6 @@
 #include <asm/vdso.h>
 #include <asm/debug.h>
 #include <asm/kexec.h>
-#include <asm/asm-prototypes.h>
 #include <asm/cpu_has_feature.h>
 #include <asm/ftrace.h>
 #include <asm/kup.h>
diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
index 825931e400df..c4f5b4ce926f 100644
--- a/arch/powerpc/kernel/syscalls.c
+++ b/arch/powerpc/kernel/syscalls.c
@@ -35,7 +35,6 @@
 #include <asm/syscalls.h>
 #include <asm/time.h>
 #include <asm/unistd.h>
-#include <asm/asm-prototypes.h>
 
 static inline long do_mmap2(unsigned long addr, size_t len,
 			unsigned long prot, unsigned long flags,
diff --git a/arch/powerpc/kernel/tau_6xx.c b/arch/powerpc/kernel/tau_6xx.c
index 8e83d19fe8fa..828d0f4106d2 100644
--- a/arch/powerpc/kernel/tau_6xx.c
+++ b/arch/powerpc/kernel/tau_6xx.c
@@ -29,7 +29,6 @@
 #include <asm/cache.h>
 #include <asm/8xx_immap.h>
 #include <asm/machdep.h>
-#include <asm/asm-prototypes.h>
 
 #include "setup.h"
 
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index cd0b8b71ecdd..54f70943a874 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -69,7 +69,6 @@
 #include <asm/smp.h>
 #include <asm/vdso_datapage.h>
 #include <asm/firmware.h>
-#include <asm/asm-prototypes.h>
 
 /* powerpc clocksource/clockevent code */
 
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index f21b8fbd418e..4ee04aacf9f1 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -22,7 +22,6 @@
 #include <linux/init.h>
 #include <linux/list.h>
 
-#include <asm/asm-prototypes.h>
 #include <asm/cacheflush.h>
 #include <asm/code-patching.h>
 #include <asm/ftrace.h>
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 2d49dce129f2..6cc7793b8420 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -28,7 +28,6 @@
 #include <asm/prom.h>
 #include <asm/smp.h>
 #include <asm/hw_breakpoint.h>
-#include <asm/asm-prototypes.h>
 #include <asm/svm.h>
 #include <asm/ultravisor.h>
 
diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index 7d6d91338c3f..7e52d0beee77 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -15,7 +15,6 @@
 #include <linux/cma.h>
 #include <linux/bitops.h>
 
-#include <asm/asm-prototypes.h>
 #include <asm/cputable.h>
 #include <asm/interrupt.h>
 #include <asm/kvm_ppc.h>
diff --git a/arch/powerpc/kvm/book3s_hv_rm_xive.c b/arch/powerpc/kvm/book3s_hv_rm_xive.c
index 6f18632e30e9..dd9880731bd6 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_xive.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_xive.c
@@ -16,7 +16,6 @@
 #include <asm/pnv-pci.h>
 #include <asm/opal.h>
 #include <asm/smp.h>
-#include <asm/asm-prototypes.h>
 #include <asm/xive.h>
 #include <asm/xive-regs.h>
 
diff --git a/arch/powerpc/lib/vmx-helper.c b/arch/powerpc/lib/vmx-helper.c
index 62e6c3045252..f76a50291fd7 100644
--- a/arch/powerpc/lib/vmx-helper.c
+++ b/arch/powerpc/lib/vmx-helper.c
@@ -9,7 +9,6 @@
 #include <linux/uaccess.h>
 #include <linux/hardirq.h>
 #include <asm/switch_to.h>
-#include <asm/asm-prototypes.h>
 
 int enter_vmx_usercopy(void)
 {
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index 31f4cef3adac..81091b9587f6 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -9,7 +9,6 @@
  * Copyright (C) 2002 Anton Blanchard <anton@au.ibm.com>, IBM
  */
 
-#include <asm/asm-prototypes.h>
 #include <asm/interrupt.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index eb8ecd7343a9..a11e432b8c4c 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -35,7 +35,6 @@
 #include <linux/kfence.h>
 #include <linux/pkeys.h>
 
-#include <asm/asm-prototypes.h>
 #include <asm/firmware.h>
 #include <asm/interrupt.h>
 #include <asm/page.h>
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 9942289f379b..a6677a111aca 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -12,7 +12,6 @@
 #include <linux/device.h>
 #include <linux/cpu.h>
 
-#include <asm/asm-prototypes.h>
 #include <asm/firmware.h>
 #include <asm/interrupt.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/platforms/powernv/opal-tracepoints.c b/arch/powerpc/platforms/powernv/opal-tracepoints.c
index f16a43540e30..91b36541b9e5 100644
--- a/arch/powerpc/platforms/powernv/opal-tracepoints.c
+++ b/arch/powerpc/platforms/powernv/opal-tracepoints.c
@@ -2,7 +2,6 @@
 #include <linux/percpu.h>
 #include <linux/jump_label.h>
 #include <asm/trace.h>
-#include <asm/asm-prototypes.h>
 
 #ifdef CONFIG_JUMP_LABEL
 struct static_key opal_tracepoint_key = STATIC_KEY_INIT;
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index f8899d506ea4..760581c5752f 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -40,7 +40,6 @@
 #include <asm/plpar_wrappers.h>
 #include <asm/kexec.h>
 #include <asm/fadump.h>
-#include <asm/asm-prototypes.h>
 #include <asm/dtl.h>
 
 #include "pseries.h"
-- 
2.34.1

