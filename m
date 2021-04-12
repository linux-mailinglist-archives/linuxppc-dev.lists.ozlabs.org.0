Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0421035BE39
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 10:57:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJjL402SBz3c9F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 18:57:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OTP2OFmR;
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
 header.s=bombadil.20210309 header.b=OTP2OFmR; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJjJf2g6Sz3028
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 18:56:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=LxvmYhcyiXflI7mEeLfipFLfdd+uJPFj4YKGCD/7u/A=; b=OTP2OFmRRMxLLBqU6rrOzVUumn
 kBcLINEwvmTYmqpE2Mqn33DpI/pOnudcAZvCY3fFwhMQ4lDX5A3LnN1QFmHuvU3YdSFr/J/P9GHOk
 h5Sgp+wKe+Q9yWswAE5Mni9IO2Xw93PMnq5aOvxzZWDId+opgZqH81Z0PoyXX1CXVYq+r3/K7G8kx
 rVApaafgGcQyJVAYJ+vKuXjWJJteNP0oaqBZgV93D/bNL3w8iNSyCHZft5TWp03ByObqJ4/cPsf+a
 Mcf/m5wGBP2y8EnhHpnATOje2c9ejvrxWBugzRXqv2lgLamHozgjOECQFRvK5GEJkzP4P/mFuEwd6
 StDkknsQ==;
Received: from [2001:4bb8:199:e2bd:3218:1918:85d1:2852] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lVsMQ-0060EX-AJ; Mon, 12 Apr 2021 08:55:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, x86@kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 4/5] uapi: always define F_GETLK64/F_SETLK64/F_SETLKW64 in
 fcntl.h
Date: Mon, 12 Apr 2021 10:55:44 +0200
Message-Id: <20210412085545.2595431-5-hch@lst.de>
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

The F_GETLK64/F_SETLK64/F_SETLKW64 commands are only implemented for
32-bit syscall APIs, but we also need them for compat handling on 64-bit
kernels.

Given that redefining them is rather error prone, as shown by parisc
getting the opcodes wrong currently, just use the existing definitions
for the compat handling.

In theory we could try to hide them from userspace; but given that only
MIPS manages to properly do that while the asm-generic version used by
most architectures relies on a Kconfig symbol that is never set by
userspace there doesn't seem to be much of a point to even bother.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm64/include/asm/compat.h        | 4 ----
 arch/mips/include/asm/compat.h         | 4 ----
 arch/mips/include/uapi/asm/fcntl.h     | 2 --
 arch/powerpc/include/asm/compat.h      | 4 ----
 arch/s390/include/asm/compat.h         | 4 ----
 arch/sparc/include/asm/compat.h        | 4 ----
 arch/x86/include/asm/compat.h          | 4 ----
 include/uapi/asm-generic/fcntl.h       | 2 --
 tools/include/uapi/asm-generic/fcntl.h | 2 --
 9 files changed, 30 deletions(-)

diff --git a/arch/arm64/include/asm/compat.h b/arch/arm64/include/asm/compat.h
index 23a9fb73c04ff8..a5fe4558a6ecc0 100644
--- a/arch/arm64/include/asm/compat.h
+++ b/arch/arm64/include/asm/compat.h
@@ -74,10 +74,6 @@ struct compat_flock {
 	compat_pid_t	l_pid;
 };
 
