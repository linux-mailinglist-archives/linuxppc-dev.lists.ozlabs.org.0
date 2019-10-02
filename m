Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A58CC47BD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 08:23:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jmKQ67ZnzDqBt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 16:23:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sbobroff@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jltK6syCzDqPy
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 16:03:05 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9262lcF031103
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 2 Oct 2019 02:03:01 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vcn1rhve5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Oct 2019 02:03:00 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Wed, 2 Oct 2019 07:02:59 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 2 Oct 2019 07:02:56 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9262tZt49152134
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Oct 2019 06:02:55 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A09FBA4066;
 Wed,  2 Oct 2019 06:02:55 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 150B3A4064;
 Wed,  2 Oct 2019 06:02:55 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  2 Oct 2019 06:02:55 +0000 (GMT)
Received: from osmium.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6FF8EA027F;
 Wed,  2 Oct 2019 16:02:53 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH RFC 03/15] powerpc/eeh: Track orphaned struct eeh_pe
Date: Wed,  2 Oct 2019 16:02:41 +1000
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
In-Reply-To: <cover.1569996166.git.sbobroff@linux.ibm.com>
References: <cover.1569996166.git.sbobroff@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19100206-0012-0000-0000-000003533B67
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100206-0013-0000-0000-0000218E3D1E
Message-Id: <63e68b88d6fdc779abbb03869e4f5e33c7c214ed.1569996166.git.sbobroff@linux.ibm.com>
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

To facilitate debugging of (the inevitable) refcounting problems with
struct eeh_pes, detect when a struct eeh_pe has been removed from it's
global PHB list but not yet freed ("orphaned"), and collect these
PEs in a list.

They should only remain in the list briefly during processing, so any
PEs that stay longer will be the result of bugs.

The list can be examined by reading from the "eeh_pe_debug" file in
debugfs.

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
---
 arch/powerpc/include/asm/eeh.h |  4 +++
 arch/powerpc/kernel/eeh.c      | 21 ++++++++++++++
 arch/powerpc/kernel/eeh_pe.c   | 53 +++++++++++++++++++++++++++++++++-
 3 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index e6f461d07426..df843d04268d 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -14,6 +14,7 @@
 #include <linux/time.h>
 #include <linux/atomic.h>
 #include <linux/kref.h>
+#include <linux/seq_file.h>
 
 #include <uapi/asm/eeh.h>
 
@@ -66,6 +67,7 @@ struct pci_dn;
 #define EEH_PE_RECOVERING	(1 << 1)	/* Recovering PE	*/
 #define EEH_PE_CFG_BLOCKED	(1 << 2)	/* Block config access	*/
 #define EEH_PE_RESET		(1 << 3)	/* PE reset in progress */
+#define EEH_PE_ORPHAN		(1 << 4)	/* Removal pending      */
 
 #define EEH_PE_KEEP		(1 << 8)	/* Keep PE on hotplug	*/
 #define EEH_PE_CFG_RESTRICTED	(1 << 9)	/* Block config on error */
@@ -103,6 +105,7 @@ struct eeh_pe {
 	unsigned long stack_trace[64];
 	int trace_entries;
 #endif /* CONFIG_STACKTRACE */
+	struct list_head orphan_entry;	/* Memb. eeh_orphan_pes         */
 };
 
 #define eeh_pe_for_each_dev(pe, edev, tmp) \
@@ -280,6 +283,7 @@ typedef void (*eeh_edev_traverse_func)(struct eeh_dev *edev, void *flag);
 typedef void *(*eeh_pe_traverse_func)(struct eeh_pe *pe, void *flag);
 void eeh_lock_pes(unsigned long *flags);
 void eeh_unlock_pes(unsigned long flags);
+void eeh_pe_seq_show_orphans(struct seq_file *s);
 void eeh_set_pe_aux_size(int size);
 void eeh_get_pe(struct eeh_pe *pe);
 void eeh_put_pe(struct eeh_pe *pe);
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 7e36ad0cfa2b..7eb6ca1ab72b 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -2153,6 +2153,24 @@ static const struct file_operations eeh_dev_break_fops = {
 	.read   = eeh_debugfs_dev_usage,
 };
 
+static int eeh_pe_debug_seq_file(struct seq_file *s, void *unused)
+{
+	eeh_pe_seq_show_orphans(s);
+	return 0;
+}
+
+static int eeh_pe_debug_dbgfs_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, eeh_pe_debug_seq_file, inode->i_private);
+}
+
+static const struct file_operations eeh_pe_debug_fops = {
+	.owner		= THIS_MODULE,
+	.open		= eeh_pe_debug_dbgfs_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
 #endif
 
 static int __init eeh_init_proc(void)
@@ -2177,6 +2195,9 @@ static int __init eeh_init_proc(void)
 		debugfs_create_file_unsafe("eeh_force_recover", 0600,
 				powerpc_debugfs_root, NULL,
 				&eeh_force_recover_fops);
+		debugfs_create_file_unsafe("eeh_pe_debug", 0400,
+				powerpc_debugfs_root, NULL,
+				&eeh_pe_debug_fops);
 		eeh_cache_debugfs_init();
 #endif
 	}
diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index fda52d1989c3..aa279474a928 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -21,6 +21,7 @@
 
 static int eeh_pe_aux_size = 0;
 static LIST_HEAD(eeh_phb_pe);
+static LIST_HEAD(eeh_orphan_pes);
 
 /*
  * Lock protecting the parent and child list fields of struct eeh_pe (this does
@@ -30,6 +31,7 @@ static LIST_HEAD(eeh_phb_pe);
  * via it's parent or child fields will be freed.
  */
 static DEFINE_RAW_SPINLOCK(eeh_pe_lock);
+static DEFINE_RAW_SPINLOCK(eeh_orphan_lock);
 
 void eeh_lock_pes(unsigned long *flags)
 {
@@ -89,9 +91,24 @@ static struct eeh_pe *eeh_pe_alloc(struct pci_controller *phb, int type)
 	return pe;
 }
 
+void eeh_pe_seq_show_orphans(struct seq_file *s)
+{
+	unsigned long flags;
+	struct eeh_pe *pe;
+
+	seq_puts(s, "Orphaned PEs awaiting free:\n");
+	raw_spin_lock_irqsave(&eeh_orphan_lock, flags);
+	list_for_each_entry(pe, &eeh_orphan_pes, orphan_entry)
+		seq_printf(s, "PHB#%x PE#%x Refcount:%d\n",
+			   pe->phb->global_number, pe->addr,
+			   kref_read(&pe->kref));
+	raw_spin_unlock_irqrestore(&eeh_orphan_lock, flags);
+}
+
 static void eeh_pe_free(struct kref *kref)
 {
 	struct eeh_pe *pe = container_of(kref, struct eeh_pe, kref);
+	unsigned long flags;
 
 	if (WARN_ONCE(pe->type & EEH_PE_PHB,
 		      "EEH: PHB#%x-PE#%x: Attempt to free PHB PE!\n",
@@ -103,6 +120,13 @@ static void eeh_pe_free(struct kref *kref)
 		      pe->phb->global_number, pe->addr))
 		return;
 
+	raw_spin_lock_irqsave(&eeh_orphan_lock, flags);
+	if (pe->state & EEH_PE_ORPHAN) {
+		pr_warn("EEH: PHB#%x-PE#%x: Orphan freed\n",
+			pe->phb->global_number, pe->addr);
+		list_del(&pe->orphan_entry);
+	}
+	raw_spin_unlock_irqrestore(&eeh_orphan_lock, flags);
 	kfree(pe);
 }
 
@@ -117,9 +141,36 @@ void eeh_get_pe(struct eeh_pe *pe)
 
 void eeh_put_pe(struct eeh_pe *pe)
 {
+	int rv, global_number, addr;
+	unsigned long flags;
+
 	if (!pe)
 		return;
-	kref_put(&pe->kref, eeh_pe_free);
+
+	global_number = pe->phb->global_number;
+	addr = pe->addr;
+	rv = kref_put(&pe->kref, eeh_pe_free);
+	raw_spin_lock_irqsave(&eeh_orphan_lock, flags);
+	if (!rv && !pe->parent && !(pe->type & EEH_PE_PHB) &&
+	    !(pe->state & EEH_PE_ORPHAN)) {
+		/* A PE's parent pointer is only set to NULL when it's removed
+		 * from it's PHB's list (in eeh_rmv_from_parent_pe()), and that
+		 * is followed by a call to eeh_put_pe(). If eeh_put_pe()
+		 * doesn't cause the PE to be free'd, then a ref is being held
+		 * elsewhere that should be released quickly. Track these PEs
+		 * so that if they are not released, they can be found
+		 * to assist debugging.
+		 */
+		pr_info("EEH: PHB#%x-PE#%x: Orphaned (unlinked from global list but still referenced)\n",
+			global_number, addr);
+
+		pe->state |= EEH_PE_ORPHAN;
+		list_add_tail(&pe->orphan_entry, &eeh_orphan_pes);
+	}
+	raw_spin_unlock_irqrestore(&eeh_orphan_lock, flags);
+	if (rv)
+		pr_debug("EEH: PHB#%x-PE#%x: Final reference released.\n",
+			 global_number, addr);
 }
 
 void eeh_pe_move_to_parent(struct eeh_pe **pe)
-- 
2.22.0.216.g00a2a96fc9

