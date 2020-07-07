Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B51216B76
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 13:26:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1Krn1YxpzDqBX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 21:26:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1KX91dkYzDqXv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 21:12:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B1KX86SXMz8tX8
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 21:12:08 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B1KX84SYTz9sTC; Tue,  7 Jul 2020 21:12:08 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 4B1KX80r1Yz9sRW;
 Tue,  7 Jul 2020 21:12:07 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 067B2qUv056292; Tue, 7 Jul 2020 07:12:06 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3249rce3dd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 07:12:06 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 067B4ZAe062109;
 Tue, 7 Jul 2020 07:12:05 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3249rce3ct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 07:12:05 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 067B0iic018990;
 Tue, 7 Jul 2020 11:12:04 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 322hd8f8ae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 11:12:04 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 067BC3Va42140088
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Jul 2020 11:12:03 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A0A9AC05F;
 Tue,  7 Jul 2020 11:12:03 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3806BAC060;
 Tue,  7 Jul 2020 11:12:03 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.70.202])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  7 Jul 2020 11:12:03 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id A34E02E48CE; Tue,  7 Jul 2020 16:41:54 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, Anton Blanchard <anton@ozlabs.org>,
 Nathan Lynch <nathanl@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michael Neuling <mikey@neuling.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Subject: [PATCH 5/5] cpuidle-pseries: Block Extended CEDE(1) which adds no
 additional value.
Date: Tue,  7 Jul 2020 16:41:39 +0530
Message-Id: <1594120299-31389-6-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594120299-31389-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1594120299-31389-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-07_07:2020-07-07,
 2020-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 cotscore=-2147483648 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 mlxlogscore=845 mlxscore=0 malwarescore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007070085
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

The Extended CEDE state with latency-hint = 1 is only different from
normal CEDE (with latency-hint = 0) in that a CPU in Extended CEDE(1)
does not wakeup on timer events. Both CEDE and Extended CEDE(1) map to
the same hardware idle state. Since we already get SMT folding from
the normal CEDE, the Extended CEDE(1) doesn't provide any additional
value. This patch blocks Extended CEDE(1).

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 drivers/cpuidle/cpuidle-pseries.c | 57 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 54 insertions(+), 3 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
index 6f893cd..be0b8b2 100644
--- a/drivers/cpuidle/cpuidle-pseries.c
+++ b/drivers/cpuidle/cpuidle-pseries.c
@@ -350,6 +350,43 @@ static int pseries_cpuidle_driver_init(void)
 	return 0;
 }
 
+#define XCEDE1_HINT	1
+#define ERR_NO_VALUE_ADD	(-1)
+#define ERR_NO_EE_WAKEUP	(-2)
+
+/*
+ * Returns 0 if the Extende CEDE state with @hint is not blocked in
+ * cpuidle framework.
+ *
+ * Returns ERR_NO_EE_WAKEUP if the Extended CEDE state is blocked due
+ * to not being responsive to external interrupts.
+ *
+ * Returns ERR_NO_VALUE_ADD if the Extended CEDE state does not provide
+ * added value addition over the normal CEDE.
+ */
+static int cpuidle_xcede_blocked(u8 hint, u64 latency_us, u8 responsive_to_irqs)
+{
+
+	/*
+	 * We will only allow extended CEDE states that are responsive
+	 * to irqs do not require an H_PROD to be woken up.
+	 */
+	if (!responsive_to_irqs)
+		return ERR_NO_EE_WAKEUP;
+
+	/*
+	 * We already obtain SMT folding benefits from CEDE (which is
+	 * CEDE with hint 0). Furthermore, CEDE is also responsive to
+	 * timer-events, while XCEDE1 requires an external
+	 * interrupt/H_PROD to be woken up. Hence, block XCEDE1 since
+	 * it adds no further value.
+	 */
+	if (hint == XCEDE1_HINT)
+		return ERR_NO_VALUE_ADD;
+
+	return 0;
+}
+
 static int add_pseries_idle_states(void)
 {
 	int nr_states = 2; /* By default we have snooze, CEDE */
@@ -365,15 +402,29 @@ static int add_pseries_idle_states(void)
 		char name[CPUIDLE_NAME_LEN];
 		unsigned int latency_hint = xcede_records[i].latency_hint;
 		u64 residency_us;
+		int rc;
+
+		if (latency_us < min_latency_us)
+			min_latency_us = latency_us;
+
+		rc = cpuidle_xcede_blocked(latency_hint, latency_us,
+					   xcede_records[i].responsive_to_irqs);
 
-		if (!xcede_records[i].responsive_to_irqs) {
+		if (rc) {
+			switch (rc) {
+			case ERR_NO_VALUE_ADD:
+				pr_info("cpuidle : Skipping XCEDE%d. No additional value-add\n",
+					latency_hint);
+				break;
+			case ERR_NO_EE_WAKEUP:
 			pr_info("cpuidle : Skipping XCEDE%d. Not responsive to IRQs\n",
 				latency_hint);
+			break;
+			}
+
 			continue;
 		}
 
-		if (latency_us < min_latency_us)
-			min_latency_us = latency_us;
 		snprintf(name, CPUIDLE_NAME_LEN, "XCEDE%d", latency_hint);
 
 		/*
-- 
1.9.4

