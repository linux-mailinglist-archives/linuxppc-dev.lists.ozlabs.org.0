Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC61C4E4340
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 16:42:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNG2F4jNjz3bWV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 02:42:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNG0n1nhzz3bPW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Mar 2022 02:40:57 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KNG0R0yW5z9sTQ;
 Tue, 22 Mar 2022 16:40:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uFfBl0zt-ofa; Tue, 22 Mar 2022 16:40:39 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KNG0N0NGJz9sTT;
 Tue, 22 Mar 2022 16:40:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F03E78B774;
 Tue, 22 Mar 2022 16:40:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TIeO7rkuVip6; Tue, 22 Mar 2022 16:40:35 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.14])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 97A248B763;
 Tue, 22 Mar 2022 16:40:35 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 22MFeUux1513374
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 22 Mar 2022 16:40:30 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 22MFeUtJ1513373;
 Tue, 22 Mar 2022 16:40:30 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 3/4] powerpc/code-patching: Use jump_label for testing
 freed initmem
Date: Tue, 22 Mar 2022 16:40:20 +0100
Message-Id: <0aee964721cab7316cffde21a2ca223cee14d373.1647962456.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647962456.git.christophe.leroy@csgroup.eu>
References: <cover.1647962456.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1647963619; l=2469; s=20211009;
 h=from:subject:message-id; bh=lospu3LTx6JL+bF7CXBGRzqT/qZ+/MCraSgpnZzmhtw=;
 b=g9l17FQMJr6yrEZPgNG+4p15OSDMMEY5JeDtpnZVp+/OOFsFar8jgaLPRnJ4XeKEfoavmTx0EaH2
 U05xBb8qBX4s+DRAV+Fcy92l52v4AyJN2roz1MqnvUdtQQWOszJA
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

Once init is done, initmem is freed forever so no need to
test system_state at every call to patch_instruction().

Use jump_label.

This reduces by 2% the time needed to activate ftrace on an 8xx.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/code-patching.h | 2 ++
 arch/powerpc/lib/code-patching.c         | 5 ++++-
 arch/powerpc/mm/mem.c                    | 2 ++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index 409483b2d0ce..bccc3a538b9f 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -22,6 +22,8 @@
 #define BRANCH_SET_LINK	0x1
 #define BRANCH_ABSOLUTE	0x2
 
+DECLARE_STATIC_KEY_FALSE(init_mem_is_free);
+
 bool is_offset_in_branch_range(long offset);
 bool is_offset_in_cond_branch_range(long offset);
 int create_branch(ppc_inst_t *instr, const u32 *addr,
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 62692c6031bc..ab434c3853c9 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -8,6 +8,7 @@
 #include <linux/init.h>
 #include <linux/cpuhotplug.h>
 #include <linux/uaccess.h>
+#include <linux/jump_label.h>
 
 #include <asm/tlbflush.h>
 #include <asm/page.h>
@@ -193,10 +194,12 @@ static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
 
 #endif /* CONFIG_STRICT_KERNEL_RWX */
 
+__ro_after_init DEFINE_STATIC_KEY_FALSE(init_mem_is_free);
+
 int patch_instruction(u32 *addr, ppc_inst_t instr)
 {
 	/* Make sure we aren't patching a freed init section */
-	if (system_state >= SYSTEM_FREEING_INITMEM && init_section_contains(addr, 4))
+	if (static_branch_likely(&init_mem_is_free) && init_section_contains(addr, 4))
 		return 0;
 
 	return do_patch_instruction(addr, instr);
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 8e301cd8925b..9710d4e0bf08 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -22,6 +22,7 @@
 #include <asm/kasan.h>
 #include <asm/svm.h>
 #include <asm/mmzone.h>
+#include <asm/code-patching.h>
 
 #include <mm/mmu_decl.h>
 
@@ -311,6 +312,7 @@ void free_initmem(void)
 {
 	ppc_md.progress = ppc_printk_progress;
 	mark_initmem_nx();
+	static_branch_enable(&init_mem_is_free);
 	free_initmem_default(POISON_FREE_INITMEM);
 }
 
-- 
2.35.1

