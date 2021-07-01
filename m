Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 198793B9252
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 15:32:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFzft6rpfz3f6F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 23:32:54 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFzYZ5ycwz3061
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 23:28:18 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 161D390W168011; Thu, 1 Jul 2021 09:28:06 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39hdcaan3n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:28:06 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 161DMc3L024414;
 Thu, 1 Jul 2021 13:28:04 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 39duv8aeam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 13:28:04 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 161DS2hj27984246
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 13:28:02 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C4F4420AB;
 Thu,  1 Jul 2021 13:28:02 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F307F420AE;
 Thu,  1 Jul 2021 13:28:01 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu,  1 Jul 2021 13:28:01 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.183])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 6E83622016C;
 Thu,  1 Jul 2021 15:28:01 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 10/32] powerpc/pseries/pci: Add support of MSI domains to
 PHB hotplug
Date: Thu,  1 Jul 2021 15:27:28 +0200
Message-Id: <20210701132750.1475580-11-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210701132750.1475580-1-clg@kaod.org>
References: <20210701132750.1475580-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dvkZuHV5hYOJ_N0PTZOR5WXoc8YayF-H
X-Proofpoint-ORIG-GUID: dvkZuHV5hYOJ_N0PTZOR5WXoc8YayF-H
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_07:2021-07-01,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1034
 adultscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=916 suspectscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Simply allocate or release the MSI domains when a PHB is inserted in
or removed from the machine.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/platforms/pseries/pseries.h   |  1 +
 arch/powerpc/platforms/pseries/msi.c       | 10 ++++++++++
 arch/powerpc/platforms/pseries/pci_dlpar.c |  4 ++++
 3 files changed, 15 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/plat=
forms/pseries/pseries.h
index d9280262588b..3544778e06d0 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -86,6 +86,7 @@ int pseries_root_bridge_prepare(struct pci_host_bridge =
*bridge);
=20
 extern struct pci_controller_ops pseries_pci_controller_ops;
 int pseries_msi_allocate_domains(struct pci_controller *phb);
+void pseries_msi_free_domains(struct pci_controller *phb);
=20
 unsigned long pseries_memory_block_size(void);
=20
diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platform=
s/pseries/msi.c
index f9635b01b2bf..e2127a3f7ebd 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -733,6 +733,16 @@ int pseries_msi_allocate_domains(struct pci_controll=
er *phb)
 	return __pseries_msi_allocate_domains(phb, count);
 }
=20
+void pseries_msi_free_domains(struct pci_controller *phb)
+{
+	if (phb->msi_domain)
+		irq_domain_remove(phb->msi_domain);
+	if (phb->dev_domain)
+		irq_domain_remove(phb->dev_domain);
+	if (phb->fwnode)
+		irq_domain_free_fwnode(phb->fwnode);
+}
+
 static void rtas_msi_pci_irq_fixup(struct pci_dev *pdev)
 {
 	/* No LSI -> leave MSIs (if any) configured */
diff --git a/arch/powerpc/platforms/pseries/pci_dlpar.c b/arch/powerpc/pl=
atforms/pseries/pci_dlpar.c
index a8f9140a24fa..90c9d3531694 100644
--- a/arch/powerpc/platforms/pseries/pci_dlpar.c
+++ b/arch/powerpc/platforms/pseries/pci_dlpar.c
@@ -33,6 +33,8 @@ struct pci_controller *init_phb_dynamic(struct device_n=
ode *dn)
=20
 	pci_devs_phb_init_dynamic(phb);
=20
+	pseries_msi_allocate_domains(phb);
+
 	/* Create EEH devices for the PHB */
 	eeh_phb_pe_create(phb);
=20
@@ -74,6 +76,8 @@ int remove_phb_dynamic(struct pci_controller *phb)
 		}
 	}
=20
+	pseries_msi_free_domains(phb);
+
 	/* Remove the PCI bus and unregister the bridge device from sysfs */
 	phb->bus =3D NULL;
 	pci_remove_bus(b);
--=20
2.31.1

