Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DED7E5A8E9D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 08:48:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJBTV5f5Fz3f38
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 16:48:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Pn+JBCQq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Pn+JBCQq;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJ9TX5vg0z30D0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 16:03:44 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2815u5pD018997;
	Thu, 1 Sep 2022 06:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=oSITJ2+OLn+7/Bi0+cW9B16ZzQjlvXdLOoyH2UmbEO4=;
 b=Pn+JBCQq+zuR8LGGUpT0K/P9SWpzJSz/xXhvcB/SADWmSfVBDtpsASC0CKCKveJdQ5TC
 j/Y4diEBJGQMSzUOOV22/tI3nhgweLl/bQcyiSJPP7GDHcOO+1fAg2u4vYoKarGqrpvN
 TjrGaXkuu8Z3iOZnOF5pU8Xff3wdF8E9ONDJiAdr7lAaTMms0Kp7QLZFbJoCmkBhFE7S
 pI1r1wQL8bRP2T1TwjHt5SNHtaBJdjDn9zrVirvk3IZemV4/4aCX4Y7kEsbCCUBlZsqi
 nAI5LYUlwgyK3JwkZ6eXT4Gc8tu6xNczTCHwkX1CDb3Zcuc+u9l79cysfpdpRg1VBy5F dw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jaq1ar6yv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Sep 2022 06:03:39 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2815x9nM004844;
	Thu, 1 Sep 2022 06:03:36 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jaq1ar6x3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Sep 2022 06:03:36 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2815o0r4013867;
	Thu, 1 Sep 2022 05:58:34 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma03ams.nl.ibm.com with ESMTP id 3j7aw967v0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Sep 2022 05:58:33 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2815wVc135652062
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Sep 2022 05:58:31 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C2EB252050;
	Thu,  1 Sep 2022 05:58:31 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2543B5204E;
	Thu,  1 Sep 2022 05:58:31 +0000 (GMT)
Received: from beng-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D7F04604D2;
	Thu,  1 Sep 2022 15:58:28 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 4/4] powerpc/64: Add tests for out-of-line static calls
Date: Thu,  1 Sep 2022 15:58:23 +1000
Message-Id: <20220901055823.152983-5-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901055823.152983-1-bgray@linux.ibm.com>
References: <20220901055823.152983-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pGYucRoVgabJ2DMaLnsmorlZw1NTypdL
X-Proofpoint-ORIG-GUID: zk-rRZvvbsKwAg7K3aOICrlTcgFrlanZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_04,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209010025
X-Mailman-Approved-At: Thu, 01 Sep 2022 16:45:35 +1000
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
Cc: christophe.leroy@c-s.fr, Benjamin Gray <bgray@linux.ibm.com>, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KUnit tests for the various combinations of caller/trampoline/target and
kernel/module. They must be run from a module loaded at runtime to
guarantee they have a different TOC to the kernel.

The tests try to mitigate the chance of panicing by restoring the
TOC after every static call. Not all possible errors can be caught
by this, but it makes certain kinds of errors easier to debug.

Currently the large arg count test is failing due to the trampoline
implementation using the stack.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/Kconfig                   |  10 +
 arch/powerpc/kernel/Makefile           |   1 +
 arch/powerpc/kernel/static_call.c      | 104 ++++++++++
 arch/powerpc/kernel/static_call_test.c | 257 +++++++++++++++++++++++++
 4 files changed, 372 insertions(+)
 create mode 100644 arch/powerpc/kernel/static_call_test.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1d5abbeb2c40..39e17c35e885 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1034,6 +1034,16 @@ config PPC_ENABLE_STATIC_CALL
 	  performance results, so it's useful to make them configurable to
 	  allow testing with the generic implementation too.
 
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
index ed3bc361fdb0..93a4ab80b451 100644
--- a/arch/powerpc/kernel/static_call.c
+++ b/arch/powerpc/kernel/static_call.c
@@ -7,6 +7,10 @@
 #include <linux/static_call.h>
 #include <linux/syscalls.h>
 
