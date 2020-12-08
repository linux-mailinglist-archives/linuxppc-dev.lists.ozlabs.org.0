Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA282D2E52
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 16:34:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr43X6gNBzDqfd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 02:34:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr3Yf0b5gzDqVk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 02:11:49 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B8F43nA130813; Tue, 8 Dec 2020 10:11:36 -0500
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35a5ufumqx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 10:11:36 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B8FB9Sn017083;
 Tue, 8 Dec 2020 15:11:34 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 35958q0yj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 15:11:34 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B8FBVs08454698
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Dec 2020 15:11:31 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55F42A405C;
 Tue,  8 Dec 2020 15:11:31 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DEECA4067;
 Tue,  8 Dec 2020 15:11:31 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  8 Dec 2020 15:11:31 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-158-23.de.ibm.com [9.145.158.23])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A927722017B;
 Tue,  8 Dec 2020 16:11:30 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 10/13] powerpc/xive: Remove P9 DD1 flag XIVE_IRQ_FLAG_MASK_FW
Date: Tue,  8 Dec 2020 16:11:21 +0100
Message-Id: <20201208151124.1329942-11-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208151124.1329942-1-clg@kaod.org>
References: <20201208151124.1329942-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-08_09:2020-12-08,
 2020-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 mlxlogscore=999 clxscore=1034 mlxscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012080093
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

This flag was used to support the PHB4 LSIs on P9 DD1 and we have
stopped supporting this CPU when DD2 came out. See skiboot commit:

  https://github.com/open-power/skiboot/commit/0b0d15e3c170

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/opal-api.h |  2 +-
 arch/powerpc/include/asm/xive.h     |  2 +-
 arch/powerpc/kvm/book3s_xive.c      | 54 +++++------------------------
 arch/powerpc/sysdev/xive/common.c   | 39 +--------------------
 arch/powerpc/sysdev/xive/native.c   |  2 --
 5 files changed, 11 insertions(+), 88 deletions(-)

diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/a=
sm/opal-api.h
index 48ee604ca39a..0455b679c050 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -1092,7 +1092,7 @@ enum {
 	OPAL_XIVE_IRQ_STORE_EOI		=3D 0x00000002,
 	OPAL_XIVE_IRQ_LSI		=3D 0x00000004,
 	OPAL_XIVE_IRQ_SHIFT_BUG		=3D 0x00000008, /* P9 DD1.0 workaround */
-	OPAL_XIVE_IRQ_MASK_VIA_FW	=3D 0x00000010,
+	OPAL_XIVE_IRQ_MASK_VIA_FW	=3D 0x00000010, /* P9 DD1.0 workaround */
 	OPAL_XIVE_IRQ_EOI_VIA_FW	=3D 0x00000020,
 };
