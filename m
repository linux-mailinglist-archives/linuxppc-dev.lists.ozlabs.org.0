Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9991A7464
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 09:11:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491c8r3yc1zDqXD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 17:11:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+4a22011dcb1da0b09bf4+6078+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=N33byonG; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491byH0XrCzDqWJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 17:01:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=kId12qgVAwe0pAdKbn0gvvbX9yPAMMeX+xbGXzzgMzQ=; b=N33byonGXPKIVkQx1d6K8/Xtem
 hdFbA/mFw46ZEqEXJpxcqCYKTbITq9eYwfhLOLOkFKzm3WiuroNGos7a0mcFQxbUD4T1kLmiN1AI3
 u/XbIGRRSCHiQ3upn0YIZqmHsJK1slh7iAXaANyQtBwvLOyqibQDxWRWpZq7YvIIvvrzaLZ+XLoIw
 T5iInkfdd3E5EgHegK4bBZJQacvvVkOmjUO6BmcGCpTppJcfPUfPQLEfh84fjVbolrqYD1k5xdXMi
 bzy7BMcZSWm9v3fbTOtynQlktAIULXImqZ36Lm49QP8EP1eZXOR16hGcWnNSwCmiHEemdrJvjfJrF
 n/ap/8yw==;
Received: from [2001:4bb8:180:384b:4c21:af7:dd95:e552] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOFZx-0005YS-GE; Tue, 14 Apr 2020 07:01:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 3/8] signal: replace __copy_siginfo_to_user32 with
 to_compat_siginfo
Date: Tue, 14 Apr 2020 09:01:37 +0200
Message-Id: <20200414070142.288696-4-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414070142.288696-1-hch@lst.de>
References: <20200414070142.288696-1-hch@lst.de>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Jeremy Kerr <jk@ozlabs.org>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "Eric W . Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move copying the siginfo to userspace into the callers, so that the
compat_siginfo conversion can be reused by the ELF coredump code without
set_fs magic.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/x86/ia32/ia32_signal.c |  4 +-
 arch/x86/kernel/signal.c    |  5 ++-
 include/linux/compat.h      |  4 +-
 kernel/signal.c             | 89 ++++++++++++++++++-------------------
 4 files changed, 52 insertions(+), 50 deletions(-)

