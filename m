Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC45B232B71
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 07:40:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHK4m6VZ2zDqkL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 15:40:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHJwh4fJHzDqn2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 15:33:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BHJwg3qfKz9CLb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 15:33:23 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BHJwg1vR8z9sRK; Thu, 30 Jul 2020 15:33:23 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 4BHJwf450qz9sSd;
 Thu, 30 Jul 2020 15:33:21 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06U5W4AR075059; Thu, 30 Jul 2020 01:33:19 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32ke626p0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 01:33:18 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06U5WGip076106;
 Thu, 30 Jul 2020 01:33:18 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32ke626p0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 01:33:18 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06U5OhcZ020524;
 Thu, 30 Jul 2020 05:33:17 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 32gcy4sre1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 05:33:17 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06U5XGHt44958002
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jul 2020 05:33:16 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5741F6A057;
 Thu, 30 Jul 2020 05:33:16 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F8E16A04D;
 Thu, 30 Jul 2020 05:33:15 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.102.0.230])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 30 Jul 2020 05:33:15 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id E6F5D2E2F45; Thu, 30 Jul 2020 11:03:09 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, Anton Blanchard <anton@ozlabs.org>,
 Nathan Lynch <nathanl@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michael Neuling <mikey@neuling.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Subject: [PATCH v3 2/3] cpuidle-pseries: Add function to parse extended CEDE
 records
Date: Thu, 30 Jul 2020 11:02:56 +0530
Message-Id: <1596087177-30329-3-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596087177-30329-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1596087177-30329-1-git-send-email-ego@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-30_03:2020-07-29,
 2020-07-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Currently we use CEDE with latency-hint 0 as the only other idle state
on a dedicated LPAR apart from the polling "snooze" state.

The platform might support additional extended CEDE idle states, which
can be discovered through the "ibm,get-system-parameter" rtas-call
made with CEDE_LATENCY_TOKEN.

This patch adds a function to obtain information about the extended
CEDE idle states from the platform and parse the contents to populate
an array of extended CEDE states. These idle states thus discovered
will be added to the cpuidle framework in the next patch.

dmesg on a POWER8 and POWER9 LPAR, demonstrating the output of parsing
the extended CEDE latency parameters are as follows

POWER8
[   10.093279] xcede : xcede_record_size = 10
[   10.093285] xcede : Record 0 : hint = 1, latency = 0x3c00 tb ticks, Wake-on-irq = 1
[   10.093291] xcede : Record 1 : hint = 2, latency = 0x4e2000 tb ticks, Wake-on-irq = 0
[   10.093297] cpuidle : Skipping the 2 Extended CEDE idle states

POWER9
[    5.913180] xcede : xcede_record_size = 10
[    5.913183] xcede : Record 0 : hint = 1, latency = 0x400 tb ticks, Wake-on-irq = 1
[    5.913188] xcede : Record 1 : hint = 2, latency = 0x3e8000 tb ticks, Wake-on-irq = 0
[    5.913193] cpuidle : Skipping the 2 Extended CEDE idle states

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
v2-->v3 : Cleaned up parse_cede_parameters(). Silenced some sparse warnings.
drivers/cpuidle/cpuidle-pseries.c | 142 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
index f5865a2..f528da7 100644
--- a/drivers/cpuidle/cpuidle-pseries.c
+++ b/drivers/cpuidle/cpuidle-pseries.c
@@ -21,6 +21,7 @@
 #include <asm/runlatch.h>
 #include <asm/idle.h>
 #include <asm/plpar_wrappers.h>
+#include <asm/rtas.h>
 
 static struct cpuidle_driver pseries_idle_driver = {
 	.name             = "pseries_idle",
@@ -87,6 +88,137 @@ static void check_and_cede_processor(void)
 }
 
 #define NR_DEDICATED_STATES	2 /* snooze, CEDE */
