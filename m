Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2208FA28
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 07:02:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468rmY1z7MzDr0B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 15:02:53 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 468rRw4kZQzDrCG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 14:48:28 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7G4lZ9E121029
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 00:48:25 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2udkufkcqn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 00:48:25 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Fri, 16 Aug 2019 05:48:23 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 16 Aug 2019 05:48:21 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7G4mK7951314772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Aug 2019 04:48:20 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73DE4A4064;
 Fri, 16 Aug 2019 04:48:20 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D32FDA405B;
 Fri, 16 Aug 2019 04:48:19 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Aug 2019 04:48:19 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 456B3A03CC;
 Fri, 16 Aug 2019 14:48:16 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 06/12] powerpc/eeh: Refactor around eeh_probe_devices()
Date: Fri, 16 Aug 2019 14:48:10 +1000
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
In-Reply-To: <cover.1565930772.git.sbobroff@linux.ibm.com>
References: <cover.1565930772.git.sbobroff@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19081604-0008-0000-0000-000003099D5A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081604-0009-0000-0000-00004A27B8D7
Message-Id: <33b0a6339d5ac88693de092d6fba984f2a5add66.1565930772.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908160051
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
Cc: aik@ozlabs.ru, oohall@gmail.com, tyreld@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that EEH support for all devices (on PowerNV and pSeries) is
provided by the pcibios bus add device hooks, eeh_probe_devices() and
eeh_addr_cache_build() are redundant and can be removed.

Move the EEH enabled message into it's own function so that it can be
called from multiple places.

Note that previously on pSeries, useless EEH sysfs files were created
for some devices that did not have EEH support and this change
prevents them from being created.

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
---
 arch/powerpc/include/asm/eeh.h               |  7 ++---
 arch/powerpc/kernel/eeh.c                    | 27 ++++++-----------
 arch/powerpc/kernel/eeh_cache.c              | 32 --------------------
 arch/powerpc/platforms/powernv/eeh-powernv.c |  4 +--
 arch/powerpc/platforms/pseries/pci.c         |  3 +-
 5 files changed, 14 insertions(+), 59 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 20105964287a..7f9404a0c3bb 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -270,13 +270,12 @@ struct pci_bus *eeh_pe_bus_get(struct eeh_pe *pe);
 
 struct eeh_dev *eeh_dev_init(struct pci_dn *pdn);
 void eeh_dev_phb_init_dynamic(struct pci_controller *phb);
-void eeh_probe_devices(void);
+void eeh_show_enabled(void);
 int __init eeh_ops_register(struct eeh_ops *ops);
 int __exit eeh_ops_unregister(const char *name);
 int eeh_check_failure(const volatile void __iomem *token);
 int eeh_dev_check_failure(struct eeh_dev *edev);
 void eeh_addr_cache_init(void);
-void eeh_addr_cache_build(void);
 void eeh_add_device_early(struct pci_dn *);
 void eeh_add_device_tree_early(struct pci_dn *);
 void eeh_add_device_late(struct pci_dev *);
@@ -320,7 +319,7 @@ static inline bool eeh_enabled(void)
         return false;
 }
 
-static inline void eeh_probe_devices(void) { }
+static inline void eeh_show_enabled(void) { }
 
 static inline void *eeh_dev_init(struct pci_dn *pdn, void *data)
 {
@@ -338,8 +337,6 @@ static inline int eeh_check_failure(const volatile void __iomem *token)
 
 static inline void eeh_addr_cache_init(void) { }
 
-static inline void eeh_addr_cache_build(void) { }
-
 static inline void eeh_add_device_early(struct pci_dn *pdn) { }
 
 static inline void eeh_add_device_tree_early(struct pci_dn *pdn) { }
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 87edac6f2fd9..c0ec1b6b1e69 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -150,6 +150,16 @@ static int __init eeh_setup(char *str)
 }
 __setup("eeh=", eeh_setup);
 
