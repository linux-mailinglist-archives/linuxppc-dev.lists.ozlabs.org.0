Return-Path: <linuxppc-dev+bounces-6267-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F56EA381CC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 12:33:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxLBL4HpNz30TP;
	Mon, 17 Feb 2025 22:33:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739791994;
	cv=none; b=YQROVCJk1Va85e/SByjDmv7mmSF3+s2Kwo1jEOhKhsF9VcLHuv2+DLIGGt3sF7eITkCxvpa0+ZdBMPrgHKwyQAp/b9qNerTOZDiKB6ETZROvC4/cmMarUUXdgcpxZDBEuXKP/YZN+sEBctOKpbwCv/xtrXzKWufWIHmNiMjqwcFF+IL7jtQQNsmFYB9Jsfv/VmsJE7UwaUrbf3MAGr5OOM12md5jYsWhUnz0T9L9tv9a9DiPuta5cZej5YlnAiahBWKwfxrLhyXX6NB/gxGw2mL4Dv/NgR07IqOvaghuVHXyiSvMJ3eVNS5AOaic7IWS6MRKaqTpHAAX1GZR1cJVjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739791994; c=relaxed/relaxed;
	bh=jVVIeJ5VkPX8oItLInZFO2+0Tbbhku0v92QnOuHm2Z4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F+H7TYkiQYF5W1phg/zMdyuUURgpNBRH+KRWEFyQpaEe0ew01FADl+Silwwndyq0BMKZI54AymPD9nYyES4HjtWgV+9uug0nc6UZexOPckjDGEcK23CCfe5XZspe/tNhc5hp7HeBFZL7sL7EEfuyAvQkR1fCMpRtOArOJ+HWcs5bymisWC7SAy2S2CZGlItbwKiXo0fX8fg4Hikmio+1YkbwiXcDvA0skaUguMCHoNrptcmGVhvllZH9Oae+z8vpz3Zfe8pOnPiGnsQZ6yuAAjrC7zDGH/LpTQr/O6MdPNswn2cjpMpwIXXpGqKrGTXQ3uiRNa3eWMH1RDg0n0FVew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QhDGfgkm; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QhDGfgkm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxLBK6W4Yz3093
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 22:33:13 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H5O3Zo031269;
	Mon, 17 Feb 2025 11:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=jVVIeJ5VkPX8oItLI
	nZFO2+0Tbbhku0v92QnOuHm2Z4=; b=QhDGfgkmmpo6YPbMxe260vF0jC8SjkbFk
	7OoAaLnBT45/EOhTO3gakdgAdhEcdpOUU9C4wV4Tq2/XsMGNhqeFofDyaOfT2hG0
	hTMHG0XrM2qwYICafAt63m5hnRpd0TJfhWiN8/XPsztA76AZxe5IGM2VhGbSgXou
	bxt0P1wtvPqcsBMPiy2je0Cf8e/5/KW4D8qj0cXDUuoKo7ovYUX+536UWVOvwNrQ
	YVoB+O/FRgbcv35hBY5UuxtyvoiOYdeLXLlVhiklrky/ie70BX8y3X7j+TE0tKhF
	oQL+/KNqon9g19bxv4JYwB2IzW7hqP6WOUHk22xdBXQ+eCSCaTYTg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44uxx7sqq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 11:32:57 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51HBTCaj023718;
	Mon, 17 Feb 2025 11:32:56 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44uxx7sqq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 11:32:56 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51H87RnM001623;
	Mon, 17 Feb 2025 11:32:55 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44u5myny44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 11:32:55 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51HBWpPt56688902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Feb 2025 11:32:51 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7999E2004B;
	Mon, 17 Feb 2025 11:32:51 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8616820040;
	Mon, 17 Feb 2025 11:32:50 +0000 (GMT)
