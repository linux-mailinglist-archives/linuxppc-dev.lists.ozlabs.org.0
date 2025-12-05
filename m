Return-Path: <linuxppc-dev+bounces-14663-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17731CA9621
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 22:23:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNPWK1PLjz2xS5;
	Sat, 06 Dec 2025 08:23:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764944979;
	cv=none; b=g5sCCASREusdxbyoaFIiaOKRf30TcjFvvRQPFem5plwXYOuGQ3AKk24R8IcXBpJzDs4l3QIPZqaE0MsFVnX85I3c9hLkVF99HJTT8958nH3Kg291ww6Y47rpUK1q//DopU52w9Ijaxuur1TgcyS8caqWVbVwlbOECms/a+APoE78ZG7hF8TE45pH7IqHk2i7FHvejCSxMcBEfGQemtmKE0LdJxjlPzKiuAbNXkOKXhvMhdz79bkhgxnOHVq19BhQesWburOSW/j6xdGKE1bWaRHpGDaaWl/rVzfi6QVr7ddbBd3erABb3fu3q9S818uBoHpJOy/AGmQk6DHDU0+a7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764944979; c=relaxed/relaxed;
	bh=/dXcxfSlF774i0xjufzkyQASJ8OfL3gMQTfDsWayaJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DvmTsb0LPrtSV6tgo7tyBH4+EQieguyb+paNahFqJzlQY0fo1nZRP0LblMr28i9Jq4tLI2SuZT7wMbmn0MGBql6SeyjKecj/VppnWQAoMBP/+fGQwSL2mDmC4fC2KDy0gG7axr8nOhsv4oqqShFFhM2dvHoIXG3H8K1/74kUyy6oiHTNBPoswbY+vtgiZPcDOAb3NgmlTy2NStrt735SlFp0vDmwL9B67n+ZV0msfAwmflPAH5pPU34pbsTQCktXBj5QEWlszlX0slX2YZc9jqRgIvAnbLSZVzDp00C+wa4I+T0PRQlmFwDv8FA82tK9vhzneEhqFXqb0vRg9Nq1ew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nejW9fuR; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=shivangu@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nejW9fuR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=shivangu@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNDKZ54Hyz2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 01:29:38 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B51vjHg014375;
	Fri, 5 Dec 2025 14:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=/dXcxfSlF774i0xjufzkyQASJ8OfL3gMQTfDsWaya
	JE=; b=nejW9fuRXsE40wykHd24iIiggj0f2eIM9+Lck/SdkZSrRoVJEMe4iH7SP
	B8CX+F5D75nB2YIslef15/MtRLdCreNw4Nnly/DN04DCSbWzxoCK5d0zjZa6GHaz
	xFDpH+wFlWz+hD8wmwIlxiSOixnp5Bo+kK83l8iSATZXVlu5IhchvpWwpMHtKmvY
	ymHwQKF1h/Yv+jt+xIL1L5vli0l9qBN1JckWWQQ8qPDsj07eRYfFyae6gJkh7oKY
	2hI1jmOJoYTgNIc3g1hIuu7c9Cphyf+YdJvKJZ1OXCqItd7Whg1Uw9QZGExazOKT
	K0Vwi67pW33pfjkgyNSZihYKnTR1g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrh7e677-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 14:29:27 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B5EADig029789;
	Fri, 5 Dec 2025 14:29:27 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrh7e673-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 14:29:27 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B5C29Se003853;
	Fri, 5 Dec 2025 14:29:26 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ardck5f83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 14:29:26 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B5ETMuX26739088
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Dec 2025 14:29:22 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AEFB12004B;
	Fri,  5 Dec 2025 14:29:22 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9AC5D20040;
	Fri,  5 Dec 2025 14:29:19 +0000 (GMT)
Received: from shivang.com (unknown [9.39.16.183])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  5 Dec 2025 14:29:19 +0000 (GMT)
From: Shivang Upadhyay <shivangu@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Srikar Dronamraju <srikar@linux.ibm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        "Nysal Jan K.A." <nysal@linux.ibm.com>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Ritesh Harjani <ritesh.list@gmail.com>,
        Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: [PATCH] pseries/kexec: skip resetting CPUs added by firmware but not started by the kernel
