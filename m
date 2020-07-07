Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3361216B41
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 13:16:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1Kdh5wDyzDq8v
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 21:16:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1KX56HPBzDqXv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 21:12:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B1KX54PtHz9CvR
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 21:12:05 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B1KX534CGz9sRW; Tue,  7 Jul 2020 21:12:05 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 4B1KX44pB6z9sRk;
 Tue,  7 Jul 2020 21:12:04 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 067B1aN6159350; Tue, 7 Jul 2020 07:12:02 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 324ffdweur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 07:12:02 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 067B1iFC160156;
 Tue, 7 Jul 2020 07:12:01 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 324ffdweuc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 07:12:01 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 067B0HGh032108;
 Tue, 7 Jul 2020 11:12:00 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 324qfur48q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 11:12:00 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 067BC0Jv50659838
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Jul 2020 11:12:00 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BAF0B2065;
 Tue,  7 Jul 2020 11:12:00 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D007EB205F;
 Tue,  7 Jul 2020 11:11:59 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.70.202])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  7 Jul 2020 11:11:59 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 509982E48B9; Tue,  7 Jul 2020 16:41:54 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, Anton Blanchard <anton@ozlabs.org>,
 Nathan Lynch <nathanl@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michael Neuling <mikey@neuling.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Subject: [PATCH 1/5] cpuidle-pseries: Set the latency-hint before entering CEDE
Date: Tue,  7 Jul 2020 16:41:35 +0530
Message-Id: <1594120299-31389-2-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594120299-31389-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1594120299-31389-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-07_06:2020-07-07,
 2020-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 impostorscore=0 cotscore=-2147483648 malwarescore=0 mlxscore=0
 adultscore=0 mlxlogscore=776 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007070081
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

As per the PAPR, each H_CEDE call is associated with a latency-hint to
be passed in the VPA field "cede_latency_hint". The CEDE states that
we were implicitly entering so far is CEDE with latency-hint = 0.

This patch explicitly sets the latency hint corresponding to the CEDE
state that we are currently entering. While at it, we save the
previous hint, to be restored once we wakeup from CEDE. This will be
required in the future when we expose extended-cede states through the
cpuidle framework, where each of them will have a different
cede-latency hint.

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 drivers/cpuidle/cpuidle-pseries.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
index 4a37252..39d4bb6 100644
--- a/drivers/cpuidle/cpuidle-pseries.c
+++ b/drivers/cpuidle/cpuidle-pseries.c
@@ -105,19 +105,27 @@ static void check_and_cede_processor(void)
 	}
 }
 
+#define NR_CEDE_STATES		1  /* CEDE with latency-hint 0 */
+#define NR_DEDICATED_STATES	(NR_CEDE_STATES + 1) /* Includes snooze */
+
+u8 cede_latency_hint[NR_DEDICATED_STATES];
 static int dedicated_cede_loop(struct cpuidle_device *dev,
 				struct cpuidle_driver *drv,
 				int index)
 {
+	u8 old_latency_hint;
 
 	pseries_idle_prolog();
 	get_lppaca()->donate_dedicated_cpu = 1;
+	old_latency_hint = get_lppaca()->cede_latency_hint;
+	get_lppaca()->cede_latency_hint = cede_latency_hint[index];
 
 	HMT_medium();
 	check_and_cede_processor();
 
 	local_irq_disable();
 	get_lppaca()->donate_dedicated_cpu = 0;
+	get_lppaca()->cede_latency_hint = old_latency_hint;
 
 	pseries_idle_epilog();
 
@@ -149,7 +157,7 @@ static int shared_cede_loop(struct cpuidle_device *dev,
 /*
  * States for dedicated partition case.
  */
-static struct cpuidle_state dedicated_states[] = {
+static struct cpuidle_state dedicated_states[NR_DEDICATED_STATES] = {
 	{ /* Snooze */
 		.name = "snooze",
 		.desc = "snooze",
-- 
1.9.4

