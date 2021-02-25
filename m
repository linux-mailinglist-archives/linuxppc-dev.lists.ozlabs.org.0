Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDAA324DAB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 11:11:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmT8Y1tSwz3ck3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 21:11:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SD5J+Yhj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SD5J+Yhj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmT851jtcz30JR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 21:11:00 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11PA4FFv097042; Thu, 25 Feb 2021 05:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=OYvj1Zh3rGMNnrX1SltYYh+MhX+FhN1qeEceuBgI24k=;
 b=SD5J+YhjXoJ4iL0fyB/i1gteoJbBdcUbXoxK32/dZNupSYUaQl9Kkb+Tc93UJXI4yKcx
 H8LQuK7SGa4AgiIsX1fDeMhM3z7Qlwl9SAsZEsoWCoBkLP/NcgWkkRayF7XDBT796GTy
 hK+/L5g3JSIQoqbtBX6OCuwvWJPSAG2nRbA/2L2u0uPxdhLtJuTZAmXPUEzlrJyjtbEh
 V0RnROBW/KJ8rgU48tLiXG03V1qrZVPh0vnCbAuY0NASlINKVQjsfzxLohFWB9WRakNh
 FJt1bKip+7tK0mBDMV8jg8zGkapF/RcMrIjKLhZieCCA5SeB/JAYEvnXaVJglsy2Gp/n sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36wmfx6ahx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 05:10:48 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11PA4Lmj097596;
 Thu, 25 Feb 2021 05:10:47 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36wmfx6ah9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 05:10:47 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11PA9NHn025560;
 Thu, 25 Feb 2021 10:10:45 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 36tt28t9cy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 10:10:45 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11PAAg3B46268820
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Feb 2021 10:10:43 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D232C4C052;
 Thu, 25 Feb 2021 10:10:42 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B1DB4C046;
 Thu, 25 Feb 2021 10:10:40 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.195.39.239])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 25 Feb 2021 10:10:40 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2] powerpc/perf: Fix handling of privilege level checks in
 perf interrupt context
Date: Thu, 25 Feb 2021 05:10:39 -0500
Message-Id: <1614247839-1428-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-25_06:2021-02-24,
 2021-02-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 adultscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102250081
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: maddy@linux.ibm.com, peterz@infradead.org, omosnace@redhat.com,
 acme@kernel.org, jolsa@kernel.org, linuxppc-dev@lists.ozlabs.org,
 kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Running "perf mem record" in powerpc platforms with selinux enabled
resulted in soft lockup's. Below call-trace was seen in the logs:

CPU: 58 PID: 3751 Comm: sssd_nss Not tainted 5.11.0-rc7+ #2
NIP:  c000000000dff3d4 LR: c000000000dff3d0 CTR: 0000000000000000
REGS: c000007fffab7d60 TRAP: 0100   Not tainted  (5.11.0-rc7+)
<<>>
NIP [c000000000dff3d4] _raw_spin_lock_irqsave+0x94/0x120
LR [c000000000dff3d0] _raw_spin_lock_irqsave+0x90/0x120
Call Trace:
[c00000000fd471a0] [c00000000fd47260] 0xc00000000fd47260 (unreliable)
[c00000000fd471e0] [c000000000b5fbbc] skb_queue_tail+0x3c/0x90
[c00000000fd47220] [c000000000296edc] audit_log_end+0x6c/0x180
[c00000000fd47260] [c0000000006a3f20] common_lsm_audit+0xb0/0xe0
[c00000000fd472a0] [c00000000066c664] slow_avc_audit+0xa4/0x110
[c00000000fd47320] [c00000000066cff4] avc_has_perm+0x1c4/0x260
[c00000000fd47430] [c00000000066e064] selinux_perf_event_open+0x74/0xd0
[c00000000fd47450] [c000000000669888] security_perf_event_open+0x68/0xc0
[c00000000fd47490] [c00000000013d788] record_and_restart+0x6e8/0x7f0
[c00000000fd476c0] [c00000000013dabc] perf_event_interrupt+0x22c/0x560
[c00000000fd477d0] [c00000000002d0fc] performance_monitor_exception0x4c/0x60
[c00000000fd477f0] [c00000000000b378] performance_monitor_common_virt+0x1c8/0x1d0
interrupt: f00 at _raw_spin_lock_irqsave+0x38/0x120
NIP:  c000000000dff378 LR: c000000000b5fbbc CTR: c0000000007d47f0
REGS: c00000000fd47860 TRAP: 0f00   Not tainted  (5.11.0-rc7+)
<<>>
NIP [c000000000dff378] _raw_spin_lock_irqsave+0x38/0x120
LR [c000000000b5fbbc] skb_queue_tail+0x3c/0x90
interrupt: f00
[c00000000fd47b00] [0000000000000038] 0x38 (unreliable)
[c00000000fd47b40] [c00000000aae6200] 0xc00000000aae6200
[c00000000fd47b80] [c000000000296edc] audit_log_end+0x6c/0x180
[c00000000fd47bc0] [c00000000029f494] audit_log_exit+0x344/0xf80
[c00000000fd47d10] [c0000000002a2b00] __audit_syscall_exit+0x2c0/0x320
[c00000000fd47d60] [c000000000032878] do_syscall_trace_leave+0x148/0x200
[c00000000fd47da0] [c00000000003d5b4] syscall_exit_prepare+0x324/0x390
[c00000000fd47e10] [c00000000000d76c] system_call_common+0xfc/0x27c

