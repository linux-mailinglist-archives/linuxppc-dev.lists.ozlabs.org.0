Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F08206C13
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 07:59:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sCC567xmzDqg6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 15:59:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sbobroff@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sC9V4mZ6zDqNL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 15:57:50 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05O5b6Gv061459
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 01:57:48 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ux0a411k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 01:57:48 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05O5vS1f031942
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 05:57:46 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 31uus708fy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 05:57:46 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05O5vidL57868402
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 05:57:44 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF43942054
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 05:57:43 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48B5542045
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 05:57:43 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 05:57:43 +0000 (GMT)
Received: from osmium.ibmuc.com (unknown [9.102.55.70])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0D897A00F1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 15:57:42 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH RFC 1/1] powerpc/eeh: PE info tree via debugfs and syslog
Date: Wed, 24 Jun 2020 15:57:41 +1000
Message-Id: <72f2173552d5c8aa8f104b867bd6972ef1f6e57d.1592978255.git.sbobroff@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-24_01:2020-06-23,
 2020-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 cotscore=-2147483648 clxscore=1015 bulkscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=1 priorityscore=1501 phishscore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006240041
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Provide an ASCII art tree display of the PEs affected by recovery,
with as much state as possible, at the start and end of recovery.

Some platform specific information is provided via a new eeh_ops
member.

The same information is made available from debugfs at:

/sys/kernel/debug/powerpc/PCIXXXX/eeh_pe_tree

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
---
Here's some debug code I've been using for a long time while working on EEH. I
haven't posted it before because it wasn't possible to make the code safe
enough (to avoid either NULL or LIST_POISON), but with the recent safety work
done it's become possible.

It should be applied on top of:

"powerpc/eeh: Synchronization for safety"
"powerpc/eeh: Provide a unique ID for each EEH recovery"
"powerpc/eeh: Asynchronous recovery"

 arch/powerpc/include/asm/eeh.h               |  3 +
 arch/powerpc/kernel/eeh.c                    | 90 ++++++++++++++++++++
 arch/powerpc/kernel/eeh_driver.c             | 28 ++++++
 arch/powerpc/platforms/powernv/eeh-powernv.c | 63 +++++++++++++-
 arch/powerpc/platforms/pseries/eeh_pseries.c | 21 ++++-
 5 files changed, 203 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index dd55d1bf1cfd..46dec5b2482e 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -230,6 +230,7 @@ struct eeh_ops {
 	int (*next_error)(struct eeh_pe **pe);
 	int (*restore_config)(struct pci_dn *pdn);
 	int (*notify_resume)(struct pci_dn *pdn);
+	void (*pe_plat_state_dump)(char *buf, size_t len, struct eeh_pe *pe);
 };
 
 extern int eeh_subsystem_flags;
@@ -324,6 +325,8 @@ int eeh_pe_configure(struct eeh_pe *pe);
 int eeh_pe_inject_err(struct eeh_pe *pe, int type, int func,
 		      unsigned long addr, unsigned long mask);
 int eeh_restore_vf_config(struct pci_dn *pdn);
