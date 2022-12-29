Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A9A658C3E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Dec 2022 12:35:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NjRCB3335z3c9y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Dec 2022 22:35:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k/bmGbFI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=andrzej.hajda@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k/bmGbFI;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NjRBF5TGsz2yWN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Dec 2022 22:34:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672313670; x=1703849670;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LESkw7cTmJ8vMdubNYi7qBDUafIvx+wwSE7U9XVcM8g=;
  b=k/bmGbFInNY9caQHIwXaJFi9Pmx8CRyWYvjR08hGCfwSnBmnRvo/cVZ1
   ODkkbxDx7K5mzA+XZLK63k7FfrbWdjGsuiunPmW5EMhrS1Z93k1zqOAfl
   o5vEApDl3MZMfZ7W4+nCvhrJ17pUO32r21cKVh/EeZry6D5MkZQCpgGEv
   SOsHzzeHZ5qnhjpYLkdDMFoIUVKwRqjJ4/Ichwml72ADv+7Wxt5Y/6WXN
   f9TiZcg9sejk/4Dn30j/N6bpOOTuUFCBKdJtKRhlR2DIplMYpLAZDy3WU
   CXVu9zsEv7/mANR7pBPcHkpiwjUnIgySzOnpWaMUrFNycRt6FaQhShLz8
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="323010604"
X-IronPort-AV: E=Sophos;i="5.96,283,1665471600"; 
   d="scan'208";a="323010604"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2022 03:34:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="646987953"
X-IronPort-AV: E=Sophos;i="5.96,283,1665471600"; 
   d="scan'208";a="646987953"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2022 03:34:11 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] arch: rename all internal names __xchg to __arch_xchg
Date: Thu, 29 Dec 2022 12:33:38 +0100
Message-Id: <20221229113338.2436892-1-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <78b23407-bdd0-4b1b-bf6e-ecd4c00294ab@app.fastmail.com>
References: <78b23407-bdd0-4b1b-bf6e-ecd4c00294ab@app.fastmail.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

__xchg will be used for non-atomic xchg macro.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/alpha/include/asm/cmpxchg.h     | 6 +++---
 arch/arc/include/asm/cmpxchg.h       | 4 ++--
 arch/arm/include/asm/cmpxchg.h       | 4 ++--
 arch/arm64/include/asm/cmpxchg.h     | 4 ++--
 arch/hexagon/include/asm/cmpxchg.h   | 6 +++---
 arch/ia64/include/asm/cmpxchg.h      | 2 +-
 arch/ia64/include/uapi/asm/cmpxchg.h | 4 ++--
 arch/loongarch/include/asm/cmpxchg.h | 4 ++--
 arch/m68k/include/asm/cmpxchg.h      | 6 +++---
 arch/mips/include/asm/cmpxchg.h      | 4 ++--
 arch/openrisc/include/asm/cmpxchg.h  | 4 ++--
 arch/parisc/include/asm/cmpxchg.h    | 4 ++--
 arch/powerpc/include/asm/cmpxchg.h   | 4 ++--
 arch/riscv/include/asm/atomic.h      | 2 +-
 arch/riscv/include/asm/cmpxchg.h     | 4 ++--
 arch/s390/include/asm/cmpxchg.h      | 4 ++--
 arch/sh/include/asm/cmpxchg.h        | 4 ++--
 arch/sparc/include/asm/cmpxchg_32.h  | 4 ++--
 arch/sparc/include/asm/cmpxchg_64.h  | 4 ++--
 arch/xtensa/include/asm/cmpxchg.h    | 4 ++--
 20 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/arch/alpha/include/asm/cmpxchg.h b/arch/alpha/include/asm/cmpxchg.h
index 6e0a850aa9d38c..40e8159ef6e794 100644
--- a/arch/alpha/include/asm/cmpxchg.h
+++ b/arch/alpha/include/asm/cmpxchg.h
@@ -6,7 +6,7 @@
  * Atomic exchange routines.
  */
 
-#define ____xchg(type, args...)		__xchg ## type ## _local(args)
+#define ____xchg(type, args...)		__arch_xchg ## type ## _local(args)
 #define ____cmpxchg(type, args...)	__cmpxchg ## type ## _local(args)
 #include <asm/xchg.h>
 
@@ -34,7 +34,7 @@
 
 #undef ____xchg
 #undef ____cmpxchg
