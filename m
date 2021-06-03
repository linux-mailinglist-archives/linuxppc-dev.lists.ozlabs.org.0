Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E13A399CDB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 10:42:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwfXX3VBfz3bxJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 18:42:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwfWv3dSBz301g
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 18:41:47 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FwfWj2XvbzBC5k;
 Thu,  3 Jun 2021 10:41:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8HbybS6boAPN; Thu,  3 Jun 2021 10:41:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FwfWj1jgtzBC5Z;
 Thu,  3 Jun 2021 10:41:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1B2148B849;
 Thu,  3 Jun 2021 10:41:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id R71Qwk0EC8tT; Thu,  3 Jun 2021 10:41:37 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D7DFC8B767;
 Thu,  3 Jun 2021 10:41:36 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B2AFA64BD2; Thu,  3 Jun 2021 08:41:36 +0000 (UTC)
Message-Id: <0b7a13d414837e58264edc336b89c2fe9f35f9bc.1622708530.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1622708530.git.christophe.leroy@csgroup.eu>
References: <cover.1622708530.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 01/12] powerpc/32s: Move setup_{kuep/kuap}() into
 {kuep/kuap}.c
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  3 Jun 2021 08:41:36 +0000 (UTC)
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

Avoids the #ifdef in mmu.c

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/book3s32/Makefile |  1 +
 arch/powerpc/mm/book3s32/kuap.c   | 11 +++++++++++
 arch/powerpc/mm/book3s32/kuep.c   |  8 ++++++++
 arch/powerpc/mm/book3s32/mmu.c    | 20 --------------------
 4 files changed, 20 insertions(+), 20 deletions(-)
 create mode 100644 arch/powerpc/mm/book3s32/kuap.c

diff --git a/arch/powerpc/mm/book3s32/Makefile b/arch/powerpc/mm/book3s32/Makefile
index 7f0c8a78ba0c..15f4773643d2 100644
--- a/arch/powerpc/mm/book3s32/Makefile
+++ b/arch/powerpc/mm/book3s32/Makefile
@@ -10,3 +10,4 @@ obj-y += mmu.o mmu_context.o
 obj-$(CONFIG_PPC_BOOK3S_603) += nohash_low.o
 obj-$(CONFIG_PPC_BOOK3S_604) += hash_low.o tlb.o
 obj-$(CONFIG_PPC_KUEP) += kuep.o
+obj-$(CONFIG_PPC_KUAP) += kuap.o
diff --git a/arch/powerpc/mm/book3s32/kuap.c b/arch/powerpc/mm/book3s32/kuap.c
new file mode 100644
index 000000000000..1df55392878e
--- /dev/null
+++ b/arch/powerpc/mm/book3s32/kuap.c
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <asm/kup.h>
+
+void __init setup_kuap(bool disabled)
+{
+	pr_info("Activating Kernel Userspace Access Protection\n");
+
+	if (disabled)
+		pr_warn("KUAP cannot be disabled yet on 6xx when compiled in\n");
+}
diff --git a/arch/powerpc/mm/book3s32/kuep.c b/arch/powerpc/mm/book3s32/kuep.c
index 8ed1b8634839..6eafe7b2b031 100644
--- a/arch/powerpc/mm/book3s32/kuep.c
+++ b/arch/powerpc/mm/book3s32/kuep.c
@@ -38,3 +38,11 @@ void kuep_unlock(void)
 {
 	kuep_update(mfsr(0) & ~SR_NX);
 }
+
+void __init setup_kuep(bool disabled)
+{
+	pr_info("Activating Kernel Userspace Execution Prevention\n");
+
+	if (disabled)
+		pr_warn("KUEP cannot be disabled yet on 6xx when compiled in\n");
+}
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 159930351d9f..27061583a010 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -445,26 +445,6 @@ void __init print_system_hash_info(void)
 		pr_info("Hash_mask         = 0x%lx\n", Hash_mask);
 }
 
-#ifdef CONFIG_PPC_KUEP
-void __init setup_kuep(bool disabled)
-{
-	pr_info("Activating Kernel Userspace Execution Prevention\n");
-
-	if (disabled)
-		pr_warn("KUEP cannot be disabled yet on 6xx when compiled in\n");
-}
-#endif
-
-#ifdef CONFIG_PPC_KUAP
-void __init setup_kuap(bool disabled)
-{
-	pr_info("Activating Kernel Userspace Access Protection\n");
-
-	if (disabled)
-		pr_warn("KUAP cannot be disabled yet on 6xx when compiled in\n");
-}
-#endif
-
 void __init early_init_mmu(void)
 {
 }
-- 
2.25.0

