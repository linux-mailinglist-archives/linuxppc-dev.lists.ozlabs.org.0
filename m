Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 914515F964C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 02:32:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mm0Gj28grz3dsK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 11:31:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Xz5t3f4a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Xz5t3f4a;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mm0Fj0gvfz3bgh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 11:31:04 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29A0I6FH026655;
	Mon, 10 Oct 2022 00:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=d2yAZ7F8TDw9fEWMm4S291jpj9nlvepl34zrMk8sw/s=;
 b=Xz5t3f4as2UyovdPY0rVH/p1JzhLifhiVC1xksL2yBgQvZKaAW4MmNHtAnx7cNtSQfxE
 h0hJw4XZFS/NWq3TsIUS8yccJs6+W3NWM8KhzN/M4EQkFqlOlRpAWZvyNOvQkzXHezZX
 ByeRUAF/GBljYUDOC+mZZsP+N/eMIVwGKjZwgTSTgGQSL5HfWdInn6D/oK8dMZeuNLa6
 HTiyPjZe5V/7JAJ+t2vb8SrMG8KM5afORg9SMDYBsRwWAo6qCNvtmAu9+mrdXQ3DllL4
 430AEWQACk7/fx+b7Qe9gT0xwfun240FeQbt5rma0OqAUXjPx8nSlkHoGFk8Yf0QEULI tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k3jgwd3ma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 00:30:40 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29A0MI1k004877;
	Mon, 10 Oct 2022 00:30:40 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k3jgwd3ky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 00:30:40 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29A0LVcd008659;
	Mon, 10 Oct 2022 00:30:38 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03ams.nl.ibm.com with ESMTP id 3k30u920xf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 00:30:37 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29A0Ptrg37617996
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Oct 2022 00:25:55 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A7B111C04C;
	Mon, 10 Oct 2022 00:30:35 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDB3611C04A;
	Mon, 10 Oct 2022 00:30:34 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 10 Oct 2022 00:30:34 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 96E746063C;
	Mon, 10 Oct 2022 11:30:30 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 6/6] powerpc: Add tests for out-of-line static calls
Date: Mon, 10 Oct 2022 11:29:57 +1100
Message-Id: <20221010002957.128276-7-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010002957.128276-1-bgray@linux.ibm.com>
References: <20221010002957.128276-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: y6mYGIoVD7rstE4On4qVYWp-hu4Sxc_Z
X-Proofpoint-ORIG-GUID: zmjN3EJwHurVPZUEe1xQVsAdbx7eXkIX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-07_04,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210090155
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
Cc: ajd@linux.ibm.com, peterz@infradead.org, Benjamin Gray <bgray@linux.ibm.com>, npiggin@gmail.com, ardb@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KUnit tests for the various combinations of caller/trampoline/target and
kernel/module. They must be run from a module loaded at runtime to
guarantee they have a different TOC to the kernel (64-bit ELF V2) and
increase the chance of testing the non-direct branch path of the
trampoline.

For 64-bit ELF V2 ABI the tests try to mitigate the chance of panicking
by restoring the TOC after every static call. Not all possible errors
can be caught by this (we can't stop a trampoline from using a bad TOC
itself), but it makes certain errors easier to debug.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/Kconfig                   |  12 ++
 arch/powerpc/kernel/Makefile           |   1 +
 arch/powerpc/kernel/static_call.c      |  53 +++++
 arch/powerpc/kernel/static_call_test.c | 263 +++++++++++++++++++++++++
 arch/powerpc/kernel/static_call_test.h |  56 ++++++
 5 files changed, 385 insertions(+)
 create mode 100644 arch/powerpc/kernel/static_call_test.c
 create mode 100644 arch/powerpc/kernel/static_call_test.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 962e36ec34ec..5b9d5fa96a9e 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1035,6 +1035,18 @@ config PPC_RTAS_FILTER
 	  Say Y unless you know what you are doing and the filter is causing
 	  problems for you.
 
