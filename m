Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E29B7C4AD8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 08:42:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S539n23WPz3wXs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 17:42:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S52qr5sK5z3vkp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 17:27:20 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4S52qk5Ql9z9v8R;
	Wed, 11 Oct 2023 08:27:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ORNncKpYHXHZ; Wed, 11 Oct 2023 08:27:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4S52qk4hHrz9v83;
	Wed, 11 Oct 2023 08:27:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D7738B76C;
	Wed, 11 Oct 2023 08:27:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id giHIOhD3Tu93; Wed, 11 Oct 2023 08:27:14 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 74C958B764;
	Wed, 11 Oct 2023 08:27:14 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 39B6RDx8534969
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 08:27:13 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 39B6RCAP534965;
	Wed, 11 Oct 2023 08:27:12 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc: Remove cpm_dp...() macros
Date: Wed, 11 Oct 2023 08:27:03 +0200
Message-ID: <3aaa40bf706afeab8fe9a74b8437704a4269a6a2.1697005615.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1697005622; l=2661; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=yCO4UmIxtNPBDL6E0JoDseZ7f6g6qatCxE2FsOihxP8=; b=aqzOxYUjq+urtoMQQIXAvhNSEXAGfXqBH+GwpUIs5E9pk6zgxjuLg9/bJWkXy2QwH567oQSTE AxA9R4pMjTSAbiUBIMJo3RTA3PVfnYtur7Bk1GghGrFjdLyAyTMAw6c
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

Since commit d3c511ac1d72 ("powerpc/cpm: Remove
!CONFIG_PPC_CPM_NEW_BINDING code") cpm_dp...() macros have no added
value anymore.

Last user of those macros were fixed by commit 5e6cb39a256d ("net:
fs_enet: Use cpm_muram_xxx() functions instead of cpm_dpxxx() macros")

Remove them.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/cpm1.h | 5 -----
 arch/powerpc/include/asm/cpm2.h | 4 ----
 drivers/soc/fsl/qe/qe_common.c  | 4 ++--
 3 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/cpm1.h b/arch/powerpc/include/asm/cpm1.h
index 3bdd74739cb8..e3c6969853ef 100644
--- a/arch/powerpc/include/asm/cpm1.h
+++ b/arch/powerpc/include/asm/cpm1.h
@@ -49,11 +49,6 @@
  */
 extern cpm8xx_t __iomem *cpmp; /* Pointer to comm processor */
 
-#define cpm_dpalloc cpm_muram_alloc
-#define cpm_dpfree cpm_muram_free
-#define cpm_dpram_addr cpm_muram_addr
-#define cpm_dpram_phys cpm_muram_dma
-
 extern void cpm_setbrg(uint brg, uint rate);
 
 extern void __init cpm_load_patch(cpm8xx_t *cp);
diff --git a/arch/powerpc/include/asm/cpm2.h b/arch/powerpc/include/asm/cpm2.h
index 249d43cc6427..a22acc36eb9b 100644
--- a/arch/powerpc/include/asm/cpm2.h
+++ b/arch/powerpc/include/asm/cpm2.h
@@ -87,10 +87,6 @@
  */
 extern cpm_cpm2_t __iomem *cpmp; /* Pointer to comm processor */
 
-#define cpm_dpalloc cpm_muram_alloc
-#define cpm_dpfree cpm_muram_free
-#define cpm_dpram_addr cpm_muram_addr
-
 extern void cpm2_reset(void);
 
 /* Baud rate generators.
diff --git a/drivers/soc/fsl/qe/qe_common.c b/drivers/soc/fsl/qe/qe_common.c
index 9729ce86db59..a877347d37d3 100644
--- a/drivers/soc/fsl/qe/qe_common.c
+++ b/drivers/soc/fsl/qe/qe_common.c
@@ -141,7 +141,7 @@ static s32 cpm_muram_alloc_common(unsigned long size,
  *
  * This function returns a non-negative offset into the muram area, or
  * a negative errno on failure.
- * Use cpm_dpram_addr() to get the virtual address of the area.
+ * Use cpm_muram_addr() to get the virtual address of the area.
  * Use cpm_muram_free() to free the allocation.
  */
 s32 cpm_muram_alloc(unsigned long size, unsigned long align)
@@ -193,7 +193,7 @@ EXPORT_SYMBOL(cpm_muram_free);
  * @size: number of bytes to allocate
  * This function returns @offset if the area was available, a negative
  * errno otherwise.
- * Use cpm_dpram_addr() to get the virtual address of the area.
+ * Use cpm_muram_addr() to get the virtual address of the area.
  * Use cpm_muram_free() to free the allocation.
  */
 s32 cpm_muram_alloc_fixed(unsigned long offset, unsigned long size)
-- 
2.41.0

