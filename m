Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A6E4C5D48
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Feb 2022 17:31:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K68CZ2KxGz3cdS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 03:31:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PBm7qV+f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PBm7qV+f; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K689870Bcz30gg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 03:29:16 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EC19B60F7B;
 Sun, 27 Feb 2022 16:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1648C340F4;
 Sun, 27 Feb 2022 16:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645979355;
 bh=vVOYAfOfRsBaLKmx9ygXmNXla/T1wGlU5of5at4ZrRM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PBm7qV+fHR1ackBx8QekjGC1em2CNG1Yvkh0tIpk6YdSe/GOkidSRDxHwwf0TqW3w
 FB6HCoPXF4fSP1+ffojZqkLuajAERgKSRzg+J6pOa4Z2NxGO15fy9fzobpqPpMX/i3
 3jElkl9eB484++SxR2xorq+nx4sjZt31TSl9omXBrT2JJxVEXJmr2c/SHrWSyUR9o6
 9yUKYEqZGrgI+FoVenbRLc80mX8Ak3QEBA75WS2Vueklw48D1Uk4Tj2J0r7zvpZREA
 9wJU7GnOem4Bx0IU+/tMCCKOsZNw2BnIwLEDAiy/HoDU5VhJCJUJSXgrcVTPP9+DUd
 I99uo98iuD/LQ==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@lst.de
Subject: [PATCH V7 03/20] compat: consolidate the compat_flock{, 64} definition
Date: Mon, 28 Feb 2022 00:28:14 +0800
Message-Id: <20220227162831.674483-4-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220227162831.674483-1-guoren@kernel.org>
References: <20220227162831.674483-1-guoren@kernel.org>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-parisc@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christoph Hellwig <hch@lst.de>

Provide a single common definition for the compat_flock and
compat_flock64 structures using the same tricks as for the native
variants.  Another extra define is added for the packing required on
x86.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/include/asm/compat.h   | 16 ----------------
 arch/mips/include/asm/compat.h    | 19 ++-----------------
 arch/parisc/include/asm/compat.h  | 16 ----------------
 arch/powerpc/include/asm/compat.h | 16 ----------------
 arch/s390/include/asm/compat.h    | 16 ----------------
 arch/sparc/include/asm/compat.h   | 18 +-----------------
 arch/x86/include/asm/compat.h     | 20 +++-----------------
 include/linux/compat.h            | 31 +++++++++++++++++++++++++++++++
 8 files changed, 37 insertions(+), 115 deletions(-)

diff --git a/arch/arm64/include/asm/compat.h b/arch/arm64/include/asm/compat.h
index 276328765408..e0faec1984a1 100644
--- a/arch/arm64/include/asm/compat.h
+++ b/arch/arm64/include/asm/compat.h
@@ -65,22 +65,6 @@ struct compat_stat {
 	compat_ulong_t	__unused4[2];
 };
 
