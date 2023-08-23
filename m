Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A6078503F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 07:57:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=d8YeRdJu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVwV46J4Pz3dDn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 15:57:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=d8YeRdJu;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVwQg4DRvz3c6v
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 15:54:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692770075;
	bh=qc4npDRLua83+S72vXPTTrWKvwM/MUnKu2QDNqaq86k=;
	h=From:To:Cc:Subject:Date:From;
	b=d8YeRdJuR8Tg78wuPht/WPv9qnfnuowWjWPocdtSoin6lNOeO1vrEUQt8Zqwz5LI6
	 nBguOPZIGQTY+eCIR1flV2eWBzBO/qUH+QkD4z5AROv6YiGJJe2Rwtad1UAxe3Jv7L
	 QNN2e3oKRaGuZQ9ORBVZ0md1nRG2+5up4hDeo6yG4ukMdKPQliz4FWIPnh/HiAgAYk
	 3c6oWzFUmX8U0MqiTLhyA6ALPYMUgjjjSnc0ZCNMA3W6xE4OOHIA3YYR9t5+kNvod4
	 5p834viD1xORZ6nfVWg1TZgtESehNUc5Ehh7u6FDuEfYsPcoMbh+Mr7O26p1ZEfLjC
	 rUCVT0fCY/2oA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RVwQg2PWtz4x2D;
	Wed, 23 Aug 2023 15:54:35 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc: Drop zalloc_maybe_bootmem()
Date: Wed, 23 Aug 2023 15:54:30 +1000
Message-ID: <20230823055430.752550-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The only callers of zalloc_maybe_bootmem() are PCI setup routines. These
used to be called early during boot before slab setup, and also during
runtime due to hotplug.

But commit 5537fcb319d0 ("powerpc/pci: Add ppc_md.discover_phbs()")
moved the boot-time calls later, after slab setup, meaning there's no
longer any need for zalloc_maybe_bootmem(), kzalloc() can be used in all
cases.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/setup.h |  1 -
 arch/powerpc/kernel/pci-common.c |  2 +-
 arch/powerpc/lib/Makefile        |  2 +-
 arch/powerpc/lib/alloc.c         | 23 -----------------------
 arch/powerpc/sysdev/fsl_pci.c    |  2 +-
 5 files changed, 3 insertions(+), 27 deletions(-)
 delete mode 100644 arch/powerpc/lib/alloc.c

diff --git a/arch/powerpc/include/asm/setup.h b/arch/powerpc/include/asm/setup.h
index e29e83f8a89c..eed74c1fb832 100644
--- a/arch/powerpc/include/asm/setup.h
+++ b/arch/powerpc/include/asm/setup.h
@@ -8,7 +8,6 @@
 extern void ppc_printk_progress(char *s, unsigned short hex);
 
 extern unsigned long long memory_limit;
-extern void *zalloc_maybe_bootmem(size_t size, gfp_t mask);
 
 struct device_node;
 
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index e88d7c9feeec..040255ddb569 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -125,7 +125,7 @@ struct pci_controller *pcibios_alloc_controller(struct device_node *dev)
 {
 	struct pci_controller *phb;
 
-	phb = zalloc_maybe_bootmem(sizeof(struct pci_controller), GFP_KERNEL);
+	phb = kzalloc(sizeof(struct pci_controller), GFP_KERNEL);
 	if (phb == NULL)
 		return NULL;
 
diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 9aa8286c9687..51ad0397c17a 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -27,7 +27,7 @@ endif
 CFLAGS_code-patching.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
 CFLAGS_feature-fixups.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
 
-obj-y += alloc.o code-patching.o feature-fixups.o pmem.o
+obj-y += code-patching.o feature-fixups.o pmem.o
 
 obj-$(CONFIG_CODE_PATCHING_SELFTEST) += test-code-patching.o
 
diff --git a/arch/powerpc/lib/alloc.c b/arch/powerpc/lib/alloc.c
deleted file mode 100644
index ce180870bd52..000000000000
--- a/arch/powerpc/lib/alloc.c
+++ /dev/null
@@ -1,23 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <linux/types.h>
-#include <linux/init.h>
-#include <linux/slab.h>
-#include <linux/memblock.h>
-#include <linux/string.h>
-#include <asm/setup.h>
-
-
-void * __ref zalloc_maybe_bootmem(size_t size, gfp_t mask)
-{
-	void *p;
-
-	if (slab_is_available())
-		p = kzalloc(size, mask);
-	else {
-		p = memblock_alloc(size, SMP_CACHE_BYTES);
-		if (!p)
-			panic("%s: Failed to allocate %zu bytes\n", __func__,
-			      size);
-	}
-	return p;
-}
diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
index 5f7219df35ef..3868483fbe29 100644
--- a/arch/powerpc/sysdev/fsl_pci.c
+++ b/arch/powerpc/sysdev/fsl_pci.c
@@ -767,7 +767,7 @@ static int __init mpc83xx_pcie_setup(struct pci_controller *hose,
 	u32 cfg_bar;
 	int ret = -ENOMEM;
 
-	pcie = zalloc_maybe_bootmem(sizeof(*pcie), GFP_KERNEL);
+	pcie = kzalloc(sizeof(*pcie), GFP_KERNEL);
 	if (!pcie)
 		return ret;
 
-- 
2.41.0

