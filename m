Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7592D6392
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 18:32:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsLb12JxfzDqXw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 04:32:29 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsLCB4gkrzDqwb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 04:15:18 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BAH3EII104139; Thu, 10 Dec 2020 12:15:05 -0500
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35bqnugnp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 12:15:04 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BAHCEhq002273;
 Thu, 10 Dec 2020 17:15:02 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 35958q2721-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 17:15:01 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BAHExwI34734580
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 17:14:59 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA82452069;
 Thu, 10 Dec 2020 17:14:59 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 8122652057;
 Thu, 10 Dec 2020 17:14:59 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-158-23.de.ibm.com [9.145.158.23])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 07B3422012A;
 Thu, 10 Dec 2020 18:14:58 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 10/13] powerpc/xive: Remove P9 DD1 flag XIVE_IRQ_FLAG_EOI_FW
Date: Thu, 10 Dec 2020 18:14:47 +0100
Message-Id: <20201210171450.1933725-11-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201210171450.1933725-1-clg@kaod.org>
References: <20201210171450.1933725-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-10_06:2020-12-09,
 2020-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 clxscore=1034 bulkscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012100106
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
Cc: Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This flag was used to support the P9 DD1 and we have stopped
supporting this CPU when DD2 came out. See skiboot commit:

  https://github.com/open-power/skiboot/commit/0b0d15e3c170

Also, remove eoi handler which is now unused.

Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/opal-api.h      |  2 +-
 arch/powerpc/include/asm/xive.h          |  2 +-
 arch/powerpc/sysdev/xive/xive-internal.h |  1 -
 arch/powerpc/kvm/book3s_xive_template.c  |  2 --
 arch/powerpc/sysdev/xive/common.c        | 14 +-------------
 arch/powerpc/sysdev/xive/native.c        | 12 ------------
 arch/powerpc/sysdev/xive/spapr.c         |  6 ------
 7 files changed, 3 insertions(+), 36 deletions(-)

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
index 8d5b0dcc253c..9a312b975ca8 100644
--- a/arch/powerpc/include/asm/xive.h
+++ b/arch/powerpc/include/asm/xive.h
@@ -62,7 +62,7 @@ struct xive_irq_data {
 #define XIVE_IRQ_FLAG_LSI	0x02
 /* #define XIVE_IRQ_FLAG_SHIFT_BUG	0x04 */ /* P9 DD1.0 workaround */
 /* #define XIVE_IRQ_FLAG_MASK_FW	0x08 */ /* P9 DD1.0 workaround */
-#define XIVE_IRQ_FLAG_EOI_FW	0x10
+/* #define XIVE_IRQ_FLAG_EOI_FW	0x10 */ /* P9 DD1.0 workaround */
 #define XIVE_IRQ_FLAG_H_INT_ESB	0x20
=20
 /* Special flag set by KVM for excalation interrupts */
diff --git a/arch/powerpc/sysdev/xive/xive-internal.h b/arch/powerpc/sysd=
ev/xive/xive-internal.h
index c07fadb9d264..9cf57c722faa 100644
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
index b240eb698920..ed9bc49f45a7 100644
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
@@ -1267,7 +1256,6 @@ static const struct {
 } xive_irq_flags[] =3D {
 	{ XIVE_IRQ_FLAG_STORE_EOI, "STORE_EOI" },
 	{ XIVE_IRQ_FLAG_LSI,       "LSI"       },
-	{ XIVE_IRQ_FLAG_EOI_FW,    "EOI_FW"    },
 	{ XIVE_IRQ_FLAG_H_INT_ESB, "H_INT_ESB" },
 	{ XIVE_IRQ_FLAG_NO_EOI,    "NO_EOI"    },
 };
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive=
/native.c
index 6c04ac1f3a1f..e91519c42463 100644
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

