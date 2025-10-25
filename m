Return-Path: <linuxppc-dev+bounces-13299-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9623C08DC2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Oct 2025 10:06:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctsm060FRz3bW7;
	Sat, 25 Oct 2025 19:06:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761379568;
	cv=none; b=WOLIJAX1gTMZBKDKBg+IdpkoZP1Csmzpxwz2kpnUnBxY0uKQU1hQwPAZBikxF9iad4yKz8vOWFluUjUrJ8ZkIhrHw1cH+1P9fUNNkcUazh9MkP7f5dBRi8UZXZoUmNcQEx3WbvoCddTPwJcut7/jc/NLZGI9mS0b5+TY+I1i3tP1EFnQSNwUTqg3hIF/8udzMtKw3K6KImCx6sVuf2Y+fp3ZgNuyS2kSNy5x+hXS62H2msKMxEw2ASgBtsTzRLasrek3yAAkgTxBXFl0SgNbL14XkSNixYTQGZaaGTg4deCct7X+6eFwaJn9PyLCy+PSzd7wh0Pw/7OQvRHpRIRIrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761379568; c=relaxed/relaxed;
	bh=DH32U9uFxFoHP0i4gpJnmYjxMIHV7a0KTqFArt/mfjM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lNfXMsmvsIt4W2mvDcYhYPrwhsQF9j02xcJFyujwySBgXAo/kiVTONcnREq72ddM31dlJ7k1wQtxE5NJ7o3sjMpoX1FuBMIwjzTo5C5ApbH7Tbhdcu4scveGN3ul3mWnJbAq68r3Lz0ySS9I6u2I3dI4GPQXUB+mlJac++XMjxdc3kDu7BHFTLLyEI5Tegk6M6hMMO0GDJ8JcQWt6XsZqFU0cMh2izJIo+0azZJdkS1Vm1Ym1AMhrFw1umT0aCoykCTijG9+JxWzze3SkHUaGIO+9+c0P+HCQeUXRCz/cVxuF/IbcFYQ9Wzco1ehqXRxIywhEjpwNuS+mYPT7Ps63w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JLcQ9Akq; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JLcQ9Akq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctslv5dKNz2yFT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Oct 2025 19:06:03 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59P7lNIn002021;
	Sat, 25 Oct 2025 08:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=DH32U9uFxFoHP0i4gpJnmYjxMIHV7a0KTqFArt/mf
	jM=; b=JLcQ9Akqa4pmON8LQBQkpeDO/lyKmkqE7WxTEDWJuFZBzpbT63jBDoUmr
	/t6moq1rupsE7A2p8GVhqOcQ7hsb2MxLx2klH4z0HteQv6iKVIIYUcmBMFTuiMDJ
	V9C1SdO7JITvCVvsZjcQ++p9Si+mba9DtjHsFuc4Rr6GKg/3ErDvTUmtDYdXq/EF
	caXYZBTWqhtT0YrD+lNJVUDqq6TH3uOcXunxG6gmPHgGnReFJtl2jEcPobzJZark
	qWdrtShUx62aInJ0J4eaJEdNt6zSO2JZunddlsy1acEu3oQpV364Bye2MdY2NiGw
	9v/Po9kvkU+duUhy5WLupl3M9QkBA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0p71rghu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Oct 2025 08:05:37 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59P85aph007016;
	Sat, 25 Oct 2025 08:05:36 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0p71rghs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Oct 2025 08:05:36 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59P715oe014650;
	Sat, 25 Oct 2025 08:05:35 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 49vn7spwbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Oct 2025 08:05:35 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59P85WEf27329180
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 25 Oct 2025 08:05:32 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE9CE20043;
	Sat, 25 Oct 2025 08:05:31 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 025B120040;
	Sat, 25 Oct 2025 08:05:29 +0000 (GMT)
