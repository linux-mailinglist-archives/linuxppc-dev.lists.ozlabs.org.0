Return-Path: <linuxppc-dev+bounces-14315-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCDBC6CE42
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 07:22:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBBGS6s5Sz3bVW;
	Wed, 19 Nov 2025 17:22:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763533328;
	cv=none; b=XXhnu0FMZr3q1/7dsyV3Lr6mP5nBoImZwV3t/ftYGhGOuVKfKfp8DPd2sAxK7aryRGzs2ZhO5xS5mtIPAfW66UdAbMxXiFhb9FMpM698rZdED43G6VdFRdmOaxH0iX3yNltbujFC3iVZQhBrLuo/R2q8Xw15VzhugGctKTilBSvvLndC+LNC//NAbhtVG1BVJTl88EB0ZpTfSZS9LJFink1P0J6n1MtDyIiIP6qpWxOVTvtJRlyQMxyzrxS3/FUonAMcO4jy7O/ysx+Ea4S7RUENl6Q2iFTkZLvdV72Z9ZE0hEBRuQJFBNvdF/Ppo39kmxwmrn/rbR+80fwZcQTCCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763533328; c=relaxed/relaxed;
	bh=SsxUtQuljbB31H4Vb1A8/PH/i69O3OULsuRsxx0vaAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mtkfbUMP7C4UTzRxdZ8RcCUbypYYkCg+3xYIehki2NUCMbF0DH6lNxnFtsOAYiewzg6O+4xFtB5omT04VmGSCrpr9cfLA0eZePgzBo8u0162ePNhm9balk+QMsCeCsU82aLjHJCZjF/RgTyuk5/xXSX7ZhswYlFvbX9H9S3wpyDV8ilQj1IbbzDqnOJXd64TG3vKIS92VJlBLTg+94re7QP5VMdQX2xrRrk99EL9RmsNz4jRDAFonsfsGYHlBMbv27leDiLEPAWFPmqlGh423wFqPzuo0c4Qhx0bwodsjxj+JsCLZVWm9d66ccBKoaHDtIKQ7yUrEerD0av2zCdgWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mjZ4V/IE; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mjZ4V/IE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBBGS1hzRz30WT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 17:22:08 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIHUbnK011607;
	Wed, 19 Nov 2025 06:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=SsxUtQuljbB31H4Vb
	1A8/PH/i69O3OULsuRsxx0vaAs=; b=mjZ4V/IE7n7zNX/uOrIWHQXWUSNUzw1Fn
	ic3Aym9Y+kpx/05GqQTl/f1ibztgKp+jpiZ5nS3/JqJDOlZ2gmNnzkZ5Dgo6Tc1A
	LNwhMt5PShcJkAQltzsq7jgyW8W1iwzSxL7bDsBvblFB/EQf0QnFvWO6DsslE6K9
	rzvXoQnnUymcADvWWeO/9E8Xqx/+Y1WFCWmcDjROT/TaDJI0mjd1sUJtQvGgO704
	HOImehvdofhUaMQHx/xoN3hzAGQvgBD/y+9hUpq2fVJy4OQWw2iP5fH/qGmwShEf
	G5ub6yHgshfNqFJbbrkn9OXhu/2uOs0+hjKWUs47F/mnkLB3edN0Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk1ewa2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:21:44 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJ6EI6D008689;
	Wed, 19 Nov 2025 06:21:44 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk1ew9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:21:43 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ4IvwI006959;
	Wed, 19 Nov 2025 06:21:42 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af62jexs7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:21:42 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJ6Ld8R59900380
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 06:21:39 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3570B20043;
	Wed, 19 Nov 2025 06:21:39 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4EF1420040;
	Wed, 19 Nov 2025 06:21:35 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 06:21:35 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [RFC PATCH v4 02/17] cpumask: Introduce cpu_paravirt_mask
Date: Wed, 19 Nov 2025 11:50:45 +0530
Message-ID: <20251119062100.1112520-3-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=C/nkCAP+ c=1 sm=1 tr=0 ts=691d61f8 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=PotXWsJoChvkt9Z01ZEA:9
X-Proofpoint-GUID: SeUl8-wKJs6eo51LYYd04r9hwVjjx5Vn
X-Proofpoint-ORIG-GUID: EHBrfSJ6VLeGaRXmrCmU7qeCGo-A_gSy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfXwzLq0WQrfmww
 T7vwK5CXfKEbtqpXSxzfndKzW4FABy4G8W4cWkqKGuJvrQnm/lNOtOzWmN5bSXLBDTs16dq+a2z
 B6f2Nd/70CcgTj8ncEUaX22dItJN2+2J6E3XMDB2ACeGZtbSLYFKCrRTqWtGMRpHnOMKnV2ezmG
 ADNKL4OCG9iUwz0ozpo/C8+pclFRffnGwegiVsYb15rrmB/HXJlYDLd9H4e8FgGEWu+b2bwzxM6
 /4aPK+sI7p6gdaZlIqBJz9FPPF36sjKtLHtgbI3ovZzlybQ5dGxAEiSNTMQlsm5pbrEJ+6Cv3gm
 rbn/jSOUSPYIasp0JANwjJ6Cx/KsK/xLuTpbDF9UQWZId/H+oR7eESDN8iOmmBh8L1T/jr2LtEy
 FwGqgnAzGo0ZQMLIoMKHjDUR2R4/Hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This patch does
- Declare and Define cpu_paravirt_mask.
- Get/Set helpers for it.

Values are set by arch code and consumed by the scheduler.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 include/linux/cpumask.h | 20 ++++++++++++++++++++
 kernel/sched/core.c     |  5 +++++
 2 files changed, 25 insertions(+)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index ff8f41ab7ce6..079903851341 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -1270,6 +1270,26 @@ static __always_inline bool cpu_dying(unsigned int cpu)
 
 #endif /* NR_CPUS > 1 */
 
+/*
+ * All related wrappers kept together to avoid too many ifdefs
+ * See Documentation/scheduler/sched-arch.rst for details
+ */
+#ifdef CONFIG_PARAVIRT
+extern struct cpumask __cpu_paravirt_mask;
+#define cpu_paravirt_mask    ((const struct cpumask *)&__cpu_paravirt_mask)
+#define set_cpu_paravirt(cpu, paravirt) assign_cpu((cpu), &__cpu_paravirt_mask, (paravirt))
+
+static __always_inline bool cpu_paravirt(unsigned int cpu)
+{
+	return cpumask_test_cpu(cpu, cpu_paravirt_mask);
+}
+#else
+static __always_inline bool cpu_paravirt(unsigned int cpu)
+{
+	return false;
+}
+#endif
+
 #define cpu_is_offline(cpu)	unlikely(!cpu_online(cpu))
 
 #if NR_CPUS <= BITS_PER_LONG
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 9f10cfbdc228..40db5e659994 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -10852,3 +10852,8 @@ void sched_change_end(struct sched_change_ctx *ctx)
 		p->sched_class->prio_changed(rq, p, ctx->prio);
 	}
 }
+
+#ifdef CONFIG_PARAVIRT
+struct cpumask __cpu_paravirt_mask __read_mostly;
+EXPORT_SYMBOL(__cpu_paravirt_mask);
+#endif
-- 
2.47.3


