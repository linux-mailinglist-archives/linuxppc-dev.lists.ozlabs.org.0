Return-Path: <linuxppc-dev+bounces-11998-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8431EB51F32
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 19:44:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMSjp30xrz3ckj;
	Thu, 11 Sep 2025 03:44:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757526254;
	cv=none; b=UAOxXhiXh6rsRQ2btv4ajt3zwZ0OfEGeWPfOCPKdQTO1w1J5iBGx7Hf1ABfxwDG9Gqn84JzEkhNHudEQBfiCGs1k86mI5yCXcOEVZ0WUJmGQSVieCwL4Ha7giFYgJfD4BmuL2VBIkS1MBay7H2la4kX2PCDuPgcO8tR6mRjulQ2XywAsn9pily3S5RtxlsgdkY1+3l0Ln24not4FyFP1xVOP5PHmddvct0TiIgp/X2QuDKAViVdvZsd1hjNIRzx8gYo6ZRdr3LmDxrRtvE5GDkjan/gua2FtH6LW9dN7+G7DKfpmgAoywZIKxZ+QLHEA4tDMbEC+bYu+YHyTEXljug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757526254; c=relaxed/relaxed;
	bh=wwTbzYrOKaRWdigEM9lqf1RzWDKRLvcIVKfgph7bQL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fbcvA5CmpoTlPzVzvyOSl8K+WBLmcF0b05ZO+VhXBxEydkO7l29nrTrh6GgJwK5/j88GlloWBJr/ABtBEelEWkDQAhzbmlbWDdR8xCrhEvrcdVCJ638jEb0dGl4A3F8Ks15LyTBbyfdhuBGfWU+vgkXkve0NZi0VO0dsLWNC2NcJ2PBossy6qYFX8+9AbvpohOgLHQ3wkNZS2ZlZLtnSYiqVSUcPNyrYEs9FP1+HNa1JvHL8n34zI/eUYxOnaBcl7SE4U2WD1aSh+DM3ODwOookUUxX8ZzSU5TWf0dzXcfwpjmfW/0HOxte7OWg3oojrWOJEONYEkkNAZGr6ZlV9JQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NN2o+Fy2; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NN2o+Fy2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMSjn1bKyz304f
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 03:44:12 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ADTHFr024507;
	Wed, 10 Sep 2025 17:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=wwTbzYrOKaRWdigEM
	9lqf1RzWDKRLvcIVKfgph7bQL8=; b=NN2o+Fy2QwZwiWO33vmptx15UQ6C1nR8o
	/hHB97yOLgZ9o/t4YxwW3DNLw0fnBDZQiJfMaKcXzzVKv2iwaqLl8DJRILlwnGX3
	zOxRorBtdL2Pesu9b7znUGB0A9SomMR+F7BBAonTbD4m+Z6smxDai/KsnG21zfCK
	TZCbQfJNsNT6JacI5qCw6bXV+0OM1meiXaKg8j2KIDaJ1M9B35ZD/9gyfq6ZZ/3c
	nYfJ2dk3lCrQGauT2U3R7fkQX7qIjdn/BnEuttRvMD70fEjrAeVMAaw55dLAiG/N
	tuIJgDhlUS/wcI+FPQVsA3SctUoRwELvJIaqlCyeLtGBI4rcFLSZg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490acr7fyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 17:43:46 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58AHhjfu025192;
	Wed, 10 Sep 2025 17:43:45 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490acr7fye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 17:43:45 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58AEODD6017227;
	Wed, 10 Sep 2025 17:43:44 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4911gmhhrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 17:43:44 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58AHhfs720709848
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Sep 2025 17:43:41 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 091B12004B;
	Wed, 10 Sep 2025 17:43:41 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BBEF820040;
	Wed, 10 Sep 2025 17:43:34 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.208.171])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 Sep 2025 17:43:34 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org
Cc: sshegde@linux.ibm.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        vineeth@bitbyteword.org, jgross@suse.com, pbonzini@redhat.com,
        seanjc@google.com
