Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FF586C587
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 10:39:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XEX7amAJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlmQ22y3Dz3vZZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 20:39:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XEX7amAJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlmNf3ws4z3ddR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 20:37:54 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41T9BPwV011400;
	Thu, 29 Feb 2024 09:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=bQYEGg4BSG0fVHOhIF1UXJr4cERBP6o9JirBT7VNhwA=;
 b=XEX7amAJ0+PemvabDOC/g3Dod9tUCYyvIprwMdQp+baNpdiDWeljKFSSNSWa1yrNY3BO
 Ry1ORpV68h1H3ZigC+sWmfSmbtIaBl6mLIuqkB//13rZizaMAREg8pV1m5uRtiHlxj9N
 w8ylzlZNy7RGBhfg+xISoLzVxe+i4HrHkNNHQ2F8WV4YjR20huCqLKZG29ka+Dn2tPWY
 2Q2NoAx4TfAZ+u6UA84oymm735r4iQj4yBIuTZgbM4uSyMBE7br18wDXV2kjAnpaRmwV
 NhDCx0QyTiPd2yaa5Tno09kOiDMMZldOprWkbgiyrzHDKcrfuxp7Nkeh0vlx5y5QYWRr rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wjpxg0wx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 09:37:44 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41T9V3J5016832;
	Thu, 29 Feb 2024 09:37:44 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wjpxg0wwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 09:37:44 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41T8KGmh008154;
	Thu, 29 Feb 2024 09:37:43 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wfv9mm7mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 09:37:43 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41T9bbri20513406
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Feb 2024 09:37:39 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F6CF20049;
	Thu, 29 Feb 2024 09:37:37 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B58420040;
	Thu, 29 Feb 2024 09:37:33 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.171.62.154])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 29 Feb 2024 09:37:33 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com, shuah@kernel.org
Subject: [PATCH 2/3] selftest/powerpc: Add flags.mk to support pmu buildable   
Date: Thu, 29 Feb 2024 15:07:10 +0530
Message-ID: <20240229093711.581230-2-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240229093711.581230-1-maddy@linux.ibm.com>
References: <20240229093711.581230-1-maddy@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: O-m48-A08bYtultpa9sObrbqQ88L5ES9
X-Proofpoint-ORIG-GUID: 682EoOb3zdUY5nZtDHuQrmcFBhnkv_Sm
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-29_01,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402290072
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Sachin Sant <sachinp@linux.ibm.com>, linux-kselftest@vger.kernel.org
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
a new rule file has been addded by the patch called "flags.mk" under
selftest/powerpc/ folder and is linked to all the Makefile of powerpc/pmu
sub-folders.

Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog RFC:
- Rename the rule file as flags.mk
- Added additional patches to support other sub-folders
  under powerpc/ to be buildable on it own.
link to RFC:
  https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20240225163926.264286-1-maddy@linux.ibm.com/
  
 tools/testing/selftests/powerpc/flags.mk             | 12 ++++++++++++
 tools/testing/selftests/powerpc/pmu/Makefile         |  1 +
 tools/testing/selftests/powerpc/pmu/ebb/Makefile     |  1 +
 .../selftests/powerpc/pmu/event_code_tests/Makefile  |  1 +
 .../selftests/powerpc/pmu/sampling_tests/Makefile    |  1 +
 5 files changed, 16 insertions(+)
 create mode 100644 tools/testing/selftests/powerpc/flags.mk

diff --git a/tools/testing/selftests/powerpc/flags.mk b/tools/testing/selftests/powerpc/flags.mk
new file mode 100644
index 000000000000..28374f470126
--- /dev/null
+++ b/tools/testing/selftests/powerpc/flags.mk
@@ -0,0 +1,12 @@
+#This checks for any ENV variables and add those.
+
+#ifeq ($(GIT_VERSION),)
+GIT_VERSION = $(shell git describe --always --long --dirty || echo "unknown")
+export GIT_VERSION
+#endif
+
+#ifeq ($(CFLAGS),)
+CFLAGS := -std=gnu99 -O2 -Wall -Werror -DGIT_VERSION='"$(GIT_VERSION)"' -I$(selfdir)/powerpc/include $(CFLAGS)
+export CFLAGS
+#endif
+
diff --git a/tools/testing/selftests/powerpc/pmu/Makefile b/tools/testing/selftests/powerpc/pmu/Makefile
index a284fa874a9f..1fcacae1b188 100644
--- a/tools/testing/selftests/powerpc/pmu/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/Makefile
@@ -7,6 +7,7 @@ EXTRA_SOURCES := ../harness.c event.c lib.c ../utils.c
 
 top_srcdir = ../../../../..
 include ../../lib.mk
+include ../flags.mk
 
 all: $(TEST_GEN_PROGS) ebb sampling_tests event_code_tests
 
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/Makefile b/tools/testing/selftests/powerpc/pmu/ebb/Makefile
index b3946ce17e0c..1b39af7c10db 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/ebb/Makefile
@@ -18,6 +18,7 @@ TEST_GEN_PROGS := reg_access_test event_attributes_test cycles_test	\
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
+include ../../flags.mk
 
 # The EBB handler is 64-bit code and everything links against it
 CFLAGS += -m64
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
index 509d4b235b9e..fdb080b3fa65 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
@@ -9,6 +9,7 @@ TEST_GEN_PROGS := group_constraint_pmc56_test group_pmc56_exclude_constraints_te
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
+include ../../flags.mk
 
 CFLAGS += -m64
 
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
index d45892151e05..9f79bec5fce7 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
@@ -9,6 +9,7 @@ TEST_GEN_PROGS := mmcr0_exceptionbits_test mmcr0_cc56run_test mmcr0_pmccext_test
 
 top_srcdir = ../../../../../..
 include ../../../lib.mk
+include ../../flags.mk
 
 CFLAGS += -m64
 
-- 
2.43.2

