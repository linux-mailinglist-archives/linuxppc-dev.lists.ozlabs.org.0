Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CA2628353
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 15:57:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9sqZ1BGpz3ccs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 01:57:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qznfNdy0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aboorvad@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qznfNdy0;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9spY6CWrz3c3G
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 01:56:53 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 2AEEQqfg024050;
	Mon, 14 Nov 2022 14:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=a621prDVU+zXDdD7ylOylSmRzubVK74npGX0+5ko6YM=;
 b=qznfNdy0+Omk6wpREG43B5m9tHeuWj7YpgIFo7ozNA+QxPGR7f9LR1vIxTWMI1fQ02ZJ
 vWm+Dfu8fyWTAPGKhkvTC8stJJnoJ72m/xUi9WN3FIwZDBaARh5Rcr0MHPE1lBN+Fk8V
 lbNrhr+8p3o+Vv96JgzwSVFZECZcMau6UoR0k3B1E4OxDImHnm0t6pkvBBogftvdA9yM
 zKqvGods7FYjM7xYGGDguMsYVNhQNMReIWeqU+cpGgrVnXnu9+5jWW+kxN93vvYt/CGY
 rFG8twKqEtTwKWkPAXO9GSz4iWMX+BC02tOOTSCKPwNoXOMMwe8yHsk/ri5A1GW4QEZX Xw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kuqeg8sta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Nov 2022 14:56:38 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AEEubbs019318;
	Mon, 14 Nov 2022 14:56:37 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kuqeg8ssf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Nov 2022 14:56:37 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AEEoZ4B030064;
	Mon, 14 Nov 2022 14:56:36 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma06ams.nl.ibm.com with ESMTP id 3kt2rjarda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Nov 2022 14:56:35 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AEEuX8q48038260
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Nov 2022 14:56:33 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B449942047;
	Mon, 14 Nov 2022 14:56:33 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 106F74203F;
	Mon, 14 Nov 2022 14:56:30 +0000 (GMT)
Received: from li-87263a4c-1efe-11b2-a85c-b6723e0c5f8d.ibm.com.com (unknown [9.43.114.49])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 14 Nov 2022 14:56:29 +0000 (GMT)
From: Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>
To: mpe@ellerman.id.au, svaidy@linux.vnet.ibm.com, rafael@kernel.org,
        daniel.lezcano@linaro.org, npiggin@gmail.com
Subject: [PATCH v2] powerpc/cpuidle: Set CPUIDLE_FLAG_POLLING for snooze state
Date: Mon, 14 Nov 2022 20:26:11 +0530
Message-Id: <20221114145611.37669-1-aboorvad@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221114073154.30407-1-aboorvad@linux.vnet.ibm.com>
References: <20221114073154.30407-1-aboorvad@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: w1bGaCcFRLp9E9ZDsulBPIo1ZbIvhQXj
X-Proofpoint-GUID: JfEUSnslEYL2_4bGGzbaGT8vgFKY7cKd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-14_12,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211140103
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
Cc: Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, srikar@linux.vnet.ibm.com, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

During the comparative study of cpuidle governors, it is noticed that the
menu governor does not select CEDE state in some scenarios even though when
the sleep duration of the CPU exceeds the target residency of the CEDE idle
state this is because the CPU exits the snooze "polling" state when snooze
time limit is reached in the snooze_loop(), which is not a real wake up
and it just means that the polling state selection was not adequate.

cpuidle governors rely on CPUIDLE_FLAG_POLLING flag to be set for the
polling states to handle the condition mentioned above.

Hence, set the CPUIDLE_FLAG_POLLING flag for snooze state (polling state)
in powerpc arch to make the cpuidle governor work as expected.

Reference Commits:

- Timeout enabled for snooze state:
  commit 78eaa10f027c
  ("cpuidle: powernv/pseries: Auto-promotion of snooze to deeper idle state")

