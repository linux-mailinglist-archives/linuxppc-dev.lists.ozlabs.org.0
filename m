Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A13B11C531D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 12:26:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GbVQ5mH1zDqcK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 20:26:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+9f099bf5d86be6f06a65+6099+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=SSeEywTd; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GbCN5MhqzDqcV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 20:13:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=L0Fi4OmEy/vXWrkbLOxIAklPfYbCMsJaeMZCcyjYe7A=; b=SSeEywTdNRy7myQR+esW9J/mC7
 /6W9EwmEodGph0fzN72evNwv8MSS9sHqWApw7jEGHLkQKf5k77BrzZEIT/BK4Wj94mtZe1vqMt9wl
 IxcVm3XLsDBMJ2D3qR5+e49+qm2lfxOzSChS/7xk/iiF0rCHjUoAxKwsstNEtHPgSL2r7zKk6L25N
 Mq79zli2EuZNkqK2X0GlKyvEcX/pjIDsl+S2SlkxYAi+HBXJJxAYSk4uoU0TCCtmqVjvlrKZF497J
 thSW4vB93lIW4NlCXFLP5R/DDbgu6c9Ij8zJIb36iOU6W+ODsZ1cQXYMRC02D684H5LdtQVzmohf9
 FvXYW4Ow==;
Received: from [2001:4bb8:191:66b6:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVuZa-0006uv-6l; Tue, 05 May 2020 10:13:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 4/7] signal: refactor copy_siginfo_to_user32
Date: Tue,  5 May 2020 12:12:53 +0200
Message-Id: <20200505101256.3121270-5-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200505101256.3121270-1-hch@lst.de>
References: <20200505101256.3121270-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org,
 x86@kernel.org, Oleg Nesterov <oleg@redhat.com>, linux-kernel@vger.kernel.org,
 "Eric W . Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Jeremy Kerr <jk@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Factor out a copy_siginfo_to_external32 helper from
copy_siginfo_to_user32 that fills out the compat_siginfo, but does so
on a kernel space data structure.  With that we can let architectures
override copy_siginfo_to_user32 with their own implementations using
copy_siginfo_to_external32.  That allows moving the x32 SIGCHLD purely
to x86 architecture code.

As a nice side effect copy_siginfo_to_external32 also comes in handy
for avoiding a set_fs() call in the coredump code later on.

Contains improvements from Eric W. Biederman <ebiederm@xmission.com>
and Arnd Bergmann <arnd@arndb.de>.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/x86/ia32/ia32_signal.c   |   2 +-
 arch/x86/include/asm/compat.h |   8 ++-
 arch/x86/kernel/signal.c      |  28 ++++++++-
 include/linux/compat.h        |  11 +++-
 kernel/signal.c               | 106 +++++++++++++++++-----------------
 5 files changed, 96 insertions(+), 59 deletions(-)

diff --git a/arch/x86/ia32/ia32_signal.c b/arch/x86/ia32/ia32_signal.c
index f9d8804144d09..81cf22398cd16 100644
--- a/arch/x86/ia32/ia32_signal.c
+++ b/arch/x86/ia32/ia32_signal.c
@@ -350,7 +350,7 @@ int ia32_setup_rt_frame(int sig, struct ksignal *ksig,
 	unsafe_put_user(*(__u64 *)set, (__u64 *)&frame->uc.uc_sigmask, Efault);
 	user_access_end();
 
-	if (__copy_siginfo_to_user32(&frame->info, &ksig->info, false))
+	if (__copy_siginfo_to_user32(&frame->info, &ksig->info))
 		return -EFAULT;
 
 	/* Set up registers for signal handler */
diff --git a/arch/x86/include/asm/compat.h b/arch/x86/include/asm/compat.h
index 52e9f3480f690..d4edf281fff49 100644
--- a/arch/x86/include/asm/compat.h
+++ b/arch/x86/include/asm/compat.h
@@ -214,7 +214,11 @@ static inline bool in_compat_syscall(void)
 #endif
 
 struct compat_siginfo;
-int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
-		const kernel_siginfo_t *from, bool x32_ABI);
+
+#ifdef CONFIG_X86_X32_ABI
+int copy_siginfo_to_user32(struct compat_siginfo __user *to,
+		const kernel_siginfo_t *from);
+#define copy_siginfo_to_user32 copy_siginfo_to_user32
+#endif /* CONFIG_X86_X32_ABI */
 
 #endif /* _ASM_X86_COMPAT_H */
diff --git a/arch/x86/kernel/signal.c b/arch/x86/kernel/signal.c
index 83b74fb38c8fc..f3df262e370b3 100644
--- a/arch/x86/kernel/signal.c
+++ b/arch/x86/kernel/signal.c
@@ -37,6 +37,7 @@
 #include <asm/vm86.h>
 
 #ifdef CONFIG_X86_64
