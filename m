Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B64218BD27E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 18:20:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DrIDc9wr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VY68X1xD2z3cb4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 02:20:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DrIDc9wr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VY65v5nFMz3cM7
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 02:18:27 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 446GIH6C023385;
	Mon, 6 May 2024 16:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=YI+s/9jNr6WRySWWHUvNpGEk6ucoohYRHUK1CkL4ZOQ=;
 b=DrIDc9wrs64KSTS+uTmGrgrgoiJrK3Er+nI/XHpyaMmoksdxb4gTTn2YCkyQj3FD5hrh
 7SPIxUpOPC/7IEY1FV5TpCTroobr6L7L0e+UuYReWiJTuUYJvDlrnkZ+48MDUc4e+581
 /QVXR7JFBQVlSfbHEdHOR/bx1cZi5Y6Dd1RelfPLUcIdo/PxZJ40CxDSWu20KlPqHFrB
 xmvn9nCM+CRKIe4rkI0ZMfFLiOm7aKWiMfhx3hQMLbJ1zv4TfCDpCwH+08jX+JLkFa69
 8EXSmZAoLDuQ65L9phdTYTzn0bEUJ/ppN8PYbvHDIMsK2lg4DP09lOGAZ/vtYvwYxs2d ig== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xy2kt800h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 16:18:21 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 446GIKBd023408;
	Mon, 6 May 2024 16:18:20 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xy2kt800f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 16:18:20 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 446F0Gcx030859;
	Mon, 6 May 2024 16:18:20 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xwybts4ds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 16:18:20 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 446GIEPQ18547032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 May 2024 16:18:16 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B2B1E20040;
	Mon,  6 May 2024 16:18:14 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3639220043;
	Mon,  6 May 2024 16:18:10 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com.com (unknown [9.43.105.31])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 May 2024 16:18:09 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen.n.rao@linux.ibm.com
Subject: [PATCH 3/3] arch/powerpc/kvm: Reduce lock contention by moving spinlock from ics to irq_state
Date: Mon,  6 May 2024 21:47:31 +0530
Message-ID: <20240506161735.83358-4-gautam@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240506161735.83358-1-gautam@linux.ibm.com>
References: <20240506161735.83358-1-gautam@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4gipCWtZDXNoC-sVQctrGEDKavqn7ILJ
X-Proofpoint-GUID: yRPT_3qffr7ZSW7TOzde6sRtrfcS9e1U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_11,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=559 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2405060114
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
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Take a spinlock on state of an IRQ instead of an entire ICS. This
improves scalability by reducing contention.

Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv_rm_xics.c |  8 ++---
 arch/powerpc/kvm/book3s_xics.c       | 44 ++++++++++++----------------
 arch/powerpc/kvm/book3s_xics.h       |  2 +-
 3 files changed, 23 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_rm_xics.c b/arch/powerpc/kvm/book3s_hv_rm_xics.c
