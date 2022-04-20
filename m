Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FC8508032
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 06:37:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjnwG47FNz3dvH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 14:37:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com;
 envelope-from=tongtiangen@huawei.com; receiver=<UNKNOWN>)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kjlt91Jg3z2yLg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Apr 2022 13:05:53 +1000 (AEST)
Received: from kwepemi500010.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KjlPy48wYz1J9nm;
 Wed, 20 Apr 2022 10:44:54 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi500010.china.huawei.com (7.221.188.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 20 Apr 2022 10:45:38 +0800
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 20 Apr 2022 10:45:37 +0800
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
Subject: [PATCH -next v4 4/7] arm64: add copy_{to,
 from}_user to machine check safe
Date: Wed, 20 Apr 2022 03:04:15 +0000
Message-ID: <20220420030418.3189040-5-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420030418.3189040-1-tongtiangen@huawei.com>
References: <20220420030418.3189040-1-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 20 Apr 2022 14:34:53 +1000
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Xie XiuQi <xiexiuqi@huawei.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Tong Tiangen <tongtiangen@huawei.com>, Guohanjun <guohanjun@huawei.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add copy_{to, from}_user() to machine check safe.

If copy fail due to hardware memory error, only the relevant processes are
affected, so killing the user process and isolate the user page with
hardware memory errors is a more reasonable choice than kernel panic.

Add new extable type EX_TYPE_UACCESS_MC which can be used for uaccess that
can be recovered from hardware memory errors.

The x16 register is used to save the fixup type in copy_xxx_user which
used extable type EX_TYPE_UACCESS_MC.

Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
---
 arch/arm64/include/asm/asm-extable.h | 14 ++++++++++++++
 arch/arm64/include/asm/asm-uaccess.h | 15 ++++++++++-----
 arch/arm64/lib/copy_from_user.S      | 18 +++++++++++-------
 arch/arm64/lib/copy_to_user.S        | 18 +++++++++++-------
 arch/arm64/mm/extable.c              | 18 ++++++++++++++----
 5 files changed, 60 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/include/asm/asm-extable.h b/arch/arm64/include/asm/asm-extable.h
index c39f2437e08e..75b2c00e9523 100644
--- a/arch/arm64/include/asm/asm-extable.h
+++ b/arch/arm64/include/asm/asm-extable.h
@@ -2,12 +2,18 @@
 #ifndef __ASM_ASM_EXTABLE_H
 #define __ASM_ASM_EXTABLE_H
 
+#define FIXUP_TYPE_NORMAL		0
+#define FIXUP_TYPE_MC			1
+
 #define EX_TYPE_NONE			0
 #define EX_TYPE_FIXUP			1
 #define EX_TYPE_BPF			2
 #define EX_TYPE_UACCESS_ERR_ZERO	3
 #define EX_TYPE_LOAD_UNALIGNED_ZEROPAD	4
 
+/* _MC indicates that can fixup from machine check errors */
+#define EX_TYPE_UACCESS_MC		5
+
 #ifdef __ASSEMBLY__
 
 #define __ASM_EXTABLE_RAW(insn, fixup, type, data)	\
@@ -27,6 +33,14 @@
 	__ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_FIXUP, 0)
 	.endm
 
