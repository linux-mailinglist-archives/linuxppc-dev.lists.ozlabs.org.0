Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 736F85E99C9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 08:47:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbYG53Gr3z3cdW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 16:47:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RAId01Zj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RAId01Zj;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbYCB43pzz30NS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 16:44:38 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28Q4eHYI024999;
	Mon, 26 Sep 2022 06:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9t0sGygSVuHlwZYJ1tqe7kFd9avIfZ0zik3DGzyiGh8=;
 b=RAId01ZjIy+iEsSvM2j5cs9oR/ZwuD/H2HYfYYXNaxlbyVo+tKuhrm24JsCqA+KCZ3E3
 RFZ6lkmC0nv0MHTBa3FwV9FAnjDd0QF0UmxaNctsefSa9GW4NQWmQtU6DmUr7OJJL8HA
 un+JI/mq6dFGR/bVpd0mp6xSKHcTRBysD4vRtY+kUlYAHQhu0YYVWF4dYSYafFqXeeMR
 1+N6xmfRIkWy1M8863mu6e74KxubMMUIk8vkqgYYvqWPX4ER2zAtKwGeOaIiXD1SHxj/
 gkDSz6whG3nqgjuG90+K6+CF63jc3Fbu4hQiCT/I4rt9TCfFNF5HBBfFnrdQJ9kG2OCy Vg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jtbxr41xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 06:44:02 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28Q6i1hg030636;
	Mon, 26 Sep 2022 06:44:01 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jtbxr41wv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 06:44:01 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28Q6auJj004515;
	Mon, 26 Sep 2022 06:44:00 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03fra.de.ibm.com with ESMTP id 3jssh91fvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 06:43:59 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28Q6hvtx47579458
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Sep 2022 06:43:57 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 83EB5AE045;
	Mon, 26 Sep 2022 06:43:57 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D8AC7AE04D;
	Mon, 26 Sep 2022 06:43:56 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 26 Sep 2022 06:43:56 +0000 (GMT)
Received: from beng-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AE39760213;
	Mon, 26 Sep 2022 16:43:55 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 6/6] powerpc/64: Add tests for out-of-line static calls
Date: Mon, 26 Sep 2022 16:43:16 +1000
Message-Id: <20220926064316.765967-7-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926064316.765967-1-bgray@linux.ibm.com>
References: <20220926064316.765967-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 16uBlOYwN0r2QzvAlsi1IXl3K6s94NCw
X-Proofpoint-GUID: N-x4_dFEEHxNKWBG0U8fvj0aF4e77vwR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_04,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209260039
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
Cc: christophe.leroy@c-s.fr, ajd@linux.ibm.com, peterz@infradead.org, Benjamin Gray <bgray@linux.ibm.com>, npiggin@gmail.com, ardb@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KUnit tests for the various combinations of caller/trampoline/target and
kernel/module. They must be run from a module loaded at runtime to
guarantee they have a different TOC to the kernel.

