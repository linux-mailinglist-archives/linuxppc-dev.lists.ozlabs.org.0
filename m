Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7474C536B22
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 08:30:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9Bd630cBz3cBV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 16:30:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9Bbr3ZHWz2ync
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 16:29:41 +1000 (AEST)
Received: from kwepemi100010.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L9BX92cMNzRhVV;
	Sat, 28 May 2022 14:26:33 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi100010.china.huawei.com (7.221.188.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 28 May 2022 14:29:36 +0800
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 28 May 2022 14:29:34 +0800
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
Subject: [PATCH -next v5 7/8] arm64: add uaccess to machine check safe
Date: Sat, 28 May 2022 06:50:55 +0000
Message-ID: <20220528065056.1034168-8-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220528065056.1034168-1-tongtiangen@huawei.com>
References: <20220528065056.1034168-1-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
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

If user access fail due to hardware memory error, only the relevant
processes are affected, so killing the user process and isolate the
error page with hardware memory errors is a more reasonable choice
than kernel panic.

Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
---
 arch/arm64/lib/copy_from_user.S | 8 ++++----
 arch/arm64/lib/copy_to_user.S   | 8 ++++----
 arch/arm64/mm/extable.c         | 8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/lib/copy_from_user.S b/arch/arm64/lib/copy_from_user.S
index 34e317907524..402dd48a4f93 100644
--- a/arch/arm64/lib/copy_from_user.S
+++ b/arch/arm64/lib/copy_from_user.S
@@ -25,7 +25,7 @@
 	.endm
 
 	.macro strb1 reg, ptr, val
-	strb \reg, [\ptr], \val
+	USER(9998f, strb \reg, [\ptr], \val)
 	.endm
 
 	.macro ldrh1 reg, ptr, val
@@ -33,7 +33,7 @@
 	.endm
 
 	.macro strh1 reg, ptr, val
-	strh \reg, [\ptr], \val
+	USER(9998f, strh \reg, [\ptr], \val)
 	.endm
 
 	.macro ldr1 reg, ptr, val
@@ -41,7 +41,7 @@
 	.endm
 
 	.macro str1 reg, ptr, val
-	str \reg, [\ptr], \val
+	USER(9998f, str \reg, [\ptr], \val)
 	.endm
 
 	.macro ldp1 reg1, reg2, ptr, val
@@ -49,7 +49,7 @@
 	.endm
 
 	.macro stp1 reg1, reg2, ptr, val
-	stp \reg1, \reg2, [\ptr], \val
+	USER(9998f, stp \reg1, \reg2, [\ptr], \val)
 	.endm
 
 end	.req	x5
diff --git a/arch/arm64/lib/copy_to_user.S b/arch/arm64/lib/copy_to_user.S
index 802231772608..4134bdb3a8b0 100644
--- a/arch/arm64/lib/copy_to_user.S
+++ b/arch/arm64/lib/copy_to_user.S
@@ -20,7 +20,7 @@
  *	x0 - bytes not copied
  */
 	.macro ldrb1 reg, ptr, val
-	ldrb  \reg, [\ptr], \val
+	USER(9998f, ldrb  \reg, [\ptr], \val)
 	.endm
 
 	.macro strb1 reg, ptr, val
@@ -28,7 +28,7 @@
 	.endm
 
 	.macro ldrh1 reg, ptr, val
-	ldrh  \reg, [\ptr], \val
+	USER(9998f, ldrh  \reg, [\ptr], \val)
 	.endm
 
 	.macro strh1 reg, ptr, val
@@ -36,7 +36,7 @@
 	.endm
 
 	.macro ldr1 reg, ptr, val
-	ldr \reg, [\ptr], \val
+	USER(9998f, ldr \reg, [\ptr], \val)
 	.endm
 
 	.macro str1 reg, ptr, val
@@ -44,7 +44,7 @@
 	.endm
 
 	.macro ldp1 reg1, reg2, ptr, val
-	ldp \reg1, \reg2, [\ptr], \val
+	USER(9998f, ldp \reg1, \reg2, [\ptr], \val)
 	.endm
 
 	.macro stp1 reg1, reg2, ptr, val
diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
index c301dcf6335f..8ca8d9639f9f 100644
--- a/arch/arm64/mm/extable.c
+++ b/arch/arm64/mm/extable.c
@@ -86,10 +86,10 @@ bool fixup_exception_mc(struct pt_regs *regs)
 	if (!ex)
 		return false;
 
-	/*
-	 * This is not complete, More Machine check safe extable type can
-	 * be processed here.
-	 */
+	switch (ex->type) {
+	case EX_TYPE_UACCESS_ERR_ZERO:
+		return ex_handler_uaccess_err_zero(ex, regs);
+	}
 
 	return false;
 }
-- 
2.25.1

