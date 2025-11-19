Return-Path: <linuxppc-dev+bounces-14324-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0C2C6CE69
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 07:23:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBBHJ59b0z3c3D;
	Wed, 19 Nov 2025 17:22:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763533372;
	cv=none; b=lAKetpI4Ed8jNX337A/CuOQpKR88+R4s8MEGu70URnegIKKY3p7ePmCwex6IuGSToaVOfcBHwSh427QkZW/Gbf3hDEy0PdQ4Cx5sKVqfNFpYMojv45T9wvU5n9Eohy3feGXJ/mBlfB/EDxyovB2Uy8FqHjwWbPvKJZhkBWMIFwoO/ioUGKvj0EQ+dLzKJwlfRQAh08jHvvvLpTgw5NwXI8PT9RZJFfub9q8iTI+mVXo64a1N37iiTpUFC4u/5W9IwxmPJ/J+KZ0iStQVqdvyk2p4c6w9US7WTHyecn1yiqr2l67cpe+XQRauGDVWHpXKoVT+kLqEQjAXKg4uEiie2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763533372; c=relaxed/relaxed;
	bh=mPIndhoKntrrXXiCDnHt7L0fUnUzEzKwQIeLPuD1cKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bmwqe61UXGFhCl1B1CmuDj5ok1mpMmqJwdf0/rc4I/Qw4l4v84hdnWWb7lW2GfowMPM60KI4lyl25Zp4bhr3ilrRU9NeLQ7FVTYpDubtliH2anZxdpw43NQz52ySSeFtGht6mjI0ebOOl1tyJrmjmOZtB5HiSmjhWDdw7vBI2QwNuMhrK0UoNaAZ0NU1b4nSek08/OSCde6mpG87v4GhR77F8CYXPi6PdJPMNKDpLPZUzyG2qCI67UwVEaYgR4EFtXv9loZvy8e9dg77evCForCaBNsn+boDa2irWuXUP9KN74cB0zOQExcmIJqP5ZqleSZbGTCK6nfWfKBsUdSUHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JH8nSet3; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JH8nSet3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBBHH4KLRz3c1C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 17:22:51 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ6LmDw007805;
	Wed, 19 Nov 2025 06:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=mPIndhoKntrrXXiCD
	nHt7L0fUnUzEzKwQIeLPuD1cKw=; b=JH8nSet3VtHlAKujcJ/SfqIQq4JGgBuiz
	2kuTpJx3LakW7nOnf1ao0aKvTkd+lVFeoqbwlAZ50fwe/goDgwQBLaTxh3H3Pcb+
	1sCUULjP1wE3ze1soTOhINxGm3CchCvJswm7Ohi+rRKacbCtUp6f/2BjQV9ollJA
	ybZoOkOv9RUeyRphaSixqwdXHA42fkRD2ys4anPx7bP+MiyzR4wfQtQqGZJFv08t
	DCpQ94jHf88n1g6oKd9lHGBDwAsNl2wNCUcRtz0DONk6q2sMmN5emruNmSPthHom
	BGt8Fguc7ZeuICZaCFzvJrW5ummWerDd1i7fKS/W7b79jpj9ch/NQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjw6wwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:15 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJ6Fv4C010056;
	Wed, 19 Nov 2025 06:22:15 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjw6wwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:15 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ3wTV3022340;
	Wed, 19 Nov 2025 06:22:13 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af4umy570-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:13 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJ6M9si57409976
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 06:22:09 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE0B420043;
	Wed, 19 Nov 2025 06:22:09 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B37D420040;
	Wed, 19 Nov 2025 06:22:05 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 06:22:05 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [RFC PATCH v4 09/17] sched/core: Add support for nohz_full CPUs
Date: Wed, 19 Nov 2025 11:50:52 +0530
Message-ID: <20251119062100.1112520-10-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=BanVE7t2 c=1 sm=1 tr=0 ts=691d6217 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=DM4i4QW9asp9I1uLgD8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX8VMFvkPrCIMI
 0uPJcmeOr9Nz/XpSqSq+64SXAFgBte4bPY0TqKj/yf1wRzhiVCA7ApbhugWyYEvnCze7J+zXmYj
 jjsqakW2UKkTh0jz1ElPxPdy8vYyNKhROoYV1WfQXXhIDXIksOeRW7QW11Ar+0Abq2DpysAwNME
 /eB4ph9li9B8IBJz9RIPlJkufe6uKzQ+y8/BLIq4GFhMdxObUV9K1l8haSbc/yypgUS98gXoAwG
 Bx0gxW0VHGMNdJpJ1Udwazhx2g5IiuvTglC+TdzSZNhR3Yo42JFL4tvNlo1xqx1zPk4keTLcOnt
 KghsC0azw+QPP7SgllN/8g4EAhpapZRh17PcSJYQT33Q/DqrupRlgQNbQkQZfpybgwZbTG1hvqD
 sSVPij/tQ+ZWXYVHc7JTsRy2sucL7w==
X-Proofpoint-GUID: dikItsmFJ4EfMSWtvUdL1bu6bVrIG1s6
X-Proofpoint-ORIG-GUID: NC7Z9lcvnA_7TrhfMM9Uk2o5PBwFvCr4
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