Received: from li-80eaad4c-2afd-11b2-a85c-af8123d033e3.ibm.com (unknown [9.124.208.103])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 25 Oct 2025 08:05:28 +0000 (GMT)
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Nysal Jan K.A." <nysal@linux.ibm.com>,
        Sachin P Bappalige <sachinpb@linux.ibm.com>, stable@vger.kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/kexec: Enable SMT before waking offline CPUs
Date: Sat, 25 Oct 2025 13:35:09 +0530
Message-ID: <20251025080512.85690-1-nysal@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
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
X-Proofpoint-GUID: DSLJz5a9y6S8i4-Q96upr-ecAOjqHxnJ
X-Proofpoint-ORIG-GUID: G3PAheeMhppQVqLS0EwDvlcrnVAGfZvY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDAyNCBTYWx0ZWRfX7a5piwKIHyIq
 FkkROM7yuBbMUOh/7NG/vZmJ/nHFlresedwZsc7g/e/Y/nxFYb5UY0xyNYk8fZZwRdN+sf4watB
 aMRK3Vp5qcTG/QKib0iaAZGPBSHaAuqn2uW4hdZhemD1MuThI2T/oMsSCSTFXZ+iKVbpv+RAhpS
 uxSLtoXMy1upem66UZFf9n0ClEWI4sP4h1vF1vyhIrdoRbRYFNG7EQBOsgUbBBxPeOC7V7LlzIO
 M6cPLbInm+gmINbi760PQyTzC0Te0jeOflw8CtY592IEU1sN2qu7uXZI4uQVdoSNbnaV1sjwVfp
 N9efdsyfQCeurP3/yZuV9O7vDstm2FDtMwd8yrSq3dtpQxfWAXpkzB3X0GamQ3EYv8uw4dIMEmr
 zZYv/HJ1sJHaAGmYDpOvnHZGdiNWCA==
X-Authority-Analysis: v=2.4 cv=G/gR0tk5 c=1 sm=1 tr=0 ts=68fc84d1 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8
 a=_e6cMelR3GvLKgEiZ7sA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-25_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510250024
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

If SMT is disabled or a partial SMT state is enabled, when a new kernel
image is loaded for kexec, on reboot the following warning is observed:

kexec: Waking offline cpu 228.
WARNING: CPU: 0 PID: 9062 at arch/powerpc/kexec/core_64.c:223 kexec_prepare_cpus+0x1b0/0x1bc
[snip]
 NIP kexec_prepare_cpus+0x1b0/0x1bc
 LR  kexec_prepare_cpus+0x1a0/0x1bc
 Call Trace:
  kexec_prepare_cpus+0x1a0/0x1bc (unreliable)
  default_machine_kexec+0x160/0x19c
  machine_kexec+0x80/0x88
  kernel_kexec+0xd0/0x118
  __do_sys_reboot+0x210/0x2c4
  system_call_exception+0x124/0x320
  system_call_vectored_common+0x15c/0x2ec

This occurs as add_cpu() fails due to cpu_bootable() returning false for
CPUs that fail the cpu_smt_thread_allowed() check or non primary
threads if SMT is disabled.

Fix the issue by enabling SMT and resetting the number of SMT threads to
the number of threads per core, before attempting to wake up all present
CPUs.

Fixes: 38253464bc82 ("cpu/SMT: Create topology_smt_thread_allowed()")
Reported-by: Sachin P Bappalige <sachinpb@linux.ibm.com>
Cc: stable@vger.kernel.org # v6.6+
Signed-off-by: Nysal Jan K.A. <nysal@linux.ibm.com>
---
 arch/powerpc/kexec/core_64.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 222aa326dace..ff6df43720c4 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -216,6 +216,11 @@ static void wake_offline_cpus(void)
 {
 	int cpu = 0;
 
+	lock_device_hotplug();
+	cpu_smt_num_threads = threads_per_core;
+	cpu_smt_control = CPU_SMT_ENABLED;
+	unlock_device_hotplug();
+
 	for_each_present_cpu(cpu) {
 		if (!cpu_online(cpu)) {
 			printk(KERN_INFO "kexec: Waking offline cpu %d.\n",
-- 
2.51.0


