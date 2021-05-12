Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C08FC37C02B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 16:29:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgHHj64SRz3095
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 00:29:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgHHK2rcvz2xxn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 00:29:29 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FgHHC0HYgz9sdw;
 Wed, 12 May 2021 16:29:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hzyjPwJLNrbE; Wed, 12 May 2021 16:29:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FgHHB6PHQz9sdc;
 Wed, 12 May 2021 16:29:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B895C8B7F4;
 Wed, 12 May 2021 16:29:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id coiZCkJi0xFr; Wed, 12 May 2021 16:29:26 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7DC5F8B7F3;
 Wed, 12 May 2021 16:29:26 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3FADF64173; Wed, 12 May 2021 14:29:26 +0000 (UTC)
Message-Id: <472c597cc8cc8f74f037acf971f7799fb381a647.1620829724.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 1/2] kprobes: Allow architectures to override optinsn page
 allocation
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.ibm.com, anil.s.keshavamurthy@intel.com,
 davem@davemloft.net, mhiramat@kernel.org
Date: Wed, 12 May 2021 14:29:26 +0000 (UTC)
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

Some architectures like powerpc require a non standard
allocation of optinsn page, because module pages are
too far from the kernel for direct branches.

Define weak alloc_optinsn_page() and free_optinsn_page(), that
fall back on alloc_insn_page() and free_insn_page() when not
overriden by the architecture.

Suggested-by: Masami Hiramatsu <mhiramat@kernel.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 kernel/kprobes.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index 745f08fdd7a6..8c0a6fdef771 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -321,11 +321,21 @@ int kprobe_cache_get_kallsym(struct kprobe_insn_cache *c, unsigned int *symnum,
 }
 
 #ifdef CONFIG_OPTPROBES
+void __weak *alloc_optinsn_page(void)
+{
+	return alloc_insn_page();
+}
+
+void __weak free_optinsn_page(void *page)
+{
+	free_insn_page(page);
+}
+
 /* For optimized_kprobe buffer */
 struct kprobe_insn_cache kprobe_optinsn_slots = {
 	.mutex = __MUTEX_INITIALIZER(kprobe_optinsn_slots.mutex),
-	.alloc = alloc_insn_page,
-	.free = free_insn_page,
+	.alloc = alloc_optinsn_page,
+	.free = free_optinsn_page,
 	.sym = KPROBE_OPTINSN_PAGE_SYM,
 	.pages = LIST_HEAD_INIT(kprobe_optinsn_slots.pages),
 	/* .insn_size is initialized later */
-- 
2.25.0

