Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC533CFAEE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 15:43:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTg0B1R24z3bqT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 23:43:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTfzT0pYSz2yLV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 23:42:44 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KDWoXl187583; Tue, 20 Jul 2021 09:42:28 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wxr7hrs2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 09:42:28 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16KDScam003321;
 Tue, 20 Jul 2021 13:42:26 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 39upu88s7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 13:42:26 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16KDdxog31261022
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Jul 2021 13:39:59 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4F23A4066;
 Tue, 20 Jul 2021 13:42:23 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7579EA4062;
 Tue, 20 Jul 2021 13:42:23 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 20 Jul 2021 13:42:23 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.24.171])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id EE07E220179;
 Tue, 20 Jul 2021 15:42:21 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] KVM: PPC: Book3S HV: XIVE: Add a 'flags' field
Date: Tue, 20 Jul 2021 15:42:08 +0200
Message-Id: <20210720134209.256133-2-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720134209.256133-1-clg@kaod.org>
References: <20210720134209.256133-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Thh_bGqggNSq-zG0J2p3cr8y1WwYHJe-
X-Proofpoint-ORIG-GUID: Thh_bGqggNSq-zG0J2p3cr8y1WwYHJe-
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_07:2021-07-19,
 2021-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 spamscore=0 clxscore=1034 impostorscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107200087
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
Cc: Paul Mackerras <paulus@samba.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use it to hold platform specific features. P9 DD2 introduced
single-escalation support. P10 will add others.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/kvm/book3s_xive.h        |  9 ++++++++-
 arch/powerpc/kvm/book3s_xive.c        | 19 ++++++++++---------
 arch/powerpc/kvm/book3s_xive_native.c | 12 +++++++-----
 3 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_xive.h b/arch/powerpc/kvm/book3s_xiv=
e.h
index afe9eeac6d56..73c3cd25093c 100644
--- a/arch/powerpc/kvm/book3s_xive.h
+++ b/arch/powerpc/kvm/book3s_xive.h
@@ -97,6 +97,8 @@ struct kvmppc_xive_ops {
 	int (*reset_mapped)(struct kvm *kvm, unsigned long guest_irq);
 };
