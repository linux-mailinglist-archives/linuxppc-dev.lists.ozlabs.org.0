Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB247ADF24
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 20:39:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvWrS0tSJz3djs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 04:39:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvWh42cmfz3dDM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 04:32:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RvWgG0X5Kz9v96;
	Mon, 25 Sep 2023 20:31:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wCcg7OJWBk2P; Mon, 25 Sep 2023 20:31:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RvWg121Bzz9v9K;
	Mon, 25 Sep 2023 20:31:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 401A28B78D;
	Mon, 25 Sep 2023 20:31:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id U6_-eeiQqF7o; Mon, 25 Sep 2023 20:31:41 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.137])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D9748B7A0;
	Mon, 25 Sep 2023 20:31:40 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 38PIVZRE1499215
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 20:31:35 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 38PIVZn21499214;
	Mon, 25 Sep 2023 20:31:35 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 21/37] powerpc: Implement and use pgprot_nx()
Date: Mon, 25 Sep 2023 20:31:35 +0200
Message-ID: <5993a7a097e989af1c97fc4a6c011fefc67dbe6e.1695659959.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695659959.git.christophe.leroy@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695666675; l=1951; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Myjr2uo2qQ8RVR2JXltovj8e4N8IQOT9rjimV169OuU=; b=1ca0ns+jGZ/voOX8ueH1WtHlBUTvfwxGkXBRNHvT4MX6HTEMmfTrdVFe3OUj3a4rzMefbwwLj evM3kk1kr5LAwYi9yMOR3jn/9aNjqaogQrfOs/N1ZYTzLAb+TU64rNZ
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

ioremap_page_range() calls pgprot_nx() vmap() and vmap_pfn()
clear execute permission by calling pgprot_nx().

When pgprot_nx() is not defined it falls back to a nop.

Implement it for powerpc then use it in early_ioremap_range().

Then the call to pte_exprotect() can be removed from ioremap_prot().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/pgtable.h | 6 ++++++
 arch/powerpc/mm/ioremap.c          | 5 ++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 966e7c5119f6..2bfb7dd3b49e 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -71,6 +71,12 @@ static inline pgprot_t pte_pgprot(pte_t pte)
 	return __pgprot(pte_flags);
 }
 
+static inline pgprot_t pgprot_nx(pgprot_t prot)
+{
+	return pte_pgprot(pte_exprotect(__pte(pgprot_val(prot))));
+}
+#define pgprot_nx pgprot_nx
+
 #ifndef pmd_page_vaddr
 static inline const void *pmd_page_vaddr(pmd_t pmd)
 {
diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
index 705e8e8ffde4..d5159f205380 100644
--- a/arch/powerpc/mm/ioremap.c
+++ b/arch/powerpc/mm/ioremap.c
@@ -50,8 +50,7 @@ void __iomem *ioremap_prot(phys_addr_t addr, size_t size, unsigned long flags)
 	if (pte_write(pte))
 		pte = pte_mkdirty(pte);
 
-	/* we don't want to let _PAGE_USER and _PAGE_EXEC leak out */
-	pte = pte_exprotect(pte);
+	/* we don't want to let _PAGE_USER leak out */
 	pte = pte_mkprivileged(pte);
 
 	if (iowa_is_active())
@@ -66,7 +65,7 @@ int early_ioremap_range(unsigned long ea, phys_addr_t pa,
 	unsigned long i;
 
 	for (i = 0; i < size; i += PAGE_SIZE) {
-		int err = map_kernel_page(ea + i, pa + i, prot);
+		int err = map_kernel_page(ea + i, pa + i, pgprot_nx(prot));
 
 		if (WARN_ON_ONCE(err))  /* Should clean up */
 			return err;
-- 
2.41.0

