Return-Path: <linuxppc-dev+bounces-14313-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DCCC6CE39
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 07:22:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBBGK5yC2z30Tf;
	Wed, 19 Nov 2025 17:22:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763533321;
	cv=none; b=LjwixxOGxQAkTQFG8qok0a84KNoCC2I2tbLzQRY4d7OWRhkTeZ66S7Q9MUE1B9J8cxeaU777O9TmlV6LhQCpNFrwingoqIfqVN+y47KGtiqpCTJscdpI6ABPZ4HpBqWU86LCMBLC2ZpCEgYkicZM9onQ/y/iinvCaoes5OXpTl/XhLoGMvs+pNLmM0A33fhyYgIv58TnFwe3jzGG+itW5axuRZQS7WeEKzmrbuEIqHPCnuX1V/yjcCu+nb8HFJKjS+1j9BBm1UHImf8U04MrRPx55n2G+P25zzgiYu2YZaj/WcIyWGGhPOIMhGeKRsRc4ZKrh28mcu98m9pCFxmcXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763533321; c=relaxed/relaxed;
	bh=EMglGUXjxWB1AjAp9b8xSMYJfDhPqEOirHFXTgrKt0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZMlIsRI8QSZT6OGBPE+HOehmEN6uZyNDwr/BKK5zJHOpwB6UKaQZ9O9vXvr6vsnBqeo2//LM+JhtmScn9am0nY33jO6F3lojtDukDSYlZ9PiTLwknCbd4GpdRcYLHIjo+FzXy+IGhTS9nCb20zy+OPTkB/SzM0bbGBl2eTKNVVD0NCdvRpgko8zVUDkzI8ycAdEUtVwhpdNBDmXdVkWOs4KbM/kxWDB3p+d+khzOBX3jqQKG9kufykYsI6wC/zyAXzCEihLUaeQzitrRlK49h2ixuqdKwegCD8q5pVvVEDWGKZbUcO2dQ7yO8Ai7uldY4hA+SvhjSUWtdkUk8VAg9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YqKgJ/Ss; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YqKgJ/Ss;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBBGJ6lCWz2ynT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 17:22:00 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ5e8m1011801;
	Wed, 19 Nov 2025 06:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=EMglGUXjxWB1AjAp9
	b8xSMYJfDhPqEOirHFXTgrKt0g=; b=YqKgJ/Ss1cFMuhUVz4GpS0oFPF0vP+fcH
	Da3UOvw9qSyq6hJ7gHQ0H//i+oDjzxT0uePHvb5M9Kqiz6Frefg4QuH65S/mFUTL
	CuXwZbg7O4zO4/OY5Zb/BiwtP6dhU0QKtcg18EifSVASkYlbT6b57CftTGCzcpPf
	jF8yvzNhHu59/JaZjMU9zDVVfdZPg7G4BRSTc5I0fZvMnELWi+Gp99hrKzQ7yiQK
	UuR8sBfrLOODTbtf2lmtKZ0v1/OEbEFfArF/+szEcoVuJT0FJzpZ8PEqUvA80i+X
	syh3TjN7agH1k1+UT85fgLxRiVt/0PYiAKsd6dvlnqdr4N1pkMQgg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejmsp732-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:21:40 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJ6Ldh9032328;
	Wed, 19 Nov 2025 06:21:39 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejmsp72y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:21:39 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ36M0L005231;
	Wed, 19 Nov 2025 06:21:39 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af5bk74vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:21:39 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJ6LZ4v55706020
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 06:21:35 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E09E020043;
	Wed, 19 Nov 2025 06:21:34 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57B3220040;
	Wed, 19 Nov 2025 06:21:30 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 06:21:30 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [RFC PATCH v4 01/17] sched/docs: Document cpu_paravirt_mask and Paravirt CPU concept
Date: Wed, 19 Nov 2025 11:50:44 +0530
Message-ID: <20251119062100.1112520-2-sshegde@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: KsX5MyU5zQNZANX17DMtODP_2oCE1ovC
X-Authority-Analysis: v=2.4 cv=Rv3I7SmK c=1 sm=1 tr=0 ts=691d61f4 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=UMqL1o26Aa61VnK-UhoA:9
X-Proofpoint-GUID: Io9c6uisaBv8jhoFg_ffMc57ikrxILBa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfXwyV765gTiDty
 lK6zSZ2HEFsm14grpKfCyELfUgor2hdID5nOcA+D9MfzdwVu5fvGnQaxG4Yc6OqqGI6C86yxZj4
 HeX8D20fm5ccQnAatZotHIKU9NPozR26ySPG4DsjOEFoaqvHTjt9XQp/GvgpA15AqEqLmj/rSOX
 cey5i38vOjjhZ0FoSeGvKHH7pZ4YunDXDeiLfpvo1PXqwMcYwZhc4mUaCYNIXxn4lgpMVRZo5sK
 PXL0vK6spCElxUZMSgcc3I+12484T4DMsUGBtB6y2iSR1hzJ9rZv8jvfF7BmKwxY+SN+Gz01sgv
 GCAkD2cP4XG3IBvkrfLp0W/Gx+ycpg7II3HPsaCKhENOac8YIY7wd8batHh8tT0lX54C+Bbx+M2
 MvDlU43zhSG4Nk2knQcuT6Km0DLDVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
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


