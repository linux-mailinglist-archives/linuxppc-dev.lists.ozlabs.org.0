Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3273E562B32
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 08:07:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZ4Ty3YFwz3dvp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 16:07:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZ4TV0rRjz3bls
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 16:06:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LZ4TM6kXdz9tHC;
	Fri,  1 Jul 2022 08:06:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ga5QVl0WHR5D; Fri,  1 Jul 2022 08:06:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LZ4TM61LDz9tH3;
	Fri,  1 Jul 2022 08:06:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BF99D8B798;
	Fri,  1 Jul 2022 08:06:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 1YYAc5wZu1tO; Fri,  1 Jul 2022 08:06:31 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9EE368B767;
	Fri,  1 Jul 2022 08:06:31 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 26166PYH3730571
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 1 Jul 2022 08:06:25 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 26166OLk3730568;
	Fri, 1 Jul 2022 08:06:24 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/32s: Fix boot failure with KASAN + SMP + JUMP_LABEL_FEATURE_CHECK_DEBUG
Date: Fri,  1 Jul 2022 08:06:15 +0200
Message-Id: <2ee707512b8b212b079b877f4ceb525a1606a3fb.1656655567.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1656655574; l=1860; s=20211009; h=from:subject:message-id; bh=n0vJXLO8U3JSz0xBTXCGMNhqXK9IYneG7gE0yKtcUFM=; b=UF7Mez85iyfD5bwvzrYIfp+uP5nLBuYObQvaOhKAz2zsPzXPzPZAP3IQcCcroJ4HHH6Hdd3ODnTF JysqebtVDjb5iZVefcIy0GqqFEMbOx8SgpeD7dCCPOZDCA6xPhlj
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit 4291d085b0b0 ("powerpc/32s: Make pte_update() non
atomic on 603 core"), pte_update() has been using
mmu_has_feature(MMU_FTR_HPTE_TABLE) to avoid a useless atomic
operation on 603 cores.

When kasan_early_init() sets up the early zero shadow, it uses
__set_pte_at(). On book3s/32, __set_pte_at() calls pte_update()
when CONFIG_SMP is selected in order to ensure the preservation of
_PAGE_HASHPTE in case of concurrent update of the PTE. But that's
too early for mmu_has_feature(), so when
CONFIG_JUMP_LABEL_FEATURE_CHECK_DEBUG is selected, mmu_has_feature()
calls printk(). That's too early to call printk() because KASAN
early zero shadow page is not set up yet. It leads to a deadlock.

However, when kasan_early_init() is called, there is only one CPU
running and no risk of concurrent PTE update. So __set_pte_at() can
be called with the 'percpu' flag. With that flag set, the PTE is
written directly instead of being written via pte_update().

Reported-by: Erhard Furtner <erhard_f@mailbox.org>
Fixes: 4291d085b0b0 ("powerpc/32s: Make pte_update() non atomic on 603 core")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/kasan/init_32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/kasan/init_32.c b/arch/powerpc/mm/kasan/init_32.c
index f3e4d069e0ba..a70828a6d935 100644
--- a/arch/powerpc/mm/kasan/init_32.c
+++ b/arch/powerpc/mm/kasan/init_32.c
@@ -25,7 +25,7 @@ static void __init kasan_populate_pte(pte_t *ptep, pgprot_t prot)
 	int i;
 
 	for (i = 0; i < PTRS_PER_PTE; i++, ptep++)
-		__set_pte_at(&init_mm, va, ptep, pfn_pte(PHYS_PFN(pa), prot), 0);
+		__set_pte_at(&init_mm, va, ptep, pfn_pte(PHYS_PFN(pa), prot), 1);
 }
 
 int __init kasan_init_shadow_page_tables(unsigned long k_start, unsigned long k_end)
-- 
2.36.1

