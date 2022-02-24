Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F5C4C2691
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 09:47:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K463934nPz3cQs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 19:47:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SjFjmxdT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f31;
 helo=mail-qv1-xf31.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=SjFjmxdT; dkim-atps=neutral
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K462S6Np1z2xs2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 19:46:23 +1100 (AEDT)
Received: by mail-qv1-xf31.google.com with SMTP id fc19so2442280qvb.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 00:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AMgrL5D+KiWCdMkA04nMLIuWEJUWtCL6OB6a/lKLlsk=;
 b=SjFjmxdTyjyqAf6RJdg2tHuijlejReBRn7QF/+aSua+sO0zKJmTVFZalZ5mNA7GH45
 zAzL2UJVlM7mLSOdJY/JvKpVQQg08AJJb8ESyHKkdGohUbDmqeTDDkxWEvl5zvCQwaM8
 JSWpnxydgv5Z7IU1+gUj8UOqHVzTt/CW9+jqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AMgrL5D+KiWCdMkA04nMLIuWEJUWtCL6OB6a/lKLlsk=;
 b=QPZ9yA9/3VsYka2r+f0uwmnGV/AP/pCogawRgpNVYSehAFdnvw/Q4LX9c6AoF2XCBo
 k2Dm/XRwMoqTMgLcg+9K8an7OrCIJ48gQ8j7E5VfYPunF+Tsd/4oTffTLCPJUBvZLZxQ
 sXfSDnFB346udgqhWzNjBFVUoW+uCNjjYQMdvFLfGu6uRYcqt8meNHIUPeQGTRPtbIr5
 kE2y+sfMe2zeoef1WDxygI8w265xZjIuepA8tUalf4ARkuhYEnFyo0kjCVNcloMpsxNc
 acP1oppLBD3vgE0ciHGPgS5ts2COfKEIpIh1CTVTaLj7OjIDdviMEHbflDzAM2LGzIh7
 3cXQ==
X-Gm-Message-State: AOAM531nHP42g6gp2pdCvmNsnmFIfVkAfm3+mURKGdfvcb+h5WNTXDdQ
 cDYU6+HyJhWqvCAQvV75hwAZwUGTLUwXNw==
X-Google-Smtp-Source: ABdhPJx6Ld80nbuarBWp5o8KCI/l5Z53qcY+ZlRGc5SLMbxpdXxgGnAwn1akrhgVmyLqoIoTxwHGMQ==
X-Received: by 2002:a17:902:7584:b0:14d:77f4:5598 with SMTP id
 j4-20020a170902758400b0014d77f45598mr1246271pll.1.1645682626444; 
 Wed, 23 Feb 2022 22:03:46 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id bd14sm1470026pfb.165.2022.02.23.22.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 22:03:46 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v2] usercopy: Check valid lifetime via stack depth
Date: Wed, 23 Feb 2022 22:03:42 -0800
Message-Id: <20220224060342.1855457-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6569; h=from:subject;
 bh=6A8mc/rhTTVnxVpbzT3BARo6XcOUZdfrInmbku4Dc4o=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBiFx+9k7mkyBUeqAXKhGpQLGTRH+td6u68zTq4WYHQ
 Ql54f0WJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYhcfvQAKCRCJcvTf3G3AJhN/D/
 9rptmz9DAb1CkNTCvTXLH+yoTu25eGKdcejSEGfbH5sbzbSrepTMvgMAUaEo4Jo/8UTRQFJq8ad1YJ
 29LV70+iJUbjlZwZRali/FQGcNsi5QC8Zfmpo1PH0op8PjQpclPbqzAeu0mrFA7OAYxDIooE6VQhil
 ZYhpww9k4rhnFCjwLM8s18FkbClCrc8umT9LUrxaCfea7w0WgYWVblrECc3mmdMHQ+ku7+tWcMmdbP
 kD6bShQmH7d6VurCRzR12joIN8MsNFw9HDiNJK91hJraUq7pBe51ddL2EQTxQ8wvcYBmn6V6w4VApv
 Za49GBST9yohx35QqEQQLqXtEbGT+WCHCvYxVmLpzigEdVBayvJciN3jxRQg4qPH5NzrCvZvQbn5gk
 wpbEWxzvCzaOGydlCDaF0K4hqXnStUt4SsEbRrmBRxTCH75dA4ejbXIS31hbNZAzSLOVo/ZbRtRwMK
 iwuOvLFBROdqpN+7NmFczrgvSRHsOS1l7WoMoUFoMD5r36J62d70Qz/TO2UHlKVjf2oxihTqWDDv76
 APOsRc8JzJkKRhEimqn1BgOBh5CYaw0znuEi0E5IGKjVMVnDdCLY3Z+JhJeTJMX31ISHuvaFyRy9Kb
 3VPTEzhwG/E3CcVAroWSz5SVRCR4XakTnGsk72PgX5rBKm8Tqny1HU15ZD1Q==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: linux-s390@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-mm@kvack.org,
 linux-hardening@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Under CONFIG_HARDENED_USERCOPY=y, when exact stack frame boundary checking
is not available (i.e. everything except x86 with FRAME_POINTER), check
a stack object as being at least "current depth valid", in the sense
that any object within the stack region but not between start-of-stack
and current_stack_pointer should be considered unavailable (i.e. its
lifetime is from a call no longer present on the stack).