+/*
+ * XCEDE : Extended CEDE states discovered through the
+ *         "ibm,get-systems-parameter" rtas-call with the token
+ *         CEDE_LATENCY_TOKEN
+ */
+#define MAX_XCEDE_STATES		4
+#define	XCEDE_LATENCY_RECORD_SIZE	10
+#define XCEDE_LATENCY_PARAM_MAX_LENGTH	(2 + 2 + \
+					(MAX_XCEDE_STATES * XCEDE_LATENCY_RECORD_SIZE))
+
+/*
+ * Section 7.3.16 System Parameters Option of PAPR version 2.8.1 has a
+ * table with all the parameters to ibm,get-system-parameters.
+ * CEDE_LATENCY_TOKEN corresponds to the token value for Cede Latency
+ * Settings Information.
+ */
+#define CEDE_LATENCY_TOKEN		45
+
+/*
+ * If the platform supports the cede latency settings
+ * information system parameter it must provide the following
+ * information in the NULL terminated parameter string:
+ *
+ * a. The first byte is the length “N” of each cede
+ *    latency setting record minus one (zero indicates a length
+ *    of 1 byte).
+ *
+ * b. For each supported cede latency setting a cede latency
+ *    setting record consisting of the first “N” bytes as per
+ *    the following table.
+ *
+ *	-----------------------------
+ *	| Field           | Field  |
+ *	| Name            | Length |
+ *	-----------------------------
+ *	| Cede Latency    | 1 Byte |
+ *	| Specifier Value |        |
+ *	-----------------------------
+ *	| Maximum wakeup  |        |
+ *	| latency in      | 8 Bytes|
+ *	| tb-ticks        |        |
+ *	-----------------------------
+ *	| Responsive to   |        |
+ *	| external        | 1 Byte |
+ *	| interrupts      |        |
+ *	-----------------------------
+ *
+ * This version has cede latency record size = 10.
+ *
+ * The structure xcede_latency_payload represents a) and b) with
+ * xcede_latency_record representing the table in b).
+ *
+ * xcede_latency_parameter is what gets returned by
+ * ibm,get-systems-parameter rtas-call when made with
+ * CEDE_LATENCY_TOKEN.
+ *
+ * These structures are only used to represent the data sent obtained
+ * by the rtas-call. The data is in Big-Endian.
+ */
+struct xcede_latency_record {
+	u8	hint;
+	__be64	latency_ticks;
+	u8	wake_on_irqs;
+} __packed;
+
+struct xcede_latency_payload {
+	u8     record_size;
+	struct xcede_latency_record records[MAX_XCEDE_STATES];
+} __packed;
+
+struct xcede_latency_parameter {
+	__be16  payload_size;
+	struct xcede_latency_payload payload;
+	u8 null_char;
+} __packed;
+
+static unsigned int nr_xcede_records;
+static struct xcede_latency_parameter xcede_latency_parameter __initdata;
+
+static int __init parse_cede_parameters(void)
+{
+	int ret, i;
+	u16 payload_size;
+	u8 xcede_record_size;
+	u32 total_xcede_records_size;
+	struct xcede_latency_payload *payload;
+
+	memset(&xcede_latency_parameter, 0, sizeof(xcede_latency_parameter));
+
+	ret = rtas_call(rtas_token("ibm,get-system-parameter"), 3, 1,
+			NULL, CEDE_LATENCY_TOKEN, __pa(&xcede_latency_parameter),
+			sizeof(xcede_latency_parameter));
+
+	if (ret) {
+		pr_err("xcede: Error parsing CEDE_LATENCY_TOKEN\n");
+		return ret;
+	}
+
+	payload_size = be16_to_cpu(xcede_latency_parameter.payload_size);
+	payload = &xcede_latency_parameter.payload;
+
+	xcede_record_size = payload->record_size + 1;
+
+	if (xcede_record_size != XCEDE_LATENCY_RECORD_SIZE) {
+		pr_err("xcede : Expected record-size %d. Observed size %d.\n",
+		       XCEDE_LATENCY_RECORD_SIZE, xcede_record_size);
+		return -EINVAL;
+	}
+
+	pr_info("xcede : xcede_record_size = %d\n", xcede_record_size);
+
+	/*
+	 * Since the payload_length includes the last NULL byte and
+	 * the xcede_record_size, the remaining bytes correspond to
+	 * array of all cede_latency settings.
+	 */
+	total_xcede_records_size = payload_size - 2;
+	nr_xcede_records = total_xcede_records_size / xcede_record_size;
+
+	for (i = 0; i < nr_xcede_records; i++) {
+		struct xcede_latency_record *record = &payload->records[i];
+		u8 hint = record->hint;
+		u8 wake_on_irqs = record->wake_on_irqs;
+		u64 latency_ticks = be64_to_cpu(record->latency_ticks);
+
+		pr_info("xcede : Record %d : hint = %u, latency = 0x%llx tb ticks, Wake-on-irq = %u\n",
+			i, hint, latency_ticks, wake_on_irqs);
+	}
+
+	return 0;
+}
 
 u8 cede_latency_hint[NR_DEDICATED_STATES];
 static int dedicated_cede_loop(struct cpuidle_device *dev,
@@ -218,6 +350,15 @@ static int pseries_cpuidle_driver_init(void)
 	return 0;
 }
 
+static void __init parse_xcede_idle_states(void)
+{
+	if (parse_cede_parameters())
+		return;
+
+	pr_info("cpuidle : Skipping the %d Extended CEDE idle states\n",
+		nr_xcede_records);
+}
+
 /*
  * pseries_idle_probe()
  * Choose state table for shared versus dedicated partition
@@ -239,6 +380,7 @@ static int pseries_idle_probe(void)
 			cpuidle_state_table = shared_states;
 			max_idle_state = ARRAY_SIZE(shared_states);
 		} else {
+			parse_xcede_idle_states();
 			cpuidle_state_table = dedicated_states;
 			max_idle_state = NR_DEDICATED_STATES;
 		}
-- 
1.9.4

