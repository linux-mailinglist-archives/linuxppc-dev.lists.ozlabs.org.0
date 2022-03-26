Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E754E7FE4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 08:59:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQWZR0Vsrz3bSr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 18:59:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQWYz5cCxz2xZk
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Mar 2022 18:59:01 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KQWYq15Qsz9sSk;
 Sat, 26 Mar 2022 08:58:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MWd_2_uPwi9A; Sat, 26 Mar 2022 08:58:55 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KQWYp6thGz9sSg;
 Sat, 26 Mar 2022 08:58:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D0F348B766;
 Sat, 26 Mar 2022 08:58:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id BDLFlGK4czpi; Sat, 26 Mar 2022 08:58:54 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.30])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 83F078B763;
 Sat, 26 Mar 2022 08:58:54 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 22Q7wdPf2233517
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 26 Mar 2022 08:58:39 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 22Q7wYrd2233515;
 Sat, 26 Mar 2022 08:58:34 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
Date: Sat, 26 Mar 2022 08:58:28 +0100
Message-Id: <ee3d660adbf8c2cdd77425268a12172ef4d5ee42.1648280690.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <a688b641-a8ef-8e6b-4f94-da5edd1c6943@csgroup.eu>
References: <a688b641-a8ef-8e6b-4f94-da5edd1c6943@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1648281498; l=5533; s=20211009;
 h=from:subject:message-id; bh=pqy69GtQ37gBmhkxEFcXQTJnF0YiL4OahbeYhVhf0xQ=;
 b=q1llzLWfDJRF22MRB95arYV9fbbQviEkLJOO+XlAHTjVsavxpDhS+8OloaQLsqVR+elDBn9qHioJ
 luyaJCgvB28UUAb6d1ezx6v8Oy7P9t+wgNUgFmDmS8o7GJwpqwTd
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 21/03/2022 a 08:56, Christophe Leroy a ecrit :
> 
> 
> Le 21/03/2022 a 03:27, Michael Ellerman a ecrit :
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> Le 18/03/2022 a 13:26, Peter Zijlstra a ecrit :
>>>> On Fri, Mar 18, 2022 at 04:21:40PM +0530, Sathvika Vasireddy wrote:
>>>>> This patch adds powerpc specific functions required for
>>>>> 'objtool mcount' to work, and enables mcount for ppc.
>>>>
>>>> I would love to see more objtool enablement for Power :-)
>>>
>>> I have not received this series and I can't see it on powerpc patchwork
>>> either (https://patchwork.ozlabs.org/project/linuxppc-dev/list/)
>>>
>>> Did you send it to linuxppc-dev list ? If not can you resend it there ?
>>
>> It is there, might have been delayed?
>>
>> http://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=291129
>>
>> There are some CI failures.
>>
> 
> On PPC32 I get :
> 
> [    0.000000] ftrace: No functions to be traced?
> 
> Without this series I get:
> 
> [    0.000000] ftrace: allocating 22508 entries in 17 pages
> [    0.000000] ftrace: allocated 17 pages with 2 groups
> 


With the changes below I managed to get a working ftrace on a PPC32 target.

Christophe

---------
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/objtool: Set to big endian and 32 bits

Small ack to crossbuild a PPC32 kernel with a x86_64 host.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/objtool/arch/powerpc/decode.c                  |  3 ++-
 tools/objtool/arch/powerpc/include/arch/endianness.h |  9 +++++++++
 tools/objtool/elf.c                                  |  4 ++--
 tools/objtool/utils.c                                | 12 +++++++-----
 4 files changed, 20 insertions(+), 8 deletions(-)
 create mode 100644 tools/objtool/arch/powerpc/include/arch/endianness.h

diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
index 58988f88b315..330af382e39f 100644
--- a/tools/objtool/arch/powerpc/decode.c
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -8,6 +8,7 @@
 #include <objtool/arch.h>
 #include <objtool/warn.h>
 #include <objtool/builtin.h>
+#include <objtool/endianness.h>
 
 int arch_decode_instruction(struct objtool_file *file, const struct section *sec,
 			    unsigned long offset, unsigned int maxlen,
@@ -20,7 +21,7 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 	u64 imm;
 
 	*immediate = imm = 0;
-	memcpy(&insn, sec->data->d_buf+offset, 4);
+	insn = bswap_if_needed(*(u32 *)(sec->data->d_buf + offset));
 	*len = 4;
 	*type = INSN_OTHER;
 
diff --git a/tools/objtool/arch/powerpc/include/arch/endianness.h b/tools/objtool/arch/powerpc/include/arch/endianness.h
new file mode 100644
index 000000000000..275087bfcc16
--- /dev/null
+++ b/tools/objtool/arch/powerpc/include/arch/endianness.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _ARCH_ENDIANNESS_H
+#define _ARCH_ENDIANNESS_H
+
+#include <endian.h>
+
+#define __TARGET_BYTE_ORDER __BIG_ENDIAN
+
+#endif /* _ARCH_ENDIANNESS_H */
diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 4b384c907027..433f0e327b68 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -867,7 +867,7 @@ static struct section *elf_create_rela_reloc_section(struct elf *elf, struct sec
 	strcpy(relocname, ".rela");
 	strcat(relocname, base->name);
 
-	sec = elf_create_section(elf, relocname, 0, sizeof(GElf_Rela), 0);
+	sec = elf_create_section(elf, relocname, 0, sizeof(Elf32_Rela), 0);
 	free(relocname);
 	if (!sec)
 		return NULL;
@@ -876,7 +876,7 @@ static struct section *elf_create_rela_reloc_section(struct elf *elf, struct sec
 	sec->base = base;
 
 	sec->sh.sh_type = SHT_RELA;
-	sec->sh.sh_addralign = 8;
+	sec->sh.sh_addralign = 4;
 	sec->sh.sh_link = find_section_by_name(elf, ".symtab")->idx;
 	sec->sh.sh_info = base->idx;
 	sec->sh.sh_flags = SHF_INFO_LINK;
diff --git a/tools/objtool/utils.c b/tools/objtool/utils.c
index c9c14fa0dfd7..f77695c81386 100644
--- a/tools/objtool/utils.c
+++ b/tools/objtool/utils.c
@@ -151,7 +151,7 @@ int decode_instructions(struct objtool_file *file)
 int create_mcount_loc_sections(struct objtool_file *file)
 {
 	struct section *sec;
-	unsigned long *loc;
+	unsigned int *loc;
 	struct instruction *insn;
 	int idx;
 
@@ -169,15 +169,17 @@ int create_mcount_loc_sections(struct objtool_file *file)
 	list_for_each_entry(insn, &file->mcount_loc_list, call_node)
 		idx++;
 
-	sec = elf_create_section(file->elf, "__mcount_loc", 0, sizeof(unsigned long), idx);
+	sec = elf_create_section(file->elf, "__mcount_loc", 0, sizeof(unsigned int), idx);
 	if (!sec)
 		return -1;
 
+	sec->sh.sh_addralign = 4;
+
 	idx = 0;
 	list_for_each_entry(insn, &file->mcount_loc_list, call_node) {
 
-		loc = (unsigned long *)sec->data->d_buf + idx;
-		memset(loc, 0, sizeof(unsigned long));
+		loc = (unsigned int *)sec->data->d_buf + idx;
+		memset(loc, 0, sizeof(unsigned int));
 
 		if (file->elf->ehdr.e_machine == EM_X86_64) {
 			if (elf_add_reloc_to_insn(file->elf, sec,
@@ -197,7 +199,7 @@ int create_mcount_loc_sections(struct objtool_file *file)
 
 		if (file->elf->ehdr.e_machine == EM_PPC) {
 			if (elf_add_reloc_to_insn(file->elf, sec,
-						  idx * sizeof(unsigned long),
+						  idx * sizeof(unsigned int),
 						  R_PPC_ADDR32,
 						  insn->sec, insn->offset))
 				return -1;
-- 
2.35.1

