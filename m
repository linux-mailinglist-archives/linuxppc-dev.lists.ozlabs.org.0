Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2484538A613
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 12:24:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm5SG0ykKz3082
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 20:23:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm5RN4rF8z309g
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 20:23:12 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fm5RC5TXYz9sVv;
 Thu, 20 May 2021 12:23:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1MWlCUDGc9fC; Thu, 20 May 2021 12:23:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fm5RB5Y0pz9sVM;
 Thu, 20 May 2021 12:23:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A2FEA8B811;
 Thu, 20 May 2021 12:23:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id x1AVz3B6ZgJe; Thu, 20 May 2021 12:23:02 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5FC648B80D;
 Thu, 20 May 2021 12:23:02 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4908C64C44; Thu, 20 May 2021 10:23:02 +0000 (UTC)
Message-Id: <8c92f1d9e825ee47c6f88fe43ad42d2a8cc2ab4a.1621506159.git.christophe.leroy@csgroup.eu>
In-Reply-To: <5d146b31b943e7ad674894421db4feef54804b9b.1621506159.git.christophe.leroy@csgroup.eu>
References: <5d146b31b943e7ad674894421db4feef54804b9b.1621506159.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 03/12] powerpc/lib/code-patching: Use PPC_RAW_() macros
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com, jniethe5@gmail.com
Date: Thu, 20 May 2021 10:23:02 +0000 (UTC)
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

Instead of open coding with PPC_INST_ defines, use
PPC_RAW_() macros. It improves readability.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/code-patching.h | 12 +++++-------
 arch/powerpc/kernel/trace/ftrace.c       |  2 +-
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index f1d029bf906e..22957c6068c8 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -73,9 +73,9 @@ void __patch_exception(int exc, unsigned long addr);
 #endif
 
 #define OP_RT_RA_MASK	0xffff0000UL
-#define LIS_R2		(PPC_INST_ADDIS | __PPC_RT(R2))
-#define ADDIS_R2_R12	(PPC_INST_ADDIS | __PPC_RT(R2) | __PPC_RA(R12))
-#define ADDI_R2_R2	(PPC_INST_ADDI  | __PPC_RT(R2) | __PPC_RA(R2))
+#define LIS_R2		(PPC_RAW_LIS(_R2, 0))
+#define ADDIS_R2_R12	(PPC_RAW_ADDIS(_R2, _R12, 0))
+#define ADDI_R2_R2	(PPC_RAW_ADDI(_R2, _R2, 0))
 
 
 static inline unsigned long ppc_function_entry(void *func)
@@ -180,12 +180,10 @@ static inline unsigned long ppc_kallsyms_lookup_name(const char *name)
 #define R2_STACK_OFFSET         40
 #endif
 
-#define PPC_INST_LD_TOC		(PPC_INST_LD  | ___PPC_RT(__REG_R2) | \
-				 ___PPC_RA(__REG_R1) | R2_STACK_OFFSET)
+#define PPC_INST_LD_TOC		PPC_RAW_LD(_R2, _R1, R2_STACK_OFFSET)
 
 /* usually preceded by a mflr r0 */
-#define PPC_INST_STD_LR		(PPC_INST_STD | ___PPC_RS(__REG_R0) | \
-				 ___PPC_RA(__REG_R1) | PPC_LR_STKOFF)
+#define PPC_INST_STD_LR		PPC_RAW_STD(_R0, _R1, PPC_LR_STKOFF)
 #endif /* CONFIG_PPC64 */
 
 #endif /* _ASM_POWERPC_CODE_PATCHING_H */
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index ffe9537195aa..937220310f99 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -203,7 +203,7 @@ __ftrace_make_nop(struct module *mod,
 	}
 
 	if (!ppc_inst_equal(op,  ppc_inst(PPC_INST_LD_TOC))) {
-		pr_err("Expected %08x found %s\n", PPC_INST_LD_TOC, ppc_inst_as_str(op));
+		pr_err("Expected %08lx found %s\n", PPC_INST_LD_TOC, ppc_inst_as_str(op));
 		return -EINVAL;
 	}
 #endif /* CONFIG_MPROFILE_KERNEL */
-- 
2.25.0

