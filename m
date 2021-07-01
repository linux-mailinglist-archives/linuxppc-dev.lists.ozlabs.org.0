Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF993B926B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 15:38:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFzn31bn6z3h0v
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 23:38:15 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFzYm2k4wz3bYL
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 23:28:28 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 161D4DUU036790; Thu, 1 Jul 2021 09:28:16 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39h5mqfw19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:28:16 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 161DL0eS001433;
 Thu, 1 Jul 2021 13:28:14 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 39fv59rpvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 13:28:14 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 161DQY2d37159392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 13:26:34 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C7C042084;
 Thu,  1 Jul 2021 13:28:12 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E01C420A9;
 Thu,  1 Jul 2021 13:28:12 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu,  1 Jul 2021 13:28:12 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.183])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 9DA2B2201CC;
 Thu,  1 Jul 2021 15:28:11 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 31/32] powerpc/xive: Use XIVE domain under xmon and debugfs
Date: Thu,  1 Jul 2021 15:27:49 +0200
Message-Id: <20210701132750.1475580-32-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210701132750.1475580-1-clg@kaod.org>
References: <20210701132750.1475580-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gRSY--fo_HCwT86GLjeUTVjn_MZUTb-b
X-Proofpoint-GUID: gRSY--fo_HCwT86GLjeUTVjn_MZUTb-b
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_07:2021-07-01,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 spamscore=0 malwarescore=0 mlxlogscore=995
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

The default domain of the PCI/MSIs is not the XIVE domain anymore. To
list the IRQ mappings under XMON and debugfs, query the IRQ data from
the low level XIVE domain.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/common.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index f0012d6b4fe9..f8ff558bc305 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -322,11 +322,10 @@ void xmon_xive_get_irq_all(void)
 	struct irq_desc *desc;
=20
 	for_each_irq_desc(i, desc) {
-		struct irq_data *d =3D irq_desc_get_irq_data(desc);
-		unsigned int hwirq =3D (unsigned int)irqd_to_hwirq(d);
+		struct irq_data *d =3D irq_domain_get_irq_data(xive_irq_domain, i);
=20
-		if (d->domain =3D=3D xive_irq_domain)
-			xmon_xive_get_irq_config(hwirq, d);
+		if (d)
+			xmon_xive_get_irq_config(irqd_to_hwirq(d), d);
 	}
 }
=20
@@ -1766,9 +1765,9 @@ static int xive_core_debug_show(struct seq_file *m,=
 void *private)
 		xive_debug_show_cpu(m, cpu);
=20
 	for_each_irq_desc(i, desc) {
-		struct irq_data *d =3D irq_desc_get_irq_data(desc);
+		struct irq_data *d =3D irq_domain_get_irq_data(xive_irq_domain, i);
=20
-		if (d->domain =3D=3D xive_irq_domain)
+		if (d)
 			xive_debug_show_irq(m, d);
 	}
 	return 0;
--=20
2.31.1

