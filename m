Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D06F5550AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 18:03:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSp8S23b1z3gwd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 02:03:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=chenzhongjin@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSnwb2qyBz3dnr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 01:53:19 +1000 (AEST)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LSnsR0dKlzhYWB;
	Wed, 22 Jun 2022 23:50:35 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
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
Subject: [PATCH v5 05/33] objtool: arm64: Decode other system instructions
Date: Wed, 22 Jun 2022 23:48:52 +0800
Message-ID: <20220622154920.95075-6-chenzhongjin@huawei.com>
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

Decode ERET, BRK and NOPs

Signed-off-by: Julien Thierry <jthierry@redhat.com>
Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
---
 tools/objtool/arch/arm64/decode.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/objtool/arch/arm64/decode.c b/tools/objtool/arch/arm64/decode.c
index 40ada17d0842..19840862f3aa 100644
--- a/tools/objtool/arch/arm64/decode.c
+++ b/tools/objtool/arch/arm64/decode.c
@@ -231,6 +231,14 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 			/* Remaining branch opcodes are conditional */
 			*type = INSN_JUMP_CONDITIONAL;
 			*immediate = aarch64_get_branch_offset(insn);
+		} else if (aarch64_insn_is_eret(insn)) {
+			*type = INSN_CONTEXT_SWITCH;
+		} else if (aarch64_insn_is_hint(insn) ||
+				   aarch64_insn_is_barrier(insn)) {
+			*type = INSN_NOP;
+		} else if (aarch64_insn_is_brk(insn)) {
+			*type = INSN_BUG;
+			*immediate = aarch64_insn_decode_immediate(AARCH64_INSN_IMM_16, insn);
 		}
 		break;
 	default:
-- 
2.17.1

