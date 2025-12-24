Return-Path: <linuxppc-dev+bounces-14998-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E29C1CDC1B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 12:21:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbqFn3PZ5z2yhP;
	Wed, 24 Dec 2025 22:21:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766575293;
	cv=none; b=V+JMGQ6CFVCdI3Ghqdi6mK0pnednEef+iLyyA0s+5+nNfpbOND6kvBRMTNzADYLtwKCUBQZg+7+lvz4P/NeZDjd39omL32UscAqV6u7T4PSmyxm/Z/7Q8LaLmR9RvUgaQ5c/aBRP0jda1uHa4HGhls+5REi4gvvMdHbvIZHfHEIEL0AMFgen0WcBhYw6Zu+iCzbVFA5X25KPHCRLT6H+Eoz230bJloixEgI7nXbEQm5Fo2eAmSjGPok+nMkRqoRQPZp2O28Nt/ibcs3Lc1Nx91y12auiZHk4BOa4ya1HUqky23ZJbPOzfFI0Rh/muGolG1tnlh1k4ST85K09NgKA7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766575293; c=relaxed/relaxed;
	bh=NjEXufxZw5tv7ki0x7pKamxcFbb0tTGx6/CUYaxH+UM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k3zIB+zGW8oHiyqghACahTfXB2p4gZ+hUn1evjpfFub5BUHS4h06HNvOx0hmPz5qTDX5oCbCvN8bkPBVhFW9niNCbaZ41fHvn8lm11/6B/FEOoWJ1rzgOKmyBwEdOa6h0hpz2/EYlbxukGvq2VifLmBczk/N7A4mI76oOU1n6K9trTxDSPlk1R9GC50+Z84XPkEDFG2kwe74GSk5CbJtWGczldC2I1y5+hzhPDNHX/GjvPNMUGxk+VTjPU0oaFtw+1/uszBWhQ4yQAtCbQHap2fW4T3l4uWMJ4NVFH4/PSFQZ8DgbWPm1VUfVHPvXFPtC66jLjHZ6vkJZCjX+Tw87A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iJm1yeKY; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iJm1yeKY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbqFm5VLKz2yYK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 22:21:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C47A4438B;
	Wed, 24 Dec 2025 11:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E7DDC116D0;
	Wed, 24 Dec 2025 11:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766575291;
	bh=fnbw5f66PyzI9FgHERL1dSAdSF91hdUdpx2k7uZy1Ys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iJm1yeKY4bpFT3f4o2eXep6c1mySpNJd9qmHsiM1pml7xPwumN549wJkXjVnuJosi
	 X5UKrt72oGIrbT7c4XQWE/iJRv1TU6kfS1vJvKlWPBg1UKLy3BiwtK46D85gNsysBP
	 5uGf7Kgpg5KbSVjuxW6rFGLLygdy3nq760tUBxoIm20cy4LCqOGbZzC0j++rAJ2vzK
	 PPrz9VqrMX2dDDgH86bl/IAxn6F+7v4XrkhxOWMw9xeRdExw1LTRpmKO0CLfPShYdC
	 LSYI6D6+we6HuhRbDa7YNIyzYxRX9vXHm0D4Noq/m5jpfow5nm1Hjm4KaTs5VFpziz
	 cyBBKKiwT+ysg==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 7/7] powerpc/uaccess: Implement masked user access
Date: Wed, 24 Dec 2025 12:20:55 +0100
Message-ID: <8f418183d9125cc0bf23922bc2ef2a1130d8b63a.1766574657.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1766574657.git.chleroy@kernel.org>
References: <cover.1766574657.git.chleroy@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9880; i=chleroy@kernel.org; h=from:subject:message-id; bh=a3aZ+OkGSPpLvEE6ZUhpuB+9SriLXpJrMyl4L+YDAeY=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWR6n5l78Yz63/1fjtpP92q6brk2sNt+uYv/bRvLvOf3G LkPbNpU3FHKwiDGxSArpshy/D/3rhldX1Lzp+7Sh5nDygQyhIGLUwAm8uk4w//0M/Y2u5pYKqL6 Nmz7etTi7Y6N7JtZ/SqqT6+Pn8u/ITyR4a8st8ueS0vaGExy5nOdt4r6893X2dF8rWCTRP2sxC0 cnQwA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Christophe Leroy <christophe.leroy@csgroup.eu>

