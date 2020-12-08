Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAA12D2E2A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 16:25:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr3sM1WSSzDqVl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 02:25:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr3YY1JwMzDqVV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 02:11:44 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B8F95Ws135316; Tue, 8 Dec 2020 10:11:37 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 359wwkd2er-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 10:11:37 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B8F9j37019670;
 Tue, 8 Dec 2020 15:11:35 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3581u8ne66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 15:11:35 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B8FBWoI3670722
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Dec 2020 15:11:33 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0FACA407E;
 Tue,  8 Dec 2020 15:11:31 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96591A405E;
 Tue,  8 Dec 2020 15:11:31 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  8 Dec 2020 15:11:31 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-158-23.de.ibm.com [9.145.158.23])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 22647220190;
 Tue,  8 Dec 2020 16:11:31 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 11/13] powerpc/xive: Remove P9 DD1 flag XIVE_IRQ_FLAG_EOI_FW
Date: Tue,  8 Dec 2020 16:11:22 +0100
Message-Id: <20201208151124.1329942-12-clg@kaod.org>
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
 impostorscore=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 clxscore=1034
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012080086
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

This flag was used to support the P9 DD1 and we have stopped
supporting this CPU when DD2 came out. See skiboot commit:

  https://github.com/open-power/skiboot/commit/0b0d15e3c170

Also, remove eoi handler which is now unused.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/opal-api.h      |  2 +-
 arch/powerpc/include/asm/xive.h          |  2 +-
 arch/powerpc/sysdev/xive/xive-internal.h |  1 -
 arch/powerpc/kvm/book3s_xive_template.c  |  2 --
 arch/powerpc/sysdev/xive/common.c        | 13 +------------
 arch/powerpc/sysdev/xive/native.c        | 12 ------------
 arch/powerpc/sysdev/xive/spapr.c         |  6 ------
 7 files changed, 3 insertions(+), 35 deletions(-)

diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/a=
sm/opal-api.h
index 0455b679c050..0b63ba7d5917 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -1093,7 +1093,7 @@ enum {
 	OPAL_XIVE_IRQ_LSI		=3D 0x00000004,
 	OPAL_XIVE_IRQ_SHIFT_BUG		=3D 0x00000008, /* P9 DD1.0 workaround */
 	OPAL_XIVE_IRQ_MASK_VIA_FW	=3D 0x00000010, /* P9 DD1.0 workaround */
-	OPAL_XIVE_IRQ_EOI_VIA_FW	=3D 0x00000020,
+	OPAL_XIVE_IRQ_EOI_VIA_FW	=3D 0x00000020, /* P9 DD1.0 workaround */
 };
=20
 /* Flags for OPAL_XIVE_GET/SET_QUEUE_INFO */
