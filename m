Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3034B89B8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 14:23:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzJYb5Xnbz3cks
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 00:23:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KuFPO1lF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KuFPO1lF; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzJRF5qDbz3cmk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 00:17:45 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F31A616B7;
 Wed, 16 Feb 2022 13:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EE9AC004E1;
 Wed, 16 Feb 2022 13:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645017464;
 bh=2V/jchBP8kBRIT0s1XOrHdI0jJSQB1mfHKldiUel4c8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KuFPO1lFLaWvnXAnPRSPXDKFqb7rJ5xDcxE3HOkEkh9mpGyy2aBpcXuJFHyP2BdoZ
 iIp4jmx03VzbvjY3jDx2mjcAGWZ3M6b6KGO1G7/x3hr1VZyZUWQyAaOuIO6LczuG3t
 s3iHx0UgID4/K2IxZ+OKZBRd7zsoJb5hOURmNwJqU0plIAWdvYpmL3HekEpFCVAMfr
 8WnO33IK+foc6PCI93ZQtqdAVfWmZsvEAd6G74UkXXzBrCyN8rQw5fAx9YmeYApaD7
 +fwr8gc1dQ2Qw7KQuvm+3OcUmMsSGeZekIVcm/zvfN+x6o1AbHZuhJFFncpqvvxDOX
 kweEeDF9oCwgA==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Subject: [PATCH v2 12/18] uaccess: fix type mismatch warnings from access_ok()
Date: Wed, 16 Feb 2022 14:13:26 +0100
Message-Id: <20220216131332.1489939-13-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220216131332.1489939-1-arnd@kernel.org>
References: <20220216131332.1489939-1-arnd@kernel.org>
MIME-Version: 1.0
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, jcmvbkbc@gmail.com,
 guoren@kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, will@kernel.org, ardb@kernel.org,
 linux-s390@vger.kernel.org, kernel test robot <lkp@intel.com>,
 bcain@codeaurora.org, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk,
 linux-csky@vger.kernel.org, mingo@redhat.com, geert@linux-m68k.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 hca@linux.ibm.com, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 green.hu@gmail.com, shorne@gmail.com, monstr@monstr.eu,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, nickhu@andestech.com,
 linux-mips@vger.kernel.org, dinguyen@kernel.org, ebiederm@xmission.com,
 richard@nod.at, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

On some architectures, access_ok() does not do any argument type
checking, so replacing the definition with a generic one causes
a few warnings for harmless issues that were never caught before.

Fix the ones that I found either through my own test builds or
that were reported by the 0-day bot.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arc/kernel/process.c           |  2 +-
 arch/arm/kernel/swp_emulate.c       |  2 +-
 arch/arm/kernel/traps.c             |  2 +-
 arch/csky/kernel/signal.c           |  2 +-
 arch/mips/sibyte/common/sb_tbprof.c |  6 +++---
 arch/nios2/kernel/signal.c          | 20 +++++++++++---------
 arch/powerpc/lib/sstep.c            |  4 ++--
 arch/riscv/kernel/perf_callchain.c  |  2 +-
 arch/sparc/kernel/signal_32.c       |  2 +-
 lib/test_lockup.c                   |  4 ++--
 10 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/arch/arc/kernel/process.c b/arch/arc/kernel/process.c
index 8e90052f6f05..5f7f5aab361f 100644
--- a/arch/arc/kernel/process.c
+++ b/arch/arc/kernel/process.c
@@ -43,7 +43,7 @@ SYSCALL_DEFINE0(arc_gettls)
 	return task_thread_info(current)->thr_ptr;
 }
 
-SYSCALL_DEFINE3(arc_usr_cmpxchg, int *, uaddr, int, expected, int, new)
+SYSCALL_DEFINE3(arc_usr_cmpxchg, int __user *, uaddr, int, expected, int, new)
 {
 	struct pt_regs *regs = current_pt_regs();
 	u32 uval;
diff --git a/arch/arm/kernel/swp_emulate.c b/arch/arm/kernel/swp_emulate.c
index 6166ba38bf99..b74bfcf94fb1 100644
--- a/arch/arm/kernel/swp_emulate.c
+++ b/arch/arm/kernel/swp_emulate.c
@@ -195,7 +195,7 @@ static int swp_handler(struct pt_regs *regs, unsigned int instr)
 		 destreg, EXTRACT_REG_NUM(instr, RT2_OFFSET), data);
 
 	/* Check access in reasonable access range for both SWP and SWPB */