The tests try to mitigate the chance of panicing by restoring the
TOC after every static call. Not all possible errors can be caught
by this (we can't stop a trampoline from using a bad TOC itself),
but it makes certain errors easier to debug.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/Kconfig                   |  10 +
 arch/powerpc/kernel/Makefile           |   1 +
 arch/powerpc/kernel/static_call.c      |  61 ++++++
 arch/powerpc/kernel/static_call_test.c | 251 +++++++++++++++++++++++++
 arch/powerpc/kernel/static_call_test.h |  56 ++++++
 5 files changed, 379 insertions(+)
 create mode 100644 arch/powerpc/kernel/static_call_test.c
 create mode 100644 arch/powerpc/kernel/static_call_test.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e7a66635eade..0ca60514c0e2 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1023,6 +1023,16 @@ config PPC_RTAS_FILTER
 	  Say Y unless you know what you are doing and the filter is causing
 	  problems for you.
 
+config PPC_STATIC_CALL_KUNIT_TEST
+	tristate "KUnit tests for PPC64 ELF ABI V2 static calls"
+	default KUNIT_ALL_TESTS
+	depends on HAVE_STATIC_CALL && PPC64_ELF_ABI_V2 && KUNIT && m
+	help
+	  Tests that check the TOC is kept consistent across all combinations
+	  of caller/trampoline/target being kernel/module. Must be built as a
+	  module and loaded at runtime to ensure the module has a different
+	  TOC to the kernel.
+
 endmenu
 
 config ISA_DMA_API
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index a30d0d0f5499..22c07e3d34df 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -131,6 +131,7 @@ obj-$(CONFIG_RELOCATABLE)	+= reloc_$(BITS).o
 obj-$(CONFIG_PPC32)		+= entry_32.o setup_32.o early_32.o
 obj-$(CONFIG_PPC64)		+= dma-iommu.o iommu.o
 obj-$(CONFIG_HAVE_STATIC_CALL)	+= static_call.o
+obj-$(CONFIG_PPC_STATIC_CALL_KUNIT_TEST)	+= static_call_test.o
 obj-$(CONFIG_KGDB)		+= kgdb.o
 obj-$(CONFIG_BOOTX_TEXT)	+= btext.o
 obj-$(CONFIG_SMP)		+= smp.o
diff --git a/arch/powerpc/kernel/static_call.c b/arch/powerpc/kernel/static_call.c
index ecbb74e1b4d3..8d338917b70e 100644
--- a/arch/powerpc/kernel/static_call.c
+++ b/arch/powerpc/kernel/static_call.c
@@ -113,3 +113,64 @@ void arch_static_call_transform(void *site, void *tramp, void *func, bool tail)
 		panic("%s: patching failed %pS at %pS\n", __func__, func, tramp);
 }
 EXPORT_SYMBOL_GPL(arch_static_call_transform);