+void eeh_tree_state_dump(void (*pfn)(void *, const char *, ...),
+			 void *s, struct eeh_pe *pe, int level, int xlevel);
 
 /**
  * EEH_POSSIBLE_ERROR() -- test for possible MMIO failure.
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 54f921ff7621..6f675f277d26 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -839,6 +839,96 @@ int eeh_restore_vf_config(struct pci_dn *pdn)
 	return 0;
 }
 
+static void eeh_tree_state_indent(void (*pfn)(void *, const char *, ...),
+				  void *s, int level, int xlevel, bool node)
+{
+	int i;
+
+	for (i = 0; i < level; i++)
+		pfn(s, "%c   ", ((xlevel & (1 << i)) ? '|' : ' '));
+	if (node)
+		pfn(s, "%c---", ((xlevel & (1 << level)) ? '+' : '\\'));
+	else
+		pfn(s, "%c...", ((xlevel & (1 << level)) ? '|' : ' '));
+}
+
+void eeh_tree_state_dump(void (*pfn)(void *, const char *, ...),
+			 void *s, struct eeh_pe *pe, int level, int xlevel)
+{
+	struct eeh_dev *edev;
+	struct eeh_pe *child_pe;
+	int slevel, sxlevel;
+	char buf[1024];
+
+	eeh_recovery_must_be_locked();
+	eeh_tree_state_indent(pfn, s, level, xlevel, true);
+	pfn(s, "* [PE#0x%x] type=%s%s%s%s%s config_addr=0x%x pass_count=%d\n",
+	    pe->addr,
+	    ((pe->type & EEH_PE_INVALID) ? "INVALID " : ""),
+	    ((pe->type & EEH_PE_PHB) ? "PHB " : ""),
+	    ((pe->type & EEH_PE_DEVICE) ? "DEVICE " : ""),
+	    ((pe->type & EEH_PE_BUS) ? "BUS " : ""),
+	    ((pe->type & EEH_PE_VF) ? "VF " : ""),
+	    pe->config_addr,
+	    atomic_read(&pe->pass_dev_cnt));
+
+	slevel = level + 1;
+	sxlevel = xlevel;
+	if (!list_empty(&pe->edevs) || !list_empty(&pe->child_list))
+		sxlevel |= (1 << slevel);
+	eeh_tree_state_indent(pfn, s, slevel, sxlevel, false);
+	pfn(s, "  check_count=%d freeze_count=%d false_positives=%d first_freeze=%llu\n",
+		   pe->check_count, pe->freeze_count, pe->false_positives,
+		   pe->tstamp);
+	eeh_tree_state_indent(pfn, s, slevel, sxlevel, false);
+	pfn(s, "  kernel state=0x%x %s%s%s%s%s%s%s%s\n", pe->state,
+	    ((pe->state & EEH_PE_ISOLATED) ? "ISOLATED " : ""),
+	    ((pe->state & EEH_PE_RECOVERING) ? "RECOVERING " : ""),
+	    ((pe->state & EEH_PE_CFG_BLOCKED) ? "CFG_BLOCKED " : ""),
+	    ((pe->state & EEH_PE_RESET) ? "RESET " : ""),
+	    ((pe->state & EEH_PE_KEEP) ? "KEEP " : ""),
+	    ((pe->state & EEH_PE_CFG_RESTRICTED) ? "CFG_RESTRICTED " : ""),
+	    ((pe->state & EEH_PE_REMOVED) ? "REMOVED" : ""),
+	    ((pe->state & EEH_PE_PRI_BUS) ? "PRI_BUS" : ""));
+	if (eeh_ops->pe_plat_state_dump) {
+		eeh_tree_state_indent(pfn, s, slevel, sxlevel, false);
+		eeh_ops->pe_plat_state_dump(buf, sizeof(buf), pe);
+		pfn(s, "  %.*s\n", sizeof(buf), buf);
+	}
+
+	slevel = level + 1;
+	list_for_each_entry(edev, &pe->edevs, entry) {
+		struct pci_dev *pdev = edev->pdev;
+
+		sxlevel = xlevel;
+		if ((edev != list_last_entry(&pe->edevs, struct eeh_dev, entry)) ||
+		    !list_empty(&pe->child_list))
+			sxlevel |= (1 << slevel);
+		eeh_tree_state_indent(pfn, s, slevel, sxlevel, true);
+		pfn(s, "* [DEV %s] pe_config_addr=0x%x driver=%s\n",
+		    pci_name(pdev), edev->pe_config_addr, eeh_driver_name(pdev));
+		eeh_tree_state_indent(pfn, s, slevel + 1, sxlevel, false);
+		pfn(s, "mode=0x%x %s%s%s%s%s%s%s%s\n", edev->mode,
+		    ((edev->mode & EEH_DEV_BRIDGE) ? "BRIDGE " : ""),
+		    ((edev->mode & EEH_DEV_ROOT_PORT) ? "ROOT_PORT " : ""),
+		    ((edev->mode & EEH_DEV_DS_PORT) ? "DS_PORT " : ""),
+		    ((edev->mode & EEH_DEV_IRQ_DISABLED) ? "IRQ_DISABLED " : ""),
+		    ((edev->mode & EEH_DEV_DISCONNECTED) ? "DISCONNECTED " : ""),
+		    ((edev->mode & EEH_DEV_NO_HANDLER) ? "NO_HANDLER " : ""),
+		    ((edev->mode & EEH_DEV_SYSFS) ? "SYSFS " : ""),
+		    ((edev->mode & EEH_DEV_REMOVED) ? "REMOVED " : ""));
+	}
+
+	slevel = level + 1;
+	list_for_each_entry(child_pe, &pe->child_list, child) {
+		sxlevel = xlevel;
+		if (child_pe != list_last_entry(&pe->child_list, struct eeh_pe, child))
+			sxlevel |= (1 << slevel);
+		eeh_tree_state_dump(pfn, s, child_pe, slevel, sxlevel);
+	}
+}
+
+
 /**
  * pcibios_set_pcie_reset_state - Set PCI-E reset state
  * @dev: pci device struct
diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 9d03292f66a7..7b077599c567 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -15,6 +15,7 @@
 #include <linux/kthread.h>
 #include <linux/workqueue.h>
 #include <linux/completion.h>
+#include <linux/seq_buf.h>
 #include <asm/eeh.h>
 #include <asm/eeh_event.h>
 #include <asm/ppc-pci.h>
@@ -996,6 +997,26 @@ static int eeh_reset_device(unsigned int event_id,
 	return 0;
 }
 
+static void eeh_tree_state_dump_kprintf(struct eeh_pe *root_pe)
+{
+	struct seq_buf s;
+	char *buf, *p, *q;
+
+	buf = kzalloc(PAGE_SIZE, GFP_KERNEL);
+	seq_buf_init(&s, buf, PAGE_SIZE);
+
+	eeh_tree_state_dump((void (*)(void *, const char *, ...))seq_buf_printf, &s, root_pe, 0, 0);
+
+	/* printk's output is limited to LOG_LINE_MAX, so split into lines: */
+	/* buf must end with a \n */
+	p = buf;
+	while ((q = strstr(p, "\n"))) {
+		printk(KERN_INFO "%.*s", (int)(q - p + 1), p);
+		p = q + 1;
+	}
+	kfree(buf);
+}
+
 /* The longest amount of time to wait for a pci device
  * to come back on line, in seconds.
  */
