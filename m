Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 970D72D639D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 18:34:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsLd50jP8zDqTj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 04:34:17 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsLCB6s85zDqx6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 04:15:18 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BAH20Wb142210; Thu, 10 Dec 2020 12:15:02 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35bq5csr20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 12:15:01 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BAHDFDK001891;
 Thu, 10 Dec 2020 17:15:00 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3581fhp19v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 17:14:59 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BAHEv2I32768384
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 17:14:57 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9739E52071;
 Thu, 10 Dec 2020 17:14:57 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 6DC4E52069;
 Thu, 10 Dec 2020 17:14:57 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-158-23.de.ibm.com [9.145.158.23])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E82C322012A;
 Thu, 10 Dec 2020 18:14:56 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 06/13] powerpc/xive: Add a debug_show handler to the XIVE
 irq_domain
Date: Thu, 10 Dec 2020 18:14:43 +0100
Message-Id: <20201210171450.1933725-7-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201210171450.1933725-1-clg@kaod.org>
References: <20201210171450.1933725-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-10_06:2020-12-09,
 2020-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 adultscore=0 clxscore=1034 priorityscore=1501
 spamscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=860 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012100105
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
Cc: Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Full state of the Linux interrupt descriptors can be dumped under
debugfs when compiled with CONFIG_GENERIC_IRQ_DEBUGFS. Add support for
the XIVE interrupt controller.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/common.c | 58 +++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index 7314b87d0b45..348445ffa0af 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1303,11 +1303,69 @@ static int xive_irq_domain_match(struct irq_domai=
n *h, struct device_node *node,
 	return xive_ops->match(node);
 }
=20
+#ifdef CONFIG_GENERIC_IRQ_DEBUGFS
+static const char * const esb_names[] =3D { "RESET", "OFF", "PENDING", "=
QUEUED" };
+
+static const struct {
+	u64  mask;
+	char *name;
+} xive_irq_flags[] =3D {
+	{ XIVE_IRQ_FLAG_STORE_EOI, "STORE_EOI" },
+	{ XIVE_IRQ_FLAG_LSI,       "LSI"       },
+	{ XIVE_IRQ_FLAG_SHIFT_BUG, "SHIFT_BUG" },
+	{ XIVE_IRQ_FLAG_MASK_FW,   "MASK_FW"   },
+	{ XIVE_IRQ_FLAG_EOI_FW,    "EOI_FW"    },
+	{ XIVE_IRQ_FLAG_H_INT_ESB, "H_INT_ESB" },
+	{ XIVE_IRQ_FLAG_NO_EOI,    "NO_EOI"    },
+};
+
+static void xive_irq_domain_debug_show(struct seq_file *m, struct irq_do=
main *d,
+				       struct irq_data *irqd, int ind)
+{
+	struct xive_irq_data *xd;
+	u64 val;
+	int i;
+
+	/* No IRQ domain level information. To be done */
+	if (!irqd)
+		return;
+
+	if (!is_xive_irq(irq_data_get_irq_chip(irqd)))
+		return;
+
+	seq_printf(m, "%*sXIVE:\n", ind, "");
+	ind++;
+
+	xd =3D irq_data_get_irq_handler_data(irqd);
+	if (!xd) {
+		seq_printf(m, "%*snot assigned\n", ind, "");
+		return;
+	}
+
+	val =3D xive_esb_read(xd, XIVE_ESB_GET);
+	seq_printf(m, "%*sESB:      %s\n", ind, "", esb_names[val & 0x3]);
+	seq_printf(m, "%*sPstate:   %s %s\n", ind, "", xd->stale_p ? "stale" : =
"",
+		   xd->saved_p ? "saved" : "");
+	seq_printf(m, "%*sTarget:   %d\n", ind, "", xd->target);
+	seq_printf(m, "%*sChip:     %d\n", ind, "", xd->src_chip);
+	seq_printf(m, "%*sTrigger:  0x%016llx\n", ind, "", xd->trig_page);
+	seq_printf(m, "%*sEOI:      0x%016llx\n", ind, "", xd->eoi_page);
+	seq_printf(m, "%*sFlags:    0x%llx\n", ind, "", xd->flags);
+	for (i =3D 0; i < ARRAY_SIZE(xive_irq_flags); i++) {
+		if (xd->flags & xive_irq_flags[i].mask)
+			seq_printf(m, "%*s%s\n", ind + 12, "", xive_irq_flags[i].name);
+	}
+}
+#endif
+
 static const struct irq_domain_ops xive_irq_domain_ops =3D {
 	.match =3D xive_irq_domain_match,
 	.map =3D xive_irq_domain_map,
 	.unmap =3D xive_irq_domain_unmap,
 	.xlate =3D xive_irq_domain_xlate,
+#ifdef CONFIG_GENERIC_IRQ_DEBUGFS
+	.debug_show =3D xive_irq_domain_debug_show,
+#endif
 };
=20
 static void __init xive_init_host(struct device_node *np)
--=20
2.26.2

