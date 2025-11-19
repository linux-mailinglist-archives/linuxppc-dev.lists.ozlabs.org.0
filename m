Return-Path: <linuxppc-dev+bounces-14348-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEEBC6E8B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 13:45:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBLmh1kzBz3cYm;
	Wed, 19 Nov 2025 23:45:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763556324;
	cv=none; b=eRXOaWC8ihkW1SiNSyFzof33tygWdO0oa/B14cQ1gY4A4+lpGbNy+8zxRhoTG5Q0mD2DvjQoq1Ek08qwPJL0laFhX8ZMYgg/QctikDk2lHl4Ng+38zEFKvQJzZaLrTUX9+7RQ6ai3c+gfjtdzXoGwG1/XTrSZQXDGzt0JHLMUKRcg+dNl/8m4j1HsH93FRPbddfPFUKkiKIuxPdVJ6twLXX5BJDgMGTtFYY466vdWzpYNgDJkKjD7DcwOatEmnGh/WkYzpVRSrWinm57NJR24DZAVSOqxOyK8DAAnLk6sYpIozvncgeDX2m7c4d9ArC7MSPTyZla8I0Z1oBQ0zFH8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763556324; c=relaxed/relaxed;
	bh=EMglGUXjxWB1AjAp9b8xSMYJfDhPqEOirHFXTgrKt0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oyWkzNP4KyHKu/0J3i0xAVNKhptkaYBPA3FXtYETKN4ab3A2nHU7B9TjJuR9jf47uOmOJtKnJbyqxfuxGlKhGTc6Qf6rcDRZrLyyxhXzpzXxLW+d2I1mAi/ZdjxI05frdDrBs27dskzNlp3VFYMA8J15m8x0WdAIoy2elHozxFlNbM99dpDgNjxTl4MB/8qYpN1ZXt4nll3c73suQc2tUQ08LwQklqy5dgz8Z2ASk4XTymkfZcwQfR7r1QRlap+nRbXCOyX/72b/6VWMXljS7NA3vHYw0GsZjqqgi3WKKz1VIZGVq2UWLwWS/RRDrVrWN8jEqMBiEZNUaGUeUXLTAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rzTLRziw; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rzTLRziw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBLmg2326z3c9l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 23:45:22 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ8QU5G022737;
	Wed, 19 Nov 2025 12:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=EMglGUXjxWB1AjAp9
	b8xSMYJfDhPqEOirHFXTgrKt0g=; b=rzTLRziwI+yhqDejYviufCfQVLBqDJXl+
	q0+m7+6H6IbmGvqfEMHv+xRZW+lBZEO8Z9mC2IuZzjTd5Vp+RjwA8Bd4m3so2IU2
	BCASkoN99uIA5fFrJ/qaA06s0IJs1YhMMJXaR9jG52Jo4fc+qPDQTY1AdUUAK7kH
	VW++UA1AEePyzr8SNZA6aIPdXFzLU6bL3gKPSej3FTExyQTci4DBCteXtUP+pkRY
	6d22BUTY70BDDvbWDBEOS6T/CBFvR2niYs9AeuA+ffpAdH9ZOClUJ11Pg62GAMqF
	8YbxetUMS+7H8zb+CcD2J5VXk8FQPwpbu4iPV5A8McfI9cOpHN62g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjtykdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:08 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJCg5r0019331;
	Wed, 19 Nov 2025 12:45:08 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjtykdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:08 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJAwIHE030795;
	Wed, 19 Nov 2025 12:45:07 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af47y0rkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:07 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJCj30S52953400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 12:45:03 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34B0120043;
	Wed, 19 Nov 2025 12:45:03 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E8C720040;
	Wed, 19 Nov 2025 12:44:59 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 12:44:58 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 01/17] sched/docs: Document cpu_paravirt_mask and Paravirt CPU concept
Date: Wed, 19 Nov 2025 18:14:33 +0530
Message-ID: <20251119124449.1149616-2-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: Bwe00pfcTtIZHxJTF01ltZiLY_X8wHlP
X-Proofpoint-ORIG-GUID: EaFCTdmCdSwH1owybEo2RDLQ8-n0dzO2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX/uCqO/hfeEIY
 LVNqqrV1DEtwSHo2nc2yurGrKHrF8faEiE8n1129GOCPAYKWM+F+jli0xqzaevNKuPuCKla+Kiu
 nk/CSwibVtWNQhTmUH/CLZOL5oEdKat7kqREBEcxymulhtwQnI6xRLJocmdWhFccBh7tfY31skU
 G1AIGxVa8DtLt6oRKO2vWueEOI3IUW9tVVn+/tRy6W+jFs2MmEwUzfiA7nbvpgOTYogpPliqAVL
 brKUoS6y1Tx5UIMGpPkXbVcaY+9C6D/8MRv/Co9XF1VxyVXZ7LOD8QrUJRetOx0aKHvZrsL2f0r
 OPnO0VWQHct3BsSgEk4jFyKSYHsz/yUFWQWVx1/+VW3QUIultPncD6aYtajze4WkARGRCeJjBcO
 lM16YMpJqbmaEA/YjCx3fR4wLGOj7w==
X-Authority-Analysis: v=2.4 cv=SvOdKfO0 c=1 sm=1 tr=0 ts=691dbbd4 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=UMqL1o26Aa61VnK-UhoA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
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

Add documentation for new cpumask called cpu_paravirt_mask. This could
help users in understanding what this mask and the concept behind it.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 Documentation/scheduler/sched-arch.rst | 37 ++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/scheduler/sched-arch.rst b/Documentation/scheduler/sched-arch.rst
index ed07efea7d02..6972c295013d 100644
--- a/Documentation/scheduler/sched-arch.rst
+++ b/Documentation/scheduler/sched-arch.rst
@@ -62,6 +62,43 @@ Your cpu_idle routines need to obey the following rules:
 arch/x86/kernel/process.c has examples of both polling and
 sleeping idle functions.
 
+Paravirt CPUs
+=============
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
+3. Refer to PowerPC for architecure implementation side.
+4. Doesn't push out any task running on isolated CPUs.
 
 Possible arch/ problems
 =======================
-- 
2.47.3