@@ -1129,6 +1150,9 @@ void eeh_handle_normal_event(unsigned int event_id, struct eeh_pe *pe)
 	int devices = 0;
 
 	eeh_recovery_lock();
+	pr_info("EEH(%u): PE state before recovery:\n", event_id);
+	eeh_tree_state_dump_kprintf(pe);
+
 	bus = eeh_pe_bus_get(pe);
 	if (!bus) {
 		pr_err("EEH(%u): %s: Cannot find PCI bus for PHB#%x-PE#%x\n",
@@ -1381,6 +1405,8 @@ void eeh_handle_normal_event(unsigned int event_id, struct eeh_pe *pe)
 			eeh_pe_state_clear(pe, EEH_PE_PRI_BUS, true);
 			eeh_pe_dev_mode_mark(pe, EEH_DEV_REMOVED);
 
+			pr_info("PE state after recovery (before final device removal):\n");
+			eeh_tree_state_dump_kprintf(pe);
 			eeh_recovery_unlock();
 			pci_lock_rescan_remove();
 			pci_hp_remove_devices(bus);
@@ -1405,6 +1431,8 @@ void eeh_handle_normal_event(unsigned int event_id, struct eeh_pe *pe)
 			eeh_clear_slot_attention(edev->pdev);
 
 	eeh_pe_state_clear(pe, EEH_PE_RECOVERING, true);
+	pr_info("EEH(%u): PE state after recovery:\n", event_id);
+	eeh_tree_state_dump_kprintf(pe);
 	eeh_recovery_unlock();
 
 }
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 1f6ec78ad88b..82b705e3f1e7 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -206,6 +206,30 @@ PNV_EEH_DBGFS_ENTRY(outb, 0xD10);
 PNV_EEH_DBGFS_ENTRY(inbA, 0xD90);
 PNV_EEH_DBGFS_ENTRY(inbB, 0xE10);
 
+static int eeh_tree_state_dump_seq_file(struct seq_file *s, void *unused)
+{
+	struct eeh_pe *root_pe = s->private;
+
+	eeh_recovery_lock();
+	eeh_tree_state_dump((void (*)(void *, const char *, ...))seq_printf,
+			    s, root_pe, 0, 0);
+	eeh_recovery_unlock();
+	return 0;
+}
+
+static int eeh_tree_state_dbgfs_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, eeh_tree_state_dump_seq_file, eeh_phb_pe_get(inode->i_private));
+}
+
+static const struct file_operations eeh_tree_state_debugfs_ops = {
+	.owner		= THIS_MODULE,
+	.open		= eeh_tree_state_dbgfs_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
 #endif /* CONFIG_DEBUG_FS */
 
 void pnv_eeh_enable_phbs(void)
@@ -287,6 +311,9 @@ int pnv_eeh_post_init(void)
 		debugfs_create_file("err_injct_inboundB", 0600,
 				    phb->dbgfs, hose,
 				    &pnv_eeh_dbgfs_ops_inbB);
+		debugfs_create_file("eeh_pe_tree", 0400,
+				    phb->dbgfs, hose,
+				    &eeh_tree_state_debugfs_ops);
 #endif /* CONFIG_DEBUG_FS */
 	}
 
@@ -1685,6 +1712,39 @@ static int pnv_eeh_restore_config(struct pci_dn *pdn)
 	return ret;
 }
 
