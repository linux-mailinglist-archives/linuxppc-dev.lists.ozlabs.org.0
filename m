Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C55098D35A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 14:41:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467q2B4PKrzDqsQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 22:41:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Rz0c0+sj"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467pwb6gy0zDqpR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 22:36:15 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 467pwV3DsMz9v0dL;
 Wed, 14 Aug 2019 14:36:10 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Rz0c0+sj; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id kTsp-fp0g39O; Wed, 14 Aug 2019 14:36:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 467pwV23YGz9v0dJ;
 Wed, 14 Aug 2019 14:36:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565786170; bh=j53zhLU4XpoQzfSNT9XXEWPvWLs4ubINbP/2nTf1KCA=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=Rz0c0+sjJg4wVqTb4YxG3UFvvQBoskwRzoeUHILsBatWuKQksYf0OUyreBHAo8mlI
 fDOIlWJ96GTKwuRNIs9JY3X1EKTl1xNT55Acau1MoBAlS1fLKpYYQgVPav4P9fFNFb
 AIY8u1LRs6N7SE/wp8rBrnYlolfreh/u2NNiVkD4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C79428B7F5;
 Wed, 14 Aug 2019 14:36:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id COM_VehBFVgZ; Wed, 14 Aug 2019 14:36:11 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ABFC18B761;
 Wed, 14 Aug 2019 14:36:11 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id A29996B6C0; Wed, 14 Aug 2019 12:36:11 +0000 (UTC)
Message-Id: <334632b1df4775b0ccf3bdc8d6b201d14e3daedd.1565786091.git.christophe.leroy@c-s.fr>
In-Reply-To: <eb4d626514e22f85814830012642329018ef6af9.1565786091.git.christophe.leroy@c-s.fr>
References: <eb4d626514e22f85814830012642329018ef6af9.1565786091.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 3/5] powerpc/ptdump: drop dummy KERN_VIRT_START on PPC32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 14 Aug 2019 12:36:11 +0000 (UTC)
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

PPC32 doesn't have KERN_VIRT_START. Make PAGE_OFFSET the
default starting address for the dump, and drop the dummy
definition of KERN_VIRT_START. Only use KERN_VIRT_START for
non radix PPC64.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/ptdump/ptdump.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 74ff2bff4ea0..9a2186c133e6 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -26,10 +26,6 @@
 
 #include "ptdump.h"
 
-#ifdef CONFIG_PPC32
-#define KERN_VIRT_START	0
-#endif
-
 /*
  * To visualise what is happening,
  *
@@ -362,12 +358,13 @@ static int ptdump_show(struct seq_file *m, void *v)
 	struct pg_state st = {
 		.seq = m,
 		.marker = address_markers,
+		.start_address = PAGE_OFFSET,
 	};
 
-	if (radix_enabled())
-		st.start_address = PAGE_OFFSET;
-	else
+#ifdef CONFIG_PPC64
+	if (!radix_enabled())
 		st.start_address = KERN_VIRT_START;
+#endif
 
 	/* Traverse kernel page tables */
 	walk_pagetables(&st);
@@ -405,12 +402,13 @@ void ptdump_check_wx(void)
 		.seq = NULL,
 		.marker = address_markers,
 		.check_wx = true,
+		.start_address = PAGE_OFFSET,
 	};
 
-	if (radix_enabled())
-		st.start_address = PAGE_OFFSET;
-	else
+#ifdef CONFIG_PPC64
+	if (!radix_enabled())
 		st.start_address = KERN_VIRT_START;
+#endif
 
 	walk_pagetables(&st);
 
-- 
2.13.3

