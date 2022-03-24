Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 284584E656A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 15:38:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPSWN0twjz3chK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 01:38:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPSNz0TCNz3bvs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Mar 2022 01:32:35 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KPSMH20Vhz9sTy;
 Thu, 24 Mar 2022 15:31:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u-W6Est-0pkC; Thu, 24 Mar 2022 15:31:07 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KPSLz0Hr5z9sTx;
 Thu, 24 Mar 2022 15:30:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DF60F8B78B;
 Thu, 24 Mar 2022 15:30:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 32nCd3AEpQVs; Thu, 24 Mar 2022 15:30:50 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.77])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E28C08B79C;
 Thu, 24 Mar 2022 15:30:49 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 22OEUiPI1811760
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 24 Mar 2022 15:30:44 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 22OEUiwf1811759;
 Thu, 24 Mar 2022 15:30:44 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 20/22] powerpc/modules: Use PPC_INST_BRANCH_MASK instead of
 opencoding
Date: Thu, 24 Mar 2022 15:30:10 +0100
Message-Id: <a301c94f63888165960e21e92a0584364beb09fb.1648131740.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648131740.git.christophe.leroy@csgroup.eu>
References: <cover.1648131740.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1648132152; l=2135; s=20211009;
 h=from:subject:message-id; bh=+hpUyk5a1199l2+WP/AdaKunGqwu6Qoeoc6PngqTufs=;
 b=JPmeYBLVclnVxlOKg4+3av5sIUFxL2DOsI9D62gGNWM+KF0b0fus4PRJUaBsh44i4s6mBFTzZj+u
 o+x0bcKBD2drjXUZgRB9xOTMKrx4dvQG+eG0ZaKcM4T4Qez2uR3/
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use PPC_INST_BRANCH_MASK instead of opencoding.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/module_32.c | 13 ++++++-------
 arch/powerpc/kernel/module_64.c |  4 ++--
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/module_32.c b/arch/powerpc/kernel/module_32.c
index 1282cfd672f2..344941855e9e 100644
--- a/arch/powerpc/kernel/module_32.c
+++ b/arch/powerpc/kernel/module_32.c
@@ -256,9 +256,8 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
 			       value, (uint32_t)location);
 			pr_debug("Location before: %08X.\n",
 			       *(uint32_t *)location);
-			value = (*(uint32_t *)location & ~0x03fffffc)
-				| ((value - (uint32_t)location)
-				   & 0x03fffffc);
+			value = (*(uint32_t *)location & ~PPC_INST_OFFSET24_MASK) |
+				((value - (uint32_t)location) & PPC_INST_OFFSET24_MASK);
 
 			if (patch_instruction(location, ppc_inst(value)))
 				return -EFAULT;
@@ -266,10 +265,10 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
 			pr_debug("Location after: %08X.\n",
 			       *(uint32_t *)location);
 			pr_debug("ie. jump to %08X+%08X = %08X\n",
-			       *(uint32_t *)location & 0x03fffffc,
-			       (uint32_t)location,
-			       (*(uint32_t *)location & 0x03fffffc)
-			       + (uint32_t)location);
+				 *(uint32_t *)location & PPC_INST_OFFSET24_MASK,
+				 (uint32_t)location,
+				 (*(uint32_t *)location & PPC_INST_OFFSET24_MASK) +
+				 (uint32_t)location);
 			break;
 
 		case R_PPC_REL32:
diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index b13a72665eee..8f70a04aac6c 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -653,8 +653,8 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 			}
 
 			/* Only replace bits 2 through 26 */
-			value = (*(uint32_t *)location & ~0x03fffffc)
-				| (value & 0x03fffffc);
+			value = (*(uint32_t *)location & ~PPC_INST_OFFSET24_MASK) |
+				(value & PPC_INST_OFFSET24_MASK);
 
 			if (patch_instruction((u32 *)location, ppc_inst(value)))
 				return -EFAULT;
-- 
2.35.1