- commit dc2251bf98c6
  ("cpuidle: Eliminate the CPUIDLE_DRIVER_STATE_START symbol")

- Fix wakeup stats in governor for polling states
  commit 5f26bdceb9c0
  ("cpuidle: menu: Fix wakeup statistics updates for polling state")

Signed-off-by: Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>
---

Changelog: (v1 -> v2)

Added CPUIDLE_POLLING_FLAG to the correct cpuidle_state struct.

Previous version of the patch is stale which was sent by mistake, this 
is the correct version which is tested on powernv, pseries (shared and 
dedicated partitions)

 drivers/cpuidle/cpuidle-powernv.c | 5 ++++-
 drivers/cpuidle/cpuidle-pseries.c | 8 ++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-powernv.c b/drivers/cpuidle/cpuidle-powernv.c
index 0b5461b3d7dd..9ebedd972df0 100644
--- a/drivers/cpuidle/cpuidle-powernv.c
+++ b/drivers/cpuidle/cpuidle-powernv.c
@@ -76,6 +76,7 @@ static int snooze_loop(struct cpuidle_device *dev,
 	local_irq_enable();
 
 	snooze_exit_time = get_tb() + get_snooze_timeout(dev, drv, index);
+	dev->poll_time_limit = false;
 	ppc64_runlatch_off();
 	HMT_very_low();
 	while (!need_resched()) {
@@ -86,6 +87,7 @@ static int snooze_loop(struct cpuidle_device *dev,
 			 * cleared to order subsequent test of need_resched().
 			 */
 			clear_thread_flag(TIF_POLLING_NRFLAG);
+			dev->poll_time_limit = true;
 			smp_mb();
 			break;
 		}
@@ -155,7 +157,8 @@ static struct cpuidle_state powernv_states[CPUIDLE_STATE_MAX] = {
 		.desc = "snooze",
 		.exit_latency = 0,
 		.target_residency = 0,
-		.enter = snooze_loop },
+		.enter = snooze_loop,
+		.flags = CPUIDLE_FLAG_POLLING },
 };
 
 static int powernv_cpuidle_cpu_online(unsigned int cpu)
diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
index 7e7ab5597d7a..1bad4d2b7be3 100644
--- a/drivers/cpuidle/cpuidle-pseries.c
+++ b/drivers/cpuidle/cpuidle-pseries.c
@@ -44,6 +44,7 @@ static int snooze_loop(struct cpuidle_device *dev,
 	pseries_idle_prolog();
 	local_irq_enable();
 	snooze_exit_time = get_tb() + snooze_timeout;
+	dev->poll_time_limit = false;
 
 	while (!need_resched()) {
 		HMT_low();
@@ -54,6 +55,7 @@ static int snooze_loop(struct cpuidle_device *dev,
 			 * loop anyway. Require a barrier after polling is
 			 * cleared to order subsequent test of need_resched().
 			 */
+			dev->poll_time_limit = true;
 			clear_thread_flag(TIF_POLLING_NRFLAG);
 			smp_mb();
 			break;
@@ -268,7 +270,8 @@ static struct cpuidle_state dedicated_states[NR_DEDICATED_STATES] = {
 		.desc = "snooze",
 		.exit_latency = 0,
 		.target_residency = 0,
-		.enter = &snooze_loop },
+		.enter = &snooze_loop,
+		.flags = CPUIDLE_FLAG_POLLING },
 	{ /* CEDE */
 		.name = "CEDE",
 		.desc = "CEDE",
@@ -286,7 +289,8 @@ static struct cpuidle_state shared_states[] = {
 		.desc = "snooze",
 		.exit_latency = 0,
 		.target_residency = 0,
-		.enter = &snooze_loop },
+		.enter = &snooze_loop,
+		.flags = CPUIDLE_FLAG_POLLING },
 	{ /* Shared Cede */
 		.name = "Shared Cede",
 		.desc = "Shared Cede",
-- 
2.17.1

