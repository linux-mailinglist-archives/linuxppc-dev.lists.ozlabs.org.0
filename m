Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B84D31157B4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 20:20:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47V2Vs6ZSjzDqhH
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Dec 2019 06:20:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=desnesn@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47V2R80XdqzDqfK
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Dec 2019 06:17:39 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB6JHKHX057271
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 6 Dec 2019 14:17:37 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wq8uju9np-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Dec 2019 14:17:37 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xB6JFHd9006041
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 6 Dec 2019 19:17:36 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 2wkg280sq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Dec 2019 19:17:36 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB6JHYZf57147756
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Dec 2019 19:17:34 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27215BE05A;
 Fri,  6 Dec 2019 19:17:34 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17C08BE04F;
 Fri,  6 Dec 2019 19:17:32 +0000 (GMT)
Received: from ibm.ibmuc.com (unknown [9.85.176.162])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  6 Dec 2019 19:17:32 +0000 (GMT)
From: "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] selftests/powerpc: enable performance alerts when freezing
 counters on cycles_with_freeze_test selftest
Date: Fri,  6 Dec 2019 16:15:26 -0300
Message-Id: <20191206191526.26543-1-desnesn@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-06_06:2019-12-05,2019-12-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=1 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912060155
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
Cc: "Desnes A . Nunes do Rosario" <desnesn@linux.ibm.com>,
 Gustavo Romero <gromero@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Gustavo Romero <gromero@linux.ibm.com>

When disabling freezing counters by setting MMCR0 FC bit to 0, the MMCR0
PMAE bit must also be enabled if a Performance Monitor Alert (and the cor-
responding Performance Monitor Interrupt) is still desired to be received
when an enabled condition or event occurs.

This is the case of the cycles_with_freeze_test selftest, since the test
disables the MMCR0 PMAE due to the usage of PMU to trigger EBBs. This can
make the test loop up to the point of being killed by the test harness
timeout (2500 ms), since no other ebb event will happen because the MMCR0
PMAE bit is disabled, and thus, no more increments to ebb_count occur.

Fixes: 3752e453f6bafd7 ("selftests/powerpc: Add tests of PMU EBBs")
Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
[desnesn: Only set MMCR0_PMAE when disabling MMCR0_FC, reflow comment]
Signed-off-by: Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>
---
 .../testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c b/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c
index dcd351d20328..46b5a7d46c60 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c
@@ -81,7 +81,7 @@ int cycles_with_freeze(void)
 	{
 		counters_frozen = false;
 		mb();
-		mtspr(SPRN_MMCR0, mfspr(SPRN_MMCR0) & ~MMCR0_FC);
+		mtspr(SPRN_MMCR0, (mfspr(SPRN_MMCR0) & ~MMCR0_FC) | MMCR0_PMAE);
 
 		FAIL_IF(core_busy_loop());
 
-- 
2.21.0

