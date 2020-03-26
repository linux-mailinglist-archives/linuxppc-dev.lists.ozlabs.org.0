Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 684C81941CB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 15:44:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p77411Z0zDqyq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 01:44:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=mJgIki0K; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p74G41hKzDqcj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 01:42:20 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48p7466SP9z9vBmt;
 Thu, 26 Mar 2020 15:42:14 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=mJgIki0K; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id cr9aaoSfj6m6; Thu, 26 Mar 2020 15:42:14 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48p746529Yz9vBmr;
 Thu, 26 Mar 2020 15:42:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585233734; bh=pxlhHd5KJjHJbZKhUrrTB5maIqr0JBMbVZgBuq9rqY8=;
 h=From:Subject:To:Cc:Date:From;
 b=mJgIki0KIobQpvxL4shrRvaUsX2PrpAHFRxhXSImCNW6EPhlmMgYw1kvv98dBNn/m
 mrTOYJdkt/CnIa9OY1UVWKIU6x6ziFptgzZP5knwnD+oNQ5VJMcecfCHfAMF504wul
 /YdBUHanRuX6qYBkn+TcQRd764WnxcRcIQ/We3HA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E4318B7AD;
 Thu, 26 Mar 2020 15:42:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zamguf2qSdgK; Thu, 26 Mar 2020 15:42:16 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ED95F8B756;
 Thu, 26 Mar 2020 15:42:15 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B152C655EB; Thu, 26 Mar 2020 14:42:15 +0000 (UTC)
Message-Id: <c88b13ede49744d81fdab32e037a7ae10f0b241f.1585233657.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH] powerpc/lib: Fixing use a temporary mm for code patching
To: cmr@informatik.wtf
Date: Thu, 26 Mar 2020 14:42:15 +0000 (UTC)
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

This patch fixes the RFC series identified below.
It fixes three points:
- Failure with CONFIG_PPC_KUAP
- Failure to write do to lack of DIRTY bit set on the 8xx
- Inadequaly complex WARN post verification

However, it has an impact on the CPU load. Here is the time
needed on an 8xx to run the ftrace selftests without and
with this series:
- Without CONFIG_STRICT_KERNEL_RWX		==> 38 seconds
- With CONFIG_STRICT_KERNEL_RWX			==> 40 seconds
- With CONFIG_STRICT_KERNEL_RWX + this series	==> 43 seconds

Link: https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=166003
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/lib/code-patching.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index f156132e8975..4ccff427592e 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -97,6 +97,7 @@ static int map_patch(const void *addr, struct patch_mapping *patch_mapping)
 	}
 
 	pte = mk_pte(page, pgprot);
+	pte = pte_mkdirty(pte);
 	set_pte_at(patching_mm, patching_addr, ptep, pte);
 
 	init_temp_mm(&patch_mapping->temp_mm, patching_mm);
@@ -168,7 +169,9 @@ static int do_patch_instruction(unsigned int *addr, unsigned int instr)
 			(offset_in_page((unsigned long)addr) /
 				sizeof(unsigned int));
 
+	allow_write_to_user(patch_addr, sizeof(instr));
 	__patch_instruction(addr, instr, patch_addr);
+	prevent_write_to_user(patch_addr, sizeof(instr));
 
 	err = unmap_patch(&patch_mapping);
 	if (err)
@@ -179,7 +182,7 @@ static int do_patch_instruction(unsigned int *addr, unsigned int instr)
 	 * think we just wrote.
 	 * XXX: BUG_ON() instead?
 	 */
-	WARN_ON(memcmp(addr, &instr, sizeof(instr)));
+	WARN_ON(*addr != instr);
 
 out:
 	local_irq_restore(flags);
-- 
2.25.0