diff --git a/arch/x86/ia32/ia32_signal.c b/arch/x86/ia32/ia32_signal.c
index 2bf188942d5c..0fbaed2562bc 100644
--- a/arch/x86/ia32/ia32_signal.c
+++ b/arch/x86/ia32/ia32_signal.c
@@ -301,6 +301,7 @@ int ia32_setup_rt_frame(int sig, struct ksignal *ksig,
 			compat_sigset_t *set, struct pt_regs *regs)
 {
 	struct rt_sigframe_ia32 __user *frame;
+	struct compat_siginfo new;
 	void __user *restorer;
 	void __user *fp = NULL;
 
@@ -350,7 +351,8 @@ int ia32_setup_rt_frame(int sig, struct ksignal *ksig,
 	unsafe_put_user(*(__u64 *)set, (__u64 *)&frame->uc.uc_sigmask, Efault);
 	user_access_end();
 
-	if (__copy_siginfo_to_user32(&frame->info, &ksig->info, SA_IA32_ABI))
+	to_compat_siginfo(&new, &ksig->info, SA_IA32_ABI);
+	if (copy_to_user(&frame->info, &new, sizeof(frame->info)))
 		return -EFAULT;
 
 	/* Set up registers for signal handler */
diff --git a/arch/x86/kernel/signal.c b/arch/x86/kernel/signal.c
index bbd451631790..6ff1265f071b 100644
--- a/arch/x86/kernel/signal.c
+++ b/arch/x86/kernel/signal.c
@@ -517,6 +517,7 @@ static int x32_setup_rt_frame(struct ksignal *ksig,
 {
 #ifdef CONFIG_X86_X32_ABI
 	struct rt_sigframe_x32 __user *frame;
+	struct compat_siginfo new;
 	unsigned long uc_flags;
 	void __user *restorer;
 	void __user *fp = NULL;
@@ -543,8 +544,8 @@ static int x32_setup_rt_frame(struct ksignal *ksig,
 	user_access_end();
 
 	if (ksig->ka.sa.sa_flags & SA_SIGINFO) {
-		if (__copy_siginfo_to_user32(&frame->info, &ksig->info,
-				SA_X32_ABI))
+		to_compat_siginfo(&new, &ksig->info, SA_X32_ABI);
+		if (copy_to_user(&frame->info, &new, sizeof(frame->info)))
 			return -EFAULT;
 	}
 
diff --git a/include/linux/compat.h b/include/linux/compat.h
index 14eec6116110..218ebba1e454 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -404,8 +404,8 @@ long compat_put_bitmap(compat_ulong_t __user *umask, unsigned long *mask,
 		       unsigned long bitmap_size);
 int copy_siginfo_from_user32(kernel_siginfo_t *to, const struct compat_siginfo __user *from);
 int copy_siginfo_to_user32(struct compat_siginfo __user *to, const kernel_siginfo_t *from);
-int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
-		const kernel_siginfo_t *from, unsigned int flags);
+void to_compat_siginfo(struct compat_siginfo *to,
+		const struct kernel_siginfo *from, unsigned int flags);
 int get_compat_sigevent(struct sigevent *event,
 		const struct compat_sigevent __user *u_event);
 
diff --git a/kernel/signal.c b/kernel/signal.c
index 092fee008242..0f3e7fded3a5 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -3235,88 +3235,82 @@ int copy_siginfo_from_user(kernel_siginfo_t *to, const siginfo_t __user *from)
 }
 
 #ifdef CONFIG_COMPAT
-int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
+void to_compat_siginfo(struct compat_siginfo *to,
 		const struct kernel_siginfo *from, unsigned int flags)
 {
-	struct compat_siginfo new;
-	memset(&new, 0, sizeof(new));
+	memset(to, 0, sizeof(*to));
+	to->si_signo = from->si_signo;
+	to->si_errno = from->si_errno;
+	to->si_code  = from->si_code;
 
-	new.si_signo = from->si_signo;
-	new.si_errno = from->si_errno;
-	new.si_code  = from->si_code;
-	switch(siginfo_layout(from->si_signo, from->si_code)) {
+	switch (siginfo_layout(from->si_signo, from->si_code)) {
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
+		to->si_pid    = from->si_pid;
+		to->si_uid    = from->si_uid;
+		to->si_status = from->si_status;
 #ifdef CONFIG_X86_X32_ABI
 		if (flags & SA_X32_ABI) {
-			new._sifields._sigchld_x32._utime = from->si_utime;
-			new._sifields._sigchld_x32._stime = from->si_stime;
+			to->_sifields._sigchld_x32._utime = from->si_utime;
+			to->_sifields._sigchld_x32._stime = from->si_stime;
 		} else
 #endif
 		{
-			new.si_utime = from->si_utime;
-			new.si_stime = from->si_stime;
+			to->si_utime = from->si_utime;
+			to->si_stime = from->si_stime;
 		}
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
-
-	if (copy_to_user(to, &new, sizeof(struct compat_siginfo)))
-		return -EFAULT;
-
-	return 0;
 }
 
 #ifndef compat_siginfo_flags
@@ -3326,7 +3320,12 @@ int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
 int copy_siginfo_to_user32(struct compat_siginfo __user *to,
 			   const struct kernel_siginfo *from)
 {
-	return __copy_siginfo_to_user32(to, from, compat_siginfo_flags());
+	struct compat_siginfo new;
+
+	to_compat_siginfo(&new, from, compat_siginfo_flags());
+	if (copy_to_user(to, &new, sizeof(*to)))
+		return -EFAULT;
+	return 0;
 }
 
 static int post_copy_siginfo_from_user32(kernel_siginfo_t *to,
-- 
2.25.1

