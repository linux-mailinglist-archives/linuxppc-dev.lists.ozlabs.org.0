Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 772F6432F72
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 09:30:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYQPr0MZmz2yHL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 18:30:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYQPM6M4Xz2ybK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 18:29:57 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HYQPB5fcpz9sTF;
 Tue, 19 Oct 2021 09:29:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WquU9dAx2nlo; Tue, 19 Oct 2021 09:29:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HYQP63Kc3z9sSg;
 Tue, 19 Oct 2021 09:29:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5C9A28B783;
 Tue, 19 Oct 2021 09:29:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id BdpzqitU36mz; Tue, 19 Oct 2021 09:29:46 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.71])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0CC018B763;
 Tue, 19 Oct 2021 09:29:45 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19J7TdLa3188430
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 09:29:39 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19J7TdX83188429;
 Tue, 19 Oct 2021 09:29:39 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 08/22] powerpc/kuep: Remove 'nosmep' boot time parameter
 except for book3s/64
Date: Tue, 19 Oct 2021 09:29:19 +0200
Message-Id: <4c36df18b41c988c4512f45d96220486adbe4c99.1634627931.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1634627931.git.christophe.leroy@csgroup.eu>
References: <cover.1634627931.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634628570; l=4988; s=20211009;
 h=from:subject:message-id; bh=+P62v5BiDAD1R+baOefF09ATbKIzIrfwmFnTJsM1zDE=;
 b=bWSBxwYTfKV7LhvvHrjDwoAqYK0QFjZkN6WtOm6JxUc6EQK4IKNtjLniA0npJr7A8ls1YqTWRZrf
 vnGvu81bCZqhyv0N2t0PL81NGPYuKcVu55pT6PwD91SP4hhwd++T
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

Deactivating KUEP at boot time is unrelevant for PPC32 and BOOK3E/64.

Remove it.

It allows to refactor setup_kuep() via a __weak function
that only PPC64s will overide for now.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 Documentation/admin-guide/kernel-parameters.txt |  2 +-
 arch/powerpc/include/asm/kup.h                  |  5 -----
 arch/powerpc/mm/book3s32/Makefile               |  1 -
 arch/powerpc/mm/book3s32/kuep.c                 | 13 -------------
 arch/powerpc/mm/init-common.c                   | 15 +++++++++++++++
 arch/powerpc/mm/nohash/44x.c                    | 10 ----------
 arch/powerpc/mm/nohash/8xx.c                    |  7 -------
 7 files changed, 16 insertions(+), 37 deletions(-)
 delete mode 100644 arch/powerpc/mm/book3s32/kuep.c

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 43dc35fe5bc0..fce1c13ce642 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3354,7 +3354,7 @@
 			Disable SMAP (Supervisor Mode Access Prevention)
 			even if it is supported by processor.
 
-	nosmep		[X86,PPC]
+	nosmep		[X86,PPC64s]
 			Disable SMEP (Supervisor Mode Execution Prevention)
 			even if it is supported by processor.
 
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 94734a8eb54d..fa8513b7acca 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -33,12 +33,7 @@ extern bool disable_kuap;
 #include <linux/pgtable.h>
 
 void setup_kup(void);
-
-#ifdef CONFIG_PPC_KUEP
 void setup_kuep(bool disabled);
-#else
-static inline void setup_kuep(bool disabled) { }
-#endif /* CONFIG_PPC_KUEP */
 
 #ifdef CONFIG_PPC_KUAP
 void setup_kuap(bool disabled);
diff --git a/arch/powerpc/mm/book3s32/Makefile b/arch/powerpc/mm/book3s32/Makefile
index 15f4773643d2..50dd8f6bdf46 100644
--- a/arch/powerpc/mm/book3s32/Makefile
+++ b/arch/powerpc/mm/book3s32/Makefile
@@ -9,5 +9,4 @@ endif
 obj-y += mmu.o mmu_context.o
 obj-$(CONFIG_PPC_BOOK3S_603) += nohash_low.o
 obj-$(CONFIG_PPC_BOOK3S_604) += hash_low.o tlb.o
-obj-$(CONFIG_PPC_KUEP) += kuep.o
 obj-$(CONFIG_PPC_KUAP) += kuap.o
diff --git a/arch/powerpc/mm/book3s32/kuep.c b/arch/powerpc/mm/book3s32/kuep.c
deleted file mode 100644
index 78fc48eee510..000000000000
--- a/arch/powerpc/mm/book3s32/kuep.c
+++ /dev/null
@@ -1,13 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-
-#include <asm/code-patching.h>
-#include <asm/kup.h>
-#include <asm/smp.h>
-
-void setup_kuep(bool disabled)
-{
-	if (smp_processor_id() != boot_cpuid)
-		return;
-
-	pr_info("Activating Kernel Userspace Execution Prevention\n");
-}
diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
index b4f3437aee38..b22e0649e2d3 100644
--- a/arch/powerpc/mm/init-common.c
+++ b/arch/powerpc/mm/init-common.c
@@ -20,6 +20,7 @@
 #include <linux/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/kup.h>
+#include <asm/smp.h>
 
 phys_addr_t memstart_addr __ro_after_init = (phys_addr_t)~0ull;
 EXPORT_SYMBOL_GPL(memstart_addr);
@@ -33,6 +34,9 @@ bool disable_kuap = !IS_ENABLED(CONFIG_PPC_KUAP);
 
 static int __init parse_nosmep(char *p)
 {
+	if (!IS_ENABLED(CONFIG_PPC_BOOKS_64))
+		return 0;
+
 	disable_kuep = true;
 	pr_warn("Disabling Kernel Userspace Execution Prevention\n");
 	return 0;
@@ -47,6 +51,17 @@ static int __init parse_nosmap(char *p)
 }
 early_param("nosmap", parse_nosmap);
 
+void __weak setup_kuep(bool disabled)
+{
+	if (!IS_ENABLED(CONFIG_PPC_KUEP) || disabled)
+		return;
+
+	if (smp_processor_id() != boot_cpuid)
+		return;
+
+	pr_info("Activating Kernel Userspace Execution Prevention\n");
+}
+
 void setup_kup(void)
 {
 	setup_kuap(disable_kuap);
diff --git a/arch/powerpc/mm/nohash/44x.c b/arch/powerpc/mm/nohash/44x.c
index ceb290df1fb5..796c824acc8c 100644
--- a/arch/powerpc/mm/nohash/44x.c
+++ b/arch/powerpc/mm/nohash/44x.c
@@ -240,13 +240,3 @@ void __init mmu_init_secondary(int cpu)
 	}
 }
 #endif /* CONFIG_SMP */
-
-#ifdef CONFIG_PPC_KUEP
-void setup_kuep(bool disabled)
-{
-	if (smp_processor_id() != boot_cpuid)
-		return;
-
-	pr_info("Activating Kernel Userspace Execution Prevention\n");
-}
-#endif
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index e878e8124ee6..36010d1c0bc4 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -212,13 +212,6 @@ void __init setup_initial_memory_limit(phys_addr_t first_memblock_base,
 	memblock_set_current_limit(min_t(u64, first_memblock_size, SZ_32M));
 }
 
-#ifdef CONFIG_PPC_KUEP
-void setup_kuep(bool disabled)
-{
-	pr_info("Activating Kernel Userspace Execution Prevention\n");
-}
-#endif
-
 #ifdef CONFIG_PPC_KUAP
 struct static_key_false disable_kuap_key;
 EXPORT_SYMBOL(disable_kuap_key);
-- 
2.31.1

