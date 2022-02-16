Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 437A34B891C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 14:18:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzJRs5CbYz2ynt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 00:18:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ahf0SuXy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ahf0SuXy; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzJPl5Fz5z3cTX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 00:16:27 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 31B25CE26F2;
 Wed, 16 Feb 2022 13:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19871C340EC;
 Wed, 16 Feb 2022 13:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645017383;
 bh=2pS2EzxZTLC0RofP+LmFDCkJfcLqG3oyKMTlDsmnQjc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ahf0SuXyLVFK//MzrUojAa1dlV73ds6OjdnYM2wE/mHFjHm+Y2vq2N25tBSaCpFca
 dE08jwts2dHUzSNi7BJLZ3Kcq7GO8zUpT7H/1MsSUv/XTdGnPK91uDPRKr3kV6Vymm
 CajpRti7h9jYO3szKwvbjpmEvjI7KjJjsLNVB2ORWzc8ifMHKuyfkUdy6pkiZf7JzY
 sRAlCtU6+eJwtJ9BFIrRL9+HEZOhHyNuWTHPGcsDOgh784O6BiZrtoO2eS0bbXjNdj
 AF4ZiT4Oy29k61pG2ChhothCgXSt/Z6vBZXhngFZsPvYH7YB6c13bRUJ05nBWL+7jh
 F7rtu/pVFh29g==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Subject: [PATCH v2 04/18] sparc64: add __{get,put}_kernel_nocheck()
Date: Wed, 16 Feb 2022 14:13:18 +0100
Message-Id: <20220216131332.1489939-5-arnd@kernel.org>
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

sparc64 is one of the architectures that uses separate address
spaces for kernel and user addresses, so __get_kernel_nofault()
can not just call into the normal __get_user() without the
access_ok() check.

Instead duplicate __get_user() and __put_user() into their
in-kernel versions, with minor changes for the calling conventions
and leaving out the address space modifier on the assembler
instruction.

This could surely be written more elegantly, but duplicating it
gets the job done.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/sparc/include/asm/uaccess_64.h | 78 +++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/sparc/include/asm/uaccess_64.h b/arch/sparc/include/asm/uaccess_64.h
index 30eb4c6414d1..b283798315b1 100644
--- a/arch/sparc/include/asm/uaccess_64.h
+++ b/arch/sparc/include/asm/uaccess_64.h
@@ -100,6 +100,42 @@ void __retl_efault(void);
 struct __large_struct { unsigned long buf[100]; };
 #define __m(x) ((struct __large_struct *)(x))
 
+#define __put_kernel_nofault(dst, src, type, label)			\
+do {									\
+	type *addr = (type __force *)(dst);				\
+	type data = *(type *)src;					\
+	register int __pu_ret;						\
+	switch (sizeof(type)) {						\
+	case 1: __put_kernel_asm(data, b, addr, __pu_ret); break;	\
+	case 2: __put_kernel_asm(data, h, addr, __pu_ret); break;	\
+	case 4: __put_kernel_asm(data, w, addr, __pu_ret); break;	\
+	case 8: __put_kernel_asm(data, x, addr, __pu_ret); break;	\
+	default: __pu_ret = __put_user_bad(); break;			\
+	}								\
+	if (__pu_ret)							\
+		goto label;						\
+} while (0)
+
+#define __put_kernel_asm(x, size, addr, ret)				\
+__asm__ __volatile__(							\
+		"/* Put kernel asm, inline. */\n"			\
+	"1:\t"	"st"#size " %1, [%2]\n\t"				\
+		"clr	%0\n"						\
+	"2:\n\n\t"							\
+		".section .fixup,#alloc,#execinstr\n\t"			\
+		".align	4\n"						\
+	"3:\n\t"							\
+		"sethi	%%hi(2b), %0\n\t"				\
+		"jmpl	%0 + %%lo(2b), %%g0\n\t"			\
+		" mov	%3, %0\n\n\t"					\
+		".previous\n\t"						\
+		".section __ex_table,\"a\"\n\t"				\
+		".align	4\n\t"						\
+		".word	1b, 3b\n\t"					\
+		".previous\n\n\t"					\
+	       : "=r" (ret) : "r" (x), "r" (__m(addr)),			\
+		 "i" (-EFAULT))
+
 #define __put_user_nocheck(data, addr, size) ({			\
 	register int __pu_ret;					\
 	switch (size) {						\
@@ -134,6 +170,48 @@ __asm__ __volatile__(							\
 
 int __put_user_bad(void);
 
+#define __get_kernel_nofault(dst, src, type, label)			     \
+do {									     \
+	type *addr = (type __force *)(src);		     		     \
+	register int __gu_ret;						     \
+	register unsigned long __gu_val;				     \
+	switch (sizeof(type)) {						     \
+		case 1: __get_kernel_asm(__gu_val, ub, addr, __gu_ret); break; \
+		case 2: __get_kernel_asm(__gu_val, uh, addr, __gu_ret); break; \
+		case 4: __get_kernel_asm(__gu_val, uw, addr, __gu_ret); break; \
+		case 8: __get_kernel_asm(__gu_val, x, addr, __gu_ret); break;  \
+		default:						     \
+			__gu_val = 0;					     \
+			__gu_ret = __get_user_bad();			     \
+			break;						     \
+	} 								     \
+	if (__gu_ret)							     \
+		goto label;						     \
+	*(type *)dst = (__force type) __gu_val;				     \
+} while (0)
+#define __get_kernel_asm(x, size, addr, ret)				\
+__asm__ __volatile__(							\
+		"/* Get kernel asm, inline. */\n"			\
+	"1:\t"	"ld"#size " [%2], %1\n\t"				\
+		"clr	%0\n"						\
+	"2:\n\n\t"							\
+		".section .fixup,#alloc,#execinstr\n\t"			\
+		".align	4\n"						\
+	"3:\n\t"							\
+		"sethi	%%hi(2b), %0\n\t"				\
+		"clr	%1\n\t"						\
+		"jmpl	%0 + %%lo(2b), %%g0\n\t"			\
+		" mov	%3, %0\n\n\t"					\
+		".previous\n\t"						\
+		".section __ex_table,\"a\"\n\t"				\
+		".align	4\n\t"						\
+		".word	1b, 3b\n\n\t"					\
+		".previous\n\t"						\
+	       : "=r" (ret), "=r" (x) : "r" (__m(addr)),		\
+		 "i" (-EFAULT))
+
+#define HAVE_GET_KERNEL_NOFAULT
+
 #define __get_user_nocheck(data, addr, size, type) ({			     \
 	register int __gu_ret;						     \
 	register unsigned long __gu_val;				     \
-- 
2.29.2

