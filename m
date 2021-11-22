Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4D2458ABF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 09:51:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyLbB42tsz3ddP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 19:51:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyLY22f7Xz30JT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Nov 2021 19:49:10 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HyLXh4LfKz9sSk;
 Mon, 22 Nov 2021 09:48:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F-Hpno9y4Il3; Mon, 22 Nov 2021 09:48:52 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HyLXc0mQLz9sSZ;
 Mon, 22 Nov 2021 09:48:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 025038B77E;
 Mon, 22 Nov 2021 09:48:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9UYHqUPi79zJ; Mon, 22 Nov 2021 09:48:47 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9C6258B765;
 Mon, 22 Nov 2021 09:48:47 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1AM8meZD631732
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 09:48:40 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1AM8mecI631731;
 Mon, 22 Nov 2021 09:48:40 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, alex@ghiti.fr
Subject: [PATCH 6/8] mm: Allow arch specific arch_randomize_brk() with
 CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
Date: Mon, 22 Nov 2021 09:48:26 +0100
Message-Id: <e2209d0f1f3c1b581592bd6c32243402ccfe3dde.1637570556.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637570556.git.christophe.leroy@csgroup.eu>
References: <cover.1637570556.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1637570906; l=3140; s=20211009;
 h=from:subject:message-id; bh=AZ109l+llHd6MRuKtoBs1/7LX92fJnFaX5ppcmPYk/k=;
 b=c1K5qNiDUgf938Fhv0hbNI+x4nVqzA7W5nodpE2TVdar2U38+lhjeUFeWrVU1Yi1kaX+tJephyQT
 aDVmg4c9ANTiDlaXYDL9TLsmsG3NFa80zhie1WS5xJ91T5Jv/r9q
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit e7142bf5d231 ("arm64, mm: make randomization selected by
generic topdown mmap layout") introduced a default version of
arch_randomize_brk() provided when
CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT is selected.

powerpc could select CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
but needs to provide its own arch_randomize_brk().

In order to allow that, don't make
CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT select
CONFIG_ARCH_HAS_ELF_RANDOMIZE. Instead, ensure that
selecting CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT and
selecting CONFIG_ARCH_HAS_ELF_RANDOMIZE has the same effect.

Then only provide the default arch_randomize_brk() when the
architecture has not selected CONFIG_ARCH_HAS_ELF_RANDOMIZE.

Cc: Alexandre Ghiti <alex@ghiti.fr>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/Kconfig                  | 1 -
 fs/binfmt_elf.c               | 3 ++-
 include/linux/elf-randomize.h | 3 ++-
 mm/util.c                     | 2 ++
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 26b8ed11639d..ef3ce947b7a1 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1000,7 +1000,6 @@ config HAVE_ARCH_COMPAT_MMAP_BASES
 config ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 	bool
 	depends on MMU
-	select ARCH_HAS_ELF_RANDOMIZE
 
 config HAVE_STACK_VALIDATION
 	bool
diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index f8c7f26f1fbb..28968a189a91 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -1287,7 +1287,8 @@ static int load_elf_binary(struct linux_binprm *bprm)
 		 * (since it grows up, and may collide early with the stack
 		 * growing down), and into the unused ELF_ET_DYN_BASE region.
 		 */
-		if (IS_ENABLED(CONFIG_ARCH_HAS_ELF_RANDOMIZE) &&
+		if ((IS_ENABLED(CONFIG_ARCH_HAS_ELF_RANDOMIZE) ||
+		     IS_ENABLED(CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT)) &&
 		    elf_ex->e_type == ET_DYN && !interpreter) {
 			mm->brk = mm->start_brk = ELF_ET_DYN_BASE;
 		}
diff --git a/include/linux/elf-randomize.h b/include/linux/elf-randomize.h
index da0dbb7b6be3..1e471ca7caaf 100644
--- a/include/linux/elf-randomize.h
+++ b/include/linux/elf-randomize.h
@@ -4,7 +4,8 @@
 
 struct mm_struct;
 
-#ifndef CONFIG_ARCH_HAS_ELF_RANDOMIZE
+#if !defined(CONFIG_ARCH_HAS_ELF_RANDOMIZE) && \
+	!defined(CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT)
 static inline unsigned long arch_mmap_rnd(void) { return 0; }
 # if defined(arch_randomize_brk) && defined(CONFIG_COMPAT_BRK)
 #  define compat_brk_randomized
diff --git a/mm/util.c b/mm/util.c
index e58151a61255..edb9e94cceb5 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -344,6 +344,7 @@ unsigned long randomize_stack_top(unsigned long stack_top)
 }
 
 #ifdef CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
+#ifndef CONFIG_ARCH_HAS_ELF_RANDOMIZE
 unsigned long arch_randomize_brk(struct mm_struct *mm)
 {
 	/* Is the current task 32bit ? */
@@ -352,6 +353,7 @@ unsigned long arch_randomize_brk(struct mm_struct *mm)
 
 	return randomize_page(mm->brk, SZ_1G);
 }
+#endif
 
 unsigned long arch_mmap_rnd(void)
 {
-- 
2.33.1

