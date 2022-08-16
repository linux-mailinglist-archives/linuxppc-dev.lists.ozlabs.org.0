Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48638595587
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 10:46:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6Ps01yvsz3cDG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 18:46:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6PrW0PWcz307g
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 18:46:16 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4M6PrL4V2Cz9sbv;
	Tue, 16 Aug 2022 10:46:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LHahLFKZmdky; Tue, 16 Aug 2022 10:46:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4M6PrL3pDMz9sbP;
	Tue, 16 Aug 2022 10:46:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 744728B770;
	Tue, 16 Aug 2022 10:46:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id x16VDLXaADTJ; Tue, 16 Aug 2022 10:46:10 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.235.128])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3F2E98B763;
	Tue, 16 Aug 2022 10:46:10 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 27G8k0lY1397142
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Aug 2022 10:46:00 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 27G8jwMC1397119;
	Tue, 16 Aug 2022 10:45:58 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: gregkh@linuxfoundation.org, stable@vger.kernel.org
Subject: [PATCH] [backport for 4.14] powerpc/ptdump: Fix display of RW pages on FSL_BOOK3E
Date: Tue, 16 Aug 2022 10:45:29 +0200
Message-Id: <2cf5dabc5d295a1591055a042aa1b791214a2f47.1660639498.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1660639510; l=1661; s=20211009; h=from:subject:message-id; bh=nIpFA8xJ0YgDWZY2tV8QKTw9d3d4nFX8afBNVWvvd/k=; b=zYMHAalTy+dhvPKd8RDq89QgIUMKC/2XmPTg4wRpB9tHct5vAua84YVI2ZhizEb6/892Gn6N++C4 imJsooNRAvPAOZm2xfrG1Iv8BiLo6WaJHk3iWSVtv+dc3hphRAaz
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

[ Upstream commit dd8de84b57b02ba9c1fe530a6d916c0853f136bd ]

On FSL_BOOK3E, _PAGE_RW is defined with two bits, one for user and one
for supervisor. As soon as one of the two bits is set, the page has
to be display as RW. But the way it is implemented today requires both
bits to be set in order to display it as RW.

Instead of display RW when _PAGE_RW bits are set and R otherwise,
reverse the logic and display R when _PAGE_RW bits are all 0 and
RW otherwise.

This change has no impact on other platforms as _PAGE_RW is a single
bit on all of them.

Fixes: 8eb07b187000 ("powerpc/mm: Dump linux pagetables")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/0c33b96317811edf691e81698aaee8fa45ec3449.1656427391.git.christophe.leroy@csgroup.eu
---
 arch/powerpc/mm/dump_linuxpagetables.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/mm/dump_linuxpagetables.c b/arch/powerpc/mm/dump_linuxpagetables.c
index 0bbaf7344872..07541d322b56 100644
--- a/arch/powerpc/mm/dump_linuxpagetables.c
+++ b/arch/powerpc/mm/dump_linuxpagetables.c
@@ -123,15 +123,10 @@ static const struct flag_info flag_array[] = {
 		.set	= "user",
 		.clear	= "    ",
 	}, {
-#if _PAGE_RO == 0
-		.mask	= _PAGE_RW,
-		.val	= _PAGE_RW,
-#else
-		.mask	= _PAGE_RO,
-		.val	= 0,
-#endif
-		.set	= "rw",
-		.clear	= "ro",
+		.mask	= _PAGE_RW | _PAGE_RO,
+		.val	= _PAGE_RO,
+		.set	= "ro",
+		.clear	= "rw",
 	}, {
 		.mask	= _PAGE_EXEC,
 		.val	= _PAGE_EXEC,
-- 
2.37.1

