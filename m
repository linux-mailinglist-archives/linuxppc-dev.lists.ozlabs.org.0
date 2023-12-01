Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9472E800C47
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 14:34:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jxRD7x3g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShYtz0gb6z3vmw
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Dec 2023 00:34:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jxRD7x3g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShYl42nMjz3dBZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Dec 2023 00:27:28 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B1DH4eU021762;
	Fri, 1 Dec 2023 13:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=W3cHN2Uvcb8Gad5K4q2LVD13iEgeI+UMloDNeKJjDqU=;
 b=jxRD7x3gSzUCEo/eouA3iGmYGFUSmX/1kU0JU8pAU67WDT170bXNB+aacCIBFdaf9lgO
 PcSYySfMVtssmU5JYGle2Im7kXDijXdYRbWGj0RWqfOfRg1zd7N46mmTXhDRkqr6r72t
 kJkX3XGSR8XyRcBnllkWf6sf8k5RnPF43xQqcFudbjPl1zYnHsdY3xK6ARaQODD3K0PY
 6//WVe1qYDjEDUPmaCEUYBxkfGKIswg2gRZFsJUOqlUY8QUayVjlMRfjGGsjmRSH53F+
 A8KFnL8tzxxUul/irsladHzBngal30z/Npv+ILWN9JcFoepXoFYvUpJIpLV74qsbOgkq 3g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uqg828arr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 13:27:21 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3B1DIOVk028334;
	Fri, 1 Dec 2023 13:27:21 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uqg828aqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 13:27:21 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3B1AY5f8020496;
	Fri, 1 Dec 2023 13:27:19 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ukvrm52xb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 13:27:19 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3B1DRGYn47317480
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Dec 2023 13:27:16 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB63E2004B;
	Fri,  1 Dec 2023 13:27:16 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 102DD20040;
	Fri,  1 Dec 2023 13:27:13 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.171.33.138])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri,  1 Dec 2023 13:27:12 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Fri, 01 Dec 2023 18:57:12 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org
Subject: [PATCH 10/12] KVM: PPC: Book3S HV nestedv2: Register the VPA with the L0
Date: Fri,  1 Dec 2023 18:56:15 +0530
Message-ID: <20231201132618.555031-11-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231201132618.555031-1-vaibhav@linux.ibm.com>
References: <20231201132618.555031-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cOw0O3T_1UcZxoWBY_viib_ayyqtpZNe
X-Proofpoint-ORIG-GUID: bR-E6lgYYLwAXtBR-13rbzaW3cnluxn6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_11,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 mlxlogscore=908 suspectscore=0 malwarescore=0
 spamscore=0 adultscore=0 bulkscore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010092
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, amachhiw@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>, gautam@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>, David.Laight@ACULAB.COM, kconsul@linux.vnet.ibm.com, Vaibhav Jain <vaibhav@linux.ibm.com>, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Jordan Niethe <jniethe5@gmail.com>

In the nestedv2 case, the L1 may register the L2's VPA with the L0. This
allows the L0 to manage the L2's dispatch count, as well as enable
possible performance optimisations by seeing if certain resources are
not being used by the L2 (such as the PMCs).

