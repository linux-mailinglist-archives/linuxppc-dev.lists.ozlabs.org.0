Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3474435D313
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 00:28:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FK3Kn0Zkzz3c9L
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 08:28:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Mqy25Q8G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Mqy25Q8G; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FK3JS16hBz3bSx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 08:27:19 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13CMIXAM131021; Mon, 12 Apr 2021 18:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=msradyuG5NJC9aqhZahq+WCgfK58uBLk67FmafqdHn4=;
 b=Mqy25Q8GbVekwMbN7WZkvua33CKPpq0X/DoXTQHB7WJra+FC1JvTiLbpLqysz4NsQd0H
 LZKbMZOd5XiZHg0WVGQd9Ryh2Eo+6y27QsrxFxhnW8nhoFoCuaHlczVfXH8C6QV0GwRj
 Z87SMSsjT2FYIHeF7WMhVmYh68ogYBmPcQF7iVdhaaSQsj2cupl9I7td24UrFD7p30hM
 HWBbJ9ERd4CmE5zIMi3El6Q/4cItGc/uVNhlmFLotXCIICmhgB09Ej6R99G83vOdo8cz
 /dI10Km6Cmk7r5wSi4zqHaGt3RKFr3aEiJaDpLvneG/xCyAoUwkceMlHmZvr9orTJMPS dA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37uskaemw8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Apr 2021 18:27:06 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13CMBkVR026055;
 Mon, 12 Apr 2021 22:27:05 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 37u3n98mv7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Apr 2021 22:27:05 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13CMR4WZ31719914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Apr 2021 22:27:04 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FFEEBE058;
 Mon, 12 Apr 2021 22:27:04 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8613BE054;
 Mon, 12 Apr 2021 22:27:02 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.82.34])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 12 Apr 2021 22:27:02 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 1/2] KVM: selftests: Add max vcpus test for ppc64le
Date: Mon, 12 Apr 2021 19:26:55 -0300
Message-Id: <20210412222656.3466987-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210412222656.3466987-1-farosas@linux.ibm.com>
References: <20210412222656.3466987-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ld-0eL_9TGkI151Jn-98zDko5PJ6Q2gV
X-Proofpoint-GUID: Ld-0eL_9TGkI151Jn-98zDko5PJ6Q2gV
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-12_11:2021-04-12,
 2021-04-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104120142
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
Cc: linuxppc-dev@lists.ozlabs.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

$ cd tools/selftests/kvm
$ make ARCH=powerpc
$ ulimit -n
4096
$ ./kvm_create_max_vcpus

Note the test currently fails in P9 with:

KVM_CAP_MAX_VCPU_ID: 16384
KVM_CAP_MAX_VCPUS: 2048
Testing creating 2048 vCPUs, with IDs 0...2047.
Testing creating 2048 vCPUs, with IDs 14336...16383.
==== Test Assertion Failure ====
  lib/kvm_util.c:983: vcpu->fd >= 0
  pid=74066 tid=74066 - Invalid argument
     1  0x0000000010002813: vm_vcpu_add at kvm_util.c:982
     2 0x000000001000176f: test_vcpu_creation at
     kvm_create_max_vcpus.c:34 (discriminator 3)
     3  0x00000000100014e7: main at kvm_create_max_vcpus.c:62
     4  0x00007fff89454077: ?? ??:0
     5  0x00007fff89454263: ?? ??:0
  KVM_CREATE_VCPU failed, rc: -1 errno: 22

Signed-off-by Fabiano Rosas <farosas@linux.ibm.com>
---
 tools/testing/selftests/kvm/Makefile          |  7 +++
 .../testing/selftests/kvm/include/kvm_util.h  |  7 +++
 .../selftests/kvm/include/powerpc/processor.h |  7 +++
 tools/testing/selftests/kvm/lib/kvm_util.c    |  5 +++
 .../selftests/kvm/lib/powerpc/processor.c     | 44 +++++++++++++++++++
 5 files changed, 70 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/include/powerpc/processor.h
 create mode 100644 tools/testing/selftests/kvm/lib/powerpc/processor.c

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 67eebb53235f..f1778b3ed093 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -33,10 +33,15 @@ ifeq ($(ARCH),s390)
 	UNAME_M := s390x
 endif
 
+ifeq ($(ARCH),powerpc)
+	UNAME_M := powerpc
+endif
+
 LIBKVM = lib/assert.c lib/elf.c lib/io.c lib/kvm_util.c lib/sparsebit.c lib/test_util.c lib/guest_modes.c lib/perf_test_util.c
 LIBKVM_x86_64 = lib/x86_64/processor.c lib/x86_64/vmx.c lib/x86_64/svm.c lib/x86_64/ucall.c lib/x86_64/handlers.S
 LIBKVM_aarch64 = lib/aarch64/processor.c lib/aarch64/ucall.c
 LIBKVM_s390x = lib/s390x/processor.c lib/s390x/ucall.c lib/s390x/diag318_test_handler.c
+LIBKVM_powerpc = lib/powerpc/processor.c
 
 TEST_GEN_PROGS_x86_64 = x86_64/cr4_cpuid_sync_test
 TEST_GEN_PROGS_x86_64 += x86_64/get_msr_index_features
