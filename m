Return-Path: <linuxppc-dev+bounces-12000-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCED0B51F35
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 19:44:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMSjq6wZhz3dTZ;
	Thu, 11 Sep 2025 03:44:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757526255;
	cv=none; b=JL3ZFsz4nMLNaltJsLWmibN/Z6woxpJy2z4Iu+6z3mqzhQHT+ZjlB+xdSqz8XX8HxJB0/NaEyisE16IvGawGGlpo6m4cMqCXQILB3RSr5OELrhPw7g947H1jdVbJLxK4TPoC5NHKuJqwJFfzpTs4FrtUv1V0WrV9TgvjVBNAQ9YPXrRuQWmcJ5pkP90Twg+JgLgv+4swh43scA1t9zMGk4m+/GctzImTptlou6j+85p9KqsPfJUqevXyFVhM9vtiIjAo+qDwQP1DWUnkvi8s0TTHib0MH/BlU8KKkaxlQijlaa9n/KllGVLIzH8McKRvfvzuK8lDc6ShqN4y2NVMSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757526255; c=relaxed/relaxed;
	bh=peXeLJXWxKrxaOZS7BY2ZPsxENkfrJuyzcVdcfLDXwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pb/APD+3ZPia6NqxNptGixsfkL5K24KoSUPbaTtp8biOrzdljkTJXQs/w6iDZopUqi+6GBw1pG9ewCC9jmGumgKiLEqlGnxZzBc/nFkIx3q9mlysh73jHqpuR55Srg9e8nVyVuVYLnjSz+lbvHLezpeNfKFOfDCHkF/+dBk8kDb/enIzeJYkzAL450f0sm7lwQgb6ogOPYXFis/Bg3R2r/eSCW8R7Eu6qedA9O0Qks5ONDpxOKlDHVw0yU9cgpYRE3ZLOyJZ3ia0wuoLFvlaXWLkoFSao0+b0Xq8xTLNwOshY8F4rCJI9yBd24kXXp2aGhZClOKFTLzu3LdKE9puDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zz2v+say; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zz2v+say;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMSjq0NVLz3dSx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 03:44:14 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AFKl9u024098;
	Wed, 10 Sep 2025 17:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=peXeLJXWxKrxaOZS7
	BY2ZPsxENkfrJuyzcVdcfLDXwc=; b=Zz2v+say3q5YM7xEXzhOoAbYdGAZZEC+1
	RmH9tG1PL/UE0bzvM252uSt39i2WI91Ppkwl9Ynn+14eWPRA/JyCjXUO42TkUGCE
	ZwuT1uG8BwYLuoe+Zqh+NeHn2Tt+wD0BGZytZXOt/6Vh24pxE4F2FinlNu2vglQ8
	MuroLPPR+Tott3/axlBfK9y63A4zCc88BaMR4O2fHtd/SA9mTXi4hRRWxrm02zO4
	yvr+UNGWW5kxSjDPUzxIk9K/VPdkWLDO6zEzbhvhrEhOwiqYD2qyZwgiVJPLrnlp
	iQlcUExruYkCZde9xlrqpRkTDyGeLZT8icVRkKhBC+C3ds+U6DXyQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490acr7g15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 17:44:06 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58AHi5EO025532;
	Wed, 10 Sep 2025 17:44:05 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490acr7g12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 17:44:05 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58AG0at4011446;
	Wed, 10 Sep 2025 17:44:04 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 490y9uj02m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 17:44:04 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58AHi1hp51052910
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Sep 2025 17:44:01 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0C862004D;
	Wed, 10 Sep 2025 17:44:00 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D09DF20040;
	Wed, 10 Sep 2025 17:43:54 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.208.171])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 Sep 2025 17:43:54 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org
Cc: sshegde@linux.ibm.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        vineeth@bitbyteword.org, jgross@suse.com, pbonzini@redhat.com,
        seanjc@google.com
Subject: [RFC PATCH v3 04/10] sched/core: Dont allow to use CPU marked as paravirt
Date: Wed, 10 Sep 2025 23:12:04 +0530
Message-ID: <20250910174210.1969750-5-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910174210.1969750-1-sshegde@linux.ibm.com>
References: <20250910174210.1969750-1-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: OBLXkql8hx1WhZzBKbV5CV2vi8mOdkie
X-Authority-Analysis: v=2.4 cv=Mp1S63ae c=1 sm=1 tr=0 ts=68c1b8e6 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=uXBPIk7YWzXHA4pK:21 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8
 a=P8M16rivtmrVeddd8boA:9
X-Proofpoint-ORIG-GUID: v1625mvTieLv0K7jrC5ulkCE9e2nrFd_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX4tA+a7oT5KZT
 A/mrIFeUY6v8Wd8HBOCxxRktr2qgNDKTFJfaIzYseNbf834EiCUCMDHDeNsqeMXUMRgnZfa7qiE
 SOFHOZsI3OtvGqSuLUzBlxswNjO3JxhlAeGiylLTrCtK5R5T0hrNuQlvBiwaZePDNPCvBaRydQH
 bRPz/jFuO2GVOSeJHJUSfam/T4kC6DxCA/P4X1I0A09lxgopOHKHIjZ/StxmISY1FiHezmitA0K
 lEyK3H3a/QqtcZLBhRUCeQ7tOzHccV2ucMPiLM2Nxm6v+I2WN+ktDVHymbJovCIJLPm3zP58L+k
 EooVQmnB2U3KTKYs5maUTfGAJPxyKN1FwHgXz5Q0G/6MmxnTmfVh9YeGfDC6xZjltY5tZOBgPet
 FOqPne/s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060000
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Don't allow a paravirt CPU to be used while looking for a CPU to use.

Push task mechanism uses stopper thread which going to call
select_fallback_rq and use this mechanism to avoid picking a paravirt CPU.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 kernel/sched/core.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index b8a84e4691c8..279b0dd72b5e 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2462,8 +2462,13 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
 		return cpu_online(cpu);
 
 	/* Non kernel threads are not allowed during either online or offline. */
-	if (!(p->flags & PF_KTHREAD))
-		return cpu_active(cpu);
+	if (!(p->flags & PF_KTHREAD)) {
+		/* A user thread shouldn't be allowed on a paravirt cpu */
+		if (is_cpu_paravirt(cpu))
+			return false;
+		else
+			return cpu_active(cpu);
+	}
 
 	/* KTHREAD_IS_PER_CPU is always allowed. */
 	if (kthread_is_per_cpu(p))
@@ -2473,6 +2478,10 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
 	if (cpu_dying(cpu))
 		return false;
 
+	/* Non percpu kthreads should stay away from paravirt cpu*/
+	if (is_cpu_paravirt(cpu))
+		return false;
+
 	/* But are allowed during online. */
 	return cpu_online(cpu);
 }
-- 
2.47.3


