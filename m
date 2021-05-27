Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A34392438
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 03:16:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fr8zW53KQz308v
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 11:16:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IKu6+22d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IKu6+22d; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fr8yt6SDHz2xtt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 May 2021 11:16:06 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14R13fVx161081; Wed, 26 May 2021 21:15:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=uoDnx37knpfabnI1mSB5/+/NBx7pLI1OX8U45RUu/XM=;
 b=IKu6+22dri3PEu5Vr/cvElvd5cuWq63dW1spNW2rkjth7Hk5Hz20oWEGCV4Y0/1VDkvv
 En6DZQim15FmL2CY2vbi9xNkBSS9KXFyivpl4j7s9ezOqniTg8452oQUo31o000keI67
 1VfOxOxpaksF7Xi2YfsPuRadyTFk1Y7vIgRonJLF5/xSgPN+i3WpIWc4pFnlGaCcYWcQ
 bqNaaghMnnPizZwjUX/Vqy03mq1rfdKL12j9G3xZYPCGTVS9HSkf/F7jxy51/21TA1nJ
 r0u6GnrFX6OMjXBo1E+L5GSJmOszagbSWLcS2bsWE5a97ERAs56P7WSdO9qY7FV2y9Gh FA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38t0xkgrgm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 May 2021 21:15:53 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14R13x0G161887;
 Wed, 26 May 2021 21:15:52 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38t0xkgrg8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 May 2021 21:15:52 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14R18bja027156;
 Thu, 27 May 2021 01:15:52 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 38s1qdcv4k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 May 2021 01:15:52 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14R1Fpkh22086020
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 May 2021 01:15:51 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 352156A04D;
 Thu, 27 May 2021 01:15:51 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 013E16A051;
 Thu, 27 May 2021 01:15:50 +0000 (GMT)
Received: from localhost (unknown [9.211.47.27])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 27 May 2021 01:15:50 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/stacktrace: fix raise_backtrace_ipi() logic
Date: Wed, 26 May 2021 20:15:50 -0500
Message-Id: <20210527011550.235443-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: v9q2PpxTdosbwkt2cZr0AxacsgwJF4Ll
X-Proofpoint-GUID: nmx2rdPfT0svTJJmtFZJ1ay9YxxxYJRb
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-26_13:2021-05-26,
 2021-05-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105270005
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
Cc: npiggin@gmail.com, paulus@samba.org, clg@kaod.org, ldufour@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When smp_send_safe_nmi_ipi() indicates that the target CPU has
responded to the IPI, skip the remote paca inspection
fallback. Otherwise both the sending and target CPUs attempt the
backtrace, usually creating a misleading ("didn't respond to backtrace
IPI" is wrong) and interleaved mess:

[ 1658.929157][    C7] rcu: Stack dump where RCU GP kthread last ran:
[ 1658.929223][    C7] Sending NMI from CPU 7 to CPUs 1:
[ 1658.929303][    C1] NMI backtrace for cpu 1
[ 1658.929303][    C7] CPU 1 didn't respond to backtrace IPI, inspecting paca.
[ 1658.929362][    C1] CPU: 1 PID: 325 Comm: kworker/1:1H Tainted: G        W   E     5.13.0-rc2+ #46
[ 1658.929405][    C7] irq_soft_mask: 0x01 in_mce: 0 in_nmi: 0 current: 325 (kworker/1:1H)
[ 1658.929465][    C1] Workqueue: events_highpri test_work_fn [test_lockup]
[ 1658.929549][    C7] Back trace of paca->saved_r1 (0xc0000000057fb400) (possibly stale):
[ 1658.929592][    C1] NIP:  c00000000002cf50 LR: c008000000820178 CTR: c00000000002cfa0

Verified using the test_lockup module, e.g.

$ echo 5 > /sys/module/rcupdate/parameters/rcu_cpu_stall_timeout
$ insmod test_lockup.ko time_secs=1 iterations=10 state=R lock_rcu \
  touch_softlockup all_cpus

Fixes: 5cc05910f26e ("powerpc/64s: Wire up arch_trigger_cpumask_backtrace()")
Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/stacktrace.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
index 1deb1bf331dd..e0ccc5a46d7e 100644
--- a/arch/powerpc/kernel/stacktrace.c
+++ b/arch/powerpc/kernel/stacktrace.c
@@ -174,11 +174,14 @@ static void raise_backtrace_ipi(cpumask_t *mask)
 {
 	unsigned int cpu;
 
+	if (cpumask_test_cpu(smp_processor_id(), mask)) {
+		handle_backtrace_ipi(NULL);
+		cpumask_clear_cpu(smp_processor_id(), mask);
+	}
+
 	for_each_cpu(cpu, mask) {
-		if (cpu == smp_processor_id())
-			handle_backtrace_ipi(NULL);
-		else
-			smp_send_safe_nmi_ipi(cpu, handle_backtrace_ipi, 5 * USEC_PER_SEC);
+		if (smp_send_safe_nmi_ipi(cpu, handle_backtrace_ipi, 5 * USEC_PER_SEC))
+			cpumask_clear_cpu(cpu, mask);
 	}
 
 	for_each_cpu(cpu, mask) {
-- 
2.31.1

