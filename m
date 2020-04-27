Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 273EA1BAF19
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 22:13:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499wvq5NJPzDq8g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 06:13:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+7fdffca6c44e2812a750+6091+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499wlg6BVZzDqcW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 06:06:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=gpWRZElREATeZwYUTenSdTJqeed7o42EBJOpC8zP8hc=; b=VOhp/uhefZFEynocz44DtCEVFz
 dxGTK36xP2DXbc1N3eQSPLjTl4PzLLqwkIrVXlGPbwrGI4idMF/OjFjtEwiqE2c7M6+ghuQxp5x70
 381dxchwc1hP5Nmwt+aMkY9IIH8eqhtOZR9/E0pz5IwN91Qhowp/LBLZ+KyzFZ1JWftARQLKib6A9
 a1XA9JyhfXCjofbd498H+U3O9OQxTDUPUM5cfFSoexrjA+tdYbZU2plopx4IVUavWoIFYNDZhMYOY
 R7MQ2sPJlp+YKQLjAPOTLyBJ0uHy0nmDd9/8W1xDO9adntJjS8lrUJzt19cB+TmPnZD3wIInsaLZ/
 fPiBrn6Q==;
Received: from [2001:4bb8:193:f203:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTA1R-00017b-BT; Mon, 27 Apr 2020 20:06:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 2/5] signal: factor copy_siginfo_to_external32 from
 copy_siginfo_to_user32
Date: Mon, 27 Apr 2020 22:06:22 +0200
Message-Id: <20200427200626.1622060-3-hch@lst.de>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200427200626.1622060-1-hch@lst.de>
References: <20200427200626.1622060-1-hch@lst.de>
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Jeremy Kerr <jk@ozlabs.org>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "Eric W . Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Eric W. Biederman" <ebiederm@xmission.com>

To remove the use of set_fs in the coredump code there needs to be a
way to convert a kernel siginfo to a userspace compat siginfo.

Call that function copy_siginfo_to_compat and factor it out of
copy_siginfo_to_user32.

The existence of x32 complicates this code.  On x32 SIGCHLD uses 64bit
times for utime and stime.  As only SIGCHLD is affected and SIGCHLD
never causes a coredump I have avoided handling that case.

Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/compat.h |   2 +
 kernel/signal.c        | 113 ++++++++++++++++++++++-------------------
 2 files changed, 62 insertions(+), 53 deletions(-)

diff --git a/include/linux/compat.h b/include/linux/compat.h
index 0480ba4db5929..adbfe8f688d92 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -402,6 +402,8 @@ long compat_get_bitmap(unsigned long *mask, const compat_ulong_t __user *umask,
 		       unsigned long bitmap_size);
 long compat_put_bitmap(compat_ulong_t __user *umask, unsigned long *mask,
 		       unsigned long bitmap_size);
+void copy_siginfo_to_external32(struct compat_siginfo *to,
+		const struct kernel_siginfo *from);
 int copy_siginfo_from_user32(kernel_siginfo_t *to, const struct compat_siginfo __user *from);
 int copy_siginfo_to_user32(struct compat_siginfo __user *to, const kernel_siginfo_t *from);
 int get_compat_sigevent(struct sigevent *event,
diff --git a/kernel/signal.c b/kernel/signal.c
index 284fc1600063b..244c69c4261e0 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -3235,94 +3235,101 @@ int copy_siginfo_from_user(kernel_siginfo_t *to, const siginfo_t __user *from)
 }
 
 #ifdef CONFIG_COMPAT
-int copy_siginfo_to_user32(struct compat_siginfo __user *to,
-			   const struct kernel_siginfo *from)
-#if defined(CONFIG_X86_X32_ABI) || defined(CONFIG_IA32_EMULATION)
+void copy_siginfo_to_external32(struct compat_siginfo *to,
+				const struct kernel_siginfo *from)
 {
-	return __copy_siginfo_to_user32(to, from, in_x32_syscall());
-}
-int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
-			     const struct kernel_siginfo *from, bool x32_ABI)
-#endif
-{
-	struct compat_siginfo new;
-	memset(&new, 0, sizeof(new));
+	/*
+	 * This function does not work properly for SIGCHLD on x32,
+	 * but it does not need to as SIGCHLD never causes a coredump.
+	 */
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
+		to->si_pid    = from->si_pid;
+		to->si_uid    = from->si_uid;
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
 
+int copy_siginfo_to_user32(struct compat_siginfo __user *to,
+			   const struct kernel_siginfo *from)
+#if defined(CONFIG_X86_X32_ABI) || defined(CONFIG_IA32_EMULATION)
+{
+	return __copy_siginfo_to_user32(to, from, in_x32_syscall());
+}
+int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
+			     const struct kernel_siginfo *from, bool x32_ABI)
+#endif
+{
+	struct compat_siginfo new;
+
+	copy_siginfo_to_external32(&new, from);
+#ifdef CONFIG_X86_X32_ABI
+	if (x32_ABI && from->si_signo == SIGCHLD) {
+		new._sifields._sigchld_x32._utime = from->si_utime;
+		new._sifields._sigchld_x32._stime = from->si_stime;
+	}
+#endif
 	if (copy_to_user(to, &new, sizeof(struct compat_siginfo)))
 		return -EFAULT;
-
 	return 0;
 }
 
-- 
2.26.1

