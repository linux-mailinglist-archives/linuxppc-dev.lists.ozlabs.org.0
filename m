Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E429251E4FA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 08:56:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwJBG67wlz3gHR
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 16:56:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwJ1C5kMZz3cK7
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 16:48:31 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KwHzj2jbkz9sWM;
 Sat,  7 May 2022 08:47:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2qybHAlaFMfU; Sat,  7 May 2022 08:47:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KwHzF3VYSz9sWQ;
 Sat,  7 May 2022 08:46:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6E6D78B773;
 Sat,  7 May 2022 08:46:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id U5I4ztUvGsGE; Sat,  7 May 2022 08:46:49 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6B0BD8B7B5;
 Sat,  7 May 2022 08:46:48 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2476kf3L1320563
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 7 May 2022 08:46:41 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2476kfXN1320562;
 Sat, 7 May 2022 08:46:41 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, naveen.n.rao@linux.vnet.ibm.com
Subject: [PATCH v2 23/25] powerpc/modules: Use PPC_LI macros instead of
 opencoding
Date: Sat,  7 May 2022 08:46:25 +0200
Message-Id: <8707ff3d73f14d534c07621d57f04c10d7b4eb45.1651905939.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651905939.git.christophe.leroy@csgroup.eu>
References: <cover.1651905939.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1651905982; l=2088; s=20211009;
 h=from:subject:message-id; bh=b+9gYi7tejfbtzfkoRBlVUh9NKkvVQ9ywgf6dGMQ4kg=;
 b=FCYsijztuOveTRvPDvEyu/ciR6ffv6TDzL6ijQ/c+lwkfWXyr9QnydV2Cor9h3qsAgaxJGaT+CmR
 UWLD8BBvC+PUTqhjnIy6HvoFctc3HnDeY/Y36vUrLD3OXU7V7qM7
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

Use PPC_LI_MASK and PPC_LI() instead of opencoding.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Utilisation de PPC_LI() et PPC_LI_MASK
---
 arch/powerpc/kernel/module_32.c | 11 ++++-------
 arch/powerpc/kernel/module_64.c |  3 +--
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/module_32.c b/arch/powerpc/kernel/module_32.c
index 1b129d728e83..77e071acb684 100644
--- a/arch/powerpc/kernel/module_32.c
+++ b/arch/powerpc/kernel/module_32.c
@@ -256,9 +256,8 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
 			       value, (uint32_t)location);
 			pr_debug("Location before: %08X.\n",
 			       *(uint32_t *)location);
-			value = (*(uint32_t *)location & ~0x03fffffc)
-				| ((value - (uint32_t)location)
-				   & 0x03fffffc);
+			value = (*(uint32_t *)location & ~PPC_LI_MASK) |
+				PPC_LI(value - (uint32_t)location);
 
 			if (patch_instruction(location, ppc_inst(value)))
 				return -EFAULT;
@@ -266,10 +265,8 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
 			pr_debug("Location after: %08X.\n",
 			       *(uint32_t *)location);
 			pr_debug("ie. jump to %08X+%08X = %08X\n",
-			       *(uint32_t *)location & 0x03fffffc,
-			       (uint32_t)location,
-			       (*(uint32_t *)location & 0x03fffffc)
-			       + (uint32_t)location);
+				 *(uint32_t *)PPC_LI((uint32_t)location), (uint32_t)location,
+				 (*(uint32_t *)PPC_LI((uint32_t)location)) + (uint32_t)location);
 			break;
 
 		case R_PPC_REL32:
diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index c1d87937b962..4c844198185e 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -653,8 +653,7 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 			}
 
 			/* Only replace bits 2 through 26 */
-			value = (*(uint32_t *)location & ~0x03fffffc)
-				| (value & 0x03fffffc);
+			value = (*(uint32_t *)location & ~PPC_LI_MASK) | PPC_LI(value);
 
 			if (patch_instruction((u32 *)location, ppc_inst(value)))
 				return -EFAULT;
-- 
2.35.1

