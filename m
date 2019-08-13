Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF168C211
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 22:24:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467PMp1MN0zDqcj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 06:24:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="N8DH5uKB"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467P4b1g0WzDqGv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 06:11:43 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 467P4Q2Cbcz9v05m;
 Tue, 13 Aug 2019 22:11:34 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=N8DH5uKB; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id DA5yvn1_sNFL; Tue, 13 Aug 2019 22:11:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 467P4Q177nz9v05l;
 Tue, 13 Aug 2019 22:11:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565727094; bh=8VOS6jgi9G0MdN7ay7ZQc6ZBTXk/FFs3ZElp2pFbNEk=;
 h=From:Subject:To:Cc:Date:From;
 b=N8DH5uKB8beVphdbroaduEpp/guIyO0EAvvyLdze381Jt/FJPQathFCyQgRmPUCXl
 4ZfB17QG3NKRwsvnh7jXrUeKgzXh+Z+RTNz4MBWZRxw1SrTnjboammLYaq8yb50a/v
 4OjuLUJ4Ls5yxPXsfNs1wgpEeu4c/OIr4HxeToD0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 51A708B7F2;
 Tue, 13 Aug 2019 22:11:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YkZcs1CXmGYI; Tue, 13 Aug 2019 22:11:34 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1DCE68B7F0;
 Tue, 13 Aug 2019 22:11:34 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id DA37569632; Tue, 13 Aug 2019 20:11:33 +0000 (UTC)
Message-Id: <6bc35eca507359075528bc0e55938bc1ce8ee485.1565726867.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 01/10] powerpc/mm: drop ppc_md.iounmap()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue, 13 Aug 2019 20:11:33 +0000 (UTC)
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

ppc_md.iounmap() is never set, drop it.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/machdep.h | 2 --
 arch/powerpc/mm/pgtable_64.c       | 5 +----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index c43d6eca9edd..3370df4bdaa0 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -33,8 +33,6 @@ struct machdep_calls {
 #ifdef CONFIG_PPC64
 	void __iomem *	(*ioremap)(phys_addr_t addr, unsigned long size,
 				   pgprot_t prot, void *caller);
-	void		(*iounmap)(volatile void __iomem *token);
-
 #ifdef CONFIG_PM
 	void		(*iommu_save)(void);
 	void		(*iommu_restore)(void);
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index 9ad59b733984..11eb90ea2d4f 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -285,10 +285,7 @@ void __iounmap(volatile void __iomem *token)
 
 void iounmap(volatile void __iomem *token)
 {
-	if (ppc_md.iounmap)
-		ppc_md.iounmap(token);
-	else
-		__iounmap(token);
+	__iounmap(token);
 }
 
 EXPORT_SYMBOL(ioremap);
-- 
2.13.3