Introduce ARCH_HAS_CURRENT_STACK_POINTER to track which architectures
have actually implemented the common global register alias.

Additionally report usercopy bounds checking failures with an offset
from current_stack_pointer, which may assist with diagnosing failures.

The LKDTM USERCOPY_STACK_FRAME_TO and USERCOPY_STACK_FRAME_FROM tests
(once slightly adjusted in a separate patch) will pass again with
this fixed.

Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Reported-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
v1: https://lore.kernel.org/all/20220216201449.2087956-1-keescook@chromium.org/
v2: adjust for only some archs having current_stack_pointer
---
 arch/arm/Kconfig     |  1 +
 arch/arm64/Kconfig   |  1 +
 arch/powerpc/Kconfig |  1 +
 arch/s390/Kconfig    |  1 +
 arch/sh/Kconfig      |  1 +
 arch/x86/Kconfig     |  1 +
 mm/usercopy.c        | 41 ++++++++++++++++++++++++++++++++++++++---
 7 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 4c97cb40eebb..a7a09eef1852 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -5,6 +5,7 @@ config ARM
 	select ARCH_32BIT_OFF_T
 	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE if HAVE_KRETPROBES && FRAME_POINTER && !ARM_UNWIND
 	select ARCH_HAS_BINFMT_FLAT
+	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
 	select ARCH_HAS_DMA_WRITE_COMBINE if !ARM_DMA_MEM_BUFFERABLE
 	select ARCH_HAS_ELF_RANDOMIZE
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index f2b5a4abef21..b8ab790555c8 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -18,6 +18,7 @@ config ARM64
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_CACHE_LINE_SIZE
+	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DMA_PREP_COHERENT
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b779603978e1..7e7387bd7d53 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -108,6 +108,7 @@ config PPC
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_HAS_COPY_MC			if PPC64
+	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_WX		if STRICT_KERNEL_RWX
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index be9f39fd06df..4845ab549dd1 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -60,6 +60,7 @@ config S390
 	select ARCH_ENABLE_MEMORY_HOTPLUG if SPARSEMEM
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
+	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 2474a04ceac4..1c2b53bf3093 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -7,6 +7,7 @@ config SUPERH
 	select ARCH_HAVE_CUSTOM_GPIO_H
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG if (GUSA_RB || CPU_SH4A)
 	select ARCH_HAS_BINFMT_FLAT if !MMU
+	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_GIGANTIC_PAGE
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_PTE_SPECIAL
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 9f5bd41bf660..90494fba3620 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -69,6 +69,7 @@ config X86
 	select ARCH_ENABLE_THP_MIGRATION if X86_64 && TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
 	select ARCH_HAS_CACHE_LINE_SIZE
+	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE	if !X86_PAE
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
diff --git a/mm/usercopy.c b/mm/usercopy.c
index d0d268135d96..5d28725af95f 100644
--- a/mm/usercopy.c
+++ b/mm/usercopy.c
@@ -22,6 +22,30 @@
 #include <asm/sections.h>
 #include "slab.h"
 
+/*
+ * Only called if obj is within stack/stackend bounds. Determine if within
+ * current stack depth.
+ */
+static inline int check_stack_object_depth(const void *obj,
+					   unsigned long len)
+{
+#ifdef CONFIG_ARCH_HAS_CURRENT_STACK_POINTER
+#ifndef CONFIG_STACK_GROWSUP
+	const void * const high = stackend;
+	const void * const low = (void *)current_stack_pointer;
+#else
+	const void * const high = (void *)current_stack_pointer;
+	const void * const low = stack;
+#endif
+
+	/* Reject: object not within current stack depth. */
+	if (obj < low || high < obj + len)
+		return BAD_STACK;
+
+#endif
+	return GOOD_STACK;
+}
+
 /*
  * Checks if a given pointer and length is contained by the current
  * stack frame (if possible).
@@ -29,7 +53,7 @@
  * Returns:
  *	NOT_STACK: not at all on the stack
  *	GOOD_FRAME: fully within a valid stack frame
- *	GOOD_STACK: fully on the stack (when can't do frame-checking)
+ *	GOOD_STACK: within the current stack (when can't frame-check exactly)
  *	BAD_STACK: error condition (invalid stack position or bad stack frame)
  */
 static noinline int check_stack_object(const void *obj, unsigned long len)
@@ -55,7 +79,8 @@ static noinline int check_stack_object(const void *obj, unsigned long len)
 	if (ret)
 		return ret;
 
-	return GOOD_STACK;
+	/* Finally, check stack depth if possible. */
+	return check_stack_object_depth(obj, len);
 }
 
 /*
@@ -280,7 +305,17 @@ void __check_object_size(const void *ptr, unsigned long n, bool to_user)
 		 */
 		return;
 	default:
-		usercopy_abort("process stack", NULL, to_user, 0, n);
+		usercopy_abort("process stack", NULL, to_user,
+#ifdef CONFIG_ARCH_HAS_CURRENT_STACK_POINTER
+# ifndef CONFIG_STACK_GROWSUP
+				(void *)current_stack_pointer - ptr,
+# else
+				ptr - (void *)current_stack_pointer,
+# endif
+#else
+				0,
+#endif
+				n);
 	}
 
 	/* Check for bad heap object. */
-- 
2.30.2

