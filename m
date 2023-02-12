Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9176693692
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Feb 2023 09:49:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PF1Nf5N7Bz3c8V
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Feb 2023 19:49:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JUVV+chR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JUVV+chR;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PF1Kn0svdz3bgs
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Feb 2023 19:46:37 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 65B4560C7F;
	Sun, 12 Feb 2023 08:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DDE1C433D2;
	Sun, 12 Feb 2023 08:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676191595;
	bh=fNKiSkZ0o+fOQDkH9eY0UIJa/qeemlNg5a9Sbw7z4oc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JUVV+chRkL08PzBAHoMlpmcJa2IhpSQwAz96rwplIsxNTcOagjdz1FjKgKIZm9Xz7
	 4pv6hHt7b9nmaV+hF833gn5hNvsDucwwTXlMhpuMzThGhvVuFGMqBA2B5yRqwzl9KX
	 2Wc43Xj/4Yfdsa0SIH7Q5qUXhOFTLhOk1YBgVMXYGMKSEd71o/EYsAImLe9oH0tXo8
	 IToPWVX6nfL1eBM61cT0MPNI30pgAm15llCo3a4+ZAa7MfdSDZzLkYkYfIFt92bOZ2
	 SPXfPRn2/UPxDP60AHCYuVhKHfGgEbsnHoBn/wXC8LSi6TGrRpBsT6yHBMhlRtOwBk
	 OSNHjjVZwDwtw==
From: Mike Rapoport <rppt@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/2] char/agp: introduce asm-generic/agp.h
Date: Sun, 12 Feb 2023 10:46:11 +0200
Message-Id: <20230212084611.1311177-3-rppt@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230212084611.1311177-1-rppt@kernel.org>
References: <20230212084611.1311177-1-rppt@kernel.org>
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, David Airlie <airlied@redhat.com>, Matt Turner <mattst88@gmail.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, "Mike Rapoport \(IBM\)" <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

There are several architectures that duplicate definitions of
map_page_into_agp(), unmap_page_from_agp() and flush_agp_cache().

Define those in asm-generic/agp.h and use it instead of duplicated
per-architecture headers.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/alpha/include/asm/Kbuild                 |  1 +
 arch/alpha/include/asm/agp.h                  | 13 ------------
 arch/ia64/include/asm/Kbuild                  |  1 +
 arch/ia64/include/asm/agp.h                   | 21 -------------------
 arch/parisc/include/asm/Kbuild                |  1 +
 arch/parisc/include/asm/agp.h                 | 15 -------------
 arch/powerpc/include/asm/Kbuild               |  1 +
 arch/sparc/include/asm/Kbuild                 |  1 +
 arch/sparc/include/asm/agp.h                  | 11 ----------
 .../include/asm => include/asm-generic}/agp.h |  8 +++----
 10 files changed, 8 insertions(+), 65 deletions(-)
 delete mode 100644 arch/alpha/include/asm/agp.h
 delete mode 100644 arch/ia64/include/asm/agp.h
 delete mode 100644 arch/parisc/include/asm/agp.h
 delete mode 100644 arch/sparc/include/asm/agp.h
 rename {arch/powerpc/include/asm => include/asm-generic}/agp.h (59%)

diff --git a/arch/alpha/include/asm/Kbuild b/arch/alpha/include/asm/Kbuild
index 42911c8340c7..54f5126628c6 100644
--- a/arch/alpha/include/asm/Kbuild
+++ b/arch/alpha/include/asm/Kbuild
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 generated-y += syscall_table.h
+generic-y += agp.h
 generic-y += export.h
 generic-y += kvm_para.h
 generic-y += mcs_spinlock.h
diff --git a/arch/alpha/include/asm/agp.h b/arch/alpha/include/asm/agp.h
deleted file mode 100644
index 4197b3bc78ee..000000000000
--- a/arch/alpha/include/asm/agp.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef AGP_H
-#define AGP_H 1
-
-#include <asm/io.h>
-
-/* dummy for now */
-
-#define map_page_into_agp(page)		do { } while (0)
-#define unmap_page_from_agp(page)	do { } while (0)
-#define flush_agp_cache() mb()
-
-#endif
diff --git a/arch/ia64/include/asm/Kbuild b/arch/ia64/include/asm/Kbuild
index f994c1daf9d4..aefae2efde9f 100644
--- a/arch/ia64/include/asm/Kbuild
+++ b/arch/ia64/include/asm/Kbuild
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 generated-y += syscall_table.h
+generic-y += agp.h
 generic-y += kvm_para.h
 generic-y += mcs_spinlock.h
 generic-y += vtime.h
