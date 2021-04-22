Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CAE368347
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 17:27:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FR1Vp1FfFz303H
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 01:26:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tqlDcIg1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tqlDcIg1; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FR1VM359rz2yZM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 01:26:34 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13MFJKNZ074998; Thu, 22 Apr 2021 11:26:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=yKJ2+PqDzOEUpqjEsmvdovopMFWQRYr3+kfeNLKRfk4=;
 b=tqlDcIg1qcbjg0hii3S4pzMMc03SMnMRRDh2qx3ypkmPYoYowfKnJjA0o7pUHmKXdki5
 xuvFupy8N2XMKNxbShrmUPjDOHGMU9Gcq/bCi3T4KTHWLN4TvOZCEHGbTnegimB1w+2+
 eGe/CkSl2LZzmjj+fSNHDg11mNzhn2fBB8a2Ae24BRt3iqO2pm42DrGBtYEDVKvSJMPq
 n57xyXqKk+CK7uYEPW6ue1gIsq6BPTpVJCB9mN4Kk4jupAckJ6po+moapYx42g2Xk45D
 o1utkLRD+6+dSB3NSUqcBQATw9Tmuw35FjiFPjfoMlI5g5WTaDPO9ugd7YVT3BWkunN3 cg== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3838by02ep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 11:26:24 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13MF2eOB029908;
 Thu, 22 Apr 2021 15:26:24 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04wdc.us.ibm.com with ESMTP id 3813tb3a0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 15:26:24 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13MFQNFm35455404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Apr 2021 15:26:23 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FBC6AC05F;
 Thu, 22 Apr 2021 15:26:23 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 458E1AC05B;
 Thu, 22 Apr 2021 15:26:23 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.68.114])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 22 Apr 2021 15:26:23 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 4805E2E2EE0; Thu, 22 Apr 2021 20:37:44 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Subject: [PATCH] cpuidle/pseries: Fixup CEDE0 latency only for POWER10 onwards
Date: Thu, 22 Apr 2021 20:37:29 +0530
Message-Id: <1619104049-5118-1-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WKU2eVXCss5iPN0ei4XY1NBuKM0NE3_s
X-Proofpoint-ORIG-GUID: WKU2eVXCss5iPN0ei4XY1NBuKM0NE3_s
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-22_06:2021-04-22,
 2021-04-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1011 spamscore=0 mlxlogscore=999 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104220120
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

On some of the POWER9 LPARs, the older firmwares advertise a very low
value of 2us for CEDE1 exit latency on a Dedicated LPAR. However the
measured value is 5us on an average. Due to the low advertised exit
latency, we are entering CEDE(0) more aggressively on such
platforms. While this helps achieve SMT folding faster, we pay the
penalty of having to send an IPI to wakeup the CPU when the target
residency is very short. This is showing up as a performance
regression on the newer kernels running on the LPARs with older
firmware.

Hence, set the exit latency of CEDE(0) based on the latency values
advertized by platform only from POWER10 onwards. The values
advertized on POWER10 platforms is more realistic and informed by the
latency measurements.

For platforms older than POWER10, retain the hardcoded value of exit
latency, which is 10us. Though this is higher than the measured
values, we would be erring on the side of caution.

Reported-by: Enrico Joedecke <joedecke@de.ibm.com>
Fixes: commit d947fb4c965c ("cpuidle: pseries: Fixup exit latency for
CEDE(0)")
Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
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
1.9.4

