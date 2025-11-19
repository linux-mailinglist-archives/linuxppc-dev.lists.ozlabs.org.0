Return-Path: <linuxppc-dev+bounces-14317-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB29C6CE4B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 07:22:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBBGh1ZHvz3bkP;
	Wed, 19 Nov 2025 17:22:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763533340;
	cv=none; b=iGHQ0oA/M4R/PXi5pvmAnoHo0S7WfnYw2pgkhbjziJjuR6NgC2rpfgUHYCEy95FgckcyTcKG/tvoU+s8W8dfHve8d9C6+n2a1eiU2f5HvTinu//2by48U2+7yHfqXEg/RLrnB2AKmCVzXoLmWXYFKudODAxoLwjMd4IeYeH12Cb0LX8NKX4xji6NJWA+XO7GblKTjqgiA/1k0PSaHRllJRs8CaTiqmmTM4hdHarE5+FRAjuLleSk9EYQEFmWJb6QgPmPx5kUgVH43CWbRAg5ZRuHggxpLGyNVG+6jcCnLFIiatyctO/KwuYp0htVKYE1USPwLCAoDdNIpXDE7al8Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763533340; c=relaxed/relaxed;
	bh=e9PKSvTNtFv/4W4IXWXMrf1DJR2Kcd3CXGr8S+uJ/h0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fB4jI9quWidbeL2npybuJe5DrPt5dsL6aJKo7hhkGvY560Xp3Y3OjvqcMhZbHiIDZ86qPhYnjUWmpdkgKTSWL8Jn2gZSxA9c0mFb0K7I5Sg1vq1LP4DPh1MHqVjRNayoAdLl2hoOKsnHB6YDpfcsr8puUFVnjyvdZrhmuB2fvWjBoKvPTpThNy9MtbrcGq6yWJolCh/m05HObHlAr+A6o4+ta8riZxXNj+ePBHQjfd9Nkj91OmEYS4uolGEdq8ztyIV9u8UhvDz4QhKhRr0N9mUwNasZRyhcoXoaxwTrOS3BbCXvMACRoBwEvI1bYJFF+I+LoP5tU8iUHMzb7iY/tw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WDEAbbFL; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WDEAbbFL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBBGg3GLPz2yv4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 17:22:19 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ5bQxw024130;
	Wed, 19 Nov 2025 06:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=e9PKSvTNtFv/4W4IX
	WXMrf1DJR2Kcd3CXGr8S+uJ/h0=; b=WDEAbbFL0hlm5NVgIyLRG3f+LRkVPwJdd
	NrQGwaqGH2hHWZQVCZ9g11h7yn3+ppeSLNa9M9wa7jijCL8sBXUAR/AzK0b5TIet
	KiyVVW8Ejg8o3mB/A7SNkvD/CFCo1U0UMc29PuuAHBFX1H4H9o55/nAJzg7WSBKB
	kaO07dhQO/t7Do80MwG79D3jbTc4C8bECITb2pIvtYgipMvnclr1sv3uQt8Hv0eg
	wsG1LFq3QBEdlwBtTjtQlFyyQkCRrE2obNS6AO3ody6z5573Cn+wmTDzwp76i9sH
	TRJehgIuhAR70yeaX9MPyswMmuzkrtPkYRru0oZXbUYLpo0y+OSNA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjw6wvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:21:58 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJ6Fv4A010056;
	Wed, 19 Nov 2025 06:21:57 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjw6wvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:21:57 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ2gKeg030795;
	Wed, 19 Nov 2025 06:21:56 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af47xy91r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:21:56 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJ6LqG437093744
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 06:21:52 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0B1D20043;
	Wed, 19 Nov 2025 06:21:51 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D530720040;
	Wed, 19 Nov 2025 06:21:47 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 06:21:47 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [RFC PATCH v5 05/17] sched/fair: Add paravirt movements for proc sched file
Date: Wed, 19 Nov 2025 11:50:48 +0530
Message-ID: <20251119062100.1112520-6-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119062100.1112520-1-sshegde@linux.ibm.com>
References: <20251119062100.1112520-1-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=BanVE7t2 c=1 sm=1 tr=0 ts=691d6206 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=FUalwe2TsurscZgBbnMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX91UN5RttMkkp
 /XzJ+7la8N/oYQ7bU9+BGc2NhHV+kL32Gea9KiiMU+fI7a1gmD2vLKUlrvReJ4t8wr4hRG9mZNp
 0hTl9jLjgsjeJhJf9ijTJTKszEORqPJCaYSSii+tKcLrDfwUHPH3i8j5hOCDL/3gj04lHDMKnrW
 q2Wv9EL2PYt/s11zg3C5amanpG/E6Xcl7o+F/0jFVa5K6tCujYUMu52cw78JIWA8UWA8AWWLXRv
 mHTYZFJrpqo+Vv0hMIV+k20lRR2ly77+THMNI1v75D62Zbcs9ztMpmpH+hZbgi6J5ltXlq6xfiI
 la3pPeooce0s16Ef1jHLEmTFWsbIeVVRE/YtHQRdfe7pimFMcO+WduSgoS9Dmva8SqOOyDnMlF9
 RFFbcr6pUrfLlqXHEWyQ780SeGrNxw==
X-Proofpoint-GUID: p6OYQWJiFNLTUBPRey6gEE_hJZqIZhQc
X-Proofpoint-ORIG-GUID: OK4vDiV017q_gMd_SrLynpxpWy29KVUF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add couple of new stats.
- nr_migrations_paravirt: number of migrations due to current task being
  moved out of paravirt CPU.

- nr_wakeups_paravirt - number of wakeups where previous CPU was marked
  as paravirt and hence task is being woken up on current CPU.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 include/linux/sched.h | 2 ++
 kernel/sched/debug.c  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index f802bfd7120f..3628edd1468b 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -549,6 +549,7 @@ struct sched_statistics {
 	u64				nr_failed_migrations_running;
 	u64				nr_failed_migrations_hot;
 	u64				nr_forced_migrations;
+	u64				nr_migrations_paravirt;
 
 	u64				nr_wakeups;
 	u64				nr_wakeups_sync;
@@ -557,6 +558,7 @@ struct sched_statistics {
 	u64				nr_wakeups_remote;
 	u64				nr_wakeups_affine;
 	u64				nr_wakeups_affine_attempts;
+	u64				nr_wakeups_paravirt;
 
 #ifdef CONFIG_SCHED_CORE
 	u64				core_forceidle_sum;
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 2cb3ffc653df..0e7d08514148 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1186,6 +1186,7 @@ void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
 		P_SCHEDSTAT(nr_failed_migrations_running);
 		P_SCHEDSTAT(nr_failed_migrations_hot);
 		P_SCHEDSTAT(nr_forced_migrations);
+		P_SCHEDSTAT(nr_migrations_paravirt);
 		P_SCHEDSTAT(nr_wakeups);
 		P_SCHEDSTAT(nr_wakeups_sync);
 		P_SCHEDSTAT(nr_wakeups_migrate);
@@ -1193,6 +1194,7 @@ void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
 		P_SCHEDSTAT(nr_wakeups_remote);
 		P_SCHEDSTAT(nr_wakeups_affine);
 		P_SCHEDSTAT(nr_wakeups_affine_attempts);
+		P_SCHEDSTAT(nr_wakeups_paravirt);
 
 		avg_atom = p->se.sum_exec_runtime;
 		if (nr_switches)
-- 
2.47.3


