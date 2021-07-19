Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C471F3CCDFE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 08:34:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GSsWx4ghbz3bZC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 16:34:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s+y7PGu3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=s+y7PGu3; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GSsVv2Sfrz2yZC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jul 2021 16:33:42 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J6SiRh013093; Mon, 19 Jul 2021 02:33:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=xhsFBQQhd+v0g2hFgAVn2UjRNynXKnOoX1vUoPJcaTE=;
 b=s+y7PGu3M2MiMUXrnMNBpX157i65jMU/sfF9/j6ZyDw7wfg2w6UKibpRrMrjHMwOyjOA
 v7BlQ4OsOHoZ7T02asfyNUi4n2E8Wd6gpTj45YB7wyTo84N34rfKB6disFl9nCjFHyFF
 OACvM/l/2FLKvmpZXquL3Yzc2VJ/jIe7O7XfK/OcBJWKas//o+GFQiaebXi3ihLyJ7Ir
 4pQqX+WQh1+y+BbvN8kxzFHt2euHCxwYc6agZhUpM+gFHf1MJ54NA+1alHoWcoPDqWEy
 pUoeC9/f64i7AgHuAtoSnfHvKX1kRrVqEQ2d8M5YnsQ3VlIY3XTe6EU15Gja10c7vRGO 9g== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39w0mt4ar7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 02:33:35 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16J6Wvnv009171;
 Mon, 19 Jul 2021 06:33:34 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 39upuaddnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 06:33:34 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16J6XXVm19988864
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:33:33 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABBD26A74D;
 Mon, 19 Jul 2021 06:33:33 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 179696A74C;
 Mon, 19 Jul 2021 06:33:33 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.122.97])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 19 Jul 2021 06:33:32 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id DD1F72E2D40; Mon, 19 Jul 2021 12:03:30 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Michal Suchanek <msuchanek@suse.de>
Subject: [PATCH v5 2/2] cpuidle/pseries: Do not cap the CEDE0 latency in
 fixup_cede0_latency()
Date: Mon, 19 Jul 2021 12:03:19 +0530
Message-Id: <1626676399-15975-3-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626676399-15975-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1626676399-15975-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nAKZk-yhKhhOyvD5KGc_zypugulw-9aK
X-Proofpoint-GUID: nAKZk-yhKhhOyvD5KGc_zypugulw-9aK
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_02:2021-07-16,
 2021-07-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1011 mlxlogscore=999
 phishscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107190033
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 joedecke@de.ibm.com, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>

Currently in fixup_cede0_latency() code, we perform the fixup the
CEDE(0) exit latency value only if minimum advertized extended CEDE
latency values are less than 10us. This was done so as to not break
the expected behaviour on POWER8 platforms where the advertised
latency was higher than the default 10us, which would delay the SMT
folding on the core.

However, after the earlier patch "cpuidle/pseries: Fixup CEDE0 latency
only for POWER10 onwards", we can be sure that the fixup of CEDE0
latency is going to happen only from POWER10 onwards. Hence
unconditionally use the minimum exit latency provided by the platform.

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 drivers/cpuidle/cpuidle-pseries.c | 59 ++++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 29 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
index e592280d..bba449b 100644
--- a/drivers/cpuidle/cpuidle-pseries.c
+++ b/drivers/cpuidle/cpuidle-pseries.c
@@ -346,11 +346,9 @@ static int pseries_cpuidle_driver_init(void)
 static void __init fixup_cede0_latency(void)
 {
 	struct xcede_latency_payload *payload;
-	u64 min_latency_us;
+	u64 min_xcede_latency_us = UINT_MAX;
 	int i;
 
-	min_latency_us = dedicated_states[1].exit_latency; // CEDE latency
-
 	if (parse_cede_parameters())
 		return;
 
@@ -358,42 +356,45 @@ static void __init fixup_cede0_latency(void)
 		nr_xcede_records);
 
 	payload = &xcede_latency_parameter.payload;
+
+	/*
+	 * The CEDE idle state maps to CEDE(0). While the hypervisor
+	 * does not advertise CEDE(0) exit latency values, it does
+	 * advertise the latency values of the extended CEDE states.
+	 * We use the lowest advertised exit latency value as a proxy
+	 * for the exit latency of CEDE(0).
+	 */
 	for (i = 0; i < nr_xcede_records; i++) {
 		struct xcede_latency_record *record = &payload->records[i];
+		u8 hint = record->hint;
 		u64 latency_tb = be64_to_cpu(record->latency_ticks);
 		u64 latency_us = DIV_ROUND_UP_ULL(tb_to_ns(latency_tb), NSEC_PER_USEC);
 
-		if (latency_us == 0)
-			pr_warn("cpuidle: xcede record %d has an unrealistic latency of 0us.\n", i);
-
-		if (latency_us < min_latency_us)
-			min_latency_us = latency_us;
-	}
-
-	/*
-	 * By default, we assume that CEDE(0) has exit latency 10us,
-	 * since there is no way for us to query from the platform.
-	 *
-	 * However, if the wakeup latency of an Extended CEDE state is
-	 * smaller than 10us, then we can be sure that CEDE(0)
-	 * requires no more than that.
-	 *
-	 * Perform the fix-up.
-	 */
-	if (min_latency_us < dedicated_states[1].exit_latency) {
 		/*
-		 * We set a minimum of 1us wakeup latency for cede0 to
-		 * distinguish it from snooze
+		 * We expect the exit latency of an extended CEDE
+		 * state to be non-zero, it to since it takes at least
+		 * a few nanoseconds to wakeup the idle CPU and
+		 * dispatch the virtual processor into the Linux
+		 * Guest.
+		 *
+		 * So we consider only non-zero value for performing
+		 * the fixup of CEDE(0) latency.
 		 */
-		u64 cede0_latency = 1;
+		if (latency_us == 0) {
+			pr_warn("cpuidle: Skipping xcede record %d [hint=%d]. Exit latency = 0us\n",
+				i, hint);
+			continue;
+		}
 
-		if (min_latency_us > cede0_latency)
-			cede0_latency = min_latency_us - 1;
+		if (latency_us < min_xcede_latency_us)
+			min_xcede_latency_us = latency_us;
+	}
 
-		dedicated_states[1].exit_latency = cede0_latency;
-		dedicated_states[1].target_residency = 10 * (cede0_latency);
+	if (min_xcede_latency_us != UINT_MAX) {
+		dedicated_states[1].exit_latency = min_xcede_latency_us;
+		dedicated_states[1].target_residency = 10 * (min_xcede_latency_us);
 		pr_info("cpuidle: Fixed up CEDE exit latency to %llu us\n",
-			cede0_latency);
+			min_xcede_latency_us);
 	}
 
 }
-- 
1.9.4