+void pnv_eeh_pe_plat_state_dump(char *buf, size_t len, struct eeh_pe *pe)
+{
+	struct pnv_phb *phb = pe->phb->private_data;
+	s64 rc;
+	u8 state = 0;
+	__be16 pcierr = 0;
+
+	/* Collect state directly from OPAL to avoid side effects: */
+	rc = opal_pci_eeh_freeze_status(phb->opal_id, pe->addr, &state,
+					&pcierr, NULL);
+	pcierr = be16_to_cpu(pcierr);
+
+	if (rc == OPAL_SUCCESS)
+		snprintf(buf, len, "OPAL state=0x%x %s%s%s%s%s%s%s pcierr=0x%x %s%s%s%s%s%s",
+			 state,
+			 ((state == OPAL_EEH_STOPPED_NOT_FROZEN) ? "OK" : ""),
+			 ((state == OPAL_EEH_STOPPED_MMIO_FREEZE) ? "MMIO_FREEZE" : ""),
+			 ((state == OPAL_EEH_STOPPED_DMA_FREEZE) ? "DMA_FREEZE" : ""),
+			 ((state == OPAL_EEH_STOPPED_MMIO_DMA_FREEZE) ? "MMIO_DMA_FREEZE" : ""),
+			 ((state == OPAL_EEH_STOPPED_RESET) ? "STOPPED_RESET" : ""),
+			 ((state == OPAL_EEH_STOPPED_TEMP_UNAVAIL) ? "STOPPED_TEMP_UNAVAIL" : ""),
+			 ((state == OPAL_EEH_STOPPED_PERM_UNAVAIL) ? "STOPPED_PERM_UNAVAIL" : ""),
+			 pcierr,
+			 ((pcierr == OPAL_EEH_NO_ERROR) ? "OK" : ""),
+			 ((pcierr == OPAL_EEH_IOC_ERROR) ? "IOC_ERROR" : ""),
+			 ((pcierr == OPAL_EEH_PHB_ERROR) ? "PHB_ERROR" : ""),
+			 ((pcierr == OPAL_EEH_PE_ERROR) ? "PE_ERROR" : ""),
+			 ((pcierr == OPAL_EEH_PE_MMIO_ERROR) ? "MMIO_ERROR" : ""),
+			 ((pcierr == OPAL_EEH_PE_DMA_ERROR) ? "DMA_ERROR" : ""));
+	else
+		snprintf(buf, len, "OPAL error=0x%llx", rc);
+}
+
 static struct eeh_ops pnv_eeh_ops = {
 	.name                   = "powernv",
 	.init                   = pnv_eeh_init,
@@ -1700,7 +1760,8 @@ static struct eeh_ops pnv_eeh_ops = {
 	.write_config           = pnv_eeh_write_config,
 	.next_error		= pnv_eeh_next_error,
 	.restore_config		= pnv_eeh_restore_config,
-	.notify_resume		= NULL
+	.notify_resume		= NULL,
+	.pe_plat_state_dump	= pnv_eeh_pe_plat_state_dump,
 };
 
 #ifdef CONFIG_PCI_IOV
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index c49fab23f1c9..3fbbd8583350 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -782,6 +782,24 @@ static int pseries_notify_resume(struct pci_dn *pdn)
 }
 #endif
 
+void pseries_eeh_pe_plat_state_dump(char *buf, size_t len, struct eeh_pe *pe)
+{
+	int state, delay;
+
+	/* pseries_eeh_get_state() doesn't have side-effects, so we can use it here: */
+	state = pseries_eeh_get_state(pe, &delay);
+
+	snprintf(buf, len, "RTAS state=0x%x %s%s%s%s%s%s%s",
+	    state,
+	    ((state & EEH_STATE_UNAVAILABLE) ? "UNAVAILABLE " : ""),
+	    ((state & EEH_STATE_NOT_SUPPORT) ? "NOT_SUPPORT " : ""),
+	    ((state & EEH_STATE_RESET_ACTIVE) ? "RESET_ACTIVE " : ""),
+	    ((state & EEH_STATE_MMIO_ACTIVE) ? "MMIO_ACTIVE " : ""),
+	    ((state & EEH_STATE_DMA_ACTIVE) ? "DMA_ACTIVE " : ""),
+	    ((state & EEH_STATE_MMIO_ENABLED) ? "MMIO_ENABLED " : ""),
+	    ((state & EEH_STATE_DMA_ENABLED) ? "DMA_ENABLED " : ""));
+}
+
 static struct eeh_ops pseries_eeh_ops = {
 	.name			= "pseries",
 	.init			= pseries_eeh_init,
@@ -798,8 +816,9 @@ static struct eeh_ops pseries_eeh_ops = {
 	.next_error		= NULL,
 	.restore_config		= pseries_eeh_restore_config,
 #ifdef CONFIG_PCI_IOV
-	.notify_resume		= pseries_notify_resume
+	.notify_resume		= pseries_notify_resume,
 #endif
+	.pe_plat_state_dump	= pseries_eeh_pe_plat_state_dump,
 };
 
 /**
-- 
2.22.0.216.g00a2a96fc9

