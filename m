Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B2673BD7F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 19:11:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnkKG6cqTz3dgw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 03:10:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnkD36DBBz3bgT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jun 2023 03:06:27 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4QnkCY6wlMz9sgc;
	Fri, 23 Jun 2023 19:06:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ID3vXgvo2Bj; Fri, 23 Jun 2023 19:06:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4QnkCR5Qghz9sgk;
	Fri, 23 Jun 2023 19:05:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B28A38B76C;
	Fri, 23 Jun 2023 19:05:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 3imXXGwvFpjn; Fri, 23 Jun 2023 19:05:55 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.71])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 816058B783;
	Fri, 23 Jun 2023 19:05:54 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 35NH5mOC2645799
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jun 2023 19:05:48 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 35NH5m4e2645798;
	Fri, 23 Jun 2023 19:05:48 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Naveen N Rao <naveen@kernel.org>
Subject: [PATCH v3 12/15] objtool: Add support for more complex UACCESS control
Date: Fri, 23 Jun 2023 19:05:23 +0200
Message-Id: <dd4eb89f0552ed7158e2ede507e17080b1ff018b.1687539638.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1687539638.git.christophe.leroy@csgroup.eu>
References: <cover.1687539638.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687539922; l=3403; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=5icr4qDm55JVXLipfdlWi7QJjGF+/WQQ5f/8m8iRZcI=; b=QyAI5UTYo88t+R/yWDtqByz9kzj7weOH54p+gQm7yqtPnFQBIExUpzxkuP6ld5aybl4I3XK9r ptmQ8Pk1S4CAIJxgd20LkLKdi7hBxWGu6s87m6uo7NMER45/i8R9XkF
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

On x86, UACCESS is controlled by two instructions: STAC and CLAC.
STAC instruction enables UACCESS while CLAC disables UACCESS.
This is simple enough for objtool to locate UACCESS enable and
disable.

But on powerpc it is a bit more complex, the same instruction is
used for enabling and disabling UACCESS, and the same instruction
can be used for many other things. It would be too complex to use
exclusively instruction decoding.

To help objtool, mark such instruction into .discard.uaccess_begin
and .discard.uaccess_end sections, on the same principle as for
reachable/unreachable instructions. And add ASM_UACCESS_BEGIN
and ASM_UACCESS_END macros to be used in inline assembly code to
annotate UACCESS enable and UACCESS disable instructions.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 include/linux/objtool.h | 14 ++++++++++++++
 tools/objtool/check.c   | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/include/linux/objtool.h b/include/linux/objtool.h
index 03f82c2c2ebf..d8fde4158a40 100644
--- a/include/linux/objtool.h
+++ b/include/linux/objtool.h
@@ -57,6 +57,18 @@
 	".long 998b - .\n\t"						\
 	".popsection\n\t"
 
+#define ASM_UACCESS_BEGIN						\
+	"998:\n\t"							\
+	".pushsection .discard.uaccess_begin\n\t"			\
+	".long 998b - .\n\t"						\
+	".popsection\n\t"
+
+#define ASM_UACCESS_END							\
+	"998:\n\t"							\
+	".pushsection .discard.uaccess_end\n\t"				\
+	".long 998b - .\n\t"						\
+	".popsection\n\t"
+
 #else /* __ASSEMBLY__ */
 
 /*
@@ -156,6 +168,8 @@
 #define STACK_FRAME_NON_STANDARD_FP(func)
 #define ANNOTATE_NOENDBR
 #define ASM_REACHABLE
+#define ASM_UACCESS_BEGIN
+#define ASM_UACCESS_END
 #else
 #define ANNOTATE_INTRA_FUNCTION_CALL
 .macro UNWIND_HINT type:req sp_reg=0 sp_offset=0 signal=0
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index c9f0fd31d146..6daa13c25183 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1052,6 +1052,38 @@ static void add_ignores(struct objtool_file *file)
 	}
 }
 
+static void __add_uaccess(struct objtool_file *file, const char *name,
+			  int type, const char *action)
+{
+	struct section *rsec;
+	struct reloc *reloc;
+	struct instruction *insn;
+
+	rsec = find_section_by_name(file->elf, name);
+	if (!rsec)
+		return;
+
+	for_each_reloc(rsec, reloc) {
+		if (reloc->sym->type != STT_SECTION) {
+			WARN("unexpected relocation symbol type in %s: ", rsec->name);
+			continue;
+		}
+		insn = find_insn(file, reloc->sym->sec, reloc_addend(reloc));
+		if (!insn) {
+			WARN("can't find UACCESS %s insn at %s+0x%" PRIx64,
+			     action, reloc->sym->sec->name, reloc_addend(reloc));
+			continue;
+		}
+		insn->type = type;
+	}
+}
+
+static void add_uaccess(struct objtool_file *file)
+{
+	__add_uaccess(file, ".rela.discard.uaccess_begin", INSN_STAC, "enable");
+	__add_uaccess(file, ".rela.discard.uaccess_end", INSN_CLAC, "disable");
+}
+
 /*
  * This is a whitelist of functions that is allowed to be called with AC set.
  * The list is meant to be minimal and only contains compiler instrumentation
@@ -2558,6 +2590,7 @@ static int decode_sections(struct objtool_file *file)
 		return ret;
 
 	add_ignores(file);
+	add_uaccess(file);
 	add_uaccess_safe(file);
 
 	ret = add_ignore_alternatives(file);
-- 
2.40.1

