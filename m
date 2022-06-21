Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64166552BF5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 09:28:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRymB1srgz3dvY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 17:28:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=<UNKNOWN>)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRyl44lhGz3c7w
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 17:27:12 +1000 (AEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4LRyhY2zmvz1KC8N;
	Tue, 21 Jun 2022 15:25:01 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 21 Jun 2022 15:26:52 +0800
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 21 Jun 2022 15:26:50 +0800
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
Subject: [PATCH -next v6 02/10] arm64: asm-extable: move data fields
Date: Tue, 21 Jun 2022 07:26:30 +0000
Message-ID: <20220621072638.1273594-3-tongtiangen@huawei.com>
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

In subsequent patches we'll need to fill in extable data fields in
regular assembly files. In preparation for this, move the definitions of
the extable data fields earlier in asm-extable.h so that they are
defined for both assembly and C files.

There should be no functional change as a result of this patch.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
---
 arch/arm64/include/asm/asm-extable.h | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/asm-extable.h b/arch/arm64/include/asm/asm-extable.h
index 1717fc4cfeb5..204b30bf78b3 100644
--- a/arch/arm64/include/asm/asm-extable.h
+++ b/arch/arm64/include/asm/asm-extable.h
@@ -9,6 +9,18 @@
 #define EX_TYPE_KACCESS_ERR_ZERO	4
 #define EX_TYPE_LOAD_UNALIGNED_ZEROPAD	5
 
+/* Data fields for EX_TYPE_UACCESS_ERR_ZERO */
+#define EX_DATA_REG_ERR_SHIFT	0
+#define EX_DATA_REG_ERR		GENMASK(4, 0)
+#define EX_DATA_REG_ZERO_SHIFT	5
+#define EX_DATA_REG_ZERO	GENMASK(9, 5)
+
+/* Data fields for EX_TYPE_LOAD_UNALIGNED_ZEROPAD */
+#define EX_DATA_REG_DATA_SHIFT	0
+#define EX_DATA_REG_DATA	GENMASK(4, 0)
+#define EX_DATA_REG_ADDR_SHIFT	5
+#define EX_DATA_REG_ADDR	GENMASK(9, 5)
+
 #ifdef __ASSEMBLY__
 
 #define __ASM_EXTABLE_RAW(insn, fixup, type, data)	\
@@ -57,11 +69,6 @@
 #define _ASM_EXTABLE(insn, fixup) \
 	__ASM_EXTABLE_RAW(#insn, #fixup, __stringify(EX_TYPE_FIXUP), "0")
 
-#define EX_DATA_REG_ERR_SHIFT	0
-#define EX_DATA_REG_ERR		GENMASK(4, 0)
-#define EX_DATA_REG_ZERO_SHIFT	5
-#define EX_DATA_REG_ZERO	GENMASK(9, 5)
-
 #define EX_DATA_REG(reg, gpr)						\
 	"((.L__gpr_num_" #gpr ") << " __stringify(EX_DATA_REG_##reg##_SHIFT) ")"
 
@@ -89,11 +96,6 @@
 #define _ASM_EXTABLE_KACCESS_ERR(insn, fixup, err)			\
 	_ASM_EXTABLE_KACCESS_ERR_ZERO(insn, fixup, err, wzr)
 
-#define EX_DATA_REG_DATA_SHIFT	0
-#define EX_DATA_REG_DATA	GENMASK(4, 0)
-#define EX_DATA_REG_ADDR_SHIFT	5
-#define EX_DATA_REG_ADDR	GENMASK(9, 5)
-
 #define _ASM_EXTABLE_LOAD_UNALIGNED_ZEROPAD(insn, fixup, data, addr)		\
 	__DEFINE_ASM_GPR_NUMS							\
 	__ASM_EXTABLE_RAW(#insn, #fixup,					\
-- 
2.25.1

