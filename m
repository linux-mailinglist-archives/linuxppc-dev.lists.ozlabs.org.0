Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBDE77CB61
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 12:58:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQ7YX50gTz3cVZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 20:58:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQ7Xz0Yv0z3brg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 20:58:24 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RQ7Xq5Q3zz9sgl;
	Tue, 15 Aug 2023 12:58:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 35I_1FWIg5xz; Tue, 15 Aug 2023 12:58:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RQ7Xq4YBhz9sgk;
	Tue, 15 Aug 2023 12:58:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 984238B76C;
	Tue, 15 Aug 2023 12:58:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 8HnwJpFcbP5f; Tue, 15 Aug 2023 12:58:19 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.223])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5400C8B763;
	Tue, 15 Aug 2023 12:58:19 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37FAwBrP077191
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Aug 2023 12:58:11 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37FAw9lQ077190;
	Tue, 15 Aug 2023 12:58:09 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc: Move zalloc_maybe_bootmem() into pci-common.c
Date: Tue, 15 Aug 2023 12:57:55 +0200
Message-ID: <4235adc9515a4b084f815cc12f24ef1ac2b43eba.1692097067.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692097074; l=3588; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=7P8PUpj4knPK7IjXYrS0Hvc31FR/JHVAdIARH2NQJQU=; b=xSL8aUcrGcbJXZE8h0NNjhr5UldtJ5uzYxIKloDP3CucTjaKVIG6VjsAZyvW533ssrmwuivai 3JIHfxS7617BmFnBWAf1xD88dfjiTsMIuM6Vb4QskmuBMoGNVTyD8IS
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

zalloc_maybe_bootmem() is only used by PCI related functions.

Move it into pci-common.c and remove the always built alloc.c

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/pci.h   |  2 ++
 arch/powerpc/include/asm/setup.h |  1 -
 arch/powerpc/kernel/pci-common.c | 16 ++++++++++++++++
 arch/powerpc/lib/Makefile        |  2 +-
 arch/powerpc/lib/alloc.c         | 23 -----------------------
 5 files changed, 19 insertions(+), 25 deletions(-)
 delete mode 100644 arch/powerpc/lib/alloc.c

diff --git a/arch/powerpc/include/asm/pci.h b/arch/powerpc/include/asm/pci.h
index f5078a7dd85a..13d36ec3a5ea 100644
--- a/arch/powerpc/include/asm/pci.h
+++ b/arch/powerpc/include/asm/pci.h
@@ -45,6 +45,8 @@ static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
 	return channel ? 15 : 14;
 }
 
+void *zalloc_maybe_bootmem(size_t size, gfp_t mask);
+
 #ifdef CONFIG_PCI
 void __init set_pci_dma_ops(const struct dma_map_ops *dma_ops);
 #else	/* CONFIG_PCI */
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
index e88d7c9feeec..34e66b06a030 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -31,6 +31,7 @@
 #include <linux/numa.h>
 #include <linux/msi.h>
 #include <linux/irqdomain.h>
+#include <linux/memblock.h>
 
 #include <asm/processor.h>
 #include <asm/io.h>
@@ -121,6 +122,21 @@ static int get_phb_number(struct device_node *dn)
 	return phb_id;
 }
 
+void * __ref zalloc_maybe_bootmem(size_t size, gfp_t mask)
+{
+	void *p;
+
+	if (slab_is_available()) {
+		p = kzalloc(size, mask);
+	} else {
+		p = memblock_alloc(size, SMP_CACHE_BYTES);
+		if (!p)
+			panic("%s: Failed to allocate %zu bytes\n", __func__,
+			      size);
+	}
+	return p;
+}
+
 struct pci_controller *pcibios_alloc_controller(struct device_node *dev)
 {
 	struct pci_controller *phb;
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
-- 
2.41.0

