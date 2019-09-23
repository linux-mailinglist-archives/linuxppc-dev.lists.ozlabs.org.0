Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B05F0BB8B9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 17:56:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cTT50xyGzDqJL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 01:56:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cTBq5WjGzDqJP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 01:44:03 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8NFgkk8046311
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2019 11:44:01 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v70erh7px-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2019 11:44:01 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <groug@kaod.org>;
 Mon, 23 Sep 2019 16:43:58 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 23 Sep 2019 16:43:56 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8NFhtVA59310252
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Sep 2019 15:43:55 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E0994C040;
 Mon, 23 Sep 2019 15:43:55 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4A2F4C044;
 Mon, 23 Sep 2019 15:43:54 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.22.84])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 23 Sep 2019 15:43:54 +0000 (GMT)
Subject: [PATCH 4/6] KVM: PPC: Book3S HV: XIVE: Compute the VP id in a
 common helper
From: Greg Kurz <groug@kaod.org>
To: Paul Mackerras <paulus@ozlabs.org>
Date: Mon, 23 Sep 2019 17:43:54 +0200
In-Reply-To: <156925341155.974393.11681611197111945710.stgit@bahia.lan>
References: <156925341155.974393.11681611197111945710.stgit@bahia.lan>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19092315-0016-0000-0000-000002AFA2AA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092315-0017-0000-0000-0000331060BA
Message-Id: <156925343456.974393.8872043691347906457.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-23_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=985 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909230148
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
Cc: kvm@vger.kernel.org, Radim =?utf-8?b?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 kvm-ppc@vger.kernel.org, =?utf-8?q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reduce code duplication by consolidating the checking of vCPU ids and VP
ids to a common helper used by both legacy and native XIVE KVM devices.
And explain the magic with a comment.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 arch/powerpc/kvm/book3s_xive.c        |   42 ++++++++++++++++++++++++++-------
 arch/powerpc/kvm/book3s_xive.h        |    1 +
 arch/powerpc/kvm/book3s_xive_native.c |   11 ++-------
 3 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index 01bff7befc9f..9ac6315fb9ae 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -1211,6 +1211,37 @@ void kvmppc_xive_cleanup_vcpu(struct kvm_vcpu *vcpu)
 	vcpu->arch.xive_vcpu = NULL;
 }
 
+static bool kvmppc_xive_vcpu_id_valid(struct kvmppc_xive *xive, u32 cpu)
+{
+	/* We have a block of KVM_MAX_VCPUS VPs. We just need to check
+	 * raw vCPU ids are below the expected limit for this guest's
+	 * core stride ; kvmppc_pack_vcpu_id() will pack them down to an
+	 * index that can be safely used to compute a VP id that belongs
+	 * to the VP block.
+	 */
+	return cpu < KVM_MAX_VCPUS * xive->kvm->arch.emul_smt_mode;
+}
+
+int kvmppc_xive_compute_vp_id(struct kvmppc_xive *xive, u32 cpu, u32 *vp)
+{
+	u32 vp_id;
+
+	if (!kvmppc_xive_vcpu_id_valid(xive, cpu)) {
+		pr_devel("Out of bounds !\n");
+		return -EINVAL;
+	}
+
+	vp_id = kvmppc_xive_vp(xive, cpu);
+	if (kvmppc_xive_vp_in_use(xive->kvm, vp_id)) {
+		pr_devel("Duplicate !\n");
+		return -EEXIST;
+	}
+
+	*vp = vp_id;
+
+	return 0;
+}
+
 int kvmppc_xive_connect_vcpu(struct kvm_device *dev,
 			     struct kvm_vcpu *vcpu, u32 cpu)
 {
@@ -1229,20 +1260,13 @@ int kvmppc_xive_connect_vcpu(struct kvm_device *dev,
 		return -EPERM;
 	if (vcpu->arch.irq_type != KVMPPC_IRQ_DEFAULT)
 		return -EBUSY;
-	if (cpu >= (KVM_MAX_VCPUS * vcpu->kvm->arch.emul_smt_mode)) {
-		pr_devel("Out of bounds !\n");
-		return -EINVAL;
-	}
 
 	/* We need to synchronize with queue provisioning */
 	mutex_lock(&xive->lock);
 
-	vp_id = kvmppc_xive_vp(xive, cpu);
-	if (kvmppc_xive_vp_in_use(xive->kvm, vp_id)) {
-		pr_devel("Duplicate !\n");
-		r = -EEXIST;
+	r = kvmppc_xive_compute_vp_id(xive, cpu, &vp_id);
+	if (r)
 		goto bail;
-	}
 
 	xc = kzalloc(sizeof(*xc), GFP_KERNEL);
 	if (!xc) {
diff --git a/arch/powerpc/kvm/book3s_xive.h b/arch/powerpc/kvm/book3s_xive.h
index fe3ed50e0818..90cf6ec35a68 100644
--- a/arch/powerpc/kvm/book3s_xive.h
+++ b/arch/powerpc/kvm/book3s_xive.h
@@ -296,6 +296,7 @@ int kvmppc_xive_attach_escalation(struct kvm_vcpu *vcpu, u8 prio,
 struct kvmppc_xive *kvmppc_xive_get_device(struct kvm *kvm, u32 type);
 void xive_cleanup_single_escalation(struct kvm_vcpu *vcpu,
 				    struct kvmppc_xive_vcpu *xc, int irq);
+int kvmppc_xive_compute_vp_id(struct kvmppc_xive *xive, u32 cpu, u32 *vp);
 
 #endif /* CONFIG_KVM_XICS */
 #endif /* _KVM_PPC_BOOK3S_XICS_H */
diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
index 53a22771908c..6902319c5ee9 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -118,19 +118,12 @@ int kvmppc_xive_native_connect_vcpu(struct kvm_device *dev,
 		return -EPERM;
 	if (vcpu->arch.irq_type != KVMPPC_IRQ_DEFAULT)
 		return -EBUSY;
-	if (server_num >= (KVM_MAX_VCPUS * vcpu->kvm->arch.emul_smt_mode)) {
-		pr_devel("Out of bounds !\n");
-		return -EINVAL;
-	}
 
 	mutex_lock(&xive->lock);
 
-	vp_id = kvmppc_xive_vp(xive, server_num);
-	if (kvmppc_xive_vp_in_use(xive->kvm, vp_id)) {
-		pr_devel("Duplicate !\n");
-		rc = -EEXIST;
+	rc = kvmppc_xive_compute_vp_id(xive, server_num, &vp_id);
+	if (rc)
 		goto bail;
-	}
 
 	xc = kzalloc(sizeof(*xc), GFP_KERNEL);
 	if (!xc) {

