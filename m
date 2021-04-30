Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD6F36F6D7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 10:06:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWlLZ71gtz3cC9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:06:14 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWlJX4hxtz2ysq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 18:04:28 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13U83r7V021844; Fri, 30 Apr 2021 04:04:22 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 388dap9ddy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 04:04:21 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13U80CoU032062;
 Fri, 30 Apr 2021 08:04:20 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 384ay8jy9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 08:04:20 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13U84HGe16253292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 08:04:18 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB94EAE058;
 Fri, 30 Apr 2021 08:04:17 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A58C3AE045;
 Fri, 30 Apr 2021 08:04:17 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 30 Apr 2021 08:04:17 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 2D34C220193;
 Fri, 30 Apr 2021 10:04:17 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 11/31] powerpc/powernv/pci: Introduce
 __pnv_pci_ioda_msi_setup()
Date: Fri, 30 Apr 2021 10:03:47 +0200
Message-Id: <20210430080407.4030767-12-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430080407.4030767-1-clg@kaod.org>
References: <20210430080407.4030767-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: b0HwfysU7UJGxMdoE5AgMADr3B3kBZrc
X-Proofpoint-GUID: b0HwfysU7UJGxMdoE5AgMADr3B3kBZrc
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_05:2021-04-28,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 phishscore=0 clxscore=1034
 spamscore=0 impostorscore=0 bulkscore=0 mlxlogscore=629 lowpriorityscore=0
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

It will be used as a 'compose_msg' handler of the MSI domain
introduced later.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 28 +++++++++++++++++++----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/pla=
tforms/powernv/pci-ioda.c
index f0f901683a2f..b2a8da6114b5 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -2160,15 +2160,17 @@ bool is_pnv_opal_msi(struct irq_chip *chip)
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
@@ -2216,12 +2218,28 @@ static int pnv_pci_ioda_msi_setup(struct pnv_phb =
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
2.26.3

