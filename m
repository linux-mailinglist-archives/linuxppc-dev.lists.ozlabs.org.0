Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8544FE619
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 18:42:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdBNC6qkyz3bw7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 02:42:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q5oHm8Qn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Q5oHm8Qn; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdBLx2KPcz3bYh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 02:41:28 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23CEn3lD007269; 
 Tue, 12 Apr 2022 16:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=8zVO9GqpM7EtDd3vcc5b3+hasHWGGZWqACAzTfxcKBQ=;
 b=Q5oHm8QnAcoFlUcDjgUnCXOVH/lvspvk7vT4fG8d8wat0ByK8bZD1WvY5dFwt6yBRIuP
 X5kihwuJ7EtV0tVhw2ONGrNyzmAXnYff06dLa8i6OL+kh6K1Mq+63gln1U/e+Cc6VyfM
 jU0CI4wnBNohxwxVRiDqFZkiaUwaHbwoj4EteWz5OMGMow5JNEt0/KsgkEeHQt8Otc2c
 YYpmIHIc6gEqOs16TV7tziHNtq6+c21iUDXY0C8+TybKizOzNHZ3NSGaMJ7axHFtLOvC
 U+1y//4LI4cb15xcKafwCIZ2/kvI0kTFMz3EZxYV4ZAFBxHRqEy9PMOTOfpuzTema6Nz vA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fd7wcrbqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 16:41:21 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23CGfLkj021307;
 Tue, 12 Apr 2022 16:41:21 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fd7wcrbpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 16:41:21 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23CGXfnr022645;
 Tue, 12 Apr 2022 16:41:19 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3fbsj035ap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 16:41:18 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23CGfFik42140080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Apr 2022 16:41:15 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A1D9AE055;
 Tue, 12 Apr 2022 16:41:15 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66976AE051;
 Tue, 12 Apr 2022 16:41:09 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.3.143])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 12 Apr 2022 16:41:09 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com
Subject: [PATCH V3 1/2] tools/perf: Fix perf bench numa testcase to check if
 CPU used to bind task is online
Date: Tue, 12 Apr 2022 22:10:58 +0530
Message-Id: <20220412164059.42654-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412164059.42654-1-atrajeev@linux.vnet.ibm.com>
References: <20220412164059.42654-1-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wdT-S5rnNNUZZtxvM_rePyjeityl5UUE
X-Proofpoint-ORIG-GUID: nNT47GkTbC3QUfvzXctk6PsjQpD0aPV9
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-12_06,2022-04-12_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204120079
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, srikar@linux.vnet.ibm.com,
 rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, kjain@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Perf numa bench test fails with error:

Testcase:
./perf bench numa mem -p 2 -t 1 -P 1024 -C 0,8 -M 1,0 -s 20 -zZq
--thp  1 --no-data_rand_walk

Failure snippet:
<<>>
 Running 'numa/mem' benchmark:

 # Running main, "perf bench numa numa-mem -p 2 -t 1 -P 1024 -C 0,8
-M 1,0 -s 20 -zZq --thp 1 --no-data_rand_walk"

