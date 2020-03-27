Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6F6195D33
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 18:54:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pqHN3pQSzDrGx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 04:54:24 +1100 (AEDT)
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
 header.s=mail header.b=jw+9MHQZ; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pqFT5ry2zDqXw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 04:52:45 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48pqFN5mDGzB09ZK;
 Fri, 27 Mar 2020 18:52:40 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=jw+9MHQZ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id g7g1nK4BqJa0; Fri, 27 Mar 2020 18:52:40 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48pqFN4f8ZzB09ZJ;
 Fri, 27 Mar 2020 18:52:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585331560; bh=Cbek0XVvKfaVKnneJmrgR/xQH6CBus/nu6uM+I0eXtU=;
 h=From:Subject:To:Cc:Date:From;
 b=jw+9MHQZRMbEKRds2Q1DGHLaJO8zflM5EUaWnRdLjnXkbLizfDBkKVGh+x+LVFMPC
 gI1BNR6My3SPldhB8dBKbP+kFaSjFWpMWZ1BRUbBdyXcK6lDx0v/vDpK0xUM09nm/G
 MXh9IS8QaiPRhRi/0S2M1jE399DwrGnj+VsD0Ty0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 25B828B829;
 Fri, 27 Mar 2020 18:52:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xSjLtHrvVCUk; Fri, 27 Mar 2020 18:52:42 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D33548B822;
 Fri, 27 Mar 2020 18:52:41 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9076A655F1; Fri, 27 Mar 2020 17:52:41 +0000 (UTC)
Message-Id: <86c0faa8c035d2b3aaee8160d992fedcf4b1d7d6.1585331544.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH] powerpc: Use ppu_intrinsics.h instead of opencoding
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 segher@kernel.crashing.org
Date: Fri, 27 Mar 2020 17:52:41 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ppu_intrinsics.h already includes helpers for things
like sync(), isync(), dcbX(), etc ...

Use it instead of opencoding.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/barrier.h  | 11 +++++++----
 arch/powerpc/include/asm/cache.h    | 25 ++++++-------------------
 arch/powerpc/include/asm/checksum.h |  4 +++-
 arch/powerpc/include/asm/synch.h    | 12 ++++--------
 4 files changed, 20 insertions(+), 32 deletions(-)

diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
index 123adcefd40f..392c91519220 100644
--- a/arch/powerpc/include/asm/barrier.h
+++ b/arch/powerpc/include/asm/barrier.h
@@ -7,6 +7,10 @@
 
 #include <asm/asm-const.h>
 
+#ifndef __ASSEMBLY__
+#include <ppu_intrinsics.h>
+#endif
+
 /*
  * Memory barrier.
  * The sync instruction guarantees that all memory accesses initiated
@@ -31,9 +35,9 @@
  * However, on CPUs that don't support lwsync, lwsync actually maps to a
  * heavy-weight sync, so smp_wmb() can be a lighter-weight eieio.
  */
-#define mb()   __asm__ __volatile__ ("sync" : : : "memory")
-#define rmb()  __asm__ __volatile__ ("sync" : : : "memory")
-#define wmb()  __asm__ __volatile__ ("sync" : : : "memory")
+#define mb()   __sync()
+#define rmb()  __sync()
+#define wmb()  __sync()
 
 /* The sub-arch has lwsync */
 #if defined(__powerpc64__) || defined(CONFIG_PPC_E500MC)
@@ -42,7 +46,6 @@
 #    define SMPWMB      eieio
 #endif
 
-#define __lwsync()	__asm__ __volatile__ (stringify_in_c(LWSYNC) : : :"memory")
 #define dma_rmb()	__lwsync()
 #define dma_wmb()	__asm__ __volatile__ (stringify_in_c(SMPWMB) : : :"memory")
 
diff --git a/arch/powerpc/include/asm/cache.h b/arch/powerpc/include/asm/cache.h
index 72b81015cebe..5b5e9a63060a 100644
--- a/arch/powerpc/include/asm/cache.h
+++ b/arch/powerpc/include/asm/cache.h
@@ -34,6 +34,8 @@
 #define IFETCH_ALIGN_BYTES	(1 << IFETCH_ALIGN_SHIFT)
 
 #if !defined(__ASSEMBLY__)
+#include <ppu_intrinsics.h>
+
 #ifdef CONFIG_PPC64
 
 struct ppc_cache_info {
@@ -111,31 +113,16 @@ extern void _set_L3CR(unsigned long);
 #define _set_L3CR(val)	do { } while(0)
 #endif
 
-static inline void dcbz(void *addr)
-{
-	__asm__ __volatile__ ("dcbz 0, %0" : : "r"(addr) : "memory");
-}
+#define dcbz	__dcbz
+#define dcbf	__dcbf
+#define dcbst	__dcbst
+#define icbi	__icbi
 
 static inline void dcbi(void *addr)
 {
 	__asm__ __volatile__ ("dcbi 0, %0" : : "r"(addr) : "memory");
 }
 
-static inline void dcbf(void *addr)
-{
-	__asm__ __volatile__ ("dcbf 0, %0" : : "r"(addr) : "memory");
-}
-
-static inline void dcbst(void *addr)
-{
-	__asm__ __volatile__ ("dcbst 0, %0" : : "r"(addr) : "memory");
-}
-
-static inline void icbi(void *addr)
-{
-	asm volatile ("icbi 0, %0" : : "r"(addr) : "memory");
-}
-
 static inline void iccci(void *addr)
 {
 	asm volatile ("iccci 0, %0" : : "r"(addr) : "memory");
diff --git a/arch/powerpc/include/asm/checksum.h b/arch/powerpc/include/asm/checksum.h
index 9cce06194dcc..16abea7c3c64 100644
--- a/arch/powerpc/include/asm/checksum.h
+++ b/arch/powerpc/include/asm/checksum.h
@@ -8,6 +8,8 @@
 
 #include <linux/bitops.h>
 #include <linux/in6.h>
+
+#include <ppu_intrinsics.h>
 /*
  * Computes the checksum of a memory block at src, length len,
  * and adds in "sum" (32-bit), while copying the block to dst.
@@ -42,7 +44,7 @@ static inline __sum16 csum_fold(__wsum sum)
 	unsigned int tmp;
 
 	/* swap the two 16-bit halves of sum */
-	__asm__("rlwinm %0,%1,16,0,31" : "=r" (tmp) : "r" (sum));
+	tmp = __rlwinm(sum, 16, 0, 31);
 	/* if there is a carry from adding the two 16-bit halves,
 	   it will carry from the lower half into the upper half,
 	   giving us the correct sum in the upper half. */
diff --git a/arch/powerpc/include/asm/synch.h b/arch/powerpc/include/asm/synch.h
index aca70fb43147..44020f89854e 100644
--- a/arch/powerpc/include/asm/synch.h
+++ b/arch/powerpc/include/asm/synch.h
@@ -7,19 +7,15 @@
 #include <asm/asm-const.h>
 
 #ifndef __ASSEMBLY__
+#include <ppu_intrinsics.h>
+
 extern unsigned int __start___lwsync_fixup, __stop___lwsync_fixup;
 extern void do_lwsync_fixups(unsigned long value, void *fixup_start,
 			     void *fixup_end);
 
-static inline void eieio(void)
-{
-	__asm__ __volatile__ ("eieio" : : : "memory");
-}
+#define eieio __eieio
+#define isync __isync
 
-static inline void isync(void)
-{
-	__asm__ __volatile__ ("isync" : : : "memory");
-}
 #endif /* __ASSEMBLY__ */
 
 #if defined(__powerpc64__)
-- 
2.25.0

