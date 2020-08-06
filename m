Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 213B923D7FC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 10:27:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMhRk32RfzDqkg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 18:26:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMhMV6JNQzDqJT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 18:23:15 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BMhMK0YTvz9v0TJ;
 Thu,  6 Aug 2020 10:23:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id iolbVkCwSF3s; Thu,  6 Aug 2020 10:23:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BMhMJ6cxGz9v0St;
 Thu,  6 Aug 2020 10:23:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0E68C8B7F9;
 Thu,  6 Aug 2020 10:23:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7m341MTYpse6; Thu,  6 Aug 2020 10:23:09 +0200 (CEST)
Received: from po16052vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CD86A8B75E;
 Thu,  6 Aug 2020 10:23:09 +0200 (CEST)
Received: by po16052vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C10FA65BC9; Thu,  6 Aug 2020 08:23:09 +0000 (UTC)
Message-Id: <89a58684568a06e3a4e7abbe6d2284076f6288d1.1596702117.git.christophe.leroy@csgroup.eu>
In-Reply-To: <a6e62627d25fb7ae9b91d8bf553e707689e37498.1596702117.git.christophe.leroy@csgroup.eu>
References: <a6e62627d25fb7ae9b91d8bf553e707689e37498.1596702117.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 2/3] uaccess: remove segment_eq
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  6 Aug 2020 08:23:09 +0000 (UTC)
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

From: Christoph Hellwig <hch@lst.de>

segment_eq is only used to implement uaccess_kernel.  Just open code
uaccess_kernel in the arch uaccess headers and remove one layer of
indirection.

Link: http://lkml.kernel.org/r/20200710135706.537715-5-hch@lst.de
Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Linus Torvalds <torvalds@linux-foundation.org>
Acked-by: Greentime Hu <green.hu@gmail.com>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nick Hu <nickhu@andestech.com>
Cc: Vincent Chen <deanbo422@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/alpha/include/asm/uaccess.h      | 2 +-
 arch/arc/include/asm/segment.h        | 3 +--
 arch/arm/include/asm/uaccess.h        | 4 ++--
 arch/arm64/include/asm/uaccess.h      | 2 +-
 arch/csky/include/asm/segment.h       | 2 +-
 arch/h8300/include/asm/segment.h      | 2 +-
 arch/ia64/include/asm/uaccess.h       | 2 +-
 arch/m68k/include/asm/segment.h       | 2 +-
 arch/microblaze/include/asm/uaccess.h | 2 +-
 arch/mips/include/asm/uaccess.h       | 2 +-
 arch/nds32/include/asm/uaccess.h      | 2 +-
 arch/nios2/include/asm/uaccess.h      | 2 +-
 arch/openrisc/include/asm/uaccess.h   | 2 +-
 arch/parisc/include/asm/uaccess.h     | 2 +-
 arch/powerpc/include/asm/uaccess.h    | 3 +--
 arch/riscv/include/asm/uaccess.h      | 4 +---
 arch/s390/include/asm/uaccess.h       | 2 +-
 arch/sh/include/asm/segment.h         | 3 +--
 arch/sparc/include/asm/uaccess_32.h   | 2 +-
 arch/sparc/include/asm/uaccess_64.h   | 2 +-
 arch/x86/include/asm/uaccess.h        | 2 +-
 arch/xtensa/include/asm/uaccess.h     | 2 +-
 include/asm-generic/uaccess.h         | 4 ++--
 include/linux/uaccess.h               | 2 --
 24 files changed, 25 insertions(+), 32 deletions(-)

diff --git a/arch/alpha/include/asm/uaccess.h b/arch/alpha/include/asm/uaccess.h
index 1fe2b56cb861..1b6f25efa247 100644
--- a/arch/alpha/include/asm/uaccess.h
+++ b/arch/alpha/include/asm/uaccess.h
@@ -20,7 +20,7 @@
 #define get_fs()  (current_thread_info()->addr_limit)
 #define set_fs(x) (current_thread_info()->addr_limit = (x))
 
-#define segment_eq(a, b)	((a).seg == (b).seg)
+#define uaccess_kernel()	(get_fs().seg == KERNEL_DS.seg)
 
 /*
  * Is a address valid? This does a straightforward calculation rather
diff --git a/arch/arc/include/asm/segment.h b/arch/arc/include/asm/segment.h
index 6a2a5be5026d..871f8ab11bfd 100644
--- a/arch/arc/include/asm/segment.h
+++ b/arch/arc/include/asm/segment.h
@@ -14,8 +14,7 @@ typedef unsigned long mm_segment_t;
 
 #define KERNEL_DS		MAKE_MM_SEG(0)
 #define USER_DS			MAKE_MM_SEG(TASK_SIZE)
-
-#define segment_eq(a, b)	((a) == (b))
+#define uaccess_kernel()	(get_fs() == KERNEL_DS)
 
 #endif /* __ASSEMBLY__ */
 #endif /* __ASMARC_SEGMENT_H */
