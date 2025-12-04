Return-Path: <linuxppc-dev+bounces-14614-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F396CA4D36
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 18:56:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMhyQ26Lgz2yDy;
	Fri, 05 Dec 2025 04:56:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764870974;
	cv=none; b=AgqNHr26Du8Kr8kYtOEp/hGCgu7Vyp/Chqdgnn5M9V6JqSGNfAdKygvq8Ld2G76M4awKqCQd2sxdL3S4q4sOp9HBqAZo+RF55wxQ30Cv5HF1QGDNBC34UqDbx0Sy1LvpnreBYij6xnbP6hE3kkAWsorXTlEtjA14FvNXGQbBeO5x9hvkQPCLQhrOoZksiNsbJz2DgRRT3bHKlWB0nuzNh7MgZF1LxTp96M8wJW/A5meTFk1RHJnoL90d3lQg62ZA/gjE2L1R3N2pLnL/ppLdOCPE5DEIR9ZJJ9yQnU580iZkjwzqQPD55pBk+SP5erCV1d7myEUwC079kgIFw86uCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764870974; c=relaxed/relaxed;
	bh=zfrg1rG5jDOEik4rUJgJKPizaKP9IuPevyT0ezbS4NA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJj1NdIg1fMvkPeg0cwwKZvnfWj51cdBgc8tf6x2UOcvaa5ergjnHvVmmt+HMbczNJ11tzp5FWvNgIsfShjKieB+Q0B/VuO4cJbmtnouY4LZWKx3ZLFifq0R8tkU2tq2YHsIY+uPBo/xfR/l4aRrMSG/QAtinJinoBa0oCmIqMSNXr/L7EznRo5tpc11yW7LIIO99IbhGrBE6+EJ7HSL4HW5t0SwiOwF1dA2f13/NQ5nJk09DNnEEiZlOs0MMcgp/jqAIoig6Hr9MnrIdvdFBmpidtOO/oJbcXm32OvTyuWXneQ1vwehmbQsrutvUqzP1v06Z3b7MgYCkufnqcr5cA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k7Rup/Oc; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k7Rup/Oc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMhyP4Bd6z2yDk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 04:56:13 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4FbwZK018535;
	Thu, 4 Dec 2025 17:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=zfrg1rG5jDOEik4rU
	JgJKPizaKP9IuPevyT0ezbS4NA=; b=k7Rup/Oc37X8e4ZDBHMl3e6oAvsJDDPop
	C6Yl8IGPHsCaytOEEPvMpOw1OpgtWVeuGd/RuUNhaXT5H9LL3vqJlntlSVN4CwNs
	w+PAVotty/fa+wgBCc7TM4g022bbNsVk/UWAfaC7QdBLMRIxyNXJe6hdAIGNj1rk
	uiWkvF29y5CBip1nPAZevgd4Gno0yOerJxDY5BTrpbRR9ZLlE+0gs7Tv0uHCsWX7
	y9HSlkg30kmmbDwAp5AeDHTwd0Qb/dBkgKPvKvH+Jzun4rQbQN74QfjWc0xxgOgq
	qLM8A4KGx/b3j7lDdmOb/i41rRJykOPIObhvyulqNVDDPqQXK5Vxw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqp8q9e4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:45 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B4Hk24A031925;
	Thu, 4 Dec 2025 17:55:44 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqp8q9e4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:44 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4GDWRn003891;
	Thu, 4 Dec 2025 17:55:43 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ardck0x4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:43 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B4Htemk48890148
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Dec 2025 17:55:40 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1068120043;
	Thu,  4 Dec 2025 17:55:40 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F80B20040;
	Thu,  4 Dec 2025 17:55:36 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.39.29.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Dec 2025 17:55:36 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Peter Zijlstra <peterz@infradead.org>
Cc: Ben Segall <bsegall@google.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Srikar Dronamraju <srikar@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Swapnil Sapkal <swapnil.sapkal@amd.com>,
        Thomas Huth <thuth@redhat.com>,
        Valentin Schneider <vschneid@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        virtualization@lists.linux.dev, Yicong Yang <yangyicong@hisilicon.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 07/17] sched/core: Set balance_callback only if CPU is dying
Date: Thu,  4 Dec 2025 23:23:55 +0530
Message-ID: <20251204175405.1511340-8-srikar@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251204175405.1511340-1-srikar@linux.ibm.com>
References: <20251204175405.1511340-1-srikar@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAwMCBTYWx0ZWRfX7hJNWLOXP0fe
 fK/CL+ZvpnG8hHCZ5yh4SryhATLuFhfljDRhCO96hf7tJFtpoH7Xn070n/Hzi6aRMU5V4QJJFwr
 vuo86ULF+n4OOQXC1lqSr56/fIfrE24iAEbYTjpyd/Q1vRmgwRC3GniYXgkCyAq9nl+0Ozxg7il
 MJuZZI9KqeFXCLCenD/f7C+ryC0hbAgFX4+2lLBiiTKwOdY2ZSxVR32JrC1MpvsJ1AGJKx4UkEN
 q0zwIMtNsHGnR984jlLGPp8iTz7l13wxfalvKeEzAxwrOowsVuEnk24LK3uc08lOA9DMTxzU+jx
 T9hTgZmpZgicw1BYCTKycaoPGxirHPAlhvAYEceDpW2Sf7AoUcc/jVv2miv1iUcbh4dhz7ei0r/
 ZzLdiELEhuJRR+lbYqmvnjLj0DLT3g==
X-Authority-Analysis: v=2.4 cv=dIerWeZb c=1 sm=1 tr=0 ts=6931cb21 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=JESwPpsbOM5vm_rGWyIA:9
X-Proofpoint-ORIG-GUID: 8uU_t1RZRCpbzH0RSd3zI_3XEKNDkQ3R
X-Proofpoint-GUID: g6N-ECgPD2VXnbLJPqWWFyz2k-qRoxJ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_04,2025-12-04_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511290000
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Scheduler is suppose to set balance_callback to push tasks out of a
dying CPU. However the current code, unilaterally sets the balance_cpu
and then checks if the CPU is indeed dying.

Remove this anomaly by setting balance_callback only after checking if
the CPU is about to die.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 kernel/sched/core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f754a60de848..89efff1e1ead 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8173,11 +8173,6 @@ static void balance_push(struct rq *rq)
 
 	lockdep_assert_rq_held(rq);
 
-	/*
-	 * Ensure the thing is persistent until balance_push_set(.on = false);
-	 */
-	rq->balance_callback = &balance_push_callback;
-
 	/*
 	 * Only active while going offline and when invoked on the outgoing
 	 * CPU.
@@ -8185,6 +8180,11 @@ static void balance_push(struct rq *rq)
 	if (!cpu_dying(rq->cpu) || rq != this_rq())
 		return;
 
+	/*
+	 * Ensure the thing is persistent until balance_push_set(.on = false);
+	 */
+	rq->balance_callback = &balance_push_callback;
+
 	/*
 	 * Both the cpu-hotplug and stop task are in this case and are
 	 * required to complete the hotplug process.
-- 
2.43.7


