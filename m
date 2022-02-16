Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E4E4B8957
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 14:18:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzJSW0vvqz3dj2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 00:18:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=omMDrhEP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=omMDrhEP; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzJPv1c9Gz2ywt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 00:16:35 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3B412CE26F4;
 Wed, 16 Feb 2022 13:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 214BAC36AE7;
 Wed, 16 Feb 2022 13:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645017393;
 bh=lx487dro4zL/zPL193Oy6nweU7A4WVV+sN3sqinseG4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=omMDrhEPLws0kx3FaJdMKyiFQbfwIcb5C7tofQAI2lXuZWrTiTUwDFHKrcpaJ13Ok
 NsykM6tJoZvXy9HpScnzw03vekziZH4+cmNWuN8sFx6q+kht1g72i5yzFbnCgaADFX
 3buM3JcSdiMZxvMTvsPMSDWKxY3LFEssTkxEvrPD9rYjO0WAcv/PY2WS7xtaDGc4wy
 DxYAh6OJOKM+eKboklR6CEThuRYhYEyLLFqlkJ2zwQTnKoB+HomGSt++/CH7kJczaj
 yZMo0S4/Pd73o6yZAoHMI5U6kMVwrUt/QgHtW6Ao2qPNSByCOZz+CMYBy1uC+ywZu0
 EVn+6B86qN3Bg==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Subject: [PATCH v2 05/18] x86: remove __range_not_ok()
Date: Wed, 16 Feb 2022 14:13:19 +0100
Message-Id: <20220216131332.1489939-6-arnd@kernel.org>
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
 Christoph Hellwig <hch@infradead.org>, mingo@redhat.com, geert@linux-m68k.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 hca@linux.ibm.com, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 green.hu@gmail.com, shorne@gmail.com, monstr@monstr.eu,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, nickhu@andestech.com,
 linux-mips@vger.kernel.org, dinguyen@kernel.org, ebiederm@xmission.com,
 richard@nod.at, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

The __range_not_ok() helper is an x86 (and sparc64) specific interface
that does roughly the same thing as __access_ok(), but with different
calling conventions.

Change this to use the normal interface in order for consistency as we
clean up all access_ok() implementations.

This changes the limit from TASK_SIZE to TASK_SIZE_MAX, which Al points
out is the right thing do do here anyway.

The callers have to use __access_ok() instead of the normal access_ok()
though, because on x86 that contains a WARN_ON_IN_IRQ() check that cannot
be used inside of NMI context while tracing.

Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
Suggested-by: Christoph Hellwig <hch@infradead.org>
Link: https://lore.kernel.org/lkml/YgsUKcXGR7r4nINj@zeniv-ca.linux.org.uk/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/events/core.c         |  2 +-
 arch/x86/include/asm/uaccess.h | 10 ++++++----
 arch/x86/kernel/dumpstack.c    |  2 +-
 arch/x86/kernel/stacktrace.c   |  2 +-
 arch/x86/lib/usercopy.c        |  2 +-
 5 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index e686c5e0537b..eef816fc216d 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -2794,7 +2794,7 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
 static inline int
 valid_user_frame(const void __user *fp, unsigned long size)
 {
-	return (__range_not_ok(fp, size, TASK_SIZE) == 0);
+	return __access_ok(fp, size);
 }
 
 static unsigned long get_segment_base(unsigned int segment)
diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index ac96f9b2d64b..79c4869ccdd6 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -16,8 +16,10 @@
  * Test whether a block of memory is a valid user space address.
  * Returns 0 if the range is valid, nonzero otherwise.
  */
-static inline bool __chk_range_not_ok(unsigned long addr, unsigned long size, unsigned long limit)
+static inline bool __chk_range_not_ok(unsigned long addr, unsigned long size)
 {
+	unsigned long limit = TASK_SIZE_MAX;
+
 	/*
 	 * If we have used "sizeof()" for the size,
 	 * we know it won't overflow the limit (but
@@ -35,10 +37,10 @@ static inline bool __chk_range_not_ok(unsigned long addr, unsigned long size, un
 	return unlikely(addr > limit);
 }
 
-#define __range_not_ok(addr, size, limit)				\
+#define __access_ok(addr, size)						\
 ({									\
 	__chk_user_ptr(addr);						\
-	__chk_range_not_ok((unsigned long __force)(addr), size, limit); \
+	!__chk_range_not_ok((unsigned long __force)(addr), size);	\
 })
 
 #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
@@ -69,7 +71,7 @@ static inline bool pagefault_disabled(void);
 #define access_ok(addr, size)					\
 ({									\
 	WARN_ON_IN_IRQ();						\
-	likely(!__range_not_ok(addr, size, TASK_SIZE_MAX));		\
+	likely(__access_ok(addr, size));				\
 })
 
 extern int __get_user_1(void);
diff --git a/arch/x86/kernel/dumpstack.c b/arch/x86/kernel/dumpstack.c
index 53de044e5654..da534fb7b5c6 100644
--- a/arch/x86/kernel/dumpstack.c
+++ b/arch/x86/kernel/dumpstack.c
@@ -85,7 +85,7 @@ static int copy_code(struct pt_regs *regs, u8 *buf, unsigned long src,
 	 * Make sure userspace isn't trying to trick us into dumping kernel
 	 * memory by pointing the userspace instruction pointer at it.
 	 */
-	if (__chk_range_not_ok(src, nbytes, TASK_SIZE_MAX))
+	if (!__access_ok((void __user *)src, nbytes))
 		return -EINVAL;
 
 	/*
diff --git a/arch/x86/kernel/stacktrace.c b/arch/x86/kernel/stacktrace.c
index 15b058eefc4e..ee117fcf46ed 100644
--- a/arch/x86/kernel/stacktrace.c
+++ b/arch/x86/kernel/stacktrace.c
@@ -90,7 +90,7 @@ copy_stack_frame(const struct stack_frame_user __user *fp,
 {
 	int ret;
 
-	if (__range_not_ok(fp, sizeof(*frame), TASK_SIZE))
+	if (!__access_ok(fp, sizeof(*frame)))
 		return 0;
 
 	ret = 1;
diff --git a/arch/x86/lib/usercopy.c b/arch/x86/lib/usercopy.c
index c3e8a62ca561..ad0139d25401 100644
--- a/arch/x86/lib/usercopy.c
+++ b/arch/x86/lib/usercopy.c
@@ -32,7 +32,7 @@ copy_from_user_nmi(void *to, const void __user *from, unsigned long n)
 {
 	unsigned long ret;
 
-	if (__range_not_ok(from, n, TASK_SIZE))
+	if (!__access_ok(from, n))
 		return n;
 
 	if (!nmi_uaccess_okay())
-- 
2.29.2

