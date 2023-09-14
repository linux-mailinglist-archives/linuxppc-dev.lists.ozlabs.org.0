Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5B07A0B6C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 19:19:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=McuORjNe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmkZp5hyWz3cnP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 03:19:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=McuORjNe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmkYw304tz3c2D
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 03:18:44 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38EHCbFL006063;
	Thu, 14 Sep 2023 17:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=hyyxXXbJP8MbsVwznRijL34vXkWY9+6BSa40pgKnS+8=;
 b=McuORjNe3RElPrFJIwpkViLlk7r1BVwpCLQdA3zlfVbFhc8EkjpTrxdElTXSxuWmV7MY
 gFB48p5dfJPAraOMQb3d7eNDKafE+8whOrlms4mXuYQrNVvv5Afkhv/rYxaVZRj9Hp7p
 OScBqNc4rpi1h3r74l57TAomJFG+JYUy2eISIpSFKzIAoGA/CnE0y2YqTHKB/eWWIbj9
 Mi7PhoChpiN2i6ufaOIFLX5g6JEKVVSZpme5dbcGyQN4/iLonK6ZgS8MlJEXqa5R6Qi3
 HR5NccghZ35CzR0Ol+ltCnLqbh4BqWwuTpyG7edrdnPtxPbsEJDt/Bv8wtsowr+fRAX4 rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t46c8866j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 17:18:37 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38EHCnLQ006750;
	Thu, 14 Sep 2023 17:18:36 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t46c88669-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 17:18:36 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38EGpRnC002401;
	Thu, 14 Sep 2023 17:18:35 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3t158km69h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 17:18:35 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38EHIWE942926374
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Sep 2023 17:18:33 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF50D2004F;
	Thu, 14 Sep 2023 17:18:32 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B77A320040;
	Thu, 14 Sep 2023 17:18:30 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.35.47])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Sep 2023 17:18:30 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Subject: [PATCH 1/2] tools/perf: Add new CONFIG_SHELLCHECK for detecting shellcheck binary
Date: Thu, 14 Sep 2023 22:48:26 +0530
Message-Id: <20230914171827.98507-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pti8Nkyvjrkhp9Z-WKwpJCuuSyV93run
X-Proofpoint-GUID: qNcwQHt-4xsSaaBsbdprtA3T63GgBEaK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_09,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309140148
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

shellcheck tool can detect coding/formatting issues on
shell scripts. In perf directory "tests/shell", there are lot
of shell test scripts and this tool can detect coding/formatting
issues on these scripts.

Example to use shellcheck for severity level for
errors and warnings, below command is used:

   # for F in $(find tests/shell/ -perm -o=x -name '*.sh'); do shellcheck -S warning $F; done
   # echo $?
     0

This testing needs to be automated into the build so that it
can avoid regressions and also run the check for newly added
during build test itself. Add a new feature check to detect
presence of shellcheck. Add CONFIG_SHELLCHECK feature check in
the build to avoid not having shellcheck breaking the build.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/build/Makefile.feature |  6 ++++--
 tools/build/feature/Makefile |  8 +++++++-
 tools/perf/Makefile.config   | 10 ++++++++++
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/tools/build/Makefile.feature b/tools/build/Makefile.feature
index 934e2777a2db..23f56b95babf 100644
--- a/tools/build/Makefile.feature
+++ b/tools/build/Makefile.feature
@@ -72,7 +72,8 @@ FEATURE_TESTS_BASIC :=                  \
         libzstd				\
         disassembler-four-args		\
         disassembler-init-styled	\
-        file-handle
+        file-handle			\
+        shellcheck
 
 # FEATURE_TESTS_BASIC + FEATURE_TESTS_EXTRA is the complete list
 # of all feature tests
@@ -138,7 +139,8 @@ FEATURE_DISPLAY ?=              \
          get_cpuid              \
          bpf			\
          libaio			\
-         libzstd
+         libzstd		\
+         shellcheck
 
 #
 # Declare group members of a feature to display the logical OR of the detection
diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
index 3184f387990a..44ba6d0c98d0 100644
--- a/tools/build/feature/Makefile
+++ b/tools/build/feature/Makefile
@@ -76,7 +76,8 @@ FILES=                                          \
          test-libzstd.bin			\
          test-clang-bpf-co-re.bin		\
          test-file-handle.bin			\
-         test-libpfm4.bin
+         test-libpfm4.bin			\
+         test-shellcheck.bin
 
 FILES := $(addprefix $(OUTPUT),$(FILES))
 
@@ -92,6 +93,8 @@ __BUILD = $(CC) $(CFLAGS) -MD -Wall -Werror -o $@ $(patsubst %.bin,%.c,$(@F)) $(
 __BUILDXX = $(CXX) $(CXXFLAGS) -MD -Wall -Werror -o $@ $(patsubst %.bin,%.cpp,$(@F)) $(LDFLAGS)
   BUILDXX = $(__BUILDXX) > $(@:.bin=.make.output) 2>&1
 
+  BUILD_BINARY = sh -c $1 > $(@:.bin=.make.output) 2>&1
+
 ###############################
 
 $(OUTPUT)test-all.bin:
@@ -207,6 +210,9 @@ $(OUTPUT)test-libslang-include-subdir.bin:
 $(OUTPUT)test-libtraceevent.bin:
 	$(BUILD) -ltraceevent
 
+$(OUTPUT)test-shellcheck.bin:
+	$(BUILD_BINARY) "shellcheck --version"
+
 $(OUTPUT)test-libtracefs.bin:
 	 $(BUILD) $(shell $(PKG_CONFIG) --cflags libtraceevent 2>/dev/null) -ltracefs
 
diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index d66b52407e19..e71fe95ad865 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -779,6 +779,16 @@ ifndef NO_SLANG
   endif
 endif
 
+ifneq ($(NO_SHELLCHECK),1)
+  $(call feature_check,shellcheck)
+  ifneq ($(feature-shellcheck), 1)
+    msg := $(warning No shellcheck found. please install ShellCheck);
+  else
+    $(call detected,CONFIG_SHELLCHECK)
+    NO_SHELLCHECK := 0
+  endif
+endif
+
 ifdef GTK2
   FLAGS_GTK2=$(CFLAGS) $(LDFLAGS) $(EXTLIBS) $(shell $(PKG_CONFIG) --libs --cflags gtk+-2.0 2>/dev/null)
   $(call feature_check,gtk2)
-- 
2.31.1

