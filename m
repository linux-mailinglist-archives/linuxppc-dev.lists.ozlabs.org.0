Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F28C7ADF43
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 20:49:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvX3N39rFz3dyj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 04:49:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvWjS4Ndbz3dmQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 04:33:48 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RvWgg22v1z9vBg;
	Mon, 25 Sep 2023 20:32:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id abZkoF-TUBSo; Mon, 25 Sep 2023 20:32:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RvWg62Xqjz9v8R;
	Mon, 25 Sep 2023 20:31:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 53BFC8B763;
	Mon, 25 Sep 2023 20:31:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id fe2BxJRTFoZO; Mon, 25 Sep 2023 20:31:46 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.137])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 51C468B792;
	Mon, 25 Sep 2023 20:31:44 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 38PIVaxJ1499232
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 20:31:36 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 38PIVa171499231;
	Mon, 25 Sep 2023 20:31:36 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 25/37] powerpc: Refactor permission masks used for __P/__S table and kernel memory flags
Date: Mon, 25 Sep 2023 20:31:39 +0200
Message-ID: <d31b59efcdb38e675479563307af891aeadf6ec9.1695659959.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695659959.git.christophe.leroy@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695666675; l=2192; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=SjqCn21A8OsRLFGLUdcgy2f8XlbTrW9A1aEPdpzsh+w=; b=9B0eUrfkWMGK91SorUCHG1n2jUdEJI2iNnT+Wi/BXz4GzexK4UEb5gp553xOVAOy++adrkuY3 aDtEfUTPaMLA6qJVBbhQHPAQ+Al51HInH73edftT7zb3CWw6CVQCiyO
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

Prepare a common version of the permission masks that will be based
on _PAGE_NA, _PAGE_RO, _PAGE_ROX, _PAGE_RW, _PAGE_RWX that will be
defined in platform specific headers in later patches.

Put them in a new header pgtable-masks.h which will be included by
platforms.

And prepare a common version of flags used for mapping kernel memory
that will be based on _PAGE_RO, _PAGE_ROX, _PAGE_RW, _PAGE_RWX that
will be defined in platform specific headers.

Put them in unless _PAGE_KERNEL_RO is already defined so that platform
specific definitions can be dismantled one by one.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/pgtable-masks.h | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 arch/powerpc/include/asm/pgtable-masks.h

diff --git a/arch/powerpc/include/asm/pgtable-masks.h b/arch/powerpc/include/asm/pgtable-masks.h
new file mode 100644
index 000000000000..808a3b9e8fc0
--- /dev/null
+++ b/arch/powerpc/include/asm/pgtable-masks.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_POWERPC_PGTABLE_MASKS_H
+#define _ASM_POWERPC_PGTABLE_MASKS_H
+
+#ifndef _PAGE_NA
+#define _PAGE_NA	0
+#define _PAGE_RO	_PAGE_READ
+#define _PAGE_ROX	(_PAGE_READ | _PAGE_EXEC)
+#define _PAGE_RW	(_PAGE_READ | _PAGE_WRITE)
+#define _PAGE_RWX	(_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC)
+#endif
+
+/* Permission flags for kernel mappings */
+#ifndef _PAGE_KERNEL_RO
+#define _PAGE_KERNEL_RO		_PAGE_RO
+#define _PAGE_KERNEL_ROX	_PAGE_ROX
+#define _PAGE_KERNEL_RW		(_PAGE_RW | _PAGE_DIRTY)
+#define _PAGE_KERNEL_RWX	(_PAGE_RWX | _PAGE_DIRTY)
+#endif
+
+/* Permission masks used to generate the __P and __S table */
+#define PAGE_NONE	__pgprot(_PAGE_BASE | _PAGE_NA)
+#define PAGE_SHARED	__pgprot(_PAGE_BASE | _PAGE_RW)
+#define PAGE_SHARED_X	__pgprot(_PAGE_BASE | _PAGE_RWX)
+#define PAGE_COPY	__pgprot(_PAGE_BASE | _PAGE_RO)
+#define PAGE_COPY_X	__pgprot(_PAGE_BASE | _PAGE_ROX)
+#define PAGE_READONLY	__pgprot(_PAGE_BASE | _PAGE_RO)
+#define PAGE_READONLY_X	__pgprot(_PAGE_BASE | _PAGE_ROX)
+
+#endif /* _ASM_POWERPC_PGTABLE_MASKS_H */
-- 
2.41.0

