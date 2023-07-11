Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9B774F48F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 18:12:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0m8x0Mz1z3fYt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 02:12:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0m5k28tkz3clm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 02:09:13 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4R0m5F74D4z9sFD;
	Tue, 11 Jul 2023 18:08:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y-Uvf8up4Fog; Tue, 11 Jul 2023 18:08:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4R0m5C2xzRz9sFC;
	Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 616888B763;
	Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id vp_5QqFmxrez; Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.184])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CBF258B779;
	Tue, 11 Jul 2023 18:08:46 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 36BG8kl83696852
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 18:08:46 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 36BG8kP03696851;
	Tue, 11 Jul 2023 18:08:46 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Naveen N Rao <naveen@kernel.org>
Subject: [PATCH v4 13/15] objtool: Prepare noreturns.h for more architectures
Date: Tue, 11 Jul 2023 18:08:39 +0200
Message-ID: <cfe3ee3caf3467d0ef5c14becc97534376328492.1689091394.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1689091394.git.christophe.leroy@csgroup.eu>
References: <cover.1689091394.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689091706; l=2884; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=VP6S87HnnUqkX0M6jjPWdL69C8RBj2wF1wd8aPIq2Vc=; b=byCCiss6/HehxbWPdM4D62jCIc16bp8efzQXnF+3YAQ/r9qOmO417uSIaMD7StSNPMTNynwMj RXYM24BCDEHBGDv7s4rDb7oinOUcQ0O8VXWPQ2xPBsvC+1v4Zm7vVtl
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

noreturns.h is a mix of x86 specific functions and more generic
core functions.

In preparation of inclusion of powerpc, split x86 functions out of
noreturns.h into arch/noreturns.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 .../objtool/arch/x86/include/arch/noreturns.h | 20 +++++++++++++++++++
 tools/objtool/noreturns.h                     | 14 ++-----------
 2 files changed, 22 insertions(+), 12 deletions(-)
 create mode 100644 tools/objtool/arch/x86/include/arch/noreturns.h

diff --git a/tools/objtool/arch/x86/include/arch/noreturns.h b/tools/objtool/arch/x86/include/arch/noreturns.h
new file mode 100644
index 000000000000..a4262aff3917
--- /dev/null
+++ b/tools/objtool/arch/x86/include/arch/noreturns.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * This is a (sorted!) list of all known __noreturn functions in arch/x86.
+ * It's needed for objtool to properly reverse-engineer the control flow graph.
+ *
+ * Yes, this is unfortunate.  A better solution is in the works.
+ */
+NORETURN(cpu_bringup_and_idle)
+NORETURN(ex_handler_msr_mce)
+NORETURN(hlt_play_dead)
+NORETURN(hv_ghcb_terminate)
+NORETURN(machine_real_restart)
+NORETURN(rewind_stack_and_make_dead)
+NORETURN(sev_es_terminate)
+NORETURN(snp_abort)
+NORETURN(x86_64_start_kernel)
+NORETURN(x86_64_start_reservations)
+NORETURN(xen_cpu_bringup_again)
+NORETURN(xen_start_kernel)
diff --git a/tools/objtool/noreturns.h b/tools/objtool/noreturns.h
index e45c7cb1d5bc..b5e0f078dbb6 100644
--- a/tools/objtool/noreturns.h
+++ b/tools/objtool/noreturns.h
@@ -1,5 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
+#include <arch/noreturns.h>
+
 /*
  * This is a (sorted!) list of all known __noreturn functions in the kernel.
  * It's needed for objtool to properly reverse-engineer the control flow graph.
@@ -14,32 +16,20 @@ NORETURN(__stack_chk_fail)
 NORETURN(__ubsan_handle_builtin_unreachable)
 NORETURN(arch_call_rest_init)
 NORETURN(arch_cpu_idle_dead)
-NORETURN(cpu_bringup_and_idle)
 NORETURN(cpu_startup_entry)
 NORETURN(do_exit)
 NORETURN(do_group_exit)
 NORETURN(do_task_dead)
-NORETURN(ex_handler_msr_mce)
 NORETURN(fortify_panic)
-NORETURN(hlt_play_dead)
-NORETURN(hv_ghcb_terminate)
 NORETURN(kthread_complete_and_exit)
 NORETURN(kthread_exit)
 NORETURN(kunit_try_catch_throw)
-NORETURN(machine_real_restart)
 NORETURN(make_task_dead)
 NORETURN(mpt_halt_firmware)
 NORETURN(nmi_panic_self_stop)
 NORETURN(panic)
 NORETURN(panic_smp_self_stop)
 NORETURN(rest_init)
-NORETURN(rewind_stack_and_make_dead)
-NORETURN(sev_es_terminate)
-NORETURN(snp_abort)
 NORETURN(start_kernel)
 NORETURN(stop_this_cpu)
 NORETURN(usercopy_abort)
-NORETURN(x86_64_start_kernel)
-NORETURN(x86_64_start_reservations)
-NORETURN(xen_cpu_bringup_again)
-NORETURN(xen_start_kernel)
-- 
2.41.0

