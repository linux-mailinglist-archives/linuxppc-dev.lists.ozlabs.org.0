Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB8C3B9253
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 15:33:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFzgF0WQTz3fQh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 23:33:13 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFzYb12hjz304d
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 23:28:18 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 161D2hdC178508; Thu, 1 Jul 2021 09:28:12 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39hc20522y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:28:12 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 161DKX3Z005596;
 Thu, 1 Jul 2021 13:28:11 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 39ft8erqat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 13:28:10 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 161DS8LP21496254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 13:28:08 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEF33520BE;
 Thu,  1 Jul 2021 13:28:08 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 819AA520C8;
 Thu,  1 Jul 2021 13:28:08 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.183])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 06C2D22016C;
 Thu,  1 Jul 2021 15:28:07 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 24/32] powerpc/pseries/pci: Drop unused MSI code
Date: Thu,  1 Jul 2021 15:27:42 +0200
Message-Id: <20210701132750.1475580-25-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210701132750.1475580-1-clg@kaod.org>
References: <20210701132750.1475580-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PoKu7wSO9keW9mO5Nlyh0X_VNLXFLdEL
X-Proofpoint-ORIG-GUID: PoKu7wSO9keW9mO5Nlyh0X_VNLXFLdEL
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_07:2021-07-01,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1034 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2107010082
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

MSIs should be fully managed by the PCI and IRQ subsystems now.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/platforms/pseries/msi.c | 87 ----------------------------
 1 file changed, 87 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platform=
s/pseries/msi.c
index e196cc1b8540..1b305e411862 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -111,21 +111,6 @@ static int rtas_query_irq_number(struct pci_dn *pdn,=
 int offset)
 	return rtas_ret[0];
 }
=20
-static void rtas_teardown_msi_irqs(struct pci_dev *pdev)
-{
-	struct msi_desc *entry;
-
-	for_each_pci_msi_entry(entry, pdev) {
-		if (!entry->irq)
-			continue;
-
-		irq_set_msi_desc(entry->irq, NULL);
-		irq_dispose_mapping(entry->irq);
-	}
-
-	rtas_disable_msi(pdev);
-}
-
 static int check_req(struct pci_dev *pdev, int nvec, char *prop_name)
 {
 	struct device_node *dn;
@@ -459,66 +444,6 @@ static int rtas_prepare_msi_irqs(struct pci_dev *pde=
v, int nvec_in, int type,
 	return 0;
 }
=20
-static int rtas_setup_msi_irqs(struct pci_dev *pdev, int nvec_in, int ty=
pe)
-{
-	struct pci_dn *pdn;
-	int hwirq, virq, i;
-	int rc;
-	struct msi_desc *entry;
-	struct msi_msg msg;
-
-	rc =3D rtas_prepare_msi_irqs(pdev, nvec_in, type, NULL);
-	if (rc)
-		return rc;
-
-	pdn =3D pci_get_pdn(pdev);
-	i =3D 0;
-	for_each_pci_msi_entry(entry, pdev) {
-		hwirq =3D rtas_query_irq_number(pdn, i++);
-		if (hwirq < 0) {
-			pr_debug("rtas_msi: error (%d) getting hwirq\n", rc);
-			return hwirq;
-		}
-
-		/*
-		 * Depending on the number of online CPUs in the original
-		 * kernel, it is likely for CPU #0 to be offline in a kdump
-		 * kernel. The associated IRQs in the affinity mappings
-		 * provided by irq_create_affinity_masks() are thus not
-		 * started by irq_startup(), as per-design for managed IRQs.
-		 * This can be a problem with multi-queue block devices driven
-		 * by blk-mq : such a non-started IRQ is very likely paired
-		 * with the single queue enforced by blk-mq during kdump (see
-		 * blk_mq_alloc_tag_set()). This causes the device to remain
-		 * silent and likely hangs the guest at some point.
-		 *
-		 * We don't really care for fine-grained affinity when doing
-		 * kdump actually : simply ignore the pre-computed affinity
-		 * masks in this case and let the default mask with all CPUs
-		 * be used when creating the IRQ mappings.
-		 */
-		if (is_kdump_kernel())
-			virq =3D irq_create_mapping(NULL, hwirq);
-		else
-			virq =3D irq_create_mapping_affinity(NULL, hwirq,
-							   entry->affinity);
-
-		if (!virq) {
-			pr_debug("rtas_msi: Failed mapping hwirq %d\n", hwirq);
-			return -ENOSPC;
-		}
-
-		dev_dbg(&pdev->dev, "rtas_msi: allocated virq %d\n", virq);
-		irq_set_msi_desc(virq, entry);
-
-		/* Read config space back so we can restore after reset */
-		__pci_read_msi_msg(entry, &msg);
-		entry->msg =3D msg;
-	}
-
-	return 0;
-}
-
 static int pseries_msi_ops_prepare(struct irq_domain *domain, struct dev=
ice *dev,
 				   int nvec, msi_alloc_info_t *arg)
 {
@@ -759,8 +684,6 @@ static void rtas_msi_pci_irq_fixup(struct pci_dev *pd=
ev)
=20
 static int rtas_msi_init(void)
 {
-	struct pci_controller *phb;
-
 	query_token  =3D rtas_token("ibm,query-interrupt-source-number");
 	change_token =3D rtas_token("ibm,change-msi");
=20
@@ -772,16 +695,6 @@ static int rtas_msi_init(void)
=20
 	pr_debug("rtas_msi: Registering RTAS MSI callbacks.\n");
=20
-	WARN_ON(pseries_pci_controller_ops.setup_msi_irqs);
-	pseries_pci_controller_ops.setup_msi_irqs =3D rtas_setup_msi_irqs;
-	pseries_pci_controller_ops.teardown_msi_irqs =3D rtas_teardown_msi_irqs=
;
-
-	list_for_each_entry(phb, &hose_list, list_node) {
-		WARN_ON(phb->controller_ops.setup_msi_irqs);
-		phb->controller_ops.setup_msi_irqs =3D rtas_setup_msi_irqs;
-		phb->controller_ops.teardown_msi_irqs =3D rtas_teardown_msi_irqs;
-	}
-
 	WARN_ON(ppc_md.pci_irq_fixup);
 	ppc_md.pci_irq_fixup =3D rtas_msi_pci_irq_fixup;
=20
--=20
2.31.1

