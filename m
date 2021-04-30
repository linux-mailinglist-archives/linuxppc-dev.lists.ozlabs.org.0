Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0C136F6D9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 10:06:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWlMK1C6jz3cVN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:06:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWlJY5vJkz301j
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 18:04:29 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13U83rws021830; Fri, 30 Apr 2021 04:04:23 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 388dap9dek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 04:04:23 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13U84EoP008648;
 Fri, 30 Apr 2021 08:04:21 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 384ay89n6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 08:04:21 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13U84J4C25756100
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 08:04:19 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5AF0242042;
 Fri, 30 Apr 2021 08:04:19 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D63642047;
 Fri, 30 Apr 2021 08:04:19 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 30 Apr 2021 08:04:19 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 8B31F2200B7;
 Fri, 30 Apr 2021 10:04:18 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 14/31] KVM: PPC: Book3S HV: XIVE: Change interface of
 passthrough interrupt routines
Date: Fri, 30 Apr 2021 10:03:50 +0200
Message-Id: <20210430080407.4030767-15-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430080407.4030767-1-clg@kaod.org>
References: <20210430080407.4030767-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7JGbBT4uma8_pS8kL_doS0PHrTkXq5Xp
X-Proofpoint-GUID: 7JGbBT4uma8_pS8kL_doS0PHrTkXq5Xp
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_05:2021-04-28,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 phishscore=0 clxscore=1034
 spamscore=0 impostorscore=0 bulkscore=0 mlxlogscore=971 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104300056
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The routine kvmppc_set_passthru_irq() calls kvmppc_xive_set_mapped()
and kvmppc_xive_clr_mapped() with an IRQ descriptor. Use directly the
host IRQ number to remove a useless conversion.

Add some debug.

Cc: Paul Mackerras <paulus@ozlabs.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/kvm_ppc.h |  4 ++--
 arch/powerpc/kvm/book3s_hv.c       |  4 ++--
 arch/powerpc/kvm/book3s_xive.c     | 17 ++++++++---------
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/as=
m/kvm_ppc.h
index 8aacd76bb702..d6c52a0ec687 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -663,9 +663,9 @@ extern int kvmppc_xive_connect_vcpu(struct kvm_device=
 *dev,
 				    struct kvm_vcpu *vcpu, u32 cpu);
 extern void kvmppc_xive_cleanup_vcpu(struct kvm_vcpu *vcpu);
 extern int kvmppc_xive_set_mapped(struct kvm *kvm, unsigned long guest_i=
rq,
-				  struct irq_desc *host_desc);
+				  unsigned long host_irq);
 extern int kvmppc_xive_clr_mapped(struct kvm *kvm, unsigned long guest_i=
rq,
-				  struct irq_desc *host_desc);
+				  unsigned long host_irq);
 extern u64 kvmppc_xive_get_icp(struct kvm_vcpu *vcpu);
 extern int kvmppc_xive_set_icp(struct kvm_vcpu *vcpu, u64 icpval);
=20
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 86a0f8b0e6da..9f4eb74a11cc 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5196,7 +5196,7 @@ static int kvmppc_set_passthru_irq(struct kvm *kvm,=
 int host_irq, int guest_gsi)
 		pimap->n_mapped++;
=20
 	if (xics_on_xive())
-		rc =3D kvmppc_xive_set_mapped(kvm, guest_gsi, desc);
+		rc =3D kvmppc_xive_set_mapped(kvm, guest_gsi, host_irq);
 	else
 		kvmppc_xics_set_mapped(kvm, guest_gsi, desc->irq_data.hwirq);
 	if (rc)
@@ -5237,7 +5237,7 @@ static int kvmppc_clr_passthru_irq(struct kvm *kvm,=
 int host_irq, int guest_gsi)
 	}
=20
 	if (xics_on_xive())
-		rc =3D kvmppc_xive_clr_mapped(kvm, guest_gsi, pimap->mapped[i].desc);
+		rc =3D kvmppc_xive_clr_mapped(kvm, guest_gsi, host_irq);
 	else
 		kvmppc_xics_clr_mapped(kvm, guest_gsi, pimap->mapped[i].r_hwirq);