-	if (!access_ok((address & ~3), 4)) {
+	if (!access_ok((void __user *)(address & ~3), 4)) {
 		pr_debug("SWP{B} emulation: access to %p not allowed!\n",
 			 (void *)address);
 		res = -EFAULT;
diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
index da04ed85855a..26c8c8276297 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -576,7 +576,7 @@ do_cache_op(unsigned long start, unsigned long end, int flags)
 	if (end < start || flags)
 		return -EINVAL;
 
-	if (!access_ok(start, end - start))
+	if (!access_ok((void __user *)start, end - start))
 		return -EFAULT;
 
 	return __do_cache_op(start, end);
diff --git a/arch/csky/kernel/signal.c b/arch/csky/kernel/signal.c
index c7b763d2f526..8867ddf3e6c7 100644
--- a/arch/csky/kernel/signal.c
+++ b/arch/csky/kernel/signal.c
@@ -136,7 +136,7 @@ static inline void __user *get_sigframe(struct ksignal *ksig,
 static int
 setup_rt_frame(struct ksignal *ksig, sigset_t *set, struct pt_regs *regs)
 {
-	struct rt_sigframe *frame;
+	struct rt_sigframe __user *frame;
 	int err = 0;
 
 	frame = get_sigframe(ksig, regs, sizeof(*frame));
diff --git a/arch/mips/sibyte/common/sb_tbprof.c b/arch/mips/sibyte/common/sb_tbprof.c
index f80d7a710333..01d00b87d0f5 100644
--- a/arch/mips/sibyte/common/sb_tbprof.c
+++ b/arch/mips/sibyte/common/sb_tbprof.c
@@ -437,13 +437,13 @@ static int sbprof_tb_release(struct inode *inode, struct file *filp)
 	return 0;
 }
 
-static ssize_t sbprof_tb_read(struct file *filp, char *buf,
+static ssize_t sbprof_tb_read(struct file *filp, char __user *buf,
 			      size_t size, loff_t *offp)
 {
 	int cur_sample, sample_off, cur_count, sample_left;
 	char *src;
 	int   count   =	 0;
-	char *dest    =	 buf;
+	char __user *dest = buf;
 	long  cur_off = *offp;
 
 	if (!access_ok(buf, size))
@@ -512,7 +512,7 @@ static long sbprof_tb_ioctl(struct file *filp,
 		if (err)
 			break;
 
-		err = put_user(TB_FULL, (int *) arg);
+		err = put_user(TB_FULL, (int __user *) arg);
 		break;
 	}
 
diff --git a/arch/nios2/kernel/signal.c b/arch/nios2/kernel/signal.c
index 2009ae2d3c3b..386e46443b60 100644
--- a/arch/nios2/kernel/signal.c
+++ b/arch/nios2/kernel/signal.c
@@ -36,10 +36,10 @@ struct rt_sigframe {
 
 static inline int rt_restore_ucontext(struct pt_regs *regs,
 					struct switch_stack *sw,
-					struct ucontext *uc, int *pr2)
+					struct ucontext __user *uc, int *pr2)
 {
 	int temp;
-	unsigned long *gregs = uc->uc_mcontext.gregs;
+	unsigned long __user *gregs = uc->uc_mcontext.gregs;
 	int err;
 
 	/* Always make any pending restarted system calls return -EINTR */
@@ -102,10 +102,11 @@ asmlinkage int do_rt_sigreturn(struct switch_stack *sw)
 {
 	struct pt_regs *regs = (struct pt_regs *)(sw + 1);
 	/* Verify, can we follow the stack back */
-	struct rt_sigframe *frame = (struct rt_sigframe *) regs->sp;
+	struct rt_sigframe __user *frame;
 	sigset_t set;
 	int rval;
 
+	frame = (struct rt_sigframe __user *) regs->sp;
 	if (!access_ok(frame, sizeof(*frame)))
 		goto badframe;
 
@@ -124,10 +125,10 @@ asmlinkage int do_rt_sigreturn(struct switch_stack *sw)
 	return 0;
 }
 
-static inline int rt_setup_ucontext(struct ucontext *uc, struct pt_regs *regs)
+static inline int rt_setup_ucontext(struct ucontext __user *uc, struct pt_regs *regs)
 {
 	struct switch_stack *sw = (struct switch_stack *)regs - 1;
-	unsigned long *gregs = uc->uc_mcontext.gregs;
+	unsigned long __user *gregs = uc->uc_mcontext.gregs;
 	int err = 0;
 
 	err |= __put_user(MCONTEXT_VERSION, &uc->uc_mcontext.version);
@@ -162,8 +163,9 @@ static inline int rt_setup_ucontext(struct ucontext *uc, struct pt_regs *regs)
 	return err;
 }
 
-static inline void *get_sigframe(struct ksignal *ksig, struct pt_regs *regs,
-				 size_t frame_size)
+static inline void __user *get_sigframe(struct ksignal *ksig,
+					struct pt_regs *regs,
+					size_t frame_size)
 {
 	unsigned long usp;
 
@@ -174,13 +176,13 @@ static inline void *get_sigframe(struct ksignal *ksig, struct pt_regs *regs,
 	usp = sigsp(usp, ksig);
 
 	/* Verify, is it 32 or 64 bit aligned */
-	return (void *)((usp - frame_size) & -8UL);
+	return (void __user *)((usp - frame_size) & -8UL);
 }
 
 static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 			  struct pt_regs *regs)
 {
-	struct rt_sigframe *frame;
+	struct rt_sigframe __user *frame;
 	int err = 0;
 
 	frame = get_sigframe(ksig, regs, sizeof(*frame));
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index a94b0cd0bdc5..022d23ae300b 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -112,9 +112,9 @@ static nokprobe_inline long address_ok(struct pt_regs *regs,
 {
 	if (!user_mode(regs))
 		return 1;
-	if (__access_ok(ea, nb))
+	if (access_ok((void __user *)ea, nb))
 		return 1;
-	if (__access_ok(ea, 1))
+	if (access_ok((void __user *)ea, 1))
 		/* Access overlaps the end of the user region */
 		regs->dar = TASK_SIZE_MAX - 1;
 	else
diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
index 1fc075b8f764..f0c7bb98119a 100644
--- a/arch/riscv/kernel/perf_callchain.c
+++ b/arch/riscv/kernel/perf_callchain.c
@@ -15,7 +15,7 @@ static unsigned long user_backtrace(struct perf_callchain_entry_ctx *entry,
 {
 	struct stackframe buftail;
 	unsigned long ra = 0;
-	unsigned long *user_frame_tail =
+	unsigned long __user *user_frame_tail =
 			(unsigned long *)(fp - sizeof(struct stackframe));
 
 	/* Check accessibility of one struct frame_tail beyond */
diff --git a/arch/sparc/kernel/signal_32.c b/arch/sparc/kernel/signal_32.c
index ffab16369bea..74f80443b195 100644
--- a/arch/sparc/kernel/signal_32.c
+++ b/arch/sparc/kernel/signal_32.c
@@ -65,7 +65,7 @@ struct rt_signal_frame {
  */
 static inline bool invalid_frame_pointer(void __user *fp, int fplen)
 {
-	if ((((unsigned long) fp) & 15) || !__access_ok((unsigned long)fp, fplen))
+	if ((((unsigned long) fp) & 15) || !access_ok(fp, fplen))
 		return true;
 
 	return false;
diff --git a/lib/test_lockup.c b/lib/test_lockup.c
index 906b598740a7..6a0f329a794a 100644
--- a/lib/test_lockup.c
+++ b/lib/test_lockup.c
@@ -417,8 +417,8 @@ static bool test_kernel_ptr(unsigned long addr, int size)
 		return false;
 
 	/* should be at least readable kernel address */
-	if (access_ok(ptr, 1) ||
-	    access_ok(ptr + size - 1, 1) ||
+	if (access_ok((void __user *)ptr, 1) ||
+	    access_ok((void __user *)ptr + size - 1, 1) ||
 	    get_kernel_nofault(buf, ptr) ||
 	    get_kernel_nofault(buf, ptr + size - 1)) {
 		pr_err("invalid kernel ptr: %#lx\n", addr);
-- 
2.29.2