+/*
+ * Create an exception table entry for `insn`, which will branch to `fixup`
+ * when an unhandled fault(include sea fault) is taken.
+ */
+	.macro          _asm_extable_uaccess_mc, insn, fixup
+	__ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_UACCESS_MC, 0)
+	.endm
+
 /*
  * Create an exception table entry for `insn` if `fixup` is provided. Otherwise
  * do nothing.
diff --git a/arch/arm64/include/asm/asm-uaccess.h b/arch/arm64/include/asm/asm-uaccess.h
index 0557af834e03..6c23c138e1fc 100644
--- a/arch/arm64/include/asm/asm-uaccess.h
+++ b/arch/arm64/include/asm/asm-uaccess.h
@@ -63,6 +63,11 @@ alternative_else_nop_endif
 9999:	x;					\
 	_asm_extable	9999b, l
 
+
+#define USER_MC(l, x...)			\
+9999:	x;					\
+	_asm_extable_uaccess_mc	9999b, l
+
 /*
  * Generate the assembly for LDTR/STTR with exception table entries.
  * This is complicated as there is no post-increment or pair versions of the
@@ -73,8 +78,8 @@ alternative_else_nop_endif
 8889:		ldtr	\reg2, [\addr, #8];
 		add	\addr, \addr, \post_inc;
 
-		_asm_extable	8888b,\l;
-		_asm_extable	8889b,\l;
+		_asm_extable_uaccess_mc	8888b, \l;
+		_asm_extable_uaccess_mc	8889b, \l;
 	.endm
 
 	.macro user_stp l, reg1, reg2, addr, post_inc
@@ -82,14 +87,14 @@ alternative_else_nop_endif
 8889:		sttr	\reg2, [\addr, #8];
 		add	\addr, \addr, \post_inc;
 
-		_asm_extable	8888b,\l;
-		_asm_extable	8889b,\l;
+		_asm_extable_uaccess_mc	8888b,\l;
+		_asm_extable_uaccess_mc	8889b,\l;
 	.endm
 
 	.macro user_ldst l, inst, reg, addr, post_inc
 8888:		\inst		\reg, [\addr];
 		add		\addr, \addr, \post_inc;
 
-		_asm_extable	8888b,\l;
+		_asm_extable_uaccess_mc	8888b, \l;
 	.endm
 #endif
diff --git a/arch/arm64/lib/copy_from_user.S b/arch/arm64/lib/copy_from_user.S
index 34e317907524..480cc5ac0a8d 100644
--- a/arch/arm64/lib/copy_from_user.S
+++ b/arch/arm64/lib/copy_from_user.S
@@ -25,7 +25,7 @@
 	.endm
 
 	.macro strb1 reg, ptr, val
-	strb \reg, [\ptr], \val
+	USER_MC(9998f, strb \reg, [\ptr], \val)
 	.endm
 
 	.macro ldrh1 reg, ptr, val
@@ -33,7 +33,7 @@
 	.endm
 
 	.macro strh1 reg, ptr, val
-	strh \reg, [\ptr], \val
+	USER_MC(9998f, strh \reg, [\ptr], \val)
 	.endm
 
 	.macro ldr1 reg, ptr, val
@@ -41,7 +41,7 @@
 	.endm
 
 	.macro str1 reg, ptr, val
-	str \reg, [\ptr], \val
+	USER_MC(9998f, str \reg, [\ptr], \val)
 	.endm
 
 	.macro ldp1 reg1, reg2, ptr, val
@@ -49,11 +49,12 @@
 	.endm
 
 	.macro stp1 reg1, reg2, ptr, val
-	stp \reg1, \reg2, [\ptr], \val
+	USER_MC(9998f, stp \reg1, \reg2, [\ptr], \val)
 	.endm
 
-end	.req	x5
-srcin	.req	x15
+end		.req	x5
+srcin		.req	x15
+fixup_type	.req	x16
 SYM_FUNC_START(__arch_copy_from_user)
 	add	end, x0, x2
 	mov	srcin, x1
@@ -62,7 +63,10 @@ SYM_FUNC_START(__arch_copy_from_user)
 	ret
 
 	// Exception fixups
-9997:	cmp	dst, dstin
+	// x16: fixup type written by ex_handler_uaccess_mc
+9997:	cmp 	fixup_type, #FIXUP_TYPE_MC
+	b.eq	9998f
+	cmp	dst, dstin
 	b.ne	9998f
 	// Before being absolutely sure we couldn't copy anything, try harder
 USER(9998f, ldtrb tmp1w, [srcin])
diff --git a/arch/arm64/lib/copy_to_user.S b/arch/arm64/lib/copy_to_user.S
index 802231772608..021a7d27b3a4 100644
--- a/arch/arm64/lib/copy_to_user.S
+++ b/arch/arm64/lib/copy_to_user.S
@@ -20,7 +20,7 @@
  *	x0 - bytes not copied
  */
 	.macro ldrb1 reg, ptr, val
