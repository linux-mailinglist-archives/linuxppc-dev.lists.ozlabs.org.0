Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD639450225
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 11:13:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ht4l55cmgz3076
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 21:13:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ht4kZ54Kcz2xsv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Nov 2021 21:12:36 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Ht4kT1lyfz9sSP;
 Mon, 15 Nov 2021 11:12:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lzJCsmAC0euV; Mon, 15 Nov 2021 11:12:33 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Ht4kT0hqRz9sSM;
 Mon, 15 Nov 2021 11:12:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 013478B770;
 Mon, 15 Nov 2021 11:12:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id upcqBFDaFB3k; Mon, 15 Nov 2021 11:12:32 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CB1EB8B763;
 Mon, 15 Nov 2021 11:12:32 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 1AFACN9b162159
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 15 Nov 2021 11:12:23 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 1AFACMNr162158;
 Mon, 15 Nov 2021 11:12:22 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3] powerpc/code-patching: Improve verification of patchability
Date: Mon, 15 Nov 2021 11:12:22 +0100
Message-Id: <bc683d499a411730504b132a924de0ccc2ef1f79.1636971137.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1636971141; l=2546; s=20211009;
 h=from:subject:message-id; bh=fpvmT7W+ZgCmpsT/d2KZPUJcncqdxaGLBSYEXsLHWos=;
 b=sNSDgwOyja21A4BwS0DUNcWdb80oTdBoOhXojue++IRLMYJXgTKFzrXmAiYal96Gu5Y9dbWnfovk
 t7tVzxS6DeXHj5+xdiXyFqEUA/nLkd9iwnXB78qaQ8QYz8n8rn7x
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
Cc: Michael Neuling <mikey@neuling.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Today, patch_instruction() assumes that it is called exclusively on
valid addresses, and only checks that it is not called on an init
address after init section has been freed.

Improve verification by calling kernel_text_address() instead.

kernel_text_address() already includes a verification of
initmem release.

Cc: Michael Neuling <mikey@neuling.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3:
- At the same time also remove init_mem_is_free as it was the last user (Was done in patch 3 in v2)
- Drop patch 2 (was merged via mm tree)
---
 arch/powerpc/include/asm/setup.h | 1 -
 arch/powerpc/lib/code-patching.c | 5 ++---
 arch/powerpc/mm/mem.c            | 2 --
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/setup.h b/arch/powerpc/include/asm/setup.h
index 6c1a7d217d1a..426a2d8d028f 100644
--- a/arch/powerpc/include/asm/setup.h
+++ b/arch/powerpc/include/asm/setup.h
@@ -9,7 +9,6 @@ extern void ppc_printk_progress(char *s, unsigned short hex);
 
 extern unsigned int rtas_data;
 extern unsigned long long memory_limit;
-extern bool init_mem_is_free;
 extern void *zalloc_maybe_bootmem(size_t size, gfp_t mask);
 
 struct device_node;
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index c5ed98823835..5e2fe133639e 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -190,10 +190,9 @@ static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
 int patch_instruction(u32 *addr, struct ppc_inst instr)
 {
 	/* Make sure we aren't patching a freed init section */
-	if (init_mem_is_free && init_section_contains(addr, 4)) {
-		pr_debug("Skipping init section patching addr: 0x%px\n", addr);
+	if (!kernel_text_address((unsigned long)addr))
 		return 0;
-	}
+
 	return do_patch_instruction(addr, instr);
 }
 NOKPROBE_SYMBOL(patch_instruction);
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index bd5d91a31183..8e301cd8925b 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -26,7 +26,6 @@
 #include <mm/mmu_decl.h>
 
 unsigned long long memory_limit;
-bool init_mem_is_free;
 
 unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
 EXPORT_SYMBOL(empty_zero_page);
@@ -312,7 +311,6 @@ void free_initmem(void)
 {
 	ppc_md.progress = ppc_printk_progress;
 	mark_initmem_nx();
-	init_mem_is_free = true;
 	free_initmem_default(POISON_FREE_INITMEM);
 }
 
-- 
2.31.1

