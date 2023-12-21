Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 036FF81B56F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 13:04:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eYNv7DGW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Swpyb4YwWz3cZ4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 23:04:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eYNv7DGW;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Swpxp2yBlz30gG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 23:04:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1703160254;
	bh=BIAvLb6f4qzglKc3kV7ftLg1V6JtUfyQ4/B0T5k76ek=;
	h=From:To:Cc:Subject:Date:From;
	b=eYNv7DGWl6+X4+U6PcdgdAWi4I1QICAUDon90SPi/XJ0BHqpFYlY4HzvzsUgK5l7e
	 FRRNBbJ8I+efICBECjIF9NP2MdWrFRFsfXcpibK9RZi2dYDM56UW1aFNnDyXYvLsXy
	 kpAhAIOO7aBVwQE+scBp//6semmQ5se60BKoBae52KKvD14jLOJWNWEUg518WnxOcb
	 oIvK/NDX2pBxBIXADNpV+A3JT8jqhS4CvH1wsTKC7U3Isoryd/CmL155D1zynaIKzw
	 1T1kmPsRZ+TjgvCPGY2mhTHrjjD1MarOrSUebByHaZS6H+EfPRt2LOB1aXPncBlviw
	 ON0EsfU7N1jmg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Swpxp1m1Hz4wd7;
	Thu, 21 Dec 2023 23:04:14 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc: Split PAGE_SHIFT/SIZE into vdso/page.h
Date: Thu, 21 Dec 2023 23:04:10 +1100
Message-ID: <20231221120410.2226678-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.0
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
Cc: linus.walleij@linaro.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The VDSO needs PAGE_SHIFT/SIZE defined, so it includes asm/page.h.

However when COMPAT=y the VDSO is built 32-bit, even though the kernel
is 64-bit. That can lead to odd warnings because some kernel constants
are 64-bit, but unsigned long is 32-bit, for example:

    VDSO32C arch/powerpc/kernel/vdso/vgettimeofday-32.o
  In file included from <built-in>:4:
  In file included from /home/michael/linux/lib/vdso/gettimeofday.c:5:
  In file included from ../include/vdso/datapage.h:137:
  In file included from ../arch/powerpc/include/asm/vdso/gettimeofday.h:7:
  ../arch/powerpc/include/asm/page.h:230:9: warning: result of comparison of constant 13835058055282163712 with expression of type 'unsigned long' is always true
    230 |         return __pa(kaddr) >> PAGE_SHIFT;
        |                ^~~~~~~~~~~

Fix it by moving the PAGE_SHIFT/SIZE constants into a separate header,
which can be included by the VDSO, and also by the existing kernel
headers. That avoids exposing the rest of the header to the non-standard
build environment of the compat VDSO.

The particular warning above was introduced by commit 58b6fed89ab0
("powerpc: Make virt_to_pfn() a static inline"), though it is not at
fault, it just exposed the fact that the VDSO was including parts of
page.h that weren't needed or appropriate for the VDSO.

Don't copy the comment about page sizes, it just risks becoming
outdated, that information is better available in the Kconfig
dependencies and help text.

Fixes: 58b6fed89ab0 ("powerpc: Make virt_to_pfn() a static inline")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311061940.4pBrm44u-lkp@intel.com/
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/page.h              | 10 +---------
 arch/powerpc/include/asm/vdso/gettimeofday.h |  2 +-
 arch/powerpc/include/asm/vdso/page.h         | 10 ++++++++++
 arch/powerpc/kernel/vdso/vdso32.lds.S        |  2 +-
 arch/powerpc/kernel/vdso/vdso64.lds.S        |  2 +-
 arch/powerpc/kernel/vdso32_wrapper.S         |  2 +-
 arch/powerpc/kernel/vdso64_wrapper.S         |  2 +-
 7 files changed, 16 insertions(+), 14 deletions(-)
 create mode 100644 arch/powerpc/include/asm/vdso/page.h

diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index e5fcc79b5bfb..79b463f6f0d7 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -14,15 +14,7 @@
 #include <asm/types.h>
 #endif
 #include <asm/asm-const.h>
-
-/*
- * On regular PPC32 page size is 4K (but we support 4K/16K/64K/256K pages
- * on PPC44x and 4K/16K on 8xx). For PPC64 we support either 4K or 64K software
- * page size. When using 64K pages however, whether we are really supporting
- * 64K pages in HW or not is irrelevant to those definitions.
- */
-#define PAGE_SHIFT		CONFIG_PPC_PAGE_SHIFT
-#define PAGE_SIZE		(ASM_CONST(1) << PAGE_SHIFT)
+#include <asm/vdso/page.h>
 
 #ifndef __ASSEMBLY__
 #ifndef CONFIG_HUGETLB_PAGE
diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
index f0a4cf01e85c..81e82777b0f9 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -4,7 +4,7 @@
 
 #ifndef __ASSEMBLY__
 
-#include <asm/page.h>
+#include <asm/vdso/page.h>
 #include <asm/vdso/timebase.h>
 #include <asm/barrier.h>
 #include <asm/unistd.h>
diff --git a/arch/powerpc/include/asm/vdso/page.h b/arch/powerpc/include/asm/vdso/page.h
new file mode 100644
index 000000000000..fa30ad64c88e
--- /dev/null
+++ b/arch/powerpc/include/asm/vdso/page.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _ASM_POWERPC_VDSO_PAGE_H
+#define _ASM_POWERPC_VDSO_PAGE_H
+
+#include <vdso/const.h>
+
+#define PAGE_SHIFT	CONFIG_PPC_PAGE_SHIFT
+#define PAGE_SIZE	(UL(1) << PAGE_SHIFT)
+
+#endif // _ASM_POWERPC_VDSO_PAGE_H
diff --git a/arch/powerpc/kernel/vdso/vdso32.lds.S b/arch/powerpc/kernel/vdso/vdso32.lds.S
index 426e1ccc6971..3a6b232c4147 100644
--- a/arch/powerpc/kernel/vdso/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso/vdso32.lds.S
@@ -4,7 +4,7 @@
  * library
  */
 #include <asm/vdso.h>
-#include <asm/page.h>
+#include <asm/vdso/page.h>
 #include <asm-generic/vmlinux.lds.h>
 
 #ifdef __LITTLE_ENDIAN__
diff --git a/arch/powerpc/kernel/vdso/vdso64.lds.S b/arch/powerpc/kernel/vdso/vdso64.lds.S
index bda6c8cdd459..806005092197 100644
--- a/arch/powerpc/kernel/vdso/vdso64.lds.S
+++ b/arch/powerpc/kernel/vdso/vdso64.lds.S
@@ -4,7 +4,7 @@
  * library
  */
 #include <asm/vdso.h>
-#include <asm/page.h>
+#include <asm/vdso/page.h>
 #include <asm-generic/vmlinux.lds.h>
 
 #ifdef __LITTLE_ENDIAN__
diff --git a/arch/powerpc/kernel/vdso32_wrapper.S b/arch/powerpc/kernel/vdso32_wrapper.S
index 10f92f265d51..3d9d0824a91c 100644
--- a/arch/powerpc/kernel/vdso32_wrapper.S
+++ b/arch/powerpc/kernel/vdso32_wrapper.S
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/linkage.h>
-#include <asm/page.h>
+#include <asm/vdso/page.h>
 
 	__PAGE_ALIGNED_DATA
 
diff --git a/arch/powerpc/kernel/vdso64_wrapper.S b/arch/powerpc/kernel/vdso64_wrapper.S
index 839d1a61411d..0e3ff78d7c58 100644
--- a/arch/powerpc/kernel/vdso64_wrapper.S
+++ b/arch/powerpc/kernel/vdso64_wrapper.S
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/linkage.h>
-#include <asm/page.h>
+#include <asm/vdso/page.h>
 
 	__PAGE_ALIGNED_DATA
 
-- 
2.43.0

