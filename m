Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7162E3CCE01
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 08:35:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GSsXN6fbTz3byZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 16:35:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W3YYif6R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=W3YYif6R; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GSsVv18Crz2yMn
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jul 2021 16:33:42 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J64BHm153323; Mon, 19 Jul 2021 02:33:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=MN9XLLEAnxmc+w1MpuwlLANXnCDdalG4ijujfQRd/o4=;
 b=W3YYif6RkOQk8cXfgAWsmF5bSRCUDbbUJGCLq2/qlpCiE4p4pdA79XKpDAkuu0rQip62
 WOOV4r9fyEDEfbqBgERBQA+v6/QVSX3SNtAc/an125siF0D5InYtqgMSMrThM9PqrG2J
 qBByGuE8mmv60AyJiZEoAtbp900SNt+GbvGOKBjFUiX3vCe1UDT5MjQ2h8zcn9rSZu0z
 ACNUCQXkEb5p/zLdKEp1kmF4HJcSDHdms+vPjp9FCoMynwSuOfCooodhz4kRi2b07bH2
 cX5/XbOCsuHef6VIEXIgW5OVP/I7/8fcXWiaxt+sZyfo9zYR1dmT0HGI2iw6gu516v8Q PA== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39vxwpf41y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 02:33:35 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16J6Hrks006070;
 Mon, 19 Jul 2021 06:33:34 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 39upu9vbwd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 06:33:34 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16J6XXlq35651956
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:33:33 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9AD77B205F;
 Mon, 19 Jul 2021 06:33:33 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CBABB206B;
 Mon, 19 Jul 2021 06:33:33 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.122.97])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 19 Jul 2021 06:33:32 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id D82332E2D0E; Mon, 19 Jul 2021 12:03:30 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Michal Suchanek <msuchanek@suse.de>
Subject: [PATCH v5 1/2] cpuidle/pseries: Fixup CEDE0 latency only for POWER10
 onwards
Date: Mon, 19 Jul 2021 12:03:18 +0530
Message-Id: <1626676399-15975-2-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626676399-15975-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1626676399-15975-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ky_QaEFudg8UK-dVwpv6xaf1kTKNdpBT
X-Proofpoint-GUID: ky_QaEFudg8UK-dVwpv6xaf1kTKNdpBT
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_02:2021-07-16,
 2021-07-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 impostorscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 clxscore=1015 mlxscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Commit d947fb4c965c ("cpuidle: pseries: Fixup exit latency for
CEDE(0)") sets the exit latency of CEDE(0) based on the latency values
of the Extended CEDE states advertised by the platform

On POWER9 LPARs, the firmwares advertise a very low value of 2us for
CEDE1 exit latency on a Dedicated LPAR. The latency advertized by the
PHYP hypervisor corresponds to the latency required to wakeup from the
underlying hardware idle state. However the wakeup latency from the
LPAR perspective should include

1. The time taken to transition the CPU from the Hypervisor into the
   LPAR post wakeup from platform idle state

2. Time taken to send the IPI from the source CPU (waker) to the idle
   target CPU (wakee).

1. can be measured via timer idle test, where we queue a timer, say
for 1ms, and enter the CEDE state. When the timer fires, in the timer
handler we compute how much extra timer over the expected 1ms have we
consumed. On a a POWER9 LPAR the numbers are

CEDE latency measured using a timer (numbers in ns)
N       Min      Median   Avg       90%ile  99%ile    Max    Stddev
400     2601     5677     5668.74    5917    6413     9299   455.01

1. and 2. combined can be determined by an IPI latency test where we
send an IPI to an idle CPU and in the handler compute the time
difference between when the IPI was sent and when the handler ran. We
see the following numbers on POWER9 LPAR.

CEDE latency measured using an IPI (numbers in ns)
N       Min      Median   Avg       90%ile  99%ile    Max    Stddev
400     711      7564     7369.43   8559    9514      9698   1200.01

Suppose, we consider the 99th percentile latency value measured using
the IPI to be the wakeup latency, the value would be 9.5us This is in
the ballpark of the default value of 10us.

Hence, use the exit latency of CEDE(0) based on the latency values
advertized by platform only from POWER10 onwards. The values
advertized on POWER10 platforms is more realistic and informed by the
latency measurements. For earlier platforms stick to the default value
of 10us. The fix was suggested by Michael Ellerman.

Reported-by: Enrico Joedecke <joedecke@de.ibm.com>
Fixes: commit d947fb4c965c ("cpuidle: pseries: Fixup exit latency for
CEDE(0)")
Cc: Michal Suchanek <msuchanek@suse.de>
Cc: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 drivers/cpuidle/cpuidle-pseries.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
index a2b5c6f..e592280d 100644
--- a/drivers/cpuidle/cpuidle-pseries.c
+++ b/drivers/cpuidle/cpuidle-pseries.c
@@ -419,7 +419,21 @@ static int pseries_idle_probe(void)
 			cpuidle_state_table = shared_states;
 			max_idle_state = ARRAY_SIZE(shared_states);
 		} else {
-			fixup_cede0_latency();
+			/*
+			 * Use firmware provided latency values
+			 * starting with POWER10 platforms. In the
+			 * case that we are running on a POWER10
+			 * platform but in an earlier compat mode, we
+			 * can still use the firmware provided values.
+			 *
+			 * However, on platforms prior to POWER10, we
+			 * cannot rely on the accuracy of the firmware
+			 * provided latency values. On such platforms,
+			 * go with the conservative default estimate
+			 * of 10us.
+			 */
+			if (cpu_has_feature(CPU_FTR_ARCH_31) || pvr_version_is(PVR_POWER10))
+				fixup_cede0_latency();
 			cpuidle_state_table = dedicated_states;
 			max_idle_state = NR_DEDICATED_STATES;
 		}
-- 
1.9.4

