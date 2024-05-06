Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8658BD26E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 18:19:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UvBQlARU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VY66z2ltjz3cTr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 02:19:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UvBQlARU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VY65Z6z92z3bmY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 02:18:10 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 446GH6lL026899;
	Mon, 6 May 2024 16:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1ZljFRPQkJliM89Aj1uqay/WLHKarY1XQa8XB660YSs=;
 b=UvBQlARUFXa/fssmm0GGeaXvHKxkwHVeJRHjzsx9EjlVZwcx2gaOmqGdTvp3/BH4cBWa
 rg2mgmX2GkHD4CtQAxMrn3WVw0pR0xeqDMat8jnG/YzCuWJ+un3C2WfKShK2bs9qzwj6
 wrhe6LJT5YRZBzFSOvZfuUviKlDDd5noe2Q1Mr2qdYHQVmlc/T1k6Ey3xPKndO9Oir/P
 p0sqca5LrHwRC+4+GxzOjw8UC6OK8BsD9vCW5i7LIcr8qP+WkiTe4A5Xno2smzTOqEpJ
 v/UVXYTf/Tw4XJzduVi7yOrSMOnPqqqL7jkrXItFwf24mm7p7NU90X74BJfePVl01/zc 2A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xy2ka806e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 16:18:04 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 446GI4K0029545;
	Mon, 6 May 2024 16:18:04 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xy2ka806b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 16:18:03 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 446DklrG022497;
	Mon, 6 May 2024 16:18:02 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xx1jkrj34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 16:18:02 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 446GHvTo57016824
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 May 2024 16:17:59 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 890BE20040;
	Mon,  6 May 2024 16:17:57 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A564F20043;
	Mon,  6 May 2024 16:17:51 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com.com (unknown [9.43.105.31])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 May 2024 16:17:51 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen.n.rao@linux.ibm.com
Subject: [PATCH 1/3] arch/powerpc/kvm: Use bitmap to speed up resend of irqs in ICS
Date: Mon,  6 May 2024 21:47:29 +0530
Message-ID: <20240506161735.83358-2-gautam@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240506161735.83358-1-gautam@linux.ibm.com>
References: <20240506161735.83358-1-gautam@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: I0zi3wmf-XEqBJBOGsx18Ged2lPofcQi
X-Proofpoint-ORIG-GUID: EmSSA70nkoVw2EnX0XdqyKahIU2YJXJc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_11,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 mlxlogscore=493 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2404010000 definitions=main-2405060114
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

When an irq is to be resent, all 1024 irqs in an ICS are scanned and the
irqs having 'resend' flag set are resent. Optimize this flow using bitmap
array to speed up the resends.

Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_xics.c | 22 +++++++++++-----------
 arch/powerpc/kvm/book3s_xics.h |  1 +
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_xics.c b/arch/powerpc/kvm/book3s_xics.c
index 589a8f257120..12de526f04c4 100644
--- a/arch/powerpc/kvm/book3s_xics.c
+++ b/arch/powerpc/kvm/book3s_xics.c
@@ -47,9 +47,6 @@
  * TODO
  * ====
  *
- * - To speed up resends, keep a bitmap of "resend" set bits in the
- *   ICS
- *
  * - Speed up server# -> ICP lookup (array ? hash table ?)
  *
  * - Make ICS lockless as well, or at least a per-interrupt lock or hashed
@@ -125,15 +122,17 @@ static int ics_deliver_irq(struct kvmppc_xics *xics, u32 irq, u32 level)
 static void ics_check_resend(struct kvmppc_xics *xics, struct kvmppc_ics *ics,
 			     struct kvmppc_icp *icp)
 {
-	int i;
+	u32 irq;
+	struct ics_irq_state *state;
 
-	for (i = 0; i < KVMPPC_XICS_IRQ_PER_ICS; i++) {
-		struct ics_irq_state *state = &ics->irq_state[i];
-		if (state->resend) {
-			XICS_DBG("resend %#x prio %#x\n", state->number,
-				      state->priority);
-			icp_deliver_irq(xics, icp, state->number, true);
-		}
+	for_each_set_bit(irq, ics->resend_map, KVMPPC_XICS_IRQ_PER_ICS) {
+		state = &ics->irq_state[irq];
+
+		if (!test_and_clear_bit(irq, ics->resend_map))
+			continue;
+		if (!state)
+			continue;
+		icp_deliver_irq(xics, icp, state->number, true);
 	}
 }
 
@@ -489,6 +488,7 @@ static void icp_deliver_irq(struct kvmppc_xics *xics, struct kvmppc_icp *icp,
 		 */
 		smp_wmb();
 		set_bit(ics->icsid, icp->resend_map);
+		set_bit(src, ics->resend_map);
 
 		/*
 		 * If the need_resend flag got cleared in the ICP some time
diff --git a/arch/powerpc/kvm/book3s_xics.h b/arch/powerpc/kvm/book3s_xics.h
index 08fb0843faf5..8fcb34ea47a4 100644
--- a/arch/powerpc/kvm/book3s_xics.h
+++ b/arch/powerpc/kvm/book3s_xics.h
@@ -98,6 +98,7 @@ struct kvmppc_ics {
 	arch_spinlock_t lock;
 	u16 icsid;
 	struct ics_irq_state irq_state[KVMPPC_XICS_IRQ_PER_ICS];
+	DECLARE_BITMAP(resend_map, KVMPPC_XICS_IRQ_PER_ICS);
 };
 
 struct kvmppc_xics {
-- 
2.44.0

