Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D003B9256
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 15:33:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFzgb0l8pz3fVl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 23:33:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFzYb53HRz304d
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 23:28:19 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 161D3nYr136531; Thu, 1 Jul 2021 09:28:03 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39h950akhn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:28:03 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 161DLo4I020317;
 Thu, 1 Jul 2021 13:28:01 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 39duv8h9aa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 13:28:01 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 161DQKCs26083626
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 13:26:20 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BAD0DA4060;
 Thu,  1 Jul 2021 13:27:58 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B39EA408E;
 Thu,  1 Jul 2021 13:27:58 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu,  1 Jul 2021 13:27:58 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.183])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 0605E2201CC;
 Thu,  1 Jul 2021 15:27:57 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 03/32] powerpc/xive: Add support for IRQ domain hierarchy
Date: Thu,  1 Jul 2021 15:27:21 +0200
Message-Id: <20210701132750.1475580-4-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210701132750.1475580-1-clg@kaod.org>
References: <20210701132750.1475580-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: x02iyJ_w8RD9WZkCJfoEhOzUKfQfmbBN
X-Proofpoint-GUID: x02iyJ_w8RD9WZkCJfoEhOzUKfQfmbBN
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_07:2021-07-01,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1034
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 arch/powerpc/sysdev/xive/common.c | 64 +++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index f985ed331a8c..834f1a378fc2 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1375,7 +1375,71 @@ static void xive_irq_domain_debug_show(struct seq_=
file *m, struct irq_domain *d,
 }
 #endif
=20
+#ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
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
+#endif
+
 static const struct irq_domain_ops xive_irq_domain_ops =3D {
+#ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
+	.alloc	=3D xive_irq_domain_alloc,
+	.free	=3D xive_irq_domain_free,
+	.translate =3D xive_irq_domain_translate,
+#endif
 	.match =3D xive_irq_domain_match,
 	.map =3D xive_irq_domain_map,
 	.unmap =3D xive_irq_domain_unmap,
--=20
2.31.1