+void eeh_show_enabled(void)
+{
+	if (eeh_has_flag(EEH_FORCE_DISABLED))
+		pr_info("EEH: Recovery disabled by kernel parameter.\n");
+	else if (eeh_has_flag(EEH_ENABLED))
+		pr_info("EEH: Capable adapter found: recovery enabled.\n");
+	else
+		pr_info("EEH: No capable adapters found: recovery disabled.\n");
+}
+
 /*
  * This routine captures assorted PCI configuration space data
  * for the indicated PCI device, and puts them into a buffer
@@ -1143,23 +1153,6 @@ static struct notifier_block eeh_reboot_nb = {
 	.notifier_call = eeh_reboot_notifier,
 };
 
-void eeh_probe_devices(void)
-{
-	struct pci_controller *hose, *tmp;
-	struct pci_dn *pdn;
-
-	/* Enable EEH for all adapters */
-	list_for_each_entry_safe(hose, tmp, &hose_list, list_node) {
-		pdn = hose->pci_data;
-		traverse_pci_dn(pdn, eeh_ops->probe, NULL);
-	}
-	if (eeh_enabled())
-		pr_info("EEH: PCI Enhanced I/O Error Handling Enabled\n");
-	else
-		pr_info("EEH: No capable adapters found\n");
-
-}
-
 /**
  * eeh_init - EEH initialization
  *
diff --git a/arch/powerpc/kernel/eeh_cache.c b/arch/powerpc/kernel/eeh_cache.c
index a790fa49c62d..8c8649172e97 100644
--- a/arch/powerpc/kernel/eeh_cache.c
+++ b/arch/powerpc/kernel/eeh_cache.c
@@ -265,38 +265,6 @@ void eeh_addr_cache_init(void)
 	spin_lock_init(&pci_io_addr_cache_root.piar_lock);
 }
 
-/**
- * eeh_addr_cache_build - Build a cache of I/O addresses
- *
- * Build a cache of pci i/o addresses.  This cache will be used to
- * find the pci device that corresponds to a given address.
- * This routine scans all pci busses to build the cache.
- * Must be run late in boot process, after the pci controllers
- * have been scanned for devices (after all device resources are known).
- */
-void eeh_addr_cache_build(void)
-{
-	struct pci_dn *pdn;
-	struct eeh_dev *edev;
-	struct pci_dev *dev = NULL;
-
-	for_each_pci_dev(dev) {
-		pdn = pci_get_pdn_by_devfn(dev->bus, dev->devfn);
-		if (!pdn)
-			continue;
-
-		edev = pdn_to_eeh_dev(pdn);
-		if (!edev)
-			continue;
-
-		dev->dev.archdata.edev = edev;
-		edev->pdev = dev;
-
-		eeh_addr_cache_insert_dev(dev);
-		eeh_sysfs_add_device(dev);
-	}
-}
-
 static int eeh_addr_cache_show(struct seq_file *s, void *v)
 {
 	struct pci_io_addr_range *piar;
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 77cc2f51c2ea..7ee0df9ba2c8 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -255,9 +255,7 @@ int pnv_eeh_post_init(void)
 	struct pnv_phb *phb;
 	int ret = 0;
 
-	/* Probe devices & build address cache */
-	eeh_probe_devices();
-	eeh_addr_cache_build();
+	eeh_show_enabled();
 
 	/* Register OPAL event notifier */
 	eeh_event_irq = opal_event_request(ilog2(OPAL_EVENT_PCI_ERROR));
diff --git a/arch/powerpc/platforms/pseries/pci.c b/arch/powerpc/platforms/pseries/pci.c
index 1eae1d09980c..722830978639 100644
--- a/arch/powerpc/platforms/pseries/pci.c
+++ b/arch/powerpc/platforms/pseries/pci.c
@@ -229,8 +229,7 @@ void __init pSeries_final_fixup(void)
 
 	pSeries_request_regions();
 
-	eeh_probe_devices();
-	eeh_addr_cache_build();
+	eeh_show_enabled();
 
 #ifdef CONFIG_PCI_IOV
 	ppc_md.pcibios_sriov_enable = pseries_pcibios_sriov_enable;
-- 
2.22.0.216.g00a2a96fc9

