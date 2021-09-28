Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD3441B98D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 23:43:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJtKl0H6jz2ywg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 07:43:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kFVCci/9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kFVCci/9; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJtJB1Y1wz2xXc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 07:42:02 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18SKfgWL010614; 
 Tue, 28 Sep 2021 17:41:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+LVqXpuf5OlJVSSM95gG0F6vc1C0KHn20pXUd7MtITY=;
 b=kFVCci/9yKA77C3+aqs4bLIwcs4GgXwQQL/NppGFxjhXNRwuOHoMtmgP/IqjmuoLh8I2
 +pbzZuOnLLAjMpcGIqLTENDbuyEcvn8VTy4AXIQdibYL7zmjqxL35W3pglPxgYDtPzaY
 +UGIY/7Mc+qWwZWRLQo4+oeXbiIPnXt9Vmhnbok9ieTbOu3AjhiO2mSnF7PGh4rUtpsy
 hNFhLFEXkyEjQA1eU01qIPivwOSafLR4k3/mNj/f49CN9MMAIURwxe8hlhKsXaYlKNF/
 En9RBJOGefYsgFkNTSFTdVscoIxoxLEH1XrGWMWmwLj7SAq8xjnVseT6hsGbfOFTtJAD xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bcaa8s2q0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 17:41:55 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18SLRnkv035097;
 Tue, 28 Sep 2021 17:41:55 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bcaa8s2pt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 17:41:55 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18SLbCQs017122;
 Tue, 28 Sep 2021 21:41:54 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma05wdc.us.ibm.com with ESMTP id 3b9udbcb82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 21:41:54 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18SLfrLA11796772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Sep 2021 21:41:53 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C63B16A057;
 Tue, 28 Sep 2021 21:41:53 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0D0B6A047;
 Tue, 28 Sep 2021 21:41:53 +0000 (GMT)
Received: from localhost (unknown [9.211.96.63])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 28 Sep 2021 21:41:53 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] powerpc/paravirt: correct preempt debug splat in
 vcpu_is_preempted()
Date: Tue, 28 Sep 2021 16:41:47 -0500
Message-Id: <20210928214147.312412-3-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928214147.312412-1-nathanl@linux.ibm.com>
References: <20210928214147.312412-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6YaREQVzLdXagMRtAKrqPfxukHbL8J5O
X-Proofpoint-ORIG-GUID: _nUFcaysbo0cHzHWgAeOAt1JiK8xy_qF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_10,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=867 impostorscore=0 mlxscore=0 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2109280126
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
Cc: srikar@linux.vnet.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

vcpu_is_preempted() can be used outside of preempt-disabled critical
sections, yielding warnings such as:

BUG: using smp_processor_id() in preemptible [00000000] code: systemd-udevd/185
caller is rwsem_spin_on_owner+0x1cc/0x2d0
CPU: 1 PID: 185 Comm: systemd-udevd Not tainted 5.15.0-rc2+ #33
Call Trace:
[c000000012907ac0] [c000000000aa30a8] dump_stack_lvl+0xac/0x108 (unreliable)
[c000000012907b00] [c000000001371f70] check_preemption_disabled+0x150/0x160
[c000000012907b90] [c0000000001e0e8c] rwsem_spin_on_owner+0x1cc/0x2d0
[c000000012907be0] [c0000000001e1408] rwsem_down_write_slowpath+0x478/0x9a0
[c000000012907ca0] [c000000000576cf4] filename_create+0x94/0x1e0
[c000000012907d10] [c00000000057ac08] do_symlinkat+0x68/0x1a0
[c000000012907d70] [c00000000057ae18] sys_symlink+0x58/0x70
[c000000012907da0] [c00000000002e448] system_call_exception+0x198/0x3c0
[c000000012907e10] [c00000000000c54c] system_call_common+0xec/0x250

The result of vcpu_is_preempted() is always used speculatively, and the
function does not access per-cpu resources in a (Linux) preempt-unsafe way.
Use raw_smp_processor_id() to avoid such warnings, adding explanatory
comments.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Fixes: ca3f969dcb11 ("powerpc/paravirt: Use is_kvm_guest() in vcpu_is_preempted()")
---
 arch/powerpc/include/asm/paravirt.h | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
index 39f173961f6a..eb7df559ae74 100644
--- a/arch/powerpc/include/asm/paravirt.h
+++ b/arch/powerpc/include/asm/paravirt.h
@@ -110,7 +110,23 @@ static inline bool vcpu_is_preempted(int cpu)
 
 #ifdef CONFIG_PPC_SPLPAR
 	if (!is_kvm_guest()) {
-		int first_cpu = cpu_first_thread_sibling(smp_processor_id());
+		int first_cpu;
+
+		/*
+		 * The result of vcpu_is_preempted() is used in a
+		 * speculative way, and is always subject to invalidation
+		 * by events internal and external to Linux. While we can
+		 * be called in preemptable context (in the Linux sense),
+		 * we're not accessing per-cpu resources in a way that can
+		 * race destructively with Linux scheduler preemption and
+		 * migration, and callers can tolerate the potential for
+		 * error introduced by sampling the CPU index without
+		 * pinning the task to it. So it is permissible to use
+		 * raw_smp_processor_id() here to defeat the preempt debug
+		 * warnings that can arise from using smp_processor_id()
+		 * in arbitrary contexts.
+		 */
+		first_cpu = cpu_first_thread_sibling(raw_smp_processor_id());
 
 		/*
 		 * The PowerVM hypervisor dispatches VMs on a whole core
-- 
2.31.1

