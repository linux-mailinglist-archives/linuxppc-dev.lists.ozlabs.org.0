Return-Path: <linuxppc-dev+bounces-4794-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 631ABA04D32
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 00:09:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSRZk6TmKz2yNP;
	Wed,  8 Jan 2025 10:09:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736291044;
	cv=none; b=Xqq9XU2DLtJyFyuzpvr8M8vXsoO4vghFZx2KWWtGUheMNCFPC/cvYb0o3zJJWzUs0seHQ8smIj7KXaLr/hMtHUM7DwQZnOCEm4QkNzvDZo1CZngTPH9R+1RZFENjPbzWigtA5Ji/EyY/9nz40jYDGYKqsvRe9OgzQFV3wfqCnlamHrb+2ErMJhI8xDdGBb570DtVQfg59YnLuTCIZpJ/fo9Ltoh3m1sUCxF2VR8QvmKCkEeQrDp/TlIgjhzIjwbtIS9Qy/X7+Ij/Gk0DIce2dlCUQ+27ZS+/EGb2Wv2G0k+1mYP0HfUbYjtkZWEjnFFC//NwYOuH8BlKxbD+f0ua/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736291044; c=relaxed/relaxed;
	bh=VidEpJkeGO0ohZjePRSHyG6LCMFztbeOrTA1pUgcM04=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=d5LeDQU2cCLI17WASO78mo+mcJ5T5TNAHmKph9DOULnv4fwHI+oAzM1o+lNPO07TYwkDhg5rMtZ/UPL11As6Sl0BDApec89M5EGRzV78Y0w2ILg486p2FURQ7j+AIhydkKpS5xdT3Z/0xNApSoTyBReWLLG9ekxDKIluF5qa2TlMBI2nAju67eJaW0Rm1GHVpIlCIV3tEBpUENzfCJ/zyXKpPUvjnCQG+yK7Os0VPNWk7UcXNj3KdPVeN2V20nW//5DvAKutI4HLPmpIORnrVgcFxDFjgP+cYrnzauKNfJuY6Fgj/8140Z4ob0pBpwJ7emNkSTXDaPke1G9R7wIo8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 123 seconds by postgrey-1.37 at boromir; Wed, 08 Jan 2025 10:04:02 AEDT
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSRSL0Lccz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 10:04:01 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 517C872C8FB;
	Wed,  8 Jan 2025 02:04:00 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 404667CCB3A; Wed,  8 Jan 2025 01:04:00 +0200 (IST)
Date: Wed, 8 Jan 2025 01:04:00 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, Dinh Nguyen <dinguyen@kernel.org>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: [PATCH 1/6] Revert "arch: remove unused function
 syscall_set_arguments()"
Message-ID: <20250107230359.GA30633@strace.io>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107230153.GA30560@strace.io>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

syscall_set_arguments() is going to be needed to implement
PTRACE_SET_SYSCALL_INFO API.

This is a partial revert: on a few architectures syscall_set_arguments()
implementations were buggy, so instead of adding them here and applying
fixes on top, cleaner implementations are coming in follow-up commits.

This reverts commit 7962c2eddbfe7cce879acb06f9b4f205789e57b7.

Signed-off-by: Dmitry V. Levin <ldv@strace.io>
---
 arch/nios2/include/asm/syscall.h      | 11 ++++++++
 arch/openrisc/include/asm/syscall.h   |  7 ++++++
 arch/powerpc/include/asm/syscall.h    | 10 ++++++++
 arch/riscv/include/asm/syscall.h      |  9 +++++++
 arch/s390/include/asm/syscall.h       | 12 +++++++++
 arch/sh/include/asm/syscall_32.h      | 12 +++++++++
 arch/sparc/include/asm/syscall.h      | 10 ++++++++
 arch/um/include/asm/syscall-generic.h | 14 +++++++++++
 arch/x86/include/asm/syscall.h        | 36 +++++++++++++++++++++++++++
 arch/xtensa/include/asm/syscall.h     | 11 ++++++++
 include/asm-generic/syscall.h         | 16 ++++++++++++
 11 files changed, 148 insertions(+)

diff --git a/arch/nios2/include/asm/syscall.h b/arch/nios2/include/asm/syscall.h
index fff52205fb65..526449edd768 100644
--- a/arch/nios2/include/asm/syscall.h
+++ b/arch/nios2/include/asm/syscall.h
@@ -58,6 +58,17 @@ static inline void syscall_get_arguments(struct task_struct *task,
 	*args   = regs->r9;
 }
 
