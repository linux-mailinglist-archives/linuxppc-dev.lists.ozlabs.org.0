Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B48A1206B1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 14:11:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47c1qk2CQNzDq9S
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 00:11:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47c1lN2LXdzDqV7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 00:07:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="npdh8pCo"; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 47c1lM5TQ9z9sPK; Tue, 17 Dec 2019 00:07:27 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47c1lM4sRHz9sPc; Tue, 17 Dec 2019 00:07:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1576501647;
 bh=KQO50PKx1jwaxyI0/ceAg6wlA7VtacVtGpvplRJqWs4=;
 h=From:To:Cc:Subject:Date:From;
 b=npdh8pCoJaYvc5x8MnYa5ivdTHsJJVXQjLjvUnxHgQ11TV9HgTw6/Yia6/MoJPkq0
 K7pBmnavbHQpnIz9Qc0JAMUaAewHHhjlKZoOOHRGMtk80MfM3C/QYkzxVeRKV2lL/O
 GoxjR5EHT7NCIEvifBITD7Bq5VKY8eG/5jNnE/ikuHTb3uJKh6fHIHm//co1P4h3UF
 RnzNIX+47seQX5Ani4pHJ8lRFkuTfCq1ZZ105myiAq+G8JkK1wWEcomfexBzZNbbbU
 ZgnmQYracROndQ7tew9AM8w/almM+MHZHuEa516sDoyepx29c2x3PqG8NvWy5eqMby
 ncHWKvgsZHUOQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v3] powerpc: Fix __clear_user() with KUAP enabled
Date: Tue, 17 Dec 2019 00:07:22 +1100
Message-Id: <20191216130722.5545-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.0
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
Cc: andrew.donnellan@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Andrew Donnellan <ajd@linux.ibm.com>

The KUAP implementation adds calls in clear_user() to enable and
disable access to userspace memory. However, it doesn't add these to
__clear_user(), which is used in the ptrace regset code.

As there's only one direct user of __clear_user() (the regset code),
and the time taken to set the AMR for KUAP purposes is going to
dominate the cost of a quick access_ok(), there's not much point
having a separate path.

Rename __clear_user() to __arch_clear_user(), and make __clear_user()
just call clear_user().

Reported-by: syzbot+f25ecf4b2982d8c7a640@syzkaller-ppc64.appspotmail.com
Reported-by: Daniel Axtens <dja@axtens.net>
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Fixes: de78a9c42a79 ("powerpc: Add a framework for Kernel Userspace Access Protection")
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
[mpe: Use __arch_clear_user() for the asm version like arm64 & nds32]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20191209132221.15328-1-ajd@linux.ibm.com
---
 arch/powerpc/include/asm/uaccess.h | 9 +++++++--
 arch/powerpc/lib/string_32.S       | 4 ++--
 arch/powerpc/lib/string_64.S       | 6 +++---
 3 files changed, 12 insertions(+), 7 deletions(-)

v3: mpe: Use __arch_clear_user() for the asm version like arm64 & nds32

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 15002b51ff18..c92fe7fe9692 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -401,7 +401,7 @@ copy_to_user_mcsafe(void __user *to, const void *from, unsigned long n)
 	return n;
 }
 
-extern unsigned long __clear_user(void __user *addr, unsigned long size);
+unsigned long __arch_clear_user(void __user *addr, unsigned long size);
 
 static inline unsigned long clear_user(void __user *addr, unsigned long size)
 {
@@ -409,12 +409,17 @@ static inline unsigned long clear_user(void __user *addr, unsigned long size)
 	might_fault();
 	if (likely(access_ok(addr, size))) {
 		allow_write_to_user(addr, size);
-		ret = __clear_user(addr, size);
+		ret = __arch_clear_user(addr, size);
 		prevent_write_to_user(addr, size);
 	}
 	return ret;
 }
 
+static inline unsigned long __clear_user(void __user *addr, unsigned long size)
+{
+	return clear_user(addr, size);
+}
+
 extern long strncpy_from_user(char *dst, const char __user *src, long count);
 extern __must_check long strnlen_user(const char __user *str, long n);
 
diff --git a/arch/powerpc/lib/string_32.S b/arch/powerpc/lib/string_32.S
index f69a6aab7bfb..1ddb26394e8a 100644
--- a/arch/powerpc/lib/string_32.S
+++ b/arch/powerpc/lib/string_32.S
@@ -17,7 +17,7 @@ CACHELINE_BYTES = L1_CACHE_BYTES
 LG_CACHELINE_BYTES = L1_CACHE_SHIFT
 CACHELINE_MASK = (L1_CACHE_BYTES-1)
 
-_GLOBAL(__clear_user)
+_GLOBAL(__arch_clear_user)
 /*
  * Use dcbz on the complete cache lines in the destination
  * to set them to zero.  This requires that the destination
@@ -87,4 +87,4 @@ _GLOBAL(__clear_user)
 	EX_TABLE(8b, 91b)
 	EX_TABLE(9b, 91b)
 
-EXPORT_SYMBOL(__clear_user)
+EXPORT_SYMBOL(__arch_clear_user)
diff --git a/arch/powerpc/lib/string_64.S b/arch/powerpc/lib/string_64.S
index 507b18b1660e..169872bc0892 100644
--- a/arch/powerpc/lib/string_64.S
+++ b/arch/powerpc/lib/string_64.S
@@ -17,7 +17,7 @@
 	.section	".text"
 
 /**
- * __clear_user: - Zero a block of memory in user space, with less checking.
+ * __arch_clear_user: - Zero a block of memory in user space, with less checking.
  * @to:   Destination address, in user space.
  * @n:    Number of bytes to zero.
  *
@@ -58,7 +58,7 @@ err3;	stb	r0,0(r3)
 	mr	r3,r4
 	blr
 
-_GLOBAL_TOC(__clear_user)
+_GLOBAL_TOC(__arch_clear_user)
 	cmpdi	r4,32
 	neg	r6,r3
 	li	r0,0
@@ -181,4 +181,4 @@ err1;	dcbz	0,r3
 	cmpdi	r4,32
 	blt	.Lshort_clear
 	b	.Lmedium_clear
-EXPORT_SYMBOL(__clear_user)
+EXPORT_SYMBOL(__arch_clear_user)
-- 
2.21.0

