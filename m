Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA46D4B899A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 14:20:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzJVh1JVVz3dtx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 00:20:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BQ937DYw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BQ937DYw; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzJQW34Zhz3cVP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 00:17:07 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0A5A961690;
 Wed, 16 Feb 2022 13:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F41CC36AE7;
 Wed, 16 Feb 2022 13:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645017423;
 bh=pd6u0mwO6yaQL1MmpebN+vLJ9fcdTZbWD3IkgwNoG4w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BQ937DYwV8BLGIXiUT7ewgRsUzlZXbBFcc5tZQuFi5oSqEnLHg4ZG/oIqsS0t0LPn
 k3uWcitFq/JTyrEKv9+o5KhwSEpAgMjmkLQ6mpPtQnpZcBGHa40kAOdvVZ/MUw6/yA
 MoQSQPgx3iQtzXxtjcWdkwa15KodqGLLsoU7pkU5CG3LhVBIO+9zYAW+hUlWPX9vfK
 m9NGdaVmmZMYmnOxKymJENlG2sEzMQEqL6kPQjQO2auZZZtvrvbNOb6B9hp2OP8e0N
 VgQRkXk27WtZmhyQF3QMsSDv/zGf6COsHfnV8BeoxLaL7lpdWEzZKvNb6PPvnT5ojI
 ZUpcS+QXXCSIA==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Subject: [PATCH v2 08/18] uaccess: add generic __{get,put}_kernel_nofault
Date: Wed, 16 Feb 2022 14:13:22 +0100
Message-Id: <20220216131332.1489939-9-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220216131332.1489939-1-arnd@kernel.org>
References: <20220216131332.1489939-1-arnd@kernel.org>
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, jcmvbkbc@gmail.com,
 guoren@kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, will@kernel.org, ardb@kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, deller@gmx.de,
 x86@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org,
 mingo@redhat.com, geert@linux-m68k.org, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, hca@linux.ibm.com, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, green.hu@gmail.com, shorne@gmail.com,
 monstr@monstr.eu, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 nickhu@andestech.com, linux-mips@vger.kernel.org, dinguyen@kernel.org,
 ebiederm@xmission.com, richard@nod.at, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

Nine architectures are still missing __{get,put}_kernel_nofault:
alpha, ia64, microblaze, nds32, nios2, openrisc, sh, sparc32, xtensa.

Add a generic version that lets everything use the normal
copy_{from,to}_kernel_nofault() code based on these, removing the last
use of get_fs()/set_fs() from architecture-independent code.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/include/asm/uaccess.h      |   2 -
 arch/arm64/include/asm/uaccess.h    |   2 -
 arch/m68k/include/asm/uaccess.h     |   2 -
 arch/mips/include/asm/uaccess.h     |   2 -
 arch/parisc/include/asm/uaccess.h   |   1 -
 arch/powerpc/include/asm/uaccess.h  |   2 -
 arch/riscv/include/asm/uaccess.h    |   2 -
 arch/s390/include/asm/uaccess.h     |   2 -
 arch/sparc/include/asm/uaccess_64.h |   2 -
 arch/um/include/asm/uaccess.h       |   2 -
 arch/x86/include/asm/uaccess.h      |   2 -
 include/asm-generic/uaccess.h       |   2 -
 include/linux/uaccess.h             |  19 +++++
 mm/maccess.c                        | 108 ----------------------------
 14 files changed, 19 insertions(+), 131 deletions(-)

diff --git a/arch/arm/include/asm/uaccess.h b/arch/arm/include/asm/uaccess.h
index 32dbfd81f42a..d20d78c34b94 100644
--- a/arch/arm/include/asm/uaccess.h
+++ b/arch/arm/include/asm/uaccess.h
@@ -476,8 +476,6 @@ do {									\
 	: "r" (x), "i" (-EFAULT)				\
 	: "cc")
 
