Return-Path: <linuxppc-dev+bounces-14318-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E4AC6CE4E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 07:22:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBBGk6mLcz3bmL;
	Wed, 19 Nov 2025 17:22:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763533342;
	cv=none; b=NTe10l0tyrJej4WetThe56874v3Arm+xel2b+YrnSnaZywDX8LZAek+VtjAfIm84PZG0pKQw0fZsfA26bbde1QjTaV1EoapZm5VNvh6+DsveYolkkgEcXfiLL1gg/dZm4AS4fphc5u1jXw6RNC7/YpoNxeOlpFfe2i0hNIQPADt3p15y7ewRBa4Cd9x9Z4QtDw83Jvh0Jk1MDqxSfnYS9itpg69zGvxGDRm2KqPocLQTBFKCSQ/DEAzkwfN6dyIRm45nsPrDH9LgiZwuJjod8sbTnQ3yKoDPnVI1v9dkdTAbshHLVhx2QJu3ot0yVic2mDffUyNhDX1xEYbPIFbXZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763533342; c=relaxed/relaxed;
	bh=f8yijGd0trpyn0GQZdp9BNJ2l8xqlvD2qF4ywKOsS40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P0J0XHRdb1L1ND/HaB/LjT6SgQX6aeTDRFog4NSZUx/TDA0MI4ELW2lOPaYGdBhtUE0VvhWWPn9Jm3zk7DN1PoDxZwONgmUtO0njzXVqrY6Hnwhzb/s9NZg1AoJK5QiSuUI4WZ/ggD+Li8Hjq2Zf5omTDaZdDb7kaziGRgGLR83ZKaL+4AXTQScLodGDB3w9ZrskJGbP2oPI/Z5I+iGQlilnvlZLdy9S6RCxIFZRGJVO+FPLtrP1QqwbObK9j23NZT55wNOAZYi9UdZgtaQU55e7CLaDWI52Epah7WTz8oa6r2iozV2L7T8sErJaHkADAjC8nT7pR4ieL9xdjbMHtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rSUmTUir; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rSUmTUir;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBBGk0wDpz2yv4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 17:22:21 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIGptgL025875;
	Wed, 19 Nov 2025 06:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=f8yijGd0trpyn0GQZ
	dp9BNJ2l8xqlvD2qF4ywKOsS40=; b=rSUmTUirwQkTIoF+neJh7VjILC+Bpwk/A
	tN9P5oKjhsdJpr/m+Ppz4SCxt6EEAV4mEJXe2hTc4FnWJvIxCVj99oFO0p9yvNhU
	3rK69UsKo89FVh9M3jg3lEZtpHXNMwQVoE2n0qtGo1ds+P+mnnjZJR1S2VFDuliY
	25s9i8cEwJ6PXu2NASbveY2sh4XYahKMzeCxC5BZbGXJlJRg2E7CgGVkQMd2rAnD
	S1isxanjPhG9FM4c/g+3NoGYFzk6Th+6ILUlfu92Rr2ytsXLNFrfteALxQhdCQm/
	UXU7CAhSnEFAiSI27JPGIZ/BVA0wlFodFceghMsoL62pj2RsSOs1Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjtx552-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:01 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJ6M1Eh032604;
	Wed, 19 Nov 2025 06:22:01 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjtx54y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:01 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ2lxYv030791;
	Wed, 19 Nov 2025 06:22:00 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af47xy927-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:00 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJ6Luwq23134852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 06:21:56 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 66C7220043;
	Wed, 19 Nov 2025 06:21:56 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 678EC20040;
	Wed, 19 Nov 2025 06:21:52 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 06:21:52 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [RFC PATCH v4 06/17] sched/fair: Pass current cpu in select_idle_sibling
Date: Wed, 19 Nov 2025 11:50:49 +0530
Message-ID: <20251119062100.1112520-7-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: PrOkUxaqOlOHFsjN3g62TBwDejMTEiDX
X-Proofpoint-ORIG-GUID: DTGLePjwWXwpfo3xylAp3_fkws5dHnxw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX98HpljThVV0W
 EqT6vhVl8DEoLO9LVbkP25gY9L0EtroIoPa4JhocW23DzOqBEz1lxB6YfEZ+474SCnbhyaKfBh/
 BPPUn+upsqReJpYNFj9l3jJC0KJMKd5u3N/tBvYtdsANcJi3kDsqMMHg/PMYQTsqiPrVGF3RC7n
 QRWvRKdT6XeQyqGJ9yo+0mgJSVnpyrZXXxnLcwF/IReAbmEd5g4ouqAB2UthNScVZzY+O5nHjzj
 ZhTjpBbGExjW/6aAUg7GENHVdNNGUn9IFjI4MDEZATqXD/GWolS5Kkk2D4TW260U63FsBMe2Whl
 X3GY9R6i8xLlAIIiMG8Y+4l2xv1pgCujFcap6a9wYQofiAoEaTD+lm5djoPfwY8xXlFW8HhdKOq
 blqq2ssCOGKG+QaDYGjIcXj68ob1FQ==
X-Authority-Analysis: v=2.4 cv=SvOdKfO0 c=1 sm=1 tr=0 ts=691d6209 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=LR1EqIGjcEKtFJDgD-kA:9
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