+config PPC_STATIC_CALL_KUNIT_TEST
+	tristate "KUnit tests for static calls"
+	default KUNIT_ALL_TESTS
+	depends on HAVE_STATIC_CALL && KUNIT && m
+	help
+	  Tests for static calls across all combinations of caller/trampoline/target
+	  being kernel/module. On ELF ABI V2 the tests check the TOC is kept consistent.
+
+	  Must be built as a module and loaded at runtime to ensure the module has
+	  a different TOC to the kernel and make it likely that non-direct branch
+	  path of the trampoline is tested.
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
index 9211b2e189bb..44957ba91e3f 100644
--- a/arch/powerpc/kernel/static_call.c
+++ b/arch/powerpc/kernel/static_call.c
@@ -153,3 +153,56 @@ void arch_static_call_transform(void *site, void *tramp, void *func, bool tail)
 		panic("%s: patching failed %pS at %pS\n", __func__, func, tramp);
 }
 EXPORT_SYMBOL_GPL(arch_static_call_transform);
+
+
+#if IS_MODULE(CONFIG_PPC_STATIC_CALL_KUNIT_TEST)
+
+#include "static_call_test.h"
+
+int ppc_sc_kernel_target_1(struct kunit *test)
+{
+	toc_fixup(test);
+	return 1;
+}
+
+int ppc_sc_kernel_target_2(struct kunit *test)
+{
+	toc_fixup(test);
+	return 2;
+}
+
+DEFINE_STATIC_CALL(ppc_sc_kernel, ppc_sc_kernel_target_1);
+
+int ppc_sc_kernel_call(struct kunit *test)
+{
+	return PROTECTED_SC(test, int, static_call(ppc_sc_kernel)(test));
+}
+
+int ppc_sc_kernel_call_indirect(struct kunit *test, int (*fn)(struct kunit *test))
+{
+	return PROTECTED_SC(test, int, fn(test));
+}
+
+long ppc_sc_kernel_target_big(struct kunit *test, long a, long b, long c, long d,
+			      long e, long f, long g, long h, long i)
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
index 000000000000..10a09ef455cf
--- /dev/null
+++ b/arch/powerpc/kernel/static_call_test.c
@@ -0,0 +1,263 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "static_call_test.h"
+
+#include <linux/kconfig.h>
+#include <linux/module.h>
+#include <linux/static_call.h>
+
+/* Tests to ensure correctness in a variety of cases for static calls.
+ *
+ * The tests focus on ensuring the TOC is kept consistent across the
+ * module-kernel boundary, as compilers can't see that a trampoline
+ * defined locally to a caller might be jumping to a function with a
+ * different TOC. So it's important that these tests are compiled as
+ * a module to ensure the TOC will be different to the kernel's.
+ */
+
+#ifdef CONFIG_PPC64_ELF_ABI_V2
+
+/* Utils to hold a copy of the old register values while we test.
+ *
+ * We can't use the KUnit init/exit hooks because when the hooks and
+ * test cases return they will be in the KUnit context that doesn't know
+ * we've reserved and modified some non-volatile registers.
+ */
+
+static void *saved_registers[2];
+
+static void init_testcase(struct kunit *test)
+{
+	saved_registers[0] = actual_toc;
+	saved_registers[1] = module_toc;
+	module_toc = current_toc;
+	KUNIT_ASSERT_PTR_NE(test, module_toc, (void *)get_paca()->kernel_toc);
+}
+
+static void exit_testcase(void)
+{
+	actual_toc = saved_registers[0];
+	module_toc = saved_registers[1];
+}
+
+#else
+
+static void init_testcase(struct kunit *test) {}
+static void exit_testcase(void) {}
+
+#endif  /* CONFIG_PPC64_ELF_ABI_V2 */
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
+	init_testcase(test);
+
+	/* Check argument unconditionally evaluated */
+	static_call_cond(module_sc_null)(add_one(&val));
+	KUNIT_ASSERT_EQ(test, 1, val);
+
+	exit_testcase();
+}
+
+static void return_zero_test(struct kunit *test)
+{
+	int ret;
+
+	init_testcase(test);
+
+	ret = PROTECTED_SC(test, int, static_call(module_sc_ret0)());
+	KUNIT_ASSERT_EQ(test, 0, ret);
+
+	static_call_update(ppc_sc_kernel, (void *)__static_call_return0);
+	ret = PROTECTED_SC(test, int, static_call(ppc_sc_kernel)(test));
+	KUNIT_ASSERT_EQ(test, 0, ret);
+
+	static_call_update(module_sc, (void *)__static_call_return0);
+	ret = PROTECTED_SC(test, int, static_call(module_sc)(test));
+	KUNIT_ASSERT_EQ(test, 0, ret);
+
+	exit_testcase();
+}
+
+static void kernel_kernel_kernel_test(struct kunit *test)
+{
+	init_testcase(test);
+
+	static_call_update(ppc_sc_kernel, ppc_sc_kernel_target_1);
+	KUNIT_ASSERT_EQ(test, 1, ppc_sc_kernel_call(test));
+
+	static_call_update(ppc_sc_kernel, ppc_sc_kernel_target_2);
+	KUNIT_ASSERT_EQ(test, 2, ppc_sc_kernel_call(test));
+
+	exit_testcase();
+}
+
+static void kernel_kernel_module_test(struct kunit *test)
+{
+	init_testcase(test);
+
+	static_call_update(ppc_sc_kernel, module_target_11);
+	KUNIT_ASSERT_EQ(test, 11, ppc_sc_kernel_call(test));
+
+	static_call_update(ppc_sc_kernel, module_target_12);
+	KUNIT_ASSERT_EQ(test, 12, ppc_sc_kernel_call(test));
+
+	exit_testcase();
+}
+
+static void kernel_module_kernel_test(struct kunit *test)
+{
+	init_testcase(test);
+
+	static_call_update(module_sc, ppc_sc_kernel_target_1);
+	KUNIT_ASSERT_EQ(test, 1, ppc_sc_kernel_call_indirect(test, static_call(module_sc)));
+
+	static_call_update(module_sc, ppc_sc_kernel_target_2);
+	KUNIT_ASSERT_EQ(test, 2, ppc_sc_kernel_call_indirect(test, static_call(module_sc)));
+
+	exit_testcase();
+}
+
+static void kernel_module_module_test(struct kunit *test)
+{
+	init_testcase(test);
+
+	static_call_update(module_sc, module_target_11);
+	KUNIT_ASSERT_EQ(test, 11, ppc_sc_kernel_call_indirect(test, static_call(module_sc)));
+
+	static_call_update(module_sc, module_target_12);
+	KUNIT_ASSERT_EQ(test, 12, ppc_sc_kernel_call_indirect(test, static_call(module_sc)));
+
+	exit_testcase();
+}
+
+static void module_kernel_kernel_test(struct kunit *test)
+{
+	int ret;
+
+	init_testcase(test);
+
+	static_call_update(ppc_sc_kernel, ppc_sc_kernel_target_1);
+	ret = PROTECTED_SC(test, int, static_call(ppc_sc_kernel)(test));
+	KUNIT_ASSERT_EQ(test, 1, ret);
+
+	static_call_update(ppc_sc_kernel, ppc_sc_kernel_target_2);
+	ret = PROTECTED_SC(test, int, static_call(ppc_sc_kernel)(test));
+	KUNIT_ASSERT_EQ(test, 2, ret);
+
+	exit_testcase();
+}
+
+static void module_kernel_module_test(struct kunit *test)
+{
+	int ret;
+
+	init_testcase(test);
+
+	static_call_update(ppc_sc_kernel, module_target_11);
+	ret = PROTECTED_SC(test, int, static_call(ppc_sc_kernel)(test));
+	KUNIT_ASSERT_EQ(test, 11, ret);
+
+	static_call_update(ppc_sc_kernel, module_target_12);
+	ret = PROTECTED_SC(test, int, static_call(ppc_sc_kernel)(test));
+	KUNIT_ASSERT_EQ(test, 12, ret);
+
+	exit_testcase();
+}
+
+static void module_module_kernel_test(struct kunit *test)
+{
+	int ret;
+
+	init_testcase(test);
+
+	static_call_update(module_sc, ppc_sc_kernel_target_1);
+	ret = PROTECTED_SC(test, int, static_call(module_sc)(test));
+	KUNIT_ASSERT_EQ(test, 1, ret);
+
+	static_call_update(module_sc, ppc_sc_kernel_target_2);
+	ret = PROTECTED_SC(test, int, static_call(module_sc)(test));
+	KUNIT_ASSERT_EQ(test, 2, ret);
+
+	exit_testcase();
+}
+
+static void module_module_module_test(struct kunit *test)
+{
+	int ret;
+
+	init_testcase(test);
+
+	static_call_update(module_sc, module_target_11);
+	ret = PROTECTED_SC(test, int, static_call(module_sc)(test));
+	KUNIT_ASSERT_EQ(test, 11, ret);
+
+	static_call_update(module_sc, module_target_12);
+	ret = PROTECTED_SC(test, int, static_call(module_sc)(test));
+	KUNIT_ASSERT_EQ(test, 12, ret);
+
+	exit_testcase();
+}
+
+DEFINE_STATIC_CALL(module_sc_stack_params, ppc_sc_kernel_target_big);
+
+static void stack_parameters_test(struct kunit *test)
+{
+	long m = -0x87654321;
+	long ret;
+
+	init_testcase(test);
+
+	ret = PROTECTED_SC(test, long,
+		static_call(module_sc_stack_params)(test, m, m, m, m, m, m, m, m, m));
+	KUNIT_ASSERT_EQ(test, ~m, ret);
+
+	exit_testcase();
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
index 000000000000..71b5bc52c099
--- /dev/null
+++ b/arch/powerpc/kernel/static_call_test.h
@@ -0,0 +1,56 @@
+#ifndef _POWERPC_STATIC_CALL_TEST_
+#define _POWERPC_STATIC_CALL_TEST_
+
+#include <kunit/test.h>
+
+DECLARE_STATIC_CALL(ppc_sc_kernel, int(struct kunit *test));
+int ppc_sc_kernel_target_1(struct kunit *test);
+int ppc_sc_kernel_target_2(struct kunit *test);
+long ppc_sc_kernel_target_big(struct kunit *test, long a, long b, long c, long d,
+			      long e, long f, long g, long h, long i);
+int ppc_sc_kernel_call(struct kunit *test);
+int ppc_sc_kernel_call_indirect(struct kunit *test, int(*fn)(struct kunit *test));
+
+#ifdef CONFIG_PPC64_ELF_ABI_V2
+
+/* Reserve these registers for testing so that a TOC error
+ * doesn't necessarily crash the whole kernel.
+ *
+ * The tests ensure the contents are restored before returning.
+ */
+register void *current_toc asm ("r2");
+register void *actual_toc asm ("r14");  /* Copy of TOC before fixup */
+register void *module_toc asm ("r15");
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
+	current_toc = (void *)get_paca()->kernel_toc; \
+	KUNIT_EXPECT_PTR_EQ(test, (void *)get_paca()->kernel_toc, actual_toc)
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
+#else
+
+#define toc_fixup(test) {}
+#define PROTECTED_SC(test, ret_type, call) call
+
+#endif /* CONFIG_PPC64_ELF_ABI_V2 */
+
+#endif /* _POWERPC_STATIC_CALL_TEST_ */
-- 
2.37.3

