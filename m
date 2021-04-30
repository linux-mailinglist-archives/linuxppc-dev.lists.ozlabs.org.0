Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F238E36F6D3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 10:05:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWlKL02M9z3bTK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:05:10 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWlJW2HSGz2yx9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 18:04:26 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13U83amQ195982; Fri, 30 Apr 2021 04:04:18 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388drsrh42-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 04:04:18 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13U842Wq023317;
 Fri, 30 Apr 2021 08:04:16 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 384akhaxqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 08:04:16 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13U84DtZ42009004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 08:04:13 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3B1942047;
 Fri, 30 Apr 2021 08:04:13 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A06DF42041;
 Fri, 30 Apr 2021 08:04:13 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 30 Apr 2021 08:04:13 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 2D8D7220193;
 Fri, 30 Apr 2021 10:04:13 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 03/31] powerpc/xive: Add support for IRQ domain hierarchy
Date: Fri, 30 Apr 2021 10:03:39 +0200
Message-Id: <20210430080407.4030767-4-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430080407.4030767-1-clg@kaod.org>
References: <20210430080407.4030767-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cXk-cFjY2rzsHfnzs9z6ekp68QWybTVT
X-Proofpoint-GUID: cXk-cFjY2rzsHfnzs9z6ekp68QWybTVT
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_05:2021-04-28,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1034 suspectscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
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

This adds handlers to allocate/free IRQs in a domain hierarchy. We
could try to use xive_irq_domain_map() in xive_irq_domain_alloc() but
we rely on xive_irq_alloc_data() to set the IRQ handler data and
duplicating the code is simpler.

xive_irq_free_data() needs to be called when IRQ are freed to clear
the MMIO mappings and free the XIVE handler data, xive_irq_data
structure. This is going to be a problem with MSI domains which we
will address later.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/common.c | 60 +++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index 5acd76403ee7..6ad26243bc33 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1372,7 +1372,67 @@ static void xive_irq_domain_debug_show(struct seq_=
file *m, struct irq_domain *d,
 }
 #endif
=20
+static int xive_irq_domain_translate(struct irq_domain *d,
+				     struct irq_fwspec *fwspec,
+				     unsigned long *hwirq,
+				     unsigned int *type)
+{
+	return xive_irq_domain_xlate(d, to_of_node(fwspec->fwnode),
+				     fwspec->param, fwspec->param_count,
+				     hwirq, type);
+}
+
+static int xive_irq_domain_alloc(struct irq_domain *domain, unsigned int=
 virq,
+				 unsigned int nr_irqs, void *arg)
+{
+	struct irq_fwspec *fwspec =3D arg;
+	irq_hw_number_t hwirq;
+	unsigned int type =3D IRQ_TYPE_NONE;
+	int i, rc;
+
+	rc =3D xive_irq_domain_translate(domain, fwspec, &hwirq, &type);
+	if (rc)
+		return rc;
+
+	pr_debug("%s %d/%lx #%d\n", __func__, virq, hwirq, nr_irqs);
+
+	for (i =3D 0; i < nr_irqs; i++) {
+		/* TODO: call xive_irq_domain_map() */
+
+		/*
+		 * Mark interrupts as edge sensitive by default so that resend
+		 * actually works. Will fix that up below if needed.
+		 */
+		irq_clear_status_flags(virq, IRQ_LEVEL);
+
+		/* allocates and sets handler data */
+		rc =3D xive_irq_alloc_data(virq + i, hwirq + i);
+		if (rc)
+			return rc;
+
+		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
+					      &xive_irq_chip, domain->host_data);
+		irq_set_handler(virq + i, handle_fasteoi_irq);
+	}
+
+	return 0;
+}
+
+static void xive_irq_domain_free(struct irq_domain *domain,
+				 unsigned int virq, unsigned int nr_irqs)
+{
+	int i;
+
+	pr_debug("%s %d #%d\n", __func__, virq, nr_irqs);
+
+	for (i =3D 0; i < nr_irqs; i++)
+		xive_irq_free_data(virq + i);
+}
+
 static const struct irq_domain_ops xive_irq_domain_ops =3D {
+	.alloc	=3D xive_irq_domain_alloc,
+	.free	=3D xive_irq_domain_free,
+	.translate =3D xive_irq_domain_translate,
 	.match =3D xive_irq_domain_match,
 	.map =3D xive_irq_domain_map,
 	.unmap =3D xive_irq_domain_unmap,
--=20
2.26.3

