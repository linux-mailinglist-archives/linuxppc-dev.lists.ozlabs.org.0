Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E65D2D6360
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 18:21:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsLL92K6CzDqxg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 04:21:21 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsLC45PgJzDqvy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 04:15:12 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BAH2Ds9174339; Thu, 10 Dec 2020 12:15:04 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35bqghgx65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 12:15:04 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BAHDcVc003921;
 Thu, 10 Dec 2020 17:15:02 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3581u86148-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 17:15:02 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BAHF0PO32964976
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 17:15:00 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3417B52057;
 Thu, 10 Dec 2020 17:15:00 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 0AB515205A;
 Thu, 10 Dec 2020 17:15:00 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-158-23.de.ibm.com [9.145.158.23])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 837D22204B9;
 Thu, 10 Dec 2020 18:14:59 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 11/13] powerpc/xive: Simplify xive_do_source_eoi()
Date: Thu, 10 Dec 2020 18:14:48 +0100
Message-Id: <20201210171450.1933725-12-clg@kaod.org>
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
 suspectscore=1 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 mlxlogscore=999 spamscore=0
 clxscore=1034 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012100105
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

Previous patches removed the need of the first argument which was a
hack for Firwmware EOI. Remove it and flatten the routine which has
became simpler.

Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/common.c | 72 ++++++++++++++-----------------
 1 file changed, 33 insertions(+), 39 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index ed9bc49f45a7..b8e456da28aa 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -348,39 +348,40 @@ static void xive_do_queue_eoi(struct xive_cpu *xc)
  * EOI an interrupt at the source. There are several methods
  * to do this depending on the HW version and source type
  */
-static void xive_do_source_eoi(u32 hw_irq, struct xive_irq_data *xd)
+static void xive_do_source_eoi(struct xive_irq_data *xd)
 {
+	u8 eoi_val;
+
 	xd->stale_p =3D false;
+
 	/* If the XIVE supports the new "store EOI facility, use it */
-	if (xd->flags & XIVE_IRQ_FLAG_STORE_EOI)
+	if (xd->flags & XIVE_IRQ_FLAG_STORE_EOI) {
 		xive_esb_write(xd, XIVE_ESB_STORE_EOI, 0);
-	else {
-		u8 eoi_val;
+		return;
+	}
=20
-		/*
-		 * Otherwise for EOI, we use the special MMIO that does
-		 * a clear of both P and Q and returns the old Q,
-		 * except for LSIs where we use the "EOI cycle" special
-		 * load.
-		 *
-		 * This allows us to then do a re-trigger if Q was set
-		 * rather than synthesizing an interrupt in software
-		 *
-		 * For LSIs the HW EOI cycle is used rather than PQ bits,
-		 * as they are automatically re-triggred in HW when still
-		 * pending.
-		 */
-		if (xd->flags & XIVE_IRQ_FLAG_LSI)
-			xive_esb_read(xd, XIVE_ESB_LOAD_EOI);
-		else {
-			eoi_val =3D xive_esb_read(xd, XIVE_ESB_SET_PQ_00);
-			DBG_VERBOSE("eoi_val=3D%x\n", eoi_val);
-
-			/* Re-trigger if needed */
-			if ((eoi_val & XIVE_ESB_VAL_Q) && xd->trig_mmio)
-				out_be64(xd->trig_mmio, 0);
-		}
+	/*
+	 * For LSIs, we use the "EOI cycle" special load rather than
+	 * PQ bits, as they are automatically re-triggered in HW when
+	 * still pending.
+	 */
+	if (xd->flags & XIVE_IRQ_FLAG_LSI) {
+		xive_esb_read(xd, XIVE_ESB_LOAD_EOI);
+		return;
 	}
+
+	/*
+	 * Otherwise, we use the special MMIO that does a clear of
+	 * both P and Q and returns the old Q. This allows us to then
+	 * do a re-trigger if Q was set rather than synthesizing an
+	 * interrupt in software
+	 */
+	eoi_val =3D xive_esb_read(xd, XIVE_ESB_SET_PQ_00);
+	DBG_VERBOSE("eoi_val=3D%x\n", eoi_val);
+
+	/* Re-trigger if needed */
+	if ((eoi_val & XIVE_ESB_VAL_Q) && xd->trig_mmio)
+		out_be64(xd->trig_mmio, 0);
 }
=20
 /* irq_chip eoi callback, called with irq descriptor lock held */
@@ -398,7 +399,7 @@ static void xive_irq_eoi(struct irq_data *d)
 	 */
 	if (!irqd_irq_disabled(d) && !irqd_is_forwarded_to_vcpu(d) &&
 	    !(xd->flags & XIVE_IRQ_FLAG_NO_EOI))
-		xive_do_source_eoi(irqd_to_hwirq(d), xd);
+		xive_do_source_eoi(xd);
 	else
 		xd->stale_p =3D true;
=20
@@ -788,14 +789,7 @@ static int xive_irq_retrigger(struct irq_data *d)
 	 * 11, then perform an EOI.
 	 */
 	xive_esb_read(xd, XIVE_ESB_SET_PQ_11);
-
-	/*
-	 * Note: We pass "0" to the hw_irq argument in order to
-	 * avoid calling into the backend EOI code which we don't
-	 * want to do in the case of a re-trigger. Backends typically
-	 * only do EOI for LSIs anyway.
-	 */
-	xive_do_source_eoi(0, xd);
+	xive_do_source_eoi(xd);
=20
 	return 1;
 }
@@ -910,7 +904,7 @@ static int xive_irq_set_vcpu_affinity(struct irq_data=
 *d, void *state)
 		 * while masked, the generic code will re-mask it anyway.
 		 */
 		if (!xd->saved_p)
-			xive_do_source_eoi(hw_irq, xd);
+			xive_do_source_eoi(xd);
=20
 	}
 	return 0;
@@ -1054,7 +1048,7 @@ static void xive_ipi_eoi(struct irq_data *d)
 	DBG_VERBOSE("IPI eoi: irq=3D%d [0x%lx] (HW IRQ 0x%x) pending=3D%02x\n",
 		    d->irq, irqd_to_hwirq(d), xc->hw_ipi, xc->pending_prio);
=20
-	xive_do_source_eoi(xc->hw_ipi, &xc->ipi_data);
+	xive_do_source_eoi(&xc->ipi_data);
 	xive_do_queue_eoi(xc);
 }
=20
@@ -1440,7 +1434,7 @@ static void xive_flush_cpu_queue(unsigned int cpu, =
struct xive_cpu *xc)
 		 * still asserted. Otherwise do an MSI retrigger.
 		 */
 		if (xd->flags & XIVE_IRQ_FLAG_LSI)
-			xive_do_source_eoi(irqd_to_hwirq(d), xd);
+			xive_do_source_eoi(xd);
 		else
 			xive_irq_retrigger(d);
=20
--=20
2.26.2

