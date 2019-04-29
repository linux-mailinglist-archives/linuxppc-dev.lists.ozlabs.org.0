Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE51E11C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 13:14:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t29X5kVZzDqLp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 21:14:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="O4NJel58"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t1Tv5RvtzDqnl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 20:43:30 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44t1Tk400Qz9v0KG;
 Mon, 29 Apr 2019 12:43:22 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=O4NJel58; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Td_cqf03Uzwr; Mon, 29 Apr 2019 12:43:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44t1Tk2tj6z9v0KD;
 Mon, 29 Apr 2019 12:43:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556534602; bh=XTJjZ4TVnY1x///Bor5R2teAUVO+2rd/wh3miYep6Cs=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=O4NJel5808OZ8n5exWJa7all5REsymPVLh/lEevBjtuTGUECgE6Fz7Nu2gWv557Ej
 zegylnLJcLRlUyGWnGAvI6Teg6NvRJ4TrEiyEjqOhMFKabMx7Seo7NZg2rBHvM58nz
 G5TvrAbeKwDBeAEfbHA0yjRUJUf6zsW+pC6Dvg4U=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 35B1E8B8AE;
 Mon, 29 Apr 2019 12:43:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id irmvf8ecTSoR; Mon, 29 Apr 2019 12:43:27 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.231.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 194828B7FB;
 Mon, 29 Apr 2019 12:43:27 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1070366702; Mon, 29 Apr 2019 10:43:27 +0000 (UTC)
Message-Id: <14f88b27ff94f2d5a07a8cbc33ec75e2f8af9cf9.1556534520.git.christophe.leroy@c-s.fr>
In-Reply-To: <23167861f6095456b4ba3b52c55a514201ca738f.1556534520.git.christophe.leroy@c-s.fr>
References: <23167861f6095456b4ba3b52c55a514201ca738f.1556534520.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 2/3] powerpc/module32: Use symbolic instructions names.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 29 Apr 2019 10:43:27 +0000 (UTC)
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

To increase readability/maintainability, replace hard coded
instructions values by symbolic names.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/module_32.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/module_32.c b/arch/powerpc/kernel/module_32.c
index 88d83771f462..c5197f856c75 100644
--- a/arch/powerpc/kernel/module_32.c
+++ b/arch/powerpc/kernel/module_32.c
@@ -170,10 +170,14 @@ int module_frob_arch_sections(Elf32_Ehdr *hdr,
 	return 0;
 }
 
+	/* lis r12,sym@ha */
+#define ENTRY_JMP0(sym)	(PPC_INST_ADDIS | __PPC_RT(R12) | PPC_HA(sym))
+	/* addi r12,r12,sym@l */
+#define ENTRY_JMP1(sym)	(PPC_INST_ADDI | __PPC_RT(R12) | __PPC_RA(R12) | PPC_LO(sym))
+
 static inline int entry_matches(struct ppc_plt_entry *entry, Elf32_Addr val)
 {
-	if (entry->jump[0] == 0x3d800000 + ((val + 0x8000) >> 16)
-	    && entry->jump[1] == 0x398c0000 + (val & 0xffff))
+	if (entry->jump[0] == ENTRY_JMP0(val) && entry->jump[1] == ENTRY_JMP1(val))
 		return 1;
 	return 0;
 }
@@ -200,10 +204,10 @@ static uint32_t do_plt_call(void *location,
 		entry++;
 	}
 
-	entry->jump[0] = 0x3d800000+((val+0x8000)>>16); /* lis r12,sym@ha */
-	entry->jump[1] = 0x398c0000 + (val&0xffff);     /* addi r12,r12,sym@l*/
-	entry->jump[2] = 0x7d8903a6;                    /* mtctr r12 */
-	entry->jump[3] = 0x4e800420;			/* bctr */
+	entry->jump[0] = ENTRY_JMP0(val);
+	entry->jump[1] = ENTRY_JMP1(val);
+	entry->jump[2] = PPC_INST_MTCTR | __PPC_RS(R12);
+	entry->jump[3] = PPC_INST_BCTR;
 
 	pr_debug("Initialized plt for 0x%x at %p\n", val, entry);
 	return (uint32_t)entry;
-- 
2.13.3

