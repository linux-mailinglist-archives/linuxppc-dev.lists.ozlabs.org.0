Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B46D6976C5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 12:15:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46D3Sb4QwjzDqc4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 20:15:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="AbZV/y3/"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D3Qn22pFzDq6l
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 20:13:37 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46D3Qf6Z2Fz9v00b;
 Wed, 21 Aug 2019 12:13:30 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=AbZV/y3/; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id rHazDa1xdeqB; Wed, 21 Aug 2019 12:13:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46D3Qf5XQdz9v00Z;
 Wed, 21 Aug 2019 12:13:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566382410; bh=98ha4xRlWEfSIbiAr66JDxF7PiLCFfNq0WpSDjIST1s=;
 h=From:Subject:To:Cc:Date:From;
 b=AbZV/y3/soqZpydchtD/yDDtNlzH8yKvYgHA0wPIBr9vhNt/EYlu46ypAooODAQPn
 21oy79FVqlvR5A3nz8GXQFelLGY+EONxcXS7MupYqLjiJwyT1gngf2YhWY2nGB0H4C
 YqCeFVBgq7Gf64jdgWSzdrEXHcfMpATSrnmR0HUk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A79B58B7E4;
 Wed, 21 Aug 2019 12:13:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id l8ZitK1vCyjI; Wed, 21 Aug 2019 12:13:32 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 864338B7E0;
 Wed, 21 Aug 2019 12:13:32 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 634296B73E; Wed, 21 Aug 2019 10:13:32 +0000 (UTC)
Message-Id: <de395e444fb8dd7a6365c3314d78e15ebb3d7d1b.1566382245.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/mm: drop #ifdef CONFIG_MMU in is_ioremap_addr()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Date: Wed, 21 Aug 2019 10:13:32 +0000 (UTC)
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

powerpc always selects CONFIG_MMU and CONFIG_MMU is not checked
anywhere else in powerpc code.

Drop the #ifdef and the alternative part of is_ioremap_addr()

Fixes: 9bd3bb6703d8("mm/nvdimm: add is_ioremap_addr and use that to check ioremap address")
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/pgtable.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index c58ba7963688..fe77129c5055 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -168,13 +168,9 @@ static inline bool pgd_is_leaf(pgd_t pgd)
 #define is_ioremap_addr is_ioremap_addr
 static inline bool is_ioremap_addr(const void *x)
 {
-#ifdef CONFIG_MMU
 	unsigned long addr = (unsigned long)x;
 
 	return addr >= IOREMAP_BASE && addr < IOREMAP_END;
-#else
-	return false;
-#endif
 }
 #endif /* CONFIG_PPC64 */
 
-- 
2.13.3