-	ldrb  \reg, [\ptr], \val
+	USER_MC(9998f, ldrb  \reg, [\ptr], \val)
 	.endm
 
 	.macro strb1 reg, ptr, val
@@ -28,7 +28,7 @@
 	.endm
 
 	.macro ldrh1 reg, ptr, val
-	ldrh  \reg, [\ptr], \val
+	USER_MC(9998f, ldrh  \reg, [\ptr], \val)
 	.endm
 
 	.macro strh1 reg, ptr, val
@@ -36,7 +36,7 @@
 	.endm
 
 	.macro ldr1 reg, ptr, val
-	ldr \reg, [\ptr], \val
+	USER_MC(9998f, ldr \reg, [\ptr], \val)
 	.endm
 
 	.macro str1 reg, ptr, val
@@ -44,15 +44,16 @@
 	.endm
 
 	.macro ldp1 reg1, reg2, ptr, val
-	ldp \reg1, \reg2, [\ptr], \val
+	USER_MC(9998f, ldp \reg1, \reg2, [\ptr], \val)
 	.endm
 
 	.macro stp1 reg1, reg2, ptr, val
 	user_stp 9997f, \reg1, \reg2, \ptr, \val
 	.endm
 
-end	.req	x5
-srcin	.req	x15
+end		.req	x5
+srcin		.req	x15
+fixup_type	.req	x16
 SYM_FUNC_START(__arch_copy_to_user)
 	add	end, x0, x2
 	mov	srcin, x1
@@ -61,7 +62,10 @@ SYM_FUNC_START(__arch_copy_to_user)
 	ret
 
 	// Exception fixups
-9997:	cmp	dst, dstin
+	// x16: fixup type written by ex_handler_uaccess_mc
+9997:	cmp 	fixup_type, #FIXUP_TYPE_MC
+	b.eq	9998f
+	cmp	dst, dstin
 	b.ne	9998f
 	// Before being absolutely sure we couldn't copy anything, try harder
 	ldrb	tmp1w, [srcin]
diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
index 4f0083a550d4..525876c3ebf4 100644
--- a/arch/arm64/mm/extable.c
+++ b/arch/arm64/mm/extable.c
@@ -24,6 +24,14 @@ static bool ex_handler_fixup(const struct exception_table_entry *ex,
 	return true;
 }
 
+static bool ex_handler_uaccess_type(const struct exception_table_entry *ex,
+			     struct pt_regs *regs,
+			     unsigned long fixup_type)
+{
+	regs->regs[16] = fixup_type;
+	return ex_handler_fixup(ex, regs);
+}
+
 static bool ex_handler_uaccess_err_zero(const struct exception_table_entry *ex,
 					struct pt_regs *regs)
 {
@@ -75,6 +83,8 @@ bool fixup_exception(struct pt_regs *regs)
 	switch (ex->type) {
 	case EX_TYPE_FIXUP:
 		return ex_handler_fixup(ex, regs);
+	case EX_TYPE_UACCESS_MC:
+		return ex_handler_uaccess_type(ex, regs, FIXUP_TYPE_NORMAL);
 	case EX_TYPE_BPF:
 		return ex_handler_bpf(ex, regs);
 	case EX_TYPE_UACCESS_ERR_ZERO:
@@ -94,10 +104,10 @@ bool fixup_exception_mc(struct pt_regs *regs)
 	if (!ex)
 		return false;
 
-	/*
-	 * This is not complete, More Machine check safe extable type can
-	 * be processed here.
-	 */
+	switch (ex->type) {
+	case EX_TYPE_UACCESS_MC:
+		return ex_handler_uaccess_type(ex, regs, FIXUP_TYPE_MC);
+	}
 
 	return false;
 }
-- 
2.25.1

