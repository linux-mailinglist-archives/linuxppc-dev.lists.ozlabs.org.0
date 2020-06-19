Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F1A201842
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 18:54:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pPzl0Hy1zDqkV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 02:54:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pMbR0ZpMzDrQP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jun 2020 01:06:58 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49pMbJ5SR2z9v09n;
 Fri, 19 Jun 2020 17:06:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id HWsNtuMNdH_C; Fri, 19 Jun 2020 17:06:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49pMbJ4gGDz9v09j;
 Fri, 19 Jun 2020 17:06:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A1ECC8B87B;
 Fri, 19 Jun 2020 17:06:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9KI_eDtvs7VY; Fri, 19 Jun 2020 17:06:54 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5E0178B879;
 Fri, 19 Jun 2020 17:06:54 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 2FD8265AF4; Fri, 19 Jun 2020 15:06:54 +0000 (UTC)
Message-Id: <c634cadd3ef2c9667838c4fe2bd425a72c8fcbd5.1592578278.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1592578278.git.christophe.leroy@csgroup.eu>
References: <cover.1592578278.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 3/8] powerpc: Set user/kernel boundary at TASK_SIZE instead
 of PAGE_OFFSET
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 19 Jun 2020 15:06:54 +0000 (UTC)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

User space stops at TASK_SIZE. At the moment, kernel space starts
at PAGE_OFFSET.

In order to use space between TASK_SIZE and PAGE_OFFSET for modules,
make TASK_SIZE the limit between user and kernel space.

Note that fault.c already considers TASK_SIZE as the boundary between
user and kernel space.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/page.h | 2 +-
 arch/powerpc/mm/ptdump/ptdump.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index a63fe6f3a0ff..352a2b80d505 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -256,7 +256,7 @@ static inline bool pfn_valid(unsigned long pfn)
 #ifdef CONFIG_PPC_BOOK3E_64
 #define is_kernel_addr(x)	((x) >= 0x8000000000000000ul)
 #else
-#define is_kernel_addr(x)	((x) >= PAGE_OFFSET)
+#define is_kernel_addr(x)	((x) >= TASK_SIZE)
 #endif
 
 #ifndef CONFIG_PPC_BOOK3S_64
diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index b71cc628facd..e995f2e9e9f7 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -351,7 +351,7 @@ static void populate_markers(void)
 {
 	int i = 0;
 
-	address_markers[i++].start_address = PAGE_OFFSET;
+	address_markers[i++].start_address = TASK_SIZE;
 	address_markers[i++].start_address = VMALLOC_START;
 	address_markers[i++].start_address = VMALLOC_END;
 #ifdef CONFIG_PPC64
@@ -388,7 +388,7 @@ static int ptdump_show(struct seq_file *m, void *v)
 	struct pg_state st = {
 		.seq = m,
 		.marker = address_markers,
-		.start_address = PAGE_OFFSET,
+		.start_address = TASK_SIZE,
 	};
 
 #ifdef CONFIG_PPC64
@@ -432,7 +432,7 @@ void ptdump_check_wx(void)
 		.seq = NULL,
 		.marker = address_markers,
 		.check_wx = true,
-		.start_address = PAGE_OFFSET,
+		.start_address = TASK_SIZE,
 	};
 
 #ifdef CONFIG_PPC64
-- 
2.25.0

