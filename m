Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1FB7ADF46
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 20:49:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvX3t6PYmz3gYL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 04:49:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvWjY0Pdqz3dnX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 04:33:52 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RvWgh37Jpz9vC5;
	Mon, 25 Sep 2023 20:32:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7G5mQMR17wbr; Mon, 25 Sep 2023 20:32:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RvWg64Bf2z9vCc;
	Mon, 25 Sep 2023 20:31:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8C2D08B763;
	Mon, 25 Sep 2023 20:31:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id xlGRWuv3aVVO; Mon, 25 Sep 2023 20:31:46 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.137])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 57AB38B79C;
	Mon, 25 Sep 2023 20:31:44 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 38PIVaPu1499240
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 20:31:36 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 38PIVa2j1499239;
	Mon, 25 Sep 2023 20:31:36 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 27/37] powerpc/64s: Use generic permission masks
Date: Mon, 25 Sep 2023 20:31:41 +0200
Message-ID: <d37a418de52e2c950cad6797e81663b56991366f.1695659959.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695659959.git.christophe.leroy@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695666676; l=2332; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=EQ4/fSxzPa+g2RB/3NHok+UdHRmxPzQbgo9j+zlTkHw=; b=RpjUdXu0r4rpXpK18aOBnQxPV+zFo4kHfVIsBSAsSbNawe7LNjXcNWQ3uOdO8Y+IiUQe6ZMKa 52WVnPAof6+B4ghLgFcsR30PE9RdIHudZGGoUH/c0uc+9dlV1SdzG0a
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

book3s64 need specific masks because it needs _PAGE_PRIVILEGED
for PAGE_NONE.

book3s64 already has _PAGE_RW and _PAGE_RWX.
So add _PAGE_NA, _PAGE_RO and _PAGE_ROX and remove specific
permission masks.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
Not sure why it needs _PAGE_PRIVILEGED as it also have _PAGE_READ
and _PAGE_READ is not set on PAGE_NONE.
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index c3b921769ece..0fd12bdc7b5e 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -17,6 +17,9 @@
 #define _PAGE_EXEC		0x00001 /* execute permission */
 #define _PAGE_WRITE		0x00002 /* write access allowed */
 #define _PAGE_READ		0x00004	/* read access allowed */
+#define _PAGE_NA		_PAGE_PRIVILEGED
+#define _PAGE_RO		_PAGE_READ
+#define _PAGE_ROX		(_PAGE_READ | _PAGE_EXEC)
 #define _PAGE_RW		(_PAGE_READ | _PAGE_WRITE)
 #define _PAGE_RWX		(_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC)
 #define _PAGE_PRIVILEGED	0x00008 /* kernel access only */
@@ -136,21 +139,8 @@
 #define _PAGE_BASE_NC	(_PAGE_PRESENT | _PAGE_ACCESSED)
 #define _PAGE_BASE	(_PAGE_BASE_NC)
 
-/* Permission masks used to generate the __P and __S table,
- *
- * Note:__pgprot is defined in arch/powerpc/include/asm/page.h
- *
- * Write permissions imply read permissions for now (we could make write-only
- * pages on BookE but we don't bother for now). Execute permission control is
- * possible on platforms that define _PAGE_EXEC
- */
-#define PAGE_NONE	__pgprot(_PAGE_BASE | _PAGE_PRIVILEGED)
-#define PAGE_SHARED	__pgprot(_PAGE_BASE | _PAGE_RW)
-#define PAGE_SHARED_X	__pgprot(_PAGE_BASE | _PAGE_RW | _PAGE_EXEC)
-#define PAGE_COPY	__pgprot(_PAGE_BASE | _PAGE_READ)
-#define PAGE_COPY_X	__pgprot(_PAGE_BASE | _PAGE_READ | _PAGE_EXEC)
-#define PAGE_READONLY	__pgprot(_PAGE_BASE | _PAGE_READ)
-#define PAGE_READONLY_X	__pgprot(_PAGE_BASE | _PAGE_READ | _PAGE_EXEC)
+#include <asm/pgtable-masks.h>
+
 /* Radix only, Hash uses PAGE_READONLY_X + execute-only pkey instead */
 #define PAGE_EXECONLY	__pgprot(_PAGE_BASE | _PAGE_EXEC)
 
-- 
2.41.0

