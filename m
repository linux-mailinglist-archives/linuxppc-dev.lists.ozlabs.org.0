Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5FA6FD47D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 05:40:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGLQv3FVfz3fpg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 13:40:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h2YdbDd8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h2YdbDd8;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGLLB4dmKz3fb2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 13:36:50 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34A3DIQK014822;
	Wed, 10 May 2023 03:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NmoEctYeO4hNoppfRVp6jiifp/p1Vufu1rW2DGdAkAQ=;
 b=h2YdbDd8MeT9mBPPGEyn9jwv4cPTogOgwa33zHuD6ad3djMyi7vld6bjdIx3uAqVuDd1
 gNrziwLj9TjX6gQgyJXH4PwkWAEERZhbUXD6pheHLUHhfZ/slwyjYrs/LgtjgcTR7msn
 OdmwFtFCIq+m+61ykv+98PKozO+SlPZBrURgkq1JKrOZK2S81TMPUFYWwc3ttj4boJxV
 GXialZjZbSGHi8d7m81W2g4+39m4k1hyl1u9SiHTUl2fNV/QZyeXs+LlhIIg/p0o5cIU
 eaKXIPBeDwLM/hgs1DM+AtefHiJoDTKdAzjerITonpKiuGrxovnv3eA5Yygpux3jKjeZ Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg35urdkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:36:41 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34A3aIcW009341;
	Wed, 10 May 2023 03:36:40 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg35urdhy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:36:40 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34A0aEPm015736;
	Wed, 10 May 2023 03:31:38 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3qf896rs0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:38 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34A3Va0G25428698
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 May 2023 03:31:36 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 520122004B;
	Wed, 10 May 2023 03:31:36 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B8B120043;
	Wed, 10 May 2023 03:31:35 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 May 2023 03:31:35 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 26A946060A;
	Wed, 10 May 2023 13:31:30 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 11/11] powerpc: Mark asynchronous accesses to irq_data
Date: Wed, 10 May 2023 13:31:17 +1000
Message-Id: <20230510033117.1395895-12-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230510033117.1395895-1-rmclure@linux.ibm.com>
References: <20230510033117.1395895-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: f6O1dQTRu5ZrJpjBWBcuaHbtqBrfJPFv
X-Proofpoint-GUID: Un7r928Lh3L8uKuePAj1y770H9_gzRgF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_16,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100026
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
Cc: arnd@arndb.de, gautam@linux.ibm.com, npiggin@gmail.com, Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KCSAN revealed that while irq_data entries are written to either from
behind a mutex, or otherwise atomically, accesses to irq_data->hwirq can
occur asynchronously, without volatile annotation. Mark these accesses
with READ_ONCE to avoid unfortunate compiler reorderings and remove
KCSAN warnings.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
 arch/powerpc/kernel/irq.c                 |  2 +-
 arch/powerpc/platforms/powernv/pci-ioda.c | 12 ++++++------
 include/linux/irq.h                       |  2 +-
 kernel/irq/irqdomain.c                    |  4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 6f7d4edaa0bc..4ac192755510 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -353,7 +353,7 @@ void do_softirq_own_stack(void)
 irq_hw_number_t virq_to_hw(unsigned int virq)
 {
 	struct irq_data *irq_data = irq_get_irq_data(virq);
-	return WARN_ON(!irq_data) ? 0 : irq_data->hwirq;
+	return WARN_ON(!irq_data) ? 0 : READ_ONCE(irq_data->hwirq);
 }
 EXPORT_SYMBOL_GPL(virq_to_hw);
 
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index f851f4983423..141491e86bba 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1986,7 +1986,7 @@ int64_t pnv_opal_pci_msi_eoi(struct irq_data *d)
 	struct pci_controller *hose = irq_data_get_irq_chip_data(d->parent_data);
 	struct pnv_phb *phb = hose->private_data;
 
-	return opal_pci_msi_eoi(phb->opal_id, d->parent_data->hwirq);
+	return opal_pci_msi_eoi(phb->opal_id, READ_ONCE(d->parent_data->hwirq));
 }
 
 /*
@@ -2162,11 +2162,11 @@ static void pnv_msi_compose_msg(struct irq_data *d, struct msi_msg *msg)
 	struct pnv_phb *phb = hose->private_data;
 	int rc;
 
-	rc = __pnv_pci_ioda_msi_setup(phb, pdev, d->hwirq,
+	rc = __pnv_pci_ioda_msi_setup(phb, pdev, READ_ONCE(d->hwirq),
 				      entry->pci.msi_attrib.is_64, msg);
 	if (rc)
 		dev_err(&pdev->dev, "Failed to setup %s-bit MSI #%ld : %d\n",
-			entry->pci.msi_attrib.is_64 ? "64" : "32", d->hwirq, rc);
+			entry->pci.msi_attrib.is_64 ? "64" : "32", data_race(d->hwirq), rc);
 }
 
 /*
@@ -2184,7 +2184,7 @@ static void pnv_msi_eoi(struct irq_data *d)
 		 * since it is translated into a vector number in
 		 * OPAL, use that directly.
 		 */
-		WARN_ON_ONCE(opal_pci_msi_eoi(phb->opal_id, d->hwirq));
+		WARN_ON_ONCE(opal_pci_msi_eoi(phb->opal_id, READ_ONCE(d->hwirq)));
 	}
 
 	irq_chip_eoi_parent(d);
@@ -2263,9 +2263,9 @@ static void pnv_irq_domain_free(struct irq_domain *domain, unsigned int virq,
 	struct pnv_phb *phb = hose->private_data;
 
 	pr_debug("%s bridge %pOF %d/%lx #%d\n", __func__, hose->dn,
-		 virq, d->hwirq, nr_irqs);
+		 virq, data_race(d->hwirq), nr_irqs);
 
-	msi_bitmap_free_hwirqs(&phb->msi_bmp, d->hwirq, nr_irqs);
+	msi_bitmap_free_hwirqs(&phb->msi_bmp, READ_ONCE(d->hwirq), nr_irqs);
 	/* XIVE domain is cleared through ->msi_free() */
 }
 
diff --git a/include/linux/irq.h b/include/linux/irq.h
index b1b28affb32a..a6888bcb3c5b 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -452,7 +452,7 @@ static inline bool irqd_affinity_on_activate(struct irq_data *d)
 
 static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
 {
-	return d->hwirq;
+	return READ_ONCE(d->hwirq);
 }
 
 /**
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index f34760a1e222..dd9054494f84 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -549,7 +549,7 @@ static void irq_domain_disassociate(struct irq_domain *domain, unsigned int irq)
 		 "virq%i doesn't exist; cannot disassociate\n", irq))
 		return;
 
-	hwirq = irq_data->hwirq;
+	hwirq = READ_ONCE(irq_data->hwirq);
 
 	mutex_lock(&domain->root->mutex);
 
@@ -948,7 +948,7 @@ struct irq_desc *__irq_resolve_mapping(struct irq_domain *domain,
 	if (irq_domain_is_nomap(domain)) {
 		if (hwirq < domain->hwirq_max) {
 			data = irq_domain_get_irq_data(domain, hwirq);
-			if (data && data->hwirq == hwirq)
+			if (data && READ_ONCE(data->hwirq) == hwirq)
 				desc = irq_data_to_desc(data);
 			if (irq && desc)
 				*irq = hwirq;
-- 
2.37.2