=20
+#define KVMPPC_XIVE_FLAG_SINGLE_ESCALATION 0x1
+
 struct kvmppc_xive {
 	struct kvm *kvm;
 	struct kvm_device *dev;
@@ -133,7 +135,7 @@ struct kvmppc_xive {
 	u32	q_page_order;
=20
 	/* Flags */
-	u8	single_escalation;
+	u8	flags;
=20
 	/* Number of entries in the VP block */
 	u32	nr_servers;
@@ -308,5 +310,10 @@ void xive_cleanup_single_escalation(struct kvm_vcpu =
*vcpu,
 int kvmppc_xive_compute_vp_id(struct kvmppc_xive *xive, u32 cpu, u32 *vp=
);
 int kvmppc_xive_set_nr_servers(struct kvmppc_xive *xive, u64 addr);
=20
+static inline bool kvmppc_xive_has_single_escalation(struct kvmppc_xive =
*xive)
+{
+	return xive->flags & KVMPPC_XIVE_FLAG_SINGLE_ESCALATION;
+}
+
 #endif /* CONFIG_KVM_XICS */
 #endif /* _KVM_PPC_BOOK3S_XICS_H */
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xiv=
e.c
index 8cfab3547494..12f101d74b48 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -363,9 +363,9 @@ static int xive_check_provisioning(struct kvm *kvm, u=
8 prio)
 		if (!vcpu->arch.xive_vcpu)
 			continue;
 		rc =3D xive_provision_queue(vcpu, prio);
-		if (rc =3D=3D 0 && !xive->single_escalation)
+		if (rc =3D=3D 0 && !kvmppc_xive_has_single_escalation(xive))
 			kvmppc_xive_attach_escalation(vcpu, prio,
-						      xive->single_escalation);
+						      kvmppc_xive_has_single_escalation(xive));
 		if (rc)
 			return rc;
 	}
@@ -1199,7 +1199,7 @@ void kvmppc_xive_cleanup_vcpu(struct kvm_vcpu *vcpu=
)
 	/* Free escalations */
 	for (i =3D 0; i < KVMPPC_XIVE_Q_COUNT; i++) {
 		if (xc->esc_virq[i]) {
-			if (xc->xive->single_escalation)
+			if (kvmppc_xive_has_single_escalation(xc->xive))
 				xive_cleanup_single_escalation(vcpu, xc,
 							xc->esc_virq[i]);
 			free_irq(xc->esc_virq[i], vcpu);
@@ -1340,7 +1340,7 @@ int kvmppc_xive_connect_vcpu(struct kvm_device *dev=
,
 	 * Enable the VP first as the single escalation mode will
 	 * affect escalation interrupts numbering
 	 */
-	r =3D xive_native_enable_vp(xc->vp_id, xive->single_escalation);
+	r =3D xive_native_enable_vp(xc->vp_id, kvmppc_xive_has_single_escalatio=
n(xive));
 	if (r) {
 		pr_err("Failed to enable VP in OPAL, err %d\n", r);
 		goto bail;
@@ -1357,15 +1357,15 @@ int kvmppc_xive_connect_vcpu(struct kvm_device *d=
ev,
 		struct xive_q *q =3D &xc->queues[i];
=20
 		/* Single escalation, no queue 7 */
-		if (i =3D=3D 7 && xive->single_escalation)
+		if (i =3D=3D 7 && kvmppc_xive_has_single_escalation(xive))
 			break;
=20
 		/* Is queue already enabled ? Provision it */
 		if (xive->qmap & (1 << i)) {
 			r =3D xive_provision_queue(vcpu, i);
-			if (r =3D=3D 0 && !xive->single_escalation)
+			if (r =3D=3D 0 && !kvmppc_xive_has_single_escalation(xive))
 				kvmppc_xive_attach_escalation(
-					vcpu, i, xive->single_escalation);
+					vcpu, i, kvmppc_xive_has_single_escalation(xive));
 			if (r)
 				goto bail;
 		} else {
@@ -1380,7 +1380,7 @@ int kvmppc_xive_connect_vcpu(struct kvm_device *dev=
,
 	}
=20
 	/* If not done above, attach priority 0 escalation */
-	r =3D kvmppc_xive_attach_escalation(vcpu, 0, xive->single_escalation);
+	r =3D kvmppc_xive_attach_escalation(vcpu, 0, kvmppc_xive_has_single_esc=
alation(xive));
 	if (r)
 		goto bail;
=20
@@ -2135,7 +2135,8 @@ static int kvmppc_xive_create(struct kvm_device *de=
v, u32 type)
 	 */
 	xive->nr_servers =3D KVM_MAX_VCPUS;
=20
-	xive->single_escalation =3D xive_native_has_single_escalation();
+	if (xive_native_has_single_escalation())
+		xive->flags |=3D KVMPPC_XIVE_FLAG_SINGLE_ESCALATION;
=20
 	kvm->arch.xive =3D xive;
 	return 0;
diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/boo=
k3s_xive_native.c
index 573ecaab3597..2abb1358a268 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -93,7 +93,7 @@ void kvmppc_xive_native_cleanup_vcpu(struct kvm_vcpu *v=
cpu)
 	for (i =3D 0; i < KVMPPC_XIVE_Q_COUNT; i++) {
 		/* Free the escalation irq */
 		if (xc->esc_virq[i]) {
-			if (xc->xive->single_escalation)
+			if (kvmppc_xive_has_single_escalation(xc->xive))
 				xive_cleanup_single_escalation(vcpu, xc,
 							xc->esc_virq[i]);
 			free_irq(xc->esc_virq[i], vcpu);
@@ -172,7 +172,7 @@ int kvmppc_xive_native_connect_vcpu(struct kvm_device=
 *dev,
 	 * Enable the VP first as the single escalation mode will
 	 * affect escalation interrupts numbering
 	 */
-	rc =3D xive_native_enable_vp(xc->vp_id, xive->single_escalation);
+	rc =3D xive_native_enable_vp(xc->vp_id, kvmppc_xive_has_single_escalati=
on(xive));
 	if (rc) {
 		pr_err("Failed to enable VP in OPAL: %d\n", rc);
 		goto bail;
@@ -693,7 +693,7 @@ static int kvmppc_xive_native_set_queue_config(struct=
 kvmppc_xive *xive,
 	}
=20
 	rc =3D kvmppc_xive_attach_escalation(vcpu, priority,
-					   xive->single_escalation);
+					   kvmppc_xive_has_single_escalation(xive));
 error:
 	if (rc)
 		kvmppc_xive_native_cleanup_queue(vcpu, priority);
@@ -820,7 +820,7 @@ static int kvmppc_xive_reset(struct kvmppc_xive *xive=
)
 		for (prio =3D 0; prio < KVMPPC_XIVE_Q_COUNT; prio++) {
=20
 			/* Single escalation, no queue 7 */
-			if (prio =3D=3D 7 && xive->single_escalation)
+			if (prio =3D=3D 7 && kvmppc_xive_has_single_escalation(xive))
 				break;
=20
 			if (xc->esc_virq[prio]) {
@@ -1111,7 +1111,9 @@ static int kvmppc_xive_native_create(struct kvm_dev=
ice *dev, u32 type)
 	 */
 	xive->nr_servers =3D KVM_MAX_VCPUS;
=20
-	xive->single_escalation =3D xive_native_has_single_escalation();
+	if (xive_native_has_single_escalation())
+		xive->flags |=3D KVMPPC_XIVE_FLAG_SINGLE_ESCALATION;
+
 	xive->ops =3D &kvmppc_xive_native_ops;
=20
 	kvm->arch.xive =3D xive;
--=20
2.31.1

