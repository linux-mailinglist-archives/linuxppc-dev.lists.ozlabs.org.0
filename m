Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEA5552BFE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 09:29:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRynZ3b4qz3f7w
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 17:29:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRyln3ChQz3dqK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 17:27:49 +1000 (AEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LRygp00QvzSh50;
	Tue, 21 Jun 2022 15:24:21 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 21 Jun 2022 15:26:55 +0800
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 21 Jun 2022 15:26:53 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Mark Rutland <mark.rutland@arm.com>, James Morse <james.morse@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Robin Murphy <robin.murphy@arm.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
Subject: [PATCH -next v6 04/10] arm64: extable: make uaaccess helper use extable type EX_TYPE_UACCESS_ERR_ZERO
Date: Tue, 21 Jun 2022 07:26:32 +0000
Message-ID: <20220621072638.1273594-5-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220621072638.1273594-1-tongtiangen@huawei.com>
References: <20220621072638.1273594-1-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600017.china.huawei.com (7.193.23.234)
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Xie XiuQi <xiexiuqi@huawei.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Tong Tiangen <tongtiangen@huawei.com>, Guohanjun <guohanjun@huawei.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currnetly, the extable type used by __arch_copy_from/to_user() is
EX_TYPE_FIXUP. In fact, It is more clearly to use meaningful
EX_TYPE_UACCESS_*.

Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
---
 arch/arm64/include/asm/asm-extable.h |  8 ++++++++
 arch/arm64/include/asm/asm-uaccess.h | 12 ++++++------
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/asm-extable.h b/arch/arm64/include/asm/asm-extable.h
index 2e1e6bc33bcd..73266553f8a2 100644
--- a/arch/arm64/include/asm/asm-extable.h
+++ b/arch/arm64/include/asm/asm-extable.h
@@ -63,6 +63,14 @@
 	_ASM_EXTABLE(\insn, \fixup)
 	.endm
 
+/*
+ * Create an exception table entry for uaccess `insn`, which will branch to `fixup`
+ * when an unhandled fault is taken.
+ */
+	.macro          _asm_extable_uaccess, insn, fixup
+	_ASM_EXTABLE_UACCESS(\insn, \fixup)
+	.endm
+
 /*
  * Create an exception table entry for `insn` if `fixup` is provided. Otherwise
  * do nothing.
diff --git a/arch/arm64/include/asm/asm-uaccess.h b/arch/arm64/include/asm/asm-uaccess.h
index 0557af834e03..75b211c98dea 100644
--- a/arch/arm64/include/asm/asm-uaccess.h
+++ b/arch/arm64/include/asm/asm-uaccess.h
@@ -61,7 +61,7 @@ alternative_else_nop_endif
 
 #define USER(l, x...)				\
 9999:	x;					\
-	_asm_extable	9999b, l
+	_asm_extable_uaccess	9999b, l
 
 /*
  * Generate the assembly for LDTR/STTR with exception table entries.
@@ -73,8 +73,8 @@ alternative_else_nop_endif
 8889:		ldtr	\reg2, [\addr, #8];
 		add	\addr, \addr, \post_inc;
 
-		_asm_extable	8888b,\l;
-		_asm_extable	8889b,\l;
+		_asm_extable_uaccess	8888b, \l;
+		_asm_extable_uaccess	8889b, \l;
 	.endm
 
 	.macro user_stp l, reg1, reg2, addr, post_inc
@@ -82,14 +82,14 @@ alternative_else_nop_endif
 8889:		sttr	\reg2, [\addr, #8];
 		add	\addr, \addr, \post_inc;
 
-		_asm_extable	8888b,\l;
-		_asm_extable	8889b,\l;
+		_asm_extable_uaccess	8888b,\l;
+		_asm_extable_uaccess	8889b,\l;
 	.endm
 
 	.macro user_ldst l, inst, reg, addr, post_inc
 8888:		\inst		\reg, [\addr];
 		add		\addr, \addr, \post_inc;
 
-		_asm_extable	8888b,\l;
+		_asm_extable_uaccess	8888b, \l;
 	.endm
 #endif
-- 
2.25.1

