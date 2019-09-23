Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8447BB8B0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 17:54:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cTQT3bdyzDqJR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 01:54:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cTBk3mPkzDqJq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 01:43:58 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8NFg7Xj010462
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2019 11:43:55 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v6yr436qy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2019 11:43:55 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <groug@kaod.org>;
 Mon, 23 Sep 2019 16:43:53 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 23 Sep 2019 16:43:50 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8NFhnvD39125418
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Sep 2019 15:43:49 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A2D852051;
 Mon, 23 Sep 2019 15:43:49 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.22.84])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2DA5C52059;
 Mon, 23 Sep 2019 15:43:49 +0000 (GMT)
Subject: [PATCH 3/6] KVM: PPC: Book3S HV: XIVE: Ensure VP isn't already in use
From: Greg Kurz <groug@kaod.org>
To: Paul Mackerras <paulus@ozlabs.org>
Date: Mon, 23 Sep 2019 17:43:48 +0200
In-Reply-To: <156925341155.974393.11681611197111945710.stgit@bahia.lan>
References: <156925341155.974393.11681611197111945710.stgit@bahia.lan>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19092315-4275-0000-0000-0000036A1A57
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092315-4276-0000-0000-0000387C8F64
Message-Id: <156925342885.974393.4930571278578115883.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-23_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=716 adultscore=0 classifier=spam adjust=0 reason=mlx
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

We currently prevent userspace to connect a new vCPU if we already have
one with the same vCPU id. This is good but unfortunately not enough,
because VP ids derive from the packed vCPU ids, and kvmppc_pack_vcpu_id()
can return colliding values. For examples, 348 stays unchanged since it
is < KVM_MAX_VCPUS, but it is also the packed value of 2392 when the
guest's core stride is 8. Nothing currently prevents userspace to connect
vCPUs with forged ids, that end up being associated to the same VP. This
confuses the irq layer and likely crashes the kernel:

[96631.670454] genirq: Flags mismatch irq 4161. 00010000 (kvm-1-2392) vs. 00010000 (kvm-1-348)

Check the VP id instead of the vCPU id when a new vCPU is connected.
The allocation of the XIVE CPU structure in kvmppc_xive_connect_vcpu()
is moved after the check to avoid the need for rollback.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 arch/powerpc/kvm/book3s_xive.c        |   24 ++++++++++++++++--------
 arch/powerpc/kvm/book3s_xive.h        |   12 ++++++++++++
 arch/powerpc/kvm/book3s_xive_native.c |    6 ++++--
 3 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index 2ef43d037a4f..01bff7befc9f 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -1217,6 +1217,7 @@ int kvmppc_xive_connect_vcpu(struct kvm_device *dev,
 	struct kvmppc_xive *xive = dev->private;
 	struct kvmppc_xive_vcpu *xc;
 	int i, r = -EBUSY;
+	u32 vp_id;
 
 	pr_devel("connect_vcpu(cpu=%d)\n", cpu);
 
@@ -1228,25 +1229,32 @@ int kvmppc_xive_connect_vcpu(struct kvm_device *dev,
 		return -EPERM;
 	if (vcpu->arch.irq_type != KVMPPC_IRQ_DEFAULT)
 		return -EBUSY;
-	if (kvmppc_xive_find_server(vcpu->kvm, cpu)) {
-		pr_devel("Duplicate !\n");
-		return -EEXIST;
-	}
 	if (cpu >= (KVM_MAX_VCPUS * vcpu->kvm->arch.emul_smt_mode)) {
 		pr_devel("Out of bounds !\n");
 		return -EINVAL;
 	}
-	xc = kzalloc(sizeof(*xc), GFP_KERNEL);
-	if (!xc)
-		return -ENOMEM;
 
 	/* We need to synchronize with queue provisioning */
 	mutex_lock(&xive->lock);
+
+	vp_id = kvmppc_xive_vp(xive, cpu);
+	if (kvmppc_xive_vp_in_use(xive->kvm, vp_id)) {
+		pr_devel("Duplicate !\n");
+		r = -EEXIST;
+		goto bail;
+	}
+
+	xc = kzalloc(sizeof(*xc), GFP_KERNEL);
+	if (!xc) {
+		r = -ENOMEM;
+		goto bail;
+	}
+
 	vcpu->arch.xive_vcpu = xc;
 	xc->xive = xive;
 	xc->vcpu = vcpu;
 	xc->server_num = cpu;
-	xc->vp_id = kvmppc_xive_vp(xive, cpu);
+	xc->vp_id = vp_id;
 	xc->mfrr = 0xff;
 	xc->valid = true;
 
diff --git a/arch/powerpc/kvm/book3s_xive.h b/arch/powerpc/kvm/book3s_xive.h
index 955b820ffd6d..fe3ed50e0818 100644
--- a/arch/powerpc/kvm/book3s_xive.h
+++ b/arch/powerpc/kvm/book3s_xive.h
@@ -220,6 +220,18 @@ static inline u32 kvmppc_xive_vp(struct kvmppc_xive *xive, u32 server)
 	return xive->vp_base + kvmppc_pack_vcpu_id(xive->kvm, server);
 }
 
+static inline bool kvmppc_xive_vp_in_use(struct kvm *kvm, u32 vp_id)
+{
+	struct kvm_vcpu *vcpu = NULL;
+	int i;
+
+	kvm_for_each_vcpu(i, vcpu, kvm) {
+		if (vcpu->arch.xive_vcpu && vp_id == vcpu->arch.xive_vcpu->vp_id)
+			return true;
+	}
+	return false;
+}
+
 /*
  * Mapping between guest priorities and host priorities
  * is as follow.
diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
index 84a354b90f60..53a22771908c 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -106,6 +106,7 @@ int kvmppc_xive_native_connect_vcpu(struct kvm_device *dev,
 	struct kvmppc_xive *xive = dev->private;
 	struct kvmppc_xive_vcpu *xc = NULL;
 	int rc;
+	u32 vp_id;
 
 	pr_devel("native_connect_vcpu(server=%d)\n", server_num);
 
@@ -124,7 +125,8 @@ int kvmppc_xive_native_connect_vcpu(struct kvm_device *dev,
 
 	mutex_lock(&xive->lock);
 
-	if (kvmppc_xive_find_server(vcpu->kvm, server_num)) {
+	vp_id = kvmppc_xive_vp(xive, server_num);
+	if (kvmppc_xive_vp_in_use(xive->kvm, vp_id)) {
 		pr_devel("Duplicate !\n");
 		rc = -EEXIST;
 		goto bail;
@@ -141,7 +143,7 @@ int kvmppc_xive_native_connect_vcpu(struct kvm_device *dev,
 	xc->vcpu = vcpu;
 	xc->server_num = server_num;
 
-	xc->vp_id = kvmppc_xive_vp(xive, server_num);
+	xc->vp_id = vp_id;
 	xc->valid = true;
 	vcpu->arch.irq_type = KVMPPC_IRQ_XIVE;
 

