Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D695264022D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 09:32:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNmQl6PBGz3c6t
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 19:32:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNmQ96J3pz3bXR
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 19:31:59 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4NNmQ26kbCz9sYf;
	Fri,  2 Dec 2022 09:31:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W16u8FySLfDr; Fri,  2 Dec 2022 09:31:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4NNmQ25vjvz9sYc;
	Fri,  2 Dec 2022 09:31:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BB59E8B781;
	Fri,  2 Dec 2022 09:31:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id XwnMtTLhxdj5; Fri,  2 Dec 2022 09:31:54 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.6.19])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 839B78B763;
	Fri,  2 Dec 2022 09:31:54 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2B28Vi3J273717
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 2 Dec 2022 09:31:44 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2B28Vh8F273715;
	Fri, 2 Dec 2022 09:31:43 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        bgray@linux.ibm.com
Subject: [PATCH v2 1/5] powerpc/code-patching: Remove #ifdef CONFIG_STRICT_KERNEL_RWX
Date: Fri,  2 Dec 2022 09:31:39 +0100
Message-Id: <f67d2a109404d03e8fdf1ea15388c8778337a76b.1669969781.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1669969790; l=2161; s=20211009; h=from:subject:message-id; bh=ZQ37ufhb8s+j1TTixAnWX2rEKcsOo16EMtAvypZkMig=; b=kyoK/wJ7aeXWvbECi97BpcO3xC9QmaSJh1LRvSlg5CHC4twhV4P5FlQ8iFkBkgT+oEFlqQFzXfVt Dv/9jElMBtvgon4N1LvfB7yTWeVp1GcYoHQwCzXXbdGnJ5c5g/4w
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

No need to have one implementation of patch_instruction() for
CONFIG_STRICT_KERNEL_RWX and one for !CONFIG_STRICT_KERNEL_RWX.

In patch_instruction(), call raw_patch_instruction() when
!CONFIG_STRICT_KERNEL_RWX.

In poking_init(), bail out immediately, it will be equivalent
to the weak default implementation.

Everything else is declared static and will be discarded by
GCC when !CONFIG_STRICT_KERNEL_RWX.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2 of the series is only a rebase over today's powerpc/next
---
 arch/powerpc/lib/code-patching.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 0c5fdfd4765d..98a7bbfc8f67 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -46,8 +46,6 @@ int raw_patch_instruction(u32 *addr, ppc_inst_t instr)
 	return __patch_instruction(addr, instr, addr);
 }
 
-#ifdef CONFIG_STRICT_KERNEL_RWX
-
 struct patch_context {
 	union {
 		struct vm_struct *area;
@@ -208,6 +206,9 @@ void __init poking_init(void)
 {
 	int ret;
 
+	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
+		return;
+
 	if (mm_patch_enabled())
 		ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 					"powerpc/text_poke_mm:online",
@@ -358,7 +359,8 @@ static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
 	 * when text_poke_area is not ready, but we still need
 	 * to allow patching. We just do the plain old patching
 	 */
-	if (!static_branch_likely(&poking_init_done))
+	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) ||
+	    !static_branch_likely(&poking_init_done))
 		return raw_patch_instruction(addr, instr);
 
 	local_irq_save(flags);
@@ -370,14 +372,6 @@ static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
 
 	return err;
 }
-#else /* !CONFIG_STRICT_KERNEL_RWX */
-
-static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
-{
-	return raw_patch_instruction(addr, instr);
-}
-
-#endif /* CONFIG_STRICT_KERNEL_RWX */
 
 __ro_after_init DEFINE_STATIC_KEY_FALSE(init_mem_is_free);
 
-- 
2.38.1

