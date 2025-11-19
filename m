Return-Path: <linuxppc-dev+bounces-14316-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F215C6CE46
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 07:22:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBBGV6P7Qz3bV6;
	Wed, 19 Nov 2025 17:22:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763533330;
	cv=none; b=OhzxF4HlQiFGscx5djx8hCml3UM0qoE5UnQ5UClXqM9IN0sePxMTTiNG6yatWR9w4vH/RA6SdJqk4TX/J+IAB+QrV9nAIp2VhP+0Paf6x5BGUwr5JABTdECey4fKsZsVXFN1L7UUnVyDvdyfIRB1PzKX8gq9JsMsqDbQlV7Y8R9FuZadzmKegJOjqJaY/Pzhk5JjvXmIsOE8fN2AJnZKD+fGhjBf3a5sGEcEsomyi7hB8smcb7d11WXQUW1N1JxkMsf/Qz/wVk9wCE5tVL6HBop4PhDuKHqw2SYgOBd6B323kErcReaNoTwATZ0VMcRQ/uCqauCceTL2C5mfGXlYRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763533330; c=relaxed/relaxed;
	bh=HxE5Y/NhETIWfkiAbVp/6cxgMGUkpgRZbFo/1XFKrpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YzsXYbUquRZuXN0rP6AE2gewMWQfVtdD3dtyHbSgdQXN6WxCfP6Gcjmt0oEekfojquscyESLIjmwY0/xQMxsjeHLnCV6TZ1aqXzl0lStcASeUg5L5AJq7RACVNFDkUaw0d0yJE/tYtF8x7fDd6TerWVcTJzWINgr5U7Foex6gZBgF8JPYeX2tMVU1GNZlgt1T2xIWc6CycbZUWjqC2X+LY4X73GzapLod7iBtSyYS/faAx8aVsuINYc792NYq6cN2M3PcjFHIhKstn/EutAO0Gin9bWUVz0hER8u8LhnoZIPDnWkzU8O054BLp9osly0Me7RMrtzr/RvjK0I3oPgFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O9rnRG2o; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O9rnRG2o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBBGV1hvSz30WT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 17:22:10 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIHvh0X031992;
	Wed, 19 Nov 2025 06:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=HxE5Y/NhETIWfkiAb
	Vp/6cxgMGUkpgRZbFo/1XFKrpI=; b=O9rnRG2oqR0MEpDbgDDZyhS9DzuqwUhtz
	UTeRi0SWJIAcL82tTv6etXSC8DQTrBbEwlH7I/qJ/MpGK87H2y1NOkPfO3eGQYGt
	PwJBMV5xAyUP0WYOfZAiBTLzGjKrdASnEyyozK123SwZdirVM0APpAsUlYa7qv7D
	ubdEkjoBxQ0B9XfStCS+Okl1kGNfQpJCwkYbWRnpRmG5mpVG+dSTzCjWsgbQYGQ5
	b+98z3wSnJDqSzTKM4eiHOmN8tkZKm0EoMLiUHDWIYsiUGUkgUT6r/686waISgf2
	xn+HDWuVIzFCmmONFjVxH5RYYqD3BV/qUpY47J//JyqJCoSCw4ozw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjw6wvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:21:52 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJ6Lqn8020438;
	Wed, 19 Nov 2025 06:21:52 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjw6wvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:21:52 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ2wDDS010506;
	Wed, 19 Nov 2025 06:21:51 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af3us7a2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:21:51 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJ6Lleo44761420
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 06:21:47 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7CBD920043;
	Wed, 19 Nov 2025 06:21:47 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C939520040;
	Wed, 19 Nov 2025 06:21:43 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 06:21:43 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [RFC PATCH v4 04/17] sched/debug: Remove unused schedstats
Date: Wed, 19 Nov 2025 11:50:47 +0530
Message-ID: <20251119062100.1112520-5-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=BanVE7t2 c=1 sm=1 tr=0 ts=691d6200 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=NlpiSR-wqh4DhfsiYFIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfXyYydiKowRA2Y
 WJ+aqAuO0Cczrjixcqgfx3jrPf5JLK2UawZZUMuN6LhOLyQvPls8/r5R3iyKfC9vlH1viu6tsYB
 oFhj/vaKHa9B2RVlzOpzAdj1S2xgzujhU4tMyJsJeGYVcdhk15XgY8rDOGqiQGquHW7SpInIoF5
 xYBXm1lFF4L3+xsTo+ofwL4gZG0+i5o+/X0qnwy8XdIoyQCR20dQOZAeXBo8yYMgtmDnafZjuVR
 hXNUmtQQc2PPcE6BnflaejiV/qTuz5+X6+fvx2ppFy7FidaXzdKuMRiLNiTL9U7w0+aJZ3LObMs
 w9gZDvCukf7Rqu9Niv6wbayPivxcvzsVnorPc7hahnl7FNGbtAJUcRrF/0AM6wcELd1q4kSdR+f
 zSFeCf9f3A6jVvaFRvIXle6QTz3QmQ==
X-Proofpoint-GUID: e1pABd5_XL_-Ev55HohzNj0pTZNwxkEL
X-Proofpoint-ORIG-GUID: i3juKjjVDsrhpdixpQkmTZeghyjWt6fX
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


