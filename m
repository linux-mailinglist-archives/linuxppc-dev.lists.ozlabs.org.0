Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9470B56BE77
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 19:32:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfgMp3ZGHz3cgm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jul 2022 03:32:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfgML5dhBz3c3N
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jul 2022 03:32:11 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LfgMD4FLWz9tM4;
	Fri,  8 Jul 2022 19:32:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mTxYpB3tEw-I; Fri,  8 Jul 2022 19:32:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LfgMD3SXFz9tJt;
	Fri,  8 Jul 2022 19:32:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 61E338B7A0;
	Fri,  8 Jul 2022 19:32:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id q-MmzzXzFF40; Fri,  8 Jul 2022 19:32:08 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.202])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E51418B79F;
	Fri,  8 Jul 2022 19:32:07 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 268HVwj21000727
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 8 Jul 2022 19:31:58 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 268HVwmO1000726;
	Fri, 8 Jul 2022 19:31:58 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        sv@linux.ibm.com, agust@denx.de, jpoimboe@kernel.org,
        peterz@infradead.org, jbaron@akamai.com, rostedt@goodmis.org,
        ardb@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com
Subject: [PATCH v2 1/7] powerpc: Add missing asm/asm.h for objtool
Date: Fri,  8 Jul 2022 19:31:20 +0200
Message-Id: <2bf5e4aa135ae481a34a5cf00448f99a611f4962.1657301423.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657301423.git.christophe.leroy@csgroup.eu>
References: <cover.1657301423.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1657301483; l=713; s=20211009; h=from:subject:message-id; bh=zjt5iYxYBPwCOdwC6pJhH6ZqDxcgdW226G/nXx5AgTI=; b=tH+L26Dew9OLiCzOUtFXe1j34NF84smcglOuLpSx9UBq3P9Z+YjiRnCXoVYT5Ydb067qQYgSavAg SV2PRpowBKqas5QVoxE/Se0TiB0WMmuItpxA8qTJZipq4Zt4oPjx
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
Cc: chenzhongjin@huawei.com, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit e2ef115813c3 ("objtool: Fix STACK_FRAME_NON_STANDARD
reloc type"), powerpc needs asm/asm.h to enable objtool.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/asm.h | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 arch/powerpc/include/asm/asm.h

diff --git a/arch/powerpc/include/asm/asm.h b/arch/powerpc/include/asm/asm.h
new file mode 100644
index 000000000000..86f46b604e9a
--- /dev/null
+++ b/arch/powerpc/include/asm/asm.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_POWERPC_ASM_H
+#define _ASM_POWERPC_ASM_H
+
+#define _ASM_PTR	" .long "
+
+#endif /* _ASM_POWERPC_ASM_H */
-- 
2.36.1

