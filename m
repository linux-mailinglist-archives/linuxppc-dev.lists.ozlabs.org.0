Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FADC466307
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 13:03:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4ZNL2DPxz3drC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 23:03:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4ZKs4PQDz3cCv
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 23:01:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J4ZKR5Clkz9sSm;
 Thu,  2 Dec 2021 13:00:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uE8160q18Aw8; Thu,  2 Dec 2021 13:00:43 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J4ZKM104Wz9sSv;
 Thu,  2 Dec 2021 13:00:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0C42C8B7C5;
 Thu,  2 Dec 2021 13:00:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id XPLUeKtqLGeA; Thu,  2 Dec 2021 13:00:38 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.163])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 63DC68B7CD;
 Thu,  2 Dec 2021 13:00:38 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1B2C0VRB177241
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 2 Dec 2021 13:00:31 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1B2C0SNZ177238;
 Thu, 2 Dec 2021 13:00:28 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 01/11] powerpc/code-patching: Remove pr_debug()/pr_devel()
 messages and fix check()
Date: Thu,  2 Dec 2021 13:00:17 +0100
Message-Id: <3ff9823c0a812a8a145d979a9600a6d4591b80ee.1638446239.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1638446424; l=2505; s=20211009;
 h=from:subject:message-id; bh=kXFQrhbGOBrRAY+/NIQwG4eDxVght7OdqoNFpOARWl0=;
 b=OxZZN2s4OQzhKIUEXk+U/JHsXLWjMqZkMndOePEOTlmiK7aRNm9TS6EXXiFB9WfoneO5p2RR+/B5
 8YeFdVLKCPDJAVZcrBdWsyafZpW88ks/nGn4jfkCNyhIdzB+lfeQ
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

code-patching has been working for years now, time has come to
remove debugging messages.

Change useful message to KERN_INFO and remove other ones.

Also add KERN_ERR to check() macro and change it into a do/while
to make checkpatch happy.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
This series applies on top of series "[v5,1/5] powerpc/inst: Refactor ___get_user_instr()" https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=274258

 arch/powerpc/lib/code-patching.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 312324a26df3..4fe4464b7a84 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -95,7 +95,6 @@ static int map_patch_area(void *addr, unsigned long text_poke_addr)
 
 	err = map_kernel_page(text_poke_addr, (pfn << PAGE_SHIFT), PAGE_KERNEL);
 
-	pr_devel("Mapped addr %lx with pfn %lx:%d\n", text_poke_addr, pfn, err);
 	if (err)
 		return -1;
 
@@ -130,8 +129,6 @@ static inline int unmap_patch_area(unsigned long addr)
 	if (unlikely(!ptep))
 		return -EINVAL;
 
-	pr_devel("clearing mm %p, pte %p, addr %lx\n", &init_mm, ptep, addr);
-
 	/*
 	 * In hash, pte_clear flushes the tlb, in radix, we have to
 	 */
@@ -190,10 +187,9 @@ static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
 int patch_instruction(u32 *addr, ppc_inst_t instr)
 {
 	/* Make sure we aren't patching a freed init section */
-	if (init_mem_is_free && init_section_contains(addr, 4)) {
-		pr_debug("Skipping init section patching addr: 0x%px\n", addr);
+	if (init_mem_is_free && init_section_contains(addr, 4))
 		return 0;
-	}
+
 	return do_patch_instruction(addr, instr);
 }
 NOKPROBE_SYMBOL(patch_instruction);
@@ -411,8 +407,10 @@ static void __init test_trampoline(void)
 	asm ("nop;\n");
 }
 
-#define check(x)	\
-	if (!(x)) printk("code-patching: test failed at line %d\n", __LINE__);
+#define check(x)	do {	\
+	if (!(x))		\
+		pr_err("code-patching: test failed at line %d\n", __LINE__); \
+} while (0)
 
 static void __init test_branch_iform(void)
 {
@@ -737,7 +735,7 @@ static inline void test_prefixed_patching(void) {}
 
 static int __init test_code_patching(void)
 {
-	printk(KERN_DEBUG "Running code patching self-tests ...\n");
+	pr_info("Running code patching self-tests ...\n");
 
 	test_branch_iform();
 	test_branch_bform();
-- 
2.33.1