@@ -93,6 +98,8 @@ TEST_GEN_PROGS_s390x += dirty_log_test
 TEST_GEN_PROGS_s390x += kvm_create_max_vcpus
 TEST_GEN_PROGS_s390x += set_memory_region_test
 
+TEST_GEN_PROGS_powerpc += kvm_create_max_vcpus
+
 TEST_GEN_PROGS += $(TEST_GEN_PROGS_$(UNAME_M))
 LIBKVM += $(LIBKVM_$(UNAME_M))
 
diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 0f4258eaa629..d4f6e079592b 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -43,6 +43,7 @@ enum vm_guest_mode {
 	VM_MODE_P40V48_4K,
 	VM_MODE_P40V48_64K,
 	VM_MODE_PXXV48_4K,	/* For 48bits VA but ANY bits PA */
+	VM_MODE_P51V52_64K,	/* ???: include/asm/book3s/64/pgtable.h says P53 */
 	NUM_VM_MODES,
 };
 
@@ -64,6 +65,12 @@ enum vm_guest_mode {
 #define MIN_PAGE_SHIFT			12U
 #define ptes_per_page(page_size)	((page_size) / 16)
 
+#elif defined(__powerpc__)
+
+#define VM_MODE_DEFAULT			VM_MODE_P51V52_64K
+#define MIN_PAGE_SHIFT			16U
+#define ptes_per_page(page_size)	((page_size) / 8)
+
 #endif
 
 #define MIN_PAGE_SIZE		(1U << MIN_PAGE_SHIFT)
diff --git a/tools/testing/selftests/kvm/include/powerpc/processor.h b/tools/testing/selftests/kvm/include/powerpc/processor.h
new file mode 100644
index 000000000000..c75197b349a8
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/powerpc/processor.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * powerpc processor specific defines
+ */
+#ifndef SELFTEST_KVM_PROCESSOR_H
+#define SELFTEST_KVM_PROCESSOR_H
+#endif
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index b8849a1aca79..2e9dafc03a12 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -151,6 +151,7 @@ const char * const vm_guest_mode_string[] = {
 	"PA-bits:40,  VA-bits:48,  4K pages",
 	"PA-bits:40,  VA-bits:48, 64K pages",
 	"PA-bits:ANY, VA-bits:48,  4K pages",
+	"PA-bits:51,  VA-bits:52, 64K pages",
 };
 _Static_assert(sizeof(vm_guest_mode_string)/sizeof(char *) == NUM_VM_MODES,
 	       "Missing new mode strings?");
@@ -163,6 +164,7 @@ const struct vm_guest_mode_params vm_guest_mode_params[] = {
 	{ 40, 48,  0x1000, 12 },
 	{ 40, 48, 0x10000, 16 },
 	{  0,  0,  0x1000, 12 },
+	{ 51, 52, 0x10000, 16 },
 };
 _Static_assert(sizeof(vm_guest_mode_params)/sizeof(struct vm_guest_mode_params) == NUM_VM_MODES,
 	       "Missing new mode params?");
@@ -246,6 +248,9 @@ struct kvm_vm *vm_create(enum vm_guest_mode mode, uint64_t phy_pages, int perm)
 		TEST_FAIL("VM_MODE_PXXV48_4K not supported on non-x86 platforms");
 #endif
 		break;
+	case VM_MODE_P51V52_64K:
+		vm->pgtable_levels = 4;
+		break;
 	default:
 		TEST_FAIL("Unknown guest mode, mode: 0x%x", mode);
 	}
diff --git a/tools/testing/selftests/kvm/lib/powerpc/processor.c b/tools/testing/selftests/kvm/lib/powerpc/processor.c
new file mode 100644
index 000000000000..e86b8516863b
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/powerpc/processor.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * powerpc specific code
+ */
+#include "kvm_util.h"
+#include "../kvm_util_internal.h"
+#include "processor.h"
+
+
+void virt_pg_map(struct kvm_vm *vm, uint64_t gva, uint64_t gpa, uint32_t memslot)
+{
+	TEST_FAIL("%s not implemented", __func__);
+}
+
+vm_paddr_t addr_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
+{
+	TEST_FAIL("%s not implemented", __func__);
+	return 0;
+}
+
+void virt_pgd_alloc(struct kvm_vm *vm, uint32_t pgd_memslot)
+{
+	TEST_FAIL("%s not implemented", __func__);
+}
+
+void vm_vcpu_add_default(struct kvm_vm *vm, uint32_t vcpuid, void *guest_code)
+{
+	TEST_FAIL("%s not implemented", __func__);
+}
+
+void virt_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
+{
+	TEST_FAIL("%s not implemented", __func__);
+}
+
+void vcpu_dump(FILE *stream, struct kvm_vm *vm, uint32_t vcpuid, uint8_t indent)
+{
+	TEST_FAIL("%s not implemented", __func__);
+}
+
+void assert_on_unhandled_exception(struct kvm_vm *vm, uint32_t vcpuid)
+{
+	TEST_ASSERT(false, "Unhandled exception");
+}
-- 
2.29.2

