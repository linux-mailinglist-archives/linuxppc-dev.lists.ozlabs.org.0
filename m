Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B142BC478C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 08:11:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jm3r0gKYzDqSy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 16:11:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sbobroff@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jltK0myfzDqPy
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 16:03:04 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9262Nkf008927
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 2 Oct 2019 02:03:03 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vckpcuy3v-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Oct 2019 02:03:03 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Wed, 2 Oct 2019 07:03:00 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 2 Oct 2019 07:02:58 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9262vDL36372532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Oct 2019 06:02:57 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6296A4C05A;
 Wed,  2 Oct 2019 06:02:57 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA3844C046;
 Wed,  2 Oct 2019 06:02:56 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  2 Oct 2019 06:02:56 +0000 (GMT)
Received: from osmium.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 847DBA03B2;
 Wed,  2 Oct 2019 16:02:53 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH RFC 09/15] powerpw/eeh: Sync eeh_handle_special_event(),
 pnv_eeh_get_pe(), pnv_eeh_next_error()
Date: Wed,  2 Oct 2019 16:02:47 +1000
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
In-Reply-To: <cover.1569996166.git.sbobroff@linux.ibm.com>
References: <cover.1569996166.git.sbobroff@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19100206-0028-0000-0000-000003A536DA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100206-0029-0000-0000-000024673892
Message-Id: <67a2d7716989f7b4f82f11b12d1df1b4818c5a59.1569996166.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-02_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910020057
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
Cc: oohall@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Synchronize access to eeh_pe.

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
---
 arch/powerpc/kernel/eeh_driver.c             | 15 +++++---
 arch/powerpc/platforms/powernv/eeh-powernv.c | 38 ++++++++++++++++----
 2 files changed, 43 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index c9d73070793e..bc5d58bf3904 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -1184,6 +1184,7 @@ void eeh_handle_special_event(void)
 
 
 	do {
+		/* Acquire ref if rc == _FROZEN_PE, _FENCED_PHB or _DEAD_PHB */
 		rc = eeh_ops->next_error(&pe);
 
 		switch (rc) {
@@ -1195,10 +1196,11 @@ void eeh_handle_special_event(void)
 			eeh_remove_event(NULL, true);
 
 			list_for_each_entry(hose, &hose_list, list_node) {
-				phb_pe = eeh_phb_pe_get(hose);
+				phb_pe = eeh_phb_pe_get(hose); /* Acquire ref */
 				if (!phb_pe) continue;
 
 				eeh_pe_mark_isolated(phb_pe);
+				eeh_put_pe(phb_pe); /* Release ref */
 			}
 
 			eeh_serialize_unlock(flags);
@@ -1236,15 +1238,17 @@ void eeh_handle_special_event(void)
 		if (rc == EEH_NEXT_ERR_FROZEN_PE ||
 		    rc == EEH_NEXT_ERR_FENCED_PHB) {
 			eeh_pe_state_mark(pe, EEH_PE_RECOVERING);
-			eeh_handle_normal_event(pe);
+			eeh_handle_normal_event(pe); /* Give ref */
 		} else {
 			pci_lock_rescan_remove();
 			list_for_each_entry(hose, &hose_list, list_node) {
-				phb_pe = eeh_phb_pe_get(hose);
+				phb_pe = eeh_phb_pe_get(hose); /* Acquire ref */
 				if (!phb_pe ||
 				    !(phb_pe->state & EEH_PE_ISOLATED) ||
-				    (phb_pe->state & EEH_PE_RECOVERING))
+				    (phb_pe->state & EEH_PE_RECOVERING)) {
+					eeh_put_pe(phb_pe); /* Release ref */
 					continue;
+				}
 
 				eeh_for_each_pe(pe, tmp_pe)
 					eeh_pe_for_each_dev(tmp_pe, edev, tmp_edev)
@@ -1263,11 +1267,14 @@ void eeh_handle_special_event(void)
 					       __func__,
 					       pe->phb->global_number,
 					       pe->addr);
+					eeh_put_pe(phb_pe); /* Release ref */
 					break;
 				}
 				pci_hp_remove_devices(bus);
+				eeh_put_pe(phb_pe); /* Release ref */
 			}
 			pci_unlock_rescan_remove();
