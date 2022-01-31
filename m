Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A97A4A3DFF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 07:52:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnJfS6ZgJz3clG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 17:52:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2wHDUbeX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+c8a487c16eeb054acd37+6735+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=2wHDUbeX; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnJb5176Lz2xsr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 17:49:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=YPdtp3MMdYBOT+dKzT+z6QQM+orc5I5hD1r8rX45u+g=; b=2wHDUbeXew4fDbmm1TKLZZYU55
 Fdclg5ZMte4Vuf3RQviuZD9VdhYTPWInEQT7JMp/i8qFibBTsXc+pFB4wXuDk9xByP5vsF6BdL9ZU
 LPeF1KhHQ0Ho1H13Hsq68za5yjqqGkrSCTljWUn6YwUTYIrCrtp447hQa5gA8LXeTJy/HUGEtedr0
 ypt6zSRiYsi/rRY+AVh0UbHgWY2F4UVo0JICxDOYqcyOe9NqcF0BMUzbuyupkfMfFn0peEMYJfaRT
 3W9aqYLL/vgX3T2Vyvq0ijMF7aTGcjkTUtWpnPLManWVBXDMXyaJGxXtr+/ON9FLbS7RmzqVfaW5j
 AM5IE27g==;
Received: from [2001:4bb8:191:327d:13f5:1d0a:e266:6974] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEQVY-008AVp-Co; Mon, 31 Jan 2022 06:49:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 4/5] uapi: always define F_GETLK64/F_SETLK64/F_SETLKW64 in
 fcntl.h
Date: Mon, 31 Jan 2022 07:49:32 +0100
Message-Id: <20220131064933.3780271-5-hch@lst.de>
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

The F_GETLK64/F_SETLK64/F_SETLKW64 fcntl opcodes are only implemented
for the 32-bit syscall APIs, but are also needed for compat handling
on 64-bit kernels.

Consolidate them in unistd.h instead of definining the internal compat
definitions in compat.h, which is rather errror prone (e.g. parisc
gets the values wrong currently).

Note that before this change they were never visible to userspace due
to the fact that CONFIG_64BIT is only set for kernel builds.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm64/include/asm/compat.h        | 4 ----
 arch/mips/include/asm/compat.h         | 4 ----
 arch/mips/include/uapi/asm/fcntl.h     | 4 ++--
 arch/powerpc/include/asm/compat.h      | 4 ----
 arch/s390/include/asm/compat.h         | 4 ----
 arch/sparc/include/asm/compat.h        | 4 ----
 arch/x86/include/asm/compat.h          | 4 ----
 include/uapi/asm-generic/fcntl.h       | 4 ++--
 tools/include/uapi/asm-generic/fcntl.h | 2 --
 9 files changed, 4 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/include/asm/compat.h b/arch/arm64/include/asm/compat.h
index eaa6ca062d89b..2763287654081 100644
--- a/arch/arm64/include/asm/compat.h
+++ b/arch/arm64/include/asm/compat.h
@@ -73,10 +73,6 @@ struct compat_flock {
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
index bbb3bc5a42fd8..6a350c1f70d7e 100644
--- a/arch/mips/include/asm/compat.h
+++ b/arch/mips/include/asm/compat.h
@@ -65,10 +65,6 @@ struct compat_flock {
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
index 9e44ac810db94..0369a38e3d4f2 100644
--- a/arch/mips/include/uapi/asm/fcntl.h
+++ b/arch/mips/include/uapi/asm/fcntl.h
@@ -44,11 +44,11 @@
 #define F_SETOWN	24	/*  for sockets. */
 #define F_GETOWN	23	/*  for sockets. */
 
-#ifndef __mips64
+#if __BITS_PER_LONG == 32 || defined(__KERNEL__)
 #define F_GETLK64	33	/*  using 'struct flock64' */
 #define F_SETLK64	34
 #define F_SETLKW64	35
-#endif
+#endif /* __BITS_PER_LONG == 32 || defined(__KERNEL__) */
 
 #if _MIPS_SIM != _MIPS_SIM_ABI64
 #define __ARCH_FLOCK_EXTRA_SYSID	long l_sysid;
diff --git a/arch/powerpc/include/asm/compat.h b/arch/powerpc/include/asm/compat.h
index 7afc96fb6524b..83d8f70779cbc 100644
--- a/arch/powerpc/include/asm/compat.h
+++ b/arch/powerpc/include/asm/compat.h
@@ -52,10 +52,6 @@ struct compat_flock {
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
index cdc7ae72529d8..0f14b3188b1bb 100644
--- a/arch/s390/include/asm/compat.h
+++ b/arch/s390/include/asm/compat.h
@@ -110,10 +110,6 @@ struct compat_flock {
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
index bd949fcf9d63b..108078751bb5a 100644
--- a/arch/sparc/include/asm/compat.h
+++ b/arch/sparc/include/asm/compat.h
@@ -84,10 +84,6 @@ struct compat_flock {
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
index 7516e4199b3c6..8d19a212f4f26 100644
--- a/arch/x86/include/asm/compat.h
+++ b/arch/x86/include/asm/compat.h
@@ -58,10 +58,6 @@ struct compat_flock {
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
index 98f4ff165b776..8c05d3d89ff18 100644
--- a/include/uapi/asm-generic/fcntl.h
+++ b/include/uapi/asm-generic/fcntl.h
@@ -116,13 +116,13 @@
 #define F_GETSIG	11	/* for sockets. */
 #endif
 
-#ifndef CONFIG_64BIT
+#if __BITS_PER_LONG == 32 || defined(__KERNEL__)
 #ifndef F_GETLK64
 #define F_GETLK64	12	/*  using 'struct flock64' */
 #define F_SETLK64	13
 #define F_SETLKW64	14
 #endif
-#endif
+#endif /* __BITS_PER_LONG == 32 || defined(__KERNEL__) */
 
 #ifndef F_SETOWN_EX
 #define F_SETOWN_EX	15
diff --git a/tools/include/uapi/asm-generic/fcntl.h b/tools/include/uapi/asm-generic/fcntl.h
index bf961a71802e0..6e16722026f39 100644
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
2.30.2

