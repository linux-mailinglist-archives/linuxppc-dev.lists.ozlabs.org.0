Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5032735BE7A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 10:58:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJjMW20VCz3ckj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 18:58:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cjDfmbji;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+68317ec28ad53de92ceb+6441+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=cjDfmbji; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJjJf4q4jz302H
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 18:56:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=fgQRdEagpaZNMUiuJhh4HzfGVzVozqLdJZdOWxKQU1Q=; b=cjDfmbjibw3FJuZW9g7tculTQg
 X5UvjE9IN7RhJyE/cV0JXLAPTzZytj4G7rKj403Lyboz+4QxvrO1a89CTwjn+bZeCtnPPitmpmBSC
 AsDZ/qwwP7pWoQMpmV+BZf6km/T1Hy/Mmc5r3ZoODDHFLULPIZn9jE/iENE1oTYHtL1wkxHb098rS
 jG58BQ7+YiChH1rk9FP2yyQc2lAjiaJjOrAIwngUci9JvxWqMYeecrSSvI0FhOk3arbLv9SIFfEK3
 n4f19h/Um9lfBoZv5EstKKZVj+tNBKGTWgaeDgytQikNo8F74AjvZX+I5mXCjY0cu2XoNFMTUXrl2
 brfnNDXQ==;
Received: from [2001:4bb8:199:e2bd:3218:1918:85d1:2852] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lVsMN-0060EC-J3; Mon, 12 Apr 2021 08:55:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, x86@kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 3/5] uapi: merge the 32-bit mips struct flock into the generic
 one
Date: Mon, 12 Apr 2021 10:55:43 +0200
Message-Id: <20210412085545.2595431-4-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210412085545.2595431-1-hch@lst.de>
References: <20210412085545.2595431-1-hch@lst.de>
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
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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
index 42e13dead54319..9e44ac810db94d 100644
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
index df7ad6962dff71..7e714443a8d2e3 100644
--- a/include/uapi/asm-generic/fcntl.h
+++ b/include/uapi/asm-generic/fcntl.h
@@ -188,18 +188,19 @@ struct f_owner_ex {
 
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
index 82054502b9748d..bf961a71802e0e 100644
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
2.30.1

