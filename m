Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1BD3B9262
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 15:36:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFzks3GRvz3bp4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 23:36:21 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFzYg53dsz3bX8
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 23:28:23 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 161D4cRX047451; Thu, 1 Jul 2021 09:28:12 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39hcxa3bbf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:28:11 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 161DKIRo005592;
 Thu, 1 Jul 2021 13:28:09 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 39ft8erqar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 13:28:09 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 161DS6eS26280304
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 13:28:07 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6B305208B;
 Thu,  1 Jul 2021 13:28:06 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id A2DD2520BE;
 Thu,  1 Jul 2021 13:28:06 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.183])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 2946722016C;
 Thu,  1 Jul 2021 15:28:06 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 20/32] powerpc/xics: Add support for IRQ domain hierarchy
Date: Thu,  1 Jul 2021 15:27:38 +0200
Message-Id: <20210701132750.1475580-21-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210701132750.1475580-1-clg@kaod.org>
References: <20210701132750.1475580-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xPpfn_YY42RuDUr80A-8MHkvxOqnRRaV
X-Proofpoint-GUID: xPpfn_YY42RuDUr80A-8MHkvxOqnRRaV
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_07:2021-07-01,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 suspectscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

XICS doesn't have any state associated with the IRQ. The support is
straightforward and simpler than for XIVE.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xics/xics-common.c | 41 ++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/powerpc/sysdev/xics/xics-common.c b/arch/powerpc/sysdev=
/xics/xics-common.c
index 419d91bffec3..e82d0d4ddec0 100644
--- a/arch/powerpc/sysdev/xics/xics-common.c
+++ b/arch/powerpc/sysdev/xics/xics-common.c
@@ -406,7 +406,48 @@ int xics_retrigger(struct irq_data *data)
 	return 0;
 }
=20
+#ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
+static int xics_host_domain_translate(struct irq_domain *d, struct irq_f=
wspec *fwspec,
+				      unsigned long *hwirq, unsigned int *type)
+{
+	return xics_host_xlate(d, to_of_node(fwspec->fwnode), fwspec->param,
+			       fwspec->param_count, hwirq, type);
+}
+
+static int xics_host_domain_alloc(struct irq_domain *domain, unsigned in=
t virq,
+				  unsigned int nr_irqs, void *arg)
+{
+	struct irq_fwspec *fwspec =3D arg;
+	irq_hw_number_t hwirq;
+	unsigned int type =3D IRQ_TYPE_NONE;
+	int i, rc;
+
+	rc =3D xics_host_domain_translate(domain, fwspec, &hwirq, &type);
+	if (rc)
+		return rc;
+
+	pr_debug("%s %d/%lx #%d\n", __func__, virq, hwirq, nr_irqs);
+
+	for (i =3D 0; i < nr_irqs; i++)
+		irq_domain_set_info(domain, virq + i, hwirq + i, xics_ics->chip,
+				    xics_ics, handle_fasteoi_irq, NULL, NULL);
+
+	return 0;
+}
+
+static void xics_host_domain_free(struct irq_domain *domain,
+				  unsigned int virq, unsigned int nr_irqs)
+{
+	pr_debug("%s %d #%d\n", __func__, virq, nr_irqs);
+}
+#endif
+
 static const struct irq_domain_ops xics_host_ops =3D {
+#ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
+	.alloc	=3D xics_host_domain_alloc,
+	.free	=3D xics_host_domain_free,
+	.translate =3D xics_host_domain_translate,
+#endif
 	.match =3D xics_host_match,
 	.map =3D xics_host_map,
 	.xlate =3D xics_host_xlate,
--=20
2.31.1

