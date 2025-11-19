Return-Path: <linuxppc-dev+bounces-14314-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2698AC6CE3F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 07:22:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBBGS07Ssz30Vy;
	Wed, 19 Nov 2025 17:22:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763533327;
	cv=none; b=ihMtzUSYmVGBuTtdWTQ0besSUeAnfD3n6tNm5qojxW/4lD4Arczrfmy69y7oovqUET7ORxuhDYZWMQQXx6wVpKqgWaotjInRvvrwjTFkxJEKWiEQaOsZP1gXGdik04swWrBRlMC41s1dz/O4yayNdkPCUwIlxzIGNrmwOGyFoNerVdBPLYCB8dx2JTfLF67cxblqRpiWBEnNbQCGSavLAmldW+MktFU80asY6s1VjDmZlSriuYn0Tf7FGmC9Qa9rmnjFMmstf7i6SP4Desa6TDzjahVsdzJd+yCgYxAewQigfWDOGRkbNbnI0FmBHxEu9IJTzhFSgO/dub5ck1hxwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763533327; c=relaxed/relaxed;
	bh=TdgnQQqw3dse0Fr7rtbUgEkaeZgAUCl9B4/S5gvCyY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i3TyDKEi7bdYXn0a+jeQhKVK9opkomRhILmDiiGowD3exzuvz08JhTb8/7KJFoglbdvm1IMzY+atafqP5vxOBlYYy3fnrt6aSUC7HRsML4V6LVXkS3sDH9+J4sslxSZoRpOvVYBkMsrPHlKeHCtEk42wiBVFNXfk9QA9rd9unSNAqxTaPbzreZMgUbzhUv5yVzvVxi2Ro0tP7cPTp/SO6hIEHcefC7TLzdhdjgIUog3mkgu6se/SktaEWg0ksVnZb1tpSYWtJ1lj8Udk1XPglRpkt2sUH0Z3iauQ0U0bccEBOOzEyGnBm8961DTXqaXFwogU8JnQUuvhv6iaY4BE+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j/ECiUIX; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j/ECiUIX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBBGR1Phvz30V2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 17:22:06 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIGptgK025875;
	Wed, 19 Nov 2025 06:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=TdgnQQqw3dse0Fr7r
	tbUgEkaeZgAUCl9B4/S5gvCyY4=; b=j/ECiUIXMh5fpZM/U9L9Uk4/d5jK2mJ1l
	v3G+kdw+ufFmNgvrIDstrqws9VpWDQZSZhfg4aNJNsmbUI2Xe9GmZ222s0Zsa0Qb
	1c1PShgHu+WU5TzkYy9MDCIYO7ceTLsX2cqAT9VqoyZk9SZaJaGVAWaT5dcPqtMQ
	LFEERRwLRcOrCSmR4oYVFkPb2IhQisryveEODmcHrfVOOdEbRHFJGLWZV2IGn7q0
	BA4tiprwRuQXpNMgvvbFAZRyPxvW9ZaxoGPu9xpZgD4O/UU+jxYUZ102CjQLoImR
	BXCpKsLd2Rnz2GsgXTCDw7CYQ+rw1H+6xTmKZ7/EeIQ47WfjeOjPQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjtx545-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:21:48 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJ6LAki031375;
	Wed, 19 Nov 2025 06:21:48 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjtx542-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:21:48 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ3wTUu022340;
	Wed, 19 Nov 2025 06:21:47 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af4umy559-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:21:47 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJ6LhWV40173884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 06:21:43 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 654D020043;
	Wed, 19 Nov 2025 06:21:43 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D70320040;
	Wed, 19 Nov 2025 06:21:39 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 06:21:39 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [RFC PATCH v4 03/17] sched/core: Dont allow to use CPU marked as paravirt
Date: Wed, 19 Nov 2025 11:50:46 +0530
Message-ID: <20251119062100.1112520-4-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: RmD7JrXzjaEmULP8Wb7yKpvJTEVFNXuP
X-Proofpoint-ORIG-GUID: Yi_8-_bdtM2cdPdRlxASLrxMuM8z5HHX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX7sLczRLJaOz7
 eG75Ua8tzMMTeWsg4lhNEBo6CYOBm3E3p1vQ8P6AbSSRBf+JX9xDozJGzrpl7ynBUaOl8zgGp8h
 xSwzaFPp/KlBLKBd4VYSRyJHd49hjfd+3XLDt8aN7m9proYeIGhkmPHBP+I5w+r1rmk5ufVJaw8
 kZI8v/cFTT/cN3royXzhQH4W6fFB60XzCreKeadRfEUNbNe/do3DAvkVNSydtSFz+YOls37xQ6b
 m3nvX8DtOjqma62cCMQWrGBX2wWE9lI6LJfFiPu8Dt5uG3sCtd9Tew6+1gjPfl8PS+qv+Ft94fv
 K39JG4GPkYTEohQ9Hcv7kahjIutlr0gbDFw8C4O/L6R3k2dqN1B8SwqAXTV7V8EyiVg7wIX5OqZ
 QvkFWU0y+5gf6Y3oYMUJ5RyKibgUAw==
X-Authority-Analysis: v=2.4 cv=SvOdKfO0 c=1 sm=1 tr=0 ts=691d61fc cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=uXBPIk7YWzXHA4pK:21 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=P8M16rivtmrVeddd8boA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511150032
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
index 40db5e659994..90fc04d84b74 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2397,8 +2397,13 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
 		return cpu_online(cpu);
 
 	/* Non kernel threads are not allowed during either online or offline. */
-	if (!(p->flags & PF_KTHREAD))
-		return cpu_active(cpu);
+	if (!(p->flags & PF_KTHREAD)) {
+		/* A user thread shouldn't be allowed on a paravirt cpu */
+		if (cpu_paravirt(cpu))
+			return false;
+		else
+			return cpu_active(cpu);
+	}
 
 	/* KTHREAD_IS_PER_CPU is always allowed. */
 	if (kthread_is_per_cpu(p))
@@ -2408,6 +2413,10 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
 	if (cpu_dying(cpu))
 		return false;
 
+	/* Non percpu kthreads should stay away from paravirt cpu*/
+	if (cpu_paravirt(cpu))
+		return false;
+
 	/* But are allowed during online. */
 	return cpu_online(cpu);
 }
-- 
2.47.3