index e42984878503..178bc869b519 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_xics.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_xics.c
@@ -308,7 +308,7 @@ static void icp_rm_deliver_irq(struct kvmppc_xics *xics, struct kvmppc_icp *icp,
 	state = &ics->irq_state[src];
 
 	/* Get a lock on the ICS */
-	arch_spin_lock(&ics->lock);
+	arch_spin_lock(&state->lock);
 
 	/* Get our server */
 	if (!icp || state->server != icp->server_num) {
@@ -368,7 +368,7 @@ static void icp_rm_deliver_irq(struct kvmppc_xics *xics, struct kvmppc_icp *icp,
 		 * Delivery was successful, did we reject somebody else ?
 		 */
 		if (reject && reject != XICS_IPI) {
-			arch_spin_unlock(&ics->lock);
+			arch_spin_unlock(&state->lock);
 			icp->n_reject++;
 			new_irq = reject;
 			check_resend = 0;
@@ -397,13 +397,13 @@ static void icp_rm_deliver_irq(struct kvmppc_xics *xics, struct kvmppc_icp *icp,
 		smp_mb();
 		if (!icp->state.need_resend) {
 			state->resend = 0;
-			arch_spin_unlock(&ics->lock);
+			arch_spin_unlock(&state->lock);
 			check_resend = 0;
 			goto again;
 		}
 	}
  out:
-	arch_spin_unlock(&ics->lock);
+	arch_spin_unlock(&state->lock);
 }
 
 static void icp_rm_down_cppr(struct kvmppc_xics *xics, struct kvmppc_icp *icp,
diff --git a/arch/powerpc/kvm/book3s_xics.c b/arch/powerpc/kvm/book3s_xics.c
index 1dc2f77571e7..466c92cf49fb 100644
--- a/arch/powerpc/kvm/book3s_xics.c
+++ b/arch/powerpc/kvm/book3s_xics.c
@@ -36,21 +36,13 @@
  * LOCKING
  * =======
  *
- * Each ICS has a spin lock protecting the information about the IRQ
- * sources and avoiding simultaneous deliveries of the same interrupt.
+ * Each IRQ has a spin lock protecting its state sources and avoiding
+ * simultaneous deliveries of the same interrupt.
  *
  * ICP operations are done via a single compare & swap transaction
  * (most ICP state fits in the union kvmppc_icp_state)
  */
 
-/*
- * TODO
- * ====
- *
- * - Make ICS lockless as well, or at least a per-interrupt lock or hashed
- *   locks array to improve scalability
- */
-
 /* -- ICS routines -- */
 
 static void icp_deliver_irq(struct kvmppc_xics *xics, struct kvmppc_icp *icp,
@@ -142,7 +134,7 @@ static bool write_xive(struct kvmppc_xics *xics, struct kvmppc_ics *ics,
 	unsigned long flags;
 
 	local_irq_save(flags);
-	arch_spin_lock(&ics->lock);
+	arch_spin_lock(&state->lock);
 
 	state->server = server;
 	state->priority = priority;
@@ -154,7 +146,7 @@ static bool write_xive(struct kvmppc_xics *xics, struct kvmppc_ics *ics,
 		deliver = true;
 	}
 
-	arch_spin_unlock(&ics->lock);
+	arch_spin_unlock(&state->lock);
 	local_irq_restore(flags);
 
 	return deliver;
@@ -207,10 +199,10 @@ int kvmppc_xics_get_xive(struct kvm *kvm, u32 irq, u32 *server, u32 *priority)
 	state = &ics->irq_state[src];
 
 	local_irq_save(flags);
-	arch_spin_lock(&ics->lock);
+	arch_spin_lock(&state->lock);
 	*server = state->server;
 	*priority = state->priority;
-	arch_spin_unlock(&ics->lock);
+	arch_spin_unlock(&state->lock);
 	local_irq_restore(flags);
 
 	return 0;
@@ -406,7 +398,7 @@ static void icp_deliver_irq(struct kvmppc_xics *xics, struct kvmppc_icp *icp,
 
 	/* Get a lock on the ICS */
 	local_irq_save(flags);
-	arch_spin_lock(&ics->lock);
+	arch_spin_lock(&state->lock);
 
 	/* Get our server */
 	if (!icp || state->server != icp->server_num) {
@@ -467,7 +459,7 @@ static void icp_deliver_irq(struct kvmppc_xics *xics, struct kvmppc_icp *icp,
 		 * Delivery was successful, did we reject somebody else ?
 		 */
 		if (reject && reject != XICS_IPI) {
-			arch_spin_unlock(&ics->lock);
+			arch_spin_unlock(&state->lock);
 			local_irq_restore(flags);
 			new_irq = reject;
 			check_resend = false;
@@ -497,14 +489,14 @@ static void icp_deliver_irq(struct kvmppc_xics *xics, struct kvmppc_icp *icp,
 		smp_mb();
 		if (!icp->state.need_resend) {
 			state->resend = 0;
-			arch_spin_unlock(&ics->lock);
+			arch_spin_unlock(&state->lock);
 			local_irq_restore(flags);
 			check_resend = false;
 			goto again;
 		}
 	}
  out:
-	arch_spin_unlock(&ics->lock);
+	arch_spin_unlock(&state->lock);
 	local_irq_restore(flags);
 }
 
@@ -992,20 +984,20 @@ static int xics_debug_show(struct seq_file *m, void *private)
 		seq_printf(m, "=========\nICS state for ICS 0x%x\n=========\n",
 			   icsid);
 
-		local_irq_save(flags);
-		arch_spin_lock(&ics->lock);
 
 		for (i = 0; i < KVMPPC_XICS_IRQ_PER_ICS; i++) {
 			struct ics_irq_state *irq = &ics->irq_state[i];
+			local_irq_save(flags);
+			arch_spin_lock(&irq->lock);
 
 			seq_printf(m, "irq 0x%06x: server %#x prio %#x save prio %#x pq_state %d resend %d masked pending %d\n",
 				   irq->number, irq->server, irq->priority,
 				   irq->saved_priority, irq->pq_state,
 				   irq->resend, irq->masked_pending);
 
+			arch_spin_unlock(&irq->lock);
+			local_irq_restore(flags);
 		}
-		arch_spin_unlock(&ics->lock);
-		local_irq_restore(flags);
 	}
 	return 0;
 }
@@ -1189,7 +1181,7 @@ static int xics_get_source(struct kvmppc_xics *xics, long irq, u64 addr)
 
 	irqp = &ics->irq_state[idx];
 	local_irq_save(flags);
-	arch_spin_lock(&ics->lock);
+	arch_spin_lock(&irqp->lock);
 	ret = -ENOENT;
 	if (irqp->exists) {
 		val = irqp->server;
@@ -1214,7 +1206,7 @@ static int xics_get_source(struct kvmppc_xics *xics, long irq, u64 addr)
 
 		ret = 0;
 	}
-	arch_spin_unlock(&ics->lock);
+	arch_spin_unlock(&irqp->lock);
 	local_irq_restore(flags);
 
 	if (!ret && put_user(val, ubufp))
@@ -1254,7 +1246,7 @@ static int xics_set_source(struct kvmppc_xics *xics, long irq, u64 addr)
 		return -EINVAL;
 
 	local_irq_save(flags);
-	arch_spin_lock(&ics->lock);
+	arch_spin_lock(&irqp->lock);
 	irqp->server = server;
 	irqp->saved_priority = prio;
 	if (val & KVM_XICS_MASKED)
@@ -1272,7 +1264,7 @@ static int xics_set_source(struct kvmppc_xics *xics, long irq, u64 addr)
 	if (val & KVM_XICS_QUEUED)
 		irqp->pq_state |= PQ_QUEUED;
 	irqp->exists = 1;
-	arch_spin_unlock(&ics->lock);
+	arch_spin_unlock(&irqp->lock);
 	local_irq_restore(flags);
 
 	if (val & KVM_XICS_PENDING)
diff --git a/arch/powerpc/kvm/book3s_xics.h b/arch/powerpc/kvm/book3s_xics.h
index feeb0897d555..1ee62b7a8fdf 100644
--- a/arch/powerpc/kvm/book3s_xics.h
+++ b/arch/powerpc/kvm/book3s_xics.h
@@ -45,6 +45,7 @@ struct ics_irq_state {
 	u8  exists;
 	int intr_cpu;
 	u32 host_irq;
+	arch_spinlock_t lock;
 };
 
 /* Atomic ICP state, updated with a single compare & swap */
@@ -95,7 +96,6 @@ struct kvmppc_icp {
 };
 
 struct kvmppc_ics {
-	arch_spinlock_t lock;
 	u16 icsid;
 	struct ics_irq_state irq_state[KVMPPC_XICS_IRQ_PER_ICS];
 	DECLARE_BITMAP(resend_map, KVMPPC_XICS_IRQ_PER_ICS);
-- 
2.44.0

