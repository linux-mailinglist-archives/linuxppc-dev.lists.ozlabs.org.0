Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E9D5570DC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 04:04:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LT3Tl6lw0z3gm1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 12:04:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=chenzhongjin@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LT3DN5rzyz3f13
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 11:52:52 +1000 (AEST)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LT39p1QfDzkWk6;
	Thu, 23 Jun 2022 09:50:38 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 23 Jun 2022 09:51:51 +0800
Received: from ubuntu1804.huawei.com (10.67.175.36) by
 dggpemm500013.china.huawei.com (7.185.36.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 23 Jun 2022 09:51:51 +0800
From: Chen Zhongjin <chenzhongjin@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kbuild@vger.kernel.org>, <live-patching@vger.kernel.org>
Subject: [PATCH v6 27/33] arm64: Set intra-function call annotations
Date: Thu, 23 Jun 2022 09:49:11 +0800
Message-ID: <20220623014917.199563-28-chenzhongjin@huawei.com>
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

Stack validation requires BL instructions to an address,
within the symbol containing the BL should be annotated as intra-function
calls.

Make __pmull_p8_core normally set frame because there's a intra-function
call destinating middle of it and the caller have set the frame. When
analyzing the insns there will be a cfi state mismatch between normal-call
and intra-call.

Signed-off-by: Julien Thierry <jthierry@redhat.com>
Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
---
 arch/arm64/crypto/crct10dif-ce-core.S | 5 +++++
 arch/arm64/kernel/entry.S             | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/arch/arm64/crypto/crct10dif-ce-core.S b/arch/arm64/crypto/crct10dif-ce-core.S
index dce6dcebfca1..b3b8e56cb87d 100644
--- a/arch/arm64/crypto/crct10dif-ce-core.S
+++ b/arch/arm64/crypto/crct10dif-ce-core.S
@@ -63,6 +63,7 @@
 //
 
 #include <linux/linkage.h>
+#include <linux/objtool.h>
 #include <asm/assembler.h>
 
 	.text
@@ -132,6 +133,8 @@
 	.endm
 
 SYM_FUNC_START_LOCAL(__pmull_p8_core)
+	stp		x29, x30, [sp, #-16]!
+	mov		x29, sp
 .L__pmull_p8_core:
 	ext		t4.8b, ad.8b, ad.8b, #1			// A1
 	ext		t5.8b, ad.8b, ad.8b, #2			// A2
@@ -193,6 +196,7 @@ SYM_FUNC_START_LOCAL(__pmull_p8_core)
 
 	eor		t4.16b, t4.16b, t5.16b
 	eor		t6.16b, t6.16b, t3.16b
+	ldp		x29, x30, [sp], #16
 	ret
 SYM_FUNC_END(__pmull_p8_core)
 
@@ -207,6 +211,7 @@ SYM_FUNC_END(__pmull_p8_core)
 	pmull2		\rq\().8h, \ad\().16b, \bd\().16b	// D = A*B
 	.endif
 
+	ANNOTATE_INTRA_FUNCTION_CALL
 	bl		.L__pmull_p8_core\i
 
 	eor		\rq\().16b, \rq\().16b, t4.16b
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index bbc440379304..d49bfbe81a0d 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -10,6 +10,7 @@
 #include <linux/arm-smccc.h>
 #include <linux/init.h>
 #include <linux/linkage.h>
+#include <linux/objtool.h>
 
 #include <asm/alternative.h>
 #include <asm/assembler.h>
@@ -694,6 +695,7 @@ alternative_else_nop_endif
 	 * entry onto the return stack and using a RET instruction to
 	 * enter the full-fat kernel vectors.
 	 */
+	ANNOTATE_INTRA_FUNCTION_CALL
 	bl	2f
 	UNWIND_HINT_EMPTY
 	b	.
-- 
2.17.1

