Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFD04B897F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 14:19:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzJTB6HYXz3dmY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 00:19:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y2Mjm03t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Y2Mjm03t; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzJQ6276Wz3bb7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 00:16:46 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 63D25CE26EE;
 Wed, 16 Feb 2022 13:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5098AC340F3;
 Wed, 16 Feb 2022 13:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645017403;
 bh=FL3MwLnWcBo8JSN1gcn5jt3T6ZS9T2mg8wS4azHPBik=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y2Mjm03t4E3XFheH9yqQ6BGU3tXKnLCiOO/OwTUtf1lgBYcrWial86jpIz7PtRFIw
 avWAsmqN07Ju1N9aZWFEK6djiU4xxVsrWrIldgYbLMAINPBCIE+Gm9knAbw2ZJ5YQU
 0At6HGqJSzJ5Apl70hqpM+UJUgnBEg8NWGL9S7AWW9MhT9XDK6p1AAJUM3JogLfwD2
 1lrWss7flCDtYrrnfWGqToUCjUhfOxjIFu9y4/66Sjvu+ZaCBq+vjebdXEQiJu+If4
 gZzt/RXBM8sHm8w1g75IDg7GXTr01G1sdmyHMVFaBZouzSWgTlBFAfWq558NJn3p1E
 Mzr/8UqWDZOoA==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Subject: [PATCH v2 06/18] x86: use more conventional access_ok() definition
Date: Wed, 16 Feb 2022 14:13:20 +0100
Message-Id: <20220216131332.1489939-7-arnd@kernel.org>
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

The way that access_ok() is defined on x86 is slightly different from
most other architectures, and a bit more complex.

The generic version tends to result in the best output on all
architectures, as it results in single comparison against a constant
limit for calls with a known size.

There are a few callers of __range_not_ok(), all of which use TASK_SIZE
as the limit rather than TASK_SIZE_MAX, but I could not see any reason
for picking this. Changing these to call __access_ok() instead uses the
default limit, but keeps the behavior otherwise.

x86 is the only architecture with a WARN_ON_IN_IRQ() checking
access_ok(), but it's probably best to leave that in place.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/include/asm/uaccess.h | 25 +++----------------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index 79c4869ccdd6..a59ba2578e64 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -16,33 +16,14 @@
  * Test whether a block of memory is a valid user space address.
  * Returns 0 if the range is valid, nonzero otherwise.
  */
-static inline bool __chk_range_not_ok(unsigned long addr, unsigned long size)
+static inline bool __access_ok(void __user *ptr, unsigned long size)
 {
 	unsigned long limit = TASK_SIZE_MAX;
+	unsigned long addr = ptr;
 
-	/*
-	 * If we have used "sizeof()" for the size,
-	 * we know it won't overflow the limit (but
-	 * it might overflow the 'addr', so it's
-	 * important to subtract the size from the
-	 * limit, not add it to the address).
-	 */
-	if (__builtin_constant_p(size))
-		return unlikely(addr > limit - size);
-
-	/* Arbitrary sizes? Be careful about overflow */
-	addr += size;
-	if (unlikely(addr < size))
-		return true;
-	return unlikely(addr > limit);
+	return (size <= limit) && (addr <= (limit - size));
 }
 
-#define __access_ok(addr, size)						\
-({									\
-	__chk_user_ptr(addr);						\
-	!__chk_range_not_ok((unsigned long __force)(addr), size);	\
-})
-
 #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
 static inline bool pagefault_disabled(void);
 # define WARN_ON_IN_IRQ()	\
-- 
2.29.2

