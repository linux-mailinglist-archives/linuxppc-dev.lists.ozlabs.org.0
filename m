Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8627A55500D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 17:53:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSnwn3QzFz3drq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 01:53:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=chenzhongjin@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSnw402Smz3bmY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 01:52:50 +1000 (AEST)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LSnqy1ptczSgwk;
	Wed, 22 Jun 2022 23:49:18 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 22 Jun 2022 23:52:42 +0800
Received: from ubuntu1804.huawei.com (10.67.175.36) by
 dggpemm500013.china.huawei.com (7.185.36.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 22 Jun 2022 23:52:42 +0800
From: Chen Zhongjin <chenzhongjin@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kbuild@vger.kernel.org>, <live-patching@vger.kernel.org>
Subject: [PATCH v5 04/33] objtool: arm64: Decode jump and call related instructions
Date: Wed, 22 Jun 2022 23:48:51 +0800
Message-ID: <20220622154920.95075-5-chenzhongjin@huawei.com>
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

Decode branch, branch and link (aarch64's call) and return instructions.

Signed-off-by: Julien Thierry <jthierry@redhat.com>
Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
---
 tools/objtool/arch/arm64/decode.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/objtool/arch/arm64/decode.c b/tools/objtool/arch/arm64/decode.c
index d8c32703874d..40ada17d0842 100644
--- a/tools/objtool/arch/arm64/decode.c
+++ b/tools/objtool/arch/arm64/decode.c
@@ -212,6 +212,27 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 			}
 		}
 		break;
+	case AARCH64_INSN_CLS_BR_SYS:
+		if (aarch64_insn_is_ret(insn) &&
+		    aarch64_insn_decode_register(AARCH64_INSN_REGTYPE_RN, insn)
+			== AARCH64_INSN_REG_LR) {
+			*type = INSN_RETURN;
+		} else if (aarch64_insn_is_bl(insn)) {
+			*type = INSN_CALL;
+			*immediate = aarch64_get_branch_offset(insn);
+		} else if (aarch64_insn_is_blr(insn)) {
+			*type = INSN_CALL_DYNAMIC;
+		} else if (aarch64_insn_is_b(insn)) {
+			*type = INSN_JUMP_UNCONDITIONAL;
+			*immediate = aarch64_get_branch_offset(insn);
+		} else if (aarch64_insn_is_br(insn)) {
+			*type = INSN_JUMP_DYNAMIC;
+		} else if (aarch64_insn_is_branch_imm(insn)) {
+			/* Remaining branch opcodes are conditional */
+			*type = INSN_JUMP_CONDITIONAL;
+			*immediate = aarch64_get_branch_offset(insn);
+		}
+		break;
 	default:
 		break;
 	}
-- 
2.17.1

