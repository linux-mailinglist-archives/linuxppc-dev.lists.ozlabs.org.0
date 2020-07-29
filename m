Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F022319D4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 08:55:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGknn50FbzDqg4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 16:55:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGkd4482wzDqw2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 16:47:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BGkd43gRCz9CYD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 16:47:52 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BGkd42NtQz9sTZ; Wed, 29 Jul 2020 16:47:52 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BGkd35xP1z9sTk;
 Wed, 29 Jul 2020 16:47:51 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06T6WjnN140771; Wed, 29 Jul 2020 02:47:49 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jpwdc5uw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 02:47:49 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06T6Y0Dv144223;
 Wed, 29 Jul 2020 02:47:48 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jpwdc5tu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 02:47:47 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06T6Ugl3004588;
 Wed, 29 Jul 2020 06:47:46 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 32gcy4fhd9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 06:47:46 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06T6ljLM44564816
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jul 2020 06:47:46 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFAC7AE05F;
 Wed, 29 Jul 2020 06:47:45 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40635AE060;
 Wed, 29 Jul 2020 06:47:45 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.85.173])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 29 Jul 2020 06:47:45 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id B7D562E2FF5; Wed, 29 Jul 2020 12:17:39 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, Anton Blanchard <anton@ozlabs.org>,
 Nathan Lynch <nathanl@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michael Neuling <mikey@neuling.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Subject: [PATCH v2 3/3] cpuidle-pseries : Fixup exit latency for CEDE(0)
Date: Wed, 29 Jul 2020 12:17:34 +0530
Message-Id: <1596005254-25753-4-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596005254-25753-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1596005254-25753-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-29_03:2020-07-28,
 2020-07-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007290043
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
Cc: linuxppc-dev@ozlabs.org, "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>

We are currently assuming that CEDE(0) has exit latency 10us, since
there is no way for us to query from the platform.  However, if the
wakeup latency of an Extended CEDE state is smaller than 10us, then we
can be sure that the exit latency of CEDE(0) cannot be more than that.
that.

In this patch, we fix the exit latency of CEDE(0) if we discover an
Extended CEDE state with wakeup latency smaller than 10us.

Benchmark results:

ebizzy:
2 ebizzy threads bound to the same big-core. 25% improvement in the
avg records/s with patch.
x without_patch
+ with_patch
    N           Min           Max        Median           Avg        Stddev
x  10       2491089       5834307       5398375       4244335     1596244.9
+  10       2893813       5834474       5832448     5327281.3     1055941.4

context_switch2 :
There is no major regression observed with this patch as seen from the
context_switch2 benchmark.

context_switch2 across CPU0 CPU1 (Both belong to same big-core, but different
small cores). We observe a minor 0.14% regression in the number of
context-switches (higher is better).
x without_patch
+ with_patch
    N           Min           Max        Median           Avg        Stddev
x 500        348872        362236        354712     354745.69      2711.827
+ 500        349422        361452        353942      354215.4     2576.9258
Difference at 99.0% confidence
    -530.288 +/- 430.963
    -0.149484% +/- 0.121485%
    (Student's t, pooled s = 2645.24)

context_switch2 across CPU0 CPU8 (Different big-cores). We observe a 0.37%
improvement in the number of context-switches (higher is better).
x without_patch
+ with_patch
    N           Min           Max        Median           Avg        Stddev
x 500        287956        294940        288896     288977.23     646.59295
+ 500        288300        294646        289582     290064.76     1161.9992
Difference at 99.0% confidence
    1087.53 +/- 153.194
    0.376337% +/- 0.0530125%
    (Student's t, pooled s = 940.299)

schbench:
No major difference could be seen until the 99.9th percentile.

Without-patch
Latency percentiles (usec)
	50.0th: 29
	75.0th: 39
	90.0th: 49
	95.0th: 59
	*99.0th: 13104
	99.5th: 14672
	99.9th: 15824
	min=0, max=17993

With-patch:
Latency percentiles (usec)
	50.0th: 29
	75.0th: 40
	90.0th: 50
	95.0th: 61
	*99.0th: 13648
	99.5th: 14768
	99.9th: 15664
	min=0, max=29812

Reviewed-by: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 drivers/cpuidle/cpuidle-pseries.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
index b1dc24d..0b2f115 100644
--- a/drivers/cpuidle/cpuidle-pseries.c
+++ b/drivers/cpuidle/cpuidle-pseries.c
@@ -334,12 +334,42 @@ static int pseries_cpuidle_driver_init(void)
 static int add_pseries_idle_states(void)
 {
 	int nr_states = 2; /* By default we have snooze, CEDE */
+	int i;
+	u64 min_latency_us = dedicated_states[1].exit_latency; /* CEDE latency */
 
 	if (parse_cede_parameters())
 		return nr_states;
 
-	pr_info("cpuidle : Skipping the %d Extended CEDE idle states\n",
-		nr_xcede_records);
+	for (i = 0; i < nr_xcede_records; i++) {
+		u64 latency_tb = xcede_records[i].wakeup_latency_tb_ticks;
+		u64 latency_us = tb_to_ns(latency_tb) / NSEC_PER_USEC;
+
+		if (latency_us < min_latency_us)
+			min_latency_us = latency_us;
+	}
+
+	/*
+	 * We are currently assuming that CEDE(0) has exit latency
+	 * 10us, since there is no way for us to query from the
+	 * platform.
+	 *
+	 * However, if the wakeup latency of an Extended CEDE state is
+	 * smaller than 10us, then we can be sure that CEDE(0)
+	 * requires no more than that.
+	 *
+	 * Perform the fix-up.
+	 */
+	if (min_latency_us < dedicated_states[1].exit_latency) {
+		u64 cede0_latency = min_latency_us - 1;
+
+		if (cede0_latency <= 0)
+			cede0_latency = min_latency_us;
+
+		dedicated_states[1].exit_latency = cede0_latency;
+		dedicated_states[1].target_residency = 10 * (cede0_latency);
+		pr_info("cpuidle : Fixed up CEDE exit latency to %llu us\n",
+			cede0_latency);
+	}
 
 	return nr_states;
 }
-- 
1.9.4

