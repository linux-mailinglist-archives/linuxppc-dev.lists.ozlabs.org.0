Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7904B1E93
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 07:34:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jw3kQ5brPz3cDN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 17:34:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MDep5ljA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MDep5ljA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jw3jh4sgwz2x9S
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 17:34:00 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21B4SKpA014983; 
 Fri, 11 Feb 2022 06:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=nOp21wqH4SYh3homqaEaiEvpvy0uUYsdNREK04SxuTs=;
 b=MDep5ljAWb8ldrgZ0oTgHsjeczxnZJA0FibqE6LqKPwWMY5vruUCNGHWlE0tg4183PuL
 r44XYfwtJfgkwtG4yWZtHMM5WZLXipuLUNMNtuwjPeu2emWkE8FllxeeoFOh/b5NVqOA
 b0Xd2tMK4wxXAXVmRr+lQn/t1Tzncf3UowSESYvtDZE04NOWxOREgJyC24zw3B4hxz9y
 ot2uApkTa8+CEcEUEaP6kqnNmt8IMUzdf3BEUhbne58YC/arwBYdmwuO93Sr7irwWyt2
 5i67ucvUK1Yp8pEDGXhikdLyRBbKIihZJzd/NggMtTRiFsDlWX8iOYizlu9xehNIvnpz sg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e5gt81tds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 06:33:45 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21B6XQnv014417;
 Fri, 11 Feb 2022 06:33:44 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02dal.us.ibm.com with ESMTP id 3e3gq1nqa2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 06:33:44 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21B6XhST27132278
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Feb 2022 06:33:43 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7237613605D;
 Fri, 11 Feb 2022 06:33:43 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91CE8136051;
 Fri, 11 Feb 2022 06:33:40 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.41.36])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 11 Feb 2022 06:33:40 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v2 1/2] selftest/vm: Use correct PAGE_SHIFT value for ppc64
Date: Fri, 11 Feb 2022 12:03:28 +0530
Message-Id: <20220211063330.99648-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eMie-krhdorMG-hQI764di1Bfr0l3ebj
X-Proofpoint-ORIG-GUID: eMie-krhdorMG-hQI764di1Bfr0l3ebj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-11_02,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=924 bulkscore=0
 clxscore=1011 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202110036
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
 linux-kselftest@vger.kernel.org,
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
Cc: linux-kselftest@vger.kernel.org
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 tools/testing/selftests/vm/ksm_tests.c        | 9 ++++++++-
 tools/testing/selftests/vm/transhuge-stress.c | 9 ++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/vm/ksm_tests.c b/tools/testing/selftests/vm/ksm_tests.c
index 1436e1a9a3d3..cae72872152b 100644
--- a/tools/testing/selftests/vm/ksm_tests.c
+++ b/tools/testing/selftests/vm/ksm_tests.c
@@ -22,7 +22,14 @@
 #define KSM_MERGE_ACROSS_NODES_DEFAULT true
 #define MB (1ul << 20)
 
-#define PAGE_SHIFT 12
+#ifdef __powerpc64__
+#define PAGE_SHIFT	16
+#else
+#define PAGE_SHIFT	12
+#endif
+/*
+ * On ppc64 this will only work with radix 2M hugepage size
+ */
 #define HPAGE_SHIFT 21
 
 #define PAGE_SIZE (1 << PAGE_SHIFT)
diff --git a/tools/testing/selftests/vm/transhuge-stress.c b/tools/testing/selftests/vm/transhuge-stress.c
index 5e4c036f6ad3..b1f8d98355c5 100644
--- a/tools/testing/selftests/vm/transhuge-stress.c
+++ b/tools/testing/selftests/vm/transhuge-stress.c
@@ -16,7 +16,14 @@
 #include <string.h>
 #include <sys/mman.h>
 
-#define PAGE_SHIFT 12
+#ifdef __powerpc64__
+#define PAGE_SHIFT	16
+#else
+#define PAGE_SHIFT	12
+#endif
+/*
+ * On ppc64 this will only work with radix 2M hugepage size
+ */
 #define HPAGE_SHIFT 21
 
 #define PAGE_SIZE (1 << PAGE_SHIFT)
-- 
2.34.1

