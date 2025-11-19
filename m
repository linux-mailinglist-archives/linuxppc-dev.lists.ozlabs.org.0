Return-Path: <linuxppc-dev+bounces-14351-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D31F7C6E8D3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 13:45:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBLn61zr5z3dL2;
	Wed, 19 Nov 2025 23:45:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763556346;
	cv=none; b=WI/Tm7fIR9rDcYzYY/5SgTxRUUhhqa+PB1niA3zrIV9dd1EYE/WDoDIuwbtxChNWXmgjGy7FvIOX5ST5crC9BIHDYq+reQHAeU2nyuHb0MAxuqo1kDDtGyzoyHMJfL8sUvgAeDs+bHHYsAw7BQ4hPndDv4HA/fNVIljQeLZ0lyr9N/7BmP74/MCBNLP6do7rKF1qBRUabqvwEG2JOBc2mhV7aQ6KXuyE2O4UPKwh/GEKno38zokji+FVoYEWOTLtd/OGelcIW5Rg/be5OZHkQ3h+efcpeoYsyKKbz4DdUpgazo0AoPnotizOVYrGvpDxGChxUHWO634UTPRiAGyDlg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763556346; c=relaxed/relaxed;
	bh=f8yijGd0trpyn0GQZdp9BNJ2l8xqlvD2qF4ywKOsS40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wki+Q0OfHbxxD4vXviAnIHytxTOUnwU4idhZgmaqaf4dEHfa/qt775U4vU1YY0Oml7WbXdZ1YfI/uZ2o91QdA6ezV6Gmci1/BFvJH2C82vHnpZaNVYt7ClX8RS/S55Fx2DeR7jJwNN8vQE889OF3GL/jhOl81R/2Ic4AVszowGZrmT6kKF0jabwFVoPC+qoveCIZENM46inlrBbXIK1eg6zMfLvcY2eTk3HMDYiT7mANvnXBv722U5+DtEgqtuAYvu6Nh2+HPI3gAE3+/mAtmw2Rom95lKxjbiQd/1qDR9e40cNF7PlaqBQbIZ7dlJvCvfwqqdgUUfbenaFhIaEiSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S7i/hO6e; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S7i/hO6e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBLn52Ygtz3c4l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 23:45:44 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ7HIxu019349;
	Wed, 19 Nov 2025 12:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=f8yijGd0trpyn0GQZ
	dp9BNJ2l8xqlvD2qF4ywKOsS40=; b=S7i/hO6eJtGFtRilYEFG7LlCTzdMZryGQ
	5TzemsU8f1A5ZXaRWbt38ph4Vb3mCUgVc4KB5iCpSR/MwjopVFLFRLCmDyLaY8oY
	55WUt7ZKk6Dxy7VHwBn1oAMwtermaRIHSIthBLRZGB8IPxY1lAYpMrie0KOyyyIk
	hO9WVkKW16DTAc5LlFS1gKgsvU8wMGWIWt4oHwyFy6iAie+4dCMbZt1mSke7mlqh
	SP4i1JYJviAxMfPak0IGPmdad7hdtO8tGCTCb9c23+ep6XkY5LkIWth36kOcc7vn
	KeVySuRMI+B6VHnaXouIOoomrJgSOanWkedVC13vj5FYs1BRrnKvQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejmsqntj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:30 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJCdmaZ018424;
	Wed, 19 Nov 2025 12:45:29 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejmsqnte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:29 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJCHdw8017319;
	Wed, 19 Nov 2025 12:45:28 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af6j1rcc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:28 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJCjOmu52953530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 12:45:25 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D780E20043;
	Wed, 19 Nov 2025 12:45:24 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B23E420040;
	Wed, 19 Nov 2025 12:45:20 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 12:45:20 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 06/17] sched/fair: Pass current cpu in select_idle_sibling
Date: Wed, 19 Nov 2025 18:14:38 +0530
Message-ID: <20251119124449.1149616-7-sshegde@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: HAkR2ikVxu5ppvG9Ed_Za4Od8QKMpVeP
X-Authority-Analysis: v=2.4 cv=Rv3I7SmK c=1 sm=1 tr=0 ts=691dbbea cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=LR1EqIGjcEKtFJDgD-kA:9
X-Proofpoint-GUID: pARDVr-xXswqWRaIiOxPaFZZUMaQYkp4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX0Qm17IMWwbLJ
 v8hZM/dV4NL8xBKpRBtWnHBFe6Zn3ob4/BKPmlEe0EuI6FgDFdX2xAAeroIBBdeJ29mfAMxv0AA
 sVCHtHVeSs1oC8n1Qim0kYNwLy1AQR6V0F3Ern8BSFv+Zjy0sMDtrd2HWH4HDnq55QV5nXX8jYt
 M4UR7IY/d1k3Pf0bEhTY+/ExQTlKZXRYeVbNQwr9fgRItEAoRXBMCht+PVFtbZAyrMOBPatcGaI
 RcPMH3rdQHiXKZjeI2AF0CgbA5cdNsQdYB9R3TQHqf0fiRQo1MFhmJ+lFcK+JZk1BvBn0YehOtu
 19oxSJDrpvb9HDtikueMLajv2+Lj3MFfk0zh3POZa9xWlQwcGDDmUt8qvSkDREfeV0INTPgWL/4
 N69X83IJ/LvRrWrvZyu+GfgivX37Hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Pattern in select_task_rq_fair:

	cpu = smp_processor_id();
	new_cpu = prev_cpu;

	//May change new_cpu due to wake_affine, otherwise it remains prev_cpu

	new_cpu = select_idle_sibling(p, prev_cpu, new_cpu);

Due to this often prev_cpu == new_cpu. If the task was sleeping when
the prev_cpu was marked as paravirt, it would be beneficial to choose current
cpu instead. If the current cpu is paravirt too, then wakeup will happen there and
at next tick task will move out.

So pass current CPU as well in the select_idle_sibling.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 kernel/sched/fair.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 1855975b8248..015e00b370c9 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1048,7 +1048,7 @@ static bool update_deadline(struct cfs_rq *cfs_rq, struct sched_entity *se)
 
 #include "pelt.h"
 
-static int select_idle_sibling(struct task_struct *p, int prev_cpu, int cpu);
+static int select_idle_sibling(struct task_struct *p, int this_cpu, int prev, int target);
 static unsigned long task_h_load(struct task_struct *p);
 static unsigned long capacity_of(int cpu);
 
@@ -7770,7 +7770,7 @@ static inline bool asym_fits_cpu(unsigned long util,
 /*
  * Try and locate an idle core/thread in the LLC cache domain.
  */
-static int select_idle_sibling(struct task_struct *p, int prev, int target)
+static int select_idle_sibling(struct task_struct *p, int this_cpu, int prev, int target)
 {
 	bool has_idle_core = false;
 	struct sched_domain *sd;
@@ -8578,7 +8578,7 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 		new_cpu = sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
 	} else if (wake_flags & WF_TTWU) { /* XXX always ? */
 		/* Fast path */
-		new_cpu = select_idle_sibling(p, prev_cpu, new_cpu);
+		new_cpu = select_idle_sibling(p, cpu, prev_cpu, new_cpu);
 	}
 	rcu_read_unlock();
 
-- 
2.47.3


