Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B736B788597
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 13:26:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXHhg0qcQz3cnR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 21:26:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXHh82Z72z2xdm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 21:25:58 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RXHgz5Ym8z9vbk;
	Fri, 25 Aug 2023 13:25:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CnZ899-xiQmK; Fri, 25 Aug 2023 13:25:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RXHgz4jH5z9vbh;
	Fri, 25 Aug 2023 13:25:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9DC6E8B7BE;
	Fri, 25 Aug 2023 13:25:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ZVNk_mHNg-9E; Fri, 25 Aug 2023 13:25:51 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.234.95])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 65AD28B765;
	Fri, 25 Aug 2023 13:25:51 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37PBPjL11400397
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 13:25:45 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37PBPiN21400384;
	Fri, 25 Aug 2023 13:25:44 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/8xx: Fix pte_access_permitted() for PAGE_NONE
Date: Fri, 25 Aug 2023 13:25:36 +0200
Message-ID: <30de3838862d1a7d55582963ca5fe567b3a91b28.1692962717.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692962735; l=1818; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=jJZQF1YAq1al9uZuIZE8KXIy71bQEkSgP4654a7NyxE=; b=O4xNO0bIpYOM9y1YXEh2bceNCrnTBsQKWXyv25+M7lDTNBnA4WaNnexjFanfNwtmPg51JPtsg 99NF9WtYnZXD5QlvjVr/Cgv8dQJdIYSkzX2AX2HKKsLOr+3nepdXiLu
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

On 8xx, PAGE_NONE is handled by setting _PAGE_NA instead of clearing
_PAGE_USER.

But then pte_user() returns 1 also for PAGE_NONE.

As _PAGE_NA prevent reads, add a specific version of pte_read()
that returns 0 when _PAGE_NA is set instead of always returning 1.

Fixes: 351750331fc1 ("powerpc/mm: Introduce _PAGE_NA")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/pte-8xx.h | 7 +++++++
 arch/powerpc/include/asm/nohash/pgtable.h    | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
index 1a89ebdc3acc..0238e6bd0d6c 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
@@ -94,6 +94,13 @@ static inline pte_t pte_wrprotect(pte_t pte)
 
 #define pte_wrprotect pte_wrprotect
 
+static inline int pte_read(pte_t pte)
+{
+	return (pte_val(pte) & _PAGE_RO) != _PAGE_NA;
+}
+
+#define pte_read pte_read
+
 static inline int pte_write(pte_t pte)
 {
 	return !(pte_val(pte) & _PAGE_RO);
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index a6caaaab6f92..3af11981fcd5 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -25,7 +25,9 @@ static inline int pte_write(pte_t pte)
 	return pte_val(pte) & _PAGE_RW;
 }
 #endif
+#ifndef pte_read
 static inline int pte_read(pte_t pte)		{ return 1; }
+#endif
 static inline int pte_dirty(pte_t pte)		{ return pte_val(pte) & _PAGE_DIRTY; }
 static inline int pte_special(pte_t pte)	{ return pte_val(pte) & _PAGE_SPECIAL; }
 static inline int pte_none(pte_t pte)		{ return (pte_val(pte) & ~_PTE_NONE_MASK) == 0; }
-- 
2.41.0

