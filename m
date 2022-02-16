Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B94304B89B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 14:22:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzJXm28Tbz3f3l
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 00:22:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lBOJyeVG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lBOJyeVG; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzJR40gxSz3cRn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 00:17:35 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9BE186165A;
 Wed, 16 Feb 2022 13:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29850C36AEA;
 Wed, 16 Feb 2022 13:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645017454;
 bh=vo9dsIEQPQMwDE1F9151Sj8jUgLpMoSWAhLaZqQrPZo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lBOJyeVG43t32e6bfIFQr2JNVmm/3CNnrSPgqp1aywEBs/TnQkH6UoCiuwvYMO5MT
 lwj96h6bIunw0aUrOBHuzAKda33BuKaGijgF6GnixzSz0Sdjj9nkHeXMHqnuG3V0jx
 44u9TnpCcEvGf+Vd6ksaKYU1m1gu9FHVMuqt7U7Z/oHjVq7rSyW4eH2Jx7Z461guOE
 mcS1xOazBw3oe3viFMv1lFKhgYJQk0K4Po3WN6QX2wQnkyybT7djomYdy6S5JuLuay
 gvNVGTV6/HrfYqwdbeOKnPWvh89RBj9KN27iwj3K2hOs52sURTV04KxU5EHc02P7Ol
 oUX9kkXIU5HPQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Subject: [PATCH v2 11/18] arm64: simplify access_ok()
Date: Wed, 16 Feb 2022 14:13:25 +0100
Message-Id: <20220216131332.1489939-12-arnd@kernel.org>
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
 nickhu@andestech.com, Robin Murphy <robin.murphy@arm.com>,
 linux-mips@vger.kernel.org, dinguyen@kernel.org, ebiederm@xmission.com,
 richard@nod.at, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

arm64 has an inline asm implementation of access_ok() that is derived from
the 32-bit arm version and optimized for the case that both the limit and
the size are variable. With set_fs() gone, the limit is always constant,
and the size usually is as well, so just using the default implementation
reduces the check into a comparison against a constant that can be
scheduled by the compiler.

On a defconfig build, this saves over 28KB of .text.

Acked-by: Robin Murphy <robin.murphy@arm.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/include/asm/uaccess.h | 34 ++++++++++----------------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 2e20879fe3cf..199c553b740a 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -26,6 +26,14 @@
 #include <asm/memory.h>
 #include <asm/extable.h>
 
+static inline int __access_ok(const void __user *ptr, unsigned long size)
+{
+	unsigned long limit = TASK_SIZE_MAX;
+	unsigned long addr = (unsigned long)ptr;
+
+	return (size <= limit) && (addr <= (limit - size));
+}
+
 /*
  * Test whether a block of memory is a valid user space address.
  * Returns 1 if the range is valid, 0 otherwise.
@@ -33,10 +41,8 @@
  * This is equivalent to the following test:
  * (u65)addr + (u65)size <= (u65)TASK_SIZE_MAX
  */
-static inline unsigned long __range_ok(const void __user *addr, unsigned long size)
+static inline int access_ok(const void __user *addr, unsigned long size)
 {
-	unsigned long ret, limit = TASK_SIZE_MAX - 1;
-
 	/*
 	 * Asynchronous I/O running in a kernel thread does not have the
 	 * TIF_TAGGED_ADDR flag of the process owning the mm, so always untag
@@ -46,29 +52,9 @@ static inline unsigned long __range_ok(const void __user *addr, unsigned long si
 	    (current->flags & PF_KTHREAD || test_thread_flag(TIF_TAGGED_ADDR)))
 		addr = untagged_addr(addr);
 
-	__chk_user_ptr(addr);
-	asm volatile(
-	// A + B <= C + 1 for all A,B,C, in four easy steps:
-	// 1: X = A + B; X' = X % 2^64
-	"	adds	%0, %3, %2\n"
-	// 2: Set C = 0 if X > 2^64, to guarantee X' > C in step 4
-	"	csel	%1, xzr, %1, hi\n"
-	// 3: Set X' = ~0 if X >= 2^64. For X == 2^64, this decrements X'
-	//    to compensate for the carry flag being set in step 4. For
-	//    X > 2^64, X' merely has to remain nonzero, which it does.
-	"	csinv	%0, %0, xzr, cc\n"
-	// 4: For X < 2^64, this gives us X' - C - 1 <= 0, where the -1
-	//    comes from the carry in being clear. Otherwise, we are
-	//    testing X' - C == 0, subject to the previous adjustments.
-	"	sbcs	xzr, %0, %1\n"
-	"	cset	%0, ls\n"
-	: "=&r" (ret), "+r" (limit) : "Ir" (size), "0" (addr) : "cc");
-
-	return ret;
+	return likely(__access_ok(addr, size));
 }
 
-#define access_ok(addr, size)	__range_ok(addr, size)
-
 /*
  * User access enabling/disabling.
  */
-- 
2.29.2