diff --git a/arch/powerpc/include/asm/xive.h b/arch/powerpc/include/asm/x=
ive.h
index d62368d0ba91..f6150d7a757a 100644
--- a/arch/powerpc/include/asm/xive.h
+++ b/arch/powerpc/include/asm/xive.h
@@ -62,7 +62,7 @@ struct xive_irq_data {
 #define XIVE_IRQ_FLAG_LSI	0x02
 #define XIVE_IRQ_FLAG_SHIFT_BUG	0x04 /* P9 DD1.0 workaround */
 #define XIVE_IRQ_FLAG_MASK_FW	0x08 /* P9 DD1.0 workaround */
-#define XIVE_IRQ_FLAG_EOI_FW	0x10
+#define XIVE_IRQ_FLAG_EOI_FW	0x10 /* P9 DD1.0 workaround */
 #define XIVE_IRQ_FLAG_H_INT_ESB	0x20
=20
 /* Special flag set by KVM for excalation interrupts */
diff --git a/arch/powerpc/sysdev/xive/xive-internal.h b/arch/powerpc/sysd=
ev/xive/xive-internal.h
index 066d6fe3dc1d..3b7dd2cba9db 100644
--- a/arch/powerpc/sysdev/xive/xive-internal.h
+++ b/arch/powerpc/sysdev/xive/xive-internal.h
@@ -52,7 +52,6 @@ struct xive_ops {
 	void	(*shutdown)(void);
=20
 	void	(*update_pending)(struct xive_cpu *xc);
-	void	(*eoi)(u32 hw_irq);
 	void	(*sync_source)(u32 hw_irq);
 	u64	(*esb_rw)(u32 hw_irq, u32 offset, u64 data, bool write);
 #ifdef CONFIG_SMP
diff --git a/arch/powerpc/kvm/book3s_xive_template.c b/arch/powerpc/kvm/b=
ook3s_xive_template.c
index ece36e024a8f..b0015e05d99a 100644
--- a/arch/powerpc/kvm/book3s_xive_template.c
+++ b/arch/powerpc/kvm/book3s_xive_template.c
@@ -74,8 +74,6 @@ static void GLUE(X_PFX,source_eoi)(u32 hw_irq, struct x=
ive_irq_data *xd)
 	/* If the XIVE supports the new "store EOI facility, use it */
 	if (xd->flags & XIVE_IRQ_FLAG_STORE_EOI)
 		__x_writeq(0, __x_eoi_page(xd) + XIVE_ESB_STORE_EOI);
-	else if (hw_irq && xd->flags & XIVE_IRQ_FLAG_EOI_FW)
-		opal_int_eoi(hw_irq);
 	else if (xd->flags & XIVE_IRQ_FLAG_LSI) {
 		/*
 		 * For LSIs the HW EOI cycle is used rather than PQ bits,
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index a71412fefb65..fe6229dd3241 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -354,18 +354,7 @@ static void xive_do_source_eoi(u32 hw_irq, struct xi=
ve_irq_data *xd)
 	/* If the XIVE supports the new "store EOI facility, use it */
 	if (xd->flags & XIVE_IRQ_FLAG_STORE_EOI)
 		xive_esb_write(xd, XIVE_ESB_STORE_EOI, 0);
-	else if (hw_irq && xd->flags & XIVE_IRQ_FLAG_EOI_FW) {
-		/*
-		 * The FW told us to call it. This happens for some
-		 * interrupt sources that need additional HW whacking
-		 * beyond the ESB manipulation. For example LPC interrupts
-		 * on P9 DD1.0 needed a latch to be clared in the LPC bridge
-		 * itself. The Firmware will take care of it.
-		 */
-		if (WARN_ON_ONCE(!xive_ops->eoi))
-			return;
-		xive_ops->eoi(hw_irq);
-	} else {
+	else {
 		u8 eoi_val;
=20
 		/*
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive=
/native.c
index deb97ad25d62..4902d05ebbd1 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -64,8 +64,6 @@ int xive_native_populate_irq_data(u32 hw_irq, struct xi=
ve_irq_data *data)
 		data->flags |=3D XIVE_IRQ_FLAG_STORE_EOI;
 	if (opal_flags & OPAL_XIVE_IRQ_LSI)
 		data->flags |=3D XIVE_IRQ_FLAG_LSI;
-	if (opal_flags & OPAL_XIVE_IRQ_EOI_VIA_FW)
-		data->flags |=3D XIVE_IRQ_FLAG_EOI_FW;
 	data->eoi_page =3D be64_to_cpu(eoi_page);
 	data->trig_page =3D be64_to_cpu(trig_page);
 	data->esb_shift =3D be32_to_cpu(esb_shift);
@@ -380,15 +378,6 @@ static void xive_native_update_pending(struct xive_c=
pu *xc)
 	}
 }
=20
-static void xive_native_eoi(u32 hw_irq)
-{
-	/*
-	 * Not normally used except if specific interrupts need
-	 * a workaround on EOI.
-	 */
-	opal_int_eoi(hw_irq);
-}
-
 static void xive_native_setup_cpu(unsigned int cpu, struct xive_cpu *xc)
 {
 	s64 rc;
@@ -471,7 +460,6 @@ static const struct xive_ops xive_native_ops =3D {
 	.match			=3D xive_native_match,
 	.shutdown		=3D xive_native_shutdown,
 	.update_pending		=3D xive_native_update_pending,
-	.eoi			=3D xive_native_eoi,
 	.setup_cpu		=3D xive_native_setup_cpu,
 	.teardown_cpu		=3D xive_native_teardown_cpu,
 	.sync_source		=3D xive_native_sync_source,
diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/=
spapr.c
index 6610e5149d5a..01ccc0786ada 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -628,11 +628,6 @@ static void xive_spapr_update_pending(struct xive_cp=
u *xc)
 	}
 }
=20
-static void xive_spapr_eoi(u32 hw_irq)
-{
-	/* Not used */;
-}
-
 static void xive_spapr_setup_cpu(unsigned int cpu, struct xive_cpu *xc)
 {
 	/* Only some debug on the TIMA settings */
@@ -677,7 +672,6 @@ static const struct xive_ops xive_spapr_ops =3D {
 	.match			=3D xive_spapr_match,
 	.shutdown		=3D xive_spapr_shutdown,
 	.update_pending		=3D xive_spapr_update_pending,
-	.eoi			=3D xive_spapr_eoi,
 	.setup_cpu		=3D xive_spapr_setup_cpu,
 	.teardown_cpu		=3D xive_spapr_teardown_cpu,
 	.sync_source		=3D xive_spapr_sync_source,
--=20
2.26.2

