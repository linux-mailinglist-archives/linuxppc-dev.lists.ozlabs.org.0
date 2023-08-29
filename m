Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAD178BE8C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 08:37:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XYXotIRc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZd5K0VVMz3c1Y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 16:37:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XYXotIRc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZd332N3Vz3bYt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 16:35:27 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37T5Y9uF001634
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HmYs2hE1Z9PTqCeG7TiEEcathrkvp+tOVFIDCmFNVAE=;
 b=XYXotIRc6ibXe/otDRRVtnqd1vlhrQbkQdw4EC4+uv+EMjycyowOPKwLQik7GHXkqJfD
 5hI0vorzBLBWDkmgKYS8IZh5p+nFLRZlX3no+T4zykCx6IOScTkTrFND36hWhVhtP+KR
 IcDvXAH2z4nCfYZqpIfv7mMc8M67abquRKXGnv6Obre3aapAx6pqex/m/ia6PUEePNfe
 RuArnBKJF24b/JlGFMUVCVuq/BJJeQCMVMM4ktL8Je4QPb43vvcp9+f9Kwf5p2TW5YHM
 dFapzNdk8Atx3lruR+9eCs/SnZI6BXVtoddMsggSyoESIpv4kg79GjRXCAdwdZc2w6iC nw== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3srv4ywur5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:35:24 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37T50GvR014331
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:35:19 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sqvqn19eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:35:18 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37T6ZGw424773344
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:35:16 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CBD782004D
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:35:16 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4EAE020043
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:35:16 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:35:16 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8419960595;
	Tue, 29 Aug 2023 16:35:13 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc/watchpoints: Disable preemption in thread_change_pc()
Date: Tue, 29 Aug 2023 16:34:55 +1000
Message-ID: <20230829063457.54157-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829063457.54157-1-bgray@linux.ibm.com>
References: <20230829063457.54157-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QjMYcHKWHCZ5MGH2vQhgVRn3L4mVzkD0
X-Proofpoint-GUID: QjMYcHKWHCZ5MGH2vQhgVRn3L4mVzkD0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_03,2023-08-28_04,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2308290056
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

thread_change_pc() uses CPU local data, so must be protected from
swapping CPUs while it is reading the breakpoint struct.

The error is more noticeable after 1e60f3564bad ("powerpc/watchpoints:
Track perf single step directly on the breakpoint"), which added an
unconditional __this_cpu_read() call in thread_change_pc(). However the
existing __this_cpu_read() that runs if a breakpoint does need to be
re-inserted has the same issue.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

There's probably a more idiomatic way to express this. We technically
don't need to disable preemption for the entire function: we should only
need to disable preemption within each loop iteration while handling the
pointer we are working with. Each iteration itself is independent.
---
 arch/powerpc/kernel/hw_breakpoint.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index b8513dc3e53a..2854376870cf 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -230,13 +230,15 @@ void thread_change_pc(struct task_struct *tsk, struct pt_regs *regs)
 	struct arch_hw_breakpoint *info;
 	int i;
 
+	preempt_disable();
+
 	for (i = 0; i < nr_wp_slots(); i++) {
 		struct perf_event *bp = __this_cpu_read(bp_per_reg[i]);
 
 		if (unlikely(bp && counter_arch_bp(bp)->perf_single_step))
 			goto reset;
 	}
-	return;
+	goto out;
 
 reset:
 	regs_set_return_msr(regs, regs->msr & ~MSR_SE);
@@ -245,6 +247,9 @@ void thread_change_pc(struct task_struct *tsk, struct pt_regs *regs)
 		__set_breakpoint(i, info);
 		info->perf_single_step = false;
 	}
+
+out:
+	preempt_enable();
 }
 
 static bool is_larx_stcx_instr(int type)
-- 
2.41.0

