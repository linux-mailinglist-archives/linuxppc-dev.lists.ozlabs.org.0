Return-Path: <linuxppc-dev+bounces-15446-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D50D07727
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 07:49:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnXSd4yTwz2xSN;
	Fri, 09 Jan 2026 17:49:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767941377;
	cv=none; b=TEaZOSxgartnUk+4HkpNQx/4yOIyirfIbnnzwmyZU+7kFfasdiKLHVyygBoPGyUccE1CN43D0mzsZ+x2+SnwxU9KaTOEIFRzTkulSH/UWpusKOQIRoehys+h4ADjamUgzApl3+yuDxCBeUUjuaN8jxFUaWctIWCcNs4cjY38isKQuyegyk4LzswefZCCSp/4wVaj4S6vkwk+VmUcv+HIr5gZhQJIX1Dy+jcccNq8n+M2a3ymUc9RL5QaMSvkZ7AitoeirE2vXqDhAgJNRNyrKCHrX33fnkUzd2K2ey3ZERovoB3WYhQIYfDb3tpCnjcMv9PP5u7ZCUjjs/PrwEeqIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767941377; c=relaxed/relaxed;
	bh=EE/F0mXkRQbx08e5Ca0sVdZt0d+6CNCxUW15PZ0iPKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RQMXFbdOylQyHZ77wN2rouubFylDWEbhicgW0qAwI92aSTWM+1YyYFv6hFjO3jVbDjJKAMLMNKK3KNR3ilFiemzuQ0+utUbnw/V/3xsCvQYfUal3J2W/dbvpO1ZbVekHeCPasrwf1VxIhbGb+J66MvvKgtc1MYyx36gdDN+OWac9zIGHYXPTaMKHsqMSPefCRl2K3eartGsq5jfPQER4jh1dDoGYdrmSevqgY2oBYyP0zKEhsLsa4gWmoBdADMQvW43IEA3DBhsQUWvgoH04eSrvnAmYaTaj1EJqC4jqgyD1r0Z8m6jViWalY0OInAk0zOMym0Jw3X1moKiKHRfITw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VueMJSSD; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VueMJSSD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnXSc4lyhz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 17:49:36 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 6092R3KH008176;
	Fri, 9 Jan 2026 06:49:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=EE/F0mXkRQbx08e5C
	a0sVdZt0d+6CNCxUW15PZ0iPKE=; b=VueMJSSDdwKI0+wtueb5S6N0NQe6FJFqW
	HizVgbDKAeXBHGwAN4DTNpnRNX6m+PIAKdEaf6ClDj1eh4FDCCKqc8fZoBY2ULrq
	M9UTO9sfIL8UG0tkU3ettzSPeOA/vCiPF0s4GUMZsAutuutWYx0V/udhZ74+opOa
	HgFlhm2o7PQfxOuSNHDiQI0+qCZlB3MPZdIewxa6zTQwJsBgqmGeoP9gbwury1QT
	mOPhXYWLFw0Sjl3xTbu6KPmh0+OZLfe/nGndKV2QjVXKGhfkE1a3htQAcr/qLnIL
	Vqi89DX/cvidLbLCtLG2byVxXO2brEFbg4d/Qjs7qZZFhK7zd8uUA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betu6hxq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 06:49:29 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6096jMH6012581;
	Fri, 9 Jan 2026 06:49:28 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bffnju78k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 06:49:28 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6096nOVM61342006
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Jan 2026 06:49:24 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6AA9620043;
	Fri,  9 Jan 2026 06:49:24 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 16D5820040;
	Fri,  9 Jan 2026 06:49:22 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.17.37])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  9 Jan 2026 06:49:21 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, rostedt@goodmis.org,
        mhiramat@kernel.org
Cc: sshegde@linux.ibm.com, chleroy@kernel.org, riteshh@linux.ibm.com,
        linux-kernel@vger.kernel.org, hbathini@linux.ibm.com
