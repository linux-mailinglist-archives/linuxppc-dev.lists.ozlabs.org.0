Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F99D36F6EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 10:11:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWlSl0sXFz3fSR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:11:35 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWlJl6n1gz30C8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 18:04:38 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13U83sLc021910; Fri, 30 Apr 2021 04:04:21 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 388dap9ddq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 04:04:21 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13U80XGc027724;
 Fri, 30 Apr 2021 08:04:19 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 384ay8jxym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 08:04:19 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13U84HNd40239378
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 08:04:17 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4780A405B;
 Fri, 30 Apr 2021 08:04:16 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA8E2A4054;
 Fri, 30 Apr 2021 08:04:16 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 30 Apr 2021 08:04:16 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 380DF220193;
 Fri, 30 Apr 2021 10:04:16 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 09/31] powerpc/pseries/pci: Add a msi_free() handler to clear
 XIVE data
Date: Fri, 30 Apr 2021 10:03:45 +0200
Message-Id: <20210430080407.4030767-10-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430080407.4030767-1-clg@kaod.org>
References: <20210430080407.4030767-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: y9SPtOU_DcT7EYrU4v5ZfOC0S1M4man6
X-Proofpoint-GUID: y9SPtOU_DcT7EYrU4v5ZfOC0S1M4man6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_05:2021-04-28,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 phishscore=0 clxscore=1034
 spamscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The MSI domain clears the IRQ with msi_domain_free(), which calls
irq_domain_free_irqs_top(), which clears the handler data. This is a
problem for the XIVE controller since we need to unmap MMIO pages and
free a specific XIVE structure.

The 'msi_free()' handler is called before irq_domain_free_irqs_top()
when the handler data is still available. Use that to clear the XIVE
controller data.

Cc: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/xive.h      |  1 +
 arch/powerpc/platforms/pseries/msi.c | 16 +++++++++++++++-
 arch/powerpc/sysdev/xive/common.c    |  5 ++++-
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/xive.h b/arch/powerpc/include/asm/x=
ive.h
index aa094a8655b0..20ae50ab083c 100644
--- a/arch/powerpc/include/asm/xive.h
+++ b/arch/powerpc/include/asm/xive.h
@@ -111,6 +111,7 @@ void xive_native_free_vp_block(u32 vp_base);
 int xive_native_populate_irq_data(u32 hw_irq,
 				  struct xive_irq_data *data);
 void xive_cleanup_irq_data(struct xive_irq_data *xd);
+void xive_irq_free_data(unsigned int virq);
 void xive_native_free_irq(u32 irq);
 int xive_native_configure_irq(u32 hw_irq, u32 target, u8 prio, u32 sw_ir=
q);
=20
diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platform=
s/pseries/msi.c
index a41c448520d4..da9d63a088bb 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -529,6 +529,19 @@ static int pseries_msi_ops_prepare(struct irq_domain=
 *domain, struct device *dev
 	return rtas_prepare_msi_irqs(pdev, nvec, type, arg);
 }
=20
+/*
+ * ->msi_free() is called before irq_domain_free_irqs_top() when the
+ * handler data is still available. Use that to clear the XIVE
+ * controller data.
+ */
+static void pseries_msi_ops_msi_free(struct irq_domain *domain,
+				     struct msi_domain_info *info,
+				     unsigned int irq)
+{
+	if (xive_enabled())
+		xive_irq_free_data(irq);
+}
+
 /*
  * RTAS can not disable one MSI at a time. It's all or nothing. Do it
  * at the end after all IRQs have been freed.
@@ -546,6 +559,7 @@ static void pseries_msi_domain_free_irqs(struct irq_d=
omain *domain,
=20
 static struct msi_domain_ops pseries_pci_msi_domain_ops =3D {
 	.msi_prepare	=3D pseries_msi_ops_prepare,
+	.msi_free	=3D pseries_msi_ops_msi_free,
 	.domain_free_irqs =3D pseries_msi_domain_free_irqs,
 };
=20
@@ -660,7 +674,7 @@ static void pseries_irq_domain_free(struct irq_domain=
 *domain, unsigned int virq
=20
 	pr_debug("%s bridge %pOF %d #%d\n", __func__, phb->dn, virq, nr_irqs);
=20
-	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
+	/* XIVE domain data is cleared through ->msi_free() */
 }
=20
 static const struct irq_domain_ops pseries_irq_domain_ops =3D {
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index 3485baf9ec8c..191cd80ec534 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -980,6 +980,8 @@ EXPORT_SYMBOL_GPL(is_xive_irq);
=20
 void xive_cleanup_irq_data(struct xive_irq_data *xd)
 {
+	pr_debug("%s for HW %x\n", __func__, xd->hw_irq);
+
 	if (xd->eoi_mmio) {
 		unmap_kernel_range((unsigned long)xd->eoi_mmio,
 				   1u << xd->esb_shift);
@@ -1025,7 +1027,7 @@ static int xive_irq_alloc_data(unsigned int virq, i=
rq_hw_number_t hw)
 	return 0;
 }
=20
-static void xive_irq_free_data(unsigned int virq)
+void xive_irq_free_data(unsigned int virq)
 {
 	struct xive_irq_data *xd =3D irq_get_handler_data(virq);
=20
@@ -1035,6 +1037,7 @@ static void xive_irq_free_data(unsigned int virq)
 	xive_cleanup_irq_data(xd);
 	kfree(xd);
 }
+EXPORT_SYMBOL_GPL(xive_irq_free_data);
=20
 #ifdef CONFIG_SMP
=20
--=20
2.26.3