Masked user access avoids the address/size verification by access_ok().
Allthough its main purpose is to skip the speculation in the
verification of user address and size hence avoid the need of spec
mitigation, it also has the advantage of reducing the amount of
instructions required so it even benefits to platforms that don't
need speculation mitigation, especially when the size of the copy is
not know at build time.

So implement masked user access on powerpc. The only requirement is
to have memory gap that faults between the top user space and the
real start of kernel area.

On 64 bits platforms the address space is divided that way:

	0xffffffffffffffff	+------------------+
				|                  |
				|   kernel space   |
 		 		|                  |
	0xc000000000000000	+------------------+  <== PAGE_OFFSET
				|//////////////////|
				|//////////////////|
	0x8000000000000000	|//////////////////|
				|//////////////////|
				|//////////////////|
	0x0010000000000000	+------------------+  <== TASK_SIZE_MAX
				|                  |
				|    user space    |
				|                  |
	0x0000000000000000	+------------------+

Kernel is always above 0x8000000000000000 and user always
below, with a gap in-between. It leads to a 3 instructions sequence:

 150:	7c 69 fe 76 	sradi   r9,r3,63
 154:	79 29 00 40 	clrldi  r9,r9,1
 158:	7c 63 48 78 	andc    r3,r3,r9

This sequence leaves r3 unmodified when it is below 0x8000000000000000
and clamps it to 0x8000000000000000 if it is above.

On 32 bits it is more tricky. In theory user space can go up to
0xbfffffff while kernel will usually start at 0xc0000000. So a gap
needs to be added in-between. Allthough in theory a single 4k page
would suffice, it is easier and more efficient to enforce a 128k gap
below kernel, as it simplifies the masking.

e500 has the isel instruction which allows selecting one value or
the other without branch and that instruction is not speculative, so
use it. Allthough GCC usually generates code using that instruction,
it is safer to use inline assembly to be sure. The result is:

  14:	3d 20 bf fe 	lis     r9,-16386
  18:	7c 03 48 40 	cmplw   r3,r9
  1c:	7c 69 18 5e 	iselgt  r3,r9,r3

On other ones, when kernel space is over 0x80000000 and user space
is below, the logic in mask_user_address_simple() leads to a
3 instruction sequence:

  64:	7c 69 fe 70 	srawi   r9,r3,31
  68:	55 29 00 7e 	clrlwi  r9,r9,1
  6c:	7c 63 48 78 	andc    r3,r3,r9

This is the default on powerpc 8xx.

When the limit between user space and kernel space is not 0x80000000,
mask_user_address_32() is used and a 6 instructions sequence is
generated:

  24:	54 69 7c 7e 	srwi    r9,r3,17
  28:	21 29 57 ff 	subfic  r9,r9,22527
  2c:	7d 29 fe 70 	srawi   r9,r9,31
  30:	75 2a b0 00 	andis.  r10,r9,45056
  34:	7c 63 48 78 	andc    r3,r3,r9
  38:	7c 63 53 78 	or      r3,r3,r10

The constraint is that TASK_SIZE be aligned to 128K in order to get
the most optimal number of instructions.

When CONFIG_PPC_BARRIER_NOSPEC is not defined, fallback on the
test-based masking as it is quicker than the 6 instructions sequence
but not quicker than the 3 instructions sequences above.

As an exemple, allthough barrier_nospec() voids on the 8xx, this
change has the following impact on strncpy_from_user(): the length of
the function is reduced from 488 to 340 bytes:

Start of the function with the patch:

00000000 <strncpy_from_user>:
   0:	7c ab 2b 79 	mr.     r11,r5
   4:	40 81 01 40 	ble     144 <strncpy_from_user+0x144>
   8:	7c 89 fe 70 	srawi   r9,r4,31
   c:	55 29 00 7e 	clrlwi  r9,r9,1
  10:	7c 84 48 78 	andc    r4,r4,r9
  14:	3d 20 dc 00 	lis     r9,-9216
  18:	7d 3a c3 a6 	mtspr   794,r9
  1c:	2f 8b 00 03 	cmpwi   cr7,r11,3
  20:	40 9d 00 b4 	ble     cr7,d4 <strncpy_from_user+0xd4>
