Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FC2432F9F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 09:33:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYQTl5mQQz3dts
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 18:33:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYQQ609x9z3cXs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 18:30:37 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HYQPM6ZYMz9sSt;
 Tue, 19 Oct 2021 09:29:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wacYp5GZL293; Tue, 19 Oct 2021 09:29:59 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HYQP71fzvz9sSw;
 Tue, 19 Oct 2021 09:29:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 239388B779;
 Tue, 19 Oct 2021 09:29:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VgyzqCcylDg7; Tue, 19 Oct 2021 09:29:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.71])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 145CC8B776;
 Tue, 19 Oct 2021 09:29:45 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19J7Tbcu3188402
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 09:29:38 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19J7TbRZ3188401;
 Tue, 19 Oct 2021 09:29:37 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 01/22] Revert "powerpc: Inline setup_kup()"
Date: Tue, 19 Oct 2021 09:29:12 +0200
Message-Id: <7691088fd0994ee3c8db6298dc8c00259e3f6a7f.1634627931.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1634627931.git.christophe.leroy@csgroup.eu>
References: <cover.1634627931.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634628570; l=2828; s=20211009;
 h=from:subject:message-id; bh=s6QJ0VbGmgV7jNIuY9ZSoQzmABbVEWriNQDx7Nfivxo=;
 b=iQgOtTjfsTNVaYcArvp7oZoQmeeIMwxpTbURK2DGnWDD7OaHOlSEVwjALD66YqWxNC79/7YQPJGd
 nrJ48kd3AcKY1nH3SsAGjfQy4ac3FNpI5BEsZqqzKg5p5jQY1NZs
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

This reverts commit 1791ebd131c46539b024c0f2ebf12b6c88a265b9.

setup_kup() was inlined to manage conflict between PPC32 marking
setup_{kuap/kuep}() __init and PPC64 not marking them __init.

But in fact PPC32 has removed the __init mark for all but 8xx
in order to properly handle SMP.

In order to make setup_kup() grow a bit, revert the commit
mentioned above but remove __init for 8xx as well so that
we don't have to mark setup_kup() as __ref.

Also switch the order so that KUAP is initialised before KUEP
because on the 40x, KUEP will depend on the activation of KUAP.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/kup.h | 8 ++------
 arch/powerpc/mm/init-common.c  | 6 ++++++
 arch/powerpc/mm/nohash/8xx.c   | 4 ++--
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 1df763002726..8699ca5884b9 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -32,6 +32,8 @@ extern bool disable_kuap;
 
 #include <linux/pgtable.h>
 
+void setup_kup(void);
+
 #ifdef CONFIG_PPC_KUEP
 void setup_kuep(bool disabled);
 #else
@@ -78,12 +80,6 @@ static inline void restore_user_access(unsigned long flags) { }
 #endif /* CONFIG_PPC_BOOK3S_64 */
 #endif /* CONFIG_PPC_KUAP */
 
-static __always_inline void setup_kup(void)
-{
-	setup_kuep(disable_kuep);
-	setup_kuap(disable_kuap);
-}
-
 static __always_inline void allow_read_from_user(const void __user *from, unsigned long size)
 {
 	barrier_nospec();
diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
index 3a82f89827a5..b4f3437aee38 100644
--- a/arch/powerpc/mm/init-common.c
+++ b/arch/powerpc/mm/init-common.c
@@ -47,6 +47,12 @@ static int __init parse_nosmap(char *p)
 }
 early_param("nosmap", parse_nosmap);
 
+void setup_kup(void)
+{
+	setup_kuap(disable_kuap);
+	setup_kuep(disable_kuep);
+}
+
 #define CTOR(shift) static void ctor_##shift(void *addr) \
 {							\
 	memset(addr, 0, sizeof(void *) << (shift));	\
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index 0df9fe29dd56..baa1f8a40af8 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -213,7 +213,7 @@ void __init setup_initial_memory_limit(phys_addr_t first_memblock_base,
 }
 
 #ifdef CONFIG_PPC_KUEP
-void __init setup_kuep(bool disabled)
+void setup_kuep(bool disabled)
 {
 	if (disabled)
 		return;
@@ -228,7 +228,7 @@ void __init setup_kuep(bool disabled)
 struct static_key_false disable_kuap_key;
 EXPORT_SYMBOL(disable_kuap_key);
 
-void __init setup_kuap(bool disabled)
+void setup_kuap(bool disabled)
 {
 	if (disabled) {
 		static_branch_enable(&disable_kuap_key);
-- 
2.31.1

