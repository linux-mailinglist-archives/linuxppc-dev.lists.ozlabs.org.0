Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EF56F9DA0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 04:08:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QF4TG5t2lz3fX5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 12:08:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r2WK9TEx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r2WK9TEx;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QF4Kd4MYyz3c9K
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 12:01:57 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3481imcJ003475;
	Mon, 8 May 2023 02:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NmoEctYeO4hNoppfRVp6jiifp/p1Vufu1rW2DGdAkAQ=;
 b=r2WK9TExX2okpVmNPDLLEANynFNcnyS0nQEiz6PxC1tt+yTNdKqMtH2LU6vr6Pyro/46
 Uz+RHZiGfZr7rzCj9qlTAvoIB0nJm9MbbwYIIvPY4+dhlfXRaTbE14FQvYcQPINfyWOq
 A8+5bU2cPhRfCBFyXpvMgRnn+TLfIQPsG7SY2OS0eYGluOsKbVnNOXQEdSRKt+UdEc+r
 ugQj5ak3rJJam4BPeo899UmojAoqvmEVf3sVZBj8iicZhLOcp2mG/NEgm4IQu3DZn6C9
 Sqc+gfyjlit3/2pCR9A+wsvoGYs7B9HcIQ1ogx5+197Y8I6AqeGkn5hYACbJKQje54tL iA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qeqpcr9yu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 02:01:46 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3481smBc030972;
	Mon, 8 May 2023 02:01:45 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qeqpcr9yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 02:01:45 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3480vT1I014068;
	Mon, 8 May 2023 02:01:43 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3qdeh6gpe8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 02:01:43 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34821foH27853206
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 May 2023 02:01:41 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32D3C2004B;
	Mon,  8 May 2023 02:01:41 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32B3920043;
	Mon,  8 May 2023 02:01:40 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 May 2023 02:01:40 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 68A73605F2;
	Mon,  8 May 2023 12:01:35 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 12/12] powerpc: Mark asynchronous accesses to irq_data
Date: Mon,  8 May 2023 12:01:20 +1000
Message-Id: <20230508020120.218494-13-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230508020120.218494-1-rmclure@linux.ibm.com>
References: <20230508020120.218494-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: F0PGzsKeR-Nt9j1EJXVc8hOp21M-NiKw
X-Proofpoint-ORIG-GUID: 9kWjnsl5ccv3dOAYQB8yaBSJAqLYJoiD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-07_10,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305080009
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, npiggin@gmail.com, arnd@arndb.de
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