+static inline void syscall_set_arguments(struct task_struct *task,
+	struct pt_regs *regs, const unsigned long *args)
+{
+	regs->r4 = *args++;
+	regs->r5 = *args++;
+	regs->r6 = *args++;
+	regs->r7 = *args++;
+	regs->r8 = *args++;
+	regs->r9 = *args;
+}
+
 static inline int syscall_get_arch(struct task_struct *task)
 {
 	return AUDIT_ARCH_NIOS2;
diff --git a/arch/openrisc/include/asm/syscall.h b/arch/openrisc/include/asm/syscall.h
index 903ed882bdec..e6383be2a195 100644
--- a/arch/openrisc/include/asm/syscall.h
+++ b/arch/openrisc/include/asm/syscall.h
@@ -57,6 +57,13 @@ syscall_get_arguments(struct task_struct *task, struct pt_regs *regs,
 	memcpy(args, &regs->gpr[3], 6 * sizeof(args[0]));
 }
 
+static inline void
+syscall_set_arguments(struct task_struct *task, struct pt_regs *regs,
+		      const unsigned long *args)
+{
+	memcpy(&regs->gpr[3], args, 6 * sizeof(args[0]));
+}
+
 static inline int syscall_get_arch(struct task_struct *task)
 {
 	return AUDIT_ARCH_OPENRISC;
diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
index 3dd36c5e334a..b2715448a660 100644
--- a/arch/powerpc/include/asm/syscall.h
+++ b/arch/powerpc/include/asm/syscall.h
@@ -110,6 +110,16 @@ static inline void syscall_get_arguments(struct task_struct *task,
 	}
 }
 
+static inline void syscall_set_arguments(struct task_struct *task,
+					 struct pt_regs *regs,
+					 const unsigned long *args)
+{
+	memcpy(&regs->gpr[3], args, 6 * sizeof(args[0]));
+
+	/* Also copy the first argument into orig_gpr3 */
+	regs->orig_gpr3 = args[0];
+}
+
 static inline int syscall_get_arch(struct task_struct *task)
 {
 	if (is_tsk_32bit_task(task))
diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
index 121fff429dce..8d389ba995c8 100644
--- a/arch/riscv/include/asm/syscall.h
+++ b/arch/riscv/include/asm/syscall.h
@@ -66,6 +66,15 @@ static inline void syscall_get_arguments(struct task_struct *task,
 	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
 }
 
+static inline void syscall_set_arguments(struct task_struct *task,
+					 struct pt_regs *regs,
+					 const unsigned long *args)
+{
+	regs->orig_a0 = args[0];
+	args++;
+	memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
+}
+
 static inline int syscall_get_arch(struct task_struct *task)
 {
 #ifdef CONFIG_64BIT
diff --git a/arch/s390/include/asm/syscall.h b/arch/s390/include/asm/syscall.h
index 27e3d804b311..b3dd883699e7 100644
--- a/arch/s390/include/asm/syscall.h
+++ b/arch/s390/include/asm/syscall.h
@@ -78,6 +78,18 @@ static inline void syscall_get_arguments(struct task_struct *task,
 	args[0] = regs->orig_gpr2 & mask;
 }
 
+static inline void syscall_set_arguments(struct task_struct *task,
+					 struct pt_regs *regs,
+					 const unsigned long *args)
+{
+	unsigned int n = 6;
+
+	while (n-- > 0)
+		if (n > 0)
+			regs->gprs[2 + n] = args[n];
+	regs->orig_gpr2 = args[0];
+}
+
 static inline int syscall_get_arch(struct task_struct *task)
 {
 #ifdef CONFIG_COMPAT
diff --git a/arch/sh/include/asm/syscall_32.h b/arch/sh/include/asm/syscall_32.h
index d87738eebe30..cb51a7528384 100644
--- a/arch/sh/include/asm/syscall_32.h
+++ b/arch/sh/include/asm/syscall_32.h
@@ -57,6 +57,18 @@ static inline void syscall_get_arguments(struct task_struct *task,
 	args[0] = regs->regs[4];
 }
 
+static inline void syscall_set_arguments(struct task_struct *task,
+					 struct pt_regs *regs,
+					 const unsigned long *args)
+{
+	regs->regs[1] = args[5];
+	regs->regs[0] = args[4];
+	regs->regs[7] = args[3];
+	regs->regs[6] = args[2];
+	regs->regs[5] = args[1];
+	regs->regs[4] = args[0];
+}
+
 static inline int syscall_get_arch(struct task_struct *task)
 {
 	int arch = AUDIT_ARCH_SH;
diff --git a/arch/sparc/include/asm/syscall.h b/arch/sparc/include/asm/syscall.h
index 20c109ac8cc9..62a5a78804c4 100644
--- a/arch/sparc/include/asm/syscall.h
+++ b/arch/sparc/include/asm/syscall.h
@@ -117,6 +117,16 @@ static inline void syscall_get_arguments(struct task_struct *task,
 	}
 }
 
+static inline void syscall_set_arguments(struct task_struct *task,
+					 struct pt_regs *regs,
+					 const unsigned long *args)
+{
+	unsigned int i;
+
+	for (i = 0; i < 6; i++)
+		regs->u_regs[UREG_I0 + i] = args[i];
+}
+
 static inline int syscall_get_arch(struct task_struct *task)
 {
 #if defined(CONFIG_SPARC64) && defined(CONFIG_COMPAT)
diff --git a/arch/um/include/asm/syscall-generic.h b/arch/um/include/asm/syscall-generic.h
index 172b74143c4b..2984feb9d576 100644
--- a/arch/um/include/asm/syscall-generic.h
+++ b/arch/um/include/asm/syscall-generic.h
@@ -62,6 +62,20 @@ static inline void syscall_get_arguments(struct task_struct *task,
 	*args   = UPT_SYSCALL_ARG6(r);
 }
 
+static inline void syscall_set_arguments(struct task_struct *task,
+					 struct pt_regs *regs,
+					 const unsigned long *args)
+{
+	struct uml_pt_regs *r = &regs->regs;
+
+	UPT_SYSCALL_ARG1(r) = *args++;
+	UPT_SYSCALL_ARG2(r) = *args++;
+	UPT_SYSCALL_ARG3(r) = *args++;
+	UPT_SYSCALL_ARG4(r) = *args++;
+	UPT_SYSCALL_ARG5(r) = *args++;
+	UPT_SYSCALL_ARG6(r) = *args;
+}
+
 /* See arch/x86/um/asm/syscall.h for syscall_get_arch() definition. */
 
 #endif	/* __UM_SYSCALL_GENERIC_H */
diff --git a/arch/x86/include/asm/syscall.h b/arch/x86/include/asm/syscall.h
index 7c488ff0c764..b9c249dd9e3d 100644
--- a/arch/x86/include/asm/syscall.h
+++ b/arch/x86/include/asm/syscall.h
@@ -90,6 +90,18 @@ static inline void syscall_get_arguments(struct task_struct *task,
 	args[5] = regs->bp;
 }
 
+static inline void syscall_set_arguments(struct task_struct *task,
+					 struct pt_regs *regs,
+					 const unsigned long *args)
+{
+	regs->bx = args[0];
+	regs->cx = args[1];
+	regs->dx = args[2];
+	regs->si = args[3];
+	regs->di = args[4];
+	regs->bp = args[5];
+}
+
 static inline int syscall_get_arch(struct task_struct *task)
 {
 	return AUDIT_ARCH_I386;
@@ -121,6 +133,30 @@ static inline void syscall_get_arguments(struct task_struct *task,
 	}
 }
 
+static inline void syscall_set_arguments(struct task_struct *task,
+					 struct pt_regs *regs,
+					 const unsigned long *args)
+{
+# ifdef CONFIG_IA32_EMULATION
+	if (task->thread_info.status & TS_COMPAT) {
+		regs->bx = *args++;
+		regs->cx = *args++;
+		regs->dx = *args++;
+		regs->si = *args++;
+		regs->di = *args++;
+		regs->bp = *args;
+	} else
+# endif
+	{
+		regs->di = *args++;
+		regs->si = *args++;
+		regs->dx = *args++;
+		regs->r10 = *args++;
+		regs->r8 = *args++;
+		regs->r9 = *args;
+	}
+}
+
 static inline int syscall_get_arch(struct task_struct *task)
 {
 	/* x32 tasks should be considered AUDIT_ARCH_X86_64. */
diff --git a/arch/xtensa/include/asm/syscall.h b/arch/xtensa/include/asm/syscall.h
index 5ee974bf8330..f9a671cbf933 100644
--- a/arch/xtensa/include/asm/syscall.h
+++ b/arch/xtensa/include/asm/syscall.h
@@ -68,6 +68,17 @@ static inline void syscall_get_arguments(struct task_struct *task,
 		args[i] = regs->areg[reg[i]];
 }
 
+static inline void syscall_set_arguments(struct task_struct *task,
+					 struct pt_regs *regs,
+					 const unsigned long *args)
+{
+	static const unsigned int reg[] = XTENSA_SYSCALL_ARGUMENT_REGS;
+	unsigned int i;
+
+	for (i = 0; i < 6; ++i)
+		regs->areg[reg[i]] = args[i];
+}
+
 asmlinkage long xtensa_rt_sigreturn(void);
 asmlinkage long xtensa_shmat(int, char __user *, int);
 asmlinkage long xtensa_fadvise64_64(int, int,
diff --git a/include/asm-generic/syscall.h b/include/asm-generic/syscall.h
index 5a80fe728dc8..0f7b9a493de7 100644
--- a/include/asm-generic/syscall.h
+++ b/include/asm-generic/syscall.h
@@ -117,6 +117,22 @@ void syscall_set_return_value(struct task_struct *task, struct pt_regs *regs,
 void syscall_get_arguments(struct task_struct *task, struct pt_regs *regs,
 			   unsigned long *args);
 
+/**
+ * syscall_set_arguments - change system call parameter value
+ * @task:	task of interest, must be in system call entry tracing
+ * @regs:	task_pt_regs() of @task
+ * @args:	array of argument values to store
+ *
+ * Changes 6 arguments to the system call.
+ * The first argument gets value @args[0], and so on.
+ *
+ * It's only valid to call this when @task is stopped for tracing on
+ * entry to a system call, due to %SYSCALL_WORK_SYSCALL_TRACE or
+ * %SYSCALL_WORK_SYSCALL_AUDIT.
+ */
+void syscall_set_arguments(struct task_struct *task, struct pt_regs *regs,
+			   const unsigned long *args);
+
 /**
  * syscall_get_arch - return the AUDIT_ARCH for the current system call
  * @task:	task of interest, must be blocked

-- 
ldv