perf: bench/numa.c:333: bind_to_cpumask: Assertion `!(ret)' failed.
<<>>

The Testcases uses CPU's 0 and 8. In function "parse_setup_cpu_list",
There is check to see if cpu number is greater than max cpu's possible
in the system ie via "if (bind_cpu_0 >= g->p.nr_cpus ||
bind_cpu_1 >= g->p.nr_cpus) {". But it could happen that system has
say 48 CPU's, but only number of online CPU's is 0-7. Other CPU's
are offlined. Since "g->p.nr_cpus" is 48, so function will go ahead
and set bit for CPU 8 also in cpumask ( td->bind_cpumask).

bind_to_cpumask function is called to set affinity using
sched_setaffinity and the cpumask. Since the CPU8 is not present,
set affinity will fail here with EINVAL. Fix this issue by adding a
check to make sure that, CPU's provided in the input argument values
are online before proceeding further and skip the test. For this,
include new helper function "is_cpu_online" in
"tools/perf/util/header.c".

Since "BIT(x)" definition will get included from header.h, remove
that from bench/numa.c

Tested-by: Disha Goel <disgoel@linux.vnet.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
---
Changelog
 The first version was posted here:
 https://lore.kernel.org/all/20220406175113.87881-5-atrajeev@linux.vnet.ibm.com/
 This v3 version separates patch 4 and addressing review comments
 from Arnaldo to use sysfs__read_str for reading sysfs file.

 tools/perf/bench/numa.c  |  8 +++++--
 tools/perf/util/header.c | 51 ++++++++++++++++++++++++++++++++++++++++
 tools/perf/util/header.h |  1 +
 3 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/tools/perf/bench/numa.c b/tools/perf/bench/numa.c
index f2640179ada9..c838c248aa2c 100644
--- a/tools/perf/bench/numa.c
+++ b/tools/perf/bench/numa.c
@@ -34,6 +34,7 @@
 #include <linux/numa.h>
 #include <linux/zalloc.h>
 
+#include "../util/header.h"
 #include <numa.h>
 #include <numaif.h>
 
@@ -585,6 +586,11 @@ static int parse_setup_cpu_list(void)
 			return -1;
 		}
 
+		if (is_cpu_online(bind_cpu_0) != 1 || is_cpu_online(bind_cpu_1) != 1) {
+			printf("\nTest not applicable, bind_cpu_0 or bind_cpu_1 is offline\n");
+			return -1;
+		}
+
 		BUG_ON(bind_cpu_0 < 0 || bind_cpu_1 < 0);
 		BUG_ON(bind_cpu_0 > bind_cpu_1);
 
@@ -752,8 +758,6 @@ static int parse_nodes_opt(const struct option *opt __maybe_unused,
 	return parse_node_list(arg);
 }
 
-#define BIT(x) (1ul << x)
-
 static inline uint32_t lfsr_32(uint32_t lfsr)
 {
 	const uint32_t taps = BIT(1) | BIT(5) | BIT(6) | BIT(31);
diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
index d546ff724dbe..a27132e5a5ef 100644
--- a/tools/perf/util/header.c
+++ b/tools/perf/util/header.c
@@ -983,6 +983,57 @@ static int write_dir_format(struct feat_fd *ff,
 	return do_write(ff, &data->dir.version, sizeof(data->dir.version));
 }
 
+/*
+ * Check whether a CPU is online
+ *
+ * Returns:
+ *     1 -> if CPU is online
+ *     0 -> if CPU is offline
+ *    -1 -> error case
+ */
+int is_cpu_online(unsigned int cpu)
+{
+	char *str;
+	size_t strlen;
+	char buf[256];
+	int status = -1;
+	struct stat statbuf;
+
+	snprintf(buf, sizeof(buf),
+		"/sys/devices/system/cpu/cpu%d", cpu);
+	if (stat(buf, &statbuf) != 0)
+		return 0;
+
+	/*
+	 * Check if /sys/devices/system/cpu/cpux/online file
+	 * exists. Some cases cpu0 won't have online file since
+	 * it is not expected to be turned off generally.
+	 * In kernels without CONFIG_HOTPLUG_CPU, this
+	 * file won't exist
+	 */
+	snprintf(buf, sizeof(buf),
+		"/sys/devices/system/cpu/cpu%d/online", cpu);
+	if (stat(buf, &statbuf) != 0)
+		return 1;
+
+	/*
+	 * Read online file using sysfs__read_str.
+	 * If read or open fails, return -1.
+	 * If read succeeds, return value from file
+	 * which gets stored in "str"
+	 */
+	snprintf(buf, sizeof(buf),
+		"devices/system/cpu/cpu%d/online", cpu);
+
+	if (sysfs__read_str(buf, &str, &strlen) < 0)
+		return status;
+
+	status = atoi(str);
+
+	free(str);
+	return status;
+}
+
 #ifdef HAVE_LIBBPF_SUPPORT
 static int write_bpf_prog_info(struct feat_fd *ff,
 			       struct evlist *evlist __maybe_unused)
diff --git a/tools/perf/util/header.h b/tools/perf/util/header.h
index c9e3265832d9..0eb4bc29a5a4 100644
--- a/tools/perf/util/header.h
+++ b/tools/perf/util/header.h
@@ -158,6 +158,7 @@ int do_write(struct feat_fd *fd, const void *buf, size_t size);
 int write_padded(struct feat_fd *fd, const void *bf,
 		 size_t count, size_t count_aligned);
 
+int is_cpu_online(unsigned int cpu);
 /*
  * arch specific callback
  */
-- 
2.35.1

