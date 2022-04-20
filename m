Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D1C50802B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 06:35:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kjnt52JkBz3cDK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 14:35:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com;
 envelope-from=tongtiangen@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjlRX22Bdz2x9V
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Apr 2022 12:46:16 +1000 (AEST)
Received: from kwepemi500004.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KjlQm1DFkzhXXK;
 Wed, 20 Apr 2022 10:45:36 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi500004.china.huawei.com (7.221.188.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 20 Apr 2022 10:45:41 +0800
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 20 Apr 2022 10:45:40 +0800
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
Subject: [PATCH -next v4 6/7] arm64: add {get, put}_user to machine check safe
Date: Wed, 20 Apr 2022 03:04:17 +0000
Message-ID: <20220420030418.3189040-7-tongtiangen@huawei.com>
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

Add {get, put}_user() to machine check safe.

If get/put fail due to hardware memory error, only the relevant processes
are affected, so killing the user process and isolate the user page with
hardware memory errors is a more reasonable choice than kernel panic.

Add new extable type EX_TYPE_UACCESS_MC_ERR_ZERO which can be used for
uaccess that can be recovered from hardware memory errors. The difference
from EX_TYPE_UACCESS_MC is that this type also sets additional two target
register which save error code and value needs to be set zero.

Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
---
 arch/arm64/include/asm/asm-extable.h | 14 ++++++++++++++
 arch/arm64/include/asm/uaccess.h     |  4 ++--
 arch/arm64/mm/extable.c              |  4 ++++
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/asm-extable.h b/arch/arm64/include/asm/asm-extable.h
index 75b2c00e9523..80410899a9ad 100644
--- a/arch/arm64/include/asm/asm-extable.h
+++ b/arch/arm64/include/asm/asm-extable.h
@@ -13,6 +13,7 @@
 
 /* _MC indicates that can fixup from machine check errors */
 #define EX_TYPE_UACCESS_MC		5
+#define EX_TYPE_UACCESS_MC_ERR_ZERO	6
 
 #ifdef __ASSEMBLY__
 
@@ -78,6 +79,15 @@
 #define EX_DATA_REG(reg, gpr)						\
 	"((.L__gpr_num_" #gpr ") << " __stringify(EX_DATA_REG_##reg##_SHIFT) ")"
 
+#define _ASM_EXTABLE_UACCESS_MC_ERR_ZERO(insn, fixup, err, zero)		\
+	__DEFINE_ASM_GPR_NUMS							\
+	__ASM_EXTABLE_RAW(#insn, #fixup,					\
+			  __stringify(EX_TYPE_UACCESS_MC_ERR_ZERO),		\
+			  "("							\
+			    EX_DATA_REG(ERR, err) " | "				\
+			    EX_DATA_REG(ZERO, zero)				\
+			  ")")
+
 #define _ASM_EXTABLE_UACCESS_ERR_ZERO(insn, fixup, err, zero)		\
 	__DEFINE_ASM_GPR_NUMS						\
 	__ASM_EXTABLE_RAW(#insn, #fixup, 				\
@@ -90,6 +100,10 @@
 #define _ASM_EXTABLE_UACCESS_ERR(insn, fixup, err)			\
 	_ASM_EXTABLE_UACCESS_ERR_ZERO(insn, fixup, err, wzr)
 
+
+#define _ASM_EXTABLE_UACCESS_MC_ERR(insn, fixup, err)			\
+	_ASM_EXTABLE_UACCESS_MC_ERR_ZERO(insn, fixup, err, wzr)
+
 #define EX_DATA_REG_DATA_SHIFT	0
 #define EX_DATA_REG_DATA	GENMASK(4, 0)
 #define EX_DATA_REG_ADDR_SHIFT	5
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index e8dce0cc5eaa..e41b47df48b0 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -236,7 +236,7 @@ static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
 	asm volatile(							\
 	"1:	" load "	" reg "1, [%2]\n"			\
 	"2:\n"								\
-	_ASM_EXTABLE_UACCESS_ERR_ZERO(1b, 2b, %w0, %w1)			\
+	_ASM_EXTABLE_UACCESS_MC_ERR_ZERO(1b, 2b, %w0, %w1)		\
 	: "+r" (err), "=&r" (x)						\
 	: "r" (addr))
 
@@ -325,7 +325,7 @@ do {									\
 	asm volatile(							\
 	"1:	" store "	" reg "1, [%2]\n"			\
 	"2:\n"								\
-	_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w0)				\
+	_ASM_EXTABLE_UACCESS_MC_ERR(1b, 2b, %w0)			\
 	: "+r" (err)							\
 	: "r" (x), "r" (addr))
 
diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
index 525876c3ebf4..1023ccdb2f89 100644
--- a/arch/arm64/mm/extable.c
+++ b/arch/arm64/mm/extable.c
@@ -88,6 +88,7 @@ bool fixup_exception(struct pt_regs *regs)
 	case EX_TYPE_BPF:
 		return ex_handler_bpf(ex, regs);
 	case EX_TYPE_UACCESS_ERR_ZERO:
+	case EX_TYPE_UACCESS_MC_ERR_ZERO:
 		return ex_handler_uaccess_err_zero(ex, regs);
 	case EX_TYPE_LOAD_UNALIGNED_ZEROPAD:
 		return ex_handler_load_unaligned_zeropad(ex, regs);
@@ -107,6 +108,9 @@ bool fixup_exception_mc(struct pt_regs *regs)
 	switch (ex->type) {
 	case EX_TYPE_UACCESS_MC:
 		return ex_handler_uaccess_type(ex, regs, FIXUP_TYPE_MC);
+	case EX_TYPE_UACCESS_MC_ERR_ZERO:
+		return ex_handler_uaccess_err_zero(ex, regs);
+
 	}
 
 	return false;
-- 
2.25.1

