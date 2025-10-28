Return-Path: <linuxppc-dev+bounces-13429-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AA0C14261
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 11:44:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwn6q6Tpxz3f29;
	Tue, 28 Oct 2025 21:44:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761648243;
	cv=none; b=NNnTNjS+YyStjCQ3EThhqFdZ55mp8HqZy03a68TxBOp+696m4P+VywLWvW+X7/Bt8sfrIXqwi1JgPr1yK/dzJAD9148+CRJxXp0ro6fTZ7TAaGN3dYB/26UEaIfsNne2ESk5DyyH4DL7h8VYxOintu15IzYHJYcLqIB5jqysIA11Qo/DDIEyrb/tJBkGBneezv0YTFVcYrDNm52XNx2FUFL+TSMxf3KC9dlhdcxSeLtn6tn7R5PsmK8r14rfUETm7i+5M90hktnE/ild0y5u5hd4HJss92ctpXd7jBt64w/HBC6agLr4vRBsT3aHjVFbktyVOAbJF1/+uVlZghmv/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761648243; c=relaxed/relaxed;
	bh=0f9CMgz94SnlwGuKGeNACe/76SeHf/Cwa9hQutFojSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fq81lqnBdxpyR7RF/dFlZJe1kJT6/GYR6qEt7LWkCgJ7OE+VGQt5hmd46lUlmscczvbLC+AOBeIx8/QuvntzAhKHlkKLWVO6VBbrpgvVNgnNSXkGWACN43gbQgNdaqdsVi/hQUQP5lFeAyn5XgjwJ7L3bIr6lAYnp/X4ccJiJHnzbDefY6ntymuoulR/2P32yWT8OLYQSSfN1AUYRtq43QEW/iV3rM+rYaF8Mon3nRc8BSdn+vChIveLnBNSmiJcWj7k72JMwDXp6yH9K4T3GQi/+7mjoarK5h9s1gsVyy0P+LrqEvzpaB6coTemHXh0KQyZ+jh+JSBdelN/CBcpEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JvEqou10; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JvEqou10;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwn6p6c5Yz3f1l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 21:44:02 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59S454A2028206;
	Tue, 28 Oct 2025 10:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=0f9CMgz94SnlwGuKG
	eNACe/76SeHf/Cwa9hQutFojSA=; b=JvEqou10QxKrnxLEJ8pMm1YuBa9rrPg7o
	mAICPjdlUCH+FtQ2LntlZt11ANqUoq8jCa9OmjGuXtR6V9YF9BHfGL3sFgiDpPU5
	5Cpb9/AO7Nb2t+mtyKtjxZCMnbuCWanm1ikDOrcRrY41uxiJBndqgfHrH0C/+TEA
	1u+JN19rFgSbaZyoB4tpzIm8rcNdXD+vGa5nG1GyGVQBI535xQ3yzLax2+83dQB/
	8SmVMBRyyzgtHdyx/8yRfI1enT6nvhb2+me2rGhcV/jI8RgAyMxDAf2E3DMBWi+y
	MEmKgUWnb5a/a0Hovs4uvY/pvQAByK3LR3REopyrrx+mPkO6PycYw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0p293dr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 10:43:18 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59SAYakC011602;
	Tue, 28 Oct 2025 10:43:17 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0p293dr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 10:43:17 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59S8O4UQ030075;
	Tue, 28 Oct 2025 10:43:16 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a19vmj7xs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 10:43:16 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59SAhC9Y34865424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Oct 2025 10:43:12 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A8EA12004B;
	Tue, 28 Oct 2025 10:43:12 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0108720040;
	Tue, 28 Oct 2025 10:43:10 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.39.27.1])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 28 Oct 2025 10:43:09 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, Ben Segall <bsegall@google.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
        Mel Gorman <mgorman@suse.de>, Nicholas Piggin <npiggin@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Valentin Schneider <vschneid@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Srikar Dronamraju <srikar@linux.ibm.com>
