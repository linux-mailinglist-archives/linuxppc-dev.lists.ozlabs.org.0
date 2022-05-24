Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7BA532B11
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 15:19:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6vtz1Mfpz3drR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 23:19:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6vsN4XW1z3c28
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 23:18:32 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4L6vs11Rxvz9t9d;
 Tue, 24 May 2022 15:18:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fk1vbvlNobkz; Tue, 24 May 2022 15:18:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4L6vrx6zRKz9t9f;
 Tue, 24 May 2022 15:18:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DBF4D8B78C;
 Tue, 24 May 2022 15:18:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id MDZFVzOvTcNG; Tue, 24 May 2022 15:18:09 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.153])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 281A48B779;
 Tue, 24 May 2022 15:18:09 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 24ODI0Pl4109106
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 15:18:00 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 24ODI0aQ4109105;
 Tue, 24 May 2022 15:18:00 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, peterz@infradead.org,
 aik@ozlabs.ru, sv@linux.ibm.com, rostedt@goodmis.org,
 jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz
Subject: [RFC PATCH v2 7/7] objtool/powerpc: Add --mcount specific
 implementation
Date: Tue, 24 May 2022 15:17:47 +0200
Message-Id: <6ab54c456e6763b520ea2ee1c705aaec0015a5d4.1653398233.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1653398233.git.christophe.leroy@csgroup.eu>
References: <cover.1653398233.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1653398265; l=4495;
 i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id;
 bh=gb2Go7BRzqF5cnEvT4VmueTHHrvWKKfQkE/YPHqKWig=;
 b=B6lzUqJXvN7ZLODHflfvwh8lcGqttMmdTdDzGcqx/5J4dShgnyb/CEJ7BrMZq0ehMEkMWtqvzrDN
 zPv8l/SJDpYUaKZnuPx15SiHWJsVouUJLAIvg3MYc20G7c35MuPT
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

From: Sathvika Vasireddy <sv@linux.ibm.com>

This patch enables objtool --mcount on powerpc, and
adds implementation specific to powerpc.

Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                |  1 +
 tools/objtool/arch/powerpc/decode.c | 14 ++++++++++++++
 tools/objtool/check.c               | 12 +++++++-----
 tools/objtool/elf.c                 | 15 +++++++++++++++
 tools/objtool/include/objtool/elf.h |  1 +
 5 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 7c01229dd2e3..5ef8bf8eb202 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -233,6 +233,7 @@ config PPC
 	select HAVE_NMI				if PERF_EVENTS || (PPC64 && PPC_BOOK3S)
 	select HAVE_OPTPROBES
 	select HAVE_OBJTOOL
+	select HAVE_OBJTOOL_MCOUNT		if HAVE_OBJTOOL
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_EVENTS_NMI		if PPC64
 	select HAVE_PERF_REGS
diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
index eb1542d155fe..048bb4cd2838 100644
--- a/tools/objtool/arch/powerpc/decode.c
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -41,12 +41,26 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 			    struct list_head *ops_list)
 {
 	u32 insn;
+	unsigned int opcode;
 
 	*immediate = 0;
 	insn = bswap_if_needed(file->elf, *(u32 *)(sec->data->d_buf + offset));
 	*len = 4;
 	*type = INSN_OTHER;
 
+	opcode = (insn >> 26);
+
+	switch (opcode) {
+	case 18: /* bl */
+		if ((insn & 3) == 1) {
+			*type = INSN_CALL;
+			*immediate = insn & 0x3fffffc;
+			if (*immediate & 0x2000000)
+				*immediate -= 0x4000000;
+		}
+		break;
+	}
+
 	return 0;
 }
 
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 7f0dc504dd92..70be5a72e838 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -834,7 +834,7 @@ static int create_mcount_loc_sections(struct objtool_file *file)
 		memset(loc, 0, size);
 
 		if (elf_add_reloc_to_insn(file->elf, sec, idx,
-					  R_X86_64_64,
+					  elf_reloc_type_long(file->elf),
 					  insn->sec, insn->offset))
 			return -1;
 
@@ -2185,7 +2185,7 @@ static int classify_symbols(struct objtool_file *file)
 			if (arch_is_retpoline(func))
 				func->retpoline_thunk = true;
 
-			if (!strcmp(func->name, "__fentry__"))
+			if ((!strcmp(func->name, "__fentry__")) || (!strcmp(func->name, "_mcount")))
 				func->fentry = true;
 
 			if (is_profiling_func(func->name))
@@ -2261,9 +2261,11 @@ static int decode_sections(struct objtool_file *file)
 	 * Must be before add_jump_destinations(), which depends on 'func'
 	 * being set for alternatives, to enable proper sibling call detection.
 	 */
-	ret = add_special_section_alts(file);
-	if (ret)
-		return ret;
+	if (opts.stackval || opts.orc || opts.uaccess || opts.noinstr) {
+		ret = add_special_section_alts(file);
+		if (ret)
+			return ret;
+	}
 
 	ret = add_jump_destinations(file);
 	if (ret)
diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 63218f5799c2..34b1c6817a5e 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -793,6 +793,21 @@ elf_create_section_symbol(struct elf *elf, struct section *sec)
 	return sym;
 }
 
+int elf_reloc_type_long(struct elf *elf)
+{
+	switch (elf->ehdr.e_machine) {
+	case EM_X86_64:
+		return R_X86_64_64;
+	case EM_PPC64:
+		return R_PPC64_ADDR64;
+	case EM_PPC:
+		return R_PPC_ADDR32;
+	default:
+		WARN("unknown machine...");
+		exit(-1);
+	}
+}
+
 int elf_add_reloc_to_insn(struct elf *elf, struct section *sec,
 			  unsigned long offset, unsigned int type,
 			  struct section *insn_sec, unsigned long insn_off)
diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
index c720c4476828..d10f4701715b 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -152,6 +152,7 @@ static inline int elf_class_size(struct elf *elf)
 struct elf *elf_open_read(const char *name, int flags);
 struct section *elf_create_section(struct elf *elf, const char *name, unsigned int sh_flags, size_t entsize, int nr);
 
+int elf_reloc_type_long(struct elf *elf);
 int elf_add_reloc(struct elf *elf, struct section *sec, unsigned long offset,
 		  unsigned int type, struct symbol *sym, s64 addend);
 int elf_add_reloc_to_insn(struct elf *elf, struct section *sec,
-- 
2.35.3

