Return-Path: <linuxppc-dev+bounces-14353-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C76CC6E8DF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 13:46:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBLnB2zdnz3dRl;
	Wed, 19 Nov 2025 23:45:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763556350;
	cv=none; b=H0RZ6ZpCHKPgM5UfpTMxcCLzqj89HipsshOQnL+dVCOTa9TQo6M1De57Y5Ka0mgTHes80qjMrroG7AJ7K3vDUf7Ta8TT/beXafK8f1dT8Hzss/9L406a0iAtq3ssIbrQtzQ5MMFiUf6Fm/ISx7NV952QRFPG6TeOB4B0q4WixtxrJsxru5/7tMHe77qh40/2QUb9UkseYOYpdW1dquu/b37WUibrWscKle2QKY+2R2tTGNDmkCstOv9I3647DBuUPxY9Iey8zTNnB9ntPxEf6GBJ5N5ZVNQ4K9mqItYmnr/tjKdwCQa/LcILgUJUv9fJu/FCRuGQpkmj6QzY3ZIDqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763556350; c=relaxed/relaxed;
	bh=e9PKSvTNtFv/4W4IXWXMrf1DJR2Kcd3CXGr8S+uJ/h0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GN1kw0c4/pkh6+vQF7ykWRiWWgEJDyWdK7Mny/Si1UkmnMa+VReOPualfbu0fRvhqG5SGP4HrKtdBJ1+qmDo95+EscJS4aThOkIH3+eDjoL1OGtS4Oe0CMk7kcn48n03INmoOiBTiQUli4vKnXvNar4IBr6FSiR4KDT6UmC9QzsbfIX//g4bQ/mBhhMAEyV01/jpxC/gLLoCTSTZ9kH135Df2SckFv0KMapv0gzVhcnrVCX7RSYWRrrPTQYqC8rqnyBMnzVqRJrC3dwqwdtZ0jU0XuPwOkID9ul86z3bl3iHstOyM4dimc9Fgb1TKeCOEd86mW0b06ftnsaITdr2pA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R3OdR8Os; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R3OdR8Os;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBLn94qFSz3c4l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 23:45:48 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ7b0Pg015871;
	Wed, 19 Nov 2025 12:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=e9PKSvTNtFv/4W4IX
	WXMrf1DJR2Kcd3CXGr8S+uJ/h0=; b=R3OdR8OsUUqiD2YfNpXBjCXTnmzt6nNh1
	n3ewi+fUqf+fMRTyYD7n/w3Xkbi/wAtrx4wZuozKtl07427thphcVAeACDl9FnaJ
	z6IByp6qY0ASr5WzhMrvnySzfm344vhvXR8k7nngb/7IoMGcvmXJCo3uuiRTPwv4
	LojOytpRuz1I4WnldoFil37QeKo+czPbn9fX7bbwB9hQY0sPi0lcCvevG8y1YlYk
	qCIYZM2I8TZ6lpU5ythYmb+MJ33h1VdcjIbLFtmcJ00epB4S+8actxUjiIIfogUu
	TmNfLCo1DwQWxLwXn+ycvbZtPgBkpdKi8Bf9cjcnmAs/B2VUizDOA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk1gf5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:26 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJCjPQW016888;
	Wed, 19 Nov 2025 12:45:25 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk1gf5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:25 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJBM8Ga022042;
	Wed, 19 Nov 2025 12:45:24 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af4un0n28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:24 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJCjK1r28442956
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 12:45:20 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5BF6B20043;
	Wed, 19 Nov 2025 12:45:20 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F44C20040;
	Wed, 19 Nov 2025 12:45:16 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 12:45:16 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 05/17] sched/fair: Add paravirt movements for proc sched file
Date: Wed, 19 Nov 2025 18:14:37 +0530
Message-ID: <20251119124449.1149616-6-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=C/nkCAP+ c=1 sm=1 tr=0 ts=691dbbe6 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=FUalwe2TsurscZgBbnMA:9
X-Proofpoint-GUID: gaWUoPw4S5KTptjxqjoaS2lWiB8Tx4uz
X-Proofpoint-ORIG-GUID: N_DZVbVWQSsFWy0hr8Cgb8L1Uvo87vgg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX7Bwj74U1hBc9
 TGDdDs6Dattv9XxEeKJOeeTRit/p/04ccUw7OGWtmBTzxz7q76iGT1bAhyMQgDnyzQdlJ6MfrSz
 i6+695XdTmDafUO9rcIHPEtwu1nKo/BJ1lncHsSkn+795EOQuvD0uS4STKhi4DpITFzn/Ibkk7a
 cQV6hyc8Ok5rgUadL0EBX0JoH2Dm3VVTFTExlklf10dMWUClWRnR3AytjanIqDumUg1Juk5mWku
 8dDZBqVCYxFhYLOyxTLIyhLRMCTwdzO9Wdnk05Br3M0Gcl1e5jScjD+Xg6W7rzIJkembayYk43g
 LoFRhY6UJRWY6P2ywov1OZVlCYKOxAzwrt6aVJJPMViIfcGAJ570rbgdH7evgp5xyjHj4cHwp65
 swvg3LKW5OAJI147CPWHUojbT5DEiA==
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


