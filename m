Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2AF68E693
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 04:24:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBQMz1DSMz3f2q
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 14:24:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gsRf7r5N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gsRf7r5N;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBQL12B4pz3bZS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 14:22:49 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3182KA9d009616;
	Wed, 8 Feb 2023 03:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=g9mMFlhHISUuK30BUYpsr7iZ6SLur+6BcqUCp+oLDFM=;
 b=gsRf7r5NSWxkriVuqT9tqJFZ3hLpnAZuDYg50a45fx1fKJfQcK+yVxKL8s1IoVZUUVFN
 XwQ3ShXJ9Fjk7QYGmxdhiLj4QHnrZVUJpK1Qv7nYtV2iz8zRfIE1TyB/o6mV2QAD+RvH
 ZBU4Ff0QJWVnloD4pRPw8xGgatLudnpUZpH8rQJQTui5FceRO344FYPsvABXQSEJw5Uz
 hoJL+91suF+YT2MNRk9NCt0N0XyKj6q3tbvF37cpqDE7XlK2DRtR1mSddZq8kcl3gTr/
 KX7YCgunMxEmJ4WMHSLsHaFy7iaHhdaifciFDENpt9yGBHvAeJnwfPVw9XGIeAaojpry qQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nm2uuh70u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 03:22:42 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3183Hp51014141;
	Wed, 8 Feb 2023 03:22:42 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nm2uuh70f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 03:22:41 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 317B0YHa020984;
	Wed, 8 Feb 2023 03:22:39 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3nhemfmath-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 03:22:39 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3183MbCC50528580
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Feb 2023 03:22:37 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 69C2D2004B;
	Wed,  8 Feb 2023 03:22:37 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB17720040;
	Wed,  8 Feb 2023 03:22:36 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Feb 2023 03:22:36 +0000 (GMT)
Received: from civic.. (unknown [9.177.15.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6326060636;
	Wed,  8 Feb 2023 14:22:31 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux.xtensa.org
Subject: [PATCH v4 1/7] kcsan: Add atomic builtin stubs for 32-bit systems
Date: Wed,  8 Feb 2023 14:21:56 +1100
Message-Id: <20230208032202.1357949-2-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230208032202.1357949-1-rmclure@linux.ibm.com>
References: <20230208032202.1357949-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Zc18Ur_Tgh5QV9zR715_gMQwauPWbs_z
X-Proofpoint-ORIG-GUID: 3p4UmCLWIo9RRESy-odqMin5J3apdFVQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_15,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=871 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
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

KCSAN instruments calls to atomic builtins, and will in turn call these
builtins itself. As such, architectures supporting KCSAN must have
compiler support for these atomic primitives.

Since 32-bit systems are unlikely to have 64-bit compiler builtins,
provide a stub for each missing builtin, and use BUG() to assert
unreachability.

In commit 725aea873261 ("xtensa: enable KCSAN"), xtensa implements these
locally, but does not advertise the fact with preprocessor macros. To
avoid production of duplicate symbols, do not build the stubs on xtensa.
A future patch will remove the xtensa implementation of these stubs.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
v4: New patch
---
 kernel/kcsan/Makefile |  3 ++
 kernel/kcsan/stubs.c  | 78 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)
 create mode 100644 kernel/kcsan/stubs.c

diff --git a/kernel/kcsan/Makefile b/kernel/kcsan/Makefile
index 8cf70f068d92..5dfc5825aae9 100644
--- a/kernel/kcsan/Makefile
+++ b/kernel/kcsan/Makefile
@@ -12,6 +12,9 @@ CFLAGS_core.o := $(call cc-option,-fno-conserve-stack) \
 	-fno-stack-protector -DDISABLE_BRANCH_PROFILING
 
 obj-y := core.o debugfs.o report.o
+ifndef XTENSA
+	obj-y += stubs.o
+endif
 
 KCSAN_INSTRUMENT_BARRIERS_selftest.o := y
 obj-$(CONFIG_KCSAN_SELFTEST) += selftest.o
diff --git a/kernel/kcsan/stubs.c b/kernel/kcsan/stubs.c
new file mode 100644
index 000000000000..ec5cd99be422
--- /dev/null
+++ b/kernel/kcsan/stubs.c
@@ -0,0 +1,78 @@
+// SPDX-License Identifier: GPL-2.0
+
+#include <linux/bug.h>
+#include <linux/types.h>
+
+#ifdef CONFIG_32BIT
+
+#if !__has_builtin(__atomic_store_8)
+void __atomic_store_8(volatile void *p, u64 v, int i)
+{
+	BUG();
+}
+#endif
+
+#if !__has_builtin(__atomic_load_8)
+u64 __atomic_load_8(const volatile void *p, int i)
+{
+	BUG();
+}
+#endif
+
+#if !__has_builtin(__atomic_exchange_8)
+u64 __atomic_exchange_8(volatile void *p, u64 v, int i)
+{
+	BUG();
+}
+#endif
+
+#if !__has_builtin(__atomic_compare_exchange_8)
+bool __atomic_compare_exchange_8(volatile void *p1, void *p2, u64 v, bool b, int i1, int i2)
+{
+	BUG();
+}
+#endif
+
+#if !__has_builtin(__atomic_fetch_add_8)
+u64 __atomic_fetch_add_8(volatile void *p, u64 v, int i)
+{
+	BUG();
+}
+#endif
+
+#if !__has_builtin(__atomic_fetch_sub_8)
+u64 __atomic_fetch_sub_8(volatile void *p, u64 v, int i)
+{
+	BUG();
+}
+#endif
+
+#if !__has_builtin(__atomic_fetch_and_8)
+u64 __atomic_fetch_and_8(volatile void *p, u64 v, int i)
+{
+	BUG();
+}
+#endif
+
+#if !__has_builtin(__atomic_fetch_or_8)
+u64 __atomic_fetch_or_8(volatile void *p, u64 v, int i)
+{
+	BUG();
+}
+#endif
+
+#if !__has_builtin(__atomic_fetch_xor_8)
+u64 __atomic_fetch_xor_8(volatile void *p, u64 v, int i)
+{
+	BUG();
+}
+#endif
+
+#if !__has_builtin(__atomic_fetch_nand_8)
+u64 __atomic_fetch_nand_8(volatile void *p, u64 v, int i)
+{
+	BUG();
+}
+#endif
+
+#endif /* CONFIG_32BIT */
-- 
2.37.2

