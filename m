Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6239D4EE7E9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 07:50:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KV8R36tgPz3bTZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 16:50:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KV8Qf2M7Mz2y7M
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Apr 2022 16:50:15 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KV8QX1xWqz9sS7;
 Fri,  1 Apr 2022 07:50:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KN0ELz2NsC3g; Fri,  1 Apr 2022 07:50:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KV8QX0kyJz9sRv;
 Fri,  1 Apr 2022 07:50:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 02F5A8B78B;
 Fri,  1 Apr 2022 07:50:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id EE3NQSXyqqMO; Fri,  1 Apr 2022 07:50:11 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.82])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B0D708B766;
 Fri,  1 Apr 2022 07:50:11 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2315o06k636219
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 1 Apr 2022 07:50:00 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2315nxYZ636218;
 Fri, 1 Apr 2022 07:49:59 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Subject: [RFC PATCH v2] objtool: Use target file endianness instead of a
 compiled constant
Date: Fri,  1 Apr 2022 07:49:56 +0200
Message-Id: <8c5881d4960a4dc5e64082ecd6359f19027ca2cd.1648792104.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1648792195; l=6175; s=20211009;
 h=from:subject:message-id; bh=4NPekWjrcRuSVKe8y44GGoUXDPqbdBzeIRnVBUxQb8k=;
 b=nGPXown8mH/1ECSyIvnNAOZDHx7jTZCwhIMZgWkY5WbV3kRkKI6m078eHQgXRRhqDA08uEV2UYW/
 N0DaBPCUBvLyPtLv68UBqNwTDtCJUKAZi2lHibralscwl2rsx1J8
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

Some architectures like powerpc support both endianness, it's
therefore not possible to fix the endianness via arch/endianness.h
because there is no easy way to get the target endianness at
build time.

Use the endianness recorded in the file objtool is working on.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Pass pointer to struct elf instead of pointer to elf header. A fake struct elf needs to be built in orc_dump().
---
 .../arch/x86/include/arch/endianness.h        |  9 ------
 tools/objtool/check.c                         |  2 +-
 tools/objtool/include/objtool/endianness.h    | 29 +++++++++----------
 tools/objtool/orc_dump.c                      | 11 +++++--
 tools/objtool/orc_gen.c                       |  4 +--
 tools/objtool/special.c                       |  3 +-
 6 files changed, 27 insertions(+), 31 deletions(-)
 delete mode 100644 tools/objtool/arch/x86/include/arch/endianness.h

diff --git a/tools/objtool/arch/x86/include/arch/endianness.h b/tools/objtool/arch/x86/include/arch/endianness.h
deleted file mode 100644
index 7c362527da20..000000000000
--- a/tools/objtool/arch/x86/include/arch/endianness.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-#ifndef _ARCH_ENDIANNESS_H
-#define _ARCH_ENDIANNESS_H
-
-#include <endian.h>
-
-#define __TARGET_BYTE_ORDER __LITTLE_ENDIAN
-
-#endif /* _ARCH_ENDIANNESS_H */
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 6de5085e3e5a..63d24f985d70 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1941,7 +1941,7 @@ static int read_unwind_hints(struct objtool_file *file)
 			return -1;
 		}
 
-		cfi.cfa.offset = bswap_if_needed(hint->sp_offset);
+		cfi.cfa.offset = bswap_if_needed(file->elf, hint->sp_offset);
 		cfi.type = hint->type;
 		cfi.end = hint->end;
 
diff --git a/tools/objtool/include/objtool/endianness.h b/tools/objtool/include/objtool/endianness.h
index 10241341eff3..ab0515ba0538 100644
--- a/tools/objtool/include/objtool/endianness.h
+++ b/tools/objtool/include/objtool/endianness.h
@@ -2,33 +2,30 @@
 #ifndef _OBJTOOL_ENDIANNESS_H
 #define _OBJTOOL_ENDIANNESS_H
 
-#include <arch/endianness.h>
 #include <linux/kernel.h>
 #include <endian.h>
-
-#ifndef __TARGET_BYTE_ORDER
-#error undefined arch __TARGET_BYTE_ORDER
-#endif
-
-#if __BYTE_ORDER != __TARGET_BYTE_ORDER
-#define __NEED_BSWAP 1
-#else
-#define __NEED_BSWAP 0
-#endif
+#include <objtool/elf.h>
 
 /*
- * Does a byte swap if target endianness doesn't match the host, i.e. cross
+ * Does a byte swap if target file endianness doesn't match the host, i.e. cross
  * compilation for little endian on big endian and vice versa.
  * To be used for multi-byte values conversion, which are read from / about
  * to be written to a target native endianness ELF file.
  */
