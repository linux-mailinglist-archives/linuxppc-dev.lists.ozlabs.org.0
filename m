Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E6F1053B5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 14:58:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Jh3y5pSWzDqlS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 00:58:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Jgsz05kkzDr6f
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 00:49:58 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xALDlqcU080393
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 08:49:57 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wdkdehg8j-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 08:49:56 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Thu, 21 Nov 2019 13:49:55 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 21 Nov 2019 13:49:53 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xALDnpSO51708148
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Nov 2019 13:49:51 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 786775204F;
 Thu, 21 Nov 2019 13:49:51 +0000 (GMT)
Received: from bali.tlslab.ibm.com (unknown [9.101.4.17])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3095352051;
 Thu, 21 Nov 2019 13:49:51 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, andrew.donnellan@au1.ibm.com,
 clombard@linux.ibm.com
Subject: [PATCH v2 04/11] powerpc/powernv/ioda: Release opencapi device
Date: Thu, 21 Nov 2019 14:49:11 +0100
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191121134918.7155-1-fbarrat@linux.ibm.com>
References: <20191121134918.7155-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19112113-0020-0000-0000-0000038CE3BA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112113-0021-0000-0000-000021E31DFA
Message-Id: <20191121134918.7155-5-fbarrat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-21_03:2019-11-21,2019-11-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 suspectscore=2 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1911210125
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, groug@kaod.org,
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
Changelog:
v2:
 - start using pe->device_count for NPU devices to match expectations
   in pnv_pci_release_device (and because it makes sense)


 arch/powerpc/platforms/powernv/pci-ioda.c | 59 +++++++++++++++--------
 1 file changed, 40 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 55363933db37..f0ce66d977ae 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -188,7 +188,7 @@ static void pnv_ioda_free_pe(struct pnv_ioda_pe *pe)
 	unsigned int pe_num = pe->pe_number;
 
 	WARN_ON(pe->pdev);
-	WARN_ON(pe->npucomp); /* NPUs are not supposed to be freed */
+	WARN_ON(pe->npucomp); /* NPUs for nvlink are not supposed to be freed */
 	kfree(pe->npucomp);
 	memset(pe, 0, sizeof(struct pnv_ioda_pe));
 	clear_bit(pe_num, phb->ioda.pe_alloc);
@@ -777,6 +777,34 @@ static int pnv_ioda_set_peltv(struct pnv_phb *phb,
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
+
+		if (pdn && pdn->pe_number != IODA_INVALID_PE) {
+			rc = opal_pci_set_peltv(phb->opal_id, pdn->pe_number,
+						pe->pe_number,
+						OPAL_REMOVE_PE_FROM_DOMAIN);
+			/* XXX What to do in case of error ? */
+		}
+		parent = parent->bus->self;
+	}
+
+	opal_pci_eeh_freeze_clear(phb->opal_id, pe->pe_number,
+				  OPAL_EEH_ACTION_CLEAR_FREEZE_ALL);
+
+	/* Disassociate PE in PELT */
+	rc = opal_pci_set_peltv(phb->opal_id, pe->pe_number,
+				pe->pe_number, OPAL_REMOVE_PE_FROM_DOMAIN);
+	if (rc)
+		pe_warn(pe, "OPAL error %lld remove self from PELTV\n", rc);
+}
+
 static int pnv_ioda_deconfigure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
 {
 	struct pci_dev *parent;
@@ -827,25 +855,13 @@ static int pnv_ioda_deconfigure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
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
@@ -1075,6 +1091,7 @@ static struct pnv_ioda_pe *pnv_ioda_setup_dev_PE(struct pci_dev *dev)
 	pe->pbus = NULL;
 	pe->mve_number = -1;
 	pe->rid = dev->bus->number << 8 | pdn->devfn;
+	pe->device_count++;
 
 	pe_info(pe, "Associated device to PE\n");
 
@@ -1239,6 +1256,7 @@ static struct pnv_ioda_pe *pnv_ioda_setup_npu_PE(struct pci_dev *npu_pdev)
 			rid = npu_pdev->bus->number << 8 | npu_pdn->devfn;
 			npu_pdn->pe_number = pe_num;
 			phb->ioda.pe_rmap[rid] = pe->pe_number;
+			pe->device_count++;
 
 			/* Map the PE to this link */
 			rc = opal_pci_set_pe(phb->opal_id, pe_num, rid,
@@ -3544,6 +3562,8 @@ static void pnv_ioda_release_pe(struct pnv_ioda_pe *pe)
 	case PNV_PHB_IODA2:
 		pnv_pci_ioda2_release_pe_dma(pe);
 		break;
+	case PNV_PHB_NPU_OCAPI:
+		break;
 	default:
 		WARN_ON(1);
 	}
@@ -3645,6 +3665,7 @@ static const struct pci_controller_ops pnv_npu_ioda_controller_ops = {
 
 static const struct pci_controller_ops pnv_npu_ocapi_ioda_controller_ops = {
 	.enable_device_hook	= pnv_ocapi_enable_device_hook,
+	.release_device		= pnv_pci_release_device,
 	.window_alignment	= pnv_pci_window_alignment,
 	.reset_secondary_bus	= pnv_pci_reset_secondary_bus,
 	.shutdown		= pnv_pci_ioda_shutdown,
-- 
2.21.0