diff --git a/arch/arm/include/asm/uaccess.h b/arch/arm/include/asm/uaccess.h
index 98c6b91be4a8..b19c9bec1f7a 100644
--- a/arch/arm/include/asm/uaccess.h
+++ b/arch/arm/include/asm/uaccess.h
@@ -76,7 +76,7 @@ static inline void set_fs(mm_segment_t fs)
 	modify_domain(DOMAIN_KERNEL, fs ? DOMAIN_CLIENT : DOMAIN_MANAGER);
 }
 
-#define segment_eq(a, b)	((a) == (b))
+#define uaccess_kernel()	(get_fs() == KERNEL_DS)
 
 /* We use 33-bit arithmetic here... */
 #define __range_ok(addr, size) ({ \
@@ -263,7 +263,7 @@ extern int __put_user_8(void *, unsigned long long);
  */
 #define USER_DS			KERNEL_DS
 
-#define segment_eq(a, b)		(1)
+#define uaccess_kernel()	(true)
 #define __addr_ok(addr)		((void)(addr), 1)
 #define __range_ok(addr, size)	((void)(addr), 0)
 #define get_fs()		(KERNEL_DS)
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index bc5c7b091152..fcb8174de505 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -49,7 +49,7 @@ static inline void set_fs(mm_segment_t fs)
 				CONFIG_ARM64_UAO));
 }
 
-#define segment_eq(a, b)	((a) == (b))
+#define uaccess_kernel()	(get_fs() == KERNEL_DS)
 
 /*
  * Test whether a block of memory is a valid user space address.
diff --git a/arch/csky/include/asm/segment.h b/arch/csky/include/asm/segment.h
index db2640d5f575..79ede9b1a646 100644
--- a/arch/csky/include/asm/segment.h
+++ b/arch/csky/include/asm/segment.h
@@ -13,6 +13,6 @@ typedef struct {
 #define USER_DS			((mm_segment_t) { 0x80000000UL })
 #define get_fs()		(current_thread_info()->addr_limit)
 #define set_fs(x)		(current_thread_info()->addr_limit = (x))
-#define segment_eq(a, b)	((a).seg == (b).seg)
+#define uaccess_kernel()	(get_fs().seg == KERNEL_DS.seg)
 
 #endif /* __ASM_CSKY_SEGMENT_H */
diff --git a/arch/h8300/include/asm/segment.h b/arch/h8300/include/asm/segment.h
index a407978f9f9f..37950725d9b9 100644
--- a/arch/h8300/include/asm/segment.h
+++ b/arch/h8300/include/asm/segment.h
@@ -33,7 +33,7 @@ static inline mm_segment_t get_fs(void)
 	return USER_DS;
 }
 
-#define segment_eq(a, b)	((a).seg == (b).seg)
+#define uaccess_kernel()	(get_fs().seg == KERNEL_DS.seg)
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/ia64/include/asm/uaccess.h b/arch/ia64/include/asm/uaccess.h
index 8aa473a4b0f4..179243c3dfc7 100644
--- a/arch/ia64/include/asm/uaccess.h
+++ b/arch/ia64/include/asm/uaccess.h
@@ -50,7 +50,7 @@
 #define get_fs()  (current_thread_info()->addr_limit)
 #define set_fs(x) (current_thread_info()->addr_limit = (x))
 