-#define bswap_if_needed(val)						\
+static inline bool need_bswap(struct elf *elf)
+{
+	return (__BYTE_ORDER == __LITTLE_ENDIAN) ^
+	       (elf->ehdr.e_ident[EI_DATA] == ELFDATA2LSB);
+}
+
+#define bswap_if_needed(elf, val)					\
 ({									\
 	__typeof__(val) __ret;						\
+	bool __need_bswap = need_bswap(elf);				\
 	switch (sizeof(val)) {						\
-	case 8: __ret = __NEED_BSWAP ? bswap_64(val) : (val); break;	\
-	case 4: __ret = __NEED_BSWAP ? bswap_32(val) : (val); break;	\
-	case 2: __ret = __NEED_BSWAP ? bswap_16(val) : (val); break;	\
+	case 8: __ret = __need_bswap ? bswap_64(val) : (val); break;	\
+	case 4: __ret = __need_bswap ? bswap_32(val) : (val); break;	\
+	case 2: __ret = __need_bswap ? bswap_16(val) : (val); break;	\
 	default:							\
 		BUILD_BUG(); break;					\
 	}								\
diff --git a/tools/objtool/orc_dump.c b/tools/objtool/orc_dump.c
index f5a8508c42d6..4f1211fec82c 100644
--- a/tools/objtool/orc_dump.c
+++ b/tools/objtool/orc_dump.c
@@ -76,6 +76,7 @@ int orc_dump(const char *_objname)
 	GElf_Rela rela;
 	GElf_Sym sym;
 	Elf_Data *data, *symtab = NULL, *rela_orc_ip = NULL;
+	struct elf dummy_elf = {};
 
 
 	objname = _objname;
@@ -94,6 +95,12 @@ int orc_dump(const char *_objname)
 		return -1;
 	}
 
+	if (!elf64_getehdr(elf)) {
+		WARN_ELF("elf64_getehdr");
+		return -1;
+	}
+	memcpy(&dummy_elf.ehdr, elf64_getehdr(elf), sizeof(dummy_elf.ehdr));
+
 	if (elf_getshdrnum(elf, &nr_sections)) {
 		WARN_ELF("elf_getshdrnum");
 		return -1;
@@ -198,11 +205,11 @@ int orc_dump(const char *_objname)
 
 		printf(" sp:");
 
-		print_reg(orc[i].sp_reg, bswap_if_needed(orc[i].sp_offset));
+		print_reg(orc[i].sp_reg, bswap_if_needed(&dummy_elf, orc[i].sp_offset));
 
 		printf(" bp:");
 
-		print_reg(orc[i].bp_reg, bswap_if_needed(orc[i].bp_offset));
+		print_reg(orc[i].bp_reg, bswap_if_needed(&dummy_elf, orc[i].bp_offset));
 
 		printf(" type:%s end:%d\n",
 		       orc_type_name(orc[i].type), orc[i].end);
diff --git a/tools/objtool/orc_gen.c b/tools/objtool/orc_gen.c
index dd3c64af9db2..1f22b7ebae58 100644
--- a/tools/objtool/orc_gen.c
+++ b/tools/objtool/orc_gen.c
@@ -97,8 +97,8 @@ static int write_orc_entry(struct elf *elf, struct section *orc_sec,
 	/* populate ORC data */
 	orc = (struct orc_entry *)orc_sec->data->d_buf + idx;
 	memcpy(orc, o, sizeof(*orc));
-	orc->sp_offset = bswap_if_needed(orc->sp_offset);
-	orc->bp_offset = bswap_if_needed(orc->bp_offset);
+	orc->sp_offset = bswap_if_needed(elf, orc->sp_offset);
+	orc->bp_offset = bswap_if_needed(elf, orc->bp_offset);
 
 	/* populate reloc for ip */
 	if (elf_add_reloc_to_insn(elf, ip_sec, idx * sizeof(int), R_X86_64_PC32,
diff --git a/tools/objtool/special.c b/tools/objtool/special.c
index e2223dd91c37..9c8d827f69af 100644
--- a/tools/objtool/special.c
+++ b/tools/objtool/special.c
@@ -87,7 +87,8 @@ static int get_alt_entry(struct elf *elf, struct special_entry *entry,
 	if (entry->feature) {
 		unsigned short feature;
 
-		feature = bswap_if_needed(*(unsigned short *)(sec->data->d_buf +
+		feature = bswap_if_needed(elf,
+					  *(unsigned short *)(sec->data->d_buf +
 							      offset +
 							      entry->feature));
 		arch_handle_alternative(feature, alt);
-- 
2.35.1

