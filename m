Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D70063153E7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 17:30:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZpKT3rDMzDsjr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 03:30:37 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZp595409zDsrf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 03:19:57 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 119GDMVP012773; Tue, 9 Feb 2021 11:19:44 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36kwqj861p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 11:19:44 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 119GFAcC000333;
 Tue, 9 Feb 2021 16:19:42 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 36hjr8bj0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 16:19:42 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 119GJeGT64881104
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Feb 2021 16:19:40 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0155811C052;
 Tue,  9 Feb 2021 16:19:40 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB7EE11C04A;
 Tue,  9 Feb 2021 16:19:39 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  9 Feb 2021 16:19:39 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.88.237])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 52D66220155;
 Tue,  9 Feb 2021 17:19:39 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/5] powerpc/xive: Simplify xive_core_debug_show()
Date: Tue,  9 Feb 2021 17:19:35 +0100
Message-Id: <20210209161936.377760-5-clg@kaod.org>
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
 adultscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=935
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1034 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102090080
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

Now that the IPI interrupt has its own domain, the checks on the HW
interrupt number XIVE_IPI_HW_IRQ and on the chip can be replaced by a
check on the domain.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/common.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index 21e8f7ef5cc4..30034af4462b 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1580,17 +1580,14 @@ static void xive_debug_show_cpu(struct seq_file *=
m, int cpu)
 	seq_puts(m, "\n");
 }
=20
-static void xive_debug_show_irq(struct seq_file *m, u32 hw_irq, struct i=
rq_data *d)
+static void xive_debug_show_irq(struct seq_file *m, struct irq_data *d)
 {
-	struct irq_chip *chip =3D irq_data_get_irq_chip(d);
+	unsigned int hw_irq =3D (unsigned int)irqd_to_hwirq(d);
 	int rc;
 	u32 target;
 	u8 prio;
 	u32 lirq;
=20
-	if (!is_xive_irq(chip))
-		return;
-
 	rc =3D xive_ops->get_irq_config(hw_irq, &target, &prio, &lirq);
 	if (rc) {
 		seq_printf(m, "IRQ 0x%08x : no config rc=3D%d\n", hw_irq, rc);
@@ -1628,16 +1625,9 @@ static int xive_core_debug_show(struct seq_file *m=
, void *private)
=20
 	for_each_irq_desc(i, desc) {
 		struct irq_data *d =3D irq_desc_get_irq_data(desc);
-		unsigned int hw_irq;
-
-		if (!d)
-			continue;
-
-		hw_irq =3D (unsigned int)irqd_to_hwirq(d);
=20
-		/* IPIs are special (HW number 0) */
-		if (hw_irq !=3D XIVE_IPI_HW_IRQ)
-			xive_debug_show_irq(m, hw_irq, d);
+		if (d->domain =3D=3D xive_irq_domain)
+			xive_debug_show_irq(m, d);
 	}
 	return 0;
 }
--=20
2.26.2

