Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B48EA36EA00
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 14:07:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWDky4zKfz30BK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 22:07:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P1qBJnKy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=P1qBJnKy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWDkW1l8Tz2xfY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 22:06:42 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13TC2YXx192526; Thu, 29 Apr 2021 08:06:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=Wc2iwGKhsQ4D8grN9MJQpv0BoIP+oKS2tF/e6X4+N7A=;
 b=P1qBJnKyPMHqQv4AzB3Lz4TUPt94dTuItQINq+U0b+bQZaX0NogkvSRv2eJahPQ1S0Fi
 /QcHa6nB33xghL/rdPL6BXLtvLbRvRc29dyHiItqlakn9d49D1KJ2iKQ1rO+3+WkL+fm
 p5/BCnZnK3qkRLdjFts4yLL55XFqtd5qzhpi4FYZb8sikjRlvqqDXZ3LhpRyXwnW0lW4
 5SHqjN99GLyZIs1Lalnb4m+QHPP5rmmUIDIlAbthHrGa3YtwiNy8jnwQ88rLFaAlTgZf
 lDC4a5maqNkZppVbkJGqpyfaSbY0L5f8VPg/VcjfMRloUiciMd+C75g4sGVGsX491eFB Xg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 387v6wrk47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 08:06:37 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13TBvGqI029810;
 Thu, 29 Apr 2021 12:06:36 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 384aya51v6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 12:06:36 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13TC6ZH242533294
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Apr 2021 12:06:35 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71F1CB2066;
 Thu, 29 Apr 2021 12:06:35 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA212B2065;
 Thu, 29 Apr 2021 12:06:34 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.71.115])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 29 Apr 2021 12:06:34 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 73F2D2E2E70; Thu, 29 Apr 2021 17:36:25 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Subject: [PATCH v3] cpuidle/pseries: Fixup CEDE0 latency only for POWER10
 onwards
Date: Thu, 29 Apr 2021 17:36:22 +0530
Message-Id: <1619697982-28461-1-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: llLKMnirxrfHNyPKa9uBTws5y4e-OJPF
X-Proofpoint-ORIG-GUID: llLKMnirxrfHNyPKa9uBTws5y4e-OJPF
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-29_06:2021-04-28,
 2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104290084
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
of 10us. The fix was suggested by Michael Ellerman.

Reported-by: Enrico Joedecke <joedecke@de.ibm.com>
Fixes: commit d947fb4c965c ("cpuidle: pseries: Fixup exit latency for
CEDE(0)")
Cc: Michal Suchanek <msuchanek@suse.de>
Cc: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
v2-->v3: Modify the condition to preclude only the platforms prior to
         POWER10 from using the firmware provided values.
	 
 drivers/cpuidle/cpuidle-pseries.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
index a2b5c6f..694d71e 100644
--- a/drivers/cpuidle/cpuidle-pseries.c
+++ b/drivers/cpuidle/cpuidle-pseries.c
@@ -349,6 +349,15 @@ static void __init fixup_cede0_latency(void)
 	u64 min_latency_us;
 	int i;
 
+	/*
+	 * Use firmware provided latency values on POWER10 onwards and
+	 * also on POWER10 running in POWER9-compat mode. On platforms
+	 * prior to POWER10, we cannot rely on the firmware provided
+	 * values, so we go with the conservative default value.
+	 */
+	if (!cpu_has_feature(CPU_FTR_ARCH_31) && !pvr_version_is(PVR_POWER10))
+		return;
+
 	min_latency_us = dedicated_states[1].exit_latency; // CEDE latency
 
 	if (parse_cede_parameters())
-- 
1.9.4