diff --git a/arch/ia64/include/asm/agp.h b/arch/ia64/include/asm/agp.h
deleted file mode 100644
index f42c7dcb3d79..000000000000
--- a/arch/ia64/include/asm/agp.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_IA64_AGP_H
-#define _ASM_IA64_AGP_H
-
-/*
- * IA-64 specific AGP definitions.
- *
- * Copyright (C) 2002-2003 Hewlett-Packard Co
- *	David Mosberger-Tang <davidm@hpl.hp.com>
- */
-
-/*
- * To avoid memory-attribute aliasing issues, we require that the AGPGART engine operate
- * in coherent mode, which lets us map the AGP memory as normal (write-back) memory
- * (unlike x86, where it gets mapped "write-coalescing").
- */
-#define map_page_into_agp(page)		do { } while (0)
-#define unmap_page_from_agp(page)	do { } while (0)
-#define flush_agp_cache()		mb()
-
-#endif /* _ASM_IA64_AGP_H */
diff --git a/arch/parisc/include/asm/Kbuild b/arch/parisc/include/asm/Kbuild
index e6e7f74c8ac9..4fb596d94c89 100644
--- a/arch/parisc/include/asm/Kbuild
+++ b/arch/parisc/include/asm/Kbuild
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 generated-y += syscall_table_32.h
 generated-y += syscall_table_64.h
+generic-y += agp.h
 generic-y += kvm_para.h
 generic-y += mcs_spinlock.h
 generic-y += user.h
diff --git a/arch/parisc/include/asm/agp.h b/arch/parisc/include/asm/agp.h
deleted file mode 100644
index d193a48490e2..000000000000
--- a/arch/parisc/include/asm/agp.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_PARISC_AGP_H
-#define _ASM_PARISC_AGP_H
-
-/*
- * PARISC specific AGP definitions.
- * Copyright (c) 2006 Kyle McMartin <kyle@parisc-linux.org>
- *
- */
-
-#define map_page_into_agp(page)		do { } while (0)
-#define unmap_page_from_agp(page)	do { } while (0)
-#define flush_agp_cache()		mb()
-
-#endif /* _ASM_PARISC_AGP_H */
diff --git a/arch/powerpc/include/asm/Kbuild b/arch/powerpc/include/asm/Kbuild
index bcf95ce0964f..419319c4963c 100644
--- a/arch/powerpc/include/asm/Kbuild
+++ b/arch/powerpc/include/asm/Kbuild
@@ -2,6 +2,7 @@
 generated-y += syscall_table_32.h
 generated-y += syscall_table_64.h
 generated-y += syscall_table_spu.h
+generic-y += agp.h
 generic-y += export.h
 generic-y += kvm_types.h
 generic-y += mcs_spinlock.h
diff --git a/arch/sparc/include/asm/Kbuild b/arch/sparc/include/asm/Kbuild
index 0b9d98ced34a..595ca0be286b 100644
--- a/arch/sparc/include/asm/Kbuild
+++ b/arch/sparc/include/asm/Kbuild
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 generated-y += syscall_table_32.h
 generated-y += syscall_table_64.h
+generic-y += agp.h
 generic-y += export.h
 generic-y += kvm_para.h
 generic-y += mcs_spinlock.h
diff --git a/arch/sparc/include/asm/agp.h b/arch/sparc/include/asm/agp.h
deleted file mode 100644
index 5186924fa673..000000000000
--- a/arch/sparc/include/asm/agp.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef AGP_H
-#define AGP_H 1
-
-/* dummy for now */
-
-#define map_page_into_agp(page)		do { } while (0)
-#define unmap_page_from_agp(page)	do { } while (0)
-#define flush_agp_cache()		mb()
-
-#endif
diff --git a/arch/powerpc/include/asm/agp.h b/include/asm-generic/agp.h
similarity index 59%
rename from arch/powerpc/include/asm/agp.h
rename to include/asm-generic/agp.h
index e86f2ce476c9..10db92ede168 100644
--- a/arch/powerpc/include/asm/agp.h
+++ b/include/asm-generic/agp.h
@@ -1,7 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_POWERPC_AGP_H
-#define _ASM_POWERPC_AGP_H
-#ifdef __KERNEL__
+#ifndef _ASM_GENERIC_AGP_H
+#define _ASM_GENERIC_AGP_H
 
 #include <asm/io.h>
 
@@ -9,5 +8,4 @@
 #define unmap_page_from_agp(page) do {} while (0)
 #define flush_agp_cache() mb()
 
-#endif /* __KERNEL__ */
-#endif	/* _ASM_POWERPC_AGP_H */
+#endif	/* _ASM_GENERIC_AGP_H */
-- 
2.35.1

