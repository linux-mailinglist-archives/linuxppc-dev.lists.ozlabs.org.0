Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 249FB32F675
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 00:11:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dsk520xXKz30KD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 10:11:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O8fTHf40;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=O8fTHf40; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dsk4Z5wSmz30JR
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 10:11:10 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 125N31wh116348; Fri, 5 Mar 2021 18:11:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=IT4gHcYGq7kbgRIZ+CZZT5/E5MvS8c3rRmLkY8cHI0I=;
 b=O8fTHf40zql9SYKQYkJB4LOGMwsTL5fezJvTGSJzvzP2G1sQrbM/moZaK0qXU6oMqvzk
 QHXDRjOBlKz/N5PhZ+/NnOiRWhkCqDL9HeCizWzH2xnzTXUfWywGj2bdyaoFWQBiGn6d
 kW+XQoHuw7yIyAa5YvDoyBsKj10RFc6l37qUV8V9ZAVAnF8wKRgkJMpfDe7VsB4I5A2t
 NplDXUv347PnQTEf+GIG3fOd8K8gZD/w9Wqc7AjA9kLRM+xVNUmh50vCU2eUtSFvXJM1
 ZFViePlEvHdKHrDvJ/RNm+sIDg9YECXkVzMeO8tCpB2fUKhVTzm3AmMe8tNT+y/PtcrV zg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 373tw4vj6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 18:11:03 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 125N8iLQ136928;
 Fri, 5 Mar 2021 18:11:03 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 373tw4vj69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 18:11:03 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 125N6wVW016284;
 Fri, 5 Mar 2021 23:11:02 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 36ydqa7d17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 23:11:02 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 125NB1Wn20316444
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Mar 2021 23:11:01 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFCE5AE060;
 Fri,  5 Mar 2021 23:11:01 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C808BAE05F;
 Fri,  5 Mar 2021 23:10:59 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.74.60])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  5 Mar 2021 23:10:59 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH] KVM: PPC: Book3S HV: Do not expose HFSCR sanitisation to
 nested hypervisor
Date: Fri,  5 Mar 2021 20:10:55 -0300
Message-Id: <20210305231055.2913892-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-05_16:2021-03-03,
 2021-03-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 spamscore=0 bulkscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103050118
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As one of the arguments of the H_ENTER_NESTED hypercall, the nested
hypervisor (L1) prepares a structure containing the values of various
hypervisor-privileged registers with which it wants the nested guest
(L2) to run. Since the nested HV runs in supervisor mode it needs the
host to write to these registers.

To stop a nested HV manipulating this mechanism and using a nested
guest as a proxy to access a facility that has been made unavailable
to it, we have a routine that sanitises the values of the HV registers
before copying them into the nested guest's vcpu struct.

However, when coming out of the guest the values are copied as they
were back into L1 memory, which means that any sanitisation we did
during guest entry will be exposed to L1 after H_ENTER_NESTED returns.

This is not a problem by itself, but in the case of the Hypervisor
Facility Status and Control Register (HFSCR), we use the intersection
between L2 hfscr bits and L1 hfscr bits. That means that L1 could use
this to indirectly read the (hv-privileged) value from its vcpu
struct.

This patch fixes this by making sure that L1 only gets back the bits
that are necessary for regular functioning.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv_nested.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 0cd0e7aad588..860004f46e08 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -98,12 +98,20 @@ static void byteswap_hv_regs(struct hv_guest_state *hr)
 }
 
 static void save_hv_return_state(struct kvm_vcpu *vcpu, int trap,
-				 struct hv_guest_state *hr)
+				 struct hv_guest_state *hr, u64 saved_hfscr)
 {
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 
+	/*
+	 * During sanitise_hv_regs() we used HFSCR bits from L1 state
+	 * to restrict what the L2 state is allowed to be. Since L1 is
+	 * not allowed to read this SPR, do not include these
+	 * modifications in the return state.
+	 */
+	hr->hfscr = ((~HFSCR_INTR_CAUSE & saved_hfscr) |
+		     (HFSCR_INTR_CAUSE & vcpu->arch.hfscr));
+
 	hr->dpdes = vc->dpdes;
-	hr->hfscr = vcpu->arch.hfscr;
 	hr->purr = vcpu->arch.purr;
 	hr->spurr = vcpu->arch.spurr;
 	hr->ic = vcpu->arch.ic;
@@ -132,12 +140,14 @@ static void save_hv_return_state(struct kvm_vcpu *vcpu, int trap,
 	}
 }
 
-static void sanitise_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
+static void sanitise_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr,
+			     u64 *saved_hfscr)
 {
 	/*
 	 * Don't let L1 enable features for L2 which we've disabled for L1,
 	 * but preserve the interrupt cause field.
 	 */
+	*saved_hfscr = hr->hfscr;
 	hr->hfscr &= (HFSCR_INTR_CAUSE | vcpu->arch.hfscr);
 
 	/* Don't let data address watchpoint match in hypervisor state */
@@ -272,6 +282,7 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 	u64 hdec_exp;
 	s64 delta_purr, delta_spurr, delta_ic, delta_vtb;
 	u64 mask;
+	u64 hfscr;
 	unsigned long lpcr;
 
 	if (vcpu->kvm->arch.l1_ptcr == 0)
@@ -324,7 +335,8 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
 		LPCR_LPES | LPCR_MER;
 	lpcr = (vc->lpcr & ~mask) | (l2_hv.lpcr & mask);
-	sanitise_hv_regs(vcpu, &l2_hv);
+
+	sanitise_hv_regs(vcpu, &l2_hv, &hfscr);
 	restore_hv_regs(vcpu, &l2_hv);
 
 	vcpu->arch.ret = RESUME_GUEST;
@@ -345,7 +357,7 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 	delta_spurr = vcpu->arch.spurr - l2_hv.spurr;
 	delta_ic = vcpu->arch.ic - l2_hv.ic;
 	delta_vtb = vc->vtb - l2_hv.vtb;
-	save_hv_return_state(vcpu, vcpu->arch.trap, &l2_hv);
+	save_hv_return_state(vcpu, vcpu->arch.trap, &l2_hv, hfscr);
 
 	/* restore L1 state */
 	vcpu->arch.nested = NULL;
-- 
2.29.2