-#define ____xchg(type, args...)		__xchg ##type(args)
+#define ____xchg(type, args...)		__arch_xchg ##type(args)
 #define ____cmpxchg(type, args...)	__cmpxchg ##type(args)
 #include <asm/xchg.h>
 
@@ -48,7 +48,7 @@
 	__typeof__(*(ptr)) _x_ = (x);					\
 	smp_mb();							\
 	__ret = (__typeof__(*(ptr)))					\
-		__xchg((ptr), (unsigned long)_x_, sizeof(*(ptr)));	\
+		__arch_xchg((ptr), (unsigned long)_x_, sizeof(*(ptr)));	\
 	smp_mb();							\
 	__ret;								\
 })
diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index c5b544a5fe8106..e138fde067dea5 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -85,7 +85,7 @@
  */
 #ifdef CONFIG_ARC_HAS_LLSC
 
-#define __xchg(ptr, val)						\
+#define __arch_xchg(ptr, val)						\
 ({									\
 	__asm__ __volatile__(						\
 	"	ex  %0, [%1]	\n"	/* set new value */	        \
@@ -102,7 +102,7 @@
 									\
 	switch(sizeof(*(_p_))) {					\
 	case 4:								\
-		_val_ = __xchg(_p_, _val_);				\
+		_val_ = __arch_xchg(_p_, _val_);			\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
diff --git a/arch/arm/include/asm/cmpxchg.h b/arch/arm/include/asm/cmpxchg.h
index 4dfe538dfc689b..6953fc05a97886 100644
--- a/arch/arm/include/asm/cmpxchg.h
+++ b/arch/arm/include/asm/cmpxchg.h
@@ -25,7 +25,7 @@
 #define swp_is_buggy
 #endif
 
-static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size)
+static inline unsigned long __arch_xchg(unsigned long x, volatile void *ptr, int size)
 {
 	extern void __bad_xchg(volatile void *, int);
 	unsigned long ret;
@@ -115,7 +115,7 @@ static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size
 }
 
 #define arch_xchg_relaxed(ptr, x) ({					\
-	(__typeof__(*(ptr)))__xchg((unsigned long)(x), (ptr),		\
+	(__typeof__(*(ptr)))__arch_xchg((unsigned long)(x), (ptr),		\
 				   sizeof(*(ptr)));			\
 })
 
diff --git a/arch/arm64/include/asm/cmpxchg.h b/arch/arm64/include/asm/cmpxchg.h
index 497acf134d9923..3a36ba58e8c2ef 100644
--- a/arch/arm64/include/asm/cmpxchg.h
+++ b/arch/arm64/include/asm/cmpxchg.h
@@ -62,7 +62,7 @@ __XCHG_CASE( ,  ,  mb_, 64, dmb ish, nop,  , a, l, "memory")
 #undef __XCHG_CASE
 
 #define __XCHG_GEN(sfx)							\
-static __always_inline  unsigned long __xchg##sfx(unsigned long x,	\
+static __always_inline  unsigned long __arch_xchg##sfx(unsigned long x,	\
 					volatile void *ptr,		\
 					int size)			\
 {									\
@@ -93,7 +93,7 @@ __XCHG_GEN(_mb)
 ({									\
 	__typeof__(*(ptr)) __ret;					\
 	__ret = (__typeof__(*(ptr)))					\
-		__xchg##sfx((unsigned long)(x), (ptr), sizeof(*(ptr))); \
+		__arch_xchg##sfx((unsigned long)(x), (ptr), sizeof(*(ptr))); \
 	__ret;								\
 })
 
diff --git a/arch/hexagon/include/asm/cmpxchg.h b/arch/hexagon/include/asm/cmpxchg.h
index cdb705e1496af8..92dc5e5f836f3b 100644
--- a/arch/hexagon/include/asm/cmpxchg.h
+++ b/arch/hexagon/include/asm/cmpxchg.h
@@ -9,7 +9,7 @@
 #define _ASM_CMPXCHG_H
 
 /*
- * __xchg - atomically exchange a register and a memory location
+ * __arch_xchg - atomically exchange a register and a memory location
  * @x: value to swap
  * @ptr: pointer to memory
  * @size:  size of the value
@@ -19,7 +19,7 @@
  * Note:  there was an errata for V2 about .new's and memw_locked.
  *
  */
-static inline unsigned long __xchg(unsigned long x, volatile void *ptr,
+static inline unsigned long __arch_xchg(unsigned long x, volatile void *ptr,
 				   int size)
 {
 	unsigned long retval;
@@ -42,7 +42,7 @@ static inline unsigned long __xchg(unsigned long x, volatile void *ptr,
  * Atomically swap the contents of a register with memory.  Should be atomic
  * between multiple CPU's and within interrupts on the same CPU.
  */
-#define arch_xchg(ptr, v) ((__typeof__(*(ptr)))__xchg((unsigned long)(v), (ptr), \
+#define arch_xchg(ptr, v) ((__typeof__(*(ptr)))__arch_xchg((unsigned long)(v), (ptr), \
 	sizeof(*(ptr))))
 
 /*
diff --git a/arch/ia64/include/asm/cmpxchg.h b/arch/ia64/include/asm/cmpxchg.h
index 94ef844298431a..8b2e644ef6a14e 100644
--- a/arch/ia64/include/asm/cmpxchg.h
+++ b/arch/ia64/include/asm/cmpxchg.h
@@ -5,7 +5,7 @@
 #include <uapi/asm/cmpxchg.h>
 
 #define arch_xchg(ptr, x)	\
-({(__typeof__(*(ptr))) __xchg((unsigned long) (x), (ptr), sizeof(*(ptr)));})
+({(__typeof__(*(ptr))) __arch_xchg((unsigned long) (x), (ptr), sizeof(*(ptr)));})
 
 #define arch_cmpxchg(ptr, o, n)		cmpxchg_acq((ptr), (o), (n))
 #define arch_cmpxchg64(ptr, o, n)	cmpxchg_acq((ptr), (o), (n))
diff --git a/arch/ia64/include/uapi/asm/cmpxchg.h b/arch/ia64/include/uapi/asm/cmpxchg.h
index ca2e0268534384..3fec9b037051bb 100644
--- a/arch/ia64/include/uapi/asm/cmpxchg.h
+++ b/arch/ia64/include/uapi/asm/cmpxchg.h
@@ -27,7 +27,7 @@
  */
 extern void ia64_xchg_called_with_bad_pointer(void);
 
-#define __xchg(x, ptr, size)						\
+#define __arch_xchg(x, ptr, size)					\
 ({									\
 	unsigned long __xchg_result;					\
 									\
@@ -55,7 +55,7 @@ extern void ia64_xchg_called_with_bad_pointer(void);
 
 #ifndef __KERNEL__
 #define xchg(ptr, x)							\
-({(__typeof__(*(ptr))) __xchg((unsigned long) (x), (ptr), sizeof(*(ptr)));})
+({(__typeof__(*(ptr))) __arch_xchg((unsigned long) (x), (ptr), sizeof(*(ptr)));})
 #endif
 
 /*
diff --git a/arch/loongarch/include/asm/cmpxchg.h b/arch/loongarch/include/asm/cmpxchg.h
index ecfa6cf79806e6..979fde61bba8a4 100644
--- a/arch/loongarch/include/asm/cmpxchg.h
+++ b/arch/loongarch/include/asm/cmpxchg.h
@@ -62,7 +62,7 @@ static inline unsigned int __xchg_small(volatile void *ptr, unsigned int val,
 }
 
 static __always_inline unsigned long
-__xchg(volatile void *ptr, unsigned long x, int size)
+__arch_xchg(volatile void *ptr, unsigned long x, int size)
 {
 	switch (size) {
 	case 1:
@@ -87,7 +87,7 @@ __xchg(volatile void *ptr, unsigned long x, int size)
 	__typeof__(*(ptr)) __res;					\
 									\
 	__res = (__typeof__(*(ptr)))					\
-		__xchg((ptr), (unsigned long)(x), sizeof(*(ptr)));	\
+		__arch_xchg((ptr), (unsigned long)(x), sizeof(*(ptr)));	\
 									\
 	__res;								\
 })
diff --git a/arch/m68k/include/asm/cmpxchg.h b/arch/m68k/include/asm/cmpxchg.h
index 6cf464cdab067e..d7f3de9c5d6f79 100644
--- a/arch/m68k/include/asm/cmpxchg.h
+++ b/arch/m68k/include/asm/cmpxchg.h
@@ -9,7 +9,7 @@
 extern unsigned long __invalid_xchg_size(unsigned long, volatile void *, int);
 
 #ifndef CONFIG_RMW_INSNS
-static inline unsigned long __xchg(unsigned long x, volatile void * ptr, int size)
+static inline unsigned long __arch_xchg(unsigned long x, volatile void * ptr, int size)
 {
 	unsigned long flags, tmp;
 
@@ -40,7 +40,7 @@ static inline unsigned long __xchg(unsigned long x, volatile void * ptr, int siz
 	return x;
 }
 #else
-static inline unsigned long __xchg(unsigned long x, volatile void * ptr, int size)
+static inline unsigned long __arch_xchg(unsigned long x, volatile void * ptr, int size)
 {
 	switch (size) {
 	case 1:
@@ -75,7 +75,7 @@ static inline unsigned long __xchg(unsigned long x, volatile void * ptr, int siz
 }
 #endif
 
-#define arch_xchg(ptr,x) ({(__typeof__(*(ptr)))__xchg((unsigned long)(x),(ptr),sizeof(*(ptr)));})
+#define arch_xchg(ptr,x) ({(__typeof__(*(ptr)))__arch_xchg((unsigned long)(x),(ptr),sizeof(*(ptr)));})
 
 #include <asm-generic/cmpxchg-local.h>
 
diff --git a/arch/mips/include/asm/cmpxchg.h b/arch/mips/include/asm/cmpxchg.h
index 7ec9493b28614f..feed343ad483a9 100644
--- a/arch/mips/include/asm/cmpxchg.h
+++ b/arch/mips/include/asm/cmpxchg.h
@@ -68,7 +68,7 @@ extern unsigned long __xchg_small(volatile void *ptr, unsigned long val,
 				  unsigned int size);
 
 static __always_inline
-unsigned long __xchg(volatile void *ptr, unsigned long x, int size)
+unsigned long __arch_xchg(volatile void *ptr, unsigned long x, int size)
 {
 	switch (size) {
 	case 1:
@@ -102,7 +102,7 @@ unsigned long __xchg(volatile void *ptr, unsigned long x, int size)
 		smp_mb__before_llsc();					\
 									\
 	__res = (__typeof__(*(ptr)))					\
-		__xchg((ptr), (unsigned long)(x), sizeof(*(ptr)));	\
+		__arch_xchg((ptr), (unsigned long)(x), sizeof(*(ptr)));	\
 									\
 	smp_llsc_mb();							\
 									\
diff --git a/arch/openrisc/include/asm/cmpxchg.h b/arch/openrisc/include/asm/cmpxchg.h
index 79fd16162ccb6d..5725e22e10683b 100644
--- a/arch/openrisc/include/asm/cmpxchg.h
+++ b/arch/openrisc/include/asm/cmpxchg.h
@@ -147,7 +147,7 @@ static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
 extern unsigned long __xchg_called_with_bad_pointer(void)
 	__compiletime_error("Bad argument size for xchg");
 
-static inline unsigned long __xchg(volatile void *ptr, unsigned long with,
+static inline unsigned long __arch_xchg(volatile void *ptr, unsigned long with,
 		int size)
 {
 	switch (size) {
@@ -163,7 +163,7 @@ static inline unsigned long __xchg(volatile void *ptr, unsigned long with,
 
 #define arch_xchg(ptr, with) 						\
 	({								\
-		(__typeof__(*(ptr))) __xchg((ptr),			\
+		(__typeof__(*(ptr))) __arch_xchg((ptr),			\
 					    (unsigned long)(with),	\
 					    sizeof(*(ptr)));		\
 	})
diff --git a/arch/parisc/include/asm/cmpxchg.h b/arch/parisc/include/asm/cmpxchg.h
index 5f274be105671e..c1d776bb16b4ed 100644
--- a/arch/parisc/include/asm/cmpxchg.h
+++ b/arch/parisc/include/asm/cmpxchg.h
@@ -22,7 +22,7 @@ extern unsigned long __xchg64(unsigned long, volatile unsigned long *);
 
 /* optimizer better get rid of switch since size is a constant */
 static inline unsigned long
-__xchg(unsigned long x, volatile void *ptr, int size)
+__arch_xchg(unsigned long x, volatile void *ptr, int size)
 {
 	switch (size) {
 #ifdef CONFIG_64BIT
@@ -49,7 +49,7 @@ __xchg(unsigned long x, volatile void *ptr, int size)
 	__typeof__(*(ptr)) __ret;					\
 	__typeof__(*(ptr)) _x_ = (x);					\
 	__ret = (__typeof__(*(ptr)))					\
-		__xchg((unsigned long)_x_, (ptr), sizeof(*(ptr)));	\
+		__arch_xchg((unsigned long)_x_, (ptr), sizeof(*(ptr)));	\
 	__ret;								\
 })
 
diff --git a/arch/powerpc/include/asm/cmpxchg.h b/arch/powerpc/include/asm/cmpxchg.h
index d0ea0571e79ab5..dbb50c06f0bf4d 100644
--- a/arch/powerpc/include/asm/cmpxchg.h
+++ b/arch/powerpc/include/asm/cmpxchg.h
@@ -229,7 +229,7 @@ __xchg_local(void *ptr, unsigned long x, unsigned int size)
 		return __xchg_u64_local(ptr, x);
 #endif
 	}
-	BUILD_BUG_ON_MSG(1, "Unsupported size for __xchg");
+	BUILD_BUG_ON_MSG(1, "Unsupported size for __xchg_local");
 	return x;
 }
 
@@ -248,7 +248,7 @@ __xchg_relaxed(void *ptr, unsigned long x, unsigned int size)
 		return __xchg_u64_relaxed(ptr, x);
 #endif
 	}
-	BUILD_BUG_ON_MSG(1, "Unsupported size for __xchg_local");
+	BUILD_BUG_ON_MSG(1, "Unsupported size for __xchg_relaxed");
 	return x;
 }
 #define arch_xchg_local(ptr,x)						     \
diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 0dfe9d857a762b..bba472928b5393 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -261,7 +261,7 @@ c_t arch_atomic##prefix##_xchg_release(atomic##prefix##_t *v, c_t n)	\
 static __always_inline							\
 c_t arch_atomic##prefix##_xchg(atomic##prefix##_t *v, c_t n)		\
 {									\
-	return __xchg(&(v->counter), n, size);				\
+	return __arch_xchg(&(v->counter), n, size);			\
 }									\
 static __always_inline							\
 c_t arch_atomic##prefix##_cmpxchg_relaxed(atomic##prefix##_t *v,	\
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 12debce235e52d..2f4726d3cfcc25 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -114,7 +114,7 @@
 					    _x_, sizeof(*(ptr)));	\
 })
 
