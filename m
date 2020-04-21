Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 037511B2B99
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 17:51:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4967MT0lCFzDqxZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 01:51:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+e7bbf23787eeed0e081a+6085+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=g2D8ulEm; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49679R1lDpzDq9m
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 01:42:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=6gLec4LXQwws698KQKyzKBWNmEzGj/Ewh/ELHYs7gBE=; b=g2D8ulEmqU8y1ZfkF9PHrrgWvh
 ZlzpWjXJweULKOKWxONLptnk9AUBG37mcY6bH5IQhWAbV3NlMxbiIUzwLVrzQav2OFazd59FYg3ZJ
 D6DwuIW7K/Ia4kVuw5/aMLypEVOUW2fjt4GpME9qM+crl4yaUC188KaQRTJiMjxdjzu9S1PlaWvCC
 tWOF7wmmb89LZaK9TvYeqDdQ8YmGCX/el6keN1L38P9mlhSUbywEh0O9C3/MEWELZSfoxMes4ERmF
 xE1rqQgUL1cp9Az2hFPKpVw0WQltYovr6l2t2YzfnymQamDNsqDeFIZd6rk0brJdGZexuqApRXWiV
 Pa7S+NYw==;
Received: from [2001:4bb8:191:e12c:c70:4a89:bc61:3] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQv2K-0007qS-Cw; Tue, 21 Apr 2020 15:42:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 2/7] signal: factor copy_siginfo_to_external32 from
 copy_siginfo_to_user32
Date: Tue, 21 Apr 2020 17:41:59 +0200
Message-Id: <20200421154204.252921-3-hch@lst.de>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200421154204.252921-1-hch@lst.de>
References: <20200421154204.252921-1-hch@lst.de>
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
 kernel/signal.c        | 109 +++++++++++++++++++++++------------------
 2 files changed, 64 insertions(+), 47 deletions(-)

diff --git a/include/linux/compat.h b/include/linux/compat.h
index 0480ba4db592..adbfe8f688d9 100644
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
index 713104884414..d8eb30914771 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -3231,94 +3231,109 @@ int copy_siginfo_from_user(kernel_siginfo_t *to, const siginfo_t __user *from)
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
+void copy_siginfo_to_external32(struct compat_siginfo *to,
+				const struct kernel_siginfo *from)
 {
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
+		to->si_pid    = from->si_pid;
+		to->si_uid    = from->si_uid;
+		to->si_status = from->si_status;
+		to->si_utime = from->si_utime;
+		to->si_stime = from->si_stime;
 #ifdef CONFIG_X86_X32_ABI
 		if (x32_ABI) {
-			new._sifields._sigchld_x32._utime = from->si_utime;
-			new._sifields._sigchld_x32._stime = from->si_stime;
+			to->_sifields._sigchld_x32._utime = from->si_utime;
+			to->_sifields._sigchld_x32._stime = from->si_stime;
 		} else
 #endif
 		{
-			new.si_utime = from->si_utime;
-			new.si_stime = from->si_stime;
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
+}
+
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