Subject: [RFC PATCH v3 01/10] sched/docs: Document cpu_paravirt_mask and Paravirt CPU concept
Date: Wed, 10 Sep 2025 23:12:01 +0530
Message-ID: <20250910174210.1969750-2-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910174210.1969750-1-sshegde@linux.ibm.com>
References: <20250910174210.1969750-1-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: tejbwv8RIvw2j4SCP1l-_WJVwNLIhRiB
X-Authority-Analysis: v=2.4 cv=Mp1S63ae c=1 sm=1 tr=0 ts=68c1b8d2 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=UMqL1o26Aa61VnK-UhoA:9
X-Proofpoint-ORIG-GUID: LEgcp7_w3cndHO4W8K4e5K7JW7c_D1ut
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX63I7qYDS64tj
 3TFIUQMrO94xFdoTxW6X8HuThVTL/NqGlaUBlzmZsvV79+hxiMATkjaCJ8YospnQfSxtcq9B8bc
 XuxntyhsCD1PVWatJBUsl58p7C7l+fd1bwffkMUGdlzi9ApIpiD5Sz8g2WRzH2NNSE8peFG8/Hl
 4kccopGpa6/XuFQDImMlJwYM6hY2HzlS9DfSb2JcUIToamHBooNblRsB6FIMXRYTI5lmEudiysY
 52r9Rau5i534IlNzQJa7s9Z/aqywDpi28zPAwsk2URghY53qCaq4er2Jbg2NMcVxiwNiRYvuHgu
 YVi2pfSfnDT169JR7x8EqzG3RfzjXmfN1N4b7Wd0xlBc5QJUuZC5/q3WALeOAGjR0ovPh+fRCEp
 SUNeEKd5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060000
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add documentation for new cpumask called cpu_paravirt_mask. This could
help users in understanding what this mask and the concept behind it.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 Documentation/scheduler/sched-arch.rst | 37 ++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/scheduler/sched-arch.rst b/Documentation/scheduler/sched-arch.rst
index ed07efea7d02..e665d4a20e91 100644
--- a/Documentation/scheduler/sched-arch.rst
+++ b/Documentation/scheduler/sched-arch.rst
@@ -62,6 +62,43 @@ Your cpu_idle routines need to obey the following rules:
 arch/x86/kernel/process.c has examples of both polling and
 sleeping idle functions.
 
+Paravirt CPUs
+============
+
+Under virtualised environments it is possible to overcommit CPU resources.
+i.e sum of virtual CPU(vCPU) of all VM's is greater than number of physical
+CPUs(pCPU). Under such conditions when all or many VM's have high utilization,
+hypervisor won't be able to satisfy the CPU requirement and has to context
+switch within or across VM. i.e hypervisor need to preempt one vCPU to run
+another. This is called vCPU preemption. This is more expensive compared to
+task context switch within a vCPU.
+
+In such cases it is better that VM's co-ordinate among themselves and ask for
+less CPU by not using some of the vCPUs. Such vCPUs where workload can be
+avoided at the moment for less vCPU preemption are called as "Paravirt CPUs".
+Note that when the pCPU contention goes away, these vCPUs can be used again
+by the workload.
+
+Arch need to set/unset the specific vCPU in cpu_paravirt_mask. When set, avoid
+that vCPU and when unset, use it as usual.
+
+Scheduler will try to avoid paravirt vCPUs as much as it can.
+This is achieved by
+1. Not selecting paravirt CPU at wakeup.
+2. Push the task away from paravirt CPU at tick.
+3. Not selecting paravirt CPU at load balance.
+
+This works only for SCHED_RT and SCHED_NORMAL. SCHED_EXT and userspace can make
+choices accordingly using cpu_paravirt_mask.
+
+/sys/devices/system/cpu/paravirt prints the current cpu_paravirt_mask in
+cpulist format.
+
+Notes:
+1. A task pinned only on paravirt CPUs will continue to run there.
+2. This feature is available under CONFIG_PARAVIRT
+3. Runtime checks are guarded with static keys for minimal overhead
+   when there are no paravirt CPUs.
 
 Possible arch/ problems
 =======================
-- 
2.47.3


