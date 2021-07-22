Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BB03D2F98
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 00:13:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GW6Cp2tczz30NX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 08:13:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JeHVIXLd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JeHVIXLd; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GW6CJ4bZMz2yLJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jul 2021 08:13:00 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16MM31N7057669; Thu, 22 Jul 2021 18:12:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=vCyfG/myHm5qkQSU3/36ogaM6pmaiSPiwXMVEtHUM6Y=;
 b=JeHVIXLdHQ9HRE+F0PBnWuyLqKmkxL7Wq48aj+SnUMI5J84cJlwNMyV9SqDT9e8xZPi9
 /AsUzya+y8geiRMmvXUu8fSi7wTzimwSWPa/vjbMKXI2leUtnpBm1n2bRc/jTDPp+K+n
 pAlKkkwHLZh3vMV74I4kx5m1ox8y2Gk20O1jrGntCpUsgro08d/RH5u9+hRGeSjRFAhC
 C+yUW2bgGLJDuU87sHPLtiS3Y3M7azXgNeuypL9W4Gi3iy9GCONz5lzHcxKs1gqcJbrj
 MnQIY7vjmv+MfhYDBYzVI2xeRQNcms3ZzSvOkfudK5BdSGQzWxsFmaPjcRX961coDKUn Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39yepjm8pm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 18:12:50 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16MM3uqo065579;
 Thu, 22 Jul 2021 18:12:50 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39yepjm8p8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 18:12:50 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16MMBcSq009793;
 Thu, 22 Jul 2021 22:12:49 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 39vqdwyjrm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 22:12:49 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16MMCmLb29360580
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Jul 2021 22:12:48 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A90FC6066;
 Thu, 22 Jul 2021 22:12:48 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 951BDC6062;
 Thu, 22 Jul 2021 22:12:46 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.86.55])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 22 Jul 2021 22:12:46 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 1/2] KVM: PPC: Book3S HV: Sanitise vcpu registers in nested
 path
Date: Thu, 22 Jul 2021 19:12:39 -0300
Message-Id: <20210722221240.2384655-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210722221240.2384655-1-farosas@linux.ibm.com>
References: <20210722221240.2384655-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kBEwsEJeWv6qLdulFESkBg57SjpfCZZ7
X-Proofpoint-ORIG-GUID: 2KcexTNFBMMnm3IeExgpezqrfHqTghfh
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-22_12:2021-07-22,
 2021-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 adultscore=0 mlxscore=0
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

