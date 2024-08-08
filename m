Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6085B94B9B8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 11:33:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wfhg92TQ0z2yVv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 19:33:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wfhfp0J1Fz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 19:33:03 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wfhfh0zVNz9sPd;
	Thu,  8 Aug 2024 11:33:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s3gIbBZXjQLT; Thu,  8 Aug 2024 11:33:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wfhfh0BYvz9rvV;
	Thu,  8 Aug 2024 11:33:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E77468B76C;
	Thu,  8 Aug 2024 11:32:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id pOdydQ41dDJz; Thu,  8 Aug 2024 11:32:59 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.234.168])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 934C08B763;
	Thu,  8 Aug 2024 11:32:59 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] powerpc/mm: Fix size of allocated PGDIR
Date: Thu,  8 Aug 2024 11:32:47 +0200
Message-ID: <1cdaacb391cbd3e0240f0e0faf691202874e9422.1723109462.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723109568; l=1396; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=cC+vGrMsk7qtfO7gPds0huUqn3FKXHJr45RkPS0DplI=; b=r2P7zKGJF+IEFY9k2QKtbTHKpOZWiFOTES8xvq7+aDHEH2n9CBVuQlAuv4rxuHhecLDWrLg1I zG2GBs0U48ICqY3uwR2HTkQTe2L3iVLgP4/vo1lYmSAfH7ULavQyJ+M
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
Cc: linux-mm@kvack.org, Guenter Roeck <linux@roeck-us.net>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 6b0e82791bd0 ("powerpc/e500: switch to 64 bits PGD on 85xx
(32 bits)") increased the size of PGD entries but failed to increase
the PGD directory.

Use the size of pgd_t instead of the size of pointers to calculate
the allocated size.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Fixes: 6b0e82791bd0 ("powerpc/e500: switch to 64 bits PGD on 85xx (32 bits)")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/init-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
index 9b4a675eb8f8..2978fcbe307e 100644
--- a/arch/powerpc/mm/init-common.c
+++ b/arch/powerpc/mm/init-common.c
@@ -73,7 +73,7 @@ void setup_kup(void)
 
 #define CTOR(shift) static void ctor_##shift(void *addr) \
 {							\
-	memset(addr, 0, sizeof(void *) << (shift));	\
+	memset(addr, 0, sizeof(pgd_t) << (shift));	\
 }
 
 CTOR(0); CTOR(1); CTOR(2); CTOR(3); CTOR(4); CTOR(5); CTOR(6); CTOR(7);
@@ -117,7 +117,7 @@ EXPORT_SYMBOL_GPL(pgtable_cache);	/* used by kvm_hv module */
 void pgtable_cache_add(unsigned int shift)
 {
 	char *name;
-	unsigned long table_size = sizeof(void *) << shift;
+	unsigned long table_size = sizeof(pgd_t) << shift;
 	unsigned long align = table_size;
 
 	/* When batching pgtable pointers for RCU freeing, we store
-- 
2.44.0

