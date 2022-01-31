Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCD04A3DFD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 07:51:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnJd36vP8z3cZl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 17:51:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D0ZZl1v2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+c8a487c16eeb054acd37+6735+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnJb21gYBz2xs1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 17:49:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=3xq9j8U8ub/MMOrNpWwtn1DKjO93OQwBeHPFOi4XKTU=; b=D0ZZl1v2tu3ri2whQEO4v7WDfe
 FnSQdoM26LoNYlgpoRuyJy5p93jrfBICe6pzUHX2XHtw0b4mBroVFYRXT72aIkqD38nx1RA+Fy7r/
 DJkzocokjzASIqSG/QgTS56EmR9q0JiBl9MEvpjFZLTBMw5mwSG1BRot/bHXhztQCraqwCvJi3hNX
 BzQ3a5tHxQHzGO9vJMnPGuZx0FeRZ3aJHZXPn0t2/dixOfmUVHQmiKsA4QkEVQNdZUrVnjWEvdLT8
 m1bRNEZZkNapIZekxBLatv3XfpXS2lHUl5AD8S3gXGHX6ftHlk3JLmz1U0VN2b9vAb7vYNJq05X1v
 lsZu/m/A==;
Received: from [2001:4bb8:191:327d:13f5:1d0a:e266:6974] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEQVV-008AVI-Cg; Mon, 31 Jan 2022 06:49:45 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 3/5] uapi: merge the 32-bit mips struct flock into the generic
 one
Date: Mon, 31 Jan 2022 07:49:31 +0100
Message-Id: <20220131064933.3780271-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220131064933.3780271-1-hch@lst.de>
References: <20220131064933.3780271-1-hch@lst.de>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-parisc@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a new __ARCH_FLOCK_EXTRA_SYSID macro following the style of
__ARCH_FLOCK_PAD to avoid having a separate definition just for one
architecture.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/include/uapi/asm/fcntl.h     | 26 +++-----------------------
 include/uapi/asm-generic/fcntl.h       |  5 +++--
 tools/include/uapi/asm-generic/fcntl.h |  5 +++--
 3 files changed, 9 insertions(+), 27 deletions(-)

diff --git a/arch/mips/include/uapi/asm/fcntl.h b/arch/mips/include/uapi/asm/fcntl.h
index 42e13dead5431..9e44ac810db94 100644
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
index c53897ca5d402..98f4ff165b776 100644
--- a/include/uapi/asm-generic/fcntl.h
+++ b/include/uapi/asm-generic/fcntl.h
@@ -192,18 +192,19 @@ struct f_owner_ex {
 
 #define F_LINUX_SPECIFIC_BASE	1024
 
-#ifndef HAVE_ARCH_STRUCT_FLOCK
 struct flock {
 	short	l_type;
 	short	l_whence;
 	__kernel_off_t	l_start;
 	__kernel_off_t	l_len;
+#ifdef __ARCH_FLOCK_EXTRA_SYSID
+	__ARCH_FLOCK_EXTRA_SYSID
+#endif
 	__kernel_pid_t	l_pid;
 #ifdef __ARCH_FLOCK_PAD
 	__ARCH_FLOCK_PAD
 #endif
 };
-#endif
 
 struct flock64 {
 	short  l_type;
diff --git a/tools/include/uapi/asm-generic/fcntl.h b/tools/include/uapi/asm-generic/fcntl.h
index 82054502b9748..bf961a71802e0 100644
--- a/tools/include/uapi/asm-generic/fcntl.h
+++ b/tools/include/uapi/asm-generic/fcntl.h
@@ -187,18 +187,19 @@ struct f_owner_ex {
 
 #define F_LINUX_SPECIFIC_BASE	1024
 
-#ifndef HAVE_ARCH_STRUCT_FLOCK
 struct flock {
 	short	l_type;
 	short	l_whence;
 	__kernel_off_t	l_start;
 	__kernel_off_t	l_len;
+#ifdef __ARCH_FLOCK_EXTRA_SYSID
+	__ARCH_FLOCK_EXTRA_SYSID
+#endif
 	__kernel_pid_t	l_pid;
 #ifdef __ARCH_FLOCK_PAD
 	__ARCH_FLOCK_PAD
 #endif
 };
-#endif
 
 struct flock64 {
 	short  l_type;
-- 
2.30.2

