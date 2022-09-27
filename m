Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 780F25EC671
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 16:35:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McMbc1Bj7z3fDp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 00:35:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McMZ61V1bz3cD8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 00:33:50 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4McMYl1Sxwz9sp2;
	Tue, 27 Sep 2022 16:33:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rMBhymLQnvpA; Tue, 27 Sep 2022 16:33:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4McMYh2S9kz9snq;
	Tue, 27 Sep 2022 16:33:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 41DB18B778;
	Tue, 27 Sep 2022 16:33:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id JFIqWOEt7Tnb; Tue, 27 Sep 2022 16:33:28 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.35])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D95DD8B77B;
	Tue, 27 Sep 2022 16:33:27 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 28REXL6P351157
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Sep 2022 16:33:21 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 28REXKPa351155;
	Tue, 27 Sep 2022 16:33:20 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 2/6] powerpc/code-patching: Remove #ifdef CONFIG_STRICT_KERNEL_RWX
Date: Tue, 27 Sep 2022 16:33:04 +0200
Message-Id: <6afd19a3f6499dca52f1eb89940e7dcb3660b66c.1664289176.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <b0aac2127d30c32e5742e978045c5793667bb7ce.1664289176.git.christophe.leroy@csgroup.eu>
References: <b0aac2127d30c32e5742e978045c5793667bb7ce.1664289176.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1664289185; l=2231; s=20211009; h=from:subject:message-id; bh=6aNyJwx/Rd7QbWlS6qvf+kbvhVeWCJlH2zWF2cE++2U=; b=yW8uGXUk4K24YmaSWEHpAeoiFA11uUHLVAKL1q0kDKVimyDQ0yGlbB/1jB74D7f0St0MDQu7aNGY Sx0FFZNZCvtmCS7ZvF26wBvF3Ta17hhQd31pO8tVnVtaFGHy2JIo
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
 arch/powerpc/lib/code-patching.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 0f3acb0534b6..647a0bb35848 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -41,7 +41,6 @@ int raw_patch_instruction(u32 *addr, ppc_inst_t instr)
 	return __patch_instruction(addr, instr, addr);
 }
 
-#ifdef CONFIG_STRICT_KERNEL_RWX
 static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
 
 static int map_patch_area(void *addr, unsigned long text_poke_addr);
@@ -88,6 +87,9 @@ static __ro_after_init DEFINE_STATIC_KEY_FALSE(poking_init_done);
  */
 void __init poking_init(void)
 {
+	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
+		return;
+
 	BUG_ON(!cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 		"powerpc/text_poke:online", text_area_cpu_up,
 		text_area_cpu_down));
@@ -182,7 +184,8 @@ static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
 	 * when text_poke_area is not ready, but we still need
 	 * to allow patching. We just do the plain old patching
 	 */
-	if (!static_branch_likely(&poking_init_done))
+	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) ||
+	    !static_branch_likely(&poking_init_done))
 		return raw_patch_instruction(addr, instr);
 
 	local_irq_save(flags);
@@ -191,14 +194,6 @@ static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
 
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
2.37.1

