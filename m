Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7563C68E695
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 04:25:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBQP020j2z3cdc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 14:25:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PZabJua6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PZabJua6;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBQL36PV2z3cCF
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 14:22:51 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3182fhHn001555;
	Wed, 8 Feb 2023 03:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tvrR0yKD6TeGxg1XaJAQnH0mwIFaGF4m3Dt7+KEMZgA=;
 b=PZabJua6bxxr+bwLskqdhOXb5GXv12nkil/1h+erEB7msPk+TbNEBowwD07gA9G5lVkU
 NsIpty2efmhAYLfDrcDDN/exOmhJtAnPICFtAy8GuJF9+4TPY2Jw9B1NA2dnxyMg7BEa
 vD+eVqk2g1qk3rBIShCCa9C3/vFQ2ZyLe6tflQECkSTpsp+SZP1rWYC4aUDt2DW1oFRC
 mh/qLf61IMnK5JqJf0ZKAtblzp3ToYeqn+vVkuNurCKzgjzFKMg7F9HmFtvfuU/zlV33
 2AvBHzPtmRd2YMVoetUl+Jv60sv5tj/x/8mx0HfwSGE4oNL+WBlV8KwIAFglys+fBBSv NQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nm3658sx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 03:22:47 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3183K6Im004876;
	Wed, 8 Feb 2023 03:22:47 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nm3658swj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 03:22:46 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 317ErpIa005776;
	Wed, 8 Feb 2023 03:22:44 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3nhf06k1ye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 03:22:44 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3183Mgeo42795474
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Feb 2023 03:22:42 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 056C520040;
	Wed,  8 Feb 2023 03:22:42 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 76F2E2004D;
	Wed,  8 Feb 2023 03:22:41 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Feb 2023 03:22:41 +0000 (GMT)
Received: from civic.. (unknown [9.177.15.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 028D3602EE;
	Wed,  8 Feb 2023 14:22:35 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux.xtensa.org
Subject: [PATCH v4 2/7] xtensa: kcsan: Remove kcsan stubs for atomic builtins
Date: Wed,  8 Feb 2023 14:21:57 +1100
Message-Id: <20230208032202.1357949-3-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230208032202.1357949-1-rmclure@linux.ibm.com>
References: <20230208032202.1357949-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Q_VW7a05we2onWFWulLZ_tdtdWyKUkQB
X-Proofpoint-ORIG-GUID: 1sapUZ3S5XAqlkG54wlKiSk3dESdzbQt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_15,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=971
 clxscore=1015 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302080027
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
Cc: chris@zankel.net, elver@google.com, npiggin@gmail.com, jcmvbkbc@gmail.com, Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A prior patch implemented stubs in place of the __atomic_* builtins in
generic code, as it is useful for other 32-bit architectures such as
32-bit powerpc.

Remove the kcsan-stubs.c translation unit and instead use
the generic implementation.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V4: New patch
---
 arch/xtensa/lib/Makefile      |  1 -
 arch/xtensa/lib/kcsan-stubs.c | 54 -----------------------------------
 kernel/kcsan/Makefile         |  5 +---
 3 files changed, 1 insertion(+), 59 deletions(-)
 delete mode 100644 arch/xtensa/lib/kcsan-stubs.c

diff --git a/arch/xtensa/lib/Makefile b/arch/xtensa/lib/Makefile
index 7ecef0519a27..d69356dc97df 100644
--- a/arch/xtensa/lib/Makefile
+++ b/arch/xtensa/lib/Makefile
@@ -8,5 +8,4 @@ lib-y	+= memcopy.o memset.o checksum.o \
 	   divsi3.o udivsi3.o modsi3.o umodsi3.o mulsi3.o umulsidi3.o \
 	   usercopy.o strncpy_user.o strnlen_user.o
 lib-$(CONFIG_PCI) += pci-auto.o
-lib-$(CONFIG_KCSAN) += kcsan-stubs.o
 KCSAN_SANITIZE_kcsan-stubs.o := n
diff --git a/arch/xtensa/lib/kcsan-stubs.c b/arch/xtensa/lib/kcsan-stubs.c
deleted file mode 100644
index 2b08faa62b86..000000000000
--- a/arch/xtensa/lib/kcsan-stubs.c
+++ /dev/null
@@ -1,54 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-#include <linux/bug.h>
-#include <linux/types.h>
-
-void __atomic_store_8(volatile void *p, u64 v, int i)
-{
-	BUG();
-}
-
-u64 __atomic_load_8(const volatile void *p, int i)
-{
-	BUG();
-}
-
-u64 __atomic_exchange_8(volatile void *p, u64 v, int i)
-{
-	BUG();
-}
-
-bool __atomic_compare_exchange_8(volatile void *p1, void *p2, u64 v, bool b, int i1, int i2)
-{
-	BUG();
-}
-
-u64 __atomic_fetch_add_8(volatile void *p, u64 v, int i)
-{
-	BUG();
-}
-
-u64 __atomic_fetch_sub_8(volatile void *p, u64 v, int i)
-{
-	BUG();
-}
-
-u64 __atomic_fetch_and_8(volatile void *p, u64 v, int i)
-{
-	BUG();
-}
-
-u64 __atomic_fetch_or_8(volatile void *p, u64 v, int i)
-{
-	BUG();
-}
-
-u64 __atomic_fetch_xor_8(volatile void *p, u64 v, int i)
-{
-	BUG();
-}
-
-u64 __atomic_fetch_nand_8(volatile void *p, u64 v, int i)
-{
-	BUG();
-}
diff --git a/kernel/kcsan/Makefile b/kernel/kcsan/Makefile
index 5dfc5825aae9..377b81be94fa 100644
--- a/kernel/kcsan/Makefile
+++ b/kernel/kcsan/Makefile
@@ -11,10 +11,7 @@ CFLAGS_core.o := $(call cc-option,-fno-conserve-stack) \
 	$(call cc-option,-mno-outline-atomics) \
 	-fno-stack-protector -DDISABLE_BRANCH_PROFILING
 
-obj-y := core.o debugfs.o report.o
-ifndef XTENSA
-	obj-y += stubs.o
-endif
+obj-y := core.o debugfs.o report.o stubs.o
 
 KCSAN_INSTRUMENT_BARRIERS_selftest.o := y
 obj-$(CONFIG_KCSAN_SELFTEST) += selftest.o
-- 
2.37.2

