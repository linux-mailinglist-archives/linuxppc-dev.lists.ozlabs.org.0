Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF567145B3B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 18:58:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482tS55TxTzDqPn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 04:58:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=gGpODbFv; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482tKg4c0RzDqSs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 04:52:53 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 482tKX5r05z9vBf3;
 Wed, 22 Jan 2020 18:52:48 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=gGpODbFv; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id mYkjZ78L7c6N; Wed, 22 Jan 2020 18:52:48 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 482tKX4Qslz9vBf1;
 Wed, 22 Jan 2020 18:52:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579715568; bh=HvnrtvYiKgvnkXbw3FpWnMmIinfbbTbbd74kJVtIDsM=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=gGpODbFv5usK7ndjTr2Ssb5xpSLwGxV10Q36IjkNjsCOIMJBeuSQn49ciQrbgn6rv
 PWgcGyV0Fim/O6Y7wT8i8Pw3K696oe5eWBm+P4H9aUCcPVWGwot7W/c0XOzuDcWEQD
 DbJS20PX7+HDGNeky5btREc4hE7y0Xw8dWZmryOI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 51C9D8B810;
 Wed, 22 Jan 2020 18:52:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ojChS46CJUbv; Wed, 22 Jan 2020 18:52:50 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D496F8B7FE;
 Wed, 22 Jan 2020 18:52:49 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id ACB3E651E0; Wed, 22 Jan 2020 17:52:49 +0000 (UTC)
Message-Id: <56743b700c56e5d341468151f0e95ff0c46663cd.1579715466.git.christophe.leroy@c-s.fr>
In-Reply-To: <12a4be679e43de1eca6e5e2173163f27e2f25236.1579715466.git.christophe.leroy@c-s.fr>
References: <12a4be679e43de1eca6e5e2173163f27e2f25236.1579715466.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 3/6] powerpc/kuap: Fix set direction in
 allow/prevent_user_access()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 22 Jan 2020 17:52:49 +0000 (UTC)
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

__builtin_constant_p() always return 0 for pointers, so on RADIX
we always end up opening both direction (by writing 0 in SPR29):

0000000000000170 <._copy_to_user>:
...
 1b0:	4c 00 01 2c 	isync
 1b4:	39 20 00 00 	li      r9,0
 1b8:	7d 3d 03 a6 	mtspr   29,r9
 1bc:	4c 00 01 2c 	isync
 1c0:	48 00 00 01 	bl      1c0 <._copy_to_user+0x50>
			1c0: R_PPC64_REL24	.__copy_tofrom_user
...
0000000000000220 <._copy_from_user>:
...
 2ac:	4c 00 01 2c 	isync
 2b0:	39 20 00 00 	li      r9,0
 2b4:	7d 3d 03 a6 	mtspr   29,r9
 2b8:	4c 00 01 2c 	isync
 2bc:	7f c5 f3 78 	mr      r5,r30
 2c0:	7f 83 e3 78 	mr      r3,r28
 2c4:	48 00 00 01 	bl      2c4 <._copy_from_user+0xa4>
			2c4: R_PPC64_REL24	.__copy_tofrom_user
...

Use an explicit parameter for direction selection, so that GCC
is able to see it is a constant:

00000000000001b0 <._copy_to_user>:
...
 1f0:	4c 00 01 2c 	isync
 1f4:	3d 20 40 00 	lis     r9,16384
 1f8:	79 29 07 c6 	rldicr  r9,r9,32,31
 1fc:	7d 3d 03 a6 	mtspr   29,r9
 200:	4c 00 01 2c 	isync
 204:	48 00 00 01 	bl      204 <._copy_to_user+0x54>
			204: R_PPC64_REL24	.__copy_tofrom_user
...
0000000000000260 <._copy_from_user>:
...
 2ec:	4c 00 01 2c 	isync
 2f0:	39 20 ff ff 	li      r9,-1
 2f4:	79 29 00 04 	rldicr  r9,r9,0,0
 2f8:	7d 3d 03 a6 	mtspr   29,r9
 2fc:	4c 00 01 2c 	isync
 300:	7f c5 f3 78 	mr      r5,r30
 304:	7f 83 e3 78 	mr      r3,r28
 308:	48 00 00 01 	bl      308 <._copy_from_user+0xa8>
			308: R_PPC64_REL24	.__copy_tofrom_user
...

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
v2: no change
---
 arch/powerpc/include/asm/book3s/32/kup.h      | 13 ++++++--
 .../powerpc/include/asm/book3s/64/kup-radix.h | 11 +++----
 arch/powerpc/include/asm/kup.h                | 30 ++++++++++++++-----
 arch/powerpc/include/asm/nohash/32/kup-8xx.h  |  4 +--
 arch/powerpc/include/asm/uaccess.h            |  4 +--
 5 files changed, 43 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index d88008c8eb85..d765515bd1c1 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -102,11 +102,13 @@ static inline void kuap_update_sr(u32 sr, u32 addr, u32 end)
 	isync();	/* Context sync required after mtsrin() */
 }
 
