Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A8755702B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 03:52:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LT3Cr6Ryqz3cC4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 11:52:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=chenzhongjin@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LT3CB34qqz3bkG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 11:51:50 +1000 (AEST)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LT3795CDXzShBh;
	Thu, 23 Jun 2022 09:48:21 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 23 Jun 2022 09:51:46 +0800
Received: from ubuntu1804.huawei.com (10.67.175.36) by
 dggpemm500013.china.huawei.com (7.185.36.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 23 Jun 2022 09:51:46 +0800
From: Chen Zhongjin <chenzhongjin@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kbuild@vger.kernel.org>, <live-patching@vger.kernel.org>
Subject: [PATCH v6 03/33] objtool: arm64: Decode add/sub instructions
Date: Thu, 23 Jun 2022 09:48:47 +0800
Message-ID: <20220623014917.199563-4-chenzhongjin@huawei.com>
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

Decode aarch64 additions and substractions and create stack_ops for
instructions interacting with SP or FP.

Signed-off-by: Julien Thierry <jthierry@redhat.com>
Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
---
 tools/objtool/arch/arm64/decode.c | 82 +++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/tools/objtool/arch/arm64/decode.c b/tools/objtool/arch/arm64/decode.c
index afe22c4593c8..d8c32703874d 100644
--- a/tools/objtool/arch/arm64/decode.c
+++ b/tools/objtool/arch/arm64/decode.c
@@ -15,6 +15,22 @@
 
 #include "../../../arch/arm64/lib/insn.c"
 
+#define is_SP(reg)		(reg == AARCH64_INSN_REG_SP)
+#define is_FP(reg)		(reg == AARCH64_INSN_REG_FP)
+#define is_SPFP(reg)	(reg == AARCH64_INSN_REG_SP || reg == AARCH64_INSN_REG_FP)
+
+#define ADD_OP(op) \
+	if (!(op = calloc(1, sizeof(*op)))) \
+		return -1; \
+	else for (list_add_tail(&op->list, ops_list); op; op = NULL)
+
+static unsigned long sign_extend(unsigned long x, int nbits)
+{
+	unsigned long sign_bit = (x >> (nbits - 1)) & 1;
+
+	return ((~0UL + (sign_bit ^ 1)) << nbits) | x;
+}
+
 bool arch_callee_saved_reg(unsigned char reg)
 {
 	switch (reg) {
@@ -105,6 +121,42 @@ int arch_decode_hint_reg(u8 sp_reg, int *base)
 	return -1;
 }
 
+static inline void make_add_op(enum aarch64_insn_register dest,
+					enum aarch64_insn_register src,
+					int val, struct stack_op *op)
+{
+	op->dest.type = OP_DEST_REG;
+	op->dest.reg = dest;
+	op->src.reg = src;
+	op->src.type = val != 0 ? OP_SRC_ADD : OP_SRC_REG;
+	op->src.offset = val;
+}
+
+static void decode_add_sub_imm(u32 instr, bool set_flags,
+				  unsigned long *immediate,
+				  struct stack_op *op)
+{
+	u32 rd = aarch64_insn_decode_register(AARCH64_INSN_REGTYPE_RD, instr);
+	u32 rn = aarch64_insn_decode_register(AARCH64_INSN_REGTYPE_RN, instr);
+
+	*immediate = aarch64_insn_decode_immediate(AARCH64_INSN_IMM_12, instr);
+
+	if (instr & AARCH64_INSN_LSL_12)
+		*immediate <<= 12;
+
+	if ((!set_flags && is_SP(rd)) || is_FP(rd)
+			|| is_SPFP(rn)) {
+		int value;
+
+		if (aarch64_insn_is_subs_imm(instr) || aarch64_insn_is_sub_imm(instr))
+			value = -*immediate;
+		else
+			value = *immediate;
+
+		make_add_op(rd, rn, value, op);
+	}
+}
+
 int arch_decode_instruction(struct objtool_file *file, const struct section *sec,
 			    unsigned long offset, unsigned int maxlen,
 			    unsigned int *len, enum insn_type *type,
@@ -112,6 +164,7 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 			    struct list_head *ops_list)
 {
 	const struct elf *elf = file->elf;
+	struct stack_op *op = NULL;
 	u32 insn;
 
 	if (!is_arm64(elf))
@@ -130,6 +183,35 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 	case AARCH64_INSN_CLS_UNKNOWN:
 		WARN("can't decode instruction at %s:0x%lx", sec->name, offset);
 		return -1;
+	case AARCH64_INSN_CLS_DP_IMM:
+		/* Mov register to and from SP are aliases of add_imm */
+		if (aarch64_insn_is_add_imm(insn) ||
+		    aarch64_insn_is_sub_imm(insn)) {
+			ADD_OP(op) {
+				decode_add_sub_imm(insn, false, immediate, op);
+			}
+		}
+		else if (aarch64_insn_is_adds_imm(insn) ||
+			     aarch64_insn_is_subs_imm(insn)) {
+			ADD_OP(op) {
+				decode_add_sub_imm(insn, true, immediate, op);
+			}
+		}
+		break;
+	case AARCH64_INSN_CLS_DP_REG:
+		if (aarch64_insn_is_mov_reg(insn)) {
+			enum aarch64_insn_register rd;
+			enum aarch64_insn_register rm;
+
+			rd = aarch64_insn_decode_register(AARCH64_INSN_REGTYPE_RD, insn);
+			rm = aarch64_insn_decode_register(AARCH64_INSN_REGTYPE_RM, insn);
+			if (is_FP(rd) || is_FP(rm)) {
+				ADD_OP(op) {
+					make_add_op(rd, rm, 0, op);
+				}
+			}
+		}
+		break;
 	default:
 		break;
 	}
-- 
2.17.1