Received: from IBM-PW0CRK36.ibm.com (unknown [9.179.18.115])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Feb 2025 11:32:50 +0000 (GMT)
From: Tobias Huschle <huschle@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, sshegde@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Subject: [RFC PATCH v2 2/3] sched/fair: adapt scheduler group weight and capacity for parked CPUs
Date: Mon, 17 Feb 2025 12:32:51 +0100
Message-Id: <20250217113252.21796-3-huschle@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217113252.21796-1-huschle@linux.ibm.com>
References: <20250217113252.21796-1-huschle@linux.ibm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wUlm24ngoZROl3P4jmqRmdXwn1v2hLip
X-Proofpoint-ORIG-GUID: mbmYppk-WZXU2wR3kqbQZCkGm6A3GFbj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_05,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1011 suspectscore=0 mlxlogscore=732
 lowpriorityscore=0 malwarescore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170101
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Parked CPUs should not be considered to be available for computation.
This implies, that they should also not contribute to the overall weight
of scheduler groups, as a large group of parked CPUs should not attempt
to process any tasks, hence, a small group of non-parked CPUs should be
considered to have a larger weight.
The same consideration holds true for the CPU capacities of such groups.
A group of parked CPUs should not be considered to have any capacity.

Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
---
 kernel/sched/fair.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 5eb1a3113704..287c6648a41d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9913,6 +9913,8 @@ struct sg_lb_stats {
 	unsigned int sum_nr_running;		/* Nr of all tasks running in the group */
 	unsigned int sum_h_nr_running;		/* Nr of CFS tasks running in the group */
 	unsigned int sum_nr_parked;
+	unsigned int parked_cpus;
+	unsigned int parked_capacity;
 	unsigned int idle_cpus;                 /* Nr of idle CPUs         in the group */
 	unsigned int group_weight;
 	enum group_type group_type;
@@ -10369,6 +10371,8 @@ static inline void update_sg_lb_stats(struct lb_env *env,
 			*sg_overutilized = 1;
 
 		sgs->sum_nr_parked += arch_cpu_parked(i) * rq->cfs.h_nr_queued;
+		sgs->parked_capacity += arch_cpu_parked(i) * capacity_of(i);
+		sgs->parked_cpus += arch_cpu_parked(i);
 
 		/*
 		 * No need to call idle_cpu() if nr_running is not 0
@@ -10406,9 +10410,11 @@ static inline void update_sg_lb_stats(struct lb_env *env,
 		}
 	}
 
-	sgs->group_capacity = group->sgc->capacity;
+	sgs->group_capacity = group->sgc->capacity - sgs->parked_capacity;
+	if (!sgs->group_capacity)
+		sgs->group_capacity = 1;
 
-	sgs->group_weight = group->group_weight;
+	sgs->group_weight = group->group_weight - sgs->parked_cpus;
 
 	/* Check if dst CPU is idle and preferred to this group */
 	if (!local_group && env->idle && sgs->sum_h_nr_running &&
@@ -10692,6 +10698,8 @@ static inline void update_sg_wakeup_stats(struct sched_domain *sd,
 		sgs->sum_nr_running += nr_running;
 
 		sgs->sum_nr_parked += arch_cpu_parked(i) * rq->cfs.h_nr_queued;
+		sgs->parked_capacity += arch_cpu_parked(i) * capacity_of(i);
+		sgs->parked_cpus += arch_cpu_parked(i);
 
 		/*
 		 * No need to call idle_cpu_without() if nr_running is not 0
@@ -10707,9 +10715,11 @@ static inline void update_sg_wakeup_stats(struct sched_domain *sd,
 
 	}
 
-	sgs->group_capacity = group->sgc->capacity;
+	sgs->group_capacity = group->sgc->capacity - sgs->parked_capacity;
+	if (!sgs->group_capacity)
+		sgs->group_capacity = 1;
 
-	sgs->group_weight = group->group_weight;
+	sgs->group_weight = group->group_weight - sgs->parked_cpus;
 
 	sgs->group_type = group_classify(sd->imbalance_pct, group, sgs);
 
-- 
2.34.1


