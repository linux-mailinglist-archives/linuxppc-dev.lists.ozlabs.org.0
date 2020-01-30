Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4591614D6FC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 08:21:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487Wxh1cClzDqfD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 18:21:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487Vzl5RmYzDqPk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 17:38:27 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00U6bJ1o032024
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 01:38:25 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xu5x9ntq3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 01:38:24 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sandipan@linux.ibm.com>;
 Thu, 30 Jan 2020 06:38:23 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 30 Jan 2020 06:38:19 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00U6cHr347055070
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jan 2020 06:38:17 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2BDE4C046;
 Thu, 30 Jan 2020 06:38:17 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 216044C040;
 Thu, 30 Jan 2020 06:38:15 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 30 Jan 2020 06:38:14 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: shuah@kernel.org, skhan@linuxfoundation.org,
 linux-kselftest@vger.kernel.org
Subject: [PATCH v18 24/24] selftests: vm: pkeys: Fix multilib builds for x86
Date: Thu, 30 Jan 2020 12:07:06 +0530
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580365432.git.sandipan@linux.ibm.com>
References: <cover.1580365432.git.sandipan@linux.ibm.com>
In-Reply-To: <cover.1580365432.git.sandipan@linux.ibm.com>
References: <cover.1580365432.git.sandipan@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 20013006-0008-0000-0000-0000034DFB01
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20013006-0009-0000-0000-00004A6E7A34
Message-Id: <25d97f793aade305356f52cf85272b5a6b170fbd.1580365432.git.sandipan@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-30_01:2020-01-28,
 2020-01-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001300042
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
Cc: linux-arch@vger.kernel.org, fweimer@redhat.com, dave.hansen@intel.com,
 aneesh.kumar@linux.ibm.com, x86@kernel.org, linuxram@us.ibm.com,
 mhocko@kernel.org, linux-mm@kvack.org, mingo@redhat.com, msuchanek@suse.de,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This ensures that both 32-bit and 64-bit binaries are generated
when this is built on a x86_64 system. Most of the changes have
been borrowed from tools/testing/selftests/x86/Makefile.

Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
---
 tools/testing/selftests/vm/Makefile | 72 +++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/vm/Makefile
index 4e9c741be6af..82031f84af21 100644
--- a/tools/testing/selftests/vm/Makefile
+++ b/tools/testing/selftests/vm/Makefile
@@ -18,7 +18,30 @@ TEST_GEN_FILES += on-fault-limit
 TEST_GEN_FILES += thuge-gen
 TEST_GEN_FILES += transhuge-stress
 TEST_GEN_FILES += userfaultfd
+
+ifeq ($(ARCH),x86_64)
+CAN_BUILD_I386 := $(shell ./../x86/check_cc.sh $(CC) ../x86/trivial_32bit_program.c -m32)
+CAN_BUILD_X86_64 := $(shell ./../x86/check_cc.sh $(CC) ../x86/trivial_64bit_program.c)
+CAN_BUILD_WITH_NOPIE := $(shell ./../x86/check_cc.sh $(CC) ../x86/trivial_program.c -no-pie)
+
+TARGETS := protection_keys
+BINARIES_32 := $(TARGETS:%=%_32)
+BINARIES_64 := $(TARGETS:%=%_64)
+
+ifeq ($(CAN_BUILD_WITH_NOPIE),1)
+CFLAGS += -no-pie
+endif
+
+ifeq ($(CAN_BUILD_I386),1)
+TEST_GEN_FILES += $(BINARIES_32)
+endif
+
+ifeq ($(CAN_BUILD_X86_64),1)
+TEST_GEN_FILES += $(BINARIES_64)
+endif
+else
 TEST_GEN_FILES += protection_keys
+endif
 
 ifneq (,$(filter $(ARCH),arm64 ia64 mips64 parisc64 ppc64 riscv64 s390x sh64 sparc64 x86_64))
 TEST_GEN_FILES += va_128TBswitch
@@ -32,6 +55,55 @@ TEST_FILES := test_vmalloc.sh
 KSFT_KHDR_INSTALL := 1
 include ../lib.mk
 
+ifeq ($(ARCH),x86_64)
+BINARIES_32 := $(patsubst %,$(OUTPUT)/%,$(BINARIES_32))
+BINARIES_64 := $(patsubst %,$(OUTPUT)/%,$(BINARIES_64))
+
+define gen-target-rule-32
+$(1) $(1)_32: $(OUTPUT)/$(1)_32
+.PHONY: $(1) $(1)_32
+endef
+
+define gen-target-rule-64
+$(1) $(1)_64: $(OUTPUT)/$(1)_64
+.PHONY: $(1) $(1)_64
+endef
+
+ifeq ($(CAN_BUILD_I386),1)
+$(BINARIES_32): CFLAGS += -m32
+$(BINARIES_32): LDLIBS += -lrt -ldl -lm
+$(BINARIES_32): %_32: %.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
+$(foreach t,$(TARGETS),$(eval $(call gen-target-rule-32,$(t))))
+endif
+
+ifeq ($(CAN_BUILD_X86_64),1)
+$(BINARIES_64): CFLAGS += -m64
+$(BINARIES_64): LDLIBS += -lrt -ldl
+$(BINARIES_64): %_64: %.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
+$(foreach t,$(TARGETS),$(eval $(call gen-target-rule-64,$(t))))
+endif
+
+# x86_64 users should be encouraged to install 32-bit libraries
+ifeq ($(CAN_BUILD_I386)$(CAN_BUILD_X86_64),01)
+all: warn_32bit_failure
+
+warn_32bit_failure:
+	@echo "Warning: you seem to have a broken 32-bit build" 2>&1;		\
+	echo  "environment. This will reduce test coverage of 64-bit" 2>&1;	\
+	echo  "kernels. If you are using a Debian-like distribution," 2>&1;	\
+	echo  "try:"; 2>&1;							\
+	echo  "";								\
+	echo  "  apt-get install gcc-multilib libc6-i386 libc6-dev-i386";	\
+	echo  "";								\
+	echo  "If you are using a Fedora-like distribution, try:";		\
+	echo  "";								\
+	echo  "  yum install glibc-devel.*i686";				\
+	exit 0;
+endif
+endif
+
 $(OUTPUT)/userfaultfd: LDLIBS += -lpthread
 
 $(OUTPUT)/mlock-random-test: LDLIBS += -lcap
-- 
2.17.1