-static inline void allow_user_access(void __user *to, const void __user *from, u32 size)
+static __always_inline void allow_user_access(void __user *to, const void __user *from,
+					      u32 size, unsigned long dir)
 {
 	u32 addr, end;
 
-	if (__builtin_constant_p(to) && to == NULL)
+	BUILD_BUG_ON(!__builtin_constant_p(dir));
+	if (!(dir & KUAP_W))
 		return;
 
 	addr = (__force u32)to;
@@ -119,11 +121,16 @@ static inline void allow_user_access(void __user *to, const void __user *from, u
 	kuap_update_sr(mfsrin(addr) & ~SR_KS, addr, end);	/* Clear Ks */
 }
 
-static inline void prevent_user_access(void __user *to, const void __user *from, u32 size)
+static __always_inline void prevent_user_access(void __user *to, const void __user *from,
+						u32 size, unsigned long dir)
 {
 	u32 addr = (__force u32)to;
 	u32 end = min(addr + size, TASK_SIZE);
 
+	BUILD_BUG_ON(!__builtin_constant_p(dir));
+	if (!(dir & KUAP_W))
+		return;
+
 	if (!addr || addr >= TASK_SIZE || !size)
 		return;
 
diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup-radix.h
index dbbd22cb80f5..f11315306d41 100644
--- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
@@ -77,20 +77,21 @@ static inline void set_kuap(unsigned long value)
 	isync();
 }
 
-static inline void allow_user_access(void __user *to, const void __user *from,
-				     unsigned long size)
+static __always_inline void allow_user_access(void __user *to, const void __user *from,
+					      unsigned long size, unsigned long dir)
 {
 	// This is written so we can resolve to a single case at build time
-	if (__builtin_constant_p(to) && to == NULL)
+	BUILD_BUG_ON(!__builtin_constant_p(dir));
+	if (dir == KUAP_R)
 		set_kuap(AMR_KUAP_BLOCK_WRITE);
-	else if (__builtin_constant_p(from) && from == NULL)
+	else if (dir == KUAP_W)
 		set_kuap(AMR_KUAP_BLOCK_READ);
 	else
 		set_kuap(0);
 }
 
 static inline void prevent_user_access(void __user *to, const void __user *from,
-				       unsigned long size)
+				       unsigned long size, unsigned long dir)
 {
 	set_kuap(AMR_KUAP_BLOCKED);
 }
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 812e66f31934..ff57bfcb88f7 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -2,6 +2,10 @@
 #ifndef _ASM_POWERPC_KUP_H_
 #define _ASM_POWERPC_KUP_H_
 
+#define KUAP_R		1
+#define KUAP_W		2
+#define KUAP_RW		(KUAP_R | KUAP_W)
+
 #ifdef CONFIG_PPC64
 #include <asm/book3s/64/kup-radix.h>
 #endif
@@ -42,9 +46,9 @@ void setup_kuap(bool disabled);
 #else
 static inline void setup_kuap(bool disabled) { }
 static inline void allow_user_access(void __user *to, const void __user *from,
-				     unsigned long size) { }
+				     unsigned long size, unsigned long dir) { }
 static inline void prevent_user_access(void __user *to, const void __user *from,
-				       unsigned long size) { }
+				       unsigned long size, unsigned long dir) { }
 static inline bool
 bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
@@ -54,24 +58,36 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 
 static inline void allow_read_from_user(const void __user *from, unsigned long size)
 {
-	allow_user_access(NULL, from, size);
+	allow_user_access(NULL, from, size, KUAP_R);
 }
 
 static inline void allow_write_to_user(void __user *to, unsigned long size)
 {
-	allow_user_access(to, NULL, size);
+	allow_user_access(to, NULL, size, KUAP_W);
+}
+
+static inline void allow_read_write_user(void __user *to, const void __user *from,
+					 unsigned long size)
+{
+	allow_user_access(to, from, size, KUAP_RW);
 }
 
 static inline void prevent_read_from_user(const void __user *from, unsigned long size)
 {
-	prevent_user_access(NULL, from, size);
+	prevent_user_access(NULL, from, size, KUAP_R);
 }
 
 static inline void prevent_write_to_user(void __user *to, unsigned long size)
 {
-	prevent_user_access(to, NULL, size);
+	prevent_user_access(to, NULL, size, KUAP_W);
+}
+
+static inline void prevent_read_write_user(void __user *to, const void __user *from,
+					   unsigned long size)
+{
+	prevent_user_access(to, from, size, KUAP_RW);
 }
 
 #endif /* !__ASSEMBLY__ */
 
-#endif /* _ASM_POWERPC_KUP_H_ */
+#endif /* _ASM_POWERPC_KUAP_H_ */
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index f2fea603b929..1d70c80366fd 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -35,13 +35,13 @@
 #include <asm/reg.h>
 
 static inline void allow_user_access(void __user *to, const void __user *from,
-				     unsigned long size)
+				     unsigned long size, unsigned long dir)
 {
 	mtspr(SPRN_MD_AP, MD_APG_INIT);
 }
 
 static inline void prevent_user_access(void __user *to, const void __user *from,
-				       unsigned long size)
+				       unsigned long size, unsigned long dir)
 {
 	mtspr(SPRN_MD_AP, MD_APG_KUAP);
 }
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index c92fe7fe9692..cafad1960e76 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -313,9 +313,9 @@ raw_copy_in_user(void __user *to, const void __user *from, unsigned long n)
 	unsigned long ret;
 
 	barrier_nospec();
-	allow_user_access(to, from, n);
+	allow_read_write_user(to, from, n);
 	ret = __copy_tofrom_user(to, from, n);
-	prevent_user_access(to, from, n);
+	prevent_read_write_user(to, from, n);
 	return ret;
 }
 #endif /* __powerpc64__ */
-- 
2.25.0

