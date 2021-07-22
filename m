Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7B23D2F99
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 00:13:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GW6DG3lpwz30KZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 08:13:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XQyjeKRR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XQyjeKRR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GW6CJ5Vrbz2yMT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jul 2021 08:13:00 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16MM31Dj057657; Thu, 22 Jul 2021 18:12:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1nBQtBouxEKLnykSEK6dZI8ghvG+LaD9l10LzJt8S0g=;
 b=XQyjeKRRyxu2HOtsdhrUHI0H00cWhmYFPunArQIQQRl4cw/HjczpyljrzMuWz25JJDqb
 nN9MJduiwk5xQigEkMBImPgYhk4amJqYCsl8TTvDXwSaw8tocnapa/u2dB3zzUQsn4zb
 TKZwccC4b0tUO+SQ+ma6LQOTgV7e/9wxenYsN28SXhI1CmuSP+gDtyt8ni+nJZDx0fYE
 FPR3CyWG2yNka716LlAtOdpGBFIXIeQcDToyt3kSLYVfwh56gooADukdRJN3jNg1Me6T
 x7OC3oao23VQK8gwgTalZk0mElSeUQ5/l6VsIpCcNpi36lLGnPeBwSSFvBlGrtHhskhB zw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39yepjm8qb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 18:12:52 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16MM4Fm9066931;
 Thu, 22 Jul 2021 18:12:52 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39yepjm8q1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 18:12:52 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16MM4LK2001250;
 Thu, 22 Jul 2021 22:12:51 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 39y0bnr2na-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 22:12:51 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16MMCoCl39911746
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Jul 2021 22:12:50 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2417C6055;
 Thu, 22 Jul 2021 22:12:49 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7766FC6059;
 Thu, 22 Jul 2021 22:12:48 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.86.55])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 22 Jul 2021 22:12:48 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 2/2] KVM: PPC: Book3S HV: Stop forwarding all HFUs to L1
Date: Thu, 22 Jul 2021 19:12:40 -0300
Message-Id: <20210722221240.2384655-3-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210722221240.2384655-1-farosas@linux.ibm.com>
References: <20210722221240.2384655-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lPyhKWjKHcSe78WCPy1aSmv-gBRWIeK2
X-Proofpoint-ORIG-GUID: JR_vbIFML7uTPcVPyhb9Sah-L_Xz9quF
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-22_12:2021-07-22,
 2021-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=705 spamscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107220142
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

If the nested hypervisor has no access to a facility because it has
been disabled by the host, it should also not be able to see the
Hypervisor Facility Unavailable that arises from one of its guests
trying to access the facility.

This patch turns a HFU that happened in L2 into a Hypervisor Emulation
Assistance interrupt and forwards it to L1 for handling. The ones that
happened because L1 explicitly disabled the facility for L2 are still
let through, along with the corresponding Cause bits in the HFSCR.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv_nested.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 3804dc50ebe8..d171a400e4d5 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -99,7 +99,7 @@ static void byteswap_hv_regs(struct hv_guest_state *hr)
 	hr->dawrx1 = swab64(hr->dawrx1);
 }
 
-static void save_hv_return_state(struct kvm_vcpu *vcpu, int trap,
+static void save_hv_return_state(struct kvm_vcpu *vcpu,
 				 struct hv_guest_state *hr)
 {
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
@@ -128,7 +128,7 @@ static void save_hv_return_state(struct kvm_vcpu *vcpu, int trap,
 	hr->pidr = vcpu->arch.pid;
 	hr->cfar = vcpu->arch.cfar;
 	hr->ppr = vcpu->arch.ppr;
-	switch (trap) {
+	switch (vcpu->arch.trap) {
 	case BOOK3S_INTERRUPT_H_DATA_STORAGE:
 		hr->hdar = vcpu->arch.fault_dar;
 		hr->hdsisr = vcpu->arch.fault_dsisr;
@@ -137,6 +137,27 @@ static void save_hv_return_state(struct kvm_vcpu *vcpu, int trap,
 	case BOOK3S_INTERRUPT_H_INST_STORAGE:
 		hr->asdr = vcpu->arch.fault_gpa;
 		break;
+	case BOOK3S_INTERRUPT_H_FAC_UNAVAIL:
+	{
+		u8 cause = vcpu->arch.hfscr >> 56;
+
+		WARN_ON_ONCE(cause >= BITS_PER_LONG);
+
+		if (!(hr->hfscr & (1UL << cause)))
+			break;
+
+		/*
+		 * We have disabled this facility, so it does not
+		 * exist from L1's perspective. Turn it into a HEAI.
+		 */
+		vcpu->arch.trap = BOOK3S_INTERRUPT_H_EMUL_ASSIST;
+		kvmppc_load_last_inst(vcpu, INST_GENERIC, &vcpu->arch.emul_inst);
+
+		/* Don't leak the cause field */
+		hr->hfscr &= ~HFSCR_INTR_CAUSE;
+
+		fallthrough;
+	}
 	case BOOK3S_INTERRUPT_H_EMUL_ASSIST:
 		hr->heir = vcpu->arch.emul_inst;
 		break;
@@ -374,7 +395,7 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 	delta_spurr = vcpu->arch.spurr - l2_hv.spurr;
 	delta_ic = vcpu->arch.ic - l2_hv.ic;
 	delta_vtb = vc->vtb - l2_hv.vtb;
-	save_hv_return_state(vcpu, vcpu->arch.trap, &l2_hv);
+	save_hv_return_state(vcpu, &l2_hv);
 
 	/* restore L1 state */
 	vcpu->arch.nested = NULL;
-- 
2.29.2

