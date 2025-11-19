Return-Path: <linuxppc-dev+bounces-14352-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DC9C6E8D9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 13:46:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBLn95s9Vz3dRB;
	Wed, 19 Nov 2025 23:45:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763556349;
	cv=none; b=nmkv+q2zVMedSZTAQIJqIXGiHusDiCiNpoPJc+QIXKnY6WFyi551mGO8gvu3qV+qzqkYe5KyR0/6J4lQbai+GkKuNQ/A313LY49CzJe8SHCnrzThRjWYtRY5p/HuRbYo4CT/bn9ccEXuzu1/xp5wQ1p2R4zRYleWSoVDUbyDKu3VO0e1SmqtKwNuqV3z5BfdqTDwZLIx4Yt4R5vnvC5YLulR5bg9An24BGPmLXj9OJ8IqPl3Evi1us6kYJ1hkTjo5Kghz+x9eqD1PVYf6vmmqC9dM7f7zqB9fx77EcuIqdDmRlNKrN9yrBJE2ACgShlmILGU3q2dHcRo7CwH3OR75g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763556349; c=relaxed/relaxed;
	bh=HxE5Y/NhETIWfkiAbVp/6cxgMGUkpgRZbFo/1XFKrpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GKtvbgfLrQyO4HFC1tzoI6H31bBuGlprR5c3/8uIEtgZUezSvRCb1BpkmAtsGgrwNcB6Z/1yPqZ3koO3AUKmooyIjgrHo2/AaHusQUiRzUv+HkF/O0/uWZPUqNoqywqsSLKdsnlA0OUN7cdK2L+YX+kg4+5VowTEpwpfhBxHq/XTAchwrcUIgCCcjO2kbhDGfrc6NuvzAZzEM+ID/hXA4o6Sk9TC+Jdbq8fZ9SQDbrw0UFNeZejXF4GJST2ZEc9yYnvMqwDFRnSQrEOXa3+YOwy5UdQg/agnQuvYQrAdSIN553vHyOumYA3jv2H/MReyUqDskIoC1V/cE8xY5nzbDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nRzUu16c; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nRzUu16c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBLn8665sz3c4y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 23:45:48 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ8uEuP012148;
	Wed, 19 Nov 2025 12:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=HxE5Y/NhETIWfkiAb
	Vp/6cxgMGUkpgRZbFo/1XFKrpI=; b=nRzUu16cD5XQPUody+rscj6Rf+z2Bm/a7
	q6GSTBTNgITsukgJ8h0Z4jbprRYvV7wKv41BG3FyoRAiZ03AW8/CrSa3q5IpO/g2
	8OMQMdLBVcmhGMymZK8LHHy0UQWaa/8RlN+ln1YZ9QHyt65Dr5cwPq811d4bKm6N
	QwXm9YLyuhvyk76GM5kn5YHPMai+PsxzqI8+YYaScGaKZmUIUhuP141lW9NYQZpZ
	l/EHIAEVCUOkAv7vGhZwWuaFM8IM//iRMIPJW2+FsjjEDslTGhChW4GiVQA+Mz0m
	V0AIi3Po0DEUOMHejkh2qjhmuAB70sXSg8FXZqJsKKLon6kC7UEkA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk1gf57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:21 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJCfK6t007731;
	Wed, 19 Nov 2025 12:45:21 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk1gf53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:21 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJBjYrV022370;
	Wed, 19 Nov 2025 12:45:19 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af4un0n20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:19 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJCjFbn14811644
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 12:45:16 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DED7320043;
	Wed, 19 Nov 2025 12:45:15 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 29FF820040;
	Wed, 19 Nov 2025 12:45:12 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 12:45:11 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 04/17] sched/debug: Remove unused schedstats
Date: Wed, 19 Nov 2025 18:14:36 +0530
Message-ID: <20251119124449.1149616-5-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=C/nkCAP+ c=1 sm=1 tr=0 ts=691dbbe1 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=NlpiSR-wqh4DhfsiYFIA:9
X-Proofpoint-GUID: GS15w3IsHKlPhS80nLJkMsiaDxnPHcCx
X-Proofpoint-ORIG-GUID: U4eK9f_QfEqz6Ymk2Egk1IWUhUWuDWqI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX9zALhofRGVy2
 aQN+SCevlFiT8233I8w9dXKXTFTJhxvl0b11/jkuXwbPzD1AKyrXzck9lVIOZrAIpBMPXW+T3fp
 9zuRDfx+8TcAx9FHx0z9X37tCeHeTE1rRDVzusgIsGESSOeoxu9KbxyVvTVL9RONAOhFSBBP1Ej
 YqthjfGnkhNawbq/+cMtvI44r/MDRAXR6HN/kxsz1vV7GSWcPfssMcCuvRP8f+vCctEtc+fz9bP
 S7CmDYA4yB7IXjVg7G8HxpGp9BRiFMOkYpX+rot5WWyEpw7UQiR6tyzFnV5IbAKcb5z6j/kV9Eg
 wnVDOCCzTuxnNvebpmrKv9cGqsKu2y6uDLKmcXgStiHIto6UZO/+sMaFsbiQRmHKZMFVK+amLr3
 gH0hTa9zwWaJ7ppcabmfLnlLeGkEQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

nr_migrations_cold, nr_wakeups_passive and nr_wakeups_idle are not
being updated anywhere. So remove them.

This will help to add couple more stats in the next patch without
bloating the size.

These are per process stats. So updating sched stats version isn't
necessary.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 include/linux/sched.h | 3 ---
 kernel/sched/debug.c  | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index bb436ee1942d..f802bfd7120f 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -545,7 +545,6 @@ struct sched_statistics {
 	s64				exec_max;
 	u64				slice_max;
 
-	u64				nr_migrations_cold;
 	u64				nr_failed_migrations_affine;
 	u64				nr_failed_migrations_running;
 	u64				nr_failed_migrations_hot;
@@ -558,8 +557,6 @@ struct sched_statistics {
 	u64				nr_wakeups_remote;
 	u64				nr_wakeups_affine;
 	u64				nr_wakeups_affine_attempts;
-	u64				nr_wakeups_passive;
-	u64				nr_wakeups_idle;
 
 #ifdef CONFIG_SCHED_CORE
 	u64				core_forceidle_sum;
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 41caa22e0680..2cb3ffc653df 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1182,7 +1182,6 @@ void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
 		P_SCHEDSTAT(wait_count);
 		PN_SCHEDSTAT(iowait_sum);
 		P_SCHEDSTAT(iowait_count);
-		P_SCHEDSTAT(nr_migrations_cold);
 		P_SCHEDSTAT(nr_failed_migrations_affine);
 		P_SCHEDSTAT(nr_failed_migrations_running);
 		P_SCHEDSTAT(nr_failed_migrations_hot);
@@ -1194,8 +1193,6 @@ void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
 		P_SCHEDSTAT(nr_wakeups_remote);
 		P_SCHEDSTAT(nr_wakeups_affine);
 		P_SCHEDSTAT(nr_wakeups_affine_attempts);
-		P_SCHEDSTAT(nr_wakeups_passive);
-		P_SCHEDSTAT(nr_wakeups_idle);
 
 		avg_atom = p->se.sum_exec_runtime;
 		if (nr_switches)
-- 
2.47.3


