Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5884BA9D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 15:59:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TRQX2vnjzDqLT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 23:59:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TQlD5Gf3zDqq0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 23:28:56 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5JDIMr6188360
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 09:28:49 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t7ncajdej-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 09:28:48 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Wed, 19 Jun 2019 14:28:47 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 19 Jun 2019 14:28:44 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5JDSgmJ48955582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 13:28:42 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BABEDA4055;
 Wed, 19 Jun 2019 13:28:42 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E0BEA4053;
 Wed, 19 Jun 2019 13:28:42 +0000 (GMT)
Received: from pic2.home (unknown [9.145.171.67])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 Jun 2019 13:28:42 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, andrew.donnellan@au1.ibm.com,
 clombard@linux.ibm.com
Subject: [RFC 04/11] powerpc/powernv/ioda: Release opencapi device
Date: Wed, 19 Jun 2019 15:28:33 +0200
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190619132840.27634-1-fbarrat@linux.ibm.com>
References: <20190619132840.27634-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061913-0028-0000-0000-0000037BAE3F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061913-0029-0000-0000-0000243BBC17
Message-Id: <20190619132840.27634-5-fbarrat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=890 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906190109
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
Cc: aik@ozlabs.ru, arbab@linux.ibm.com, oohall@gmail.com, groug@kaod.org,
 alastair@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With hotplug, an opencapi device can now go away. It needs to be
released, mostly to clean up its PE state. We were previously not
defining any device callback. We can reuse the standard PCI release
callback, it does a bit too much for an opencapi device, but it's
harmless, and only needs minor tuning.

Also separate the undo of the PELT-V code in a separate function, it
is not needed for NPU devices and it improves a bit the readability of
the code.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 58 +++++++++++++++--------
 1 file changed, 38 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 2cf06fb98978..33054d00b2c5 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -186,7 +186,7 @@ static void pnv_ioda_free_pe(struct pnv_ioda_pe *pe)
 	unsigned int pe_num = pe->pe_number;
 
 	WARN_ON(pe->pdev);
-	WARN_ON(pe->npucomp); /* NPUs are not supposed to be freed */
+	WARN_ON(pe->npucomp); /* NPUs for nvlink are not supposed to be freed */
 	kfree(pe->npucomp);
 	memset(pe, 0, sizeof(struct pnv_ioda_pe));
 	clear_bit(pe_num, phb->ioda.pe_alloc);
@@ -775,6 +775,33 @@ static int pnv_ioda_set_peltv(struct pnv_phb *phb,
 	return 0;
 }
 
+static void pnv_ioda_unset_peltv(struct pnv_phb *phb,
+				 struct pnv_ioda_pe *pe,
+				 struct pci_dev *parent)
+{
+	int64_t rc;
+
+	while (parent) {
+		struct pci_dn *pdn = pci_get_pdn(parent);
+		if (pdn && pdn->pe_number != IODA_INVALID_PE) {
+			rc = opal_pci_set_peltv(phb->opal_id, pdn->pe_number,
+						pe->pe_number, OPAL_REMOVE_PE_FROM_DOMAIN);
+			/* XXX What to do in case of error ? */
+		}
+		parent = parent->bus->self;
+	}
+
+	opal_pci_eeh_freeze_clear(phb->opal_id, pe->pe_number,
+				OPAL_EEH_ACTION_CLEAR_FREEZE_ALL);
+
+	/* Disassociate PE in PELT */
+	rc = opal_pci_set_peltv(phb->opal_id, pe->pe_number,
+				pe->pe_number, OPAL_REMOVE_PE_FROM_DOMAIN);
+	if (rc)
+		pe_warn(pe, "OPAL error %lld remove self from PELTV\n", rc);
+
+}
+
 static int pnv_ioda_deconfigure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
 {
 	struct pci_dev *parent;
@@ -825,25 +852,13 @@ static int pnv_ioda_deconfigure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
 	for (rid = pe->rid; rid < rid_end; rid++)
 		phb->ioda.pe_rmap[rid] = IODA_INVALID_PE;
 
-	/* Release from all parents PELT-V */
-	while (parent) {
-		struct pci_dn *pdn = pci_get_pdn(parent);
-		if (pdn && pdn->pe_number != IODA_INVALID_PE) {
-			rc = opal_pci_set_peltv(phb->opal_id, pdn->pe_number,
-						pe->pe_number, OPAL_REMOVE_PE_FROM_DOMAIN);
-			/* XXX What to do in case of error ? */
-		}
-		parent = parent->bus->self;
-	}
-
-	opal_pci_eeh_freeze_clear(phb->opal_id, pe->pe_number,
-				  OPAL_EEH_ACTION_CLEAR_FREEZE_ALL);
+	/*
+	 * Release from all parents PELT-V. NPUs don't have a PELTV
+	 * table
+	 */
+	if (phb->type != PNV_PHB_NPU_NVLINK && phb->type != PNV_PHB_NPU_OCAPI)
+		pnv_ioda_unset_peltv(phb, pe, parent);
 
-	/* Disassociate PE in PELT */
-	rc = opal_pci_set_peltv(phb->opal_id, pe->pe_number,
-				pe->pe_number, OPAL_REMOVE_PE_FROM_DOMAIN);
-	if (rc)
-		pe_warn(pe, "OPAL error %lld remove self from PELTV\n", rc);
 	rc = opal_pci_set_pe(phb->opal_id, pe->pe_number, pe->rid,
 			     bcomp, dcomp, fcomp, OPAL_UNMAP_PE);
 	if (rc)
@@ -3528,6 +3543,8 @@ static void pnv_ioda_release_pe(struct pnv_ioda_pe *pe)
 	case PNV_PHB_IODA2:
 		pnv_pci_ioda2_release_pe_dma(pe);
 		break;
+	case PNV_PHB_NPU_OCAPI:
+		break;
 	default:
 		WARN_ON(1);
 	}
@@ -3580,7 +3597,7 @@ static void pnv_pci_release_device(struct pci_dev *pdev)
 	pe = &phb->ioda.pe_array[pdn->pe_number];
 	pdn->pe_number = IODA_INVALID_PE;
 
-	WARN_ON(--pe->device_count < 0);
+	WARN_ON((pe->flags != PNV_IODA_PE_DEV) && (--pe->device_count < 0));
 	if (pe->device_count == 0)
 		pnv_ioda_release_pe(pe);
 }
@@ -3629,6 +3646,7 @@ static const struct pci_controller_ops pnv_npu_ioda_controller_ops = {
 
 static const struct pci_controller_ops pnv_npu_ocapi_ioda_controller_ops = {
 	.enable_device_hook	= pnv_ocapi_enable_device_hook,
+	.release_device		= pnv_pci_release_device,
 	.window_alignment	= pnv_pci_window_alignment,
 	.reset_secondary_bus	= pnv_pci_reset_secondary_bus,
 	.shutdown		= pnv_pci_ioda_shutdown,
-- 
2.21.0

