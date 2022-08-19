Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFF7599D6A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 16:24:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8PCT70Pyz3dyP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 00:24:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8PC506Ldz3cMq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 00:24:12 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4M8PBv6Glkz9shj;
	Fri, 19 Aug 2022 16:24:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ChCBnivmaNgi; Fri, 19 Aug 2022 16:24:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4M8PBv5P0wz9shX;
	Fri, 19 Aug 2022 16:24:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A75B48B77C;
	Fri, 19 Aug 2022 16:24:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id w2O8PlFKf6bu; Fri, 19 Aug 2022 16:24:07 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.4.22])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 703118B763;
	Fri, 19 Aug 2022 16:24:07 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 27JENsXx2215266
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 16:23:54 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 27JENqoV2215261;
	Fri, 19 Aug 2022 16:23:52 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc: Remove stale declarations in mmu_decl.h
Date: Fri, 19 Aug 2022 16:23:43 +0200
Message-Id: <a821e8397dd56b8177ecc04966d3b3a7c4bda6d4.1660919016.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1660919021; l=1797; s=20211009; h=from:subject:message-id; bh=ag94Vf3Rakr/RdZ8kJ3Gqco/qFeLKkcm0jj7TlBwhgw=; b=fjdYcgWvTLMismOARo/EcN529KzFHN+iYs9G6CEfVCDkxC2P04zrgQG53TcPY+PjRcn5L7+v6Qd6 j5ukViuQAoHjgZuthJOwG0wHnCd3jz/3KGx3uuLY+p/z6QYVIry3
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

rtas_size and rtas_data are not used anymore since at least
commit 7c8c6b9776fb ("powerpc: Merge lmb.c and make MM initialization
use it.")

Remove them.

Since commit 4b74a35fc7e9 ("powerpc/32s: Make Hash var static")
the forward declaration of struct hash_pte is unneeded.

Remove it.

__initial_memory_limit_addr was removed by commit e63075a3c937 ("memblock:
Introduce default allocation limit and use it to replace explicit ones")

Remove the declaration.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/setup.h | 1 -
 arch/powerpc/mm/mmu_decl.h       | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/arch/powerpc/include/asm/setup.h b/arch/powerpc/include/asm/setup.h
index d8c28902cf59..dd461b2c825c 100644
--- a/arch/powerpc/include/asm/setup.h
+++ b/arch/powerpc/include/asm/setup.h
@@ -7,7 +7,6 @@
 #ifndef __ASSEMBLY__
 extern void ppc_printk_progress(char *s, unsigned short hex);
 
-extern unsigned int rtas_data;
 extern unsigned long long memory_limit;
 extern void *zalloc_maybe_bootmem(size_t size, gfp_t mask);
 
diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index 229c72e49198..8f5afad1b6af 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -92,15 +92,11 @@ extern void mapin_ram(void);
 extern void setbat(int index, unsigned long virt, phys_addr_t phys,
 		   unsigned int size, pgprot_t prot);
 
-extern unsigned int rtas_data, rtas_size;
-
-struct hash_pte;
 extern u8 early_hash[];
 
 #endif /* CONFIG_PPC32 */
 
 extern unsigned long __max_low_memory;
-extern phys_addr_t __initial_memory_limit_addr;
 extern phys_addr_t total_memory;
 extern phys_addr_t total_lowmem;
 extern phys_addr_t memstart_addr;
-- 
2.37.1

