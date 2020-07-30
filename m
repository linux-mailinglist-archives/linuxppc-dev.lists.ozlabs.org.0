Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 345B5232B82
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 07:45:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHKBW175PzDqQm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 15:45:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHK2Q1TNpzDqvr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 15:38:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BHK2P6Mm9z8tDK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 15:38:21 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BHK2P487Tz9sRX; Thu, 30 Jul 2020 15:38:21 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BHK2P0802z9sRW;
 Thu, 30 Jul 2020 15:38:20 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06U5VmcH162354; Thu, 30 Jul 2020 01:38:18 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32jg24x865-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 01:38:18 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06U5W8rR165925;
 Thu, 30 Jul 2020 01:38:18 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32jg24x85w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 01:38:18 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06U5OXKq017179;
 Thu, 30 Jul 2020 05:33:17 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 32gcy7hqu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 05:33:17 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06U5XG109306462
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jul 2020 05:33:16 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2A4F28058;
 Thu, 30 Jul 2020 05:33:16 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9F482805E;
 Thu, 30 Jul 2020 05:33:15 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.102.0.230])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 30 Jul 2020 05:33:15 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id F41B02E2FB3; Thu, 30 Jul 2020 11:03:09 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, Anton Blanchard <anton@ozlabs.org>,
 Nathan Lynch <nathanl@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michael Neuling <mikey@neuling.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Subject: [PATCH v3 3/3] cpuidle-pseries : Fixup exit latency for CEDE(0)
Date: Thu, 30 Jul 2020 11:02:57 +0530
Message-Id: <1596087177-30329-4-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596087177-30329-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1596087177-30329-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-30_03:2020-07-29,
 2020-07-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

On POWER8, this patch does not have any impact since the advertized
latency of Extended CEDE (1) is 30us which is higher than the default
latency of CEDE (0) which is 10us.

On POWER9 we see improvement the single-threaded performance of ebizzy,
and no regression in the wakeup latency or the number of
context-switches.

ebizzy:
2 ebizzy threads bound to the same big-core. 25% improvement in the
avg records/s with patch.
x without_patch
* with_patch
    N           Min           Max        Median           Avg        Stddev
x  10       2491089       5834307       5398375       4244335     1596244.9
*  10       2893813       5834474       5832448     5327281.3     1055941.4

context_switch2 :
There is no major regression observed with this patch as seen from the
context_switch2 benchmark.

context_switch2 across CPU0 CPU1 (Both belong to same big-core, but different
small cores). We observe a minor 0.14% regression in the number of
context-switches (higher is better).
x without_patch
* with_patch
    N           Min           Max        Median           Avg        Stddev
x 500        348872        362236        354712     354745.69      2711.827
* 500        349422        361452        353942      354215.4     2576.9258
Difference at 99.0% confidence
    -530.288 +/- 430.963
    -0.149484% +/- 0.121485%
    (Student's t, pooled s = 2645.24)

context_switch2 across CPU0 CPU8 (Different big-cores). We observe a 0.37%
improvement in the number of context-switches (higher is better).
x without_patch
* with_patch
    N           Min           Max        Median           Avg        Stddev
x 500        287956        294940        288896     288977.23     646.59295
* 500        288300        294646        289582     290064.76     1161.9992
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

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
v2-->v3 : Made notation consistent with first two patches.
 drivers/cpuidle/cpuidle-pseries.c | 41 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
index f528da7..8d19820 100644
--- a/drivers/cpuidle/cpuidle-pseries.c
+++ b/drivers/cpuidle/cpuidle-pseries.c
@@ -350,13 +350,50 @@ static int pseries_cpuidle_driver_init(void)
 	return 0;
 }
 
-static void __init parse_xcede_idle_states(void)
+static void __init fixup_cede0_latency(void)
 {
+	int i;
+	u64 min_latency_us = dedicated_states[1].exit_latency; /* CEDE latency */
+	struct xcede_latency_payload *payload;
+
 	if (parse_cede_parameters())
 		return;
 
 	pr_info("cpuidle : Skipping the %d Extended CEDE idle states\n",
 		nr_xcede_records);
+
+	payload = &xcede_latency_parameter.payload;
+	for (i = 0; i < nr_xcede_records; i++) {
+		struct xcede_latency_record *record = &payload->records[i];
+		u64 latency_tb = be64_to_cpu(record->latency_ticks);
+		u64 latency_us = tb_to_ns(latency_tb) / NSEC_PER_USEC;
+
+		if (latency_us < min_latency_us)
+			min_latency_us = latency_us;
+	}
+
+	/*
+	 * By default, we assume that CEDE(0) has exit latency 10us,
+	 * since there is no way for us to query from the platform.
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
+
 }
 
 /*
@@ -380,7 +417,7 @@ static int pseries_idle_probe(void)
 			cpuidle_state_table = shared_states;
 			max_idle_state = ARRAY_SIZE(shared_states);
 		} else {
-			parse_xcede_idle_states();
+			fixup_cede0_latency();
 			cpuidle_state_table = dedicated_states;
 			max_idle_state = NR_DEDICATED_STATES;
 		}
-- 
1.9.4

