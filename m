Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B61862BCD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Feb 2024 17:40:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=avh5QqUi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjTyC6RnZz3dwr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 03:40:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=avh5QqUi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjTxV0Zxgz30dn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 03:39:57 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41PCsqFB026625;
	Sun, 25 Feb 2024 16:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Alr2FSLYzKuixWhlv26hCq87x1hyAye/urFhf7yXrso=;
 b=avh5QqUiMoDPa7kv6vaHBjKNSDFyZwWYcMxath6IWi6ThyI5uGHXfKaVocGtaZPtsiNJ
 xnr85hXeIxfaHP1j0phEu1IuBg0Yh5eUVIh8Jqcw0vC793XOYxeeCHv5eYYh1b8xF7a4
 KX9OzJUldbbHuF50RBbvqCkj3qbZrcawQCz69KJ4PC2zo+6VZhDAV9UBqaCSOgDkDldY
 yw549QbCJNB+VuHVr12h018xYRCj6BEtkCzcxDy2/frQUeh/f9nahWmMYY1lkocB01BX
 J54iKFVsbs6WdlGeWsbWZ7Ct566LQVBE4xzp62GsOpTrZBHReEb4ZGCwrJROsGfL2XCX GA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wfxgjyfgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 25 Feb 2024 16:39:40 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41PGdeaC012337;
	Sun, 25 Feb 2024 16:39:40 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wfxgjyfgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 25 Feb 2024 16:39:40 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41PDZ9hp024122;
	Sun, 25 Feb 2024 16:39:39 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wfw0jucdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 25 Feb 2024 16:39:39 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41PGdXgA21955102
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 25 Feb 2024 16:39:36 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D465120043;
	Sun, 25 Feb 2024 16:39:33 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8701D20040;
	Sun, 25 Feb 2024 16:39:30 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.171.84.39])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 25 Feb 2024 16:39:30 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com, shuah@kernel.org
Subject: [RFC PATCH] selftest/powerpc: Add rule file to address sub-folder test fail
Date: Sun, 25 Feb 2024 22:09:26 +0530
Message-ID: <20240225163926.264286-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 48zzZjXAcKAznlOdz8lmZq2fXa91lTv3
X-Proofpoint-GUID: B5D43aV3fZ3BWHePxa2Cel17nRBvLgNk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-25_18,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402250133
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When running `make -C powerpc/pmu run_tests` from top level selftests
directory, currently this error is being reported

make: Entering directory '/home/maddy/linux/tools/testing/selftests/powerpc/pmu'
Makefile:40: warning: overriding recipe for target 'emit_tests'
../../lib.mk:111: warning: ignoring old recipe for target 'emit_tests'
gcc -m64    count_instructions.c ../harness.c event.c lib.c ../utils.c loop.S  -o /home/maddy/selftest_output//count_instructions
In file included from count_instructions.c:13:
event.h:12:10: fatal error: utils.h: No such file or directory
   12 | #include "utils.h"
      |          ^~~~~~~~~
compilation terminated.

This is due to missing of include path in CFLAGS. That is, CFLAGS and
GIT_VERSION macros are defined in the powerpc/ folder Makefile which
in this case not involved.

To address the failure incase of executing specific sub-folder test directly,
a new rule file has been addded by the patch called "include.mk" under
selftest/powerpc/ folder and is linked to all Makefile of powerpc/pmu
sub-folders.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 tools/testing/selftests/powerpc/include.mk             | 10 ++++++++++
 tools/testing/selftests/powerpc/pmu/Makefile           |  1 +
 tools/testing/selftests/powerpc/pmu/ebb/Makefile       |  1 +
 .../selftests/powerpc/pmu/event_code_tests/Makefile    |  1 +
 .../selftests/powerpc/pmu/sampling_tests/Makefile      |  1 +
 5 files changed, 14 insertions(+)
 create mode 100644 tools/testing/selftests/powerpc/include.mk

diff --git a/tools/testing/selftests/powerpc/include.mk b/tools/testing/selftests/powerpc/include.mk
new file mode 100644
index 000000000000..18db36b94f36
--- /dev/null
+++ b/tools/testing/selftests/powerpc/include.mk
@@ -0,0 +1,10 @@
+#This checks for any specific ENV variables missing and add those.
+
+ifeq ($(GIT_VERSION),)
+GIT_VERSION = $(shell git describe --always --long --dirty || echo "unknown")
+endif
+
+ifeq ($(CFLAGS),)
+CFLAGS := -std=gnu99 -O2 -Wall -Werror -DGIT_VERSION='"$(GIT_VERSION)"' -I$(CURDIR)/../include $(CFLAGS)
+export CFLAGS
+endif
diff --git a/tools/testing/selftests/powerpc/pmu/Makefile b/tools/testing/selftests/powerpc/pmu/Makefile
index a284fa874a9f..93672f322027 100644
--- a/tools/testing/selftests/powerpc/pmu/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/Makefile
@@ -7,6 +7,7 @@ EXTRA_SOURCES := ../harness.c event.c lib.c ../utils.c
 
 top_srcdir = ../../../../..
 include ../../lib.mk
+include ../include.mk
 
 all: $(TEST_GEN_PROGS) ebb sampling_tests event_code_tests
 
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/Makefile b/tools/testing/selftests/powerpc/pmu/ebb/Makefile
index 010160690227..2faadb7fd3ad 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/ebb/Makefile
@@ -28,6 +28,7 @@ TEST_GEN_PROGS := reg_access_test event_attributes_test cycles_test	\
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
+include ../../include.mk
 
 $(TEST_GEN_PROGS): ../../harness.c ../../utils.c ../event.c ../lib.c \
 	       ebb.c ebb_handler.S trace.c busy_loop.S
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
index 4e07d7046457..7c7dd4cf9769 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
@@ -11,5 +11,6 @@ TEST_GEN_PROGS := group_constraint_pmc56_test group_pmc56_exclude_constraints_te
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
+include ../../include.mk
 
 $(TEST_GEN_PROGS): ../../harness.c ../../utils.c ../event.c ../lib.c ../sampling_tests/misc.h ../sampling_tests/misc.c
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
index 9e67351fb252..51b02fe2c8ad 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
@@ -11,5 +11,6 @@ TEST_GEN_PROGS := mmcr0_exceptionbits_test mmcr0_cc56run_test mmcr0_pmccext_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
+include ../../include.mk
 
 $(TEST_GEN_PROGS): ../../harness.c ../../utils.c ../event.c ../lib.c misc.c misc.h ../loop.S ../branch_loops.S
-- 
2.43.2

