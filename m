Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECB34C26A0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 09:56:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K46GN2gcsz3cPP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 19:56:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RjUB5Xh2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RjUB5Xh2; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K46Dc5zs0z3bV2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 19:55:12 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BD50E61B10;
 Thu, 24 Feb 2022 08:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB72C340EB;
 Thu, 24 Feb 2022 08:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645692911;
 bh=k8swjM4C0REanvyDU5IGed9a/4kmPz1sF37iD27Pza0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RjUB5Xh2ud2BeebXyt9+RVKU67rapyDsAm29oyUEKXAPNmnkSevJ682kUeb9rVU5P
 Eu2OVrgzNGv03VVaCj0FZ+xcDVZjMgUR2kD6qM61b4SJSc87WbQo54Uhi+Zmk2w593
 NnjMgMJ2gxCJht1NogAR0/5hJPsuBqCTHPCquJy+GIg9U8+i96niEisNGn0mF+Te6v
 VZAO4/aq1/q5mL3HQISmRo9qpCGSZTJwAllvARsPYbw3KIfQQqtMGfkh6ldjofokVF
 ZETfYlXPolYzZ2Ofg6MBhz57O8o7EoJjpyvzMuA/9a9i6QokPM/WYHlrQO2Pz1BBDm
 KDFMKJzrolpWQ==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@lst.de
Subject: [PATCH V6 02/20] uapi: always define F_GETLK64/F_SETLK64/F_SETLKW64
 in fcntl.h
Date: Thu, 24 Feb 2022 16:53:52 +0800
Message-Id: <20220224085410.399351-3-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224085410.399351-1-guoren@kernel.org>
References: <20220224085410.399351-1-guoren@kernel.org>
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

The F_GETLK64/F_SETLK64/F_SETLKW64 fcntl opcodes are only implemented
for the 32-bit syscall APIs, but are also needed for compat handling
on 64-bit kernels.

Consolidate them in unistd.h instead of definining the internal compat
definitions in compat.h, which is rather error prone (e.g. parisc
gets the values wrong currently).

Note that before this change they were never visible to userspace due
to the fact that CONFIG_64BIT is only set for kernel builds.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
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
index eaa6ca062d89..276328765408 100644
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
index bbb3bc5a42fd..6a350c1f70d7 100644
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
index 9e44ac810db9..0369a38e3d4f 100644
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
index 7afc96fb6524..83d8f70779cb 100644
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
index cdc7ae72529d..0f14b3188b1b 100644
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
index bd949fcf9d63..108078751bb5 100644
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
index 7516e4199b3c..8d19a212f4f2 100644
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
index 77aa9f2ff98d..f13d37b60775 100644
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
index 99bc9b15ce2b..0197042b7dfb 100644
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
2.25.1