This patch alters this sanitisation to have effect on the vcpu->arch
registers directly before entering and after exiting the guest,
leaving the structure that is copied back into L1 unchanged (except
when we really want L1 to access the value, e.g the Cause bits of
HFSCR).

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv_nested.c | 100 +++++++++++++++-------------
 1 file changed, 52 insertions(+), 48 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 8543ad538b0c..3804dc50ebe8 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -104,8 +104,17 @@ static void save_hv_return_state(struct kvm_vcpu *vcpu, int trap,
 {
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 
+	/*
+	 * When loading the hypervisor-privileged registers to run L2,
+	 * we might have used bits from L1 state to restrict what the
+	 * L2 state is allowed to be. Since L1 is not allowed to read
+	 * the HV registers, do not include these modifications in the
+	 * return state.
+	 */
+	hr->hfscr = ((~HFSCR_INTR_CAUSE & hr->hfscr) |
+		     (HFSCR_INTR_CAUSE & vcpu->arch.hfscr));
+
 	hr->dpdes = vc->dpdes;
-	hr->hfscr = vcpu->arch.hfscr;
 	hr->purr = vcpu->arch.purr;
 	hr->spurr = vcpu->arch.spurr;
 	hr->ic = vcpu->arch.ic;
@@ -134,49 +143,7 @@ static void save_hv_return_state(struct kvm_vcpu *vcpu, int trap,
 	}
 }
 
-/*
- * This can result in some L0 HV register state being leaked to an L1
- * hypervisor when the hv_guest_state is copied back to the guest after
- * being modified here.
- *
- * There is no known problem with such a leak, and in many cases these
- * register settings could be derived by the guest by observing behaviour
- * and timing, interrupts, etc., but it is an issue to consider.
- */
-static void sanitise_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
-{
-	struct kvmppc_vcore *vc = vcpu->arch.vcore;
-	u64 mask;
-
-	/*
-	 * Don't let L1 change LPCR bits for the L2 except these:
-	 */
-	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
-		LPCR_LPES | LPCR_MER;
-
-	/*
-	 * Additional filtering is required depending on hardware
-	 * and configuration.
-	 */
-	hr->lpcr = kvmppc_filter_lpcr_hv(vcpu->kvm,
-			(vc->lpcr & ~mask) | (hr->lpcr & mask));
-
-	/*
-	 * Don't let L1 enable features for L2 which we've disabled for L1,
-	 * but preserve the interrupt cause field.
-	 */
-	hr->hfscr &= (HFSCR_INTR_CAUSE | vcpu->arch.hfscr);
-
-	/* Don't let data address watchpoint match in hypervisor state */
-	hr->dawrx0 &= ~DAWRX_HYP;
-	hr->dawrx1 &= ~DAWRX_HYP;
-
-	/* Don't let completed instruction address breakpt match in HV state */
-	if ((hr->ciabr & CIABR_PRIV) == CIABR_PRIV_HYPER)
-		hr->ciabr &= ~CIABR_PRIV;
-}
-
-static void restore_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
+static void restore_hv_regs(struct kvm_vcpu *vcpu, const struct hv_guest_state *hr)
 {
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 
@@ -288,6 +255,43 @@ static int kvmhv_write_guest_state_and_regs(struct kvm_vcpu *vcpu,
 				     sizeof(struct pt_regs));
 }
 
+static void load_l2_hv_regs(struct kvm_vcpu *vcpu,
+			    const struct hv_guest_state *l2_hv,
+			    const struct hv_guest_state *l1_hv, u64 *lpcr)
+{
+	struct kvmppc_vcore *vc = vcpu->arch.vcore;
+	u64 mask;
+
+	restore_hv_regs(vcpu, l2_hv);
+
+	/*
+	 * Don't let L1 change LPCR bits for the L2 except these:
+	 */
+	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
+		LPCR_LPES | LPCR_MER;
+
+	/*
+	 * Additional filtering is required depending on hardware
+	 * and configuration.
+	 */
+	*lpcr = kvmppc_filter_lpcr_hv(vcpu->kvm,
+				      (vc->lpcr & ~mask) | (*lpcr & mask));
+
+	/*
+	 * Don't let L1 enable features for L2 which we've disabled for L1,
+	 * but preserve the interrupt cause field.
+	 */
+	vcpu->arch.hfscr = l2_hv->hfscr & (HFSCR_INTR_CAUSE | l1_hv->hfscr);
+
+	/* Don't let data address watchpoint match in hypervisor state */
+	vcpu->arch.dawrx0 = l2_hv->dawrx0 & ~DAWRX_HYP;
+	vcpu->arch.dawrx1 = l2_hv->dawrx1 & ~DAWRX_HYP;
+
+	/* Don't let completed instruction address breakpt match in HV state */
+	if ((l2_hv->ciabr & CIABR_PRIV) == CIABR_PRIV_HYPER)
+		vcpu->arch.ciabr = l2_hv->ciabr & ~CIABR_PRIV;
+}
+
 long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 {
 	long int err, r;
@@ -296,7 +300,7 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 	struct hv_guest_state l2_hv = {0}, saved_l1_hv;
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 	u64 hv_ptr, regs_ptr;
-	u64 hdec_exp;
+	u64 hdec_exp, lpcr;
 	s64 delta_purr, delta_spurr, delta_ic, delta_vtb;
 
 	if (vcpu->kvm->arch.l1_ptcr == 0)
@@ -349,8 +353,8 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 	/* Guest must always run with ME enabled, HV disabled. */
 	vcpu->arch.shregs.msr = (vcpu->arch.regs.msr | MSR_ME) & ~MSR_HV;
 
-	sanitise_hv_regs(vcpu, &l2_hv);
-	restore_hv_regs(vcpu, &l2_hv);
+	lpcr = l2_hv.lpcr;
+	load_l2_hv_regs(vcpu, &l2_hv, &saved_l1_hv, &lpcr);
 
 	vcpu->arch.ret = RESUME_GUEST;
 	vcpu->arch.trap = 0;
@@ -360,7 +364,7 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 			r = RESUME_HOST;
 			break;
 		}
-		r = kvmhv_run_single_vcpu(vcpu, hdec_exp, l2_hv.lpcr);
+		r = kvmhv_run_single_vcpu(vcpu, hdec_exp, lpcr);
 	} while (is_kvmppc_resume_guest(r));
 
 	/* save L2 state for return */
-- 
2.29.2

