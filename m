Return-Path: <linuxppc-dev+bounces-9785-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 847C7AE8E30
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 21:12:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSBJz0YnRz30WF;
	Thu, 26 Jun 2025 05:12:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750878739;
	cv=none; b=mBR8iXnji/vDIMhTPbhys5+b1H0thzjeNXP2r6hKCrXBiqR/IdKZ9c9wmFA6pU9SXoyraI0jyVvKBLoBYGBcjXSx2FwKOxHyAeLKisuVCYvuErZPjogxnl/xdPbIDpXgDhe6XIke13BBKmgRLe6x5pL1qkv5fJuXS9kUUMeJRx1DZwtATnAEB8PgSeWTkx0tK0ANTeOxg6VQqGWKnQzUhXekhP45oVnOkYNit/JVz0dZ5HiFmzVzUlH68UKa/BnTCY0yRdUNI9pncwByN8ZnlAUcpUsCoHGZ/D7oF84z7/0c/rDeitLYZX9M+Dnp0XOAUUwMVOghs4q+19+9XHejCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750878739; c=relaxed/relaxed;
	bh=/GevdFafxZDniLwlHnCARb10pjrPzgSvfvkI8K5DQQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jjMJxjkbegq+UWt61PtpAt93FSvQuysuvjh/2xPLJ3cLmCzQJhYCeX7LDrlaiO/DD1EeL1f+UsPjiSjyf0JFD8QrkJhHMwysuA/yG2QUThzyLWVsTelNQS2Yfsnp4y1OMtbixb/5Zj+8YSEF0xkZgjjqDBYhc7QDjCV0czs/zaDiifVY9ovusOM3PCeWVO4gpfld10Sz0rUyJxWubHKAs5CzY3MZhfCTvXua+Uys+CkMHqEg/dRWnkc/YXi8zx6j4b8+a3lgNxlHCgJIWVD+hHuW5Qri4Wytlyv71RCIXEwIaAWNGW3IFv0l2d5hUbYMjxfpGAsFYKxE3y9TMF0mHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZSFCpL+O; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZSFCpL+O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSBJy2jtdz30KY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 05:12:18 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PErWHE001710;
	Wed, 25 Jun 2025 19:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=/GevdFafxZDniLwlH
	nCARb10pjrPzgSvfvkI8K5DQQE=; b=ZSFCpL+O3NB8TlPWvYaiExFzSXRvL/GOu
	XQXCRIVUAFMfyZBP9VMTCpSs1euCb4jrOvL+q7jGpOAVvJ0bvcmQBWbClzDFWDWC
	imX3jE34SkJwnaja//LyT/24beKLuc5OecupdJZplqp796aK1eBlYvqugC27s87C
	OwSJf65eKW95uFrTVmIOeaDpvZlJDqOenIDXimj0iHz8Xk7IGLrdKGqwdPkauw+Z
	cvafN3bsHYQe0i1xRNG4/Sp1oi5TkQQzIftiJ5Wfi5pqQCVR97iLrk5m6dTzADcu
	VTtC2Xp0Jb0BnxOEhrACO0qe5Y6qPHm1RwWD8Oq72FCThTYH79p0Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dm8jhhdt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:11:46 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55PJBjC1023187;
	Wed, 25 Jun 2025 19:11:45 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dm8jhhdp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:11:45 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55PGctD6006400;
	Wed, 25 Jun 2025 19:11:44 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e82paxvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:11:44 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55PJBeE129622794
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 19:11:40 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E4E32004B;
	Wed, 25 Jun 2025 19:11:40 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5ED8D20040;
	Wed, 25 Jun 2025 19:11:36 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.209.143])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jun 2025 19:11:36 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com
Cc: sshegde@linux.ibm.com, vschneid@redhat.com, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, kprateek.nayak@amd.com, huschle@linux.ibm.com,
        srikar@linux.ibm.com, linux-kernel@vger.kernel.org,
        christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org,
        gregkh@linuxfoundation.org
Subject: [RFC v2 3/9] sched/core: Dont allow to use CPU marked as avoid
Date: Thu, 26 Jun 2025 00:41:02 +0530
Message-ID: <20250625191108.1646208-4-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250625191108.1646208-1-sshegde@linux.ibm.com>
References: <20250625191108.1646208-1-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MSBTYWx0ZWRfX+9zz7S7zt8OY PYmAGu7oleBftnpgl1i7AurTlVXy4W11lCiBLWFo4ew7+cfj1xO3Joh6hRn2rbHGLFHnKbJNDnc PjPrCoVS6Ueld9p8q5Fsd5tfAQWquCxXxdR6j/t8Wo7sEg5BcgSKUN1jfUBT1RAP4fFhICUz0Mt
 8vlp4s4v7aAawsUWCtXPwawSHIaDlp7SZ6obR0XFW4qr7HoiFjw1zkvXjHGPq6ytbGDFyd9m8wH 51yDEzPbLRnec8b7fLx11eYKExYftxo/JB2i4OeOaZw4uzGV6g7LPGOjMuRkXn7jC2n0P3zKgth 1E02DARsEsT48RZ3+Of52BLmvNidixjbt8mGRXePvCYwcyVEYnnJqycJyK0mdUqFBzEryr/X512
 So+b4R9aFjCaFNGY2VcfEiNYkRK7TBYjMgfLUaCfjb3++VgH2pJUrqUKIIEf0Blhg8XU8Usg
X-Proofpoint-GUID: MRni0sA2uOHcIMTzZDYYwKh2R39SA0EW
X-Proofpoint-ORIG-GUID: DY4JTPV7yGNFAd5UB6MhFXIPQqQUPWgt
X-Authority-Analysis: v=2.4 cv=combk04i c=1 sm=1 tr=0 ts=685c49f2 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=uXBPIk7YWzXHA4pK:21 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=9VCDzUkOGS52xXVBuocA:9 a=zZCYzV9kfG8A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=656 clxscore=1015
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250141
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Don't allow the CPU marked as avoid. This is used when task is pushed out
of a CPU marked as avoid in select_fallback_rq

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 kernel/sched/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 0e3a00e2a2cc..13e44d7a0b90 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2437,6 +2437,10 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
 	if (cpu_dying(cpu))
 		return false;
 
+	/* CPU marked as avoid, shouldn't chosen to run any task*/
+	if (cpu_avoid(cpu))
+		return false;
+
 	/* But are allowed during online. */
 	return cpu_online(cpu);
 }
-- 
2.43.0