The above trace shows that while the CPU was handling a performance
monitor exception, there was a call to "security_perf_event_open"
function. In powerpc core-book3s, this function is called from
'perf_allow_kernel' check during recording of data address in the sample
via perf_get_data_addr().

Commit da97e18458fb ("perf_event: Add support for LSM and SELinux checks")
introduced security enhancements to perf. As part of this commit, the new
security hook for perf_event_open was added in all places where perf
paranoid check was previously used. In powerpc core-book3s code, originally
had paranoid checks in 'perf_get_data_addr' and 'power_pmu_bhrb_read'. So
'perf_paranoid_kernel' checks were replaced with 'perf_allow_kernel' in
these pmu helper functions as well.

The intention of paranoid checks in core-book3s was to verify privilege
access before capturing some of the sample data. Along with paranoid
checks, 'perf_allow_kernel' also does a 'security_perf_event_open'. Since
these functions are accessed while recording sample, we end up in calling
selinux_perf_event_open in PMI context. Some of the security functions
use spinlock like sidtab_sid2str_put(). If a perf interrupt hits under
a spin lock and if we end up in calling selinux hook functions in PMI
handler, this could cause a dead lock.

Since the purpose of this security hook is to control access to
perf_event_open, it is not right to call this in interrupt context.
The paranoid checks in powerpc core-book3s were done at interrupt
time which is also not correct.
Reference commits:
Commit cd1231d7035f ("powerpc/perf: Prevent kernel address leak via
perf_get_data_addr()")
Commit bb19af816025 ("powerpc/perf: Prevent kernel address leak to
userspace via BHRB buffer")

We only allow creation of events that has already passed the privilege
checks in perf_event_open. So these paranoid checks are not needed at
event time. As a fix, patch uses 'event->attr.exclude_kernel' check
to prevent exposing kernel address for userspace only sampling.

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changes in v2:
- Addressed review comments from Ondrej Mosnacek and Peter Zijlstra.
  Changed the approach to use 'event->attr.exclude_kernel'
  check to prevent exposing kernel address for userspace only
  sampling as suggested by Ondrej Mosnacek.

 arch/powerpc/perf/core-book3s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 4b4319d8..c8be44c 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -222,7 +222,7 @@ static inline void perf_get_data_addr(struct perf_event *event, struct pt_regs *
 	if (!(mmcra & MMCRA_SAMPLE_ENABLE) || sdar_valid)
 		*addrp = mfspr(SPRN_SDAR);
 
-	if (is_kernel_addr(mfspr(SPRN_SDAR)) && perf_allow_kernel(&event->attr) != 0)
+	if (is_kernel_addr(mfspr(SPRN_SDAR)) && event->attr.exclude_kernel)
 		*addrp = 0;
 }
 
@@ -507,7 +507,7 @@ static void power_pmu_bhrb_read(struct perf_event *event, struct cpu_hw_events *
 			 * addresses, hence include a check before filtering code
 			 */
 			if (!(ppmu->flags & PPMU_ARCH_31) &&
-				is_kernel_addr(addr) && perf_allow_kernel(&event->attr) != 0)
+			    is_kernel_addr(addr) && event->attr.exclude_kernel)
 				continue;
 
 			/* Branches are read most recent first (ie. mfbhrb 0 is
-- 
1.8.3.1

