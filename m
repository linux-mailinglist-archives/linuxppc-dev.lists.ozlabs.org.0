Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FEC36F6DD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 10:07:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWlNR0SRCz3brN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:07:51 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWlJc1bjHz2xZ2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 18:04:32 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13U84G7i016719; Fri, 30 Apr 2021 04:04:20 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 388du6rdtw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 04:04:19 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13U849tF023345;
 Fri, 30 Apr 2021 08:04:15 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 384akhaxqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 08:04:15 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13U83mle33554868
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 08:03:48 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E35752050;
 Fri, 30 Apr 2021 08:04:13 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 2B57B52051;
 Fri, 30 Apr 2021 08:04:13 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id B660C2200B7;
 Fri, 30 Apr 2021 10:04:12 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 02/31] powerpc/pseries/pci: Introduce rtas_prepare_msi_irqs()
Date: Fri, 30 Apr 2021 10:03:38 +0200
Message-Id: <20210430080407.4030767-3-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430080407.4030767-1-clg@kaod.org>
References: <20210430080407.4030767-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: b-_AZWZ6SKdkOV779DJN0xxgFvP9w6G_
X-Proofpoint-ORIG-GUID: b-_AZWZ6SKdkOV779DJN0xxgFvP9w6G_
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_05:2021-04-28,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=908 malwarescore=0
 adultscore=0 mlxscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1034 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104300056
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

This splits the routine setting the MSIs in two parts: allocation of
MSIs for the PCI device at the FW level (RTAS) and the actual mapping
and activation of the IRQs.

rtas_prepare_msi_irqs() will serve as a handler for the MSI domain.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/platforms/pseries/msi.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platform=
s/pseries/msi.c
index d2d090e04745..4bf14f27e1aa 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -373,12 +373,11 @@ static void rtas_hack_32bit_msi_gen2(struct pci_dev=
 *pdev)
 	pci_write_config_dword(pdev, pdev->msi_cap + PCI_MSI_ADDRESS_HI, 0);
 }
=20
-static int rtas_setup_msi_irqs(struct pci_dev *pdev, int nvec_in, int ty=
pe)
+static int rtas_prepare_msi_irqs(struct pci_dev *pdev, int nvec_in, int =
type,
+				 msi_alloc_info_t *arg)
 {
 	struct pci_dn *pdn;
-	int hwirq, virq, i, quota, rc;
-	struct msi_desc *entry;
-	struct msi_msg msg;
+	int quota, rc;
 	int nvec =3D nvec_in;
 	int use_32bit_msi_hack =3D 0;
=20
@@ -456,6 +455,22 @@ static int rtas_setup_msi_irqs(struct pci_dev *pdev,=
 int nvec_in, int type)
 		return rc;
 	}
=20
+	return 0;
+}
+
+static int rtas_setup_msi_irqs(struct pci_dev *pdev, int nvec_in, int ty=
pe)
+{
+	struct pci_dn *pdn;
+	int hwirq, virq, i;
+	int rc;
+	struct msi_desc *entry;
+	struct msi_msg msg;
+
+	rc =3D rtas_prepare_msi_irqs(pdev, nvec_in, type, NULL);
+	if (rc)
+		return rc;
+
+	pdn =3D pci_get_pdn(pdev);
 	i =3D 0;
 	for_each_pci_msi_entry(entry, pdev) {
 		hwirq =3D rtas_query_irq_number(pdn, i++);
--=20
2.26.3