...

Start of the function without the patch:

00000000 <strncpy_from_user>:
   0:	7c a0 2b 79 	mr.     r0,r5
   4:	40 81 01 10 	ble     114 <strncpy_from_user+0x114>
   8:	2f 84 00 00 	cmpwi   cr7,r4,0
   c:	41 9c 01 30 	blt     cr7,13c <strncpy_from_user+0x13c>
  10:	3d 20 80 00 	lis     r9,-32768
  14:	7d 24 48 50 	subf    r9,r4,r9
  18:	7f 80 48 40 	cmplw   cr7,r0,r9
  1c:	7c 05 03 78 	mr      r5,r0
  20:	41 9d 01 00 	bgt     cr7,120 <strncpy_from_user+0x120>
  24:	3d 20 80 00 	lis     r9,-32768
  28:	7d 25 48 50 	subf    r9,r5,r9
  2c:	7f 84 48 40 	cmplw   cr7,r4,r9
  30:	38 e0 ff f2 	li      r7,-14
  34:	41 9d 00 e4 	bgt     cr7,118 <strncpy_from_user+0x118>
  38:	94 21 ff e0 	stwu    r1,-32(r1)
  3c:	3d 20 dc 00 	lis     r9,-9216
  40:	7d 3a c3 a6 	mtspr   794,r9
  44:	2b 85 00 03 	cmplwi  cr7,r5,3
  48:	40 9d 01 6c 	ble     cr7,1b4 <strncpy_from_user+0x1b4>
...
 118:	7c e3 3b 78 	mr      r3,r7
 11c:	4e 80 00 20 	blr
 120:	7d 25 4b 78 	mr      r5,r9
 124:	3d 20 80 00 	lis     r9,-32768
 128:	7d 25 48 50 	subf    r9,r5,r9
 12c:	7f 84 48 40 	cmplw   cr7,r4,r9
 130:	38 e0 ff f2 	li      r7,-14
 134:	41 bd ff e4 	bgt     cr7,118 <strncpy_from_user+0x118>
 138:	4b ff ff 00 	b       38 <strncpy_from_user+0x38>
 13c:	38 e0 ff f2 	li      r7,-14
 140:	4b ff ff d8 	b       118 <strncpy_from_user+0x118>
...

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v4: Rebase on top of core-scoped-uaccess tag and simplified as suggested by Gabriel

v3: Rewrite mask_user_address_simple() for a smaller result on powerpc64, suggested by Gabriel

v2: Added 'likely()' to the test in mask_user_address_fallback()
---
 arch/powerpc/include/asm/task_size_32.h |  6 +-
 arch/powerpc/include/asm/uaccess.h      | 76 +++++++++++++++++++++++++
 2 files changed, 79 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/task_size_32.h b/arch/powerpc/include/asm/task_size_32.h
index 42a64bbd1964..725ddbf06217 100644
--- a/arch/powerpc/include/asm/task_size_32.h
+++ b/arch/powerpc/include/asm/task_size_32.h
@@ -13,7 +13,7 @@
 #define MODULES_SIZE	(CONFIG_MODULES_SIZE * SZ_1M)
 #define MODULES_VADDR	(MODULES_END - MODULES_SIZE)
 #define MODULES_BASE	(MODULES_VADDR & ~(UL(SZ_4M) - 1))
-#define USER_TOP	MODULES_BASE
+#define USER_TOP	(MODULES_BASE - SZ_4M)
 #endif
 
 #ifdef CONFIG_PPC_BOOK3S_32
@@ -21,11 +21,11 @@
 #define MODULES_SIZE	(CONFIG_MODULES_SIZE * SZ_1M)
 #define MODULES_VADDR	(MODULES_END - MODULES_SIZE)
 #define MODULES_BASE	(MODULES_VADDR & ~(UL(SZ_256M) - 1))
