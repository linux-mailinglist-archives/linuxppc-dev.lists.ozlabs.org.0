Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD7155705C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 03:53:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LT3F272tmz3f6s
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 11:53:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=chenzhongjin@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LT3CC1lBqz3bq3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 11:51:50 +1000 (AEST)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LT37B3vwjzSh5T;
	Thu, 23 Jun 2022 09:48:22 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 23 Jun 2022 09:51:47 +0800
Received: from ubuntu1804.huawei.com (10.67.175.36) by
 dggpemm500013.china.huawei.com (7.185.36.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 23 Jun 2022 09:51:47 +0800
From: Chen Zhongjin <chenzhongjin@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kbuild@vger.kernel.org>, <live-patching@vger.kernel.org>
Subject: [PATCH v6 07/33] objtool: arm64: Decode LDR instructions
Date: Thu, 23 Jun 2022 09:48:51 +0800
Message-ID: <20220623014917.199563-8-chenzhongjin@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220623014917.199563-1-chenzhongjin@huawei.com>
References: <20220623014917.199563-1-chenzhongjin@huawei.com>
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
Cc: mark.rutland@arm.com, madvenka@linux.microsoft.com, daniel.thompson@linaro.org, michal.lkml@markovi.net, pasha.tatashin@soleen.com, peterz@infradead.org, catalin.marinas@arm.com, masahiroy@kernel.org, ndesaulniers@google.com, chenzhongjin@huawei.com, rmk+kernel@armlinux.org.uk, broonie@kernel.org, will@kernel.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Load literal instructions can generate constants inside code sections.
Record the locations of the constants in order to be able to remove
their corresponding "struct instruction".

Signed-off-by: Julien Thierry <jthierry@redhat.com>
Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
---
 tools/objtool/arch/arm64/decode.c    | 88 +++++++++++++++++++++++++++-
 tools/objtool/arch/x86/decode.c      |  5 ++
 tools/objtool/check.c                |  3 +
 tools/objtool/include/objtool/arch.h |  2 +
 4 files changed, 97 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/arch/arm64/decode.c b/tools/objtool/arch/arm64/decode.c
index 8ce9d91ff0db..30300d05c8f3 100644
--- a/tools/objtool/arch/arm64/decode.c
+++ b/tools/objtool/arch/arm64/decode.c
@@ -31,6 +31,64 @@ static unsigned long sign_extend(unsigned long x, int nbits)
 	return ((~0UL + (sign_bit ^ 1)) << nbits) | x;
 }
 
+struct insn_loc {
+	const struct section *sec;
+	unsigned long offset;
+	struct hlist_node hnode;
+};
+
+DEFINE_HASHTABLE(invalid_insns, 16);
+
+static int record_invalid_insn(const struct section *sec,
+			       unsigned long offset)
+{
+	struct insn_loc *loc;
+	struct hlist_head *l;
+
+	l = &invalid_insns[hash_min(offset, HASH_BITS(invalid_insns))];
+	if (!hlist_empty(l)) {
+		loc = hlist_entry(l->first, struct insn_loc, hnode);
+		return 0;
+	}
+
+	loc = malloc(sizeof(*loc));
+	if (!loc) {
+		WARN("malloc failed");
+		return -1;
+	}
+
+	loc->sec = sec;
+	loc->offset = offset;
+
+	hash_add(invalid_insns, &loc->hnode, loc->offset);
+
+	return 0;
+}
+
+int arch_post_process_instructions(struct objtool_file *file)
+{
+	struct hlist_node *tmp;
+	struct insn_loc *loc;
+	unsigned int bkt;
+	int res = 0;
+
+	hash_for_each_safe(invalid_insns, bkt, tmp, loc, hnode) {
+		struct instruction *insn;
+
+		insn = find_insn(file, (struct section *) loc->sec, loc->offset);
+		if (insn) {
+			list_del(&insn->list);
+			hash_del(&insn->hash);
+			free(insn);
+		}
+
+		hash_del(&loc->hnode);
+		free(loc);
+	}
+
+	return res;
+}
+
 bool arch_callee_saved_reg(unsigned char reg)
 {
 	switch (reg) {
@@ -351,7 +409,35 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 		break;
 	case AARCH64_INSN_CLS_LDST:
 	{
-		return decode_load_store(insn, immediate, ops_list);
+		int ret;
+
+		ret = decode_load_store(insn, immediate, ops_list);
+		if (ret <= 0)
+			return ret;
+
+		/*
+		 * For LDR ops, assembler can generate the data to be
+		 * loaded in the code section
+		 * Record and remove these data because they
+		 * are never excuted
+		 */
+		if (aarch64_insn_is_ldr_lit(insn)) {
+			long pc_offset;
+
+			pc_offset = insn & GENMASK(23, 5);
+			/* Sign extend and multiply by 4 */
+			pc_offset = (pc_offset << (64 - 23));
+			pc_offset = ((pc_offset >> (64 - 23)) >> 5) << 2;
+
+			ret = record_invalid_insn(sec, offset + pc_offset);
+
+			/* 64-bit literal */
+			if (insn & BIT(30))
+				ret = record_invalid_insn(sec, offset + pc_offset + 4);
+
+			return ret;
+		}
+		break;
 	}
 	default:
 		break;
diff --git a/tools/objtool/arch/x86/decode.c b/tools/objtool/arch/x86/decode.c
index 8b990a52aada..081b5e72f8df 100644
--- a/tools/objtool/arch/x86/decode.c
+++ b/tools/objtool/arch/x86/decode.c
@@ -693,6 +693,11 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 	return 0;
 }
 
+int arch_post_process_instructions(struct objtool_file *file)
+{
+	return 0;
+}
+
 void arch_initial_func_cfi_state(struct cfi_init_state *state)
 {
 	int i;
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 35d0a1bc4279..c0feb6db7c6d 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -439,6 +439,9 @@ static int decode_instructions(struct objtool_file *file)
 	if (opts.stats)
 		printf("nr_insns: %lu\n", nr_insns);
 
+	if (arch_post_process_instructions(file))
+		return -1;
+
 	return 0;
 
 err:
diff --git a/tools/objtool/include/objtool/arch.h b/tools/objtool/include/objtool/arch.h
index 9b19cc304195..651262af2655 100644
--- a/tools/objtool/include/objtool/arch.h
+++ b/tools/objtool/include/objtool/arch.h
@@ -77,6 +77,8 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 			    unsigned long *immediate,
 			    struct list_head *ops_list);
 
+int arch_post_process_instructions(struct objtool_file *file);
+
 bool arch_callee_saved_reg(unsigned char reg);
 
 unsigned long arch_jump_destination(struct instruction *insn);
-- 
2.17.1

