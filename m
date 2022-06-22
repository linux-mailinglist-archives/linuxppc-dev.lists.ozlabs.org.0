Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F23C554533
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 12:18:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSfV93RxLz3fBj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 20:18:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=chenzhongjin@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSfS04d0xz3cfF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 20:16:32 +1000 (AEST)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LSfNs2DBVzhXZY;
	Wed, 22 Jun 2022 18:13:49 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 22 Jun 2022 18:15:56 +0800
Received: from ubuntu1804.huawei.com (10.67.175.36) by
 dggpemm500013.china.huawei.com (7.185.36.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 22 Jun 2022 18:15:56 +0800
From: Chen Zhongjin <chenzhongjin@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<jpoimboe@kernel.org>, <peterz@infradead.org>
Subject: [PATCH v2 3/5] objtool: Add generic symbol for relocation type
Date: Wed, 22 Jun 2022 18:13:42 +0800
Message-ID: <20220622101344.38002-4-chenzhongjin@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220622101344.38002-1-chenzhongjin@huawei.com>
References: <20220622101344.38002-1-chenzhongjin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.36]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
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
Cc: x86@kernel.org, arnd@arndb.de, dave.hansen@linux.intel.com, mingo@redhat.com, hpa@zytor.com, tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

objtool uses R_X86_64_X as relocation type. Add abstraction
for them so that other architectures can use its own reloc enums.

Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
---
 tools/objtool/arch/x86/include/arch/elf.h |  5 ++++-
 tools/objtool/arch/x86/special.c          |  5 +++--
 tools/objtool/check.c                     | 12 ++++++------
 tools/objtool/orc_gen.c                   |  3 ++-
 4 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/tools/objtool/arch/x86/include/arch/elf.h b/tools/objtool/arch/x86/include/arch/elf.h
index 69cc4264b28a..7b737fcfcb9c 100644
--- a/tools/objtool/arch/x86/include/arch/elf.h
+++ b/tools/objtool/arch/x86/include/arch/elf.h
@@ -1,6 +1,9 @@
 #ifndef _OBJTOOL_ARCH_ELF
 #define _OBJTOOL_ARCH_ELF
 
-#define R_NONE R_X86_64_NONE
+#define R_NONE	R_X86_64_NONE
+#define R_ABS64	R_X86_64_64
+#define R_REL32	R_X86_64_PC32
+#define R_PLT32	R_X86_64_PLT32
 
 #endif /* _OBJTOOL_ARCH_ELF */
diff --git a/tools/objtool/arch/x86/special.c b/tools/objtool/arch/x86/special.c
index 7c97b7391279..fbe0745a9ed7 100644
--- a/tools/objtool/arch/x86/special.c
+++ b/tools/objtool/arch/x86/special.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 #include <string.h>
 
+#include <arch/elf.h>
 #include <objtool/special.h>
 #include <objtool/builtin.h>
 
@@ -108,7 +109,7 @@ struct reloc *arch_find_switch_table(struct objtool_file *file,
 	table_offset = text_reloc->addend;
 	table_sec = text_reloc->sym->sec;
 
-	if (text_reloc->type == R_X86_64_PC32)
+	if (text_reloc->type == R_REL32)
 		table_offset += 4;
 
 	/*
@@ -138,7 +139,7 @@ struct reloc *arch_find_switch_table(struct objtool_file *file,
 	 * indicates a rare GCC quirk/bug which can leave dead
 	 * code behind.
 	 */
-	if (text_reloc->type == R_X86_64_PC32)
+	if (text_reloc->type == R_REL32)
 		file->ignore_unreachables = true;
 
 	return rodata_reloc;
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 190b2f6e360a..11ab13fd99fd 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -650,7 +650,7 @@ static int create_static_call_sections(struct objtool_file *file)
 		/* populate reloc for 'addr' */
 		if (elf_add_reloc_to_insn(file->elf, sec,
 					  idx * sizeof(struct static_call_site),
-					  R_X86_64_PC32,
+					  R_REL32,
 					  insn->sec, insn->offset))
 			return -1;
 
@@ -691,7 +691,7 @@ static int create_static_call_sections(struct objtool_file *file)
 		/* populate reloc for 'key' */
 		if (elf_add_reloc(file->elf, sec,
 				  idx * sizeof(struct static_call_site) + 4,
-				  R_X86_64_PC32, key_sym,
+				  R_REL32, key_sym,
 				  is_sibling_call(insn) * STATIC_CALL_SITE_TAIL))
 			return -1;
 
@@ -735,7 +735,7 @@ static int create_retpoline_sites_sections(struct objtool_file *file)
 
 		if (elf_add_reloc_to_insn(file->elf, sec,
 					  idx * sizeof(int),
-					  R_X86_64_PC32,
+					  R_REL32,
 					  insn->sec, insn->offset)) {
 			WARN("elf_add_reloc_to_insn: .retpoline_sites");
 			return -1;
@@ -787,7 +787,7 @@ static int create_ibt_endbr_seal_sections(struct objtool_file *file)
 
 		if (elf_add_reloc_to_insn(file->elf, sec,
 					  idx * sizeof(int),
-					  R_X86_64_PC32,
+					  R_REL32,
 					  insn->sec, insn->offset)) {
 			WARN("elf_add_reloc_to_insn: .ibt_endbr_seal");
 			return -1;
@@ -832,7 +832,7 @@ static int create_mcount_loc_sections(struct objtool_file *file)
 
 		if (elf_add_reloc_to_insn(file->elf, sec,
 					  idx * sizeof(unsigned long),
-					  R_X86_64_64,
+					  R_ABS64,
 					  insn->sec, insn->offset))
 			return -1;
 
@@ -3711,7 +3711,7 @@ static int validate_ibt_insn(struct objtool_file *file, struct instruction *insn
 			continue;
 
 		off = reloc->sym->offset;
-		if (reloc->type == R_X86_64_PC32 || reloc->type == R_X86_64_PLT32)
+		if (reloc->type == R_REL32 || reloc->type == R_PLT32)
 			off += arch_dest_reloc_offset(reloc->addend);
 		else
 			off += reloc->addend;
diff --git a/tools/objtool/orc_gen.c b/tools/objtool/orc_gen.c
index a7d060ba14d0..ab4dbfa52b1e 100644
--- a/tools/objtool/orc_gen.c
+++ b/tools/objtool/orc_gen.c
@@ -8,6 +8,7 @@
 
 #include <linux/objtool.h>
 
+#include <arch/elf.h>
 #include <objtool/check.h>
 #include <objtool/orc.h>
 #include <objtool/warn.h>
@@ -27,7 +28,7 @@ static int write_orc_entry(struct elf *elf, struct section *orc_sec,
 	orc->bp_offset = bswap_if_needed(orc->bp_offset);
 
 	/* populate reloc for ip */
-	if (elf_add_reloc_to_insn(elf, ip_sec, idx * sizeof(int), R_X86_64_PC32,
+	if (elf_add_reloc_to_insn(elf, ip_sec, idx * sizeof(int), R_REL32,
 				  insn_sec, insn_off))
 		return -1;
 
-- 
2.17.1

