Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B810C4764
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 08:04:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jlwJ6vvNzDqS1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 16:04:48 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jltK0kNTzDqPv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 16:03:04 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9262JR7069214
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 2 Oct 2019 02:03:01 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vckrcbrw4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Oct 2019 02:03:00 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Wed, 2 Oct 2019 07:02:58 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 2 Oct 2019 07:02:56 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9262tHc47120432
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Oct 2019 06:02:55 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7EACA4059;
 Wed,  2 Oct 2019 06:02:55 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 134DEA4057;
 Wed,  2 Oct 2019 06:02:55 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  2 Oct 2019 06:02:55 +0000 (GMT)
Received: from osmium.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5F601A0257;
 Wed,  2 Oct 2019 16:02:53 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH RFC 01/15] powerpc/eeh: Introduce refcounting for struct eeh_pe
Date: Wed,  2 Oct 2019 16:02:39 +1000
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
In-Reply-To: <cover.1569996166.git.sbobroff@linux.ibm.com>
References: <cover.1569996166.git.sbobroff@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19100206-0028-0000-0000-000003A536D7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100206-0029-0000-0000-00002467388F
Message-Id: <f4282c1f3bc4105ae990b930b4c11b318376cda0.1569996166.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-02_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
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

Introduce infrastructure supporting refcounting for struct eeh_pe.

This will provide protection of the list members and struct memory so
that crashes related to accessing free memory or poisoned list
pointers can be avoided (for example, when EEH is triggered during
device removal).

While this provides no additional synchronization of the other EEH
state, it seems to be an effective way of providing the necessary
safety with a very low risk of introducing deadlocks.

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
---
 arch/powerpc/include/asm/eeh.h |  7 ++++
 arch/powerpc/kernel/eeh_pe.c   | 70 +++++++++++++++++++++++++++++++++-
 2 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 5448b68ff260..54ba958760f2 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -13,6 +13,7 @@
 #include <linux/string.h>
 #include <linux/time.h>
 #include <linux/atomic.h>
+#include <linux/kref.h>
 
 #include <uapi/asm/eeh.h>
 
@@ -72,6 +73,7 @@ struct pci_dn;
 #define EEH_PE_PRI_BUS		(1 << 11)	/* Cached primary bus   */
 
 struct eeh_pe {
+	struct kref kref;		/* Reference count		*/
 	int type;			/* PE type: PHB/Bus/Device	*/
 	int state;			/* PE EEH dependent mode	*/
 	int config_addr;		/* Traditional PCI address	*/
@@ -276,7 +278,12 @@ static inline bool eeh_state_active(int state)
 
 typedef void (*eeh_edev_traverse_func)(struct eeh_dev *edev, void *flag);
 typedef void *(*eeh_pe_traverse_func)(struct eeh_pe *pe, void *flag);
+void eeh_lock_pes(unsigned long *flags);
+void eeh_unlock_pes(unsigned long flags);
 void eeh_set_pe_aux_size(int size);
+void eeh_get_pe(struct eeh_pe *pe);
+void eeh_put_pe(struct eeh_pe *pe);
+void eeh_pe_move_to_parent(struct eeh_pe **pe);
 int eeh_phb_pe_create(struct pci_controller *phb);
 int eeh_wait_state(struct eeh_pe *pe, int max_wait);
 struct eeh_pe *eeh_phb_pe_get(struct pci_controller *phb);
diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index 177852e39a25..d455df7b4928 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -22,6 +22,25 @@
 static int eeh_pe_aux_size = 0;
 static LIST_HEAD(eeh_phb_pe);
 
+/*
+ * Lock protecting the parent and child list fields of struct eeh_pe (this does
+ * not include the edev list).  The lock does not, in general, prevent struct
+ * eeh_pe objects from being freed, but it does provide that when held and a
+ * reference is held on a PE, that neither that PE or any other PE reachable
+ * via it's parent or child fields will be freed.
+ */
+static DEFINE_RAW_SPINLOCK(eeh_pe_lock);
+
+void eeh_lock_pes(unsigned long *flags)
+{
+	raw_spin_lock_irqsave(&eeh_pe_lock, *flags);
+}
+
+void eeh_unlock_pes(unsigned long flags)
+{
+	raw_spin_unlock_irqrestore(&eeh_pe_lock, flags);
+}
+
 /**
  * eeh_set_pe_aux_size - Set PE auxillary data size
  * @size: PE auxillary data size
@@ -59,6 +78,7 @@ static struct eeh_pe *eeh_pe_alloc(struct pci_controller *phb, int type)
 	if (!pe) return NULL;
 
 	/* Initialize PHB PE */
+	kref_init(&pe->kref); /* Acquire existence ref */
 	pe->type = type;
 	pe->phb = phb;
 	INIT_LIST_HEAD(&pe->child_list);
@@ -69,6 +89,51 @@ static struct eeh_pe *eeh_pe_alloc(struct pci_controller *phb, int type)
 	return pe;
 }
 
+static void eeh_pe_free(struct kref *kref)
+{
+	struct eeh_pe *pe = container_of(kref, struct eeh_pe, kref);
+
+	if (WARN_ONCE(pe->type & EEH_PE_PHB,
+		      "EEH: PHB#%x-PE#%x: Attempt to free PHB PE!\n",
+		      pe->phb->global_number, pe->addr))
+		return;
+
+	if (WARN_ONCE(pe->parent,
+		      "EEH: PHB#%x-PE#%x: Attempt to free in-use PE!\n",
+		      pe->phb->global_number, pe->addr))
+		return;
+
+	kfree(pe);
+}
+
+void eeh_get_pe(struct eeh_pe *pe)
+{
+	if (!pe)
+		return;
+	WARN_ONCE(!kref_get_unless_zero(&pe->kref),
+		  "EEH: PHB#%x-PE#%x: Attempt to get when refcount 0!\n",
+		  pe->phb->global_number, pe->addr);
+}
+
+void eeh_put_pe(struct eeh_pe *pe)
+{
+	if (!pe)
+		return;
+	kref_put(&pe->kref, eeh_pe_free);
+}
+
+void eeh_pe_move_to_parent(struct eeh_pe **pe)
+{
+	unsigned long flags;
+	struct eeh_pe *old_pe = *pe;
+
+	eeh_lock_pes(&flags);
+	*pe = (*pe)->parent;
+	eeh_get_pe(*pe);
+	eeh_put_pe(old_pe);
+	eeh_unlock_pes(flags);
+}
+
 /**
  * eeh_phb_pe_create - Create PHB PE
  * @phb: PCI controller
@@ -439,7 +504,7 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
 			pr_err("%s: No PHB PE is found (PHB Domain=%d)\n",
 				__func__, pdn->phb->global_number);
 			edev->pe = NULL;
-			kfree(pe);
+			eeh_put_pe(pe); /* Release existence ref */
 			return -EEXIST;
 		}
 	}
@@ -509,7 +574,8 @@ int eeh_rmv_from_parent_pe(struct eeh_dev *edev)
 			if (list_empty(&pe->edevs) &&
 			    list_empty(&pe->child_list)) {
 				list_del(&pe->child);
-				kfree(pe);
+				pe->parent = NULL;
+				eeh_put_pe(pe); /* Release existence ref */
 			} else {
 				break;
 			}
-- 
2.22.0.216.g00a2a96fc9