+#include <linux/compat.h>
 #include <asm/proto.h>
 #include <asm/ia32_unistd.h>
 #endif /* CONFIG_X86_64 */
@@ -511,6 +512,31 @@ static int __setup_rt_frame(int sig, struct ksignal *ksig,
 }
 #endif /* CONFIG_X86_32 */
 
+#ifdef CONFIG_X86_X32_ABI
+static int x32_copy_siginfo_to_user(struct compat_siginfo __user *to,
+		const struct kernel_siginfo *from)
+{
+	struct compat_siginfo new;
+
+	copy_siginfo_to_external32(&new, from);
+	if (from->si_signo == SIGCHLD) {
+		new._sifields._sigchld_x32._utime = from->si_utime;
+		new._sifields._sigchld_x32._stime = from->si_stime;
+	}
+	if (copy_to_user(to, &new, sizeof(struct compat_siginfo)))
+		return -EFAULT;
+	return 0;
+}
+
+int copy_siginfo_to_user32(struct compat_siginfo __user *to,
+			   const struct kernel_siginfo *from)
+{
+	if (in_x32_syscall())
+		return x32_copy_siginfo_to_user(to, from);
+	return __copy_siginfo_to_user32(to, from);
+}
+#endif /* CONFIG_X86_X32_ABI */
+
 static int x32_setup_rt_frame(struct ksignal *ksig,
 			      compat_sigset_t *set,
 			      struct pt_regs *regs)
@@ -543,7 +569,7 @@ static int x32_setup_rt_frame(struct ksignal *ksig,
 	user_access_end();
 
 	if (ksig->ka.sa.sa_flags & SA_SIGINFO) {
-		if (__copy_siginfo_to_user32(&frame->info, &ksig->info, true))
+		if (x32_copy_siginfo_to_user(&frame->info, &ksig->info))
 			return -EFAULT;
 	}
 
diff --git a/include/linux/compat.h b/include/linux/compat.h
index 0480ba4db5929..e90100c0de72e 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -402,8 +402,15 @@ long compat_get_bitmap(unsigned long *mask, const compat_ulong_t __user *umask,
 		       unsigned long bitmap_size);
 long compat_put_bitmap(compat_ulong_t __user *umask, unsigned long *mask,
 		       unsigned long bitmap_size);
-int copy_siginfo_from_user32(kernel_siginfo_t *to, const struct compat_siginfo __user *from);
-int copy_siginfo_to_user32(struct compat_siginfo __user *to, const kernel_siginfo_t *from);
+void copy_siginfo_to_external32(struct compat_siginfo *to,
+		const struct kernel_siginfo *from);
+int copy_siginfo_from_user32(kernel_siginfo_t *to,
+		const struct compat_siginfo __user *from);
+int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
+		const kernel_siginfo_t *from);
+#ifndef copy_siginfo_to_user32
+#define copy_siginfo_to_user32 __copy_siginfo_to_user32
+#endif
 int get_compat_sigevent(struct sigevent *event,
 		const struct compat_sigevent __user *u_event);
 
diff --git a/kernel/signal.c b/kernel/signal.c
index 284fc1600063b..5ca48cc5da760 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -3235,94 +3235,94 @@ int copy_siginfo_from_user(kernel_siginfo_t *to, const siginfo_t __user *from)
 }
 
 #ifdef CONFIG_COMPAT