Subject: [PATCH 2/2] powerpc/smp: Disable ACCT_STEAL for shared LPARs
Date: Tue, 28 Oct 2025 16:12:55 +0530
Message-ID: <20251028104255.1892485-2-srikar@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028104255.1892485-1-srikar@linux.ibm.com>
References: <20251028104255.1892485-1-srikar@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDAxOSBTYWx0ZWRfX5riAEx4s+9P5
 BXGa6n3wTPv5pmw+gquMp0TBc9dp1nqU7M2OeViS30FbQsiuGVFXfnTVpAV8cBbpY59MCsJwRj+
 7ZcVPeX3dJd011b7Wo7opZIZen6CIKSC56Sq0ew3piy/zHKnS3Uuk0CF2GRROUYkOwCZodQinxO
 BX6QCr3JyA7U5aVWt5459SjqXp67fX8GgvBNBRM16x4el5sf0UwKReyGq1aROq9oba2hmvSG7qv
 WhmBldY6v0SQWV2up16r4F+I42lCWgJLJKdyW+7oShd2fQYXeJEYipDto97PZXwzN9gCFJOSZVx
 w6o+HwPPOagvWtqSAbhfeEICSQ2yd+BC3mnV6EvfK/bNRMLT3hIlwKY2BJIlUgCO6lHf6w+hT2S
 lEdjNTS+Bx0960WrOgpV236zI4d5ww==
X-Proofpoint-GUID: VzSPZ--WadrjB1fECMQNuQVjLhyPzP0Z
X-Authority-Analysis: v=2.4 cv=V8ZwEOni c=1 sm=1 tr=0 ts=69009e46 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=qPhbY2I717OelsOsyKgA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: OW4pUvoMrXyZVcziWiYPdkrVAGHyvD0S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 bulkscore=0 spamscore=0 clxscore=1011 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510250019
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

In a shared LPAR with SMT enabled, it has been observed that when a CPU
experiences steal time, it can trigger task migrations between sibling
CPUs. The idle CPU pulls a runnable task from its sibling that is
impacted by steal, making the previously busy CPU go idle. This reversal
can repeat continuously, resulting in ping-pong behavior between SMT
siblings.

To avoid migrations solely triggered by steal time, disable the
ACCT_STEAL scheduling feature when running in shared processor mode.

lparstat
System Configuration
type=Shared mode=Uncapped smt=8 lcpu=72 mem=2139693696 kB cpus=64 ent=24.00

Noise case: (Ebizzy on 2 LPARs with similar configuration as above)
nr-ebizzy-threads  baseline  std-deviation  +patch    std-deviation
36                 1         (0.0345589)    1.02358   (0.0346247)
72                 1         (0.0387066)    1.11729   (0.0215052)
96                 1         (0.013317)     1.07751   (0.014656)
128                1         (0.028087)     1.0585    (0.0173575)
144                1         (0.0103478)    1.11785   (0.0472121)
192                1         (0.0164666)    1.0212    (0.0226717)
256                1         (0.0241208)    0.969056  (0.0169747)
288                1         (0.0121516)    0.971862  (0.0190453)

scaled perf stats for 72 thread case.
event         baseline  +patch
cycles        1         1.16475
instructions  1         1.13198
cs            1         0.914774
migrations    1         0.116058
faults        1         0.94104
cache-misses  1         1.75184

Observations:
- We see a drop in context-switches and migrations resulting in an
improvement in the records per second.

No-noise case: (Ebizzy on 1 LPARs with other LPAR being idle)
nr-ebizzy-threads  baseline  std-deviation  +patch    std-deviation
36                 1         (0.0451482)    0.985758  (0.0204456)
72                 1         (0.0308503)    1.0288    (0.065893)
96                 1         (0.0500514)    1.07178   (0.0376889)
128                1         (0.0602872)    0.986705  (0.0467856)
144                1         (0.0843502)    1.04157   (0.0626338)
192                1         (0.0255402)    1.03327   (0.0975257)
256                1         (0.00653372)   1.04572   (0.00576901)
288                1         (0.00318369)   1.04578   (0.0115398)

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 arch/powerpc/kernel/smp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 5ac7084eebc0..d80053f0a05e 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1694,8 +1694,11 @@ static void __init build_sched_topology(void)
 {
 	int i = 0;
 
-	if (is_shared_processor() && has_big_cores)
-		static_branch_enable(&splpar_asym_pack);
+	if (is_shared_processor()) {
+		if (has_big_cores)
+			static_branch_enable(&splpar_asym_pack);
+		steal_updates_cpu_capacity(false);
+	}
 
 #ifdef CONFIG_SCHED_SMT
 	if (has_big_cores) {
-- 
2.47.3


