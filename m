Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B44F443C1D4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 06:45:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfGMb4dyqz3c5J
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 15:45:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfGLp2xZyz2y7X
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 15:44:33 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4HfGLj5VxGz9s3X;
 Wed, 27 Oct 2021 06:44:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wiw_goB2UUSf; Wed, 27 Oct 2021 06:44:29 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.162])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by pegase1.c-s.fr (Postfix) with ESMTPS id 4HfGLj3Ywqz9s3W;
 Wed, 27 Oct 2021 06:44:29 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19R4gXMn065764
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 06:42:34 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19R4gXoM065762;
 Wed, 27 Oct 2021 06:42:33 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>
Subject: [PATCH] livepatch: Fix build failure on 32 bits processors
Date: Wed, 27 Oct 2021 06:42:23 +0200
Message-Id: <cefeeaf1447088db00c5a62e2ff03f7d15bb4c05.1635308810.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1635309740; l=2882; s=20211009;
 h=from:subject:message-id; bh=FaIgF0/d4y029q2RzpfnjkNI4436DlWb16kZwMjiL08=;
 b=6l1KK276TBHtSgQczXiIk7JpCCWljc2G6JKzy9CXgXkWcj9dmZmlfwk693zLq+bzyrOCTxnj4Kch
 j03C4jchBh0IXNpz3Q7AiqM/2ISGGaGG6qUhJIpCd9kAfxfXH6y/
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
Cc: live-patching@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Trying to build livepatch on powerpc/32 results in:

	kernel/livepatch/core.c: In function 'klp_resolve_symbols':
	kernel/livepatch/core.c:221:23: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  221 |                 sym = (Elf64_Sym *)sechdrs[symndx].sh_addr + ELF_R_SYM(relas[i].r_info);
	      |                       ^
	kernel/livepatch/core.c:221:21: error: assignment to 'Elf32_Sym *' {aka 'struct elf32_sym *'} from incompatible pointer type 'Elf64_Sym *' {aka 'struct elf64_sym *'} [-Werror=incompatible-pointer-types]
	  221 |                 sym = (Elf64_Sym *)sechdrs[symndx].sh_addr + ELF_R_SYM(relas[i].r_info);
	      |                     ^
	kernel/livepatch/core.c: In function 'klp_apply_section_relocs':
	kernel/livepatch/core.c:312:35: error: passing argument 1 of 'klp_resolve_symbols' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  312 |         ret = klp_resolve_symbols(sechdrs, strtab, symndx, sec, sec_objname);
	      |                                   ^~~~~~~
	      |                                   |
	      |                                   Elf32_Shdr * {aka struct elf32_shdr *}
	kernel/livepatch/core.c:193:44: note: expected 'Elf64_Shdr *' {aka 'struct elf64_shdr *'} but argument is of type 'Elf32_Shdr *' {aka 'struct elf32_shdr *'}
	  193 | static int klp_resolve_symbols(Elf64_Shdr *sechdrs, const char *strtab,
	      |                                ~~~~~~~~~~~~^~~~~~~

Fix it by using the right types instead of forcing 64 bits types.

Fixes: 7c8e2bdd5f0d ("livepatch: Apply vmlinux-specific KLP relocations early")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 kernel/livepatch/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
index 335d988bd811..c0789383807b 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -190,7 +190,7 @@ static int klp_find_object_symbol(const char *objname, const char *name,
 	return -EINVAL;
 }
 
-static int klp_resolve_symbols(Elf64_Shdr *sechdrs, const char *strtab,
+static int klp_resolve_symbols(Elf_Shdr *sechdrs, const char *strtab,
 			       unsigned int symndx, Elf_Shdr *relasec,
 			       const char *sec_objname)
 {
@@ -218,7 +218,7 @@ static int klp_resolve_symbols(Elf64_Shdr *sechdrs, const char *strtab,
 	relas = (Elf_Rela *) relasec->sh_addr;
 	/* For each rela in this klp relocation section */
 	for (i = 0; i < relasec->sh_size / sizeof(Elf_Rela); i++) {
-		sym = (Elf64_Sym *)sechdrs[symndx].sh_addr + ELF_R_SYM(relas[i].r_info);
+		sym = (Elf_Sym *)sechdrs[symndx].sh_addr + ELF_R_SYM(relas[i].r_info);
 		if (sym->st_shndx != SHN_LIVEPATCH) {
 			pr_err("symbol %s is not marked as a livepatch symbol\n",
 			       strtab + sym->st_name);
-- 
2.31.1

