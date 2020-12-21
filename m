Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C90C82DF9C1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 09:10:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Czsby6QfFzDqbG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 19:10:54 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CzrzY3c3JzDqMM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 18:42:49 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BL7W02o168098; Mon, 21 Dec 2020 02:42:42 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35jmpbm2x3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Dec 2020 02:42:42 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BL7ar8I030874;
 Mon, 21 Dec 2020 07:42:40 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 35h9589sd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Dec 2020 07:42:40 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BL7gc5h35521020
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Dec 2020 07:42:38 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29D5DA4051;
 Mon, 21 Dec 2020 07:42:38 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB3EAA4057;
 Mon, 21 Dec 2020 07:42:37 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 21 Dec 2020 07:42:37 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-39-10.uk.ibm.com [9.145.39.10])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4EC2922024D;
 Mon, 21 Dec 2020 08:42:37 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 21/23] powerpc/pseries: Make IOV setup routines static
Date: Mon, 21 Dec 2020 08:42:20 +0100
Message-Id: <20201221074222.403894-22-clg@kaod.org>
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
 impostorscore=0 mlxscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=805 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 clxscore=1034 malwarescore=0
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

../arch/powerpc/platforms/pseries/setup.c:610:17: error: no previous prot=
otype for =E2=80=98pseries_get_iov_fw_value=E2=80=99 [-Werror=3Dmissing-p=
rototypes]
  610 | resource_size_t pseries_get_iov_fw_value(struct pci_dev *dev, int=
 resno,
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~
../arch/powerpc/platforms/pseries/setup.c:646:6: error: no previous proto=
type for =E2=80=98of_pci_set_vf_bar_size=E2=80=99 [-Werror=3Dmissing-prot=
otypes]
  646 | void of_pci_set_vf_bar_size(struct pci_dev *dev, const int *index=
es)
      |      ^~~~~~~~~~~~~~~~~~~~~~
../arch/powerpc/platforms/pseries/setup.c:668:6: error: no previous proto=
type for =E2=80=98of_pci_parse_iov_addrs=E2=80=99 [-Werror=3Dmissing-prot=
otypes]
  668 | void of_pci_parse_iov_addrs(struct pci_dev *dev, const int *index=
es)
      |      ^~~~~~~~~~~~~~~~~~~~~~

Cc: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/platforms/pseries/setup.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platfo=
rms/pseries/setup.c
index 090c13f6c881..0272aa4e74e3 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -607,8 +607,8 @@ enum get_iov_fw_value_index {
 	WDW_SIZE      =3D 3     /*  Get Window Size */
 };
=20
-resource_size_t pseries_get_iov_fw_value(struct pci_dev *dev, int resno,
-					 enum get_iov_fw_value_index value)
+static resource_size_t pseries_get_iov_fw_value(struct pci_dev *dev, int=
 resno,
+						enum get_iov_fw_value_index value)
 {
 	const int *indexes;
 	struct device_node *dn =3D pci_device_to_OF_node(dev);
@@ -643,7 +643,7 @@ resource_size_t pseries_get_iov_fw_value(struct pci_d=
ev *dev, int resno,
 	return ret;
 }
=20
-void of_pci_set_vf_bar_size(struct pci_dev *dev, const int *indexes)
+static void of_pci_set_vf_bar_size(struct pci_dev *dev, const int *index=
es)
 {
 	struct resource *res;
 	resource_size_t base, size;
@@ -665,7 +665,7 @@ void of_pci_set_vf_bar_size(struct pci_dev *dev, cons=
t int *indexes)
 	}
 }
=20
-void of_pci_parse_iov_addrs(struct pci_dev *dev, const int *indexes)
+static void of_pci_parse_iov_addrs(struct pci_dev *dev, const int *index=
es)
 {
 	struct resource *res, *root, *conflict;
 	resource_size_t base, size;
--=20
2.26.2

