Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B89B1A7451
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 09:08:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491c6G2gPBzDqNb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 17:08:54 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=h03I+MhQ; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491byG4GRjzDqWJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 17:01:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=QyqnUQtfDFl3dc+js9JidTVXyT5mrcvSlGDN+l8Z+e0=; b=h03I+MhQk5B0Cpg9C3gZwoZ+ba
 fZ1CRCN2QFN0vzBDTXxijJh/4MIeNc8xosC03P/4JKTQ/qF+MtmEkUr2kLtyOklV00vpTe0MKghev
 3H2XPH8aR9g4ZZxJZoZQ5MaH+EbmunF2DT66HMngN8CbvXQQk2Aut/4sY/Y7kaHpIGLum5lGOFT/L
 uWe2JJyD7JUmNLOwjFeZORkPDtqNZMxzv7TR7VeC8eLPnerV12PRgbBnyPqhP1xb6I2OKLY9zD0vf
 N+QhGvXpn+qxQRZ0lOOLAFzkAXYrvYzvAvI70OYDgLkH4a7J5euk3myUyvFWwLXajRwKYqSTueTZH
 DvYa/l1Q==;
Received: from [2001:4bb8:180:384b:4c21:af7:dd95:e552] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOFZu-0005YD-Nm; Tue, 14 Apr 2020 07:01:51 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 2/8] signal: clean up __copy_siginfo_to_user32
Date: Tue, 14 Apr 2020 09:01:36 +0200
Message-Id: <20200414070142.288696-3-hch@lst.de>
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

Instead of an architecture specific calling convention in common code
just pass a flags argument with architecture specific values.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/x86/ia32/ia32_signal.c   |  2 +-
 arch/x86/include/asm/compat.h |  4 ----
 arch/x86/include/asm/signal.h |  3 +++
 arch/x86/kernel/signal.c      |  3 ++-
 include/linux/compat.h        |  2 ++
 kernel/signal.c               | 21 ++++++++++++---------
 6 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/arch/x86/ia32/ia32_signal.c b/arch/x86/ia32/ia32_signal.c
index f9d8804144d0..2bf188942d5c 100644
--- a/arch/x86/ia32/ia32_signal.c
+++ b/arch/x86/ia32/ia32_signal.c
@@ -350,7 +350,7 @@ int ia32_setup_rt_frame(int sig, struct ksignal *ksig,
 	unsafe_put_user(*(__u64 *)set, (__u64 *)&frame->uc.uc_sigmask, Efault);
 	user_access_end();
 
-	if (__copy_siginfo_to_user32(&frame->info, &ksig->info, false))
+	if (__copy_siginfo_to_user32(&frame->info, &ksig->info, SA_IA32_ABI))
 		return -EFAULT;
 
 	/* Set up registers for signal handler */
diff --git a/arch/x86/include/asm/compat.h b/arch/x86/include/asm/compat.h
index 52e9f3480f69..a787c9a82030 100644
--- a/arch/x86/include/asm/compat.h
+++ b/arch/x86/include/asm/compat.h
@@ -213,8 +213,4 @@ static inline bool in_compat_syscall(void)
 #define in_compat_syscall in_compat_syscall	/* override the generic impl */
 #endif
 
-struct compat_siginfo;
-int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
-		const kernel_siginfo_t *from, bool x32_ABI);
-
 #endif /* _ASM_X86_COMPAT_H */
diff --git a/arch/x86/include/asm/signal.h b/arch/x86/include/asm/signal.h
index 33d3c88a7225..b3f7a14da428 100644
--- a/arch/x86/include/asm/signal.h
+++ b/arch/x86/include/asm/signal.h
@@ -28,6 +28,9 @@ typedef struct {
 #define SA_IA32_ABI	0x02000000u
 #define SA_X32_ABI	0x01000000u
 
+#define compat_siginfo_flags() \
+	(in_x32_syscall() ? SA_X32_ABI : SA_IA32_ABI)
+
 #ifndef CONFIG_COMPAT
 typedef sigset_t compat_sigset_t;
 #endif
diff --git a/arch/x86/kernel/signal.c b/arch/x86/kernel/signal.c
index 83b74fb38c8f..bbd451631790 100644
--- a/arch/x86/kernel/signal.c
+++ b/arch/x86/kernel/signal.c
@@ -543,7 +543,8 @@ static int x32_setup_rt_frame(struct ksignal *ksig,
 	user_access_end();
 
 	if (ksig->ka.sa.sa_flags & SA_SIGINFO) {
-		if (__copy_siginfo_to_user32(&frame->info, &ksig->info, true))
+		if (__copy_siginfo_to_user32(&frame->info, &ksig->info,
+				SA_X32_ABI))
 			return -EFAULT;
 	}
 
diff --git a/include/linux/compat.h b/include/linux/compat.h
index 0480ba4db592..14eec6116110 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -404,6 +404,8 @@ long compat_put_bitmap(compat_ulong_t __user *umask, unsigned long *mask,
 		       unsigned long bitmap_size);
 int copy_siginfo_from_user32(kernel_siginfo_t *to, const struct compat_siginfo __user *from);
 int copy_siginfo_to_user32(struct compat_siginfo __user *to, const kernel_siginfo_t *from);
+int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
+		const kernel_siginfo_t *from, unsigned int flags);
 int get_compat_sigevent(struct sigevent *event,
 		const struct compat_sigevent __user *u_event);
 
diff --git a/kernel/signal.c b/kernel/signal.c
index e58a6c619824..092fee008242 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -3235,15 +3235,8 @@ int copy_siginfo_from_user(kernel_siginfo_t *to, const siginfo_t __user *from)
 }
 
 #ifdef CONFIG_COMPAT
-int copy_siginfo_to_user32(struct compat_siginfo __user *to,
-			   const struct kernel_siginfo *from)
-#if defined(CONFIG_X86_X32_ABI) || defined(CONFIG_IA32_EMULATION)
-{
-	return __copy_siginfo_to_user32(to, from, in_x32_syscall());
-}
 int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
-			     const struct kernel_siginfo *from, bool x32_ABI)
-#endif
+		const struct kernel_siginfo *from, unsigned int flags)
 {
 	struct compat_siginfo new;
 	memset(&new, 0, sizeof(new));
@@ -3298,7 +3291,7 @@ int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
 		new.si_uid    = from->si_uid;
 		new.si_status = from->si_status;
 #ifdef CONFIG_X86_X32_ABI
-		if (x32_ABI) {
+		if (flags & SA_X32_ABI) {
 			new._sifields._sigchld_x32._utime = from->si_utime;
 			new._sifields._sigchld_x32._stime = from->si_stime;
 		} else
@@ -3326,6 +3319,16 @@ int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
 	return 0;
 }
 
+#ifndef compat_siginfo_flags
+#define compat_siginfo_flags()		0
+#endif
+
+int copy_siginfo_to_user32(struct compat_siginfo __user *to,
+			   const struct kernel_siginfo *from)
+{
+	return __copy_siginfo_to_user32(to, from, compat_siginfo_flags());
+}
+
 static int post_copy_siginfo_from_user32(kernel_siginfo_t *to,
 					 const struct compat_siginfo *from)
 {
-- 
2.25.1