-int copy_siginfo_to_user32(struct compat_siginfo __user *to,
-			   const struct kernel_siginfo *from)
-#if defined(CONFIG_X86_X32_ABI) || defined(CONFIG_IA32_EMULATION)
-{
-	return __copy_siginfo_to_user32(to, from, in_x32_syscall());
-}
-int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
-			     const struct kernel_siginfo *from, bool x32_ABI)
-#endif
+/**
+ * copy_siginfo_to_external32 - copy a kernel siginfo into a compat user siginfo
+ * @to: compat siginfo destination
+ * @from: kernel siginfo source
+ *
+ * Note: This function does not work properly for the SIGCHLD on x32, but
+ * fortunately it doesn't have to.  The only valid callers for this function are
+ * copy_siginfo_to_user32, which is overriden for x32 and the coredump code.
+ * The latter does not care because SIGCHLD will never cause a coredump.
+ */
+void copy_siginfo_to_external32(struct compat_siginfo *to,
+		const struct kernel_siginfo *from)
 {
-	struct compat_siginfo new;
-	memset(&new, 0, sizeof(new));
+	memset(to, 0, sizeof(*to));
 
-	new.si_signo = from->si_signo;
-	new.si_errno = from->si_errno;
-	new.si_code  = from->si_code;
+	to->si_signo = from->si_signo;
+	to->si_errno = from->si_errno;
+	to->si_code  = from->si_code;
 	switch(siginfo_layout(from->si_signo, from->si_code)) {
 	case SIL_KILL:
-		new.si_pid = from->si_pid;
-		new.si_uid = from->si_uid;
+		to->si_pid = from->si_pid;
+		to->si_uid = from->si_uid;
 		break;
 	case SIL_TIMER:
-		new.si_tid     = from->si_tid;
-		new.si_overrun = from->si_overrun;
-		new.si_int     = from->si_int;
+		to->si_tid     = from->si_tid;
+		to->si_overrun = from->si_overrun;
+		to->si_int     = from->si_int;
 		break;
 	case SIL_POLL:
-		new.si_band = from->si_band;
-		new.si_fd   = from->si_fd;
+		to->si_band = from->si_band;
+		to->si_fd   = from->si_fd;
 		break;
 	case SIL_FAULT:
-		new.si_addr = ptr_to_compat(from->si_addr);
+		to->si_addr = ptr_to_compat(from->si_addr);
 #ifdef __ARCH_SI_TRAPNO
-		new.si_trapno = from->si_trapno;
+		to->si_trapno = from->si_trapno;
 #endif
 		break;
 	case SIL_FAULT_MCEERR:
-		new.si_addr = ptr_to_compat(from->si_addr);
+		to->si_addr = ptr_to_compat(from->si_addr);
 #ifdef __ARCH_SI_TRAPNO
-		new.si_trapno = from->si_trapno;
+		to->si_trapno = from->si_trapno;
 #endif
-		new.si_addr_lsb = from->si_addr_lsb;
+		to->si_addr_lsb = from->si_addr_lsb;
 		break;
 	case SIL_FAULT_BNDERR:
-		new.si_addr = ptr_to_compat(from->si_addr);
+		to->si_addr = ptr_to_compat(from->si_addr);
 #ifdef __ARCH_SI_TRAPNO
-		new.si_trapno = from->si_trapno;
+		to->si_trapno = from->si_trapno;
 #endif
-		new.si_lower = ptr_to_compat(from->si_lower);
-		new.si_upper = ptr_to_compat(from->si_upper);
+		to->si_lower = ptr_to_compat(from->si_lower);
+		to->si_upper = ptr_to_compat(from->si_upper);
 		break;
 	case SIL_FAULT_PKUERR:
-		new.si_addr = ptr_to_compat(from->si_addr);
+		to->si_addr = ptr_to_compat(from->si_addr);
 #ifdef __ARCH_SI_TRAPNO
-		new.si_trapno = from->si_trapno;
+		to->si_trapno = from->si_trapno;
 #endif
-		new.si_pkey = from->si_pkey;
+		to->si_pkey = from->si_pkey;
 		break;
 	case SIL_CHLD:
-		new.si_pid    = from->si_pid;
-		new.si_uid    = from->si_uid;
-		new.si_status = from->si_status;
-#ifdef CONFIG_X86_X32_ABI
-		if (x32_ABI) {
-			new._sifields._sigchld_x32._utime = from->si_utime;
-			new._sifields._sigchld_x32._stime = from->si_stime;
-		} else
-#endif
-		{
-			new.si_utime = from->si_utime;
-			new.si_stime = from->si_stime;
-		}
+		to->si_pid = from->si_pid;
+		to->si_uid = from->si_uid;
+		to->si_status = from->si_status;
+		to->si_utime = from->si_utime;
+		to->si_stime = from->si_stime;
 		break;
 	case SIL_RT:
-		new.si_pid = from->si_pid;
-		new.si_uid = from->si_uid;
-		new.si_int = from->si_int;
+		to->si_pid = from->si_pid;
+		to->si_uid = from->si_uid;
+		to->si_int = from->si_int;
 		break;
 	case SIL_SYS:
-		new.si_call_addr = ptr_to_compat(from->si_call_addr);
-		new.si_syscall   = from->si_syscall;
-		new.si_arch      = from->si_arch;
+		to->si_call_addr = ptr_to_compat(from->si_call_addr);
+		to->si_syscall   = from->si_syscall;
+		to->si_arch      = from->si_arch;
 		break;
 	}
+}
 
+int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
+			   const struct kernel_siginfo *from)
+{
+	struct compat_siginfo new;
+
+	copy_siginfo_to_external32(&new, from);
 	if (copy_to_user(to, &new, sizeof(struct compat_siginfo)))
 		return -EFAULT;
-
 	return 0;
 }
 
-- 
2.26.2

