Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 975E0426DFA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 17:44:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQsvV3JrWz3dnm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 02:44:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQsqf3rQnz3bjG
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 02:41:34 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HQsq54srlz9sSl;
 Fri,  8 Oct 2021 17:41:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OoLaByecWViC; Fri,  8 Oct 2021 17:41:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HQspx6jblz9sSp;
 Fri,  8 Oct 2021 17:40:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C4BBC8B78D;
 Fri,  8 Oct 2021 17:40:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 5kYUAiyaurpI; Fri,  8 Oct 2021 17:40:57 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.75])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DE11A8B794;
 Fri,  8 Oct 2021 17:40:56 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 198FenLI1129668
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 8 Oct 2021 17:40:49 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 198FenLZ1129667;
 Fri, 8 Oct 2021 17:40:49 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 07/16] powerpc/nohash: Move setup_kuap out of 8xx.c
Date: Fri,  8 Oct 2021 17:40:35 +0200
Message-Id: <f7ec985f755452e898758873699f5f77d368a3c4.1633707305.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1633707305.git.christophe.leroy@csgroup.eu>
References: <cover.1633707305.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
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

In order to reuse it on booke/4xx, move KUAP
setup routine out of 8xx.c

Make them usable on SMP by removing the __init tag
as it is called for each CPU.

And use __prevent_user_access() instead of hard
coding initial lock.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/nohash/8xx.c    | 21 ---------------------
 arch/powerpc/mm/nohash/Makefile |  2 +-
 arch/powerpc/mm/nohash/kup.c    | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 33 insertions(+), 22 deletions(-)
 create mode 100644 arch/powerpc/mm/nohash/kup.c

diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index 0df9fe29dd56..e12e41eb91c6 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -8,11 +8,7 @@
  */
 
 #include <linux/memblock.h>
-#include <linux/mmu_context.h>
 #include <linux/hugetlb.h>
-#include <asm/fixmap.h>
-#include <asm/code-patching.h>
-#include <asm/inst.h>
 
 #include <mm/mmu_decl.h>
 
@@ -224,23 +220,6 @@ void __init setup_kuep(bool disabled)
 }
 #endif
 
-#ifdef CONFIG_PPC_KUAP
-struct static_key_false disable_kuap_key;
-EXPORT_SYMBOL(disable_kuap_key);
-
-void __init setup_kuap(bool disabled)
-{
-	if (disabled) {
-		static_branch_enable(&disable_kuap_key);
-		return;
-	}
-
-	pr_info("Activating Kernel Userspace Access Protection\n");
-
-	mtspr(SPRN_MD_AP, MD_APG_KUAP);
-}
-#endif
-
 int pud_clear_huge(pud_t *pud)
 {
 	 return 0;
diff --git a/arch/powerpc/mm/nohash/Makefile b/arch/powerpc/mm/nohash/Makefile
index 0424f6ce5bd8..2ffca5f8a169 100644
--- a/arch/powerpc/mm/nohash/Makefile
+++ b/arch/powerpc/mm/nohash/Makefile
@@ -2,7 +2,7 @@
 
 ccflags-$(CONFIG_PPC64)	:= $(NO_MINIMAL_TOC)
 
-obj-y				+= mmu_context.o tlb.o tlb_low.o
+obj-y				+= mmu_context.o tlb.o tlb_low.o kup.o
 obj-$(CONFIG_PPC_BOOK3E_64)  	+= tlb_low_64e.o book3e_pgtable.o
 obj-$(CONFIG_40x)		+= 40x.o
 obj-$(CONFIG_44x)		+= 44x.o
diff --git a/arch/powerpc/mm/nohash/kup.c b/arch/powerpc/mm/nohash/kup.c
new file mode 100644
index 000000000000..bbacbd780806
--- /dev/null
+++ b/arch/powerpc/mm/nohash/kup.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * This file contains the routines for initializing kernel userspace protection
+ */
+
+#include <linux/export.h>
+#include <linux/init.h>
+#include <linux/jump_label.h>
+#include <linux/printk.h>
+#include <linux/smp.h>
+
+#include <asm/kup.h>
+#include <asm/mmu.h>
+#include <asm/smp.h>
+
+#ifdef CONFIG_PPC_KUAP
+struct static_key_false disable_kuap_key;
+EXPORT_SYMBOL(disable_kuap_key);
+
+void setup_kuap(bool disabled)
+{
+	if (disabled) {
+		if (smp_processor_id() == boot_cpuid)
+			static_branch_enable(&disable_kuap_key);
+		return;
+	}
+
+	pr_info("Activating Kernel Userspace Access Protection\n");
+
+	__prevent_user_access(KUAP_READ_WRITE);
+}
+#endif
-- 
2.31.1

