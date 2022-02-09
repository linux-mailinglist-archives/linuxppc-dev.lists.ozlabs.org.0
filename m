Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 438184AF5A5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 16:44:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jv41V6VZMz3cTV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 02:44:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k0WoB+75;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=k0WoB+75; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jv40n5qRfz3bcK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 02:43:37 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 219ERxvE007324; 
 Wed, 9 Feb 2022 15:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=VMtUX85hNsfISzkB9ZuJhD3Ys2Ls0lw5971YjQ+perw=;
 b=k0WoB+752dhL0qluqutq3ukuzzQtxiqhMFyA1kePiowk32WkQWARdvu5q/MSSHIt5kL3
 eKh/Dr4fdKrBQfUR5Yj8AePJjoLFzlpBDcTaI43WKTq0YYatETlGgLjVn08VyNklqY85
 3eLge33mnwJFvtQVhorABno4Bs2QaPoTMvtqtP+kKT4mokMCDTugdHy8IwTOwpsaXDx1
 l38qRKp5bBF9JPiMBAUCnAS9Gf//UeAV4pVFol1fTnQWBzQGiQYVU/JdH52C/xtMiMMb
 R+jrTV92Vs9JOoxhzYZ0wD4LareJAuAYyZTyGISS+It8Dxu8XRwBQvboqzlXJ9q0pniI mg== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e48t8jtkg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 15:43:26 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 219FJLGi025533;
 Wed, 9 Feb 2022 15:43:26 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 3e1gvbmadg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 15:43:26 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 219FhP4Z34406698
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Feb 2022 15:43:25 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE083B2072;
 Wed,  9 Feb 2022 15:43:24 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A993B2075;
 Wed,  9 Feb 2022 15:43:22 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.76.204])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  9 Feb 2022 15:43:21 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH] selftest/vm: Use correct PAGE_SHIFT value for ppc64
Date: Wed,  9 Feb 2022 21:13:00 +0530
Message-Id: <20220209154301.42024-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YxUSqxNhXqDC6c4Wi9-M-eq2_Guaev7O
X-Proofpoint-GUID: YxUSqxNhXqDC6c4Wi9-M-eq2_Guaev7O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-09_08,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=916 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202090087
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
Cc: Shuah Khan <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Keep it simple by using a #define and limiting hugepage size to 2M.
This keeps the test simpler instead of dynamically finding the page size
and huge page size.

Without this tests are broken w.r.t reading /proc/self/pagemap

	if (pread(pagemap_fd, ent, sizeof(ent),
			(uintptr_t)ptr >> (PAGE_SHIFT - 3)) != sizeof(ent))
		err(2, "read pagemap");

Cc: Shuah Khan <shuah@kernel.org>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 tools/testing/selftests/vm/ksm_tests.c        | 8 ++++++++
 tools/testing/selftests/vm/transhuge-stress.c | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/tools/testing/selftests/vm/ksm_tests.c b/tools/testing/selftests/vm/ksm_tests.c
index 1436e1a9a3d3..8200328ff018 100644
--- a/tools/testing/selftests/vm/ksm_tests.c
+++ b/tools/testing/selftests/vm/ksm_tests.c
@@ -22,8 +22,16 @@
 #define KSM_MERGE_ACROSS_NODES_DEFAULT true
 #define MB (1ul << 20)
 
+#ifdef __powerpc64__
+#define PAGE_SHIFT	16
+/*
+ * This will only work with radix 2M hugepage size
+ */
+#define HPAGE_SHIFT 21
+#else
 #define PAGE_SHIFT 12
 #define HPAGE_SHIFT 21
+#endif
 
 #define PAGE_SIZE (1 << PAGE_SHIFT)
 #define HPAGE_SIZE (1 << HPAGE_SHIFT)
diff --git a/tools/testing/selftests/vm/transhuge-stress.c b/tools/testing/selftests/vm/transhuge-stress.c
index 5e4c036f6ad3..f04c8aa4bcf6 100644
--- a/tools/testing/selftests/vm/transhuge-stress.c
+++ b/tools/testing/selftests/vm/transhuge-stress.c
@@ -16,8 +16,16 @@
 #include <string.h>
 #include <sys/mman.h>
 
+#ifdef __powerpc64__
+#define PAGE_SHIFT	16
+/*
+ * This will only work with radix 2M hugepage size
+ */
+#define HPAGE_SHIFT 21
+#else
 #define PAGE_SHIFT 12
 #define HPAGE_SHIFT 21
+#endif
 
 #define PAGE_SIZE (1 << PAGE_SHIFT)
 #define HPAGE_SIZE (1 << HPAGE_SHIFT)
-- 
2.34.1

