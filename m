Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 209F62DF9B8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 09:05:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CzsTr0QvFzDqWr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 19:05:36 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CzrzY2SC6zDqLn
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 18:42:49 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BL73b4W095942; Mon, 21 Dec 2020 02:42:42 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35jpgrhjpw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Dec 2020 02:42:42 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BL7cPeV002325;
 Mon, 21 Dec 2020 07:42:41 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 35h9589spy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Dec 2020 07:42:40 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BL7gcCi46858616
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Dec 2020 07:42:38 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB331A4040;
 Mon, 21 Dec 2020 07:42:38 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88D98A4051;
 Mon, 21 Dec 2020 07:42:38 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 21 Dec 2020 07:42:38 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-39-10.uk.ibm.com [9.145.39.10])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E0C20220198;
 Mon, 21 Dec 2020 08:42:37 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 22/23] powerpc/pcidn: Make IOV setup routines static
Date: Mon, 21 Dec 2020 08:42:21 +0100
Message-Id: <20201221074222.403894-23-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201221074222.403894-1-clg@kaod.org>
References: <20201221074222.403894-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-21_02:2020-12-19,
 2020-12-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 mlxlogscore=608
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1034 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012210049
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It fixes these W=3D1 compile errors :

../arch/powerpc/platforms/pseries/pci.c:58:5: error: no previous prototyp=
e for =E2=80=98pseries_send_map_pe=E2=80=99 [-Werror=3Dmissing-prototypes=
]
   58 | int pseries_send_map_pe(struct pci_dev *pdev,
      |     ^~~~~~~~~~~~~~~~~~~
../arch/powerpc/platforms/pseries/pci.c:91:6: error: no previous prototyp=
e for =E2=80=98pseries_set_pe_num=E2=80=99 [-Werror=3Dmissing-prototypes]
   91 | void pseries_set_pe_num(struct pci_dev *pdev, u16 vf_index, __be1=
6 pe_num)
      |      ^~~~~~~~~~~~~~~~~~
../arch/powerpc/platforms/pseries/pci.c:105:5: error: no previous prototy=
pe for =E2=80=98pseries_associate_pes=E2=80=99 [-Werror=3Dmissing-prototy=
pes]
  105 | int pseries_associate_pes(struct pci_dev *pdev, u16 num_vfs)
      |     ^~~~~~~~~~~~~~~~~~~~~
../arch/powerpc/platforms/pseries/pci.c:149:5: error: no previous prototy=
pe for =E2=80=98pseries_pci_sriov_enable=E2=80=99 [-Werror=3Dmissing-prot=
otypes]
  149 | int pseries_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
../arch/powerpc/platforms/pseries/pci.c:192:5: error: no previous prototy=
pe for =E2=80=98pseries_pcibios_sriov_enable=E2=80=99 [-Werror=3Dmissing-=
prototypes]
  192 | int pseries_pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vf=
s)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../arch/powerpc/platforms/pseries/pci.c:199:5: error: no previous prototy=
pe for =E2=80=98pseries_pcibios_sriov_disable=E2=80=99 [-Werror=3Dmissing=
-prototypes]
  199 | int pseries_pcibios_sriov_disable(struct pci_dev *pdev)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Cc: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/platforms/pseries/pci.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/pci.c b/arch/powerpc/platform=
s/pseries/pci.c
index 72a4d4167849..7201642f0690 100644
--- a/arch/powerpc/platforms/pseries/pci.c
+++ b/arch/powerpc/platforms/pseries/pci.c
@@ -55,9 +55,9 @@ struct pe_map_bar_entry {
 	__be32     reserved;  /* Reserved Space */
 };
=20
-int pseries_send_map_pe(struct pci_dev *pdev,
-			u16 num_vfs,
-			struct pe_map_bar_entry *vf_pe_array)
+static int pseries_send_map_pe(struct pci_dev *pdev,
+			       u16 num_vfs,
+			       struct pe_map_bar_entry *vf_pe_array)
 {
 	struct pci_dn *pdn;
 	int rc;
@@ -88,7 +88,7 @@ int pseries_send_map_pe(struct pci_dev *pdev,
 	return rc;
 }
=20
-void pseries_set_pe_num(struct pci_dev *pdev, u16 vf_index, __be16 pe_nu=
m)
+static void pseries_set_pe_num(struct pci_dev *pdev, u16 vf_index, __be1=
6 pe_num)
 {
 	struct pci_dn *pdn;
=20
@@ -102,7 +102,7 @@ void pseries_set_pe_num(struct pci_dev *pdev, u16 vf_=
index, __be16 pe_num)
 		pdn->pe_num_map[vf_index]);
 }
=20
-int pseries_associate_pes(struct pci_dev *pdev, u16 num_vfs)
+static int pseries_associate_pes(struct pci_dev *pdev, u16 num_vfs)
 {
 	struct pci_dn *pdn;
 	int i, rc, vf_index;
@@ -146,7 +146,7 @@ int pseries_associate_pes(struct pci_dev *pdev, u16 n=
um_vfs)
 	return rc;
 }
=20
-int pseries_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
+static int pseries_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 {
 	struct pci_dn         *pdn;
 	int                    rc;
@@ -189,14 +189,14 @@ int pseries_pci_sriov_enable(struct pci_dev *pdev, =
u16 num_vfs)
 	return rc;
 }
=20
-int pseries_pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
+static int pseries_pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vf=
s)
 {
 	/* Allocate PCI data */
 	add_sriov_vf_pdns(pdev);
 	return pseries_pci_sriov_enable(pdev, num_vfs);
 }
=20
-int pseries_pcibios_sriov_disable(struct pci_dev *pdev)
+static int pseries_pcibios_sriov_disable(struct pci_dev *pdev)
 {
 	struct pci_dn         *pdn;
=20
--=20
2.26.2

