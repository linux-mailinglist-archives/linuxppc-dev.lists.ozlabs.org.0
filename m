Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E826A500A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 01:11:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQd7V5YVfz3f68
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 11:11:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AbwtryrS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AbwtryrS;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQd3S0KVSz3c41
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 11:07:31 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31RMfVa9017310
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 00:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=mul2VTKiYEDRwGs/AZG/XhjH8XolAD30HdPxBbuNeiA=;
 b=AbwtryrSMJX/ORCQTO1DsbfxgJ+FFOhLwDG8RzSmtjosc1nRSylqs6Jn2rUfEivKl8x0
 xLMo78aqEqsTWCoD+RsbG+LpP7rofOE/77w9EgAliS7CK1Ep5qLAi/WFpAAcjapfizhQ
 79lmrkQ664zRFJ7ocDYzv1R1lQ0rMefajayqGeCkPmUe9AIP0iivVwvjKZRmGYbJv5P7
 Bb5F9LI7X657KG2laLykh/Oh5mRZe5oHChIihsTu/q4XmumktJwL6MvXZuQK+eOfy0v6
 mZxyBexgH1XFswYeu0OVs0nawQypelHx9M7AyHPcmFpsLmKpnjuLzdgsH+SouVA3s1LC lQ== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p11738kqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 00:07:28 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31RNV9aU021296
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 00:07:26 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3nybbyst0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 00:07:25 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31S07Mlk23134546
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 00:07:23 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D8C8120043
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 00:07:22 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DCBE620040
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 00:07:21 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 00:07:21 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9A624603DA;
	Tue, 28 Feb 2023 11:07:18 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] selftests/powerpc: Pass make context to children
Date: Tue, 28 Feb 2023 11:07:08 +1100
Message-Id: <20230228000709.124727-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228000709.124727-1-bgray@linux.ibm.com>
References: <20230228000709.124727-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bSDcK-zQNIfUHAyDCx1Iiz7Aw9_VFC64
X-Proofpoint-GUID: bSDcK-zQNIfUHAyDCx1Iiz7Aw9_VFC64
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_17,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302270189
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make supports passing the 'jobserver' (parallel make support) to child
invocations of make when either
	1. The target command uses $(MAKE) directly
	2. The command starts with '+'

This context is not passed through expansions that result in $(MAKE), so
the macros used in several places fail to pass on the jobserver context.
Warnings are also raised by the child mentioning this.

Prepend macros lines that invoke $(MAKE) with '+' to allow passing the
jobserver context to these children.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 tools/testing/selftests/powerpc/Makefile     |  8 +++----
 tools/testing/selftests/powerpc/pmu/Makefile | 24 ++++++++++----------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/powerpc/Makefile b/tools/testing/selftests/powerpc/Makefile
index 6ba95cd19e42..ae2bfc0d822f 100644
--- a/tools/testing/selftests/powerpc/Makefile
+++ b/tools/testing/selftests/powerpc/Makefile
@@ -45,28 +45,28 @@ $(SUB_DIRS):
 include ../lib.mk
 
 override define RUN_TESTS
-	@for TARGET in $(SUB_DIRS); do \
+	+@for TARGET in $(SUB_DIRS); do \
 		BUILD_TARGET=$(OUTPUT)/$$TARGET;	\
 		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET run_tests;\
 	done;
 endef
 
 override define INSTALL_RULE
-	@for TARGET in $(SUB_DIRS); do \
+	+@for TARGET in $(SUB_DIRS); do \
 		BUILD_TARGET=$(OUTPUT)/$$TARGET;	\
 		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET install;\
 	done;
 endef
 
 override define EMIT_TESTS
-	@for TARGET in $(SUB_DIRS); do \
+	+@for TARGET in $(SUB_DIRS); do \
 		BUILD_TARGET=$(OUTPUT)/$$TARGET;	\
 		$(MAKE) OUTPUT=$$BUILD_TARGET -s -C $$TARGET emit_tests;\
 	done;
 endef
 
 override define CLEAN
-	@for TARGET in $(SUB_DIRS); do \
+	+@for TARGET in $(SUB_DIRS); do \
 		BUILD_TARGET=$(OUTPUT)/$$TARGET;	\
 		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET clean; \
 	done;
diff --git a/tools/testing/selftests/powerpc/pmu/Makefile b/tools/testing/selftests/powerpc/pmu/Makefile
index d2c1accc2e69..2b95e44d20ff 100644
--- a/tools/testing/selftests/powerpc/pmu/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/Makefile
@@ -25,34 +25,34 @@ $(OUTPUT)/per_event_excludes: ../utils.c
 DEFAULT_RUN_TESTS := $(RUN_TESTS)
 override define RUN_TESTS
 	$(DEFAULT_RUN_TESTS)
-	TARGET=ebb; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET run_tests
-	TARGET=sampling_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET run_tests
-	TARGET=event_code_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET run_tests
+	+TARGET=ebb; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET run_tests
+	+TARGET=sampling_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET run_tests
+	+TARGET=event_code_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET run_tests
 endef
 
 DEFAULT_EMIT_TESTS := $(EMIT_TESTS)
 override define EMIT_TESTS
 	$(DEFAULT_EMIT_TESTS)
-	TARGET=ebb; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -s -C $$TARGET emit_tests
-	TARGET=sampling_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -s -C $$TARGET emit_tests
-	TARGET=event_code_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -s -C $$TARGET emit_tests
+	+TARGET=ebb; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -s -C $$TARGET emit_tests
+	+TARGET=sampling_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -s -C $$TARGET emit_tests
+	+TARGET=event_code_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -s -C $$TARGET emit_tests
 endef
 
 DEFAULT_INSTALL_RULE := $(INSTALL_RULE)
 override define INSTALL_RULE
 	$(DEFAULT_INSTALL_RULE)
-	TARGET=ebb; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET install
-	TARGET=sampling_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET install
-	TARGET=event_code_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET install
+	+TARGET=ebb; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET install
+	+TARGET=sampling_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET install
+	+TARGET=event_code_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET install
 endef
 
 DEFAULT_CLEAN := $(CLEAN)
 override define CLEAN
 	$(DEFAULT_CLEAN)
 	$(RM) $(TEST_GEN_PROGS) $(OUTPUT)/loop.o
-	TARGET=ebb; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET clean
-	TARGET=sampling_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET clean
-	TARGET=event_code_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET clean
+	+TARGET=ebb; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET clean
+	+TARGET=sampling_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET clean
+	+TARGET=event_code_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET clean
 endef
 
 ebb:
-- 
2.39.2

