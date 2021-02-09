Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FE33153DB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 17:28:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZpH12vgxzDqWl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 03:28:29 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZp542VBGzDspG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 03:19:51 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 119G4jdP127744; Tue, 9 Feb 2021 11:19:42 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36kuxxkffk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 11:19:42 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 119GEk79022973;
 Tue, 9 Feb 2021 16:19:41 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 36hqda3cdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 16:19:40 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 119GJc7B17039864
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Feb 2021 16:19:38 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A909E4C046;
 Tue,  9 Feb 2021 16:19:38 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E9314C044;
 Tue,  9 Feb 2021 16:19:38 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  9 Feb 2021 16:19:38 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.88.237])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 034062202B9;
 Tue,  9 Feb 2021 17:19:37 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/5] powerpc/xive: Use cpu_to_node() instead of ibm,
 chip-id property
Date: Tue,  9 Feb 2021 17:19:32 +0100
Message-Id: <20210209161936.377760-2-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210209161936.377760-1-clg@kaod.org>
References: <20210209161936.377760-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_03:2021-02-09,
 2021-02-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1034
 bulkscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=983
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090080
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

The 'chip_id' field of the XIVE CPU structure is used to choose a
target for a source located on the same chip when possible. This field
is assigned on the PowerNV platform using the "ibm,chip-id" property
on pSeries under KVM when NUMA nodes are defined but it is undefined
under PowerVM. The XIVE source structure has a similar field
'src_chip' which is only assigned on the PowerNV platform.

cpu_to_node() returns a compatible value on all platforms, 0 being the
default node. It will also give us the opportunity to set the affinity
of a source on pSeries when we can localize them.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/common.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index 7e08be5e5e4a..776871274b69 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1336,16 +1336,11 @@ static int xive_prepare_cpu(unsigned int cpu)
=20
 	xc =3D per_cpu(xive_cpu, cpu);
 	if (!xc) {
-		struct device_node *np;
-
 		xc =3D kzalloc_node(sizeof(struct xive_cpu),
 				  GFP_KERNEL, cpu_to_node(cpu));
 		if (!xc)
 			return -ENOMEM;
-		np =3D of_get_cpu_node(cpu, NULL);
-		if (np)
-			xc->chip_id =3D of_get_ibm_chip_id(np);
-		of_node_put(np);
+		xc->chip_id =3D cpu_to_node(cpu);
 		xc->hw_ipi =3D XIVE_BAD_IRQ;
=20
 		per_cpu(xive_cpu, cpu) =3D xc;
--=20
2.26.2

