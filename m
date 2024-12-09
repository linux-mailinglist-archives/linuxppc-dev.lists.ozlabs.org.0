Return-Path: <linuxppc-dev+bounces-3854-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC70F9E8967
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2024 04:00:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y666t5LH9z2yNn;
	Mon,  9 Dec 2024 14:00:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.191
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733713222;
	cv=none; b=H/M5b0QgUL9di4mMlqEckMooxSnDR/VSA65WhghVqLASc2AdU5xV/nwKsXXIYAXDbpBDayVrpMPluuDULJvSgUo2Kp+P6CtHLxg2QnZT6wacPWPmigNpa+n34jS/MN2A9ESs/6TzdfaiOPGOlh4f9zeD4Iw7acooBIfILEl+5VgzOrgj5X7b2BBQhuJtRjiLVnaSCLaJYqUIF2cGpAp7Y+zWXOyw0Z0pbzTevx9PTKM9CTfVZzRL7ZARiT1YilmW4fDfvrOXOH+zjQfZKIiqFiSrKgwJ8avThkbSeNl6S3PakD21DRrYH9x/lDdDOFsycThy47970br/m6HEIa7xeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733713222; c=relaxed/relaxed;
	bh=3LXOxUklyNgf5lug7zsMwusW92Er0cLCd2wPgXWZ91s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SWYFgjyTbMH1aFiTTDrs+DwO7QckYnRMsLsq8VV3tBtR/SZg/4TmRTVddCUzv+fBwZiuQo6yDX2o2A2xJIIh39WYQ7T68OZBsd3koSH3g8Px+LmeGGp2+9aEkFNyfmbHAIdVMuaqxGT+ulpRFp9ZBnmRZOv1sJIKJspy2MsI4Cg28TakTk2kKWXQlSJ9Q6wt/Mp7InFHtFEneI6fIxQEFnoxQt5mQq3j3WqkqSiMX8o09nD+fxVVaZ3OEAhb2CgXDktWq5c1oMu39ihDH3JEECEDbxU3B+5iuzPE6h0318VUeC0FMDrvCYxlGsmgM4/L7JuzJY5E48U3U54fCXUIMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y666r6P0Lz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2024 14:00:20 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Y65hf0h34z1kvfy;
	Mon,  9 Dec 2024 10:41:06 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id A318F14010C;
	Mon,  9 Dec 2024 10:43:28 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Dec 2024 10:43:26 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron
	<Jonathan.Cameron@Huawei.com>, Mauro Carvalho Chehab
	<mchehab+huawei@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, James
 Morse <james.morse@arm.com>, Robin Murphy <robin.murphy@arm.com>, Andrey
 Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Andrey Ryabinin
	<ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Aneesh Kumar K.V
	<aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Madhavan Srinivasan
	<maddy@linux.ibm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<kasan-dev@googlegroups.com>, Tong Tiangen <tongtiangen@huawei.com>,
	<wangkefeng.wang@huawei.com>, Guohanjun <guohanjun@huawei.com>
Subject: [PATCH v13 5/5] arm64: introduce copy_mc_to_kernel() implementation
Date: Mon, 9 Dec 2024 10:42:57 +0800
Message-ID: <20241209024257.3618492-6-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241209024257.3618492-1-tongtiangen@huawei.com>
References: <20241209024257.3618492-1-tongtiangen@huawei.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The copy_mc_to_kernel() helper is memory copy implementation that handles
source exceptions. It can be used in memory copy scenarios that tolerate
hardware memory errors(e.g: pmem_read/dax_copy_to_iter).

Currently, only x86 and ppc support this helper, Add this for ARM64 as
well, if ARCH_HAS_COPY_MC is defined, by implementing copy_mc_to_kernel()
and memcpy_mc() functions.

Because there is no caller-saved GPR is available for saving "bytes not
copied" in memcpy(), the memcpy_mc() is referenced to the implementation
of copy_from_user(). In addition, the fixup of MOPS insn is not considered
at present.

Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
---
 arch/arm64/include/asm/string.h  |  5 ++
 arch/arm64/include/asm/uaccess.h | 18 ++++++
 arch/arm64/lib/Makefile          |  2 +-
 arch/arm64/lib/memcpy_mc.S       | 98 ++++++++++++++++++++++++++++++++
 mm/kasan/shadow.c                | 12 ++++
 5 files changed, 134 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/lib/memcpy_mc.S

diff --git a/arch/arm64/include/asm/string.h b/arch/arm64/include/asm/string.h
index 3a3264ff47b9..23eca4fb24fa 100644
--- a/arch/arm64/include/asm/string.h
+++ b/arch/arm64/include/asm/string.h
@@ -35,6 +35,10 @@ extern void *memchr(const void *, int, __kernel_size_t);
 extern void *memcpy(void *, const void *, __kernel_size_t);
 extern void *__memcpy(void *, const void *, __kernel_size_t);
 
+#define __HAVE_ARCH_MEMCPY_MC
+extern int memcpy_mc(void *, const void *, __kernel_size_t);
+extern int __memcpy_mc(void *, const void *, __kernel_size_t);
+
 #define __HAVE_ARCH_MEMMOVE
 extern void *memmove(void *, const void *, __kernel_size_t);
 extern void *__memmove(void *, const void *, __kernel_size_t);
@@ -57,6 +61,7 @@ void memcpy_flushcache(void *dst, const void *src, size_t cnt);
  */
 
 #define memcpy(dst, src, len) __memcpy(dst, src, len)
