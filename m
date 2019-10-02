Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD06C4786
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 08:07:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jlyw0mlczDqSK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 16:07:04 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jltK12LmzDqQT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 16:03:04 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9262tcs045491
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 2 Oct 2019 02:03:01 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vckugunt7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Oct 2019 02:03:01 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Wed, 2 Oct 2019 07:02:59 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 2 Oct 2019 07:02:56 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9262ttQ35717326
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Oct 2019 06:02:55 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A949211C04A;
 Wed,  2 Oct 2019 06:02:55 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13E8311C069;
 Wed,  2 Oct 2019 06:02:55 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  2 Oct 2019 06:02:55 +0000 (GMT)
Received: from osmium.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 72487A0282;
 Wed,  2 Oct 2019 16:02:53 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH RFC 04/15] powerpc/eeh: Sync eeh_pe_next(),
 eeh_pe_find() and early-out traversals
Date: Wed,  2 Oct 2019 16:02:42 +1000
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
In-Reply-To: <cover.1569996166.git.sbobroff@linux.ibm.com>
References: <cover.1569996166.git.sbobroff@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19100206-0008-0000-0000-0000031D362D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100206-0009-0000-0000-00004A3C37D4
Message-Id: <8893b691d44b065a293fd3357768a27231791bff.1569996166.git.sbobroff@linux.ibm.com>
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

Reference counting for the in-line loop macro "eeh_for_each_pe()" can
be done by having eeh_pe_next() both get and put references; "rolling"
a reference along the list. This allows most loops to work without
change, although ones that use an "early-out" must manually release
the final reference.

While reference counting will keep the current iteration's PE from
being freed while it is in use, it's also necessary to check that it
hasn't been removed from the list that's being traversed.  This is
done by checking the parent pointer, which is set to NULL on removal
(see eeh_rmv_from_parent_pe()) (PHB type PEs never have their parent
set, but aren't a problem: they can't be removed). If this does occur,
the traversal is terminated. This may leave the traversal incomplete,
but that is preferable to crashing.

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
---
 arch/powerpc/include/asm/eeh.h   |  7 ++++-
 arch/powerpc/kernel/eeh_driver.c |  4 ++-
 arch/powerpc/kernel/eeh_pe.c     | 50 +++++++++++++++++++++++++-------
 3 files changed, 48 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index df843d04268d..3ab03d407eb1 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -111,8 +111,13 @@ struct eeh_pe {
 #define eeh_pe_for_each_dev(pe, edev, tmp) \
 		list_for_each_entry_safe(edev, tmp, &pe->edevs, entry)
 
+/*
+ * Note that eeh_pe_next() maintins a reference on 'pe' for each
+ * iteration and that it must be manually released if the loop is
+ * exited early (i.e. before eeh_pe_next() returns NULL).
+ */
 #define eeh_for_each_pe(root, pe) \
-	for (pe = root; pe; pe = eeh_pe_next(pe, root))
+	for (pe = root, eeh_get_pe(pe); pe; pe = eeh_pe_next(pe, root))
 
 static inline bool eeh_pe_passed(struct eeh_pe *pe)
 {
diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 28e54fe3ac6c..b3245d0cfb22 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -590,8 +590,10 @@ static int eeh_clear_pe_frozen_state(struct eeh_pe *root, bool include_passed)
 			for (i = 0; i < 3; i++)
 				if (!eeh_unfreeze_pe(pe))
 					break;
-			if (i >= 3)
+			if (i >= 3) {
+				eeh_put_pe(pe); /* Release loop ref */
 				return -EIO;
+			}
 		}
 	}
 	eeh_pe_state_clear(root, EEH_PE_ISOLATED, include_passed);
diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index aa279474a928..b89ed46f14e6 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -294,23 +294,44 @@ struct eeh_pe *eeh_phb_pe_get(struct pci_controller *phb)
  *
  * The function is used to retrieve the next PE in the
  * hierarchy PE tree.
+ *
+ * Consumes the ref on 'pe', returns a referenced PE (if not null).
  */
