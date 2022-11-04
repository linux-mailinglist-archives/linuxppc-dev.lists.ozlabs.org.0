Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E398619EC6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 18:32:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3nlD0lC9z3f8F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Nov 2022 04:32:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DaFOcu9/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DaFOcu9/;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3nfD34LPz30JR
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Nov 2022 04:28:36 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A4GEwK5029774;
	Fri, 4 Nov 2022 17:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=7cVmJ3W/2TBphlQ1zr5Zl17YKOTb+bUNQ1avlTAX5Ck=;
 b=DaFOcu9/ZNHaAg9VzNffnbEi85387ZdTll6onS5wBHsJ4N8kR0DPgT9x1e7gDlyN4+qD
 JndoP+Qg61RUanQtq6+rslngY3OPj65GITvSfBdXKNeFUqGFGgovwhxRy74NUy0xY/yr
 vl/muS8q1vs6+fQ7KSQKjTm3EYG4DCS3htBNuqXSox/nLwsOnM9zOUw30ffnOwIozUYl
 fgI9AD2CauYGOuJewDdutGeuU1Q7GVtIm+ECTzuL0zOJLyijJKk7fn5O0wzGYpScdeSS
 MWR5SaI0LpYbjgx4TL24Q0i7TZJ6YH5Gf8Q1DfDSz8HGR+ow+Mk/R+KFyEiHtdZMJVce tw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmpt1fewx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Nov 2022 17:28:27 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A4HKYdp011352;
	Fri, 4 Nov 2022 17:28:25 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3kgut92qu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Nov 2022 17:28:25 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A4HSM7x3080860
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Nov 2022 17:28:22 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D366211C04C;
	Fri,  4 Nov 2022 17:28:22 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 33E4511C04A;
	Fri,  4 Nov 2022 17:28:22 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri,  4 Nov 2022 17:28:22 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ibmuc.com (unknown [9.43.196.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0204160100;
	Sat,  5 Nov 2022 04:28:18 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 5/6] powerpc/powernv/idle: Convert stack pointer to physical address
Date: Sat,  5 Nov 2022 04:27:36 +1100
Message-Id: <20221104172737.391978-6-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104172737.391978-1-ajd@linux.ibm.com>
References: <20221104172737.391978-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rvjSQDtyqUCtO3CHgF32NfQZ6Pt3cbA7
X-Proofpoint-ORIG-GUID: rvjSQDtyqUCtO3CHgF32NfQZ6Pt3cbA7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_11,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211040108
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
Cc: linux-hardening@vger.kernel.org, cmr@bluescreens.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When we go into idle, we must disable the MMU. Currently, we can still
access the stack once the MMU is disabled, because the stack is in the
linear map.

Once we enable CONFIG_VMAP_STACK, the normal stack pointer will be in the
vmalloc area. To cope with this, manually convert the stack pointer to a
physical address using stack_pa() before going into idle, and restore the
original pointer on the way back out.

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

---

This currently doesn't boot on my POWER9. I'm also going to clean this up
to use the helpers from earlier in this series.
---
 arch/powerpc/platforms/powernv/idle.c | 47 +++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 841cb7f31f4f..6430fb488981 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -22,6 +22,7 @@
 #include <asm/smp.h>
 #include <asm/runlatch.h>
 #include <asm/dbell.h>
+#include <asm/reg.h>
 
 #include "powernv.h"
 #include "subcore.h"
@@ -509,6 +510,11 @@ static unsigned long power7_offline(void)
 {
 	unsigned long srr1;
 
+#ifdef CONFIG_VMAP_STACK
+	unsigned long ksp_ea = current_stack_pointer;
+	current_stack_pointer = (unsigned long)stack_pa((void *)ksp_ea);
+#endif
+
 	mtmsr(MSR_IDLE);
 
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
@@ -543,6 +549,9 @@ static unsigned long power7_offline(void)
 		srr1 = idle_kvm_start_guest(srr1);
 #endif
 
+#ifdef CONFIG_VMAP_STACK
+	current_stack_pointer = ksp_ea;
+#endif
 	mtmsr(MSR_KERNEL);
 
 	return srr1;
@@ -552,14 +561,24 @@ static unsigned long power7_offline(void)
 void power7_idle_type(unsigned long type)
 {
 	unsigned long srr1;
+#ifdef CONFIG_VMAP_STACK
+	unsigned long ksp_ea;
+#endif
 
 	if (!prep_irq_for_idle_irqsoff())
 		return;
 
+#ifdef CONFIG_VMAP_STACK
+	ksp_ea = current_stack_pointer;
+	current_stack_pointer = (unsigned long)stack_pa((void *)ksp_ea);
+#endif
 	mtmsr(MSR_IDLE);
 	__ppc64_runlatch_off();
 	srr1 = power7_idle_insn(type);
 	__ppc64_runlatch_on();
+#ifdef CONFIG_VMAP_STACK
+	current_stack_pointer = ksp_ea;
+#endif
 	mtmsr(MSR_KERNEL);
 
 	fini_irq_for_idle_irqsoff();
@@ -615,6 +634,9 @@ static unsigned long power9_idle_stop(unsigned long psscr)
 	unsigned long mmcra = 0;
 	struct p9_sprs sprs = {}; /* avoid false used-uninitialised */
 	bool sprs_saved = false;
+#ifdef CONFIG_VMAP_STACK
+	unsigned long ksp_ea;
+#endif
 
 	if (!(psscr & (PSSCR_EC|PSSCR_ESL))) {
 		/* EC=ESL=0 case */
@@ -633,7 +655,7 @@ static unsigned long power9_idle_stop(unsigned long psscr)
 		 */
 		BUG_ON((srr1 & SRR1_WAKESTATE) != SRR1_WS_NOLOSS);
 
-		goto out;
+		goto out_noloss;
 	}
 
 	/* EC=ESL=1 case */
@@ -688,6 +710,10 @@ static unsigned long power9_idle_stop(unsigned long psscr)
 	sprs.iamr	= mfspr(SPRN_IAMR);
 	sprs.uamor	= mfspr(SPRN_UAMOR);
 
+#ifdef CONFIG_VMAP_STACK
+	ksp_ea = current_stack_pointer;
+	current_stack_pointer = (unsigned long)stack_pa((void *)ksp_ea);
+#endif
 	srr1 = isa300_idle_stop_mayloss(psscr);		/* go idle */
 
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
@@ -797,6 +823,10 @@ static unsigned long power9_idle_stop(unsigned long psscr)
 		__slb_restore_bolted_realmode();
 
 out:
+#ifdef CONFIG_VMAP_STACK
+	current_stack_pointer = ksp_ea;
+#endif
+out_noloss:
 	mtmsr(MSR_KERNEL);
 
 	return srr1;
@@ -898,6 +928,9 @@ static unsigned long power10_idle_stop(unsigned long psscr)
 	unsigned long pls;
 //	struct p10_sprs sprs = {}; /* avoid false used-uninitialised */
 	bool sprs_saved = false;
+#ifdef CONFIG_VMAP_STACK
+	unsigned long ksp_ea;
+#endif
 
 	if (!(psscr & (PSSCR_EC|PSSCR_ESL))) {
 		/* EC=ESL=0 case */
@@ -916,7 +949,7 @@ static unsigned long power10_idle_stop(unsigned long psscr)
 		 */
 		BUG_ON((srr1 & SRR1_WAKESTATE) != SRR1_WS_NOLOSS);
 
-		goto out;
+		goto out_noloss;
 	}
 
 	/* EC=ESL=1 case */
@@ -927,7 +960,11 @@ static unsigned long power10_idle_stop(unsigned long psscr)
 
 		atomic_start_thread_idle();
 	}
-
+#ifdef CONFIG_VMAP_STACK
+	ksp_ea = current_stack_pointer;
+	current_stack_pointer = (unsigned long)stack_pa((void *)ksp_ea);
+#endif /* CONFIG_VMAP_STACK */
+	mtmsr(MSR_IDLE);
 	srr1 = isa300_idle_stop_mayloss(psscr);		/* go idle */
 
 	psscr = mfspr(SPRN_PSSCR);
@@ -982,6 +1019,10 @@ static unsigned long power10_idle_stop(unsigned long psscr)
 		__slb_restore_bolted_realmode();
 
 out:
+#ifdef CONFIG_VMAP_STACK
+	current_stack_pointer = ksp_ea;
+#endif /* CONFIG_VMAP_STACK */
+out_noloss:
 	mtmsr(MSR_KERNEL);
 
 	return srr1;
-- 
2.38.1

