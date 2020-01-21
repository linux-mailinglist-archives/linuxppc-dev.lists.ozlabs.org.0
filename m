Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B6E143AF7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 11:26:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4824Sh4Hm0zDqDK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 21:26:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=anju@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4824H26nfvzDqKD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 21:17:50 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00LAHQux125808
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 05:17:48 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xkwq7qb9r-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 05:17:47 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <anju@linux.vnet.ibm.com>;
 Tue, 21 Jan 2020 10:17:45 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 21 Jan 2020 10:17:43 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00LAHg4s32571634
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jan 2020 10:17:42 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BEF9A4060;
 Tue, 21 Jan 2020 10:17:42 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8EECA405B;
 Tue, 21 Jan 2020 10:17:40 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.62.176])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Jan 2020 10:17:40 +0000 (GMT)
From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 5/5] selftest/powerpc/pmu: Testcase for imc global lock
 mechanism
Date: Tue, 21 Jan 2020 15:47:28 +0530
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200121101728.14858-1-anju@linux.vnet.ibm.com>
References: <20200121101728.14858-1-anju@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20012110-0016-0000-0000-000002DF5295
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012110-0017-0000-0000-00003341F996
Message-Id: <20200121101728.14858-6-anju@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-21_02:2020-01-21,
 2020-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 suspectscore=1 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001210088
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
Cc: nasastry@in.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, anju@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Madhavan Srinivasan <maddy@linux.ibm.com>

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 .../pmu/mem_counters/imc_global_lock_test.c   | 49 ++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/pmu/mem_counters/imc_global_lock_test.c b/tools/testing/selftests/powerpc/pmu/mem_counters/imc_global_lock_test.c
index ea687ffc1990..f643dba8ecc0 100644
--- a/tools/testing/selftests/powerpc/pmu/mem_counters/imc_global_lock_test.c
+++ b/tools/testing/selftests/powerpc/pmu/mem_counters/imc_global_lock_test.c
@@ -5,9 +5,56 @@
 
 #include "mem_counters.h"
 
+static  bool check_imc_interface_glob_lck(void)
+{
+	if (!access("/sys/devices/thread_imc/interface/glob_lck", F_OK))
+		return true;
+
+	return false;
+}
+
 static int testcase(void)
 {
-	return 0;
+	struct event events[2];
+
+	if (!check_imc_interface_glob_lck()) {
+		printf("Test not supported\n");
+		return MAGIC_SKIP_RETURN_VALUE;
+	}
+
+	if (!is_mem_counters_device_enabled(CORE) || !is_mem_counters_device_enabled(THREAD)) {
+		printf("%s: IMC device not found. So exiting the test\n", __FUNCTION__);
+		return -1;
+	}
+
+	if (setup_mem_counters_event(THREAD, &events[0], 0xe0, "thread_imc/cycles")) {
+		printf("%s setup_mem_counters_event for thread_imc failed\n", __FUNCTION__);
+		return -1;
+	}
+
+	if (setup_mem_counters_event(CORE, &events[1], 0xe0, "core_imc/cycles")) {
+		printf("%s setup_mem_counters_event for core_imc failed\n", __FUNCTION__);
+		return -1;
+	}
+
+	if (event_open(&events[0])) {
+		perror("thread_imc: perf_event_open");
+		return -1;
+	}
+
+	/*
+	 * If we have the Global lock patchset applied to kernel
+	 * event_open for events[1] should fail with resource busy
+	 */
+	if (event_open_with_cpu(&events[1], 0)) {
+		/*
+		 * Check for the errno to certify the test result
+		 */
+		if (errno == 16) // Resource busy (EBUSY)
+			return 0;
+	}
+
+	return -1;
 }
 
 static int imc_global_lock_test(void)
-- 
2.20.1