+
+
+#if IS_MODULE(CONFIG_PPC_STATIC_CALL_KUNIT_TEST)
+
+#include "static_call_test.h"
+
+int ppc_sc_kernel_target_1(struct kunit* test)
+{
+	toc_fixup(test);
+	return 1;
+}
+
+int ppc_sc_kernel_target_2(struct kunit* test)
+{
+	toc_fixup(test);
+	return 2;
+}
+
+DEFINE_STATIC_CALL(ppc_sc_kernel, ppc_sc_kernel_target_1);
+
+int ppc_sc_kernel_call(struct kunit* test)
+{
+	return PROTECTED_SC(test, int, static_call(ppc_sc_kernel)(test));
+}
+
+int ppc_sc_kernel_call_indirect(struct kunit* test, int (*fn)(struct kunit*))
+{
+	return PROTECTED_SC(test, int, fn(test));
+}
+
+long ppc_sc_kernel_target_big(struct kunit* test,
+			      long a,
+			      long b,
+			      long c,
+			      long d,
+			      long e,
+			      long f,
+			      long g,
+			      long h,
+			      long i)
+{
+	toc_fixup(test);
+	KUNIT_EXPECT_EQ(test, a, b);
+	KUNIT_EXPECT_EQ(test, a, c);
+	KUNIT_EXPECT_EQ(test, a, d);
+	KUNIT_EXPECT_EQ(test, a, e);
+	KUNIT_EXPECT_EQ(test, a, f);
+	KUNIT_EXPECT_EQ(test, a, g);
+	KUNIT_EXPECT_EQ(test, a, h);
+	KUNIT_EXPECT_EQ(test, a, i);
+	return ~a;
+}
+
+EXPORT_SYMBOL_GPL(ppc_sc_kernel_target_1);
+EXPORT_SYMBOL_GPL(ppc_sc_kernel_target_2);
+EXPORT_SYMBOL_GPL(ppc_sc_kernel_target_big);
+EXPORT_STATIC_CALL_GPL(ppc_sc_kernel);
+EXPORT_SYMBOL_GPL(ppc_sc_kernel_call);
+EXPORT_SYMBOL_GPL(ppc_sc_kernel_call_indirect);
+
+#endif /* IS_MODULE(CONFIG_PPC_STATIC_CALL_KUNIT_TEST) */
diff --git a/arch/powerpc/kernel/static_call_test.c b/arch/powerpc/kernel/static_call_test.c
new file mode 100644
index 000000000000..2d69524d935f
--- /dev/null
+++ b/arch/powerpc/kernel/static_call_test.c
@@ -0,0 +1,251 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "static_call_test.h"
+
+#include <linux/kconfig.h>
+#include <linux/module.h>
+#include <linux/static_call.h>
+
+/*
+ * Tests to ensure correctness in a variety of cases for static calls.
+ *
+ * The tests focus on ensuring the TOC is kept consistent across the
+ * module-kernel boundary, as compilers can't see that a trampoline
+ * defined locally to a caller might be jumping to a function with a
+ * different TOC. So it's important that these tests are compiled as
+ * a module to ensure the TOC will be different to the kernel's.
+ */
+
+/* Utils to hold a copy of the old register values while we test.
+ *
+ * We can't use the KUnit init/exit hooks because when the hooks and
+ * test cases return they will be in the KUnit context that doesn't know
+ * we've reserved and modified some non-volatile registers.
+ */
+static void* regsaves[3];
+
+#define SAVE_REGS() \
+	regsaves[0] = actual_toc; \
+	regsaves[1] = module_toc; \
+	regsaves[2] = kernel_toc; \
+	module_toc = current_toc; \
+	kernel_toc = (void*) get_paca()->kernel_toc;
+
+#define RESTORE_REGS() \
+	actual_toc = regsaves[0]; \
+	module_toc = regsaves[1]; \
+	kernel_toc = regsaves[2];
+
+static int module_target_11(struct kunit *test)
+{
+	toc_fixup(test);
+	return 11;
+}
+
+static int module_target_12(struct kunit *test)
+{
+	toc_fixup(test);
+	return 12;
+}
+
+DEFINE_STATIC_CALL(module_sc, module_target_11);
+
+DEFINE_STATIC_CALL_RET0(module_sc_ret0, int(void));
+DEFINE_STATIC_CALL_NULL(module_sc_null, int(int));
+
+static int add_one(int *val)
+{
+	return (*val)++;
+}
+
+static void null_function_test(struct kunit *test)
+{
+	int val = 0;
+
+	SAVE_REGS();
+
+	/* Check argument unconditionally evaluated */
+	static_call_cond(module_sc_null)(add_one(&val));
+	KUNIT_ASSERT_EQ(test, 1, val);
+
+	RESTORE_REGS();
+}
+
+static void return_zero_test(struct kunit *test)
+{
+	int ret;
+
+	SAVE_REGS();
+
+	ret = PROTECTED_SC(test, int, static_call(module_sc_ret0)());
+	KUNIT_ASSERT_EQ(test, 0, ret);
+
+	static_call_update(ppc_sc_kernel, (void*)__static_call_return0);
+	ret = PROTECTED_SC(test, int, static_call(ppc_sc_kernel)(test));
+	KUNIT_ASSERT_EQ(test, 0, ret);
+
+	static_call_update(module_sc, (void*)__static_call_return0);
+	ret = PROTECTED_SC(test, int, static_call(module_sc)(test));
+	KUNIT_ASSERT_EQ(test, 0, ret);
+
+	RESTORE_REGS();
+}
+
+static void kernel_kernel_kernel_test(struct kunit *test)
+{
+	SAVE_REGS();
+
+	static_call_update(ppc_sc_kernel, ppc_sc_kernel_target_1);
+	KUNIT_ASSERT_EQ(test, 1, ppc_sc_kernel_call(test));
+
+	static_call_update(ppc_sc_kernel, ppc_sc_kernel_target_2);
+	KUNIT_ASSERT_EQ(test, 2, ppc_sc_kernel_call(test));
+
+	RESTORE_REGS();
+}
+
+static void kernel_kernel_module_test(struct kunit *test)
+{
+	SAVE_REGS();
+
+	static_call_update(ppc_sc_kernel, module_target_11);
+	KUNIT_ASSERT_EQ(test, 11, ppc_sc_kernel_call(test));
+
+	static_call_update(ppc_sc_kernel, module_target_12);
+	KUNIT_ASSERT_EQ(test, 12, ppc_sc_kernel_call(test));
+
+	RESTORE_REGS();
+}
+
+static void kernel_module_kernel_test(struct kunit *test)
+{
+	SAVE_REGS();
+
+	static_call_update(module_sc, ppc_sc_kernel_target_1);
+	KUNIT_ASSERT_EQ(test, 1, ppc_sc_kernel_call_indirect(test, static_call(module_sc)));
+
+	static_call_update(module_sc, ppc_sc_kernel_target_2);
+	KUNIT_ASSERT_EQ(test, 2, ppc_sc_kernel_call_indirect(test, static_call(module_sc)));
+
+	RESTORE_REGS();
+}
+
+static void kernel_module_module_test(struct kunit *test)
+{
+	SAVE_REGS();
+
+	static_call_update(module_sc, module_target_11);
+	KUNIT_ASSERT_EQ(test, 11, ppc_sc_kernel_call_indirect(test, static_call(module_sc)));
+
+	static_call_update(module_sc, module_target_12);
+	KUNIT_ASSERT_EQ(test, 12, ppc_sc_kernel_call_indirect(test, static_call(module_sc)));
+
+	RESTORE_REGS();
+}
+
+static void module_kernel_kernel_test(struct kunit *test)
+{
+	int ret;
+
+	SAVE_REGS();
+
+	static_call_update(ppc_sc_kernel, ppc_sc_kernel_target_1);
+	ret = PROTECTED_SC(test, int, static_call(ppc_sc_kernel)(test));
+	KUNIT_ASSERT_EQ(test, 1, ret);
+
+	static_call_update(ppc_sc_kernel, ppc_sc_kernel_target_2);
+	ret = PROTECTED_SC(test, int, static_call(ppc_sc_kernel)(test));
+	KUNIT_ASSERT_EQ(test, 2, ret);
+
+	RESTORE_REGS();
+}
+
+static void module_kernel_module_test(struct kunit *test)
+{
+	int ret;
+
+	SAVE_REGS();
+
+	static_call_update(ppc_sc_kernel, module_target_11);
+	ret = PROTECTED_SC(test, int, static_call(ppc_sc_kernel)(test));
+	KUNIT_ASSERT_EQ(test, 11, ret);
+
+	static_call_update(ppc_sc_kernel, module_target_12);
+	ret = PROTECTED_SC(test, int, static_call(ppc_sc_kernel)(test));
+	KUNIT_ASSERT_EQ(test, 12, ret);
+
+	RESTORE_REGS();
+}
+
+static void module_module_kernel_test(struct kunit *test)
+{
+	int ret;
+
+	SAVE_REGS();
+
+	static_call_update(module_sc, ppc_sc_kernel_target_1);
+	ret = PROTECTED_SC(test, int, static_call(module_sc)(test));
+	KUNIT_ASSERT_EQ(test, 1, ret);
+
+	static_call_update(module_sc, ppc_sc_kernel_target_2);
+	ret = PROTECTED_SC(test, int, static_call(module_sc)(test));
+	KUNIT_ASSERT_EQ(test, 2, ret);
+
+	RESTORE_REGS();
+}
+
+static void module_module_module_test(struct kunit *test)
+{
+	int ret;
+
+	SAVE_REGS();
+
+	static_call_update(module_sc, module_target_11);
+	ret = PROTECTED_SC(test, int, static_call(module_sc)(test));
+	KUNIT_ASSERT_EQ(test, 11, ret);
+
+	static_call_update(module_sc, module_target_12);
+	ret = PROTECTED_SC(test, int, static_call(module_sc)(test));
+	KUNIT_ASSERT_EQ(test, 12, ret);
+
+	RESTORE_REGS();
+}
+
+DEFINE_STATIC_CALL(module_sc_stack_params, ppc_sc_kernel_target_big);
+
+static void stack_parameters_test(struct kunit *test)
+{
+	long m = 0x1234567887654321;
+	long ret;
+
+	SAVE_REGS();
+
+	ret = PROTECTED_SC(test, long, static_call(module_sc_stack_params)(test, m, m, m, m, m, m, m, m, m));
+	KUNIT_ASSERT_EQ(test, ~m, ret);
+
+	RESTORE_REGS();
+}
+
+static struct kunit_case static_call_test_cases[] = {
+	KUNIT_CASE(null_function_test),
+	KUNIT_CASE(return_zero_test),
+	KUNIT_CASE(stack_parameters_test),
+	KUNIT_CASE(kernel_kernel_kernel_test),
+	KUNIT_CASE(kernel_kernel_module_test),
+	KUNIT_CASE(kernel_module_kernel_test),
+	KUNIT_CASE(kernel_module_module_test),
+	KUNIT_CASE(module_kernel_kernel_test),
+	KUNIT_CASE(module_kernel_module_test),
+	KUNIT_CASE(module_module_kernel_test),
+	KUNIT_CASE(module_module_module_test),
+	{}
+};
+
+static struct kunit_suite ppc_static_call_test_suite = {
+	.name = "ppc-static-call",
+	.test_cases = static_call_test_cases,
+};
+kunit_test_suite(ppc_static_call_test_suite);
+
+MODULE_AUTHOR("Benjamin Gray <bgray@linux.ibm.com>");
+MODULE_LICENSE("GPL");
diff --git a/arch/powerpc/kernel/static_call_test.h b/arch/powerpc/kernel/static_call_test.h
new file mode 100644
index 000000000000..597da89297fa
--- /dev/null
+++ b/arch/powerpc/kernel/static_call_test.h
@@ -0,0 +1,56 @@
+#ifndef _POWERPC_STATIC_CALL_TEST_
+#define _POWERPC_STATIC_CALL_TEST_
+
+#include <kunit/test.h>
+
+/* Reserve these registers for testing so that a TOC error
+ * doesn't necessarily crash the whole kernel.
+ *
+ * The tests ensure the contents are restored before returning.
+ */
+register void* current_toc asm ("r2");
+register void* actual_toc asm ("r14");  /* Copy of TOC before fixup */
+register void* module_toc asm ("r15");
+register void* kernel_toc asm ("r16");
+
+DECLARE_STATIC_CALL(ppc_sc_kernel, int(struct kunit*));
+int ppc_sc_kernel_target_1(struct kunit* test);
+int ppc_sc_kernel_target_2(struct kunit* test);
+long ppc_sc_kernel_target_big(struct kunit* test,
+				     long a,
+				     long b,
+				     long c,
+				     long d,
+				     long e,
+				     long f,
+				     long g,
+				     long h,
+				     long i);
+int ppc_sc_kernel_call(struct kunit* test);
+int ppc_sc_kernel_call_indirect(struct kunit* test, int(*fn)(struct kunit*));
+
+#ifdef MODULE
+
+#define toc_fixup(test) \
+	actual_toc = current_toc; \
+	current_toc = module_toc; \
+	KUNIT_EXPECT_PTR_EQ(test, module_toc, actual_toc)
+
+#else /* KERNEL */
+
+#define toc_fixup(test) \
+	actual_toc = current_toc; \
+	current_toc = kernel_toc; \
+	KUNIT_EXPECT_PTR_EQ(test, kernel_toc, actual_toc)
+
+#endif /* MODULE */
+
+#define PROTECTED_SC(test, ret_type, call) \
+({ \
+	ret_type ret; \
+	ret = call; \
+	toc_fixup(test); \
+	ret; \
+})
+
+#endif /* _POWERPC_STATIC_CALL_TEST_ */
-- 
2.37.3

