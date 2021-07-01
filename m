Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D53963B9248
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 15:30:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFzc658Sdz3dcX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 23:30:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFzYW5d7Nz3036
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 23:28:14 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 161D2qXk052631; Thu, 1 Jul 2021 09:28:07 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39hdtk9hjd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:28:07 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 161DNcIC015810;
 Thu, 1 Jul 2021 13:28:05 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 39h19bgdtb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 13:28:05 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 161DS2xs35258760
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 13:28:02 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 978F3A409F;
 Thu,  1 Jul 2021 13:28:02 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70C7FA407E;
 Thu,  1 Jul 2021 13:28:02 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu,  1 Jul 2021 13:28:02 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.183])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E021F2201CC;
 Thu,  1 Jul 2021 15:28:01 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 11/32] powerpc/powernv/pci: Introduce
 __pnv_pci_ioda_msi_setup()
Date: Thu,  1 Jul 2021 15:27:29 +0200
Message-Id: <20210701132750.1475580-12-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210701132750.1475580-1-clg@kaod.org>
References: <20210701132750.1475580-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xOzwdvAwRkj3XcKIp7M-m8kBC4Y-G7jG
X-Proofpoint-GUID: xOzwdvAwRkj3XcKIp7M-m8kBC4Y-G7jG
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_07:2021-07-01,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=686 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 adultscore=0 impostorscore=0
 clxscore=1034 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107010082
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

It will be used as a 'compose_msg' handler of the MSI domain introduced
later.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 28 +++++++++++++++++++----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/pla=
tforms/powernv/pci-ioda.c
index 7de464679292..2922674cc934 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -2016,15 +2016,17 @@ bool is_pnv_opal_msi(struct irq_chip *chip)
 }
 EXPORT_SYMBOL_GPL(is_pnv_opal_msi);
=20
-static int pnv_pci_ioda_msi_setup(struct pnv_phb *phb, struct pci_dev *d=
ev,
-				  unsigned int hwirq, unsigned int virq,
-				  unsigned int is_64, struct msi_msg *msg)
+static int __pnv_pci_ioda_msi_setup(struct pnv_phb *phb, struct pci_dev =
*dev,
+				    unsigned int xive_num,
+				    unsigned int is_64, struct msi_msg *msg)
 {
 	struct pnv_ioda_pe *pe =3D pnv_ioda_get_pe(dev);
-	unsigned int xive_num =3D hwirq - phb->msi_base;
 	__be32 data;
 	int rc;
=20
+	dev_dbg(&dev->dev, "%s: setup %s-bit MSI for vector #%d\n", __func__,
+		is_64 ? "64" : "32", xive_num);
+
 	/* No PE assigned ? bail out ... no MSI for you ! */
 	if (pe =3D=3D NULL)
 		return -ENXIO;
@@ -2072,12 +2074,28 @@ static int pnv_pci_ioda_msi_setup(struct pnv_phb =
*phb, struct pci_dev *dev,
 	}
 	msg->data =3D be32_to_cpu(data);
=20
+	return 0;
+}
+
+static int pnv_pci_ioda_msi_setup(struct pnv_phb *phb, struct pci_dev *d=
ev,
+				  unsigned int hwirq, unsigned int virq,
+				  unsigned int is_64, struct msi_msg *msg)
+{
+	struct pnv_ioda_pe *pe =3D pnv_ioda_get_pe(dev);
+	unsigned int xive_num =3D hwirq - phb->msi_base;
+	int rc;
+
+	rc =3D __pnv_pci_ioda_msi_setup(phb, dev, xive_num, is_64, msg);
+	if (rc)
+		return rc;
+
+	/* P8 only */
 	pnv_set_msi_irq_chip(phb, virq);
=20
 	pr_devel("%s: %s-bit MSI on hwirq %x (xive #%d),"
 		 " address=3D%x_%08x data=3D%x PE# %x\n",
 		 pci_name(dev), is_64 ? "64" : "32", hwirq, xive_num,
-		 msg->address_hi, msg->address_lo, data, pe->pe_number);
+		 msg->address_hi, msg->address_lo, msg->data, pe->pe_number);
=20
 	return 0;
 }
--=20
2.31.1

