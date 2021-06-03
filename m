Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70658399CEB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 10:43:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwfZM6Tqpz3cZl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 18:43:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwfXK44mkz3082
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 18:42:09 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FwfWp67N2zBC5K;
 Thu,  3 Jun 2021 10:41:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZgV7NEuQinUX; Thu,  3 Jun 2021 10:41:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FwfWp5GnmzB306;
 Thu,  3 Jun 2021 10:41:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 82AE18B84A;
 Thu,  3 Jun 2021 10:41:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PQUfnj1BGQSo; Thu,  3 Jun 2021 10:41:42 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 047508B767;
 Thu,  3 Jun 2021 10:41:42 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id D37D464BD2; Thu,  3 Jun 2021 08:41:41 +0000 (UTC)
Message-Id: <87be72023448dd4e476744ed279b8c04b8d08a1c.1622708530.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1622708530.git.christophe.leroy@csgroup.eu>
References: <cover.1622708530.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 06/12] powerpc/32s: Initialise KUAP and KUEP in C
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  3 Jun 2021 08:41:41 +0000 (UTC)
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

In order to selectively activate KUAP and KUEP in a following patch,
perform KUAP and KUEP initialisation in C.

Unlike PPC64, PPC32 doesn't have an early_setup_secondary(),
so do it in start_secondary().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_book3s_32.S | 6 ------
 arch/powerpc/kernel/smp.c            | 4 ++++
 arch/powerpc/mm/book3s32/kuap.c      | 6 ++++++
 arch/powerpc/mm/book3s32/kuep.c      | 6 ++++++
 4 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index db0e2dc25f86..0b82672ff7a6 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -934,12 +934,6 @@ _GLOBAL(load_segment_registers)
 	li	r0, NUM_USER_SEGMENTS /* load up user segment register values */
 	mtctr	r0		/* for context 0 */
 	li	r3, 0		/* Kp = 0, Ks = 0, VSID = 0 */
-#ifdef CONFIG_PPC_KUEP
-	oris	r3, r3, SR_NX@h	/* Set Nx */
-#endif
-#ifdef CONFIG_PPC_KUAP
-	oris	r3, r3, SR_KS@h	/* Set Ks */
-#endif
 	li	r4, 0
 3:	mtsrin	r3, r4
 	addi	r3, r3, 0x111	/* increment VSID */
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 2e05c783440a..820ae31e0231 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1541,6 +1541,10 @@ void start_secondary(void *unused)
 {
 	unsigned int cpu = raw_smp_processor_id();
 
+	/* PPC64 calls setup_kup() in early_setup_secondary() */
+	if (IS_ENABLED(CONFIG_PPC32))
+		setup_kup();
+
 	mmgrab(&init_mm);
 	current->active_mm = &init_mm;
 
diff --git a/arch/powerpc/mm/book3s32/kuap.c b/arch/powerpc/mm/book3s32/kuap.c
index 1df55392878e..5533ed92ab3d 100644
--- a/arch/powerpc/mm/book3s32/kuap.c
+++ b/arch/powerpc/mm/book3s32/kuap.c
@@ -1,9 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 #include <asm/kup.h>
+#include <asm/smp.h>
 
 void __init setup_kuap(bool disabled)
 {
+	kuap_update_sr(mfsr(0) | SR_KS, 0, TASK_SIZE);
+
+	if (smp_processor_id() != boot_cpuid)
+		return;
+
 	pr_info("Activating Kernel Userspace Access Protection\n");
 
 	if (disabled)
diff --git a/arch/powerpc/mm/book3s32/kuep.c b/arch/powerpc/mm/book3s32/kuep.c
index 919595f47e25..3147e2edcf63 100644
--- a/arch/powerpc/mm/book3s32/kuep.c
+++ b/arch/powerpc/mm/book3s32/kuep.c
@@ -1,9 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 #include <asm/kup.h>
+#include <asm/smp.h>
 
 void __init setup_kuep(bool disabled)
 {
+	kuep_lock();
+
+	if (smp_processor_id() != boot_cpuid)
+		return;
+
 	pr_info("Activating Kernel Userspace Execution Prevention\n");
 
 	if (disabled)
-- 
2.25.0