+			eeh_put_pe(pe); /* Release ref */
 		}
 
 		/*
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index e477e0b70968..c56a796dd894 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -1404,6 +1404,7 @@ static void pnv_eeh_get_and_dump_hub_diag(struct pci_controller *hose)
 	}
 }
 
+/* A return of 0 indicates that *pe is set, and referenced. */
 static int pnv_eeh_get_pe(struct pci_controller *hose,
 			  u16 pe_no, struct eeh_pe **pe)
 {
@@ -1431,6 +1432,7 @@ static int pnv_eeh_get_pe(struct pci_controller *hose,
 
 	/* Freeze the (compound) PE */
 	*pe = dev_pe;
+	eeh_get_pe(*pe); /* Acquire ref */
 	if (!(dev_pe->state & EEH_PE_ISOLATED))
 		phb->freeze_pe(phb, pe_no);
 
@@ -1439,23 +1441,26 @@ static int pnv_eeh_get_pe(struct pci_controller *hose,
 	 * have been frozen. However, we still need poke until
 	 * hitting the frozen PE on top level.
 	 */
-	dev_pe = dev_pe->parent;
+	eeh_pe_move_to_parent(&dev_pe);
 	while (dev_pe && !(dev_pe->type & EEH_PE_PHB)) {
 		int ret;
 		ret = eeh_ops->get_state(dev_pe, NULL);
 		if (ret <= 0 || eeh_state_active(ret)) {
-			dev_pe = dev_pe->parent;
+			eeh_pe_move_to_parent(&dev_pe);
 			continue;
 		}
 
 		/* Frozen parent PE */
+		eeh_put_pe(*pe); /* Release ref */
 		*pe = dev_pe;
+		eeh_get_pe(*pe); /* Acquire ref */
 		if (!(dev_pe->state & EEH_PE_ISOLATED))
 			phb->freeze_pe(phb, dev_pe->addr);
 
 		/* Next one */
-		dev_pe = dev_pe->parent;
+		eeh_pe_move_to_parent(&dev_pe);
 	}
+	eeh_put_pe(dev_pe);
 
 	return 0;
 }
@@ -1469,6 +1474,8 @@ static int pnv_eeh_get_pe(struct pci_controller *hose,
  * OPAL APIs for next error to handle. The informational error is
  * handled internally by platform. However, the dead IOC, dead PHB,
  * fenced PHB and frozen PE should be handled by EEH core eventually.
+ * On return, *pe will be ref'd iff returning _FROZEN_PE, _FENCED_PHB or
+ * _DEAD_PHB.
  */
 static int pnv_eeh_next_error(struct eeh_pe **pe)
 {
@@ -1479,6 +1486,7 @@ static int pnv_eeh_next_error(struct eeh_pe **pe)
 	__be16 err_type, severity;
 	long rc;
 	int state, ret = EEH_NEXT_ERR_NONE;
+	unsigned long flags;
 
 	/*
 	 * While running here, it's safe to purge the event queue. The
@@ -1493,9 +1501,11 @@ static int pnv_eeh_next_error(struct eeh_pe **pe)
 		 * needn't take care of it any more.
 		 */
 		phb = hose->private_data;
-		phb_pe = eeh_phb_pe_get(hose);
-		if (!phb_pe || (phb_pe->state & EEH_PE_ISOLATED))
+		phb_pe = eeh_phb_pe_get(hose); /* Acquire ref */
+		if (!phb_pe || (phb_pe->state & EEH_PE_ISOLATED)) {
+			eeh_put_pe(phb_pe); /* Release ref */
 			continue;
+		}
 
 		rc = opal_pci_next_error(phb->opal_id,
 					 &frozen_pe_no, &err_type, &severity);
@@ -1503,6 +1513,7 @@ static int pnv_eeh_next_error(struct eeh_pe **pe)
 			pr_devel("%s: Invalid return value on "
 				 "PHB#%x (0x%lx) from opal_pci_next_error",
 				 __func__, hose->global_number, rc);
+			eeh_put_pe(phb_pe); /* Release ref */
 			continue;
 		}
 
@@ -1511,6 +1522,7 @@ static int pnv_eeh_next_error(struct eeh_pe **pe)
 		    be16_to_cpu(severity) == OPAL_EEH_SEV_NO_ERROR) {
 			pr_devel("%s: No error found on PHB#%x\n",
 				 __func__, hose->global_number);
+			eeh_put_pe(phb_pe); /* Release ref */
 			continue;
 		}
 
@@ -1539,19 +1551,23 @@ static int pnv_eeh_next_error(struct eeh_pe **pe)
 		case OPAL_EEH_PHB_ERROR:
 			if (be16_to_cpu(severity) == OPAL_EEH_SEV_PHB_DEAD) {
 				*pe = phb_pe;
+				eeh_get_pe(*pe); /* Acquire ref */
 				pr_err("EEH: dead PHB#%x detected, "
 				       "location: %s\n",
 					hose->global_number,
 					eeh_pe_loc_get(phb_pe));
 				ret = EEH_NEXT_ERR_DEAD_PHB;
+				/* Retain ref on pe */
 			} else if (be16_to_cpu(severity) ==
 				   OPAL_EEH_SEV_PHB_FENCED) {
 				*pe = phb_pe;
+				eeh_get_pe(*pe); /* Acquire ref */
 				pr_err("EEH: Fenced PHB#%x detected, "
 				       "location: %s\n",
 					hose->global_number,
 					eeh_pe_loc_get(phb_pe));
 				ret = EEH_NEXT_ERR_FENCED_PHB;
+				/* Retain ref on pe */
 			} else if (be16_to_cpu(severity) == OPAL_EEH_SEV_INF) {
 				pr_info("EEH: PHB#%x informative error "
 					"detected, location: %s\n",
@@ -1568,8 +1584,10 @@ static int pnv_eeh_next_error(struct eeh_pe **pe)
 			 * If we can't find the corresponding PE, we
 			 * just try to unfreeze.
 			 */
+			/* Maybe acquire ref */
 			if (pnv_eeh_get_pe(hose,
 				be64_to_cpu(frozen_pe_no), pe)) {
+				/* 'pe' was not set by pnv_eeh_get_pe() */
 				pr_info("EEH: Clear non-existing PHB#%x-PE#%llx\n",
 					hose->global_number, be64_to_cpu(frozen_pe_no));
 				pr_info("EEH: PHB location: %s\n",
@@ -1589,6 +1607,7 @@ static int pnv_eeh_next_error(struct eeh_pe **pe)
 				ret = EEH_NEXT_ERR_NONE;
 			} else if ((*pe)->state & EEH_PE_ISOLATED ||
 				   eeh_pe_passed(*pe)) {
+				eeh_put_pe(*pe); /* Release ref */
 				ret = EEH_NEXT_ERR_NONE;
 			} else {
 				pr_err("EEH: Frozen PE#%x "
@@ -1600,6 +1619,7 @@ static int pnv_eeh_next_error(struct eeh_pe **pe)
 				       eeh_pe_loc_get(*pe),
 				       eeh_pe_loc_get(phb_pe));
 				ret = EEH_NEXT_ERR_FROZEN_PE;
+				/* Retain ref on pe */
 			}
 
 			break;
@@ -1631,7 +1651,10 @@ static int pnv_eeh_next_error(struct eeh_pe **pe)
 		 * we need have to handle frozen parent PE firstly.
 		 */
 		if (ret == EEH_NEXT_ERR_FROZEN_PE) {
+			eeh_lock_pes(&flags);
 			parent_pe = (*pe)->parent;
+			eeh_get_pe(parent_pe);
+			eeh_unlock_pes(flags);
 			while (parent_pe) {
 				/* Hit the ceiling ? */
 				if (parent_pe->type & EEH_PE_PHB)
@@ -1643,13 +1666,15 @@ static int pnv_eeh_next_error(struct eeh_pe **pe)
 					*pe = parent_pe;
 
 				/* Next parent level */
-				parent_pe = parent_pe->parent;
+				eeh_pe_move_to_parent(&parent_pe);
 			}
+			eeh_put_pe(parent_pe); /* Release ref (for early-out) */
 
 			/* We possibly migrate to another PE */
 			eeh_pe_mark_isolated(*pe);
 		}
 
+		eeh_put_pe(phb_pe); /* Release ref */
 		/*
 		 * If we have no errors on the specific PHB or only
 		 * informative error there, we continue poking it.
@@ -1664,6 +1689,7 @@ static int pnv_eeh_next_error(struct eeh_pe **pe)
 	if (ret == EEH_NEXT_ERR_NONE && eeh_enabled())
 		enable_irq(eeh_event_irq);
 
+	/* *pe may be ref'd, see above */
 	return ret;
 }
 
-- 
2.22.0.216.g00a2a96fc9