-#define USER_TOP	MODULES_BASE
+#define USER_TOP	(MODULES_BASE - SZ_4M)
 #endif
 
 #ifndef USER_TOP
-#define USER_TOP	ASM_CONST(CONFIG_PAGE_OFFSET)
+#define USER_TOP	((ASM_CONST(CONFIG_PAGE_OFFSET) - SZ_128K) & ~(UL(SZ_128K) - 1))
 #endif
 
 #if CONFIG_TASK_SIZE < USER_TOP
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 721d65dbbb2e..ba1d878c3f40 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -2,6 +2,8 @@
 #ifndef _ARCH_POWERPC_UACCESS_H
 #define _ARCH_POWERPC_UACCESS_H
 
+#include <linux/sizes.h>
+
 #include <asm/processor.h>
 #include <asm/page.h>
 #include <asm/extable.h>
@@ -435,6 +437,80 @@ static __must_check __always_inline bool __user_access_begin(const void __user *
 #define user_access_save	prevent_user_access_return
 #define user_access_restore	restore_user_access
 
+/*
+ * Masking the user address is an alternative to a conditional
+ * user_access_begin that can avoid the fencing. This only works
+ * for dense accesses starting at the address.
+ */
+static inline void __user *mask_user_address_simple(const void __user *ptr)
+{
+	unsigned long addr = (unsigned long)ptr;
+	unsigned long mask = (unsigned long)(((long)addr >> (BITS_PER_LONG - 1)) & LONG_MAX);
+
+	return (void __user *)(addr & ~mask);
+}
+
+static inline void __user *mask_user_address_isel(const void __user *ptr)
+{
+	unsigned long addr;
+
+	asm("cmplw %1, %2; iselgt %0, %2, %1" : "=r"(addr) : "r"(ptr), "r"(TASK_SIZE) : "cr0");
+
+	return (void __user *)addr;
+}
+
+/* TASK_SIZE is a multiple of 128K for shifting by 17 to the right */
+static inline void __user *mask_user_address_32(const void __user *ptr)
+{
+	unsigned long addr = (unsigned long)ptr;
+	unsigned long mask = (unsigned long)((long)((TASK_SIZE >> 17) - 1 - (addr >> 17)) >> 31);
+
+	addr = (addr & ~mask) | (TASK_SIZE & mask);
+
+	return (void __user *)addr;
+}
+
+static inline void __user *mask_user_address_fallback(const void __user *ptr)
+{
+	unsigned long addr = (unsigned long)ptr;
+
+	return (void __user *)(likely(addr < TASK_SIZE) ? addr : TASK_SIZE);
+}
+
+static inline void __user *mask_user_address(const void __user *ptr)
+{
+#ifdef MODULES_VADDR
+	const unsigned long border = MODULES_VADDR;
+#else
+	const unsigned long border = PAGE_OFFSET;
+#endif
+
+	if (IS_ENABLED(CONFIG_PPC64))
+		return mask_user_address_simple(ptr);
+	if (IS_ENABLED(CONFIG_E500))
+		return mask_user_address_isel(ptr);
+	if (TASK_SIZE <= UL(SZ_2G) && border >= UL(SZ_2G))
+		return mask_user_address_simple(ptr);
+	if (IS_ENABLED(CONFIG_PPC_BARRIER_NOSPEC))
+		return mask_user_address_32(ptr);
+	return mask_user_address_fallback(ptr);
+}
+
+static __always_inline void __user *__masked_user_access_begin(const void __user *p,
+							       unsigned long dir)
+{
+	void __user *ptr = mask_user_address(p);
+
+	might_fault();
+	allow_user_access(ptr, dir);
+
+	return ptr;
+}
+
+#define masked_user_access_begin(p) __masked_user_access_begin(p, KUAP_READ_WRITE)
+#define masked_user_read_access_begin(p) __masked_user_access_begin(p, KUAP_READ)
+#define masked_user_write_access_begin(p) __masked_user_access_begin(p, KUAP_WRITE)
+
 #define arch_unsafe_get_user(x, p, e) do {			\
 	__long_type(*(p)) __gu_val;				\
 	__typeof__(*(p)) __user *__gu_addr = (p);		\
-- 
2.49.0


