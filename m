Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5975B2044DD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 01:59:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rRFy05ntzDqYn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 09:59:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ubuntu.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=christian.brauner@ubuntu.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ubuntu.com
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rR0q1Sp2zDqWZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 09:47:39 +1000 (AEST)
Received: from ip5f5af08c.dynamic.kabel-deutschland.de ([95.90.240.140]
 helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1jnW8l-0005DO-Tt; Mon, 22 Jun 2020 23:46:16 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 17/17] arch: rename copy_thread_tls() back to copy_thread()
Date: Tue, 23 Jun 2020 01:43:26 +0200
Message-Id: <20200622234326.906346-18-christian.brauner@ubuntu.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622234326.906346-1-christian.brauner@ubuntu.com>
References: <20200622234326.906346-1-christian.brauner@ubuntu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 Jun 2020 09:56:23 +1000
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
Cc: linux-riscv@lists.infradead.org, Rich Felker <dalias@libc.org>,
 linux-sh@vger.kernel.org, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, linux-xtensa@linux-xtensa.org,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-parisc@vger.kernel.org,
 Mark Salter <msalter@redhat.com>, linux-csky@vger.kernel.org,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, Fenghua Yu <fenghua.yu@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Jeff Dike <jdike@addtoit.com>, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Weinberger <richard@nod.at>, Paul Mackerras <paulus@samba.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that HAVE_COPY_THREAD_TLS has been removed, rename copy_thread_tls()
back simply copy_thread(). It's a simpler name, and doesn't imply that only
tls is copied here. This finishes an outstanding chunk of internal process
creation work since we've added clone3().

Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Salter <msalter@redhat.com>
Cc: Aurelien Jacquiot <jacquiot.aurelien@gmail.com>
Cc: Guo Ren <guoren@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Brian Cain <bcain@codeaurora.org>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michal Simek <monstr@monstr.eu>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Nick Hu <nickhu@andestech.com>
Cc: Greentime Hu <green.hu@gmail.com>
Cc: Vincent Chen <deanbo422@gmail.com>
Cc: Ley Foon Tan <ley.foon.tan@intel.com>
Cc: Jonas Bonn <jonas@southpole.se>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Stafford Horne <shorne@gmail.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Rich Felker <dalias@libc.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jeff Dike <jdike@addtoit.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Guan Xuetao <gxt@pku.edu.cn>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Chris Zankel <chris@zankel.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-c6x-dev@linux-c6x.org
Cc: linux-csky@vger.kernel.org
Cc: uclinux-h8-devel@lists.sourceforge.jp
Cc: linux-hexagon@vger.kernel.org
Cc: linux-ia64@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: openrisc@lists.librecores.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-um@lists.infradead.org
Cc: linux-xtensa@linux-xtensa.org
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
 arch/alpha/kernel/process.c      | 2 +-
 arch/arc/kernel/process.c        | 2 +-
 arch/arm/kernel/process.c        | 2 +-
 arch/arm64/kernel/process.c      | 2 +-
 arch/c6x/kernel/process.c        | 2 +-
 arch/csky/kernel/process.c       | 2 +-
 arch/h8300/kernel/process.c      | 2 +-
 arch/hexagon/kernel/process.c    | 2 +-
 arch/ia64/kernel/process.c       | 4 ++--
 arch/m68k/kernel/process.c       | 2 +-
 arch/microblaze/kernel/process.c | 2 +-
 arch/mips/kernel/process.c       | 2 +-
 arch/nds32/kernel/process.c      | 2 +-
 arch/nios2/kernel/process.c      | 2 +-
 arch/openrisc/kernel/process.c   | 4 ++--
 arch/parisc/kernel/process.c     | 2 +-
 arch/powerpc/kernel/process.c    | 2 +-
 arch/riscv/kernel/process.c      | 2 +-
 arch/s390/kernel/process.c       | 2 +-
 arch/sh/kernel/process_32.c      | 2 +-
 arch/sparc/kernel/process.c      | 6 +++---
 arch/sparc/kernel/process_32.c   | 2 +-
 arch/sparc/kernel/process_64.c   | 2 +-
 arch/um/kernel/process.c         | 2 +-
 arch/unicore32/kernel/process.c  | 2 +-
 arch/x86/kernel/process.c        | 2 +-
 arch/x86/kernel/unwind_frame.c   | 2 +-
 arch/xtensa/kernel/process.c     | 2 +-
 include/linux/sched/task.h       | 2 +-
 kernel/fork.c                    | 2 +-
 30 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index dfdb6b6ba61c..bce96ddaf2fc 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -233,7 +233,7 @@ release_thread(struct task_struct *dead_task)
 /*
  * Copy architecture-specific thread state
  */
