Return-Path: <linuxppc-dev+bounces-9787-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D43AE8E33
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 21:12:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSBK02Ncrz30W9;
	Thu, 26 Jun 2025 05:12:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750878740;
	cv=none; b=eFG9Id6/4zkPfwfXSjLN6ltSOgRcej5171XVA4u3s0Q7ssGfaNWVYQn1iaGxPogsIY00Qxk1e2zrMg71q3PhddE+ZvrJ3VDt8gEg8GVzx/ond3g/5ityw/iNHKdbB1OX5Mt3djVG8AW1/oI+4WnyuPISHk+sJGoBlzXmPhsL096ZniFKNPOllQ1wS8cfpUcmeN4CjD01rhqaRll6bpVirontNigcIghwKVCsl5oN1ARLT78r2vboEZI1f9Hm8d8WJ4RciDXMX5ZFGn+HT2x4xY7oWG1OUqXspIyW4HQb5nYKQ8QwaFdKA0wa3fp88r6Qcp+G+j7xb1mAfA645JIhAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750878740; c=relaxed/relaxed;
	bh=Gg+BKnhQwKdK9OcNkLiWh4xXWVgQ9j+Jef5Ks83o6qo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ExDW2/Y9qlQxPRA6LOtz//aGYafn/Iq2xE48kKnt5cmuIgeTEKsgTVjhtKgVtrR96RtUS09Gzx0w5UASHCiCXJv8s5pvDMIeEf2YjYTfOuy26BpudfWMGUcxQhG4JApGLSHoiLwPDC7+dvsKUEEcsBmMtTi86m1ZPd28F5M/blxSzMXxQdkxm8N/uJEkzbrBU7tEkNMJ6tySuA/NSlNQm+F5+ZNi32pyn9UbKGH0tdLxqoga//PDe22kki/Etk5rE17oQ9TEKdzwbvYISuUiznIEhcYdPwkEkdPC92Ribf7/tIfdGJIREtdU61cgjgXm9ZvjsOIMEKYYBEvbfaYmDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YI2HwbLv; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YI2HwbLv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSBJz5V1Yz30Wn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 05:12:19 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PJ1kVw025791;
	Wed, 25 Jun 2025 19:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Gg+BKnhQwKdK9OcNk
	LiWh4xXWVgQ9j+Jef5Ks83o6qo=; b=YI2HwbLvfy/u8r1dTxFOW92OPi2nWsFHH
	YIkCNZ5aRDpvg1dW7xc5l3DSv9AO/kVDcA0RhabwG4cDKRVJ0G0ElRXfiy0qD13i
	HrSxI8TUBffrZKnYUXfGTEzfaBEtjvxHMlCDpdZ738lfMnB/O93lKppP8xEyLqGz
	ZnP8zzc887/NoQS5bI6yQDUD1dZC6kU7rwrKsY9yhnOFdU0MDFe76H2Y6jME1y38
	CgqffYcH55sLDARTSJOd8tqF5sd7p1KHFQ8AqSI+qxZUsxTO9uob/75SRMN7g4py
	UubVg0s2JG7ea0n3QEVm19IuyzhrmFgQWFXaE2eJl3QsATx+Zv8Ug==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47gpwhr27x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:11:50 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55PJAemw012006;
	Wed, 25 Jun 2025 19:11:49 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47gpwhr27n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:11:49 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55PH8aYD006329;
	Wed, 25 Jun 2025 19:11:48 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e82paxvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:11:48 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55PJBim456295884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 19:11:44 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E01D20043;
	Wed, 25 Jun 2025 19:11:44 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5FE120040;
	Wed, 25 Jun 2025 19:11:40 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.209.143])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jun 2025 19:11:40 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com
Cc: sshegde@linux.ibm.com, vschneid@redhat.com, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, kprateek.nayak@amd.com, huschle@linux.ibm.com,
        srikar@linux.ibm.com, linux-kernel@vger.kernel.org,
        christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org,
        gregkh@linuxfoundation.org
Subject: [RFC v2 4/9] sched/fair: Don't use CPU marked as avoid for wakeup and load balance
Date: Thu, 26 Jun 2025 00:41:03 +0530
Message-ID: <20250625191108.1646208-5-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250625191108.1646208-1-sshegde@linux.ibm.com>
References: <20250625191108.1646208-1-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: Bkm9rZTZ3Ey8h4d0sez8YChxm-xlEoG3
X-Proofpoint-ORIG-GUID: 7MZ_nsFenaS2xnJn_vxkGEUnLcWuDv4Y
X-Authority-Analysis: v=2.4 cv=dd+A3WXe c=1 sm=1 tr=0 ts=685c49f6 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=R63sIUGh8Hs7vTQp:21 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=5kU7IP4gcsCI17dftJ4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MSBTYWx0ZWRfX5hVljC8FRYal oX4WAk1oDGJK7Ne7imfLdzIwmJzQ1hZp8pDe4rLba1ph29HhU8lfB3QE45lHMY1k/XlaYGNHnOe 7w0Y9DpDMNsWahixdh8/VxzYXh4cwe2CVxpGMz9BRUDOMy5Lk8eAY7mDV636Xhw/E19i2CERTox
 8aACcIQzhRWuq48jRzRqzcPqoDiFwzHQ7ashyUsPq4hjMnFZHMohBPd6+DvXPfqMkgjuOzdyzYY 3WxsS2wdTCeRL29wOS9SSnL0DoY3+UezNcyVLlNbvsRwaCFwgaIA9dCoakD5mU2toymLota7Gig ZDhmrU8zWFm5DaurlxDun3oTo3Bovy04t9o4bidml3EPFQrZtAVxgFw+d8/PRMsYnTDhja6sNMt
 PcE+5uT+W0okks7peUD4MAmon/IQWZ+xSpPVvSQdrtIItyRg0Ojfms1TLF2r2NZ1VZSErAuk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxlogscore=812 priorityscore=1501 mlxscore=0 clxscore=1015 adultscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250141
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Load balancer shouldn't spread CFS tasks into a CPU marked as Avoid. 
Remove those CPUs from load balancing decisions. 

At wakeup, don't select a CPU marked as avoid. 

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
while tesing didn't see cpu being marked as avoid while new_cpu is. 
May need some more probing to see if even cpu can be. if so it could
lead to crash.  

 kernel/sched/fair.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7e2963efe800..406288aef535 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8546,7 +8546,12 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 	}
 	rcu_read_unlock();
 
-	return new_cpu;
+	/* Don't select a CPU marked as avoid for wakeup */
+	if (cpu_avoid(new_cpu))
+		return cpu;
+	else
+		return new_cpu;
+
 }
 
 /*
@@ -11662,6 +11667,9 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 
 	cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
 
+	/* Don't spread load into CPUs marked as avoid */
+	cpumask_andnot(cpus, cpus, cpu_avoid_mask);
+
 	schedstat_inc(sd->lb_count[idle]);
 
 redo:
-- 
2.43.0


