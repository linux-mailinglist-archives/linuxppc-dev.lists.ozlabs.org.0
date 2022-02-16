Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE8A4B89A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 14:21:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzJWN1YHbz3dxZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 00:21:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RtZeNhuM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RtZeNhuM; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzJQh2xgLz3cjX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 00:17:16 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5ABD2CE26F6;
 Wed, 16 Feb 2022 13:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2C4C340F9;
 Wed, 16 Feb 2022 13:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645017433;
 bh=XYviTV8III28kBrCQmsfuK51xOc09ZOif7iEHrUTuIg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RtZeNhuMWLMdUCgp7sQPtFKueCz8UIMqyfmOJ7eTRpRAZj+EX1IydRbAp51tHxwWq
 5ne2vxMm/JuLMAmzyha4cuHaIahixOHFYVc5gGcfZri8EF8XqsDBKKhTiX2FVDpISR
 Pagw3akqo4xNGkF8Pb3UNLVmcr6ZFwFviZKx75YteMrlQ/LSVcu+z3apLlbK8geLHf
 v3iSy1y9VzaMo/+yVZXWf0Swp3oDEXhPv7eE6oQXabEKWYYUYMRDAqB7mO4dBnJnsi
 bzLr4K/tjkFnSoB/60v9gCoDQiRG0gDzcN5E85Rk8eBnmYUibpTvgJRV9oTUxC2Xso
 Mffr2yyPA6wPQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Subject: [PATCH v2 09/18] mips: use simpler access_ok()
Date: Wed, 16 Feb 2022 14:13:23 +0100
Message-Id: <20220216131332.1489939-10-arnd@kernel.org>
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

Before unifying the mips version of __access_ok() with the generic
code, this converts it to the same algorithm. This is a change in
behavior on mips64, as now address in the user segment, the lower
2^62 bytes, is taken to be valid, relying on a page fault for
addresses that are within that segment but not valid on that CPU.

The new version should be the most effecient way to do this, but
it gets rid of the special handling for size=0 that most other
architectures ignore as well.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/include/asm/uaccess.h | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
index db9a8e002b62..d7c89dc3426c 100644
--- a/arch/mips/include/asm/uaccess.h
+++ b/arch/mips/include/asm/uaccess.h
@@ -19,6 +19,7 @@
 #ifdef CONFIG_32BIT
 
 #define __UA_LIMIT 0x80000000UL
+#define TASK_SIZE_MAX	__UA_LIMIT
 
 #define __UA_ADDR	".word"
 #define __UA_LA		"la"
@@ -33,6 +34,7 @@
 extern u64 __ua_limit;
 
 #define __UA_LIMIT	__ua_limit
+#define TASK_SIZE_MAX	XKSSEG
 
 #define __UA_ADDR	".dword"
 #define __UA_LA		"dla"
@@ -42,22 +44,6 @@ extern u64 __ua_limit;
 
 #endif /* CONFIG_64BIT */
 
-/*
- * Is a address valid? This does a straightforward calculation rather
- * than tests.
- *
- * Address valid if:
- *  - "addr" doesn't have any high-bits set
- *  - AND "size" doesn't have any high-bits set
- *  - AND "addr+size" doesn't have any high-bits set
- *  - OR we are in kernel mode.
- *
- * __ua_size() is a trick to avoid runtime checking of positive constant
- * sizes; for those we already know at compile time that the size is ok.
- */
-#define __ua_size(size)							\
-	((__builtin_constant_p(size) && (signed long) (size) > 0) ? 0 : (size))
-
 /*
  * access_ok: - Checks if a user space pointer is valid
  * @addr: User space pointer to start of block to check
@@ -79,9 +65,9 @@ extern u64 __ua_limit;
 static inline int __access_ok(const void __user *p, unsigned long size)
 {
 	unsigned long addr = (unsigned long)p;
-	unsigned long end = addr + size - !!size;
+	unsigned long limit = TASK_SIZE_MAX;
 
-	return (__UA_LIMIT & (addr | end | __ua_size(size))) == 0;
+	return (size <= limit) && (addr <= (limit - size));
 }
 
 #define access_ok(addr, size)					\
-- 
2.29.2