-int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
+int copy_thread(unsigned long clone_flags, unsigned long usp,
 		    unsigned long kthread_arg, struct task_struct *p,
 		    unsigned long tls)
 {
diff --git a/arch/arc/kernel/process.c b/arch/arc/kernel/process.c
index 8c8e5172fecd..5b6995c823a6 100644
--- a/arch/arc/kernel/process.c
+++ b/arch/arc/kernel/process.c
@@ -173,7 +173,7 @@ asmlinkage void ret_from_fork(void);
  * |    user_r25    |
  * ------------------  <===== END of PAGE
  */
-int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
+int copy_thread(unsigned long clone_flags, unsigned long usp,
 	unsigned long kthread_arg, struct task_struct *p, unsigned long tls)
 {
 	struct pt_regs *c_regs;        /* child's pt_regs */
diff --git a/arch/arm/kernel/process.c b/arch/arm/kernel/process.c
index 58eaa1f60e16..038669071f9a 100644
--- a/arch/arm/kernel/process.c
+++ b/arch/arm/kernel/process.c
@@ -226,7 +226,7 @@ void release_thread(struct task_struct *dead_task)
 asmlinkage void ret_from_fork(void) __asm__("ret_from_fork");
 
 int
-copy_thread_tls(unsigned long clone_flags, unsigned long stack_start,
+copy_thread(unsigned long clone_flags, unsigned long stack_start,
 	    unsigned long stk_sz, struct task_struct *p, unsigned long tls)
 {
 	struct thread_info *thread = task_thread_info(p);
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 6089638c7d43..84ec630b8ab5 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -375,7 +375,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 
 asmlinkage void ret_from_fork(void) asm("ret_from_fork");
 
-int copy_thread_tls(unsigned long clone_flags, unsigned long stack_start,
+int copy_thread(unsigned long clone_flags, unsigned long stack_start,
 		unsigned long stk_sz, struct task_struct *p, unsigned long tls)
 {
 	struct pt_regs *childregs = task_pt_regs(p);
diff --git a/arch/c6x/kernel/process.c b/arch/c6x/kernel/process.c
index afa3ea9a93aa..aee49fb0a5eb 100644
--- a/arch/c6x/kernel/process.c
+++ b/arch/c6x/kernel/process.c
@@ -104,7 +104,7 @@ void start_thread(struct pt_regs *regs, unsigned int pc, unsigned long usp)
 /*
  * Copy a new thread context in its stack.
  */
-int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
+int copy_thread(unsigned long clone_flags, unsigned long usp,
 		    unsigned long ustk_size, struct task_struct *p,
 		    unsigned long tls)
 {
diff --git a/arch/csky/kernel/process.c b/arch/csky/kernel/process.c
index 8b3fad062ab2..28cfeaaf902a 100644
--- a/arch/csky/kernel/process.c
+++ b/arch/csky/kernel/process.c
@@ -40,7 +40,7 @@ unsigned long thread_saved_pc(struct task_struct *tsk)
 	return sw->r15;
 }
 
-int copy_thread_tls(unsigned long clone_flags,
+int copy_thread(unsigned long clone_flags,
 		unsigned long usp,
 		unsigned long kthread_arg,
 		struct task_struct *p,
diff --git a/arch/h8300/kernel/process.c b/arch/h8300/kernel/process.c
index ae23de4dcf42..665c3d98c43e 100644
--- a/arch/h8300/kernel/process.c
+++ b/arch/h8300/kernel/process.c
@@ -105,7 +105,7 @@ void flush_thread(void)
 {
 }
 
-int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
+int copy_thread(unsigned long clone_flags, unsigned long usp,
 		    unsigned long topstk, struct task_struct *p,
 		    unsigned long tls)
 {
diff --git a/arch/hexagon/kernel/process.c b/arch/hexagon/kernel/process.c
index d756f9556dd7..e5c3ce019dcf 100644
--- a/arch/hexagon/kernel/process.c
+++ b/arch/hexagon/kernel/process.c
@@ -50,7 +50,7 @@ void arch_cpu_idle(void)
 /*
  * Copy architecture-specific thread state
  */
-int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
+int copy_thread(unsigned long clone_flags, unsigned long usp,
 		    unsigned long arg, struct task_struct *p, unsigned long tls)
 {
 	struct thread_info *ti = task_thread_info(p);
diff --git a/arch/ia64/kernel/process.c b/arch/ia64/kernel/process.c
index 416dca619da5..6e1b076d1dcf 100644
--- a/arch/ia64/kernel/process.c
+++ b/arch/ia64/kernel/process.c
@@ -311,7 +311,7 @@ ia64_load_extra (struct task_struct *task)
  *	<clone syscall>	        <some kernel call frames>
  *	sys_clone		   :
  *	_do_fork		_do_fork
- *	copy_thread_tls		copy_thread_tls
+ *	copy_thread		copy_thread
  *
  * This means that the stack layout is as follows:
  *
@@ -333,7 +333,7 @@ ia64_load_extra (struct task_struct *task)
  * so there is nothing to worry about.
  */
 int
-copy_thread_tls(unsigned long clone_flags, unsigned long user_stack_base,
+copy_thread(unsigned long clone_flags, unsigned long user_stack_base,
 		    unsigned long user_stack_size, struct task_struct *p,
 		    unsigned long tls)
 {
diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index 0608439ba452..387c299838e7 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -138,7 +138,7 @@ asmlinkage int m68k_clone3(struct pt_regs *regs)
 	return sys_clone3((struct clone_args __user *)regs->d1, regs->d2);
 }
 
-int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
+int copy_thread(unsigned long clone_flags, unsigned long usp,
 		    unsigned long arg, struct task_struct *p,
 		    unsigned long tls)
 {
diff --git a/arch/microblaze/kernel/process.c b/arch/microblaze/kernel/process.c
index c2ca9c326510..7206600fa6cd 100644
--- a/arch/microblaze/kernel/process.c
+++ b/arch/microblaze/kernel/process.c
@@ -54,7 +54,7 @@ void flush_thread(void)
 {
 }
 
-int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
+int copy_thread(unsigned long clone_flags, unsigned long usp,
 		    unsigned long arg, struct task_struct *p, unsigned long tls)
 {
 	struct pt_regs *childregs = task_pt_regs(p);
diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index ff5320b79100..f090b56ba3f2 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -119,7 +119,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 /*
  * Copy architecture-specific thread state
  */
-int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
+int copy_thread(unsigned long clone_flags, unsigned long usp,
 	unsigned long kthread_arg, struct task_struct *p, unsigned long tls)
 {
 	struct thread_info *ti = task_thread_info(p);
diff --git a/arch/nds32/kernel/process.c b/arch/nds32/kernel/process.c
index 7dbb1bf64165..1020e2c6dcd8 100644
--- a/arch/nds32/kernel/process.c
+++ b/arch/nds32/kernel/process.c
@@ -149,7 +149,7 @@ void flush_thread(void)
 DEFINE_PER_CPU(struct task_struct *, __entry_task);
 
 asmlinkage void ret_from_fork(void) __asm__("ret_from_fork");
-int copy_thread_tls(unsigned long clone_flags, unsigned long stack_start,
+int copy_thread(unsigned long clone_flags, unsigned long stack_start,
 		    unsigned long stk_sz, struct task_struct *p,
 		    unsigned long tls)
 {
diff --git a/arch/nios2/kernel/process.c b/arch/nios2/kernel/process.c
index 3dde4d6d8fbe..a6d5b158167b 100644
--- a/arch/nios2/kernel/process.c
+++ b/arch/nios2/kernel/process.c
@@ -100,7 +100,7 @@ void flush_thread(void)
 {
 }
 
-int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
+int copy_thread(unsigned long clone_flags, unsigned long usp,
 		    unsigned long arg, struct task_struct *p, unsigned long tls)
 {
 	struct pt_regs *childregs = task_pt_regs(p);
diff --git a/arch/openrisc/kernel/process.c b/arch/openrisc/kernel/process.c
index d7010e72450c..19045a3efb8a 100644
--- a/arch/openrisc/kernel/process.c
+++ b/arch/openrisc/kernel/process.c
@@ -116,7 +116,7 @@ void release_thread(struct task_struct *dead_task)
 extern asmlinkage void ret_from_fork(void);
 
 /*
- * copy_thread_tls
+ * copy_thread
  * @clone_flags: flags
  * @usp: user stack pointer or fn for kernel thread
  * @arg: arg to fn for kernel thread; always NULL for userspace thread
@@ -147,7 +147,7 @@ extern asmlinkage void ret_from_fork(void);
  */
 
 int
-copy_thread_tls(unsigned long clone_flags, unsigned long usp,
+copy_thread(unsigned long clone_flags, unsigned long usp,
 		unsigned long arg, struct task_struct *p, unsigned long tls)
 {
 	struct pt_regs *userregs;
diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index b7abb12edd3a..de6299ff1530 100644
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -208,7 +208,7 @@ arch_initcall(parisc_idle_init);
  * Copy architecture-specific thread state
  */
 int
-copy_thread_tls(unsigned long clone_flags, unsigned long usp,
+copy_thread(unsigned long clone_flags, unsigned long usp,
 	    unsigned long kthread_arg, struct task_struct *p, unsigned long tls)
 {
 	struct pt_regs *cregs = &(p->thread.regs);
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 4650b9bb217f..794b754deec2 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1593,7 +1593,7 @@ static void setup_ksp_vsid(struct task_struct *p, unsigned long sp)
 /*
  * Copy architecture-specific thread state
  */
-int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
+int copy_thread(unsigned long clone_flags, unsigned long usp,
 		unsigned long kthread_arg, struct task_struct *p,
 		unsigned long tls)
 {
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 824d117cf202..d8a79b3d16ea 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -101,7 +101,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
-int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
+int copy_thread(unsigned long clone_flags, unsigned long usp,
 	unsigned long arg, struct task_struct *p, unsigned long tls)
 {
 	struct pt_regs *childregs = task_pt_regs(p);
diff --git a/arch/s390/kernel/process.c b/arch/s390/kernel/process.c
index eb6e23ad15a2..60582e83104b 100644
--- a/arch/s390/kernel/process.c
+++ b/arch/s390/kernel/process.c
@@ -80,7 +80,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
-int copy_thread_tls(unsigned long clone_flags, unsigned long new_stackp,
+int copy_thread(unsigned long clone_flags, unsigned long new_stackp,
 		    unsigned long arg, struct task_struct *p, unsigned long tls)
 {
 	struct fake_frame
diff --git a/arch/sh/kernel/process_32.c b/arch/sh/kernel/process_32.c
index 537a82d80616..ea8d7548ba95 100644
--- a/arch/sh/kernel/process_32.c
+++ b/arch/sh/kernel/process_32.c
@@ -115,7 +115,7 @@ EXPORT_SYMBOL(dump_fpu);
 asmlinkage void ret_from_fork(void);
 asmlinkage void ret_from_kernel_thread(void);
 
-int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
+int copy_thread(unsigned long clone_flags, unsigned long usp,
 		    unsigned long arg, struct task_struct *p, unsigned long tls)
 {
 	struct thread_info *ti = task_thread_info(p);
diff --git a/arch/sparc/kernel/process.c b/arch/sparc/kernel/process.c
index 8bbe62d77b77..5234b5ccc0b9 100644
--- a/arch/sparc/kernel/process.c
+++ b/arch/sparc/kernel/process.c
@@ -28,7 +28,7 @@ asmlinkage long sparc_fork(struct pt_regs *regs)
 	ret = _do_fork(&args);
 
 	/* If we get an error and potentially restart the system
-	 * call, we're screwed because copy_thread_tls() clobbered
+	 * call, we're screwed because copy_thread() clobbered
 	 * the parent's %o1.  So detect that case and restore it
 	 * here.
 	 */
@@ -53,7 +53,7 @@ asmlinkage long sparc_vfork(struct pt_regs *regs)
 	ret = _do_fork(&args);
 
 	/* If we get an error and potentially restart the system
-	 * call, we're screwed because copy_thread_tls() clobbered
+	 * call, we're screwed because copy_thread() clobbered
 	 * the parent's %o1.  So detect that case and restore it
 	 * here.
 	 */
@@ -99,7 +99,7 @@ asmlinkage long sparc_clone(struct pt_regs *regs)
 	ret = _do_fork(&args);
 
 	/* If we get an error and potentially restart the system
-	 * call, we're screwed because copy_thread_tls() clobbered
+	 * call, we're screwed because copy_thread() clobbered
 	 * the parent's %o1.  So detect that case and restore it
 	 * here.
 	 */
diff --git a/arch/sparc/kernel/process_32.c b/arch/sparc/kernel/process_32.c
index 3e1f7b639e9a..a9c2f6c2ab51 100644
--- a/arch/sparc/kernel/process_32.c
+++ b/arch/sparc/kernel/process_32.c
@@ -273,7 +273,7 @@ clone_stackframe(struct sparc_stackf __user *dst,
 extern void ret_from_fork(void);
 extern void ret_from_kernel_thread(void);
 
-int copy_thread_tls(unsigned long clone_flags, unsigned long sp,
+int copy_thread(unsigned long clone_flags, unsigned long sp,
 		    unsigned long arg, struct task_struct *p,
 		    unsigned long tls)
 {
diff --git a/arch/sparc/kernel/process_64.c b/arch/sparc/kernel/process_64.c
index 278bf287c4be..6e4aca295e25 100644
--- a/arch/sparc/kernel/process_64.c
+++ b/arch/sparc/kernel/process_64.c
@@ -577,7 +577,7 @@ void fault_in_user_windows(struct pt_regs *regs)
  * Parent -->  %o0 == childs  pid, %o1 == 0
  * Child  -->  %o0 == parents pid, %o1 == 1
  */
-int copy_thread_tls(unsigned long clone_flags, unsigned long sp,
+int copy_thread(unsigned long clone_flags, unsigned long sp,
 		    unsigned long arg, struct task_struct *p,
 		    unsigned long tls)
 {
diff --git a/arch/um/kernel/process.c b/arch/um/kernel/process.c
index e3a2cf92a373..26b5e243d3fc 100644
--- a/arch/um/kernel/process.c
+++ b/arch/um/kernel/process.c
@@ -152,7 +152,7 @@ void fork_handler(void)
 	userspace(&current->thread.regs.regs, current_thread_info()->aux_fp_regs);
 }
 
-int copy_thread_tls(unsigned long clone_flags, unsigned long sp,
+int copy_thread(unsigned long clone_flags, unsigned long sp,
 		unsigned long arg, struct task_struct * p, unsigned long tls)
 {
 	void (*handler)(void);
diff --git a/arch/unicore32/kernel/process.c b/arch/unicore32/kernel/process.c
index 49a305565a53..660a646cfdf7 100644
--- a/arch/unicore32/kernel/process.c
+++ b/arch/unicore32/kernel/process.c
@@ -219,7 +219,7 @@ void release_thread(struct task_struct *dead_task)
 asmlinkage void ret_from_fork(void) __asm__("ret_from_fork");
 asmlinkage void ret_from_kernel_thread(void) __asm__("ret_from_kernel_thread");
 
-int copy_thread_tls(unsigned long clone_flags, unsigned long stack_start,
+int copy_thread(unsigned long clone_flags, unsigned long stack_start,
 		    unsigned long stk_sz, struct task_struct *p,
 		    unsigned long tls)
 {
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index f362ce0d5ac0..47d369ce831d 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -121,7 +121,7 @@ static int set_new_tls(struct task_struct *p, unsigned long tls)
 		return do_set_thread_area_64(p, ARCH_SET_FS, tls);
 }
 
-int copy_thread_tls(unsigned long clone_flags, unsigned long sp,
+int copy_thread(unsigned long clone_flags, unsigned long sp,
 		    unsigned long arg, struct task_struct *p, unsigned long tls)
 {
 	struct inactive_task_frame *frame;
diff --git a/arch/x86/kernel/unwind_frame.c b/arch/x86/kernel/unwind_frame.c
index 722a85f3b2dd..3070fd6561be 100644
--- a/arch/x86/kernel/unwind_frame.c
+++ b/arch/x86/kernel/unwind_frame.c
@@ -269,7 +269,7 @@ bool unwind_next_frame(struct unwind_state *state)
 		/*
 		 * kthreads (other than the boot CPU's idle thread) have some
 		 * partial regs at the end of their stack which were placed
-		 * there by copy_thread_tls().  But the regs don't have any
+		 * there by copy_thread().  But the regs don't have any
 		 * useful information, so we can skip them.
 		 *
 		 * This user_mode() check is slightly broader than a PF_KTHREAD
diff --git a/arch/xtensa/kernel/process.c b/arch/xtensa/kernel/process.c
index b7fe6f443b42..397a7de56377 100644
--- a/arch/xtensa/kernel/process.c
+++ b/arch/xtensa/kernel/process.c
@@ -201,7 +201,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
  * involved.  Much simpler to just not copy those live frames across.
  */
 
-int copy_thread_tls(unsigned long clone_flags, unsigned long usp_thread_fn,
+int copy_thread(unsigned long clone_flags, unsigned long usp_thread_fn,
 		unsigned long thread_fn_arg, struct task_struct *p,
 		unsigned long tls)
 {
diff --git a/include/linux/sched/task.h b/include/linux/sched/task.h
index 77cbe14c3034..209a11c141ca 100644
--- a/include/linux/sched/task.h
+++ b/include/linux/sched/task.h
@@ -65,7 +65,7 @@ extern void fork_init(void);
 
 extern void release_task(struct task_struct * p);
 
-extern int copy_thread_tls(unsigned long, unsigned long, unsigned long,
+extern int copy_thread(unsigned long, unsigned long, unsigned long,
 			struct task_struct *, unsigned long);
 
 extern void flush_thread(void);
diff --git a/kernel/fork.c b/kernel/fork.c
index 8e52e16a1b5e..eaeaf224fd43 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2104,7 +2104,7 @@ static __latent_entropy struct task_struct *copy_process(
 	retval = copy_io(clone_flags, p);
 	if (retval)
 		goto bad_fork_cleanup_namespaces;
-	retval = copy_thread_tls(clone_flags, args->stack, args->stack_size, p,
+	retval = copy_thread(clone_flags, args->stack, args->stack_size, p,
 				 args->tls);
 	if (retval)
 		goto bad_fork_cleanup_io;
-- 
2.27.0

