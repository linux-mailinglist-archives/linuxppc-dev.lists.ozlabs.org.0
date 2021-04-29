Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1469436E46B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 07:19:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FW3hR0bTyz300T
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 15:19:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Kqo19dAD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Kqo19dAD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FW3gy74PCz2xZ0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 15:18:54 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13T54rhs101732; Thu, 29 Apr 2021 01:18:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=nD5a2mB0T56HgBFjR492HhSCDTpz0YNDcChxpBKxzMI=;
 b=Kqo19dADjGcCBFfCO7VStowzUCFTxU1mi/qzOPUd7UjGfLGSxIV0dgtKgCPQ7OumPypC
 C2FG2EOohWpLIRdj0iSdcbO3fJ0AWbWh0AfVHKNoPsiP8TKxC1EyyjepJ7QhitRi8zyk
 UwVAK5SwPSaUbLsN866tyUJkyy6qC4RDXTxeY1pJ2VmAhTMVWC0ay5POvWDIIH6LKzaK
 nXIG0b13Coz1w2czWu9MMyLpHcXhMaVpCYWmIw0mg/K3gllmBNUwAj7bpHhbUbU4R3cr
 sumw5xOc1Y46s6GicLNIK/2pZoXXwruhFE3QxqnRruTfut6T1U4Hg4hyw9nghsnY5o3m vQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 387m1130t6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 01:18:47 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13T5Gq1P001568;
 Thu, 29 Apr 2021 05:18:47 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 384ay9t6gw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 05:18:47 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13T5IjFX37814616
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Apr 2021 05:18:46 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D339D28059;
 Thu, 29 Apr 2021 05:18:45 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D19828058;
 Thu, 29 Apr 2021 05:18:45 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.102.17.6])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 29 Apr 2021 05:18:45 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 987F32E2EAC; Thu, 29 Apr 2021 10:48:41 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Subject: [PATCH v2] cpuidle/pseries: Fixup CEDE0 latency only for POWER10
 onwards
Date: Thu, 29 Apr 2021 10:48:37 +0530
Message-Id: <1619673517-10853-1-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5t4tBNP0zo6cyHcS5qiTrlBOTPCPIP53
X-Proofpoint-GUID: 5t4tBNP0zo6cyHcS5qiTrlBOTPCPIP53
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-29_02:2021-04-28,
 2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104290038
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linux-pm@vger.kernel.org,
 joedecke@de.ibm.com, Michal Suchanek <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org
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
of 10us.

Reported-by: Enrico Joedecke <joedecke@de.ibm.com>
Fixes: commit d947fb4c965c ("cpuidle: pseries: Fixup exit latency for
CEDE(0)")
Cc: Michal Suchanek <msuchanek@suse.de>
Cc: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
v1-->v2 : Updated the commit log with the details of the measured
          latencies on POWER9 LPARs.
 drivers/cpuidle/cpuidle-pseries.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
index a2b5c6f..7207467 100644
--- a/drivers/cpuidle/cpuidle-pseries.c
+++ b/drivers/cpuidle/cpuidle-pseries.c
@@ -419,7 +419,8 @@ static int pseries_idle_probe(void)
 			cpuidle_state_table = shared_states;
 			max_idle_state = ARRAY_SIZE(shared_states);
 		} else {
-			fixup_cede0_latency();
+			if (pvr_version_is(PVR_POWER10))
+				fixup_cede0_latency();
 			cpuidle_state_table = dedicated_states;
 			max_idle_state = NR_DEDICATED_STATES;
 		}
-- 
1.8.3.1

