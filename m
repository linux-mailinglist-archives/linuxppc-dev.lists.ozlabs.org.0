Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DCF555019
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 17:54:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSnxY02wJz3f13
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 01:54:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=chenzhongjin@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSnw368Wkz3bhm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 01:52:49 +1000 (AEST)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LSnsy1QBQzkWNh;
	Wed, 22 Jun 2022 23:51:02 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 22 Jun 2022 23:52:43 +0800
Received: from ubuntu1804.huawei.com (10.67.175.36) by
 dggpemm500013.china.huawei.com (7.185.36.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 22 Jun 2022 23:52:43 +0800
From: Chen Zhongjin <chenzhongjin@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kbuild@vger.kernel.org>, <live-patching@vger.kernel.org>
Subject: [PATCH v5 09/33] objtool: check: Support data in text section
Date: Wed, 22 Jun 2022 23:48:56 +0800
Message-ID: <20220622154920.95075-10-chenzhongjin@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220622154920.95075-1-chenzhongjin@huawei.com>
References: <20220622154920.95075-1-chenzhongjin@huawei.com>
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
Cc: mark.rutland@arm.com, madvenka@linux.microsoft.com, michal.lkml@markovi.net, pasha.tatashin@soleen.com, peterz@infradead.org, catalin.marinas@arm.com, masahiroy@kernel.org, ndesaulniers@google.com, chenzhongjin@huawei.com, rmk+kernel@armlinux.org.uk, broonie@kernel.org, will@kernel.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arm64 assembly code can mix code and data in text sections through the use
of SYM_DATA_*() macros. Skip the content of these symbols when decoding
instructions of text sections.

Signed-off-by: Julien Thierry <jthierry@redhat.com>
Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
---
 tools/objtool/check.c               | 13 +++++++++++--
 tools/objtool/elf.c                 | 14 ++++++++++++++
 tools/objtool/include/objtool/elf.h |  1 +
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index c0feb6db7c6d..77911ca9cfff 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -359,7 +359,7 @@ static int decode_instructions(struct objtool_file *file)
 {
 	struct section *sec;
 	struct symbol *func;
-	unsigned long offset;
+	unsigned long offset, next_offset;
 	struct instruction *insn;
 	int ret;
 
@@ -377,7 +377,14 @@ static int decode_instructions(struct objtool_file *file)
 		    !strcmp(sec->name, ".entry.text"))
 			sec->noinstr = true;
 
-		for (offset = 0; offset < sec->sh.sh_size; offset += insn->len) {
+		for (offset = 0; offset < sec->sh.sh_size; offset = next_offset) {
+			struct symbol *obj_sym = find_object_containing(sec, offset);
+			if (obj_sym) {
+				/* This is data in the middle of text section, skip it */
+				next_offset = obj_sym->offset + obj_sym->len;
+				continue;
+			}
+
 			insn = malloc(sizeof(*insn));
 			if (!insn) {
 				WARN("malloc failed");
@@ -410,6 +417,8 @@ static int decode_instructions(struct objtool_file *file)
 			hash_add(file->insn_hash, &insn->hash, sec_offset_hash(sec, insn->offset));
 			list_add_tail(&insn->list, &file->insn_list);
 			nr_insns++;
+
+			next_offset = offset + insn->len;
 		}
 
 		list_for_each_entry(func, &sec->symbol_list, list) {
diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index c25e957c1e52..d7304e39f6b6 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -236,6 +236,20 @@ struct symbol *find_func_containing(struct section *sec, unsigned long offset)
 	return NULL;
 }
 
+struct symbol *find_object_containing(const struct section *sec, unsigned long offset)
+{
+	struct rb_node *node;
+
+	rb_for_each(node, &offset, &sec->symbol_tree, symbol_by_offset) {
+		struct symbol *s = rb_entry(node, struct symbol, node);
+
+		if (s->type == STT_OBJECT)
+			return s;
+	}
+
+	return NULL;
+}
+
 struct symbol *find_symbol_by_name(const struct elf *elf, const char *name)
 {
 	struct symbol *sym;
diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
index adebfbc2b518..8b0896935af1 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -167,6 +167,7 @@ struct reloc *find_reloc_by_dest(const struct elf *elf, struct section *sec, uns
 struct reloc *find_reloc_by_dest_range(const struct elf *elf, struct section *sec,
 				     unsigned long offset, unsigned int len);
 struct symbol *find_func_containing(struct section *sec, unsigned long offset);
+struct symbol *find_object_containing(const struct section *sec, unsigned long offset);
 
 #define for_each_sec(file, sec)						\
 	list_for_each_entry(sec, &file->elf->sections, list)
-- 
2.17.1

