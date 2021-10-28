Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 830BA43E0F3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 14:25:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg4Xh3gkhz3cnh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 23:25:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg4W76jP9z304v
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 23:24:35 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Hg4Vp0qPfz9sT8;
 Thu, 28 Oct 2021 14:24:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KVrVmzDFwFyy; Thu, 28 Oct 2021 14:24:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Hg4Vl5bTHz9sTB;
 Thu, 28 Oct 2021 14:24:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A97D78B792;
 Thu, 28 Oct 2021 14:24:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3C9KJWB6m9xI; Thu, 28 Oct 2021 14:24:15 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.214])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2C0858B78B;
 Thu, 28 Oct 2021 14:24:15 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19SCO7iC194388
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 14:24:07 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19SCO71X194387;
 Thu, 28 Oct 2021 14:24:07 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: [PATCH v1 1/5] livepatch: Fix build failure on 32 bits processors
Date: Thu, 28 Oct 2021 14:24:01 +0200
Message-Id: <cefeeaf1447088db00c5a62e2ff03f7d15bb4c05.1635423081.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635423081.git.christophe.leroy@csgroup.eu>
References: <cover.1635423081.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1635423843; l=2882; s=20211009;
 h=from:subject:message-id; bh=FaIgF0/d4y029q2RzpfnjkNI4436DlWb16kZwMjiL08=;
 b=60UPwEY+jJpBNO+sWMPCw8ZmljEVv4JoARyFsqpKbVO0yO6ogYby2zHYSEcMfy2bXZRyQ4thKT+u
 rq23saK8BfQ2Hk5PhSwmDbGSRjhqv67CqC9QOu1776WgwJdrzkC0
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