-struct eeh_pe *eeh_pe_next(struct eeh_pe *pe, struct eeh_pe *root)
+struct eeh_pe *eeh_pe_next(struct eeh_pe *prev_pe, struct eeh_pe *root)
 {
-	struct list_head *next = pe->child_list.next;
+	struct list_head *next;
+	struct eeh_pe *next_pe = NULL, *pe = prev_pe;
+	unsigned long flags;
 
+	eeh_lock_pes(&flags);
+	if (!(pe->type & EEH_PE_PHB) && !pe->parent) {
+		/* Current PE has been removed since the last iteration.
+		 * There's no way to recover so bail out. The traversal
+		 * may be incomplete.
+		 */
+		eeh_unlock_pes(flags);
+		pr_warn("EEH: Warning: PHB#%x-PE%x: Traversal possibly incomplete.\n",
+			pe->phb->global_number, pe->addr);
+		eeh_put_pe(pe); /* Release ref from last iter */
+		return NULL;
+	}
+	next = pe->child_list.next;
 	if (next == &pe->child_list) {
 		while (1) {
 			if (pe == root)
-				return NULL;
+				goto out;
 			next = pe->child.next;
 			if (next != &pe->parent->child_list)
 				break;
 			pe = pe->parent;
 		}
 	}
-
-	return list_entry(next, struct eeh_pe, child);
+	next_pe = list_entry(next, struct eeh_pe, child);
+	eeh_get_pe(next_pe); /* Acquire ref for next iter */
+out:
+	eeh_unlock_pes(flags);
+	eeh_put_pe(prev_pe); /* Release ref from last iter */
+	return next_pe;
 }
 
 /**
@@ -332,7 +353,10 @@ void *eeh_pe_traverse(struct eeh_pe *root,
 
 	eeh_for_each_pe(root, pe) {
 		ret = fn(pe, flag);
-		if (ret) return ret;
+		if (ret) {
+			eeh_put_pe(pe); /* Early-out: release last ref */
+			return ret;
+		}
 	}
 
 	return NULL;
@@ -388,24 +412,26 @@ static void *__eeh_pe_find(struct eeh_pe *pe, void *flag)
 	if (pe->type & EEH_PE_PHB)
 		return NULL;
 
+	eeh_get_pe(pe); /* Acquire ref */
 	/*
 	 * We prefer PE address. For most cases, we should
 	 * have non-zero PE address
 	 */
 	if (eeh_has_flag(EEH_VALID_PE_ZERO)) {
 		if (tmp->pe_no == pe->addr)
-			return pe;
+			return pe; /* Give ref */
 	} else {
 		if (tmp->pe_no &&
 		    (tmp->pe_no == pe->addr))
-			return pe;
+			return pe; /* Give ref */
 	}
 
 	/* Try BDF address */
 	if (tmp->config_addr &&
 	   (tmp->config_addr == pe->config_addr))
-		return pe;
+		return pe; /* Give ref */
 
+	eeh_put_pe(pe); /* Release ref */
 	return NULL;
 }
 
@@ -421,15 +447,17 @@ static void *__eeh_pe_find(struct eeh_pe *pe, void *flag)
  * notable that the PE address has 2 format: traditional PE address
  * which is composed of PCI bus/device/function number, or unified
  * PE address.
+ * Returns a ref'd PE or NULL.
  */
 struct eeh_pe *eeh_pe_find(struct pci_controller *phb,
-			   int pe_no, int config_addr)
+		int pe_no, int config_addr)
 {
-	struct eeh_pe *root = eeh_phb_pe_get(phb);
+	struct eeh_pe *root = eeh_phb_pe_get(phb); /* Acquire ref */
 	struct eeh_pe_get_flag tmp = { pe_no, config_addr };
 	struct eeh_pe *pe;
 
 	pe = eeh_pe_traverse(root, __eeh_pe_find, &tmp);
+	eeh_put_pe(root); /* Release ref */
 
 	return pe;
 }
-- 
2.22.0.216.g00a2a96fc9

