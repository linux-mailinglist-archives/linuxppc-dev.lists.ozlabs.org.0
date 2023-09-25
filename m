Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8669D7ADF39
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 20:46:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvWzy2s7Fz3hym
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 04:46:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvWj14KXLz3dhD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 04:33:25 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RvWgY0tCRz9v7N;
	Mon, 25 Sep 2023 20:32:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jjxlhcvh7I0M; Mon, 25 Sep 2023 20:32:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RvWg53grhz9vBg;
	Mon, 25 Sep 2023 20:31:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7ACFC8B763;
	Mon, 25 Sep 2023 20:31:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0IXcspvDTYcK; Mon, 25 Sep 2023 20:31:45 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.137])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5340F8B794;
	Mon, 25 Sep 2023 20:31:44 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 38PIVaNY1499236
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 20:31:36 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 38PIVaRM1499235;
	Mon, 25 Sep 2023 20:31:36 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 26/37] powerpc/8xx: Use generic permission masks
Date: Mon, 25 Sep 2023 20:31:40 +0200
Message-ID: <5d0b5ce43485f697313eee4326ddff97157fb219.1695659959.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695659959.git.christophe.leroy@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695666676; l=1557; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=nZMa26d756wGeKFJv9IgUtZkFUT1W3KicwCma9J69qA=; b=F40VVKMtIaoFrVqed0wmRUWKwKtd/B8BhazCsaw57+ohG5qol6S7JxLV9MjTI1ZV3RzaMF5ZX ws0UBztC8zlCMfLbhK+O+ahopVIK6A2akK8OLOUd9BFmJPEKvJOc2u8
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

8xx already has _PAGE_NA and _PAGE_RO. So add _PAGE_ROX, _PAGE_RW and
_PAGE_RWX and remove specific permission masks.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/pte-8xx.h | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
index 843fe0138a66..62c965a4511a 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
@@ -48,6 +48,10 @@
 
 #define _PAGE_HUGE	0x0800	/* Copied to L1 PS bit 29 */
 
+#define _PAGE_ROX	(_PAGE_RO | _PAGE_EXEC)
+#define _PAGE_RW	0
+#define _PAGE_RWX	_PAGE_EXEC
+
 /* cache related flags non existing on 8xx */
 #define _PAGE_COHERENT	0
 #define _PAGE_WRITETHRU	0
@@ -77,14 +81,7 @@
 #define _PAGE_BASE_NC	(_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_PSIZE)
 #define _PAGE_BASE	(_PAGE_BASE_NC)
 
-/* Permission masks used to generate the __P and __S table */
-#define PAGE_NONE	__pgprot(_PAGE_BASE | _PAGE_NA)
-#define PAGE_SHARED	__pgprot(_PAGE_BASE)
-#define PAGE_SHARED_X	__pgprot(_PAGE_BASE | _PAGE_EXEC)
-#define PAGE_COPY	__pgprot(_PAGE_BASE | _PAGE_RO)
-#define PAGE_COPY_X	__pgprot(_PAGE_BASE | _PAGE_RO | _PAGE_EXEC)
-#define PAGE_READONLY	__pgprot(_PAGE_BASE | _PAGE_RO)
-#define PAGE_READONLY_X	__pgprot(_PAGE_BASE | _PAGE_RO | _PAGE_EXEC)
+#include <asm/pgtable-masks.h>
 
 #ifndef __ASSEMBLY__
 static inline pte_t pte_wrprotect(pte_t pte)
-- 
2.41.0