Date: Fri,  5 Dec 2025 19:58:25 +0530
Message-ID: <20251205142825.44698-1-shivangu@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=dK+rWeZb c=1 sm=1 tr=0 ts=6932ec47 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8
 a=1UX6Do5GAAAA:8 a=3RTAq5kX-fAwh9RnVlgA:9 a=Et2XPkok5AAZYJIKzHr1:22
X-Proofpoint-GUID: zGd6o2ekTCGfSVNiy1j5dtWoNEsWi11v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAyMCBTYWx0ZWRfX5eSUDGdlFr58
 Qdv0kloc2k/vEWO3j+XJNxvti24Fvqb7XdrsO5xhwWeeORKs61PcVECtCN8fPgm8o4n3Mkt7WT3
 dgYCRvwd+W6J68/+C0xWMbj90YJaiFhg7ANtizEdDN9yUYTfeBUpg6oaznCVeDCmiKxnE71JYX0
 WniQ4kSjSk4hAT+Q+saglK56XHrflbsRlMHOLNNlV7XrWur1s0e4hCZaJezxxmJDiQhyNw+g17e
 wPtIfLyXWGQVa/AE9hn7kDfGYGm/yzQB7h/1g1AfJvx/GMYKODggyY2rxqW1cT57aXS51MNChoE
 Y3ExQyMfm21Qs+3sQizx7KWHfAUpOOXcKI9vvpirVG+UCZ1JuAYME55kC8ygPrKoqRo5gXc7Now
 pwu6BNf4KLi6ZjhvEYB6dnqGHtNzwA==
X-Proofpoint-ORIG-GUID: uXwQqtdSuqCqhOB0cXhCO8NEWpppFadK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 bulkscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511290020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

During DLPAR operations, The newly added CPUs will start in halted mode.
Kernel will then take sometime to initialize those cpu interally and
start them using "start-cpu" rtas call. However if a kexec-crash is
occurred in between this window (till the new cpu has been initialized),
The kexec nmi will try to reset all-other-cpus from the crashing cpu,
Which will lead to firmware starting the uninitialized cpus aswell. This
will lead to kdump kernel to hang during bringup.

Sample Log:
  [175993.028231][ T1502] NIP [00007fffb953f394] 0x7fffb953f394
  [175993.028314][ T1502] LR [00007fffb953f394] 0x7fffb953f394
  [175993.028390][ T1502] --- interrupt: 3000
  [    5.519483][    T1] Processor 0 is stuck.
  [   11.089481][    T1] Processor 1 is stuck.

To Fix this, Only issue the system-reset hcall to CPUs that have
actually been started by the kernel.

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Srikar Dronamraju <srikar@linux.ibm.com>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Nysal Jan K.A. <nysal@linux.ibm.com>
Cc: Vishal Chourasia <vishalc@linux.ibm.com>
Cc: Ritesh Harjani <ritesh.list@gmail.com>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Shivang Upadhyay <shivangu@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/smp.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
index db99725e752b..e5518cf71094 100644
--- a/arch/powerpc/platforms/pseries/smp.c
+++ b/arch/powerpc/platforms/pseries/smp.c
@@ -173,10 +173,24 @@ static void dbell_or_ic_cause_ipi(int cpu)
 
 static int pseries_cause_nmi_ipi(int cpu)
 {
-	int hwcpu;
+	int hwcpu, k;
 
 	if (cpu == NMI_IPI_ALL_OTHERS) {
-		hwcpu = H_SIGNAL_SYS_RESET_ALL_OTHERS;
+
+		for_each_present_cpu(k) {
+			if (k != smp_processor_id()) {
+				hwcpu = get_hard_smp_processor_id(k);
+
+				/* it is possible that cpu is present,
+				 * but not started yet
+				 */
+				if (paca_ptrs[hwcpu]->cpu_start == 1)
+					plpar_signal_sys_reset(hwcpu);
+			}
+		}
+
+		return 1;
+
 	} else {
 		if (cpu < 0) {
 			WARN_ONCE(true, "incorrect cpu parameter %d", cpu);
-- 
2.52.0