+#define memcpy_mc(dst, src, len) __memcpy_mc(dst, src, len)
 #define memmove(dst, src, len) __memmove(dst, src, len)
 #define memset(s, c, n) __memset(s, c, n)
 
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 5b91803201ef..2a14b732306a 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -542,4 +542,22 @@ static inline void put_user_gcs(unsigned long val, unsigned long __user *addr,
 
 #endif /* CONFIG_ARM64_GCS */
 
+#ifdef CONFIG_ARCH_HAS_COPY_MC
+/**
+ * copy_mc_to_kernel - memory copy that handles source exceptions
+ *
+ * @to:		destination address
+ * @from:	source address
+ * @size:	number of bytes to copy
+ *
+ * Return 0 for success, or bytes not copied.
+ */
+static inline unsigned long __must_check
+copy_mc_to_kernel(void *to, const void *from, unsigned long size)
+{
+	return memcpy_mc(to, from, size);
+}
+#define copy_mc_to_kernel copy_mc_to_kernel
+#endif
+
 #endif /* __ASM_UACCESS_H */
diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 78b0e9904689..326d71ba0517 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -13,7 +13,7 @@ endif
 
 lib-$(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) += uaccess_flushcache.o
 
-lib-$(CONFIG_ARCH_HAS_COPY_MC) += copy_mc_page.o
+lib-$(CONFIG_ARCH_HAS_COPY_MC) += copy_mc_page.o memcpy_mc.o
 
 obj-$(CONFIG_CRC32) += crc32.o crc32-glue.o
 
diff --git a/arch/arm64/lib/memcpy_mc.S b/arch/arm64/lib/memcpy_mc.S
new file mode 100644
index 000000000000..cb9caaa1ab0b
--- /dev/null
+++ b/arch/arm64/lib/memcpy_mc.S
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2013 ARM Ltd.
+ * Copyright (C) 2013 Linaro.
+ *
+ * This code is based on glibc cortex strings work originally authored by Linaro
+ * be found @
+ *
+ * http://bazaar.launchpad.net/~linaro-toolchain-dev/cortex-strings/trunk/
+ * files/head:/src/aarch64/
+ */
+
+#include <linux/linkage.h>
+#include <asm/assembler.h>
+#include <asm/cache.h>
+#include <asm/asm-uaccess.h>
+
+/*
+ * Copy a buffer from src to dest (alignment handled by the hardware)
+ *
+ * Parameters:
+ *	x0 - dest
+ *	x1 - src
+ *	x2 - n
+ * Returns:
+ *	x0 - bytes not copied
+ */
+	.macro ldrb1 reg, ptr, val
+	KERNEL_MEM_ERR(9997f, ldrb  \reg, [\ptr], \val)
+	.endm
+
+	.macro strb1 reg, ptr, val
+	strb \reg, [\ptr], \val
+	.endm
+
+	.macro ldrh1 reg, ptr, val
+	KERNEL_MEM_ERR(9997f, ldrh  \reg, [\ptr], \val)
+	.endm
+
+	.macro strh1 reg, ptr, val
+	strh \reg, [\ptr], \val
+	.endm
+
+	.macro ldr1 reg, ptr, val
+	KERNEL_MEM_ERR(9997f, ldr \reg, [\ptr], \val)
+	.endm
+
+	.macro str1 reg, ptr, val
+	str \reg, [\ptr], \val
+	.endm
+
+	.macro ldp1 reg1, reg2, ptr, val
+	KERNEL_MEM_ERR(9997f, ldp \reg1, \reg2, [\ptr], \val)
+	.endm
+
+	.macro stp1 reg1, reg2, ptr, val
+	stp \reg1, \reg2, [\ptr], \val
+	.endm
+
+end	.req	x5
+SYM_FUNC_START(__memcpy_mc_generic)
+	add	end, x0, x2
+#include "copy_template.S"
+	mov	x0, #0				// Nothing to copy
+	ret
+
+	// Exception fixups
+9997:	sub	x0, end, dst			// bytes not copied
+	ret
+SYM_FUNC_END(__memcpy_mc_generic)
+
+#ifdef CONFIG_AS_HAS_MOPS
+	.arch_extension mops
+SYM_FUNC_START(__memcpy_mc)
+alternative_if_not ARM64_HAS_MOPS
+	b       __memcpy_mc_generic
+alternative_else_nop_endif
+
+dstin   .req    x0
+src     .req    x1
+count   .req    x2
+dst     .req    x3
+
+	mov     dst, dstin
+	cpyp    [dst]!, [src]!, count!
+	cpym    [dst]!, [src]!, count!
+	cpye    [dst]!, [src]!, count!
+
+	mov	x0, #0				// Nothing to copy
+	ret
+SYM_FUNC_END(__memcpy_mc)
+#else
+SYM_FUNC_ALIAS(__memcpy_mc, __memcpy_mc_generic)
+#endif
+
+EXPORT_SYMBOL(__memcpy_mc)
+SYM_FUNC_ALIAS_WEAK(memcpy_mc, __memcpy_mc)
+EXPORT_SYMBOL(memcpy_mc)
diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index 88d1c9dcb507..a12770fb2e9c 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -79,6 +79,18 @@ void *memcpy(void *dest, const void *src, size_t len)
 }
 #endif
 
+#ifdef __HAVE_ARCH_MEMCPY_MC
+#undef memcpy_mc
+int memcpy_mc(void *dest, const void *src, size_t len)
+{
+	if (!kasan_check_range(src, len, false, _RET_IP_) ||
+	    !kasan_check_range(dest, len, true, _RET_IP_))
+		return (int)len;
+
+	return __memcpy_mc(dest, src, len);
+}
+#endif
+
 void *__asan_memset(void *addr, int c, ssize_t len)
 {
 	if (!kasan_check_range(addr, len, true, _RET_IP_))
-- 
2.25.1


