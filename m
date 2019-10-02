Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C5DC479B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 08:16:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jmB26ylvzDqVq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 16:16:42 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jltK0tStzDqQ1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 16:03:04 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9262Mg2008864
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 2 Oct 2019 02:03:02 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vckpcuy3h-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Oct 2019 02:03:02 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Wed, 2 Oct 2019 07:03:00 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 2 Oct 2019 07:02:58 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9262vYn44761198
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Oct 2019 06:02:57 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B8CF42042;
 Wed,  2 Oct 2019 06:02:57 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C960942041;
 Wed,  2 Oct 2019 06:02:56 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  2 Oct 2019 06:02:56 +0000 (GMT)
Received: from osmium.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8111EA03AB;
 Wed,  2 Oct 2019 16:02:53 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH RFC 07/15] powerpc/eeh: Sync eeh_add_to_parent_pe() and
 eeh_rmv_from_parent_pe()
Date: Wed,  2 Oct 2019 16:02:45 +1000
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
In-Reply-To: <cover.1569996166.git.sbobroff@linux.ibm.com>
References: <cover.1569996166.git.sbobroff@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19100206-0012-0000-0000-000003533B69
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100206-0013-0000-0000-0000218E3D20
Message-Id: <b87a6950559e13a706c1bf125dbaeacef02de6ab.1569996166.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-02_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=984 adultscore=0 classifier=spam adjust=0 reason=mlx
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

Note that even though there is currently only one place where a PE can
be removed from the parent/child tree (eeh_rmv_from_parent_pe()), it
is still protected against concurrent removal in case that changes in
the future.

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
---
 arch/powerpc/kernel/eeh_pe.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index e89a30de2e7e..c9780b7109ec 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -528,6 +528,7 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
 	struct eeh_pe *pe, *parent;
 	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
 	int config_addr = (pdn->busno << 8) | (pdn->devfn);
+	unsigned long flags;
 
 	/* Check if the PE number is valid */
 	if (!eeh_has_flag(EEH_VALID_PE_ZERO) && !edev->pe_config_addr) {
@@ -541,6 +542,7 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
 	 * PE should be composed of PCI bus and its subordinate
 	 * components.
 	 */
+	/* Acquire ref */
 	pe = eeh_pe_find(pdn->phb, edev->pe_config_addr, config_addr);
 	if (pe) {
 		if (pe->type & EEH_PE_INVALID) {
@@ -557,7 +559,6 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
 				parent->type &= ~EEH_PE_INVALID;
 				parent = parent->parent;
 			}
-
 			eeh_edev_dbg(edev,
 				     "Added to device PE (parent: PE#%x)\n",
 				     pe->parent->addr);
@@ -570,10 +571,12 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
 			list_add_tail(&edev->entry, &pe->edevs);
 			eeh_edev_dbg(edev, "Added to bus PE\n");
 		}
+		eeh_put_pe(pe); /* Release ref */
 		return 0;
 	}
 
 	/* Create a new EEH PE */
+	/* Acquire existence ref */
 	if (edev->physfn)
 		pe = eeh_pe_alloc(pdn->phb, EEH_PE_VF);
 	else
@@ -591,9 +594,9 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
 	 * to PHB directly. Otherwise, we have to associate the
 	 * PE with its parent.
 	 */
-	parent = eeh_pe_get_parent(edev);
+	parent = eeh_pe_get_parent(edev); /* Acquire ref */
 	if (!parent) {
-		parent = eeh_phb_pe_get(pdn->phb);
+		parent = eeh_phb_pe_get(pdn->phb); /* Acquire ref */
 		if (!parent) {
 			pr_err("%s: No PHB PE is found (PHB Domain=%d)\n",
 				__func__, pdn->phb->global_number);
@@ -602,6 +605,7 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
 			return -EEXIST;
 		}
 	}
+	eeh_lock_pes(&flags);
 	pe->parent = parent;
 
 	/*
@@ -609,10 +613,13 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
 	 * link the EEH device accordingly.
 	 */
 	list_add_tail(&pe->child, &parent->child_list);
+	eeh_unlock_pes(flags);
 	list_add_tail(&edev->entry, &pe->edevs);
 	edev->pe = pe;
 	eeh_edev_dbg(edev, "Added to device PE (parent: PE#%x)\n",
-		     pe->parent->addr);
+		     parent->addr);
+	eeh_put_pe(parent); /* Release ref */
+	/* Retain existence ref */
 
 	return 0;
 }
@@ -631,12 +638,15 @@ int eeh_rmv_from_parent_pe(struct eeh_dev *edev)
 	struct eeh_pe *pe, *parent, *child;
 	bool keep, recover;
 	int cnt;
+	unsigned long flags;
 
+	/* TODO: Unsafe until eeh_dev can be synchronized * with eeh_pe. */
 	pe = eeh_dev_to_pe(edev);
 	if (!pe) {
 		eeh_edev_dbg(edev, "No PE found for device.\n");
 		return -EEXIST;
 	}
+	eeh_get_pe(pe); /* Acquire ref */
 
 	/* Remove the EEH device */
 	edev->pe = NULL;
@@ -648,6 +658,7 @@ int eeh_rmv_from_parent_pe(struct eeh_dev *edev)
 	 * delete the parent PE if it doesn't have associated
 	 * child PEs and EEH devices.
 	 */
+	eeh_lock_pes(&flags);
 	while (1) {
 		parent = pe->parent;
 
@@ -699,8 +710,15 @@ int eeh_rmv_from_parent_pe(struct eeh_dev *edev)
 			}
 		}
 
+		if (!parent)
+			break; /* PE has been removed */
+
+		eeh_get_pe(parent); /* Acquire ref */
+		eeh_put_pe(pe); /* Release ref */
 		pe = parent;
 	}
+	eeh_unlock_pes(flags);
+	eeh_put_pe(pe); /* Release ref */
 
 	return 0;
 }
-- 
2.22.0.216.g00a2a96fc9