Subject: [PATCH 1/1] powerpc: Fix kuap warnings on lazy/full preemption with tracing
Date: Fri,  9 Jan 2026 12:19:17 +0530
Message-ID: <20260109064917.777587-2-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260109064917.777587-1-sshegde@linux.ibm.com>
References: <20260109064917.777587-1-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=QbNrf8bv c=1 sm=1 tr=0 ts=6960a4f9 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=werk9FZ3qabLIBrYCs4A:9
X-Proofpoint-ORIG-GUID: RZBckwzHWJPVUjt1JcBOmD_Jzd9wh8u6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA0MiBTYWx0ZWRfX0Ql4mSVouP06
 BeiCBWFTaHrwH7jj8CyI9yIgkmRdnrVwEMZE7sgH3thoMojmedY6KnSDo/FDqV+q4bGmLffx5Sn
 8rauv0Bv7q2bzeDOHzbFlckd4qFoSuqfUFWWNza9KTirqDHW6MRrM3cqmfXeOUPoNY8GASKi1/3
 bzHI+7xyNufbbEDgkd6NECYsnV6yBYsiN8UfV8VWAXqfvvpQ1GjcMiA6tssBNGlC9fYbD1ijJq5
 LmeseRfNTXI0+f7E5m8MEkrQ6xSNbTrUD0yzZIrabTR1ujD0BByh0KZOcsspVNw3E/IVr3ZqBmb
 o869RXDPn9cOSl725cmnflAemxDI/moQjWJMoSMfN7rKELdyRPKhko/TDm1gUTX/26rfxdUJGvk
 eG2dtBQ/p1h0EbYhc9C/kwBuG/P2aZlVGtHJaalj1xptoTc4osw3vMLB6HII+hKi2U6pUjlHktN
 um1kncGMaKIjYybYUug==
X-Proofpoint-GUID: RZBckwzHWJPVUjt1JcBOmD_Jzd9wh8u6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601090042
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

These KUAP bugs/Warnings were seen often when tracing was enabled.
It happens with preempt=full/lazy. It is easily hit. 

How to trigger:
echo lazy > /sys/kernel/debug/sched/preempt
echo function > /sys/kernel/debug/tracing/current_tracer
stress-ng --class memory --all 1 -t 3


Bug: Write fault blocked by KUAP!
WARNING: [] arch/powerpc/mm/fault.c:231 at bad_kernel_fault.constprop.0+0x1a8/0x2c8,
CPU#9: stress-ng-vm-rw/5477
NIP [c00000000008cdec] bad_kernel_fault.constprop.0+0x1a8/0x2c8
Call Trace:
 bad_kernel_fault.constprop.0+0x1a4/0x2c8 (unreliable)
 ___do_page_fault+0x688/0xa54
 do_page_fault+0x30/0x70
 data_access_common_virt+0x210/0x220
---- interrupt: 300 at __copy_tofrom_user_power7+0x410/0x7ac
NIP [c0000000000b3b44] __copy_tofrom_user_power7+0x410/0x7ac
LR [c0000000009a7d78] _copy_to_iter+0x134/0x9c4

Enabled CONFIG_PPC_KUAP_DEBUG=y, which prints out below warnings.

WARNING: ./arch/powerpc/include/asm/book3s/64/kup.h:93 at _switch+0x80/0x12c,
CPU#9: stress-ng-vm-rw/5477
NIP [c000000000013ce4] _switch+0x80/0x12c
LR [c00000000001f968] __switch_to+0x148/0x230
Call Trace:
__switch_to+0x148/0x230
__schedule+0x270/0x700
preempt_schedule_notrace+0x64/0xd8
function_trace_call+0x180/0x204
ftrace_call+0x4/0x4c
enter_vmx_usercopy+0x10/0x74
__copy_tofrom_user_power7+0x278/0x7ac
_copy_to_iter+0x134/0x9c4
copy_page_to_iter+0xe4/0x1c4
process_vm_rw_single_vec.constprop.0+0x1cc/0x3b4
process_vm_rw_core.constprop.0+0x168/0x30c
process_vm_rw+0x128/0x184
system_call_exception+0x128/0x390
system_call_vectored_common+0x15c/0x2ec


enter/exit vmx_usercopy clearly says it shouldn't call schedule.
Doing so will end up corrupting AMR registers. When function tracer is
enabled, the entry point, i.e enter_vmx_usercopy could be in preemptible
context. First thing enter_vmx_usercopy does is, preempt_disable and
again function exit of exit_vmx_usercopy maybe preemptible too. 
So make these as notrace to avoid these bug reports.

