Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3AA35DFAA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 15:06:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKQpX0svqz3bTD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 23:06:12 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKQp954knz303F
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 23:05:52 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DD5TrT166109; Tue, 13 Apr 2021 09:05:39 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37w6wmhh25-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 09:05:37 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DD3Nig008970;
 Tue, 13 Apr 2021 13:03:57 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 37u39hjpqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 13:03:57 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13DD3XVx12255660
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 13:03:33 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98D9C5204E;
 Tue, 13 Apr 2021 13:03:55 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 7C02F5204F;
 Tue, 13 Apr 2021 13:03:55 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.50.152])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 8B3FD220179;
 Tue, 13 Apr 2021 15:03:54 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/xive: Use the "ibm,
 chip-id" property only under PowerNV
Date: Tue, 13 Apr 2021 15:03:52 +0200
Message-Id: <20210413130352.1183267-1-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9uUvOjqFiDig1KtNCEk4eJoNZOkL5dfi
X-Proofpoint-GUID: 9uUvOjqFiDig1KtNCEk4eJoNZOkL5dfi
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_07:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1034
 phishscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130091
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
target for a source located on the same chip. For that, the XIVE
driver queries the chip identifier from the "ibm,chip-id" property
and compares it to a 'src_chip' field identifying the chip of a
source. This information is only available on the PowerNV platform,
'src_chip' being assigned to XIVE_INVALID_CHIP_ID under pSeries.

The "ibm,chip-id" property is also not available on all platforms. It
was first introduced on PowerNV and later, under QEMU for pSeries/KVM.
However, the property is not part of PAPR and does not exist under
pSeries/PowerVM.

Assign 'chip_id' to XIVE_INVALID_CHIP_ID by default and let the
PowerNV platform override the value with the "ibm,chip-id" property.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/xive-internal.h | 1 +
 arch/powerpc/sysdev/xive/common.c        | 9 +++------
 arch/powerpc/sysdev/xive/native.c        | 6 ++++++
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/xive-internal.h b/arch/powerpc/sysd=
ev/xive/xive-internal.h
index b3a456fdd3a5..504e7edce358 100644
--- a/arch/powerpc/sysdev/xive/xive-internal.h
+++ b/arch/powerpc/sysdev/xive/xive-internal.h
@@ -44,6 +44,7 @@ struct xive_ops {
 				  u32 *sw_irq);
 	int	(*setup_queue)(unsigned int cpu, struct xive_cpu *xc, u8 prio);
 	void	(*cleanup_queue)(unsigned int cpu, struct xive_cpu *xc, u8 prio);
+	void	(*prepare_cpu)(unsigned int cpu, struct xive_cpu *xc);
 	void	(*setup_cpu)(unsigned int cpu, struct xive_cpu *xc);
 	void	(*teardown_cpu)(unsigned int cpu, struct xive_cpu *xc);
 	bool	(*match)(struct device_node *np);
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index 587738ec4229..5acd76403ee7 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1414,17 +1414,14 @@ static int xive_prepare_cpu(unsigned int cpu)
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
 		xc->hw_ipi =3D XIVE_BAD_IRQ;
+		xc->chip_id =3D XIVE_INVALID_CHIP_ID;
+		if (xive_ops->prepare_cpu)
+			xive_ops->prepare_cpu(cpu, xc);
=20
 		per_cpu(xive_cpu, cpu) =3D xc;
 	}
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive=
/native.c
index 1bb84febbaee..4fcd2dd1de71 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -382,6 +382,11 @@ static void xive_native_update_pending(struct xive_c=
pu *xc)
 	}
 }
=20
+static void xive_native_prepare_cpu(unsigned int cpu, struct xive_cpu *x=
c)
+{
+	xc->chip_id =3D cpu_to_chip_id(cpu);
+}
+
 static void xive_native_setup_cpu(unsigned int cpu, struct xive_cpu *xc)
 {
 	s64 rc;
@@ -464,6 +469,7 @@ static const struct xive_ops xive_native_ops =3D {
 	.match			=3D xive_native_match,
 	.shutdown		=3D xive_native_shutdown,
 	.update_pending		=3D xive_native_update_pending,
+	.prepare_cpu		=3D xive_native_prepare_cpu,
 	.setup_cpu		=3D xive_native_setup_cpu,
 	.teardown_cpu		=3D xive_native_teardown_cpu,
 	.sync_source		=3D xive_native_sync_source,
--=20
2.26.3

