Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E13DB37F4B4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 11:08:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fgm6d6C24z3bxN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 19:08:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fgm5x50wbz2xvJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 19:08:05 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fgm5k1wbJz9sbZ;
 Thu, 13 May 2021 11:07:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6s838qCcO9bm; Thu, 13 May 2021 11:07:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fgm5j5bH0z9sbQ;
 Thu, 13 May 2021 11:07:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7F7958B7F3;
 Thu, 13 May 2021 11:07:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7BOwx6cbSXtS; Thu, 13 May 2021 11:07:53 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4925A8B76C;
 Thu, 13 May 2021 11:07:53 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 261DC64185; Thu, 13 May 2021 09:07:53 +0000 (UTC)
Message-Id: <ec5e85f9f9abcfecc959a03495f4a7858eb4d203.1620896780.git.christophe.leroy@csgroup.eu>
In-Reply-To: <40a43d6df1fdf41ade36e9a46e60a4df774ca9f6.1620896780.git.christophe.leroy@csgroup.eu>
References: <40a43d6df1fdf41ade36e9a46e60a4df774ca9f6.1620896780.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 2/2] powerpc/kprobes: Replace ppc_optinsn by common optinsn
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.ibm.com, anil.s.keshavamurthy@intel.com,
 davem@davemloft.net, mhiramat@kernel.org
Date: Thu, 13 May 2021 09:07:53 +0000 (UTC)
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
Cc: clang-built-linux@googlegroups.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 51c9c0843993 ("powerpc/kprobes: Implement Optprobes")
implemented a powerpc specific version of optinsn in order
to workaround the 32Mb limitation for direct branches.

Instead of implementing a dedicated powerpc version, use the
common optinsn and override the allocation and freeing functions.

This also indirectly remove the CLANG warning about
is_kprobe_ppc_optinsn_slot() not being use, and the powerpc will
now benefit from commit 5b485629ba0d ("kprobes, extable: Identify
kprobes trampolines as kernel text area")

Suggested-by: Masami Hiramatsu <mhiramat@kernel.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Acked-by: Masami Hiramatsu <mhiramat@kernel.org>
---
v2: no change
---
 arch/powerpc/kernel/optprobes.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index cdf87086fa33..a370190cd02a 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -31,11 +31,9 @@
 #define TMPL_END_IDX		\
 	(optprobe_template_end - optprobe_template_entry)
 
-DEFINE_INSN_CACHE_OPS(ppc_optinsn);
-
 static bool insn_page_in_use;
 
-static void *__ppc_alloc_insn_page(void)
+void *alloc_optinsn_page(void)
 {
 	if (insn_page_in_use)
 		return NULL;
@@ -43,20 +41,11 @@ static void *__ppc_alloc_insn_page(void)
 	return &optinsn_slot;
 }
 
-static void __ppc_free_insn_page(void *page __maybe_unused)
+void free_optinsn_page(void *page)
 {
 	insn_page_in_use = false;
 }
 
-struct kprobe_insn_cache kprobe_ppc_optinsn_slots = {
-	.mutex = __MUTEX_INITIALIZER(kprobe_ppc_optinsn_slots.mutex),
-	.pages = LIST_HEAD_INIT(kprobe_ppc_optinsn_slots.pages),
-	/* insn_size initialized later */
-	.alloc = __ppc_alloc_insn_page,
-	.free = __ppc_free_insn_page,
-	.nr_garbage = 0,
-};
-
 /*
  * Check if we can optimize this probe. Returns NIP post-emulation if this can
  * be optimized and 0 otherwise.
@@ -136,7 +125,7 @@ NOKPROBE_SYMBOL(optimized_callback);
 void arch_remove_optimized_kprobe(struct optimized_kprobe *op)
 {
 	if (op->optinsn.insn) {
-		free_ppc_optinsn_slot(op->optinsn.insn, 1);
+		free_optinsn_slot(op->optinsn.insn, 1);
 		op->optinsn.insn = NULL;
 	}
 }
@@ -203,14 +192,12 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	unsigned long nip, size;
 	int rc, i;
 
-	kprobe_ppc_optinsn_slots.insn_size = MAX_OPTINSN_SIZE;
-
 	nip = can_optimize(p);
 	if (!nip)
 		return -EILSEQ;
 
 	/* Allocate instruction slot for detour buffer */
-	buff = get_ppc_optinsn_slot();
+	buff = get_optinsn_slot();
 	if (!buff)
 		return -ENOMEM;
 
@@ -297,7 +284,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	return 0;
 
 error:
-	free_ppc_optinsn_slot(buff, 0);
+	free_optinsn_slot(buff, 0);
 	return -ERANGE;
 
 }
-- 
2.25.0

