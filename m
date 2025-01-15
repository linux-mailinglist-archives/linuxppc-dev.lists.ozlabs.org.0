Return-Path: <linuxppc-dev+bounces-5310-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4610CA12E9B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 23:50:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLmp4yfQz3ccV;
	Thu, 16 Jan 2025 09:50:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736981418;
	cv=none; b=DuVBDO7+zh/c9iSKltgmPc8T0BVINBjqmbgH5Q4Mjkfoccgd6+Bwpf4gWOVPATlTD0O8JwWjKPhPXBHMPgshAzGuoOS/sJjmla6EuYQe5B+r/ioeUs41xejnVwQhIfrpcbDh/gIzWnm0gLri7cPUcA0dafPLGgpb/iAOJl/laThQvUt5mAIEXTiklun8AhsAXtkNq6SO56mzHN/fDeMm2nCgGH7UTImXRuYH/XnwWtzUJ3toDwBKz1uPRwyfbWclff3kk5AflnpTGLewpNu8tmy+LGXyueIoWzrnxKRn6pIcH/n5S4CaIWIt6Mr+LsxAjZpwWbfa1o6opi2GZH7lsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736981418; c=relaxed/relaxed;
	bh=oWs9ulwEAq2zULGx8ktr5Llh7Idf9VM3g0Q60w2NlP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EyJYSr6zi4+AOfgSPXp4cFEspO2d8KYOcz3rc++AM6FkLUAa7BpYw75c+dhVaEbxrr1CECYAVGsKtw8AwgqiPscX4A4RvHCWWJexNP5YT6U4O0CNp/CvQvaxQ4qTfMRjii5vlCkfl3vTTCRnJ6laL8B6oAwdDkm3QF8f50tipfsg1WK0uJB7GZS/s0Eb5wLyLLZylOaOmKsZC9ca+0gTeUXlH1bpQZiEagfM8aXOYaDkpg5vVSy7fc9uW9MJLaDRRkPYu/QXcrGtIcZI0tnylY9N1QyyXJPWLSMcQftyWoJpqoYq6UYwwjI9GtGvXB2g+kW149k/SG19/TPU0qLF0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLmp1MZWz2ynj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 09:50:18 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYLcr118tz9sSm;
	Wed, 15 Jan 2025 23:43:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id guOiPyj1LLke; Wed, 15 Jan 2025 23:43:24 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYLcr05Rjz9sSj;
	Wed, 15 Jan 2025 23:43:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E4AA08B77A;
	Wed, 15 Jan 2025 23:43:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id oIHFxUtQG8ax; Wed, 15 Jan 2025 23:43:23 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2FB5C8B774;
	Wed, 15 Jan 2025 23:43:21 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Julien Thierry <jthierry@redhat.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Raphael Gault <raphael.gault@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 13/15] objtool: Prepare noreturns.h for more architectures
Date: Wed, 15 Jan 2025 23:42:53 +0100
Message-ID: <12729c2b5f944bc2a6938bc3e3b33e5e703a2258.1736955567.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1736955567.git.christophe.leroy@csgroup.eu>
References: <cover.1736955567.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736980964; l=2918; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=LnrGt2KAlzy5sv5GWt/HSpRIYrEvSi7R0lyIHIdGvlI=; b=PeX1SnrfDYVTrlFpXawBVcEdOvOavZBDC0xyS4VRtYab4BdU1TZGD+horiBPuQPyfgaWnPDJa xuwd87ltRpGCBryhJqTYieShBxw3TtH7bQRKClX7gpFt8WmrctQ4c2V
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

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
index f37614cc2c1b..dfee1c91a70d 100644
--- a/tools/objtool/noreturns.h
+++ b/tools/objtool/noreturns.h
@@ -1,5 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
+#include <arch/noreturns.h>
+
 /*
  * This is a (sorted!) list of all known __noreturn functions in the kernel.
  * It's needed for objtool to properly reverse-engineer the control flow graph.
@@ -19,33 +21,21 @@ NORETURN(__x64_sys_exit_group)
 NORETURN(arch_cpu_idle_dead)
 NORETURN(bch2_trans_in_restart_error)
 NORETURN(bch2_trans_restart_error)
-NORETURN(cpu_bringup_and_idle)
 NORETURN(cpu_startup_entry)
 NORETURN(do_exit)
 NORETURN(do_group_exit)
 NORETURN(do_task_dead)
-NORETURN(ex_handler_msr_mce)
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
 NORETURN(rust_begin_unwind)
 NORETURN(rust_helper_BUG)
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
2.47.0


