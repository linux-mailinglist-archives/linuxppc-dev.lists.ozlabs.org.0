Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B3C4E41BA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 15:41:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNDhP337Hz3bfm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 01:41:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=faxKNsk9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=faxKNsk9; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNDg46ShKz2xdN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Mar 2022 01:40:32 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7E2A1616B5;
 Tue, 22 Mar 2022 14:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719D8C340F2;
 Tue, 22 Mar 2022 14:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647960029;
 bh=x++Mq2RxURkLMg1JsydDN/FlbWbJrQ+uoj7qljhzM7U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=faxKNsk97ypovZQxUGNVF94Yu6sPv5m2gE3guRFkCALwbMx8vugMaoSkjLl/TsdK8
 pX1lLYdy+jyYR6LX+fX/cjX4yXaJ4BoL8ctpotI1M3KtvdiCPEeHt2NgotM/c26FeH
 efKRXaqJ9KIsnH92f3aO6an4ECs9P3fuqsrXK6CAlCuK+UoAu8+ZsfsS+Xq6dmWeZg
 q4mX7o4lDvd2L+XLx3IqpgpFH3m3eVvBNcPHPnE75Z7c7wlgzd7GoD3XNlBrXsyTQ/
 8v2Fwa3qMJ6fbxBtMr0m45dA175SLelya88rg6h54frbubgcpUNgr9vWLJaxfaM3IG
 jpu9jS8pQZOCA==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, hch@lst.de
Subject: [PATCH V9 01/20] uapi: simplify __ARCH_FLOCK{,64}_PAD a little
Date: Tue, 22 Mar 2022 22:39:44 +0800
Message-Id: <20220322144003.2357128-2-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322144003.2357128-1-guoren@kernel.org>
References: <20220322144003.2357128-1-guoren@kernel.org>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, heiko@sntech.de,
 linux-parisc@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christoph Hellwig <hch@lst.de>

Don't bother to define the symbols empty, just don't use them.
That makes the intent a little more clear.

Remove the unused HAVE_ARCH_STRUCT_FLOCK64 define and merge the
32-bit mips struct flock into the generic one.

Add a new __ARCH_FLOCK_EXTRA_SYSID macro following the style of
__ARCH_FLOCK_PAD to avoid having a separate definition just for
one architecture.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/mips/include/uapi/asm/fcntl.h     | 26 +++-----------------------
 include/uapi/asm-generic/fcntl.h       | 19 +++++++------------
 tools/include/uapi/asm-generic/fcntl.h | 19 +++++++------------
 3 files changed, 17 insertions(+), 47 deletions(-)

diff --git a/arch/mips/include/uapi/asm/fcntl.h b/arch/mips/include/uapi/asm/fcntl.h
index 42e13dead543..9e44ac810db9 100644
--- a/arch/mips/include/uapi/asm/fcntl.h
+++ b/arch/mips/include/uapi/asm/fcntl.h
@@ -50,30 +50,10 @@
 #define F_SETLKW64	35
 #endif
 
-/*
- * The flavours of struct flock.  "struct flock" is the ABI compliant
- * variant.  Finally struct flock64 is the LFS variant of struct flock.	 As
- * a historic accident and inconsistence with the ABI definition it doesn't
- * contain all the same fields as struct flock.
- */
-
 #if _MIPS_SIM != _MIPS_SIM_ABI64
-
-#include <linux/types.h>
-
-struct flock {
-	short	l_type;
-	short	l_whence;
-	__kernel_off_t	l_start;
-	__kernel_off_t	l_len;
-	long	l_sysid;
-	__kernel_pid_t l_pid;
-	long	pad[4];
-};
-
-#define HAVE_ARCH_STRUCT_FLOCK
-
-#endif /* _MIPS_SIM == _MIPS_SIM_ABI32 */
+#define __ARCH_FLOCK_EXTRA_SYSID	long l_sysid;
+#define __ARCH_FLOCK_PAD		long pad[4];
+#endif
 
 #include <asm-generic/fcntl.h>
 
diff --git a/include/uapi/asm-generic/fcntl.h b/include/uapi/asm-generic/fcntl.h
index ecd0f5bdfc1d..77aa9f2ff98d 100644
--- a/include/uapi/asm-generic/fcntl.h
+++ b/include/uapi/asm-generic/fcntl.h
@@ -192,25 +192,19 @@ struct f_owner_ex {
 
 #define F_LINUX_SPECIFIC_BASE	1024
 
-#ifndef HAVE_ARCH_STRUCT_FLOCK
-#ifndef __ARCH_FLOCK_PAD
-#define __ARCH_FLOCK_PAD
-#endif
-
 struct flock {
 	short	l_type;
 	short	l_whence;
 	__kernel_off_t	l_start;
 	__kernel_off_t	l_len;
 	__kernel_pid_t	l_pid;
-	__ARCH_FLOCK_PAD
-};
+#ifdef	__ARCH_FLOCK_EXTRA_SYSID
+	__ARCH_FLOCK_EXTRA_SYSID
 #endif
-
-#ifndef HAVE_ARCH_STRUCT_FLOCK64
-#ifndef __ARCH_FLOCK64_PAD
-#define __ARCH_FLOCK64_PAD
+#ifdef	__ARCH_FLOCK_PAD
+	__ARCH_FLOCK_PAD
 #endif
+};
 
 struct flock64 {
 	short  l_type;
@@ -218,8 +212,9 @@ struct flock64 {
 	__kernel_loff_t l_start;
 	__kernel_loff_t l_len;
 	__kernel_pid_t  l_pid;
+#ifdef	__ARCH_FLOCK64_PAD
 	__ARCH_FLOCK64_PAD
-};
 #endif
+};
 
 #endif /* _ASM_GENERIC_FCNTL_H */
diff --git a/tools/include/uapi/asm-generic/fcntl.h b/tools/include/uapi/asm-generic/fcntl.h
index ac190958c981..99bc9b15ce2b 100644
--- a/tools/include/uapi/asm-generic/fcntl.h
+++ b/tools/include/uapi/asm-generic/fcntl.h
@@ -187,25 +187,19 @@ struct f_owner_ex {
 
 #define F_LINUX_SPECIFIC_BASE	1024
 
-#ifndef HAVE_ARCH_STRUCT_FLOCK
-#ifndef __ARCH_FLOCK_PAD
-#define __ARCH_FLOCK_PAD
-#endif
-
 struct flock {
 	short	l_type;
 	short	l_whence;
 	__kernel_off_t	l_start;
 	__kernel_off_t	l_len;
 	__kernel_pid_t	l_pid;
-	__ARCH_FLOCK_PAD
-};
+#ifdef	__ARCH_FLOCK_EXTRA_SYSID
+	__ARCH_FLOCK_EXTRA_SYSID
 #endif
-
-#ifndef HAVE_ARCH_STRUCT_FLOCK64
-#ifndef __ARCH_FLOCK64_PAD
-#define __ARCH_FLOCK64_PAD
+#ifdef	__ARCH_FLOCK_PAD
+	__ARCH_FLOCK_PAD
 #endif
+};
 
 struct flock64 {
 	short  l_type;
@@ -213,8 +207,9 @@ struct flock64 {
 	__kernel_loff_t l_start;
 	__kernel_loff_t l_len;
 	__kernel_pid_t  l_pid;
+#ifdef	__ARCH_FLOCK64_PAD
 	__ARCH_FLOCK64_PAD
-};
 #endif
+};
 
 #endif /* _ASM_GENERIC_FCNTL_H */
-- 
2.25.1

