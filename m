Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CD32E9823
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 16:14:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8fKb6nwzzDqg3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 02:13:55 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8dQg1GSVzDqLw
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jan 2021 01:33:14 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 104EWqhk069408; Mon, 4 Jan 2021 09:33:01 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35v4n6rc3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 09:32:59 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 104EWLRV028568;
 Mon, 4 Jan 2021 14:32:26 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 35tgf89xxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 14:32:25 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 104EWNJV45941110
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Jan 2021 14:32:23 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9CE8AE04D;
 Mon,  4 Jan 2021 14:32:23 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87B35AE055;
 Mon,  4 Jan 2021 14:32:23 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  4 Jan 2021 14:32:23 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-4-90.uk.ibm.com [9.145.4.90])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id D4DCD220073;
 Mon,  4 Jan 2021 15:32:22 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 22/23] powerpc/pcidn: Make IOV setup routines static
Date: Mon,  4 Jan 2021 15:32:05 +0100
Message-Id: <20210104143206.695198-23-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210104143206.695198-1-clg@kaod.org>
References: <20210104143206.695198-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-04_08:2021-01-04,
 2021-01-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=748
 suspectscore=0 malwarescore=0 bulkscore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 clxscore=1034 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101040091
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These are only used locally. It fixes these W=3D1 compile errors :

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

Cc: Fr=C3=A9d=C3=A9ric Barrat <fbarrat@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/platforms/pseries/pci.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/pci.c b/arch/powerpc/platform=
s/pseries/pci.c
index 72a4d4167849..1bffbd1c9a94 100644
--- a/arch/powerpc/platforms/pseries/pci.c
+++ b/arch/powerpc/platforms/pseries/pci.c
@@ -55,9 +55,8 @@ struct pe_map_bar_entry {
 	__be32     reserved;  /* Reserved Space */
 };
=20
-int pseries_send_map_pe(struct pci_dev *pdev,
-			u16 num_vfs,
-			struct pe_map_bar_entry *vf_pe_array)
+static int pseries_send_map_pe(struct pci_dev *pdev, u16 num_vfs,
+			       struct pe_map_bar_entry *vf_pe_array)
 {
 	struct pci_dn *pdn;
 	int rc;
@@ -88,7 +87,7 @@ int pseries_send_map_pe(struct pci_dev *pdev,
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
@@ -102,7 +101,7 @@ void pseries_set_pe_num(struct pci_dev *pdev, u16 vf_=
index, __be16 pe_num)
 		pdn->pe_num_map[vf_index]);
 }
=20
-int pseries_associate_pes(struct pci_dev *pdev, u16 num_vfs)
+static int pseries_associate_pes(struct pci_dev *pdev, u16 num_vfs)
 {
 	struct pci_dn *pdn;
 	int i, rc, vf_index;
@@ -146,7 +145,7 @@ int pseries_associate_pes(struct pci_dev *pdev, u16 n=
um_vfs)
 	return rc;
 }
=20
-int pseries_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
+static int pseries_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 {
 	struct pci_dn         *pdn;
 	int                    rc;
@@ -189,14 +188,14 @@ int pseries_pci_sriov_enable(struct pci_dev *pdev, =
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

