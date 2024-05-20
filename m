Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD348C99D8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2024 10:31:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kLjmWEEp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VjVsq1Fbsz3g1P
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2024 18:22:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kLjmWEEp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VjVrQ54Mzz3cYP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2024 18:20:54 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44K6U4eE032441;
	Mon, 20 May 2024 08:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1ZljFRPQkJliM89Aj1uqay/WLHKarY1XQa8XB660YSs=;
 b=kLjmWEEpRo2pFdXEWqRTKMBqpWQ7iyW+HvVoMFRz0SYPA/5TcEEn/MTeCtCWqZtEkVC7
 Wc9tb9zKc7N07xQuGUXxJqE1m9QOqSmV79jT3+9qWnCvl4MbHt6udAaNyYSiA00MLYi5
 8tniWoYWpRwmJcHCA5Viet2aD/cUvMKbvk8U4ud2bKOuiFQZUbnxWXdbcZmtUy2zqjk4
 ngO6dXDqigWwJWvxy/PsxoLQGw+bhnRCj583tIBmXTWSXXuOOlEiYV9w3b5mOkbnp0fp
 pp6VnIakf5Qa2pJX3XwRKq1cWuif+16hujY7456dy/uVMjruEfs7l3ExDU7P1ShW7kep Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y7wnxgnqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 08:20:37 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44K8KbpV008202;
	Mon, 20 May 2024 08:20:37 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y7wnxgnqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 08:20:37 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44K5178e000878;
	Mon, 20 May 2024 08:20:35 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y771yxw0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 08:20:35 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44K8KTp941943530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 May 2024 08:20:31 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF65C20040;
	Mon, 20 May 2024 08:20:29 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D4212004D;
	Mon, 20 May 2024 08:20:28 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.in.ibm.com (unknown [9.204.206.66])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 20 May 2024 08:20:27 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen.n.rao@linux.ibm.com, clg@kaod.org
Subject: [RESEND PATCH 1/3] arch/powerpc/kvm: Use bitmap to speed up resend of irqs in ICS
Date: Mon, 20 May 2024 13:50:08 +0530
Message-ID: <20240520082014.140697-2-gautam@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240520082014.140697-1-gautam@linux.ibm.com>
References: <20240520082014.140697-1-gautam@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: md7XFMpY2sLfiYBBRvq-vqILGD4IWWBZ
X-Proofpoint-GUID: mGIm1GLoZKNh7eUYRFOJVIOyPzd7QlHI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-20_04,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=333 priorityscore=1501 impostorscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405200068
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

