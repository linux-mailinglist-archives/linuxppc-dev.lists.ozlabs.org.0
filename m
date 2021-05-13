Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8397A37F4B3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 11:08:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fgm6H3BtGz3bnb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 19:08:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fgm5s3qCzz2xvJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 19:07:58 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fgm5h6qWPz9sbR;
 Thu, 13 May 2021 11:07:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IKc8HArddjH8; Thu, 13 May 2021 11:07:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fgm5h5tl6z9sbQ;
 Thu, 13 May 2021 11:07:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A59CF8B7F3;
 Thu, 13 May 2021 11:07:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NDVGIVfb4mfx; Thu, 13 May 2021 11:07:52 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 561978B76C;
 Thu, 13 May 2021 11:07:52 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1C7BB64185; Thu, 13 May 2021 09:07:51 +0000 (UTC)
Message-Id: <40a43d6df1fdf41ade36e9a46e60a4df774ca9f6.1620896780.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 1/2] kprobes: Allow architectures to override optinsn page
 allocation
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.ibm.com, anil.s.keshavamurthy@intel.com,
 davem@davemloft.net, mhiramat@kernel.org
Date: Thu, 13 May 2021 09:07:51 +0000 (UTC)
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
Acked-by: Masami Hiramatsu <mhiramat@kernel.org>
---
v2: Added missing prototypes in linux/kprobes.h
---
 include/linux/kprobes.h |  3 +++
 kernel/kprobes.c        | 14 ++++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/linux/kprobes.h b/include/linux/kprobes.h
index 1883a4a9f16a..02d4020615a7 100644
--- a/include/linux/kprobes.h
+++ b/include/linux/kprobes.h
@@ -409,6 +409,9 @@ void dump_kprobe(struct kprobe *kp);
 void *alloc_insn_page(void);
 void free_insn_page(void *page);
 
+void *alloc_optinsn_page(void);
+void free_optinsn_page(void *page);
+
 int kprobe_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
 		       char *sym);
 
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