-#define segment_eq(a, b)	((a).seg == (b).seg)
+#define uaccess_kernel()	(get_fs().seg == KERNEL_DS.seg)
 
 /*
  * When accessing user memory, we need to make sure the entire area really is in
diff --git a/arch/m68k/include/asm/segment.h b/arch/m68k/include/asm/segment.h
index c6686559e9b7..2b5e68a71ef7 100644
--- a/arch/m68k/include/asm/segment.h
+++ b/arch/m68k/include/asm/segment.h
@@ -52,7 +52,7 @@ static inline void set_fs(mm_segment_t val)
 #define set_fs(x)	(current_thread_info()->addr_limit = (x))
 #endif
 
-#define segment_eq(a, b) ((a).seg == (b).seg)
+#define uaccess_kernel()	(get_fs().seg == KERNEL_DS.seg)
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/microblaze/include/asm/uaccess.h b/arch/microblaze/include/asm/uaccess.h
index 6723c56ec378..304b04ffea2f 100644
--- a/arch/microblaze/include/asm/uaccess.h
+++ b/arch/microblaze/include/asm/uaccess.h
@@ -41,7 +41,7 @@
 # define get_fs()	(current_thread_info()->addr_limit)
 # define set_fs(val)	(current_thread_info()->addr_limit = (val))
 
-# define segment_eq(a, b)	((a).seg == (b).seg)
+# define uaccess_kernel()	(get_fs().seg == KERNEL_DS.seg)
 
 #ifndef CONFIG_MMU
 
diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
index 62b298c50905..61fc01f177a6 100644
--- a/arch/mips/include/asm/uaccess.h
+++ b/arch/mips/include/asm/uaccess.h
@@ -72,7 +72,7 @@ extern u64 __ua_limit;
 #define get_fs()	(current_thread_info()->addr_limit)
 #define set_fs(x)	(current_thread_info()->addr_limit = (x))
 
-#define segment_eq(a, b)	((a).seg == (b).seg)
+#define uaccess_kernel()	(get_fs().seg == KERNEL_DS.seg)
 
 /*
  * eva_kernel_access() - determine whether kernel memory access on an EVA system
diff --git a/arch/nds32/include/asm/uaccess.h b/arch/nds32/include/asm/uaccess.h
index 3a9219f53ee0..010ba5f1d7dd 100644
--- a/arch/nds32/include/asm/uaccess.h
+++ b/arch/nds32/include/asm/uaccess.h
@@ -44,7 +44,7 @@ static inline void set_fs(mm_segment_t fs)
 	current_thread_info()->addr_limit = fs;
 }
 
-#define segment_eq(a, b)	((a) == (b))
+#define uaccess_kernel()	(get_fs() == KERNEL_DS)
 
 #define __range_ok(addr, size) (size <= get_fs() && addr <= (get_fs() -size))
 
diff --git a/arch/nios2/include/asm/uaccess.h b/arch/nios2/include/asm/uaccess.h
index e83f831a76f9..a741abbed6fb 100644
--- a/arch/nios2/include/asm/uaccess.h
+++ b/arch/nios2/include/asm/uaccess.h
@@ -30,7 +30,7 @@
 #define get_fs()		(current_thread_info()->addr_limit)
 #define set_fs(seg)		(current_thread_info()->addr_limit = (seg))
 
-#define segment_eq(a, b)	((a).seg == (b).seg)
+#define uaccess_kernel() (get_fs().seg == KERNEL_DS.seg)
 
 #define __access_ok(addr, len)			\
 	(((signed long)(((long)get_fs().seg) &	\
diff --git a/arch/openrisc/include/asm/uaccess.h b/arch/openrisc/include/asm/uaccess.h
index 17c24f14615f..48b691530d3e 100644
--- a/arch/openrisc/include/asm/uaccess.h
+++ b/arch/openrisc/include/asm/uaccess.h
@@ -43,7 +43,7 @@
 #define get_fs()	(current_thread_info()->addr_limit)
 #define set_fs(x)	(current_thread_info()->addr_limit = (x))
 
-#define segment_eq(a, b)	((a) == (b))
+#define uaccess_kernel()	(get_fs() == KERNEL_DS)
 
 /* Ensure that the range from addr to addr+size is all within the process'
  * address space
diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/uaccess.h
index ebbb9ffe038c..ed2cd4fb479b 100644
--- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -14,7 +14,7 @@
 #define KERNEL_DS	((mm_segment_t){0})
 #define USER_DS 	((mm_segment_t){1})
 
-#define segment_eq(a, b) ((a).seg == (b).seg)
+#define uaccess_kernel() (get_fs().seg == KERNEL_DS.seg)
 
 #define get_fs()	(current_thread_info()->addr_limit)
 #define set_fs(x)	(current_thread_info()->addr_limit = (x))
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 64c04ab09112..00699903f1ef 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -38,8 +38,7 @@ static inline void set_fs(mm_segment_t fs)
 	set_thread_flag(TIF_FSCHECK);
 }
 
-#define segment_eq(a, b)	((a).seg == (b).seg)
-
+#define uaccess_kernel() (get_fs().seg == KERNEL_DS.seg)
 #define user_addr_max()	(get_fs().seg)
 
 #ifdef __powerpc64__
diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 8ce9d607b53d..1bdf663e5932 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -62,11 +62,9 @@ static inline void set_fs(mm_segment_t fs)
 	current_thread_info()->addr_limit = fs;
 }
 
-#define segment_eq(a, b) ((a).seg == (b).seg)
-
+#define uaccess_kernel() (get_fs().seg == KERNEL_DS.seg)
 #define user_addr_max()	(get_fs().seg)
 
-
 /**
  * access_ok: - Checks if a user space pointer is valid
  * @addr: User space pointer to start of block to check
diff --git a/arch/s390/include/asm/uaccess.h b/arch/s390/include/asm/uaccess.h
index 324438889fe1..f09444d6aeab 100644
--- a/arch/s390/include/asm/uaccess.h
+++ b/arch/s390/include/asm/uaccess.h
@@ -32,7 +32,7 @@
 #define USER_DS_SACF	(3)
 
 #define get_fs()        (current->thread.mm_segment)
-#define segment_eq(a,b) (((a) & 2) == ((b) & 2))
+#define uaccess_kernel() ((get_fs() & 2) == KERNEL_DS)
 
 void set_fs(mm_segment_t fs);
 
diff --git a/arch/sh/include/asm/segment.h b/arch/sh/include/asm/segment.h
index 33d1d28057cb..02e54a3335d6 100644
--- a/arch/sh/include/asm/segment.h
+++ b/arch/sh/include/asm/segment.h
@@ -24,8 +24,7 @@ typedef struct {
 #define USER_DS		KERNEL_DS
 #endif
 
-#define segment_eq(a, b) ((a).seg == (b).seg)
-
+#define uaccess_kernel() (get_fs().seg == KERNEL_DS.seg)
 
 #define get_fs()	(current_thread_info()->addr_limit)
 #define set_fs(x)	(current_thread_info()->addr_limit = (x))
diff --git a/arch/sparc/include/asm/uaccess_32.h b/arch/sparc/include/asm/uaccess_32.h
index d6d8413eca83..0a2d3ebc4bb8 100644
--- a/arch/sparc/include/asm/uaccess_32.h
+++ b/arch/sparc/include/asm/uaccess_32.h
@@ -28,7 +28,7 @@
 #define get_fs()	(current->thread.current_ds)
 #define set_fs(val)	((current->thread.current_ds) = (val))
 
-#define segment_eq(a, b) ((a).seg == (b).seg)
+#define uaccess_kernel() (get_fs().seg == KERNEL_DS.seg)
 
 /* We have there a nice not-mapped page at PAGE_OFFSET - PAGE_SIZE, so that this test
  * can be fairly lightweight.
diff --git a/arch/sparc/include/asm/uaccess_64.h b/arch/sparc/include/asm/uaccess_64.h
index bf9d330073b2..698cf69f74e9 100644
--- a/arch/sparc/include/asm/uaccess_64.h
+++ b/arch/sparc/include/asm/uaccess_64.h
@@ -32,7 +32,7 @@
 
 #define get_fs() ((mm_segment_t){(current_thread_info()->current_ds)})
 
-#define segment_eq(a, b)  ((a).seg == (b).seg)
+#define uaccess_kernel() (get_fs().seg == KERNEL_DS.seg)
 
 #define set_fs(val)								\
 do {										\
diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index 18dfa07d3ef0..dd3261f9f4ea 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -33,7 +33,7 @@ static inline void set_fs(mm_segment_t fs)
 	set_thread_flag(TIF_FSCHECK);
 }
 
-#define segment_eq(a, b)	((a).seg == (b).seg)
+#define uaccess_kernel() (get_fs().seg == KERNEL_DS.seg)
 #define user_addr_max() (current->thread.addr_limit.seg)
 
 /*
diff --git a/arch/xtensa/include/asm/uaccess.h b/arch/xtensa/include/asm/uaccess.h
index e57f0d0a88d8..b9758119feca 100644
--- a/arch/xtensa/include/asm/uaccess.h
+++ b/arch/xtensa/include/asm/uaccess.h
@@ -35,7 +35,7 @@
 #define get_fs()	(current->thread.current_ds)
 #define set_fs(val)	(current->thread.current_ds = (val))
 
-#define segment_eq(a, b)	((a).seg == (b).seg)
+#define uaccess_kernel() (get_fs().seg == KERNEL_DS.seg)
 
 #define __kernel_ok (uaccess_kernel())
 #define __user_ok(addr, size) \
diff --git a/include/asm-generic/uaccess.h b/include/asm-generic/uaccess.h
index e935318804f8..ba68ee4dabfa 100644
--- a/include/asm-generic/uaccess.h
+++ b/include/asm-generic/uaccess.h
@@ -86,8 +86,8 @@ static inline void set_fs(mm_segment_t fs)
 }
 #endif
 
-#ifndef segment_eq
-#define segment_eq(a, b) ((a).seg == (b).seg)
+#ifndef uaccess_kernel
+#define uaccess_kernel() (get_fs().seg == KERNEL_DS.seg)
 #endif
 
 #define access_ok(addr, size) __access_ok((unsigned long)(addr),(size))
diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 0a76ddc07d59..5c62d0c6f15b 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -6,8 +6,6 @@
 #include <linux/sched.h>
 #include <linux/thread_info.h>
 
-#define uaccess_kernel() segment_eq(get_fs(), KERNEL_DS)
-
 #include <asm/uaccess.h>
 
 /*
-- 
2.25.0

