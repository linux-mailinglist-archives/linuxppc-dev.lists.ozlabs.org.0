Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9CA3B1326
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 07:18:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8s445L09z2yys
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 15:18:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PSfKlT7P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PSfKlT7P; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8s3Y26frz2yxW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 15:18:00 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15N54JO8190927; Wed, 23 Jun 2021 01:17:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : date : content-type : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gYN65NFFwIWxskFzlCXBNGDN+drf96I8yvJuoSuMIMw=;
 b=PSfKlT7PYLpY7jSxmjCUZNeSIgmHGVdo/Ls3gEdQbSpNxv79chYTZM1Ez7AtScWnN7/N
 pcN6ba+NVuprqA0LIzYdSYakpjxEM2tSM9zqXck+kneyAZQfxAkitJWoGsH/LDGoNPbN
 oQEgr9iPWB+06ayh+E+9hHSzXPiiEVtq379CO3Uo2EwamNjrreKfjTBvmqGTZkr+Zk3W
 dOkWatlaHw2jVvCnUbikdKC/61vig4ATVkR6PRvtyt3TEk/FcORmylc8dqu3UeHEqx/N
 X0RI40X5O3lfNYZ3pL7f/37BwrcFIN6K0p0dJaiTBHIlV5MwRsd8JzeV5KalKqy+Ff8t Cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39bwgb1s4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jun 2021 01:17:51 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15N54ZRZ194837;
 Wed, 23 Jun 2021 01:17:51 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39bwgb1s47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jun 2021 01:17:51 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15N5Cf9M015339;
 Wed, 23 Jun 2021 05:17:50 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 399879vsr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jun 2021 05:17:50 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15N5HnCG30540284
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 05:17:49 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BDF06E053;
 Wed, 23 Jun 2021 05:17:49 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A01CC6E052;
 Wed, 23 Jun 2021 05:17:48 +0000 (GMT)
Received: from sig-9-65-236-139.ibm.com (unknown [9.65.236.139])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 23 Jun 2021 05:17:48 +0000 (GMT)
Message-ID: <ed908341b1eb7ca0183c028a4ed4a0cf48bfe0f6.camel@linux.ibm.com>
Subject: [PATCH] selftests/powerpc: Use req_max_processed_len from sysfs NX
 capabilities
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
 rzinsly@linux.ibm.com
Date: Tue, 22 Jun 2021 22:17:46 -0700
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qgqgtIpYGSko1VY9el051JbjoDfNTNdm
X-Proofpoint-ORIG-GUID: l2JTWVA3Jo2aopcRc8mGTfWqIu2NzoaB
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-23_01:2021-06-22,
 2021-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106230026
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On PowerVM, the hypervisor defines the maximum buffer length for
each NX request and the kernel exported this value via sysfs.

This patch reads this value if the sysfs entry is available and
is used to limit the request length.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 .../testing/selftests/powerpc/nx-gzip/Makefile  |  4 ++--
 .../selftests/powerpc/nx-gzip/gzfht_test.c      | 17 +++++++++++++++--
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/powerpc/nx-gzip/Makefile b/tools/testing/selftests/powerpc/nx-gzip/Makefile
index 640fad6cc2c7..0785c2e99d40 100644
--- a/tools/testing/selftests/powerpc/nx-gzip/Makefile
+++ b/tools/testing/selftests/powerpc/nx-gzip/Makefile
@@ -1,8 +1,8 @@
-CFLAGS = -O3 -m64 -I./include
+CFLAGS = -O3 -m64 -I./include -I../include
 
 TEST_GEN_FILES := gzfht_test gunz_test
 TEST_PROGS := nx-gzip-test.sh
 
 include ../../lib.mk
 
-$(TEST_GEN_FILES): gzip_vas.c
+$(TEST_GEN_FILES): gzip_vas.c ../utils.c
diff --git a/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c b/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c
index b099753b50e4..095195a25687 100644
--- a/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c
+++ b/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c
@@ -60,6 +60,7 @@
 #include <assert.h>
 #include <errno.h>
 #include <signal.h>
+#include "utils.h"
 #include "nxu.h"
 #include "nx.h"
 
@@ -70,6 +71,8 @@ FILE *nx_gzip_log;
 #define FNAME_MAX 1024
 #define FEXT ".nx.gz"
 
+#define SYSFS_MAX_REQ_BUF_PATH "devices/vio/ibm,compression-v1/nx_gzip_caps/req_max_processed_len"
+
 /*
  * LZ counts returned in the user supplied nx_gzip_crb_cpb_t structure.
  */
@@ -244,6 +247,7 @@ int compress_file(int argc, char **argv, void *handle)
 	struct nx_gzip_crb_cpb_t *cmdp;
 	uint32_t pagelen = 65536;
 	int fault_tries = NX_MAX_FAULTS;
+	char buf[32];
 
 	cmdp = (void *)(uintptr_t)
 		aligned_alloc(sizeof(struct nx_gzip_crb_cpb_t),
@@ -263,8 +267,17 @@ int compress_file(int argc, char **argv, void *handle)
 	assert(NULL != (outbuf = (char *)malloc(outlen)));
 	nxu_touch_pages(outbuf, outlen, pagelen, 1);
 
-	/* Compress piecemeal in smallish chunks */
-	chunk = 1<<22;
+	/*
+	 * On PowerVM, the hypervisor defines the maximum request buffer
+	 * size is defined and this value is available via sysfs.
+	 */
+	if (!read_sysfs_file(SYSFS_MAX_REQ_BUF_PATH, buf, sizeof(buf))) {
+		chunk = atoi(buf);
+	} else {
+		/* sysfs entry is not available on PowerNV */
+		/* Compress piecemeal in smallish chunks */
+		chunk = 1<<22;
+	}
 
 	/* Write the gzip header to the stream */
 	num_hdr_bytes = gzip_header_blank(outbuf);
-- 
2.18.2