Use the H_GUEST_SET_STATE call to inform the L0 of the L2's VPA
address. This can not be done in the H_GUEST_VCPU_RUN input buffer.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/kvm_book3s_64.h |  1 +
 arch/powerpc/kvm/book3s_hv.c             | 38 ++++++++++++++++++------
 arch/powerpc/kvm/book3s_hv_nestedv2.c    | 29 ++++++++++++++++++
 3 files changed, 59 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index 2477021bff54..d8729ec81ca0 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -682,6 +682,7 @@ void kvmhv_nestedv2_vcpu_free(struct kvm_vcpu *vcpu, struct kvmhv_nestedv2_io *i
 int kvmhv_nestedv2_flush_vcpu(struct kvm_vcpu *vcpu, u64 time_limit);
 int kvmhv_nestedv2_set_ptbl_entry(unsigned long lpid, u64 dw0, u64 dw1);
 int kvmhv_nestedv2_parse_output(struct kvm_vcpu *vcpu);
+int kvmhv_nestedv2_set_vpa(struct kvm_vcpu *vcpu, unsigned long vpa);
 
 #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
 
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 47fe470375df..2ee3f2478570 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -650,7 +650,8 @@ static unsigned long do_h_register_vpa(struct kvm_vcpu *vcpu,
 	return err;
 }
 
-static void kvmppc_update_vpa(struct kvm_vcpu *vcpu, struct kvmppc_vpa *vpap)
+static void kvmppc_update_vpa(struct kvm_vcpu *vcpu, struct kvmppc_vpa *vpap,
+			       struct kvmppc_vpa *old_vpap)
 {
 	struct kvm *kvm = vcpu->kvm;
 	void *va;
@@ -690,9 +691,8 @@ static void kvmppc_update_vpa(struct kvm_vcpu *vcpu, struct kvmppc_vpa *vpap)
 		kvmppc_unpin_guest_page(kvm, va, gpa, false);
 		va = NULL;
 	}
-	if (vpap->pinned_addr)
-		kvmppc_unpin_guest_page(kvm, vpap->pinned_addr, vpap->gpa,
-					vpap->dirty);
+	*old_vpap = *vpap;
+
 	vpap->gpa = gpa;
 	vpap->pinned_addr = va;
 	vpap->dirty = false;
@@ -702,6 +702,9 @@ static void kvmppc_update_vpa(struct kvm_vcpu *vcpu, struct kvmppc_vpa *vpap)
 
 static void kvmppc_update_vpas(struct kvm_vcpu *vcpu)
 {
+	struct kvm *kvm = vcpu->kvm;
+	struct kvmppc_vpa old_vpa = { 0 };
+
 	if (!(vcpu->arch.vpa.update_pending ||
 	      vcpu->arch.slb_shadow.update_pending ||
 	      vcpu->arch.dtl.update_pending))
@@ -709,17 +712,34 @@ static void kvmppc_update_vpas(struct kvm_vcpu *vcpu)
 
 	spin_lock(&vcpu->arch.vpa_update_lock);
 	if (vcpu->arch.vpa.update_pending) {
-		kvmppc_update_vpa(vcpu, &vcpu->arch.vpa);
-		if (vcpu->arch.vpa.pinned_addr)
+		kvmppc_update_vpa(vcpu, &vcpu->arch.vpa, &old_vpa);
+		if (old_vpa.pinned_addr) {
+			if (kvmhv_is_nestedv2())
+				kvmhv_nestedv2_set_vpa(vcpu, ~0ull);
+			kvmppc_unpin_guest_page(kvm, old_vpa.pinned_addr, old_vpa.gpa,
+						old_vpa.dirty);
+		}
+		if (vcpu->arch.vpa.pinned_addr) {
 			init_vpa(vcpu, vcpu->arch.vpa.pinned_addr);
+			if (kvmhv_is_nestedv2())
+				kvmhv_nestedv2_set_vpa(vcpu, __pa(vcpu->arch.vpa.pinned_addr));
+		}
 	}
 	if (vcpu->arch.dtl.update_pending) {
-		kvmppc_update_vpa(vcpu, &vcpu->arch.dtl);
+		kvmppc_update_vpa(vcpu, &vcpu->arch.dtl, &old_vpa);
+		if (old_vpa.pinned_addr)
+			kvmppc_unpin_guest_page(kvm, old_vpa.pinned_addr, old_vpa.gpa,
+						old_vpa.dirty);
 		vcpu->arch.dtl_ptr = vcpu->arch.dtl.pinned_addr;
 		vcpu->arch.dtl_index = 0;
 	}
-	if (vcpu->arch.slb_shadow.update_pending)
-		kvmppc_update_vpa(vcpu, &vcpu->arch.slb_shadow);
+	if (vcpu->arch.slb_shadow.update_pending) {
+		kvmppc_update_vpa(vcpu, &vcpu->arch.slb_shadow, &old_vpa);
+		if (old_vpa.pinned_addr)
+			kvmppc_unpin_guest_page(kvm, old_vpa.pinned_addr, old_vpa.gpa,
+						old_vpa.dirty);
+	}
+
 	spin_unlock(&vcpu->arch.vpa_update_lock);
 }
 
diff --git a/arch/powerpc/kvm/book3s_hv_nestedv2.c b/arch/powerpc/kvm/book3s_hv_nestedv2.c
index fd3c4f2d9480..5378eb40b162 100644
--- a/arch/powerpc/kvm/book3s_hv_nestedv2.c
+++ b/arch/powerpc/kvm/book3s_hv_nestedv2.c
@@ -855,6 +855,35 @@ int kvmhv_nestedv2_set_ptbl_entry(unsigned long lpid, u64 dw0, u64 dw1)
 }
 EXPORT_SYMBOL_GPL(kvmhv_nestedv2_set_ptbl_entry);
 
+/**
+ * kvmhv_nestedv2_set_vpa() - register L2 VPA with L0
+ * @vcpu: vcpu
+ * @vpa: L1 logical real address
+ */
+int kvmhv_nestedv2_set_vpa(struct kvm_vcpu *vcpu, unsigned long vpa)
+{
+	struct kvmhv_nestedv2_io *io;
+	struct kvmppc_gs_buff *gsb;
+	int rc = 0;
+
+	io = &vcpu->arch.nestedv2_io;
+	gsb = io->vcpu_run_input;
+
+	kvmppc_gsb_reset(gsb);
+	rc = kvmppc_gse_put_u64(gsb, KVMPPC_GSID_VPA, vpa);
+	if (rc < 0)
+		goto out;
+
+	rc = kvmppc_gsb_send(gsb, 0);
+	if (rc < 0)
+		pr_err("KVM-NESTEDv2: couldn't register the L2 VPA (rc=%d)\n", rc);
+
+out:
+	kvmppc_gsb_reset(gsb);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(kvmhv_nestedv2_set_vpa);
+
 /**
  * kvmhv_nestedv2_parse_output() - receive values from H_GUEST_RUN_VCPU output
  * @vcpu: vcpu
-- 
2.42.0