-#define HAVE_GET_KERNEL_NOFAULT
-
 #define __get_kernel_nofault(dst, src, type, err_label)			\
 do {									\
 	const type *__pk_ptr = (src);					\
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 3a5ff5e20586..2e20879fe3cf 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -26,8 +26,6 @@
 #include <asm/memory.h>
 #include <asm/extable.h>
 
-#define HAVE_GET_KERNEL_NOFAULT
-
 /*
  * Test whether a block of memory is a valid user space address.
  * Returns 1 if the range is valid, 0 otherwise.
diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
index ba670523885c..79617c0b2f91 100644
--- a/arch/m68k/include/asm/uaccess.h
+++ b/arch/m68k/include/asm/uaccess.h
@@ -390,8 +390,6 @@ raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 #define INLINE_COPY_FROM_USER
 #define INLINE_COPY_TO_USER
 
-#define HAVE_GET_KERNEL_NOFAULT
-
 #define __get_kernel_nofault(dst, src, type, err_label)			\
 do {									\
 	type *__gk_dst = (type *)(dst);					\
diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
index f8f74f9f5883..db9a8e002b62 100644
--- a/arch/mips/include/asm/uaccess.h
+++ b/arch/mips/include/asm/uaccess.h
@@ -296,8 +296,6 @@ struct __large_struct { unsigned long buf[100]; };
 	(val) = __gu_tmp.t;						\
 }
 
-#define HAVE_GET_KERNEL_NOFAULT
-
 #define __get_kernel_nofault(dst, src, type, err_label)			\
 do {									\
 	int __gu_err;							\
diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/uaccess.h
index ebf8a845b017..0925bbd6db67 100644
--- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -95,7 +95,6 @@ struct exception_table_entry {
 	(val) = (__force __typeof__(*(ptr))) __gu_val;	\
 }
 
-#define HAVE_GET_KERNEL_NOFAULT
 #define __get_kernel_nofault(dst, src, type, err_label)	\
 {							\
 	type __z;					\
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 63316100080c..a0032c2e7550 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -467,8 +467,6 @@ do {									\
 		unsafe_put_user(*(u8*)(_src + _i), (u8 __user *)(_dst + _i), e); \
 } while (0)
 
-#define HAVE_GET_KERNEL_NOFAULT
-
 #define __get_kernel_nofault(dst, src, type, err_label)			\
 	__get_user_size_goto(*((type *)(dst)),				\
 		(__force type __user *)(src), sizeof(type), err_label)
diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index c701a5e57a2b..4407b9e48d2c 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -346,8 +346,6 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
 		__clear_user(to, n) : n;
 }
 
-#define HAVE_GET_KERNEL_NOFAULT
-
 #define __get_kernel_nofault(dst, src, type, err_label)			\
 do {									\
 	long __kr_err;							\
diff --git a/arch/s390/include/asm/uaccess.h b/arch/s390/include/asm/uaccess.h
index d74e26b48604..29332edf46f0 100644
--- a/arch/s390/include/asm/uaccess.h
+++ b/arch/s390/include/asm/uaccess.h
@@ -282,8 +282,6 @@ static inline unsigned long __must_check clear_user(void __user *to, unsigned lo
 int copy_to_user_real(void __user *dest, void *src, unsigned long count);
 void *s390_kernel_write(void *dst, const void *src, size_t size);
 
-#define HAVE_GET_KERNEL_NOFAULT
-
 int __noreturn __put_kernel_bad(void);
 
 #define __put_kernel_asm(val, to, insn)					\
diff --git a/arch/sparc/include/asm/uaccess_64.h b/arch/sparc/include/asm/uaccess_64.h
index b283798315b1..5c12fb46bc61 100644
--- a/arch/sparc/include/asm/uaccess_64.h
+++ b/arch/sparc/include/asm/uaccess_64.h
@@ -210,8 +210,6 @@ __asm__ __volatile__(							\
 	       : "=r" (ret), "=r" (x) : "r" (__m(addr)),		\
 		 "i" (-EFAULT))
 
-#define HAVE_GET_KERNEL_NOFAULT
-
 #define __get_user_nocheck(data, addr, size, type) ({			     \
 	register int __gu_ret;						     \
 	register unsigned long __gu_val;				     \
diff --git a/arch/um/include/asm/uaccess.h b/arch/um/include/asm/uaccess.h
index 17d18cfd82a5..1ecfc96bcc50 100644
--- a/arch/um/include/asm/uaccess.h
+++ b/arch/um/include/asm/uaccess.h
@@ -44,8 +44,6 @@ static inline int __access_ok(unsigned long addr, unsigned long size)
 }
 
 /* no pagefaults for kernel addresses in um */
-#define HAVE_GET_KERNEL_NOFAULT 1
-
 #define __get_kernel_nofault(dst, src, type, err_label)			\
 do {									\
 	*((type *)dst) = get_unaligned((type *)(src));			\
diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index a59ba2578e64..201efcec66b7 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -507,8 +507,6 @@ do {									\
 	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u8, label);	\
 } while (0)
 
-#define HAVE_GET_KERNEL_NOFAULT
-
 #ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
 #define __get_kernel_nofault(dst, src, type, err_label)			\
 	__get_user_size(*((type *)(dst)), (__force type __user *)(src),	\
diff --git a/include/asm-generic/uaccess.h b/include/asm-generic/uaccess.h
index 10ffa8b5c117..0870fa11a7c5 100644
--- a/include/asm-generic/uaccess.h
+++ b/include/asm-generic/uaccess.h
@@ -77,8 +77,6 @@ do {									\
 		goto err_label;						\
 } while (0)
 
-#define HAVE_GET_KERNEL_NOFAULT 1
-
 static inline __must_check unsigned long
 raw_copy_from_user(void *to, const void __user * from, unsigned long n)
 {
diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index ac0394087f7d..67e9bc94dc40 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -368,6 +368,25 @@ long strncpy_from_user_nofault(char *dst, const void __user *unsafe_addr,
 		long count);
 long strnlen_user_nofault(const void __user *unsafe_addr, long count);
 
+#ifndef __get_kernel_nofault
+#define __get_kernel_nofault(dst, src, type, label)	\
+do {							\
+	type __user *p = (type __force __user *)(src);	\
+	type data;					\
+	if (__get_user(data, p))			\
+		goto label;				\
+	*(type *)dst = data;				\
+} while (0)
+
+#define __put_kernel_nofault(dst, src, type, label)	\
+do {							\
+	type __user *p = (type __force __user *)(dst);	\
+	type data = *(type *)src;			\
+	if (__put_user(data, p))			\
+		goto label;				\
+} while (0)
+#endif
+
 /**
  * get_kernel_nofault(): safely attempt to read from a location
  * @val: read into this variable
diff --git a/mm/maccess.c b/mm/maccess.c
index d3f1a1f0b1c1..cbd1b3959af2 100644
--- a/mm/maccess.c
+++ b/mm/maccess.c
@@ -12,8 +12,6 @@ bool __weak copy_from_kernel_nofault_allowed(const void *unsafe_src,
 	return true;
 }
 
-#ifdef HAVE_GET_KERNEL_NOFAULT
-
 #define copy_from_kernel_nofault_loop(dst, src, len, type, err_label)	\
 	while (len >= sizeof(type)) {					\
 		__get_kernel_nofault(dst, src, type, err_label);		\
@@ -102,112 +100,6 @@ long strncpy_from_kernel_nofault(char *dst, const void *unsafe_addr, long count)
 	dst[-1] = '\0';
 	return -EFAULT;
 }
-#else /* HAVE_GET_KERNEL_NOFAULT */
-/**
- * copy_from_kernel_nofault(): safely attempt to read from kernel-space
- * @dst: pointer to the buffer that shall take the data
- * @src: address to read from
- * @size: size of the data chunk
- *
- * Safely read from kernel address @src to the buffer at @dst.  If a kernel
- * fault happens, handle that and return -EFAULT.  If @src is not a valid kernel
- * address, return -ERANGE.
- *
- * We ensure that the copy_from_user is executed in atomic context so that
- * do_page_fault() doesn't attempt to take mmap_lock.  This makes
- * copy_from_kernel_nofault() suitable for use within regions where the caller
- * already holds mmap_lock, or other locks which nest inside mmap_lock.
- */
-long copy_from_kernel_nofault(void *dst, const void *src, size_t size)
-{
-	long ret;
-	mm_segment_t old_fs = get_fs();
-
-	if (!copy_from_kernel_nofault_allowed(src, size))
-		return -ERANGE;
-
-	set_fs(KERNEL_DS);
-	pagefault_disable();
-	ret = __copy_from_user_inatomic(dst, (__force const void __user *)src,
-			size);
-	pagefault_enable();
-	set_fs(old_fs);
-
-	if (ret)
-		return -EFAULT;
-	return 0;
-}
-EXPORT_SYMBOL_GPL(copy_from_kernel_nofault);
-
-/**
- * copy_to_kernel_nofault(): safely attempt to write to a location
- * @dst: address to write to
- * @src: pointer to the data that shall be written
- * @size: size of the data chunk
- *
- * Safely write to address @dst from the buffer at @src.  If a kernel fault
- * happens, handle that and return -EFAULT.
- */
-long copy_to_kernel_nofault(void *dst, const void *src, size_t size)
-{
-	long ret;
-	mm_segment_t old_fs = get_fs();
-
-	set_fs(KERNEL_DS);
-	pagefault_disable();
-	ret = __copy_to_user_inatomic((__force void __user *)dst, src, size);
-	pagefault_enable();
-	set_fs(old_fs);
-
-	if (ret)
-		return -EFAULT;
-	return 0;
-}
-
-/**
- * strncpy_from_kernel_nofault: - Copy a NUL terminated string from unsafe
- *				 address.
- * @dst:   Destination address, in kernel space.  This buffer must be at
- *         least @count bytes long.
- * @unsafe_addr: Unsafe address.
- * @count: Maximum number of bytes to copy, including the trailing NUL.
- *
- * Copies a NUL-terminated string from unsafe address to kernel buffer.
- *
- * On success, returns the length of the string INCLUDING the trailing NUL.
- *
- * If access fails, returns -EFAULT (some data may have been copied and the
- * trailing NUL added).  If @unsafe_addr is not a valid kernel address, return
- * -ERANGE.
- *
- * If @count is smaller than the length of the string, copies @count-1 bytes,
- * sets the last byte of @dst buffer to NUL and returns @count.
- */
-long strncpy_from_kernel_nofault(char *dst, const void *unsafe_addr, long count)
-{
-	mm_segment_t old_fs = get_fs();
-	const void *src = unsafe_addr;
-	long ret;
-
-	if (unlikely(count <= 0))
-		return 0;
-	if (!copy_from_kernel_nofault_allowed(unsafe_addr, count))
-		return -ERANGE;
-
-	set_fs(KERNEL_DS);
-	pagefault_disable();
-
-	do {
-		ret = __get_user(*dst++, (const char __user __force *)src++);
-	} while (dst[-1] && ret == 0 && src - unsafe_addr < count);
-
-	dst[-1] = '\0';
-	pagefault_enable();
-	set_fs(old_fs);
-
-	return ret ? -EFAULT : src - unsafe_addr;
-}
-#endif /* HAVE_GET_KERNEL_NOFAULT */
 
 /**
  * copy_from_user_nofault(): safely attempt to read from a user-space location
-- 
2.29.2

