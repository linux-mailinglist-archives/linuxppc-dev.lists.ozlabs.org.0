Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFE125BE8F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 11:37:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bhwh84HYQzDq7h
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 19:37:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DNTNzVVy; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bhwdl2tDSzDr58
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Sep 2020 19:35:23 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0839WPsr005957; Thu, 3 Sep 2020 05:35:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=AA1gFtAyaxygtrYTd+c/verju5XPl8nITJZZ/eIZWUE=;
 b=DNTNzVVy6ZffwNRsO2npK3xeXI7itKkc56BYiSdJ3XjOQuBW6Sp0PbpcNe5Pn2etoFku
 IKzGXIaWUMRwWq6YpO/1p75jZAwGvQA98UkngZc+iYQJZEoxmnuUlqkTps2hXRwUU9aH
 tioFoEI8n8NL57G8q74OqLjrZLishGntfyX1nbQbQONyPHwvj3ih0BOqG/Ijr/cmtt9t
 QvyyXdq7+cBUU7jUEQ8WiG1lYkAyOlxL9IZcsgbQSapQVJgD+G+60NL1SdXHj+xlFRHe
 RW+kmwxa1vThqJbeD22NMIllTQYl1oD2oKeBuYds613I0WzbeJ7/ueTiL8c0NmhGHvPp 0A== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33awrp0bv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Sep 2020 05:35:11 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0839VRK5031343;
 Thu, 3 Sep 2020 09:35:10 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 337en9xk5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Sep 2020 09:35:10 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0839Z9ZR19661198
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Sep 2020 09:35:09 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B14626A054;
 Thu,  3 Sep 2020 09:35:09 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 500AE6A04F;
 Thu,  3 Sep 2020 09:35:09 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.75.144])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  3 Sep 2020 09:35:09 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 970602E2FE5; Thu,  3 Sep 2020 14:57:34 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Joel Stanley <joel@jms.id.au>
Subject: [PATCH v2] cpuidle-pseries: Fix CEDE latency conversion from tb to us
Date: Thu,  3 Sep 2020 14:57:27 +0530
Message-Id: <1599125247-28488-1-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-03_04:2020-09-03,
 2020-09-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=952 phishscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009030084
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
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>

commit d947fb4c965c ("cpuidle: pseries: Fixup exit latency for
CEDE(0)") sets the exit latency of CEDE(0) based on the latency values
of the Extended CEDE states advertised by the platform. The values
advertised by the platform are in timebase ticks. However the cpuidle
framework requires the latency values in microseconds.

If the tb-ticks value advertised by the platform correspond to a value
smaller than 1us, during the conversion from tb-ticks to microseconds,
in the current code, the result becomes zero. This is incorrect as it
puts a CEDE state on par with the snooze state.

This patch fixes this by rounding up the result obtained while
converting the latency value from tb-ticks to microseconds. It also
prints a warning in case we discover an extended-cede state with
wakeup latency to be 0. In such a case, ensure that CEDE(0) has a
non-zero wakeup latency.

Fixes: commit d947fb4c965c ("cpuidle: pseries: Fixup exit latency for
CEDE(0)")

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
v1-->v2: Added a warning if a CEDE state has 0 wakeup latency (Suggested by Joel Stanley)
         Also added code to ensure that CEDE(0) has a non-zero wakeup latency.	 
 drivers/cpuidle/cpuidle-pseries.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
index ff6d99e..a2b5c6f 100644
--- a/drivers/cpuidle/cpuidle-pseries.c
+++ b/drivers/cpuidle/cpuidle-pseries.c
@@ -361,7 +361,10 @@ static void __init fixup_cede0_latency(void)
 	for (i = 0; i < nr_xcede_records; i++) {
 		struct xcede_latency_record *record = &payload->records[i];
 		u64 latency_tb = be64_to_cpu(record->latency_ticks);
-		u64 latency_us = tb_to_ns(latency_tb) / NSEC_PER_USEC;
+		u64 latency_us = DIV_ROUND_UP_ULL(tb_to_ns(latency_tb), NSEC_PER_USEC);
+
+		if (latency_us == 0)
+			pr_warn("cpuidle: xcede record %d has an unrealistic latency of 0us.\n", i);
 
 		if (latency_us < min_latency_us)
 			min_latency_us = latency_us;
@@ -378,10 +381,14 @@ static void __init fixup_cede0_latency(void)
 	 * Perform the fix-up.
 	 */
 	if (min_latency_us < dedicated_states[1].exit_latency) {
-		u64 cede0_latency = min_latency_us - 1;
+		/*
+		 * We set a minimum of 1us wakeup latency for cede0 to
+		 * distinguish it from snooze
+		 */
+		u64 cede0_latency = 1;
 
-		if (cede0_latency <= 0)
-			cede0_latency = min_latency_us;
+		if (min_latency_us > cede0_latency)
+			cede0_latency = min_latency_us - 1;
 
 		dedicated_states[1].exit_latency = cede0_latency;
 		dedicated_states[1].target_residency = 10 * (cede0_latency);
-- 
1.9.4