=20
diff --git a/arch/powerpc/include/asm/xive.h b/arch/powerpc/include/asm/x=
ive.h
index ff805885a028..d62368d0ba91 100644
--- a/arch/powerpc/include/asm/xive.h
+++ b/arch/powerpc/include/asm/xive.h
@@ -61,7 +61,7 @@ struct xive_irq_data {
 #define XIVE_IRQ_FLAG_STORE_EOI	0x01
 #define XIVE_IRQ_FLAG_LSI	0x02
 #define XIVE_IRQ_FLAG_SHIFT_BUG	0x04 /* P9 DD1.0 workaround */
-#define XIVE_IRQ_FLAG_MASK_FW	0x08
+#define XIVE_IRQ_FLAG_MASK_FW	0x08 /* P9 DD1.0 workaround */
 #define XIVE_IRQ_FLAG_EOI_FW	0x10
 #define XIVE_IRQ_FLAG_H_INT_ESB	0x20
=20
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xiv=
e.c
index fae1c2e8da29..59a986ae640b 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -419,37 +419,16 @@ static u8 xive_lock_and_mask(struct kvmppc_xive *xi=
ve,
 	/* Get the right irq */
 	kvmppc_xive_select_irq(state, &hw_num, &xd);
=20
-	/*
-	 * If the interrupt is marked as needing masking via
-	 * firmware, we do it here. Firmware masking however
-	 * is "lossy", it won't return the old p and q bits
-	 * and won't set the interrupt to a state where it will
-	 * record queued ones. If this is an issue we should do
-	 * lazy masking instead.
-	 *
-	 * For now, we work around this in unmask by forcing
-	 * an interrupt whenever we unmask a non-LSI via FW
-	 * (if ever).
-	 */
-	if (xd->flags & OPAL_XIVE_IRQ_MASK_VIA_FW) {
-		xive_native_configure_irq(hw_num,
-				kvmppc_xive_vp(xive, state->act_server),
-				MASKED, state->number);
-		/* set old_p so we can track if an H_EOI was done */
-		state->old_p =3D true;
-		state->old_q =3D false;
-	} else {
-		/* Set PQ to 10, return old P and old Q and remember them */
-		val =3D xive_vm_esb_load(xd, XIVE_ESB_SET_PQ_10);
-		state->old_p =3D !!(val & 2);
-		state->old_q =3D !!(val & 1);
+	/* Set PQ to 10, return old P and old Q and remember them */
+	val =3D xive_vm_esb_load(xd, XIVE_ESB_SET_PQ_10);
+	state->old_p =3D !!(val & 2);
+	state->old_q =3D !!(val & 1);
=20
-		/*
-		 * Synchronize hardware to sensure the queues are updated
-		 * when masking
+	/*
+	 * Synchronize hardware to sensure the queues are updated
+	 * when masking
 		 */
-		xive_native_sync_source(hw_num);
-	}
+	xive_native_sync_source(hw_num);
=20
 	return old_prio;
 }
@@ -483,23 +462,6 @@ static void xive_finish_unmask(struct kvmppc_xive *x=
ive,
 	/* Get the right irq */
 	kvmppc_xive_select_irq(state, &hw_num, &xd);
=20
-	/*
-	 * See comment in xive_lock_and_mask() concerning masking
-	 * via firmware.
-	 */
-	if (xd->flags & OPAL_XIVE_IRQ_MASK_VIA_FW) {
-		xive_native_configure_irq(hw_num,
-				kvmppc_xive_vp(xive, state->act_server),
-				state->act_priority, state->number);
-		/* If an EOI is needed, do it here */
-		if (!state->old_p)
-			xive_vm_source_eoi(hw_num, xd);
-		/* If this is not an LSI, force a trigger */
-		if (!(xd->flags & OPAL_XIVE_IRQ_LSI))
-			xive_irq_trigger(xd);
-		goto bail;
-	}
-
 	/* Old Q set, set PQ to 11 */
 	if (state->old_q)
 		xive_vm_esb_load(xd, XIVE_ESB_SET_PQ_11);
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index a9259470bf9f..a71412fefb65 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -424,9 +424,7 @@ static void xive_irq_eoi(struct irq_data *d)
 }
=20
 /*
- * Helper used to mask and unmask an interrupt source. This
- * is only called for normal interrupts that do not require
- * masking/unmasking via firmware.
+ * Helper used to mask and unmask an interrupt source.
  */
 static void xive_do_source_set_mask(struct xive_irq_data *xd,
 				    bool mask)
@@ -673,20 +671,6 @@ static void xive_irq_unmask(struct irq_data *d)
=20
 	pr_devel("xive_irq_unmask: irq %d data @%p\n", d->irq, xd);
=20
-	/*
-	 * This is a workaround for PCI LSI problems on P9, for
-	 * these, we call FW to set the mask. The problems might
-	 * be fixed by P9 DD2.0, if that is the case, firmware
-	 * will no longer set that flag.
-	 */
-	if (xd->flags & XIVE_IRQ_FLAG_MASK_FW) {
-		unsigned int hw_irq =3D (unsigned int)irqd_to_hwirq(d);
-		xive_ops->configure_irq(hw_irq,
-					get_hard_smp_processor_id(xd->target),
-					xive_irq_priority, d->irq);
-		return;
-	}
-
 	xive_do_source_set_mask(xd, false);
 }
=20
@@ -696,20 +680,6 @@ static void xive_irq_mask(struct irq_data *d)
=20
 	pr_devel("xive_irq_mask: irq %d data @%p\n", d->irq, xd);
=20
-	/*
-	 * This is a workaround for PCI LSI problems on P9, for
-	 * these, we call OPAL to set the mask. The problems might
-	 * be fixed by P9 DD2.0, if that is the case, firmware
-	 * will no longer set that flag.
-	 */
-	if (xd->flags & XIVE_IRQ_FLAG_MASK_FW) {
-		unsigned int hw_irq =3D (unsigned int)irqd_to_hwirq(d);
-		xive_ops->configure_irq(hw_irq,
-					get_hard_smp_processor_id(xd->target),
-					0xff, d->irq);
-		return;
-	}
-
 	xive_do_source_set_mask(xd, true);
 }
=20
@@ -852,13 +822,6 @@ static int xive_irq_set_vcpu_affinity(struct irq_dat=
a *d, void *state)
 	int rc;
 	u8 pq;
=20
-	/*
-	 * We only support this on interrupts that do not require
-	 * firmware calls for masking and unmasking
-	 */
-	if (xd->flags & XIVE_IRQ_FLAG_MASK_FW)
-		return -EIO;
-
 	/*
 	 * This is called by KVM with state non-NULL for enabling
 	 * pass-through or NULL for disabling it
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive=
/native.c
index 0310783241b5..deb97ad25d62 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -64,8 +64,6 @@ int xive_native_populate_irq_data(u32 hw_irq, struct xi=
ve_irq_data *data)
 		data->flags |=3D XIVE_IRQ_FLAG_STORE_EOI;
 	if (opal_flags & OPAL_XIVE_IRQ_LSI)
 		data->flags |=3D XIVE_IRQ_FLAG_LSI;
-	if (opal_flags & OPAL_XIVE_IRQ_MASK_VIA_FW)
-		data->flags |=3D XIVE_IRQ_FLAG_MASK_FW;
 	if (opal_flags & OPAL_XIVE_IRQ_EOI_VIA_FW)
 		data->flags |=3D XIVE_IRQ_FLAG_EOI_FW;
 	data->eoi_page =3D be64_to_cpu(eoi_page);
--=20
2.26.2

