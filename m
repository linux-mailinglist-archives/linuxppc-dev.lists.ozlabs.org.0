Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FAA14F730
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Feb 2020 09:06:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 488mrC2cTkzDqh3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Feb 2020 19:06:19 +1100 (AEDT)
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
 header.s=mail header.b=Kdi/bVSI; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 488mpQ6zbzzDqg4
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Feb 2020 19:04:45 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 488mpK0GJcz9txXb;
 Sat,  1 Feb 2020 09:04:41 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Kdi/bVSI; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 7gid33ueGGIG; Sat,  1 Feb 2020 09:04:40 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 488mpJ5mDTz9txXZ;
 Sat,  1 Feb 2020 09:04:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580544280; bh=pF6qOsoa+B6c+k7OrSh1l90UqfLv4FfQzTjeEPDmFbU=;
 h=From:Subject:To:Cc:Date:From;
 b=Kdi/bVSIkI/YciLcIslviNphJQReBFpq493fmrSQ9yEl3rHlug890zMlL8S3CdLAK
 PvRv0+RzQVclxi5MA5OfaNSDTJ/HBUStyx+Tt1agsjIc1qB5NDir8cjFcZAY5st9Jy
 ckDGEM1/aETvxZJ2KWSjdpbe9jH339QMv0ZS39Ao=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A0FA18B785;
 Sat,  1 Feb 2020 09:04:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id GAtog0G4TJHt; Sat,  1 Feb 2020 09:04:36 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 039D58B752;
 Sat,  1 Feb 2020 09:04:33 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E8ADC65290; Sat,  1 Feb 2020 08:04:31 +0000 (UTC)
Message-Id: <b30b2eae6960502eaf0d9e36c60820b839693c33.1580542939.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2] powerpc/32s: Don't flush all TLBs when flushing one page
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sat,  1 Feb 2020 08:04:31 +0000 (UTC)
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

When flushing any memory range, the flushing function
flushes all TLBs.

When (start) and (end - 1) are in the same memory page,
flush that page instead.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
v2: Reworked the test as the previous one was always false (end - start was PAGE_SIZE - 1 for a single page)
---
 arch/powerpc/mm/book3s32/tlb.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s32/tlb.c b/arch/powerpc/mm/book3s32/tlb.c
index 2fcd321040ff..724c0490fb17 100644
--- a/arch/powerpc/mm/book3s32/tlb.c
+++ b/arch/powerpc/mm/book3s32/tlb.c
@@ -79,11 +79,14 @@ static void flush_range(struct mm_struct *mm, unsigned long start,
 	int count;
 	unsigned int ctx = mm->context.id;
 
+	start &= PAGE_MASK;
 	if (!Hash) {
-		_tlbia();
+		if (end - start <= PAGE_SIZE)
+			_tlbie(start);
+		else
+			_tlbia();
 		return;
 	}
-	start &= PAGE_MASK;
 	if (start >= end)
 		return;
 	end = (end - 1) | ~PAGE_MASK;
-- 
2.25.0