-#define F_GETLK64	12	/*  using 'struct flock64' */
-#define F_SETLK64	13
-#define F_SETLKW64	14
-
 struct compat_flock64 {
 	short		l_type;
 	short		l_whence;
diff --git a/arch/mips/include/asm/compat.h b/arch/mips/include/asm/compat.h
index 65975712a22dcf..a13436e91c3938 100644
--- a/arch/mips/include/asm/compat.h
+++ b/arch/mips/include/asm/compat.h
@@ -60,10 +60,6 @@ struct compat_flock {
 	s32		pad[4];
 };
 
-#define F_GETLK64	33
-#define F_SETLK64	34
-#define F_SETLKW64	35
-
 struct compat_flock64 {
 	short		l_type;
 	short		l_whence;
diff --git a/arch/mips/include/uapi/asm/fcntl.h b/arch/mips/include/uapi/asm/fcntl.h
index 9e44ac810db94d..1769fc50d35f0e 100644
--- a/arch/mips/include/uapi/asm/fcntl.h
+++ b/arch/mips/include/uapi/asm/fcntl.h
@@ -44,11 +44,9 @@
 #define F_SETOWN	24	/*  for sockets. */
 #define F_GETOWN	23	/*  for sockets. */
 
-#ifndef __mips64
 #define F_GETLK64	33	/*  using 'struct flock64' */
 #define F_SETLK64	34
 #define F_SETLKW64	35
-#endif
 
 #if _MIPS_SIM != _MIPS_SIM_ABI64
 #define __ARCH_FLOCK_EXTRA_SYSID	long l_sysid;
diff --git a/arch/powerpc/include/asm/compat.h b/arch/powerpc/include/asm/compat.h
index 9191fc29e6ed11..b0f2c3f7fe45a5 100644
--- a/arch/powerpc/include/asm/compat.h
+++ b/arch/powerpc/include/asm/compat.h
@@ -56,10 +56,6 @@ struct compat_flock {
 	compat_pid_t	l_pid;
 };
 
-#define F_GETLK64	12	/*  using 'struct flock64' */
-#define F_SETLK64	13
-#define F_SETLKW64	14
-
 struct compat_flock64 {
 	short		l_type;
 	short		l_whence;
diff --git a/arch/s390/include/asm/compat.h b/arch/s390/include/asm/compat.h
index ea5b9c34b7be5b..e0896758779da4 100644
--- a/arch/s390/include/asm/compat.h
+++ b/arch/s390/include/asm/compat.h
@@ -111,10 +111,6 @@ struct compat_flock {
 	compat_pid_t	l_pid;
 };
 
-#define F_GETLK64       12
-#define F_SETLK64       13
-#define F_SETLKW64      14    
-
 struct compat_flock64 {
 	short		l_type;
 	short		l_whence;
diff --git a/arch/sparc/include/asm/compat.h b/arch/sparc/include/asm/compat.h
index b85842cda99fe0..4524997424043f 100644
--- a/arch/sparc/include/asm/compat.h
+++ b/arch/sparc/include/asm/compat.h
@@ -85,10 +85,6 @@ struct compat_flock {
 	short		__unused;
 };
 
-#define F_GETLK64	12
-#define F_SETLK64	13
-#define F_SETLKW64	14
-
 struct compat_flock64 {
 	short		l_type;
 	short		l_whence;
diff --git a/arch/x86/include/asm/compat.h b/arch/x86/include/asm/compat.h
index be09c7eac89f09..b1691cf148be10 100644
--- a/arch/x86/include/asm/compat.h
+++ b/arch/x86/include/asm/compat.h
@@ -59,10 +59,6 @@ struct compat_flock {
 	compat_pid_t	l_pid;
 };
 
-#define F_GETLK64	12	/*  using 'struct flock64' */
-#define F_SETLK64	13
-#define F_SETLKW64	14
-
 /*
  * IA32 uses 4 byte alignment for 64 bit quantities,
  * so we need to pack this structure.
diff --git a/include/uapi/asm-generic/fcntl.h b/include/uapi/asm-generic/fcntl.h
index 7e714443a8d2e3..6430a2f8023fc3 100644
--- a/include/uapi/asm-generic/fcntl.h
+++ b/include/uapi/asm-generic/fcntl.h
@@ -116,13 +116,11 @@
 #define F_GETSIG	11	/* for sockets. */
 #endif
 
-#ifndef CONFIG_64BIT
 #ifndef F_GETLK64
 #define F_GETLK64	12	/*  using 'struct flock64' */
 #define F_SETLK64	13
 #define F_SETLKW64	14
 #endif
-#endif
 
 #ifndef F_SETOWN_EX
 #define F_SETOWN_EX	15
diff --git a/tools/include/uapi/asm-generic/fcntl.h b/tools/include/uapi/asm-generic/fcntl.h
index bf961a71802e0e..6e16722026f39a 100644
--- a/tools/include/uapi/asm-generic/fcntl.h
+++ b/tools/include/uapi/asm-generic/fcntl.h
@@ -115,13 +115,11 @@
 #define F_GETSIG	11	/* for sockets. */
 #endif
 
-#ifndef CONFIG_64BIT
 #ifndef F_GETLK64
 #define F_GETLK64	12	/*  using 'struct flock64' */
 #define F_SETLK64	13
 #define F_SETLKW64	14
 #endif
-#endif
 
 #ifndef F_SETOWN_EX
 #define F_SETOWN_EX	15
-- 
2.30.1