+#if IS_MODULE(CONFIG_PPC_STATIC_CALL_KUNIT_TEST)
+#include <kunit/test.h>
+#endif
+
 #ifdef CONFIG_PPC64_ELF_ABI_V2
 
 static void* ppc_function_toc(u32 *func) {
@@ -103,3 +107,103 @@ void arch_static_call_transform(void *site, void *tramp, void *func, bool tail)
 		panic("%s: patching failed %pS at %pS\n", __func__, func, tramp);
 }
 EXPORT_SYMBOL_GPL(arch_static_call_transform);
+
+
+#if IS_MODULE(CONFIG_PPC_STATIC_CALL_KUNIT_TEST)
+
+/* The following are some kernel hooks for testing the static call
+ * implementation from the static_call_test module. The bulk of the
+ * assertions are run in that module, except for the TOC checks that
+ * must be done in the core kernel context.
+ */
+
+/* Reserve these registers for testing (same registers as in static_call_test.c) */
+register void* current_toc asm ("r2");
+register void* module_toc asm ("r14");
+register void* actual_module_toc asm ("r15");
+register void* kernel_toc asm ("r16");
+register void* actual_toc asm ("r17");
+
+static void* static_kernel_toc;
+static void* static_actual_toc;
+
+#define fixup_toc(test) \
+	actual_toc = current_toc; \
+	current_toc = kernel_toc; \
+	KUNIT_EXPECT_PTR_EQ(test, kernel_toc, actual_toc)
+
+void ppc_sc_kernel_toc_init(void)
+{
+	static_kernel_toc = kernel_toc;
+	static_actual_toc = actual_toc;
+
+	kernel_toc = current_toc;
+}
+
+void ppc_sc_kernel_toc_exit(void)
+{
+	kernel_toc = static_kernel_toc;
+	actual_toc = static_actual_toc;
+}
+
+int ppc_sc_kernel_target_1(struct kunit* test)
+{
+	fixup_toc(test);
+	return 1;
+}
+
+int ppc_sc_kernel_target_2(struct kunit* test)
+{
+	fixup_toc(test);
+	return 2;
+}
+
+DEFINE_STATIC_CALL(ppc_sc_kernel, ppc_sc_kernel_target_1);
+
+int ppc_sc_kernel_call(struct kunit* test)
+{
+	int ret = static_call(ppc_sc_kernel)(test);
+	fixup_toc(test);
+	return ret;
+}
+
+int ppc_sc_kernel_call_indirect(struct kunit* test, int (*fn)(struct kunit*))
+{
+	int ret = fn(test);
+	fixup_toc(test);
+	return ret;
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
+	fixup_toc(test);
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
+EXPORT_SYMBOL_GPL(ppc_sc_kernel_toc_init);
+EXPORT_SYMBOL_GPL(ppc_sc_kernel_toc_exit);
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
index 000000000000..136227a623b4
--- /dev/null
+++ b/arch/powerpc/kernel/static_call_test.c
@@ -0,0 +1,257 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <kunit/test.h>
+#include <linux/kconfig.h>
+#include <linux/module.h>
+#include <linux/static_call.h>
+
+/*
+ * Tests to ensure correctness in a variety of cases for static calls.
+ *
+ * The tests focus on ensuring the TOC is kept consistent across the
+ * module-kernel boundary, as compilers can't see that a trampoline
+ * defined locally in the kernel might be jumping to a function in a
+ * module. This makes it important that these tests are compiled as a
+ * module, so the TOC will be different to the kernel's.
+ *
+ * Register variables are used to allow easy position independent
+ * correction of a TOC before it is used for anything. This means
+ * a failing test doesn't always crash the whole kernel. The registers
+ * are initialised on entry and restored on exit of each test using
+ * KUnit's init and exit hooks. The tests only call internal and
+ * specially defined kernel functions, so the use of these registers
+ * will not clobber anything else.
+ */
+
+extern void ppc_sc_kernel_toc_init(void);
+extern void ppc_sc_kernel_toc_exit(void);
+DECLARE_STATIC_CALL(ppc_sc_kernel, int(struct kunit*));
+extern int ppc_sc_kernel_target_1(struct kunit* test);
+extern int ppc_sc_kernel_target_2(struct kunit* test);
+extern long ppc_sc_kernel_target_big(struct kunit* test,
+				     long a,
+				     long b,
+				     long c,
+				     long d,
+				     long e,
+				     long f,
+				     long g,
+				     long h,
+				     long i);
+extern int ppc_sc_kernel_call(struct kunit* test);
+extern int ppc_sc_kernel_call_indirect(struct kunit* test, int(*fn)(struct kunit*));
+
+/* Registers we reserve for use while testing */
+register void* current_toc asm ("r2");
+register void* module_toc asm ("r14");
+register void* actual_toc asm ("r15");
+register void* kernel_toc asm ("r16");
+register void* actual_kernel_toc asm ("r17");
+
+/* To hold a copy of the old register values while we test */
+static void* static_module_toc;
+static void* static_actual_toc;
+
+/* Restore the TOC to a known correct value and check if the prior value was bad */
+#define fixup_toc(test) \
+	actual_toc = current_toc; \
+	current_toc = module_toc; \
+	KUNIT_EXPECT_PTR_EQ(test, module_toc, actual_toc)
+
+static int module_target_11(struct kunit *test)
+{
+	fixup_toc(test);
+	return 11;
+}
+
+static int module_target_12(struct kunit *test)
+{
+	fixup_toc(test);
+	return 12;
+}
+
+DEFINE_STATIC_CALL(module_sc, module_target_11);
+
+DEFINE_STATIC_CALL_RET0(module_sc_ret0, long(void));
+DEFINE_STATIC_CALL_NULL(module_sc_null, long(long));
+
+static long add_one(long *val)
+{
+	return (*val)++;
+}
+
+static void null_function_test(struct kunit *test)
+{
+	long val = 0;
+
+	/* Check argument unconditionally evaluated */
+	static_call_cond(module_sc_null)(add_one(&val));
+	fixup_toc(test);
+	KUNIT_ASSERT_EQ(test, 1, val);
+}
+
+static void return_zero_test(struct kunit *test)
+{
+	long ret;
+	KUNIT_ASSERT_EQ(test, 0, static_call(module_sc_ret0)());
+
+	static_call_update(ppc_sc_kernel, (void*) __static_call_return0);
+	ret = static_call(ppc_sc_kernel)(test);
+	fixup_toc(test);
+	KUNIT_ASSERT_EQ(test, 0, ret);
+
+	static_call_update(module_sc, (void*) __static_call_return0);
+	ret = static_call(module_sc)(test);
+	fixup_toc(test);
+	KUNIT_ASSERT_EQ(test, 0, ret);
+}
+
+static void kernel_kernel_kernel_test(struct kunit *test)
+{
+	static_call_update(ppc_sc_kernel, ppc_sc_kernel_target_1);
+	KUNIT_EXPECT_EQ(test, 1, ppc_sc_kernel_call(test));
+
+	static_call_update(ppc_sc_kernel, ppc_sc_kernel_target_2);
+	KUNIT_EXPECT_EQ(test, 2, ppc_sc_kernel_call(test));
+}
+
+static void kernel_kernel_module_test(struct kunit *test)
+{
+	static_call_update(ppc_sc_kernel, module_target_11);
+	KUNIT_EXPECT_EQ(test, 11, ppc_sc_kernel_call(test));
+
+	static_call_update(ppc_sc_kernel, module_target_12);
+	KUNIT_EXPECT_EQ(test, 12, ppc_sc_kernel_call(test));
+}
+
+static void kernel_module_kernel_test(struct kunit *test)
+{
+	static_call_update(module_sc, ppc_sc_kernel_target_1);
+	KUNIT_EXPECT_EQ(test, 1, ppc_sc_kernel_call_indirect(test, static_call(module_sc)));
+
+	static_call_update(module_sc, ppc_sc_kernel_target_2);
+	KUNIT_EXPECT_EQ(test, 2, ppc_sc_kernel_call_indirect(test, static_call(module_sc)));
+}
+
+static void kernel_module_module_test(struct kunit *test)
+{
+	static_call_update(module_sc, module_target_11);
+	KUNIT_EXPECT_EQ(test, 11, ppc_sc_kernel_call_indirect(test, static_call(module_sc)));
+
+	static_call_update(module_sc, module_target_12);
+	KUNIT_EXPECT_EQ(test, 12, ppc_sc_kernel_call_indirect(test, static_call(module_sc)));
+}
+
+static void module_kernel_kernel_test(struct kunit *test)
+{
+	long ret;
+
+	static_call_update(ppc_sc_kernel, ppc_sc_kernel_target_1);
+	ret = static_call(ppc_sc_kernel)(test);
+	fixup_toc(test);
+	KUNIT_EXPECT_EQ(test, 1, ret);
+
+	static_call_update(ppc_sc_kernel, ppc_sc_kernel_target_2);
+	ret = static_call(ppc_sc_kernel)(test);
+	fixup_toc(test);
+	KUNIT_EXPECT_EQ(test, 2, ret);
+}
+
+static void module_kernel_module_test(struct kunit *test)
+{
+	long ret;
+
+	static_call_update(ppc_sc_kernel, module_target_11);
+	ret = static_call(ppc_sc_kernel)(test);
+	fixup_toc(test);
+	KUNIT_EXPECT_EQ(test, 11, ret);
+
+	static_call_update(ppc_sc_kernel, module_target_12);
+	ret = static_call(ppc_sc_kernel)(test);
+	fixup_toc(test);
+	KUNIT_EXPECT_EQ(test, 12, ret);
+}
+
+static void module_module_kernel_test(struct kunit *test)
+{
+	long ret;
+
+	static_call_update(module_sc, ppc_sc_kernel_target_1);
+	ret = static_call(module_sc)(test);
+	fixup_toc(test);
+	KUNIT_EXPECT_EQ(test, 1, ret);
+
+	static_call_update(module_sc, ppc_sc_kernel_target_2);
+	ret = static_call(module_sc)(test);
+	fixup_toc(test);
+	KUNIT_EXPECT_EQ(test, 2,ret);
+}
+
+static void module_module_module_test(struct kunit *test)
+{
+	long ret;
+
+	static_call_update(module_sc, module_target_11);
+	ret = static_call(module_sc)(test);
+	fixup_toc(test);
+	KUNIT_EXPECT_EQ(test, 11, ret);
+
+	static_call_update(module_sc, module_target_12);
+	ret = static_call(module_sc)(test);
+	fixup_toc(test);
+	KUNIT_EXPECT_EQ(test, 12, ret);
+}
+
+DEFINE_STATIC_CALL(module_sc_stack_params, ppc_sc_kernel_target_big);
+
+static void stack_parameters_test(struct kunit *test)
+{
+	long m = 0x1234567887654321;
+	long ret = static_call(module_sc_stack_params)(test, m, m, m, m, m, m, m, m, m);
+	fixup_toc(test);
+	KUNIT_ASSERT_EQ(test, ~m, ret);
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
+static int ppc_static_call_test_init(struct kunit *test)
+{
+	static_module_toc = module_toc;
+	static_actual_toc = actual_toc;
+	module_toc = current_toc;
+
+	ppc_sc_kernel_toc_init();
+
+	return 0;
+}
+
+static void ppc_static_call_test_exit(struct kunit *test)
+{
+	module_toc = static_module_toc;
+	actual_toc = static_actual_toc;
+
+	ppc_sc_kernel_toc_exit();
+}
+
+static struct kunit_suite ppc_static_call_test_suite = {
+	.name = "ppc-static-call",
+	.test_cases = static_call_test_cases,
+	.init = ppc_static_call_test_init,
+	.exit = ppc_static_call_test_exit,
+};
+kunit_test_suite(ppc_static_call_test_suite);
+
+MODULE_AUTHOR("Benjamin Gray <bgray@linux.ibm.com>");
+MODULE_LICENSE("GPL");
-- 
2.37.2