-struct compat_flock {
-	short		l_type;
-	short		l_whence;
-	compat_off_t	l_start;
-	compat_off_t	l_len;
-	compat_pid_t	l_pid;
-};
-
-struct compat_flock64 {
-	short		l_type;
-	short		l_whence;
-	compat_loff_t	l_start;
-	compat_loff_t	l_len;
-	compat_pid_t	l_pid;
-};
-
 struct compat_statfs {
 	int		f_type;
 	int		f_bsize;
diff --git a/arch/mips/include/asm/compat.h b/arch/mips/include/asm/compat.h
index 6a350c1f70d7..6d6e5a451f4d 100644
--- a/arch/mips/include/asm/compat.h
+++ b/arch/mips/include/asm/compat.h
@@ -55,23 +55,8 @@ struct compat_stat {
 	s32		st_pad4[14];
 };
 
-struct compat_flock {
-	short		l_type;
-	short		l_whence;
-	compat_off_t	l_start;
-	compat_off_t	l_len;
-	s32		l_sysid;
-	compat_pid_t	l_pid;
-	s32		pad[4];
-};
-
-struct compat_flock64 {
-	short		l_type;
-	short		l_whence;
-	compat_loff_t	l_start;
-	compat_loff_t	l_len;
-	compat_pid_t	l_pid;
-};
+#define __ARCH_COMPAT_FLOCK_EXTRA_SYSID		s32 l_sysid;
+#define __ARCH_COMPAT_FLOCK_PAD			s32 pad[4];
 
 struct compat_statfs {
 	int		f_type;
diff --git a/arch/parisc/include/asm/compat.h b/arch/parisc/include/asm/compat.h
index c04f5a637c39..a1e4534d8050 100644
--- a/arch/parisc/include/asm/compat.h
+++ b/arch/parisc/include/asm/compat.h
@@ -53,22 +53,6 @@ struct compat_stat {
 	u32			st_spare4[3];
 };
 
-struct compat_flock {
-	short			l_type;
-	short			l_whence;
-	compat_off_t		l_start;
-	compat_off_t		l_len;
-	compat_pid_t		l_pid;
-};
-
-struct compat_flock64 {
-	short			l_type;
-	short			l_whence;
-	compat_loff_t		l_start;
-	compat_loff_t		l_len;
-	compat_pid_t		l_pid;
-};
-
 struct compat_statfs {
 	s32		f_type;
 	s32		f_bsize;
diff --git a/arch/powerpc/include/asm/compat.h b/arch/powerpc/include/asm/compat.h
index 83d8f70779cb..5ef3c7c83c34 100644
--- a/arch/powerpc/include/asm/compat.h
+++ b/arch/powerpc/include/asm/compat.h
@@ -44,22 +44,6 @@ struct compat_stat {
 	u32		__unused4[2];
 };
 
-struct compat_flock {
-	short		l_type;
-	short		l_whence;
-	compat_off_t	l_start;
-	compat_off_t	l_len;
-	compat_pid_t	l_pid;
-};
-
-struct compat_flock64 {
-	short		l_type;
-	short		l_whence;
-	compat_loff_t	l_start;
-	compat_loff_t	l_len;
-	compat_pid_t	l_pid;
-};
-
 struct compat_statfs {
 	int		f_type;
 	int		f_bsize;
diff --git a/arch/s390/include/asm/compat.h b/arch/s390/include/asm/compat.h
index 0f14b3188b1b..07f04d37068b 100644
--- a/arch/s390/include/asm/compat.h
+++ b/arch/s390/include/asm/compat.h
@@ -102,22 +102,6 @@ struct compat_stat {
 	u32		__unused5;
 };
 
-struct compat_flock {
-	short		l_type;
-	short		l_whence;
-	compat_off_t	l_start;
-	compat_off_t	l_len;
-	compat_pid_t	l_pid;
-};
-
-struct compat_flock64 {
-	short		l_type;
-	short		l_whence;
-	compat_loff_t	l_start;
-	compat_loff_t	l_len;
-	compat_pid_t	l_pid;
-};
-
 struct compat_statfs {
 	u32		f_type;
 	u32		f_bsize;
diff --git a/arch/sparc/include/asm/compat.h b/arch/sparc/include/asm/compat.h
index 108078751bb5..d78fb44942e0 100644
--- a/arch/sparc/include/asm/compat.h
+++ b/arch/sparc/include/asm/compat.h
@@ -75,23 +75,7 @@ struct compat_stat64 {
 	unsigned int	__unused5;
 };
 
-struct compat_flock {
-	short		l_type;
-	short		l_whence;
-	compat_off_t	l_start;
-	compat_off_t	l_len;
-	compat_pid_t	l_pid;
-	short		__unused;
-};
-
-struct compat_flock64 {
-	short		l_type;
-	short		l_whence;
-	compat_loff_t	l_start;
-	compat_loff_t	l_len;
-	compat_pid_t	l_pid;
-	short		__unused;
-};
+#define __ARCH_COMPAT_FLOCK_PAD		short __unused;
 
 struct compat_statfs {
 	int		f_type;
diff --git a/arch/x86/include/asm/compat.h b/arch/x86/include/asm/compat.h
index 8d19a212f4f2..de794d895866 100644
--- a/arch/x86/include/asm/compat.h
+++ b/arch/x86/include/asm/compat.h
@@ -50,25 +50,11 @@ struct compat_stat {
 	u32		__unused5;
 };
 
-struct compat_flock {
-	short		l_type;
-	short		l_whence;
-	compat_off_t	l_start;
-	compat_off_t	l_len;
-	compat_pid_t	l_pid;
-};
-
 /*
- * IA32 uses 4 byte alignment for 64 bit quantities,
- * so we need to pack this structure.
+ * IA32 uses 4 byte alignment for 64 bit quantities, so we need to pack the
+ * compat flock64 structure.
  */
-struct compat_flock64 {
-	short		l_type;
-	short		l_whence;
-	compat_loff_t	l_start;
-	compat_loff_t	l_len;
-	compat_pid_t	l_pid;
-} __attribute__((packed));
+#define __ARCH_NEED_COMPAT_FLOCK64_PACKED
 
 struct compat_statfs {
 	int		f_type;
diff --git a/include/linux/compat.h b/include/linux/compat.h
index 1c758b0e0359..a0481fe6c5d5 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -258,6 +258,37 @@ struct compat_rlimit {
 	compat_ulong_t	rlim_max;
 };
 
+#ifdef __ARCH_NEED_COMPAT_FLOCK64_PACKED
+#define __ARCH_COMPAT_FLOCK64_PACK	__attribute__((packed))
+#else
+#define __ARCH_COMPAT_FLOCK64_PACK
+#endif
+
+struct compat_flock {
+	short			l_type;
+	short			l_whence;
+	compat_off_t		l_start;
+	compat_off_t		l_len;
+#ifdef __ARCH_COMPAT_FLOCK_EXTRA_SYSID
+	__ARCH_COMPAT_FLOCK_EXTRA_SYSID
+#endif
+	compat_pid_t		l_pid;
+#ifdef __ARCH_COMPAT_FLOCK_PAD
+	__ARCH_COMPAT_FLOCK_PAD
+#endif
+};
+
+struct compat_flock64 {
+	short		l_type;
+	short		l_whence;
+	compat_loff_t	l_start;
+	compat_loff_t	l_len;
+	compat_pid_t	l_pid;
+#ifdef __ARCH_COMPAT_FLOCK64_PAD
+	__ARCH_COMPAT_FLOCK64_PAD
+#endif
+} __ARCH_COMPAT_FLOCK64_PACK;
+
 struct compat_rusage {
 	struct old_timeval32 ru_utime;
 	struct old_timeval32 ru_stime;
-- 
2.25.1

