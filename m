Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 922737ADF34
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 20:45:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvWyv3D6Pz3hsJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 04:45:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvWhs5nv2z3dg6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 04:33:17 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RvWgV0JrPz9vB0;
	Mon, 25 Sep 2023 20:32:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f4FQP5vTIL9t; Mon, 25 Sep 2023 20:32:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RvWg52rKVz9v8C;
	Mon, 25 Sep 2023 20:31:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5E3978B763;
	Mon, 25 Sep 2023 20:31:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id l2pzYw_uSzla; Mon, 25 Sep 2023 20:31:45 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.137])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5868C8B79E;
	Mon, 25 Sep 2023 20:31:44 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 38PIVbVk1499276
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 20:31:37 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 38PIVblc1499275;
	Mon, 25 Sep 2023 20:31:37 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 36/37] powerpc: Finally remove _PAGE_USER
Date: Mon, 25 Sep 2023 20:31:50 +0200
Message-ID: <76ebe74fdaed4297a1d8203a61174650c1d8d278.1695659959.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695659959.git.christophe.leroy@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695666677; l=1535; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=JeXw0+OAX63QGGbdC4m6O2snFcr+VIrOekmfQeoIUeI=; b=TsNXJqgg2LuWU6c9XEiJ2ARL8hyvnjwDfTO1jhPar18S8BU02bJXU5DhHz9W/k38oxUWBNO6y 9yi9hLEiAPqDbsPfHHSRwLMFigcWG+089pHNR/oWT40idVvmubJEz2k
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

_PAGE_USER is now gone on all targets. Remove it completely.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/pgtable.h | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index aba56fe3b1c6..f922c84b23eb 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -183,18 +183,14 @@ static inline int pte_young(pte_t pte)
 }
 
 /*
- * Don't just check for any non zero bits in __PAGE_USER, since for book3e
+ * Don't just check for any non zero bits in __PAGE_READ, since for book3e
  * and PTE_64BIT, PAGE_KERNEL_X contains _PAGE_BAP_SR which is also in
- * _PAGE_USER.  Need to explicitly match _PAGE_BAP_UR bit in that case too.
+ * _PAGE_READ.  Need to explicitly match _PAGE_BAP_UR bit in that case too.
  */
 #ifndef pte_read
 static inline bool pte_read(pte_t pte)
 {
-#ifdef _PAGE_READ
 	return (pte_val(pte) & _PAGE_READ) == _PAGE_READ;
-#else
-	return (pte_val(pte) & _PAGE_USER) == _PAGE_USER;
-#endif
 }
 #endif
 
@@ -206,7 +202,7 @@ static inline bool pte_read(pte_t pte)
 static inline bool pte_access_permitted(pte_t pte, bool write)
 {
 	/*
-	 * A read-only access is controlled by _PAGE_USER bit.
+	 * A read-only access is controlled by _PAGE_READ bit.
 	 * We have _PAGE_READ set for WRITE and EXECUTE
 	 */
 	if (!pte_present(pte) || !pte_read(pte))
-- 
2.41.0

