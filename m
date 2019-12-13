Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7909711DE8F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 08:22:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Z2Dy2cy4zDr5k
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 18:22:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=harish@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Z2Bp5sSFzDr58
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 18:20:49 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBD7KBM2090058
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 02:20:45 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wurcrfk18-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 02:20:45 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <harish@linux.ibm.com>;
 Fri, 13 Dec 2019 07:20:44 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 13 Dec 2019 07:20:42 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBD7KegN41091310
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Dec 2019 07:20:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 760254C040;
 Fri, 13 Dec 2019 07:20:40 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E5CA4C044;
 Fri, 13 Dec 2019 07:20:39 +0000 (GMT)
Received: from dhcp-9-109-245-100.in.ibm.com (unknown [9.109.245.100])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 13 Dec 2019 07:20:39 +0000 (GMT)
From: Harish <harish@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] Fix vm selftest to run tests with make
Date: Fri, 13 Dec 2019 12:50:36 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19121307-0028-0000-0000-000003C814AE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121307-0029-0000-0000-0000248B50DF
Message-Id: <20191213072036.11170-1-harish@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-13_01:2019-12-12,2019-12-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 malwarescore=0 suspectscore=4 adultscore=0 mlxlogscore=325
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912130058
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
Cc: Harish <harish@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The last patch overrides the ARCH env variable and hence runs
using make fails with the following.

$ make -C vm/
make: Entering directory '/home/harish/linux/tools/testing/selftests/vm'
make --no-builtin-rules ARCH=ppc64le -C ../../../.. headers_install
make[1]: Entering directory '/home/harish/linux'
Makefile:652: arch/ppc64le/Makefile: No such file or directory
make[1]: *** No rule to make target 'arch/ppc64le/Makefile'.  Stop.
make[1]: Leaving directory '/home/harish/linux'
make: *** [../lib.mk:50: khdr] Error 2
make: Leaving directory '/home/harish/linux/tools/testing/selftests/vm'

This patch fixes it and also handles ppc64/ppc64le arch's to build
and run 64bit tests

Signed-off-by: Harish <harish@linux.ibm.com>
---
 tools/testing/selftests/vm/Makefile    | 5 +++--
 tools/testing/selftests/vm/run_vmtests | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/vm/Makefile
index 7f9a8a8c31da..ef6218283b68 100644
--- a/tools/testing/selftests/vm/Makefile
+++ b/tools/testing/selftests/vm/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for vm selftests
 uname_M := $(shell uname -m 2>/dev/null || echo not)
-ARCH ?= $(shell echo $(uname_M) | sed -e 's/aarch64.*/arm64/')
+ARCH_USED ?= $(shell echo $(uname_M) | sed -e 's/aarch64.*/arm64/' -e 's/ppc64.*/ppc64/')
 
 CFLAGS = -Wall -I ../../../../usr/include $(EXTRA_CFLAGS)
 LDLIBS = -lrt
@@ -19,11 +19,12 @@ TEST_GEN_FILES += thuge-gen
 TEST_GEN_FILES += transhuge-stress
 TEST_GEN_FILES += userfaultfd
 
-ifneq (,$(filter $(ARCH),arm64 ia64 mips64 parisc64 ppc64 riscv64 s390x sh64 sparc64 x86_64))
+ifneq (,$(filter $(ARCH_USED),arm64 ia64 mips64 parisc64 ppc64 riscv64 s390x sh64 sparc64 x86_64))
 TEST_GEN_FILES += va_128TBswitch
 TEST_GEN_FILES += virtual_address_range
 endif
 
+
 TEST_PROGS := run_vmtests
 
 TEST_FILES := test_vmalloc.sh
diff --git a/tools/testing/selftests/vm/run_vmtests b/tools/testing/selftests/vm/run_vmtests
index a692ea828317..da63dfb9713a 100755
--- a/tools/testing/selftests/vm/run_vmtests
+++ b/tools/testing/selftests/vm/run_vmtests
@@ -61,7 +61,7 @@ fi
 #filter 64bit architectures
 ARCH64STR="arm64 ia64 mips64 parisc64 ppc64 riscv64 s390x sh64 sparc64 x86_64"
 if [ -z $ARCH ]; then
-  ARCH=`uname -m 2>/dev/null | sed -e 's/aarch64.*/arm64/'`
+  ARCH=`uname -m 2>/dev/null | sed -e 's/aarch64.*/arm64/' -e 's/ppc64.*/ppc64/'`
 fi
 VADDR64=0
 echo "$ARCH64STR" | grep $ARCH && VADDR64=1
-- 
2.21.0