=20
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xiv=
e.c
index e7219b6f5f9a..3a7da42bed57 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -856,13 +856,12 @@ int kvmppc_xive_set_icp(struct kvm_vcpu *vcpu, u64 =
icpval)
 }
=20
 int kvmppc_xive_set_mapped(struct kvm *kvm, unsigned long guest_irq,
-			   struct irq_desc *host_desc)
+			   unsigned long host_irq)
 {
 	struct kvmppc_xive *xive =3D kvm->arch.xive;
 	struct kvmppc_xive_src_block *sb;
 	struct kvmppc_xive_irq_state *state;
-	struct irq_data *host_data =3D irq_desc_get_irq_data(host_desc);
-	unsigned int host_irq =3D irq_desc_get_irq(host_desc);
+	struct irq_data *host_data =3D irq_get_irq_data(host_irq);
 	unsigned int hw_irq =3D (unsigned int)irqd_to_hwirq(host_data);
 	u16 idx;
 	u8 prio;
@@ -871,7 +870,8 @@ int kvmppc_xive_set_mapped(struct kvm *kvm, unsigned =
long guest_irq,
 	if (!xive)
 		return -ENODEV;
=20
-	pr_devel("set_mapped girq 0x%lx host HW irq 0x%x...\n",guest_irq, hw_ir=
q);
+	pr_debug("%s: GIRQ 0x%lx host IRQ %ld XIVE HW IRQ 0x%x\n",
+		 __func__, guest_irq, host_irq, hw_irq);
=20
 	sb =3D kvmppc_xive_find_source(xive, guest_irq, &idx);
 	if (!sb)
@@ -893,7 +893,7 @@ int kvmppc_xive_set_mapped(struct kvm *kvm, unsigned =
long guest_irq,
 	 */
 	rc =3D irq_set_vcpu_affinity(host_irq, state);
 	if (rc) {
-		pr_err("Failed to set VCPU affinity for irq %d\n", host_irq);
+		pr_err("Failed to set VCPU affinity for host IRQ %ld\n", host_irq);
 		return rc;
 	}
=20
@@ -953,12 +953,11 @@ int kvmppc_xive_set_mapped(struct kvm *kvm, unsigne=
d long guest_irq,
 EXPORT_SYMBOL_GPL(kvmppc_xive_set_mapped);
=20
 int kvmppc_xive_clr_mapped(struct kvm *kvm, unsigned long guest_irq,
-			   struct irq_desc *host_desc)
+			   unsigned long host_irq)
 {
 	struct kvmppc_xive *xive =3D kvm->arch.xive;
 	struct kvmppc_xive_src_block *sb;
 	struct kvmppc_xive_irq_state *state;
-	unsigned int host_irq =3D irq_desc_get_irq(host_desc);
 	u16 idx;
 	u8 prio;
 	int rc;
@@ -966,7 +965,7 @@ int kvmppc_xive_clr_mapped(struct kvm *kvm, unsigned =
long guest_irq,
 	if (!xive)
 		return -ENODEV;
=20
-	pr_devel("clr_mapped girq 0x%lx...\n", guest_irq);
+	pr_debug("%s: GIRQ 0x%lx host IRQ %ld\n", __func__, guest_irq, host_irq=
);
=20
 	sb =3D kvmppc_xive_find_source(xive, guest_irq, &idx);
 	if (!sb)
@@ -993,7 +992,7 @@ int kvmppc_xive_clr_mapped(struct kvm *kvm, unsigned =
long guest_irq,
 	/* Release the passed-through interrupt to the host */
 	rc =3D irq_set_vcpu_affinity(host_irq, NULL);
 	if (rc) {
-		pr_err("Failed to clr VCPU affinity for irq %d\n", host_irq);
+		pr_err("Failed to clr VCPU affinity for host IRQ %ld\n", host_irq);
 		return rc;
 	}
=20
--=20
2.26.3

