Return-Path: <linuxppc-dev+bounces-14356-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D2EC6E8F1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 13:46:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBLnP1r4Mz3f6K;
	Wed, 19 Nov 2025 23:46:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763556361;
	cv=none; b=RyVlKGe+8HMW3z2ys6G99gGMOxr6ozM5nAAPKet7mYXzMpkdr3Y/KuPbhK8LmEC1EGBqm5SUU5qpGXAOAcRU0nWre9+hdYf/P/inNHhfXLIkM7Ln3gkKO2eC7Ku8U5PvTJzReSap6a+3VQ20EPWSvw0aXk1n0j62xySvIeHxQ7fZDZuNBouzYNZBSYpZSiIZ06nrrTi+EDhaXE1LufFGqtGe9HYyiCD5+9ADL2N03QfatRQ5HUYn8cLL0GCuMGG0jDANkqM4LtWK+iLPHqumYvsYS1QniVkZYsu3APhtdNAQBHKQC/3zwEC47v6mSNfB5JgQTpVKBBuUijG47IB94Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763556361; c=relaxed/relaxed;
	bh=mPIndhoKntrrXXiCDnHt7L0fUnUzEzKwQIeLPuD1cKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OhqgGzxltyfzdO/sJHV3c6Eh2PSM+JNnzm5qH8layC9QFnJcpbHiKzck8CSM1uqvRanOCx9jwOqpZRtVN1hmBrRQvTDOx0amjSzSn78uJFW6pwAgCw0P+mil14zmEc0uBFhE+n1qpUbBsxf5h6vqKTyPIrfhrypGq8FoA01vTAeSPb/xUnNxlFJoiYG7WGq4PyN3jhbMMDgStH+7No1sck7B7YTesjFoJd1g7vOLUV2J77uqqna3ojWYoMYz3DG7ddmG+fpK9wbpwLWEVcyucIb53e6Re0FNnAfwkIBRaoooV+o8a898ygFtMZFRrN3hwDFhA4OpbyUin6TgfErfuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Da/4q8np; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Da/4q8np;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBLnN2t6Hz3f3g
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 23:46:00 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ8xfGc025626;
	Wed, 19 Nov 2025 12:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=mPIndhoKntrrXXiCD
	nHt7L0fUnUzEzKwQIeLPuD1cKw=; b=Da/4q8npz1cxwKwfKJwfFlaH2k+HC4Da1
	M8V8UGSv5BTOJkhxqrUMuAYMHVgS7mihz2cild4Y/xk5zA0n5T+p3r1I8G4RAAWE
	43TRB0OKhAMqPBgy9DrqbY1kg/ZSRtVDQhFOnDp4VpGL7B5U+dTlI9J5mBkTc2rS
	zbvaMqpvkfBk8YPAL3eDORbYS6I8Y/z1hX25hKPnAcZlnsWG5p238zdNhY06xNoO
	Eb4CO8a1Igq2v30sumuHNuJ1IfLU/NVDAQVrhwDvLl5RyRMbQqXbY0cu2W+B/Yfc
	ot3Q7aErctUNp8YBdeO7uUZxS7/30Q4j/sMnM+/72v10GjrHRMnrw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejgwymbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:43 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJCeO9x021061;
	Wed, 19 Nov 2025 12:45:43 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejgwymbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:43 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJCgYZc017335;
	Wed, 19 Nov 2025 12:45:42 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af6j1rcdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:42 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJCjcBu53608830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 12:45:38 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8DC5F2004B;
	Wed, 19 Nov 2025 12:45:38 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B51D20040;
	Wed, 19 Nov 2025 12:45:34 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 12:45:34 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 09/17] sched/core: Add support for nohz_full CPUs
Date: Wed, 19 Nov 2025 18:14:41 +0530
Message-ID: <20251119124449.1149616-10-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119124449.1149616-1-sshegde@linux.ibm.com>
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: gEV9WUOGYNoPn8RAgcsHxvienCJu6HMn
X-Authority-Analysis: v=2.4 cv=YqwChoYX c=1 sm=1 tr=0 ts=691dbbf7 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=DM4i4QW9asp9I1uLgD8A:9
X-Proofpoint-ORIG-GUID: CSzAXauVsHcLvQOjvxnXp_n6NZ7uUj5Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX521ha1Tv2Lfg
 +yEUSRqod5e7az0B6hHeGgMiLj5lRGJl/cwqY5VTvbanvheKHkCrDueIJmCW7PbmzKMdeIWivb7
 gnlO29h+zSg5i5nkuJdvBhLycVpBijABWEO9WU7TesT/m7kXHdrT/EsD1fazrrGxVN3SrDtX8Cv
 RPAiweuTl5l/B2lf3+NJLnkqQFyDcR4ksgd8iRnLO6JoSIW7mjC6687cc9pmjkb1vTGoJPOsj5u
 29Myz/UKlKmCf5d2YH/nMFd78EGAMAjjRLIq3rlZO54z4e7AIDn/RrClqU+OAXTCwWd0Ae+N2Gh
 DHCSLT1EZihA0x0HmjaVQWl71cbwNo78GiIAQO4WC2MPqeyGcc6n0K4a/yg4i9x7TQP1m0/xYxz
 3OkalJS6JlQ8caJfqTHVcpDGfT+VDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Enable tick on nohz full CPU when it is marked as paravirt.
If there in no CFS/RT running there, disable the tick to save the power.

In addition to this, arch specific code which enables the paravirt CPU
should call, tick_nohz_dep_set_cpu with TICK_DEP_BIT_SCHED for moving
the task out of nohz_full CPU fast.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 kernel/sched/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 90fc04d84b74..73d1d49a3c72 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1336,6 +1336,10 @@ bool sched_can_stop_tick(struct rq *rq)
 {
 	int fifo_nr_running;
 
+	/* Keep the tick running until both RT and CFS are pushed out*/
+	if (cpu_paravirt(rq->cpu) && (rq->rt.rt_nr_running || rq->cfs.h_nr_queued))
+		return false;
+
 	/* Deadline tasks, even if single, need the tick */
 	if (rq->dl.dl_nr_running)
 		return false;
-- 
2.47.3