WARNING: [amr != AMR_KUAP_BLOCKED] ./arch/powerpc/include/asm/book3s/64/kup.h:293
at arch_local_irq_restore.part.0+0x1e8/0x224, CPU#15: stress-ng-pipe/11623
NIP [c000000000038830] arch_local_irq_restore.part.0+0x1e8/0x224
LR [c00000000003871c] arch_local_irq_restore.part.0+0xd4/0x224
Call Trace:
return_to_handler+0x0/0x4c (unreliable)
__rb_reserve_next+0x198/0x4f8
ring_buffer_lock_reserve+0x1a8/0x51c
trace_buffer_lock_reserve+0x30/0x80
__graph_entry.isra.0+0x118/0x140
function_graph_enter_regs+0x1ec/0x408
ftrace_graph_func+0x50/0xcc
ftrace_call+0x4/0x4c
enable_kernel_altivec+0x10/0xd0
enter_vmx_usercopy+0x58/0x74
return_to_handler+0x0/0x4c (__copy_tofrom_user_power7+0x278/0x7ac)
_copy_from_iter+0x134/0x9bc
copy_page_from_iter+0xd4/0x1a0

Since AMR registers aren't set to BLOCKED state, warnings could be seen
if there is any unlock involved, which gets triggered via
arch_local_irq_restore. So had to for that enable_kernel_altivec too. 
Similarly for check_if_tm_restore_required, giveup_altivec.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/kernel/process.c | 10 +++++-----
 arch/powerpc/lib/vmx-helper.c |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index a45fe147868b..7bf2fe3e5878 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -80,7 +80,7 @@
  */
 bool tm_suspend_disabled __ro_after_init = false;
 
-static void check_if_tm_restore_required(struct task_struct *tsk)
+notrace static void check_if_tm_restore_required(struct task_struct *tsk)
 {
 	/*
 	 * If we are saving the current thread's registers, and the
@@ -98,7 +98,7 @@ static void check_if_tm_restore_required(struct task_struct *tsk)
 }
 
 #else
-static inline void check_if_tm_restore_required(struct task_struct *tsk) { }
+static __always_inline void check_if_tm_restore_required(struct task_struct *tsk) { }
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
 
 bool strict_msr_control;
@@ -231,7 +231,7 @@ static inline void __giveup_fpu(struct task_struct *tsk) { }
 #endif /* CONFIG_PPC_FPU */
 
 #ifdef CONFIG_ALTIVEC
-static void __giveup_altivec(struct task_struct *tsk)
+notrace static void __giveup_altivec(struct task_struct *tsk)
 {
 	unsigned long msr;
 
@@ -243,7 +243,7 @@ static void __giveup_altivec(struct task_struct *tsk)
 	regs_set_return_msr(tsk->thread.regs, msr);
 }
 
-void giveup_altivec(struct task_struct *tsk)
+notrace void giveup_altivec(struct task_struct *tsk)
 {
 	check_if_tm_restore_required(tsk);
 
@@ -253,7 +253,7 @@ void giveup_altivec(struct task_struct *tsk)
 }
 EXPORT_SYMBOL(giveup_altivec);
 
-void enable_kernel_altivec(void)
+notrace void enable_kernel_altivec(void)
 {
 	unsigned long cpumsr;
 
diff --git a/arch/powerpc/lib/vmx-helper.c b/arch/powerpc/lib/vmx-helper.c
index 54340912398f..a0c041c148e4 100644
--- a/arch/powerpc/lib/vmx-helper.c
+++ b/arch/powerpc/lib/vmx-helper.c
@@ -10,7 +10,7 @@
 #include <linux/hardirq.h>
 #include <asm/switch_to.h>
 
-int enter_vmx_usercopy(void)
+notrace int enter_vmx_usercopy(void)
 {
 	if (in_interrupt())
 		return 0;
@@ -32,7 +32,7 @@ int enter_vmx_usercopy(void)
  * This function must return 0 because we tail call optimise when calling
  * from __copy_tofrom_user_power7 which returns 0 on success.
  */
-int exit_vmx_usercopy(void)
+notrace int exit_vmx_usercopy(void)
 {
 	disable_kernel_altivec();
 	pagefault_enable();
-- 
2.47.3