-#define __xchg(ptr, new, size)						\
+#define __arch_xchg(ptr, new, size)					\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(new) __new = (new);					\
@@ -143,7 +143,7 @@
 #define arch_xchg(ptr, x)						\
 ({									\
 	__typeof__(*(ptr)) _x_ = (x);					\
-	(__typeof__(*(ptr))) __xchg((ptr), _x_, sizeof(*(ptr)));	\
+	(__typeof__(*(ptr))) __arch_xchg((ptr), _x_, sizeof(*(ptr)));	\
 })
 
 #define xchg32(ptr, x)							\
diff --git a/arch/s390/include/asm/cmpxchg.h b/arch/s390/include/asm/cmpxchg.h
index 84c3f0d576c5b1..efc16f4aac8643 100644
--- a/arch/s390/include/asm/cmpxchg.h
+++ b/arch/s390/include/asm/cmpxchg.h
@@ -14,7 +14,7 @@
 
 void __xchg_called_with_bad_pointer(void);
 
-static __always_inline unsigned long __xchg(unsigned long x,
+static __always_inline unsigned long __arch_xchg(unsigned long x,
 					    unsigned long address, int size)
 {
 	unsigned long old;
@@ -77,7 +77,7 @@ static __always_inline unsigned long __xchg(unsigned long x,
 	__typeof__(*(ptr)) __ret;					\
 									\
 	__ret = (__typeof__(*(ptr)))					\
-		__xchg((unsigned long)(x), (unsigned long)(ptr),	\
+		__arch_xchg((unsigned long)(x), (unsigned long)(ptr),	\
 		       sizeof(*(ptr)));					\
 	__ret;								\
 })
diff --git a/arch/sh/include/asm/cmpxchg.h b/arch/sh/include/asm/cmpxchg.h
index 0ed9b3f4a57796..288f6f38d98fb4 100644
--- a/arch/sh/include/asm/cmpxchg.h
+++ b/arch/sh/include/asm/cmpxchg.h
@@ -22,7 +22,7 @@
 
 extern void __xchg_called_with_bad_pointer(void);
 
-#define __xchg(ptr, x, size)				\
+#define __arch_xchg(ptr, x, size)				\
 ({							\
 	unsigned long __xchg__res;			\
 	volatile void *__xchg_ptr = (ptr);		\
@@ -46,7 +46,7 @@ extern void __xchg_called_with_bad_pointer(void);
 })
 
 #define arch_xchg(ptr,x)	\
-	((__typeof__(*(ptr)))__xchg((ptr),(unsigned long)(x), sizeof(*(ptr))))
+	((__typeof__(*(ptr)))__arch_xchg((ptr),(unsigned long)(x), sizeof(*(ptr))))
 
 /* This function doesn't exist, so you'll get a linker error
  * if something tries to do an invalid cmpxchg(). */
diff --git a/arch/sparc/include/asm/cmpxchg_32.h b/arch/sparc/include/asm/cmpxchg_32.h
index 27a57a3a7597eb..7a1339533d1d7e 100644
--- a/arch/sparc/include/asm/cmpxchg_32.h
+++ b/arch/sparc/include/asm/cmpxchg_32.h
@@ -15,7 +15,7 @@
 unsigned long __xchg_u32(volatile u32 *m, u32 new);
 void __xchg_called_with_bad_pointer(void);
 
-static inline unsigned long __xchg(unsigned long x, __volatile__ void * ptr, int size)
+static inline unsigned long __arch_xchg(unsigned long x, __volatile__ void * ptr, int size)
 {
 	switch (size) {
 	case 4:
@@ -25,7 +25,7 @@ static inline unsigned long __xchg(unsigned long x, __volatile__ void * ptr, int
 	return x;
 }
 
-#define arch_xchg(ptr,x) ({(__typeof__(*(ptr)))__xchg((unsigned long)(x),(ptr),sizeof(*(ptr)));})
+#define arch_xchg(ptr,x) ({(__typeof__(*(ptr)))__arch_xchg((unsigned long)(x),(ptr),sizeof(*(ptr)));})
 
 /* Emulate cmpxchg() the same way we emulate atomics,
  * by hashing the object address and indexing into an array
diff --git a/arch/sparc/include/asm/cmpxchg_64.h b/arch/sparc/include/asm/cmpxchg_64.h
index 12d00a42c0a3ed..4c22fd9110c945 100644
--- a/arch/sparc/include/asm/cmpxchg_64.h
+++ b/arch/sparc/include/asm/cmpxchg_64.h
@@ -55,7 +55,7 @@ static inline unsigned long xchg64(__volatile__ unsigned long *m, unsigned long
 #define arch_xchg(ptr,x)							\
 ({	__typeof__(*(ptr)) __ret;					\
 	__ret = (__typeof__(*(ptr)))					\
-		__xchg((unsigned long)(x), (ptr), sizeof(*(ptr)));	\
+		__arch_xchg((unsigned long)(x), (ptr), sizeof(*(ptr)));	\
 	__ret;								\
 })
 
@@ -87,7 +87,7 @@ xchg16(__volatile__ unsigned short *m, unsigned short val)
 	return (load32 & mask) >> bit_shift;
 }
 
-static inline unsigned long __xchg(unsigned long x, __volatile__ void * ptr,
+static inline unsigned long __arch_xchg(unsigned long x, __volatile__ void * ptr,
 				       int size)
 {
 	switch (size) {
diff --git a/arch/xtensa/include/asm/cmpxchg.h b/arch/xtensa/include/asm/cmpxchg.h
index eb87810357ad88..675a11ea8de76b 100644
--- a/arch/xtensa/include/asm/cmpxchg.h
+++ b/arch/xtensa/include/asm/cmpxchg.h
@@ -170,7 +170,7 @@ static inline unsigned long xchg_u32(volatile int * m, unsigned long val)
 }
 
 #define arch_xchg(ptr,x) \
-	((__typeof__(*(ptr)))__xchg((unsigned long)(x),(ptr),sizeof(*(ptr))))
+	((__typeof__(*(ptr)))__arch_xchg((unsigned long)(x),(ptr),sizeof(*(ptr))))
 
 static inline u32 xchg_small(volatile void *ptr, u32 x, int size)
 {
@@ -203,7 +203,7 @@ static inline u32 xchg_small(volatile void *ptr, u32 x, int size)
 extern void __xchg_called_with_bad_pointer(void);
 
 static __inline__ unsigned long
-__xchg(unsigned long x, volatile void * ptr, int size)
+__arch_xchg(unsigned long x, volatile void * ptr, int size)
 {
 	switch (size) {
 	case 1:
-- 
2.34.1

