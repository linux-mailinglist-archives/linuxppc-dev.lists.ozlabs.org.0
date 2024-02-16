Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C2D857A0C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 11:12:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbnmZ6yPHz3vbF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 21:12:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbnmB0l5zz3bt2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 21:12:09 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Tbnm66x0Cz9syV;
	Fri, 16 Feb 2024 11:12:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7SDVoGdzgC5N; Fri, 16 Feb 2024 11:12:06 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Tbnm66M6Gz9syQ;
	Fri, 16 Feb 2024 11:12:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D65798B786;
	Fri, 16 Feb 2024 11:12:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id NtHKeuYaB3Rg; Fri, 16 Feb 2024 11:12:06 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.102])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 862AA8B765;
	Fri, 16 Feb 2024 11:12:06 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc: Implement set_memory_rox()
Date: Fri, 16 Feb 2024 11:12:05 +0100
Message-ID: <dc9a794f82ab62572d7d0be5cb4b8b27920a4f78.1708078316.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708078326; l=1982; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=03kSx/Xj1N2C9q6WgA/pGs7PiUtVb+PYHpq8O/z+ySU=; b=Tto0qP7joTrcp/+S58ahfE8oUF+EO5e/EajrmaQmtTc4EuqNVl/kMkP9wUAefhsa+aLhOM3nz YUaB0qT81cxDSOwmiwyT6PLv5ps1NOksX8As7tsDQp9SOgd1SJ4g/Bi
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

Same as x86 and s390, add set_memory_rox() to avoid doing
one pass with set_memory_ro() and a second pass with set_memory_x().

See commit 60463628c9e0 ("x86/mm: Implement native set_memory_rox()")
and commit 22e99fa56443 ("s390/mm: implement set_memory_rox()") for
more information.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/set_memory.h | 7 +++++++
 arch/powerpc/mm/pageattr.c            | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/arch/powerpc/include/asm/set_memory.h b/arch/powerpc/include/asm/set_memory.h
index 7ebc807aa8cc..9a025b776a4b 100644
--- a/arch/powerpc/include/asm/set_memory.h
+++ b/arch/powerpc/include/asm/set_memory.h
@@ -8,6 +8,7 @@
 #define SET_MEMORY_X	3
 #define SET_MEMORY_NP	4	/* Set memory non present */
 #define SET_MEMORY_P	5	/* Set memory present */
+#define SET_MEMORY_ROX	6
 
 int change_memory_attr(unsigned long addr, int numpages, long action);
 
@@ -41,4 +42,10 @@ static inline int set_memory_p(unsigned long addr, int numpages)
 	return change_memory_attr(addr, numpages, SET_MEMORY_P);
 }
 
+static inline int set_memory_rox(unsigned long addr, int numpages)
+{
+	return change_memory_attr(addr, numpages, SET_MEMORY_ROX);
+}
+#define set_memory_rox set_memory_rox
+
 #endif
diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
index 6163e484bc6d..421db7c4f2a4 100644
--- a/arch/powerpc/mm/pageattr.c
+++ b/arch/powerpc/mm/pageattr.c
@@ -38,6 +38,10 @@ static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
 		/* Don't clear DIRTY bit */
 		pte_update_delta(ptep, addr, _PAGE_KERNEL_RW & ~_PAGE_DIRTY, _PAGE_KERNEL_RO);
 		break;
+	case SET_MEMORY_ROX:
+		/* Don't clear DIRTY bit */
+		pte_update_delta(ptep, addr, _PAGE_KERNEL_RW & ~_PAGE_DIRTY, _PAGE_KERNEL_ROX);
+		break;
 	case SET_MEMORY_RW:
 		pte_update_delta(ptep, addr, _PAGE_KERNEL_RO, _PAGE_KERNEL_RW);
 		break;
-- 
2.43.0

