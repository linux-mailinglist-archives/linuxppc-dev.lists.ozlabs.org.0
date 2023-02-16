Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC73698B91
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:12:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHNNz3VrXz3c9Q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:12:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T5ls7eQn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T5ls7eQn;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNLy2hgcz3bgT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:10:49 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31G4wcuE032402;
	Thu, 16 Feb 2023 05:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=NaCNLt30iF1Ct7jv/oqRlwmtGd8ElU2hk9dC3Zxqt88=;
 b=T5ls7eQn1lbISk2+gTFAhG9hjzG6Lx7KfJEr3aDrNd5aW40g1Yv0VrELQXMxJLj1BQ97
 tj11CFau/21zxSOCp87KKPjQIZCgyon72ABAR6biYDXDRCl2MzrqZc108mGNGzCtIbrP
 YKWKG71orRXDgOIsUjYQRcG269nNfeD3L3zYjV70wYSe4VqP3vWUrhouXvvSt5A6dTE8
 NowupJ8idES5kgEXAuM8Xur6Cqy/Y1s66RZ868TCH56BT7gU3un//KXedBX5cyEgNSXD
 h3+AnBqaVKWwpi/MHzeNB2P7kg6y6+z+N3KhU0DjCHe1EsSUyJPJTNzolGjiEA8dfoff OQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nsdxe87dq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Feb 2023 05:10:41 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31G57Q8i029795;
	Thu, 16 Feb 2023 05:10:40 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nsdxe87db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Feb 2023 05:10:40 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31G4YDMi029819;
	Thu, 16 Feb 2023 05:10:38 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3np29fp6qu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Feb 2023 05:10:38 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31G5Aaiw45679036
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Feb 2023 05:10:36 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0EE7D2004B;
	Thu, 16 Feb 2023 05:10:36 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8008720040;
	Thu, 16 Feb 2023 05:10:35 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 Feb 2023 05:10:35 +0000 (GMT)
Received: from civic.. (unknown [9.177.64.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 053F8600D2;
	Thu, 16 Feb 2023 16:10:28 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] kcsan: xtensa: Add atomic builtin stubs for 32-bit systems
Date: Thu, 16 Feb 2023 16:09:37 +1100
Message-Id: <20230216050938.2188488-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: G61CzmR0Bvp9TZecasGUx48uixfPHGfb
X-Proofpoint-ORIG-GUID: IHPZ70qQreBNwrupqtVXTqD5pC2DISXZ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-16_02,2023-02-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302160037
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KCSAN instruments calls to atomic builtins, and will in turn call these
builtins itself. As such, architectures supporting KCSAN must have
compiler support for these atomic primitives.

Since 32-bit systems are unlikely to have 64-bit compiler builtins,
provide a stub for each missing builtin, and use BUG() to assert
unreachability.

In commit 725aea873261 ("xtensa: enable KCSAN"), xtensa implements these
locally. Move these definitions to be accessible to all 32-bit
architectures that do not provide the necessary builtins, with opt in
for PowerPC and xtensa.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
---
Previously issued as a part of a patch series adding KCSAN support to
64-bit.
Link: https://lore.kernel.org/linuxppc-dev/167646486000.1421441.10070059569986228558.b4-ty@ellerman.id.au/T/#t
v1: Remove __has_builtin check, as gcc is not obligated to inline
builtins detected using this check, but instead is permitted to supply
them in libatomic:
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108734
Instead, opt-in PPC32 and xtensa.
---
 arch/xtensa/lib/Makefile                              | 1 -
 kernel/kcsan/Makefile                                 | 2 ++
 arch/xtensa/lib/kcsan-stubs.c => kernel/kcsan/stubs.c | 0
 3 files changed, 2 insertions(+), 1 deletion(-)
 rename arch/xtensa/lib/kcsan-stubs.c => kernel/kcsan/stubs.c (100%)

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
diff --git a/kernel/kcsan/Makefile b/kernel/kcsan/Makefile
index 8cf70f068d92..86dd713d8855 100644
--- a/kernel/kcsan/Makefile
+++ b/kernel/kcsan/Makefile
@@ -12,6 +12,8 @@ CFLAGS_core.o := $(call cc-option,-fno-conserve-stack) \
 	-fno-stack-protector -DDISABLE_BRANCH_PROFILING
 
 obj-y := core.o debugfs.o report.o
+obj-$(CONFIG_PPC32) += stubs.o
+obj-$(CONFIG_XTENSA) += stubs.o
 
 KCSAN_INSTRUMENT_BARRIERS_selftest.o := y
 obj-$(CONFIG_KCSAN_SELFTEST) += selftest.o
diff --git a/arch/xtensa/lib/kcsan-stubs.c b/kernel/kcsan/stubs.c
similarity index 100%
rename from arch/xtensa/lib/kcsan-stubs.c
rename to kernel/kcsan/stubs.c
-- 
2.37.2

