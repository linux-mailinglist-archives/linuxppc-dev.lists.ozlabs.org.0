Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D0E232B34
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 07:11:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHJRH12ZfzDqfM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 15:11:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHJNW4sX5zDqft
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 15:08:59 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06U533pg060999; Thu, 30 Jul 2020 01:08:55 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jw2m4eev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 01:08:55 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06U57NhK019205;
 Thu, 30 Jul 2020 05:08:53 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 32gcqgntd9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 05:08:52 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06U58mRv19333412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jul 2020 05:08:48 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C22FA404D;
 Thu, 30 Jul 2020 05:08:48 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C29D5A405D;
 Thu, 30 Jul 2020 05:08:46 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 30 Jul 2020 05:08:46 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v3] selftests: powerpc: Fix online CPU selection
Date: Thu, 30 Jul 2020 10:38:46 +0530
Message-Id: <a408c4b8e9a23bb39b539417a21eb0ff47bb5127.1596084858.git.sandipan@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-30_03:2020-07-29,
 2020-07-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007300038
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
Cc: srikar@linux.vnet.ibm.com, kamalesh@linux.vnet.ibm.com, shiganta@in.ibm.com,
 nasastry@in.ibm.com, harish@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The size of the CPU affinity mask must be large enough for
systems with a very large number of CPUs. Otherwise, tests
which try to determine the first online CPU by calling
sched_getaffinity() will fail. This makes sure that the size
of the allocated affinity mask is dependent on the number of
CPUs as reported by get_nprocs_conf().

Fixes: 3752e453f6ba ("selftests/powerpc: Add tests of PMU EBBs")
Reported-by: Shirisha Ganta <shiganta@in.ibm.com>
Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
Reviewed-by: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
---
Previous versions can be found at:
v2: https://lore.kernel.org/linuxppc-dev/20200609073733.997643-1-sandipan@linux.ibm.com/
v1: https://lore.kernel.org/linuxppc-dev/20200608144212.985144-1-sandipan@linux.ibm.com/

Changes in v3:
- Use get_nprocs_conf() instead of get_nprocs() as suggested by
  Srikar to cope with test failures that Michael reported for
  sparse SMT setups.

Changes in v2:
- Added NULL check for the affinity mask as suggested by Kamalesh.
- Changed "cpu set" to "CPU affinity mask" in the commit message.

---
 tools/testing/selftests/powerpc/utils.c | 37 +++++++++++++++++--------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/powerpc/utils.c b/tools/testing/selftests/powerpc/utils.c
index 933678f1ed0a0..18b6a773d5c73 100644
--- a/tools/testing/selftests/powerpc/utils.c
+++ b/tools/testing/selftests/powerpc/utils.c
@@ -16,6 +16,7 @@
 #include <string.h>
 #include <sys/ioctl.h>
 #include <sys/stat.h>
+#include <sys/sysinfo.h>
 #include <sys/types.h>
 #include <sys/utsname.h>
 #include <unistd.h>
@@ -88,28 +89,40 @@ void *get_auxv_entry(int type)
 
 int pick_online_cpu(void)
 {
-	cpu_set_t mask;
-	int cpu;
+	int ncpus, cpu = -1;
+	cpu_set_t *mask;
+	size_t size;
+
+	ncpus = get_nprocs_conf();
+	size = CPU_ALLOC_SIZE(ncpus);
+	mask = CPU_ALLOC(ncpus);
+	if (!mask) {
+		perror("malloc");
+		return -1;
+	}
 
-	CPU_ZERO(&mask);
+	CPU_ZERO_S(size, mask);
 
-	if (sched_getaffinity(0, sizeof(mask), &mask)) {
+	if (sched_getaffinity(0, size, mask)) {
 		perror("sched_getaffinity");
-		return -1;
+		goto done;
 	}
 
 	/* We prefer a primary thread, but skip 0 */
-	for (cpu = 8; cpu < CPU_SETSIZE; cpu += 8)
-		if (CPU_ISSET(cpu, &mask))
-			return cpu;
+	for (cpu = 8; cpu < ncpus; cpu += 8)
+		if (CPU_ISSET_S(cpu, size, mask))
+			goto done;
 
 	/* Search for anything, but in reverse */
-	for (cpu = CPU_SETSIZE - 1; cpu >= 0; cpu--)
-		if (CPU_ISSET(cpu, &mask))
-			return cpu;
+	for (cpu = ncpus - 1; cpu >= 0; cpu--)
+		if (CPU_ISSET_S(cpu, size, mask))
+			goto done;
 
 	printf("No cpus in affinity mask?!\n");
-	return -1;
+
+done:
+	CPU_FREE(mask);
+	return cpu;
 }
 
 bool is_ppc64le(void)
-- 
2.25.1

