Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B04D4216B34
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 13:14:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1Kb05jSszDqpy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 21:14:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1KX55BXgzDqKZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 21:12:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B1KX468k8z8svd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 21:12:04 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B1KX43qGJz9sRW; Tue,  7 Jul 2020 21:12:04 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B1KX40SNyz9s1x;
 Tue,  7 Jul 2020 21:12:03 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 067B2i2C089251; Tue, 7 Jul 2020 07:12:01 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32482ks4dn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 07:12:01 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 067B3Cxq092607;
 Tue, 7 Jul 2020 07:12:01 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32482ks4cx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 07:12:01 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 067AxJYl027900;
 Tue, 7 Jul 2020 11:12:00 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 324aejecmn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 11:12:00 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 067BBxxc49611132
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Jul 2020 11:11:59 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7704B112062;
 Tue,  7 Jul 2020 11:11:59 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4603112061;
 Tue,  7 Jul 2020 11:11:58 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.70.202])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  7 Jul 2020 11:11:58 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 8EAC92E48CB; Tue,  7 Jul 2020 16:41:54 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, Anton Blanchard <anton@ozlabs.org>,
 Nathan Lynch <nathanl@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michael Neuling <mikey@neuling.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Subject: [PATCH 4/5] cpuidle-pseries : Include extended CEDE states in cpuidle
 framework
Date: Tue,  7 Jul 2020 16:41:38 +0530
Message-Id: <1594120299-31389-5-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594120299-31389-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1594120299-31389-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-07_06:2020-07-07,
 2020-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 clxscore=1011 phishscore=0 suspectscore=0 cotscore=-2147483648
 mlxlogscore=999 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2007070081
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

This patch exposes those extended CEDE states to the cpuidle framework
which are responsive to external interrupts and do not need an H_PROD.

Since as per the PAPR, all the extended CEDE states are non-responsive
to timers, we indicate this to the cpuidle subsystem via the
CPUIDLE_FLAG_TIMER_STOP flag for all those extende CEDE states which
can wake up on external interrupts.

With the patch, we are able to see the extended CEDE state with
latency hint = 1 exposed via the cpuidle framework.

	$ cpupower idle-info
	CPUidle driver: pseries_idle
	CPUidle governor: menu
	analyzing CPU 0:

	Number of idle states: 3
	Available idle states: snooze CEDE XCEDE1
	snooze:
	Flags/Description: snooze
	Latency: 0
	Usage: 33429446
	Duration: 27006062
	CEDE:
	Flags/Description: CEDE
	Latency: 1
	Usage: 10272
	Duration: 110786770
	XCEDE1:
	Flags/Description: XCEDE1
	Latency: 12
	Usage: 26445
	Duration: 1436433815

Benchmark results:
TLDR: Over all we do not see any additional benefit from having XCEDE1 over
CEDE.

ebizzy :
2 threads bound to a big-core. With this patch, we see a 3.39%
regression compared to with only CEDE0 latency fixup.
x With only CEDE0 latency fixup
* With CEDE0 latency fixup + CEDE1
    N           Min           Max        Median           Avg        Stddev
x  10       2893813       5834474       5832448     5327281.3     1055941.4
*  10       2907329       5834923       5831398     5146614.6     1193874.8

context_switch2:
With the context_switch2 there are no observable regressions in the
results.

context_switch2 CPU0 CPU1 (Same Big-core, different small-cores).
No difference with and without patch.
x without_patch
* with_patch
    N           Min           Max        Median           Avg        Stddev
x 500        343644        348778        345444     345584.02     1035.1658
* 500        344310        347646        345776     345877.22     802.19501

context_switch2 CPU0 CPU8 (different big-cores). Minor 0.05% improvement
with patch
x without_patch
* with_patch
    N           Min           Max        Median           Avg        Stddev
x 500        287562        288756        288162     288134.76     262.24328
* 500        287874        288960        288306     288274.66     187.57034

schbench:
No regressions observed with schbench

Without Patch:
Latency percentiles (usec)
	50.0th: 29
	75.0th: 40
	90.0th: 50
	95.0th: 61
	*99.0th: 13648
	99.5th: 14768
	99.9th: 15664
	min=0, max=29812

With Patch:
Latency percentiles (usec)
	50.0th: 30
	75.0th: 40
	90.0th: 51
	95.0th: 59
	*99.0th: 13616
	99.5th: 14512
	99.9th: 15696
	min=0, max=15996

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 drivers/cpuidle/cpuidle-pseries.c | 50 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
index 502f906..6f893cd 100644
--- a/drivers/cpuidle/cpuidle-pseries.c
+++ b/drivers/cpuidle/cpuidle-pseries.c
@@ -362,9 +362,59 @@ static int add_pseries_idle_states(void)
 	for (i = 0; i < nr_xcede_records; i++) {
 		u64 latency_tb = xcede_records[i].wakeup_latency_tb_ticks;
 		u64 latency_us = tb_to_ns(latency_tb) / NSEC_PER_USEC;
+		char name[CPUIDLE_NAME_LEN];
+		unsigned int latency_hint = xcede_records[i].latency_hint;
+		u64 residency_us;
+
+		if (!xcede_records[i].responsive_to_irqs) {
+			pr_info("cpuidle : Skipping XCEDE%d. Not responsive to IRQs\n",
+				latency_hint);
+			continue;
+		}
 
 		if (latency_us < min_latency_us)
 			min_latency_us = latency_us;
+		snprintf(name, CPUIDLE_NAME_LEN, "XCEDE%d", latency_hint);
+
+		/*
+		 * As per the section 14.14.1 of PAPR version 2.8.1
+		 * says that alling H_CEDE with the value of the cede
+		 * latency specifier set greater than zero allows the
+		 * processor timer facility to be disabled (so as not
+		 * to cause gratuitous wake-ups - the use of H_PROD,
+		 * or other external interrupt is required to wake the
+		 * processor in this case).
+		 *
+		 * So, inform the cpuidle-subsystem that the timer
+		 * will be stopped for these states.
+		 *
+		 * Also, bump up the latency by 10us, since cpuidle
+		 * would use timer-offload framework which will need
+		 * to send an IPI to wakeup a CPU whose timer has
+		 * expired.
+		 */
+		if (latency_hint > 0) {
+			dedicated_states[nr_states].flags = CPUIDLE_FLAG_TIMER_STOP;
+			latency_us += 10;
+		}
+
+		/*
+		 * Thumb rule : Reside in the XCEDE state for at least
+		 * 10x the time required to enter and exit that state.
+		 */
+		residency_us = latency_us * 10;
+
+		strlcpy(dedicated_states[nr_states].name, (const char *)name,
+			CPUIDLE_NAME_LEN);
+		strlcpy(dedicated_states[nr_states].desc, (const char *)name,
+			CPUIDLE_NAME_LEN);
+		dedicated_states[nr_states].exit_latency = latency_us;
+		dedicated_states[nr_states].target_residency = residency_us;
+		dedicated_states[nr_states].enter = &dedicated_cede_loop;
+		cede_latency_hint[nr_states] = latency_hint;
+		pr_info("cpuidle : Added %s. latency-hint = %d\n",
+			name, latency_hint);
+		nr_states++;
 	}
 
 	/*
-- 
1.9.4

