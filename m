Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FED1F8018
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jun 2020 03:04:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49kK9x3s2NzDr1r
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jun 2020 11:04:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=fenghua.yu@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49kJhB5NK1zDqw8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jun 2020 10:41:54 +1000 (AEST)
IronPort-SDR: obvou0hHwAHtXXtzQpV/PA4nk8a+OGJWfNgzL8XhcUD0GM7AOdPUvHXE9WLtz+5/HdKZk+4uo2
 F444i4SD8wZg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2020 17:41:49 -0700
IronPort-SDR: LF8tdvCWKmeqS1rfC8+0bDjDNcaEIucVIm/iNLybTziaea9cqDdXjSZIybyIBrUTotrqLuiqv0
 P/SygUMHMRIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,505,1583222400"; d="scan'208";a="261011188"
Received: from romley-ivt3.sc.intel.com ([172.25.110.60])
 by orsmga007.jf.intel.com with ESMTP; 12 Jun 2020 17:41:48 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, "H Peter Anvin" <hpa@zytor.com>,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Lu Baolu" <baolu.lu@linux.intel.com>,
 "Frederic Barrat" <fbarrat@linux.ibm.com>,
 "Andrew Donnellan" <ajd@linux.ibm.com>,
 "Felix Kuehling" <Felix.Kuehling@amd.com>,
 "Joerg Roedel" <joro@8bytes.org>, "Dave Hansen" <dave.hansen@intel.com>,
 "Tony Luck" <tony.luck@intel.com>, "Ashok Raj" <ashok.raj@intel.com>,
 "Jacob Jun Pan" <jacob.jun.pan@intel.com>,
 "Dave Jiang" <dave.jiang@intel.com>, "Yu-cheng Yu" <yu-cheng.yu@intel.com>,
 "Sohil Mehta" <sohil.mehta@intel.com>,
 "Ravi V Shankar" <ravi.v.shankar@intel.com>
Subject: [PATCH v2 01/12] iommu: Change type of pasid to unsigned int
Date: Fri, 12 Jun 2020 17:41:22 -0700
Message-Id: <1592008893-9388-2-git-send-email-fenghua.yu@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
References: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:59:17 +1000
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
Cc: Fenghua Yu <fenghua.yu@intel.com>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>, iommu@lists.linux-foundation.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PASID is defined as a few different types in iommu including "int",
"u32", and "unsigned int". To be consistent and to match with ioasid's
type, define PASID and its variations (e.g. max PASID) as "unsigned int".

No PASID type change in uapi.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
v2:
- Create this new patch to define PASID as "unsigned int" consistently in
  iommu (Thomas)

 drivers/gpu/drm/amd/amdkfd/kfd_iommu.c |  5 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h  |  2 +-
 drivers/iommu/amd/amd_iommu.h          | 13 ++++----
 drivers/iommu/amd/amd_iommu_types.h    | 12 ++++----
 drivers/iommu/amd/init.c               |  4 +--
 drivers/iommu/amd/iommu.c              | 41 ++++++++++++++------------
 drivers/iommu/amd/iommu_v2.c           | 22 +++++++-------
 drivers/iommu/intel/debugfs.c          |  2 +-
 drivers/iommu/intel/dmar.c             | 13 ++++----
 drivers/iommu/intel/intel-pasid.h      | 21 ++++++-------
 drivers/iommu/intel/iommu.c            |  4 +--
 drivers/iommu/intel/pasid.c            | 36 +++++++++++-----------
 drivers/iommu/intel/svm.c              | 12 ++++----
 drivers/iommu/iommu.c                  |  2 +-
 drivers/misc/uacce/uacce.c             |  2 +-
 include/linux/amd-iommu.h              |  9 +++---
 include/linux/intel-iommu.h            | 18 +++++------
 include/linux/intel-svm.h              |  2 +-
 include/linux/iommu.h                  |  8 ++---
 include/linux/uacce.h                  |  2 +-
 20 files changed, 121 insertions(+), 109 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c b/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
index 7c8786b9eb0a..703d23deca76 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
@@ -139,7 +139,8 @@ void kfd_iommu_unbind_process(struct kfd_process *p)
 }
 
 /* Callback for process shutdown invoked by the IOMMU driver */
-static void iommu_pasid_shutdown_callback(struct pci_dev *pdev, int pasid)
+static void iommu_pasid_shutdown_callback(struct pci_dev *pdev,
+					  unsigned int pasid)
 {
 	struct kfd_dev *dev = kfd_device_by_pci_dev(pdev);
 	struct kfd_process *p;
@@ -185,7 +186,7 @@ static void iommu_pasid_shutdown_callback(struct pci_dev *pdev, int pasid)
 }
 
 /* This function called by IOMMU driver on PPR failure */
-static int iommu_invalid_ppr_cb(struct pci_dev *pdev, int pasid,
+static int iommu_invalid_ppr_cb(struct pci_dev *pdev, unsigned int pasid,
 		unsigned long address, u16 flags)
 {
 	struct kfd_dev *dev;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index f0587d94294d..3c7d1f774afe 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -714,7 +714,7 @@ struct kfd_process {
 	/* We want to receive a notification when the mm_struct is destroyed */
 	struct mmu_notifier mmu_notifier;
 
-	uint16_t pasid;
+	unsigned int pasid;
 	unsigned int doorbell_index;
 
 	/*
diff --git a/drivers/iommu/amd/amd_iommu.h b/drivers/iommu/amd/amd_iommu.h
index f892992c8744..0914b5b6f879 100644
--- a/drivers/iommu/amd/amd_iommu.h
+++ b/drivers/iommu/amd/amd_iommu.h
@@ -45,12 +45,13 @@ extern int amd_iommu_register_ppr_notifier(struct notifier_block *nb);
 extern int amd_iommu_unregister_ppr_notifier(struct notifier_block *nb);
 extern void amd_iommu_domain_direct_map(struct iommu_domain *dom);
 extern int amd_iommu_domain_enable_v2(struct iommu_domain *dom, int pasids);
-extern int amd_iommu_flush_page(struct iommu_domain *dom, int pasid,
+extern int amd_iommu_flush_page(struct iommu_domain *dom, unsigned int pasid,
 				u64 address);
-extern int amd_iommu_flush_tlb(struct iommu_domain *dom, int pasid);
-extern int amd_iommu_domain_set_gcr3(struct iommu_domain *dom, int pasid,
-				     unsigned long cr3);
-extern int amd_iommu_domain_clear_gcr3(struct iommu_domain *dom, int pasid);
+extern int amd_iommu_flush_tlb(struct iommu_domain *dom, unsigned int pasid);
+extern int amd_iommu_domain_set_gcr3(struct iommu_domain *dom,
+				     unsigned int pasid, unsigned long cr3);
+extern int amd_iommu_domain_clear_gcr3(struct iommu_domain *dom,
+				       unsigned int pasid);
 extern struct iommu_domain *amd_iommu_get_v2_domain(struct pci_dev *pdev);
 
 #ifdef CONFIG_IRQ_REMAP
@@ -66,7 +67,7 @@ static inline int amd_iommu_create_irq_domain(struct amd_iommu *iommu)
 #define PPR_INVALID			0x1
 #define PPR_FAILURE			0xf
 
-extern int amd_iommu_complete_ppr(struct pci_dev *pdev, int pasid,
+extern int amd_iommu_complete_ppr(struct pci_dev *pdev, unsigned int pasid,
 				  int status, int tag);
 
 static inline bool is_rd890_iommu(struct pci_dev *pdev)
diff --git a/drivers/iommu/amd/amd_iommu_types.h b/drivers/iommu/amd/amd_iommu_types.h
index 30a5d412255a..d395931b2232 100644
--- a/drivers/iommu/amd/amd_iommu_types.h
+++ b/drivers/iommu/amd/amd_iommu_types.h
@@ -443,11 +443,11 @@ extern struct kmem_cache *amd_iommu_irq_cache;
  * incoming PPR faults around.
  */
 struct amd_iommu_fault {
-	u64 address;    /* IO virtual address of the fault*/
-	u32 pasid;      /* Address space identifier */
-	u16 device_id;  /* Originating PCI device id */
-	u16 tag;        /* PPR tag */
-	u16 flags;      /* Fault flags */
+	u64 address;		/* IO virtual address of the fault*/
+	unsigned int pasid;	/* Address space identifier */
+	u16 device_id;		/* Originating PCI device id */
+	u16 tag;		/* PPR tag */
+	u16 flags;		/* Fault flags */
 
 };
 
@@ -745,7 +745,7 @@ extern unsigned long *amd_iommu_pd_alloc_bitmap;
 extern bool amd_iommu_unmap_flush;
 
 /* Smallest max PASID supported by any IOMMU in the system */
-extern u32 amd_iommu_max_pasid;
+extern unsigned int amd_iommu_max_pasid;
 
 extern bool amd_iommu_v2_present;
 
diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index 6ebd4825e320..fbf5dd1d3eab 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -172,7 +172,7 @@ static int amd_iommus_present;
 bool amd_iommu_np_cache __read_mostly;
 bool amd_iommu_iotlb_sup __read_mostly = true;
 
-u32 amd_iommu_max_pasid __read_mostly = ~0;
+unsigned int amd_iommu_max_pasid __read_mostly = ~0;
 
 bool amd_iommu_v2_present __read_mostly;
 static bool amd_iommu_pc_present __read_mostly;
@@ -1750,7 +1750,7 @@ static int __init iommu_init_pci(struct amd_iommu *iommu)
 
 	if (iommu_feature(iommu, FEATURE_GT)) {
 		int glxval;
-		u32 max_pasid;
+		unsigned int max_pasid;
 		u64 pasmax;
 
 		pasmax = iommu->features & FEATURE_PASID_MASK;
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 74cca1757172..32999adbbd46 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -502,7 +502,8 @@ static void amd_iommu_report_page_fault(u16 devid, u16 domain_id,
 static void iommu_print_event(struct amd_iommu *iommu, void *__evt)
 {
 	struct device *dev = iommu->iommu.dev;
-	int type, devid, pasid, flags, tag;
+	int type, devid, flags, tag;
+	unsigned int pasid;
 	volatile u32 *event = __evt;
 	int count = 0;
 	u64 address;
@@ -898,8 +899,8 @@ static void build_inv_iotlb_pages(struct iommu_cmd *cmd, u16 devid, int qdep,
 		cmd->data[2] |= CMD_INV_IOMMU_PAGES_SIZE_MASK;
 }
 
-static void build_inv_iommu_pasid(struct iommu_cmd *cmd, u16 domid, int pasid,
-				  u64 address, bool size)
+static void build_inv_iommu_pasid(struct iommu_cmd *cmd, u16 domid,
+				  unsigned int pasid, u64 address, bool size)
 {
 	memset(cmd, 0, sizeof(*cmd));
 
@@ -916,8 +917,9 @@ static void build_inv_iommu_pasid(struct iommu_cmd *cmd, u16 domid, int pasid,
 	CMD_SET_TYPE(cmd, CMD_INV_IOMMU_PAGES);
 }
 
-static void build_inv_iotlb_pasid(struct iommu_cmd *cmd, u16 devid, int pasid,
-				  int qdep, u64 address, bool size)
+static void build_inv_iotlb_pasid(struct iommu_cmd *cmd, u16 devid,
+				  unsigned int pasid, int qdep, u64 address,
+				  bool size)
 {
 	memset(cmd, 0, sizeof(*cmd));
 
@@ -936,8 +938,8 @@ static void build_inv_iotlb_pasid(struct iommu_cmd *cmd, u16 devid, int pasid,
 	CMD_SET_TYPE(cmd, CMD_INV_IOTLB_PAGES);
 }
 
-static void build_complete_ppr(struct iommu_cmd *cmd, u16 devid, int pasid,
-			       int status, int tag, bool gn)
+static void build_complete_ppr(struct iommu_cmd *cmd, u16 devid,
+			       unsigned int pasid, int status, int tag, bool gn)
 {
 	memset(cmd, 0, sizeof(*cmd));
 
@@ -2772,7 +2774,7 @@ int amd_iommu_domain_enable_v2(struct iommu_domain *dom, int pasids)
 }
 EXPORT_SYMBOL(amd_iommu_domain_enable_v2);
 
-static int __flush_pasid(struct protection_domain *domain, int pasid,
+static int __flush_pasid(struct protection_domain *domain, unsigned int pasid,
 			 u64 address, bool size)
 {
 	struct iommu_dev_data *dev_data;
@@ -2833,13 +2835,13 @@ static int __flush_pasid(struct protection_domain *domain, int pasid,
 	return ret;
 }
 
-static int __amd_iommu_flush_page(struct protection_domain *domain, int pasid,
-				  u64 address)
+static int __amd_iommu_flush_page(struct protection_domain *domain,
+				  unsigned int pasid, u64 address)
 {
 	return __flush_pasid(domain, pasid, address, false);
 }
 
-int amd_iommu_flush_page(struct iommu_domain *dom, int pasid,
+int amd_iommu_flush_page(struct iommu_domain *dom, unsigned int pasid,
 			 u64 address)
 {
 	struct protection_domain *domain = to_pdomain(dom);
@@ -2854,13 +2856,14 @@ int amd_iommu_flush_page(struct iommu_domain *dom, int pasid,
 }
 EXPORT_SYMBOL(amd_iommu_flush_page);
 
-static int __amd_iommu_flush_tlb(struct protection_domain *domain, int pasid)
+static int __amd_iommu_flush_tlb(struct protection_domain *domain,
+				 unsigned int pasid)
 {
 	return __flush_pasid(domain, pasid, CMD_INV_IOMMU_ALL_PAGES_ADDRESS,
 			     true);
 }
 
-int amd_iommu_flush_tlb(struct iommu_domain *dom, int pasid)
+int amd_iommu_flush_tlb(struct iommu_domain *dom, unsigned int pasid)
 {
 	struct protection_domain *domain = to_pdomain(dom);
 	unsigned long flags;
@@ -2874,7 +2877,7 @@ int amd_iommu_flush_tlb(struct iommu_domain *dom, int pasid)
 }
 EXPORT_SYMBOL(amd_iommu_flush_tlb);
 
-static u64 *__get_gcr3_pte(u64 *root, int level, int pasid, bool alloc)
+static u64 *__get_gcr3_pte(u64 *root, int level, unsigned int pasid, bool alloc)
 {
 	int index;
 	u64 *pte;
@@ -2906,7 +2909,7 @@ static u64 *__get_gcr3_pte(u64 *root, int level, int pasid, bool alloc)
 	return pte;
 }
 
-static int __set_gcr3(struct protection_domain *domain, int pasid,
+static int __set_gcr3(struct protection_domain *domain, unsigned int pasid,
 		      unsigned long cr3)
 {
 	struct domain_pgtable pgtable;
@@ -2925,7 +2928,7 @@ static int __set_gcr3(struct protection_domain *domain, int pasid,
 	return __amd_iommu_flush_tlb(domain, pasid);
 }
 
-static int __clear_gcr3(struct protection_domain *domain, int pasid)
+static int __clear_gcr3(struct protection_domain *domain, unsigned int pasid)
 {
 	struct domain_pgtable pgtable;
 	u64 *pte;
@@ -2943,7 +2946,7 @@ static int __clear_gcr3(struct protection_domain *domain, int pasid)
 	return __amd_iommu_flush_tlb(domain, pasid);
 }
 
-int amd_iommu_domain_set_gcr3(struct iommu_domain *dom, int pasid,
+int amd_iommu_domain_set_gcr3(struct iommu_domain *dom, unsigned int pasid,
 			      unsigned long cr3)
 {
 	struct protection_domain *domain = to_pdomain(dom);
@@ -2958,7 +2961,7 @@ int amd_iommu_domain_set_gcr3(struct iommu_domain *dom, int pasid,
 }
 EXPORT_SYMBOL(amd_iommu_domain_set_gcr3);
 
-int amd_iommu_domain_clear_gcr3(struct iommu_domain *dom, int pasid)
+int amd_iommu_domain_clear_gcr3(struct iommu_domain *dom, unsigned int pasid)
 {
 	struct protection_domain *domain = to_pdomain(dom);
 	unsigned long flags;
@@ -2972,7 +2975,7 @@ int amd_iommu_domain_clear_gcr3(struct iommu_domain *dom, int pasid)
 }
 EXPORT_SYMBOL(amd_iommu_domain_clear_gcr3);
 
-int amd_iommu_complete_ppr(struct pci_dev *pdev, int pasid,
+int amd_iommu_complete_ppr(struct pci_dev *pdev, unsigned int pasid,
 			   int status, int tag)
 {
 	struct iommu_dev_data *dev_data;
diff --git a/drivers/iommu/amd/iommu_v2.c b/drivers/iommu/amd/iommu_v2.c
index e4b025c5637c..21dd53054acb 100644
--- a/drivers/iommu/amd/iommu_v2.c
+++ b/drivers/iommu/amd/iommu_v2.c
@@ -40,7 +40,7 @@ struct pasid_state {
 	struct mmu_notifier mn;                 /* mmu_notifier handle */
 	struct pri_queue pri[PRI_QUEUE_SIZE];	/* PRI tag states */
 	struct device_state *device_state;	/* Link to our device_state */
-	int pasid;				/* PASID index */
+	unsigned int pasid;			/* PASID index */
 	bool invalid;				/* Used during setup and
 						   teardown of the pasid */
 	spinlock_t lock;			/* Protect pri_queues and
@@ -70,7 +70,7 @@ struct fault {
 	struct mm_struct *mm;
 	u64 address;
 	u16 devid;
-	u16 pasid;
+	unsigned int pasid;
 	u16 tag;
 	u16 finish;
 	u16 flags;
@@ -150,7 +150,8 @@ static void put_device_state(struct device_state *dev_state)
 
 /* Must be called under dev_state->lock */
 static struct pasid_state **__get_pasid_state_ptr(struct device_state *dev_state,
-						  int pasid, bool alloc)
+						  unsigned int pasid,
+						  bool alloc)
 {
 	struct pasid_state **root, **ptr;
 	int level, index;
@@ -184,7 +185,7 @@ static struct pasid_state **__get_pasid_state_ptr(struct device_state *dev_state
 
 static int set_pasid_state(struct device_state *dev_state,
 			   struct pasid_state *pasid_state,
-			   int pasid)
+			   unsigned int pasid)
 {
 	struct pasid_state **ptr;
 	unsigned long flags;
@@ -211,7 +212,8 @@ static int set_pasid_state(struct device_state *dev_state,
 	return ret;
 }
 
-static void clear_pasid_state(struct device_state *dev_state, int pasid)
+static void clear_pasid_state(struct device_state *dev_state,
+			      unsigned int pasid)
 {
 	struct pasid_state **ptr;
 	unsigned long flags;
@@ -229,7 +231,7 @@ static void clear_pasid_state(struct device_state *dev_state, int pasid)
 }
 
 static struct pasid_state *get_pasid_state(struct device_state *dev_state,
-					   int pasid)
+					   unsigned int pasid)
 {
 	struct pasid_state **ptr, *ret = NULL;
 	unsigned long flags;
@@ -594,7 +596,7 @@ static struct notifier_block ppr_nb = {
 	.notifier_call = ppr_notifier,
 };
 
-int amd_iommu_bind_pasid(struct pci_dev *pdev, int pasid,
+int amd_iommu_bind_pasid(struct pci_dev *pdev, unsigned int pasid,
 			 struct task_struct *task)
 {
 	struct pasid_state *pasid_state;
@@ -615,7 +617,7 @@ int amd_iommu_bind_pasid(struct pci_dev *pdev, int pasid,
 		return -EINVAL;
 
 	ret = -EINVAL;
-	if (pasid < 0 || pasid >= dev_state->max_pasids)
+	if (pasid >= dev_state->max_pasids)
 		goto out;
 
 	ret = -ENOMEM;
@@ -679,7 +681,7 @@ int amd_iommu_bind_pasid(struct pci_dev *pdev, int pasid,
 }
 EXPORT_SYMBOL(amd_iommu_bind_pasid);
 
-void amd_iommu_unbind_pasid(struct pci_dev *pdev, int pasid)
+void amd_iommu_unbind_pasid(struct pci_dev *pdev, unsigned int pasid)
 {
 	struct pasid_state *pasid_state;
 	struct device_state *dev_state;
@@ -695,7 +697,7 @@ void amd_iommu_unbind_pasid(struct pci_dev *pdev, int pasid)
 	if (dev_state == NULL)
 		return;
 
-	if (pasid < 0 || pasid >= dev_state->max_pasids)
+	if (pasid >= dev_state->max_pasids)
 		goto out;
 
 	pasid_state = get_pasid_state(dev_state, pasid);
diff --git a/drivers/iommu/intel/debugfs.c b/drivers/iommu/intel/debugfs.c
index cf1ebb98e418..f3b99ed8ee92 100644
--- a/drivers/iommu/intel/debugfs.c
+++ b/drivers/iommu/intel/debugfs.c
@@ -20,7 +20,7 @@
 struct tbl_walk {
 	u16 bus;
 	u16 devfn;
-	u32 pasid;
+	unsigned int pasid;
 	struct root_entry *rt_entry;
 	struct context_entry *ctx_entry;
 	struct pasid_entry *pasid_tbl_entry;
diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
index cc46dff98fa0..805c02584df5 100644
--- a/drivers/iommu/intel/dmar.c
+++ b/drivers/iommu/intel/dmar.c
@@ -1395,8 +1395,8 @@ void qi_flush_dev_iotlb(struct intel_iommu *iommu, u16 sid, u16 pfsid,
 }
 
 /* PASID-based IOTLB invalidation */
-void qi_flush_piotlb(struct intel_iommu *iommu, u16 did, u32 pasid, u64 addr,
-		     unsigned long npages, bool ih)
+void qi_flush_piotlb(struct intel_iommu *iommu, u16 did, unsigned int pasid,
+		     u64 addr, unsigned long npages, bool ih)
 {
 	struct qi_desc desc = {.qw2 = 0, .qw3 = 0};
 
@@ -1437,7 +1437,7 @@ void qi_flush_piotlb(struct intel_iommu *iommu, u16 did, u32 pasid, u64 addr,
 
 /* PASID-based device IOTLB Invalidate */
 void qi_flush_dev_iotlb_pasid(struct intel_iommu *iommu, u16 sid, u16 pfsid,
-			      u32 pasid,  u16 qdep, u64 addr,
+			      unsigned int pasid,  u16 qdep, u64 addr,
 			      unsigned int size_order, u64 granu)
 {
 	unsigned long mask = 1UL << (VTD_PAGE_SHIFT + size_order - 1);
@@ -1465,7 +1465,7 @@ void qi_flush_dev_iotlb_pasid(struct intel_iommu *iommu, u16 sid, u16 pfsid,
 }
 
 void qi_flush_pasid_cache(struct intel_iommu *iommu, u16 did,
-			  u64 granu, int pasid)
+			  u64 granu, unsigned int pasid)
 {
 	struct qi_desc desc = {.qw1 = 0, .qw2 = 0, .qw3 = 0};
 
@@ -1779,7 +1779,7 @@ void dmar_msi_read(int irq, struct msi_msg *msg)
 }
 
 static int dmar_fault_do_one(struct intel_iommu *iommu, int type,
-		u8 fault_reason, int pasid, u16 source_id,
+		u8 fault_reason, unsigned int pasid, u16 source_id,
 		unsigned long long addr)
 {
 	const char *reason;
@@ -1826,10 +1826,11 @@ irqreturn_t dmar_fault(int irq, void *dev_id)
 	while (1) {
 		/* Disable printing, simply clear the fault when ratelimited */
 		bool ratelimited = !__ratelimit(&rs);
+		unsigned int pasid;
 		u8 fault_reason;
 		u16 source_id;
 		u64 guest_addr;
-		int type, pasid;
+		int type;
 		u32 data;
 		bool pasid_present;
 
diff --git a/drivers/iommu/intel/intel-pasid.h b/drivers/iommu/intel/intel-pasid.h
index c5318d40e0fa..fe9e9ac3b97e 100644
--- a/drivers/iommu/intel/intel-pasid.h
+++ b/drivers/iommu/intel/intel-pasid.h
@@ -72,7 +72,7 @@ struct pasid_entry {
 struct pasid_table {
 	void			*table;		/* pasid table pointer */
 	int			order;		/* page order of pasid table */
-	int			max_pasid;	/* max pasid */
+	unsigned int		max_pasid;	/* max pasid */
 	struct list_head	dev;		/* device list */
 };
 
@@ -98,30 +98,31 @@ static inline bool pasid_pte_is_present(struct pasid_entry *pte)
 	return READ_ONCE(pte->val[0]) & PASID_PTE_PRESENT;
 }
 
-extern u32 intel_pasid_max_id;
+extern unsigned int intel_pasid_max_id;
 int intel_pasid_alloc_id(void *ptr, int start, int end, gfp_t gfp);
-void intel_pasid_free_id(int pasid);
-void *intel_pasid_lookup_id(int pasid);
+void intel_pasid_free_id(unsigned int pasid);
+void *intel_pasid_lookup_id(unsigned int pasid);
 int intel_pasid_alloc_table(struct device *dev);
 void intel_pasid_free_table(struct device *dev);
 struct pasid_table *intel_pasid_get_table(struct device *dev);
 int intel_pasid_get_dev_max_id(struct device *dev);
-struct pasid_entry *intel_pasid_get_entry(struct device *dev, int pasid);
+struct pasid_entry *intel_pasid_get_entry(struct device *dev,
+					  unsigned int pasid);
 int intel_pasid_setup_first_level(struct intel_iommu *iommu,
 				  struct device *dev, pgd_t *pgd,
-				  int pasid, u16 did, int flags);
+				  unsigned int pasid, u16 did, int flags);
 int intel_pasid_setup_second_level(struct intel_iommu *iommu,
 				   struct dmar_domain *domain,
-				   struct device *dev, int pasid);
+				   struct device *dev, unsigned int pasid);
 int intel_pasid_setup_pass_through(struct intel_iommu *iommu,
 				   struct dmar_domain *domain,
-				   struct device *dev, int pasid);
+				   struct device *dev, unsigned int pasid);
 int intel_pasid_setup_nested(struct intel_iommu *iommu,
-			     struct device *dev, pgd_t *pgd, int pasid,
+			     struct device *dev, pgd_t *pgd, unsigned int pasid,
 			     struct iommu_gpasid_bind_data_vtd *pasid_data,
 			     struct dmar_domain *domain, int addr_width);
 void intel_pasid_tear_down_entry(struct intel_iommu *iommu,
-				 struct device *dev, int pasid,
+				 struct device *dev, unsigned int pasid,
 				 bool fault_ignore);
 int vcmd_alloc_pasid(struct intel_iommu *iommu, unsigned int *pasid);
 void vcmd_free_pasid(struct intel_iommu *iommu, unsigned int pasid);
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 9129663a7406..5a6f85d645c6 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -2469,7 +2469,7 @@ dmar_search_domain_by_dev_info(int segment, int bus, int devfn)
 static int domain_setup_first_level(struct intel_iommu *iommu,
 				    struct dmar_domain *domain,
 				    struct device *dev,
-				    int pasid)
+				    unsigned int pasid)
 {
 	int flags = PASID_FLAG_SUPERVISOR_MODE;
 	struct dma_pte *pgd = domain->pgd;
@@ -5147,7 +5147,7 @@ static int aux_domain_add_dev(struct dmar_domain *domain,
 		return -ENODEV;
 
 	if (domain->default_pasid <= 0) {
-		int pasid;
+		unsigned int pasid;
 
 		/* No private data needed for the default pasid */
 		pasid = ioasid_alloc(NULL, PASID_MIN,
diff --git a/drivers/iommu/intel/pasid.c b/drivers/iommu/intel/pasid.c
index c81f0f17c6ba..8a98b68c1c87 100644
--- a/drivers/iommu/intel/pasid.c
+++ b/drivers/iommu/intel/pasid.c
@@ -25,7 +25,7 @@
  * Intel IOMMU system wide PASID name space:
  */
 static DEFINE_SPINLOCK(pasid_lock);
-u32 intel_pasid_max_id = PASID_MAX;
+unsigned int intel_pasid_max_id = PASID_MAX;
 
 int vcmd_alloc_pasid(struct intel_iommu *iommu, unsigned int *pasid)
 {
@@ -146,7 +146,7 @@ int intel_pasid_alloc_table(struct device *dev)
 	struct pasid_table *pasid_table;
 	struct pasid_table_opaque data;
 	struct page *pages;
-	int max_pasid = 0;
+	unsigned int max_pasid = 0;
 	int ret, order;
 	int size;
 
@@ -168,7 +168,7 @@ int intel_pasid_alloc_table(struct device *dev)
 	INIT_LIST_HEAD(&pasid_table->dev);
 
 	if (info->pasid_supported)
-		max_pasid = min_t(int, pci_max_pasids(to_pci_dev(dev)),
+		max_pasid = min_t(unsigned int, pci_max_pasids(to_pci_dev(dev)),
 				  intel_pasid_max_id);
 
 	size = max_pasid >> (PASID_PDE_SHIFT - 3);
@@ -242,7 +242,8 @@ int intel_pasid_get_dev_max_id(struct device *dev)
 	return info->pasid_table->max_pasid;
 }
 
-struct pasid_entry *intel_pasid_get_entry(struct device *dev, int pasid)
+struct pasid_entry *intel_pasid_get_entry(struct device *dev,
+					  unsigned int pasid)
 {
 	struct device_domain_info *info;
 	struct pasid_table *pasid_table;
@@ -251,8 +252,7 @@ struct pasid_entry *intel_pasid_get_entry(struct device *dev, int pasid)
 	int dir_index, index;
 
 	pasid_table = intel_pasid_get_table(dev);
-	if (WARN_ON(!pasid_table || pasid < 0 ||
-		    pasid >= intel_pasid_get_dev_max_id(dev)))
+	if (WARN_ON(!pasid_table || pasid >= intel_pasid_get_dev_max_id(dev)))
 		return NULL;
 
 	dir = pasid_table->table;
@@ -305,7 +305,8 @@ static inline void pasid_clear_entry_with_fpd(struct pasid_entry *pe)
 }
 
 static void
-intel_pasid_clear_entry(struct device *dev, int pasid, bool fault_ignore)
+intel_pasid_clear_entry(struct device *dev, unsigned int pasid,
+			bool fault_ignore)
 {
 	struct pasid_entry *pe;
 
@@ -444,7 +445,7 @@ pasid_set_eafe(struct pasid_entry *pe)
 
 static void
 pasid_cache_invalidation_with_pasid(struct intel_iommu *iommu,
-				    u16 did, int pasid)
+				    u16 did, unsigned int pasid)
 {
 	struct qi_desc desc;
 
@@ -458,7 +459,8 @@ pasid_cache_invalidation_with_pasid(struct intel_iommu *iommu,
 }
 
 static void
-iotlb_invalidation_with_pasid(struct intel_iommu *iommu, u16 did, u32 pasid)
+iotlb_invalidation_with_pasid(struct intel_iommu *iommu, u16 did,
+			      unsigned int pasid)
 {
 	struct qi_desc desc;
 
@@ -473,7 +475,7 @@ iotlb_invalidation_with_pasid(struct intel_iommu *iommu, u16 did, u32 pasid)
 
 static void
 devtlb_invalidation_with_pasid(struct intel_iommu *iommu,
-			       struct device *dev, int pasid)
+			       struct device *dev, unsigned int pasid)
 {
 	struct device_domain_info *info;
 	u16 sid, qdep, pfsid;
@@ -490,7 +492,7 @@ devtlb_invalidation_with_pasid(struct intel_iommu *iommu,
 }
 
 void intel_pasid_tear_down_entry(struct intel_iommu *iommu, struct device *dev,
-				 int pasid, bool fault_ignore)
+				 unsigned int pasid, bool fault_ignore)
 {
 	struct pasid_entry *pte;
 	u16 did;
@@ -514,8 +516,8 @@ void intel_pasid_tear_down_entry(struct intel_iommu *iommu, struct device *dev,
 }
 
 static void pasid_flush_caches(struct intel_iommu *iommu,
-				struct pasid_entry *pte,
-				int pasid, u16 did)
+			       struct pasid_entry *pte,
+			       unsigned int pasid, u16 did)
 {
 	if (!ecap_coherent(iommu->ecap))
 		clflush_cache_range(pte, sizeof(*pte));
@@ -534,7 +536,7 @@ static void pasid_flush_caches(struct intel_iommu *iommu,
  */
 int intel_pasid_setup_first_level(struct intel_iommu *iommu,
 				  struct device *dev, pgd_t *pgd,
-				  int pasid, u16 did, int flags)
+				  unsigned int pasid, u16 did, int flags)
 {
 	struct pasid_entry *pte;
 
@@ -607,7 +609,7 @@ static inline int iommu_skip_agaw(struct dmar_domain *domain,
  */
 int intel_pasid_setup_second_level(struct intel_iommu *iommu,
 				   struct dmar_domain *domain,
-				   struct device *dev, int pasid)
+				   struct device *dev, unsigned int pasid)
 {
 	struct pasid_entry *pte;
 	struct dma_pte *pgd;
@@ -665,7 +667,7 @@ int intel_pasid_setup_second_level(struct intel_iommu *iommu,
  */
 int intel_pasid_setup_pass_through(struct intel_iommu *iommu,
 				   struct dmar_domain *domain,
-				   struct device *dev, int pasid)
+				   struct device *dev, unsigned int pasid)
 {
 	u16 did = FLPT_DEFAULT_DID;
 	struct pasid_entry *pte;
@@ -751,7 +753,7 @@ intel_pasid_setup_bind_data(struct intel_iommu *iommu, struct pasid_entry *pte,
  * @addr_width: Address width of the first level (guest)
  */
 int intel_pasid_setup_nested(struct intel_iommu *iommu, struct device *dev,
-			     pgd_t *gpgd, int pasid,
+			     pgd_t *gpgd, unsigned int pasid,
 			     struct iommu_gpasid_bind_data_vtd *pasid_data,
 			     struct dmar_domain *domain, int addr_width)
 {
diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index 6c87c807a0ab..b5618341b4b1 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -23,7 +23,7 @@
 #include "intel-pasid.h"
 
 static irqreturn_t prq_event_thread(int irq, void *d);
-static void intel_svm_drain_prq(struct device *dev, int pasid);
+static void intel_svm_drain_prq(struct device *dev, unsigned int pasid);
 
 #define PRQ_ORDER 0
 
@@ -371,7 +371,7 @@ int intel_svm_bind_gpasid(struct iommu_domain *domain, struct device *dev,
 	return ret;
 }
 
-int intel_svm_unbind_gpasid(struct device *dev, int pasid)
+int intel_svm_unbind_gpasid(struct device *dev, unsigned int pasid)
 {
 	struct intel_iommu *iommu = intel_svm_device_to_iommu(dev);
 	struct intel_svm_dev *sdev;
@@ -601,7 +601,7 @@ intel_svm_bind_mm(struct device *dev, int flags, struct svm_dev_ops *ops,
 }
 
 /* Caller must hold pasid_mutex */
-static int intel_svm_unbind_mm(struct device *dev, int pasid)
+static int intel_svm_unbind_mm(struct device *dev, unsigned int pasid)
 {
 	struct intel_svm_dev *sdev;
 	struct intel_iommu *iommu;
@@ -728,7 +728,7 @@ static bool is_canonical_address(u64 addr)
  * described in VT-d spec CH7.10 to drain all page requests and page
  * responses pending in the hardware.
  */
-static void intel_svm_drain_prq(struct device *dev, int pasid)
+static void intel_svm_drain_prq(struct device *dev, unsigned int pasid)
 {
 	struct device_domain_info *info;
 	struct dmar_domain *domain;
@@ -988,10 +988,10 @@ void intel_svm_unbind(struct iommu_sva *sva)
 	mutex_unlock(&pasid_mutex);
 }
 
-int intel_svm_get_pasid(struct iommu_sva *sva)
+unsigned int intel_svm_get_pasid(struct iommu_sva *sva)
 {
 	struct intel_svm_dev *sdev;
-	int pasid;
+	unsigned int pasid;
 
 	mutex_lock(&pasid_mutex);
 	sdev = to_intel_svm_dev(sva);
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index d43120eb1dc5..aba136ac377d 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2828,7 +2828,7 @@ void iommu_sva_unbind_device(struct iommu_sva *handle)
 }
 EXPORT_SYMBOL_GPL(iommu_sva_unbind_device);
 
-int iommu_sva_get_pasid(struct iommu_sva *handle)
+unsigned int iommu_sva_get_pasid(struct iommu_sva *handle)
 {
 	const struct iommu_ops *ops = handle->dev->bus->iommu_ops;
 
diff --git a/drivers/misc/uacce/uacce.c b/drivers/misc/uacce/uacce.c
index 107028e77ca3..8a3686e689dc 100644
--- a/drivers/misc/uacce/uacce.c
+++ b/drivers/misc/uacce/uacce.c
@@ -92,7 +92,7 @@ static long uacce_fops_compat_ioctl(struct file *filep,
 
 static int uacce_bind_queue(struct uacce_device *uacce, struct uacce_queue *q)
 {
-	int pasid;
+	unsigned int pasid;
 	struct iommu_sva *handle;
 
 	if (!(uacce->flags & UACCE_DEV_SVA))
diff --git a/include/linux/amd-iommu.h b/include/linux/amd-iommu.h
index 21e950e4ab62..25387ab5a4f5 100644
--- a/include/linux/amd-iommu.h
+++ b/include/linux/amd-iommu.h
@@ -76,7 +76,7 @@ extern void amd_iommu_free_device(struct pci_dev *pdev);
  *
  * The function returns 0 on success or a negative value on error.
  */
-extern int amd_iommu_bind_pasid(struct pci_dev *pdev, int pasid,
+extern int amd_iommu_bind_pasid(struct pci_dev *pdev, unsigned int pasid,
 				struct task_struct *task);
 
 /**
@@ -88,7 +88,7 @@ extern int amd_iommu_bind_pasid(struct pci_dev *pdev, int pasid,
  * When this function returns the device is no longer using the PASID
  * and the PASID is no longer bound to its task.
  */
-extern void amd_iommu_unbind_pasid(struct pci_dev *pdev, int pasid);
+extern void amd_iommu_unbind_pasid(struct pci_dev *pdev, unsigned int pasid);
 
 /**
  * amd_iommu_set_invalid_ppr_cb() - Register a call-back for failed
@@ -114,7 +114,7 @@ extern void amd_iommu_unbind_pasid(struct pci_dev *pdev, int pasid);
 #define AMD_IOMMU_INV_PRI_RSP_FAIL	2
 
 typedef int (*amd_iommu_invalid_ppr_cb)(struct pci_dev *pdev,
-					int pasid,
+					unsigned int pasid,
 					unsigned long address,
 					u16);
 
@@ -166,7 +166,8 @@ extern int amd_iommu_device_info(struct pci_dev *pdev,
  * @cb: The call-back function
  */
 
-typedef void (*amd_iommu_invalidate_ctx)(struct pci_dev *pdev, int pasid);
+typedef void (*amd_iommu_invalidate_ctx)(struct pci_dev *pdev,
+					 unsigned int pasid);
 
 extern int amd_iommu_set_invalidate_ctx_cb(struct pci_dev *pdev,
 					   amd_iommu_invalidate_ctx cb);
diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
index 4100bd224f5c..44fa8879f829 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -549,7 +549,7 @@ struct dmar_domain {
 					   2 == 1GiB, 3 == 512GiB, 4 == 1TiB */
 	u64		max_addr;	/* maximum mapped address */
 
-	int		default_pasid;	/*
+	unsigned int	default_pasid;	/*
 					 * The default pasid used for non-SVM
 					 * traffic on mediated devices.
 					 */
@@ -699,14 +699,14 @@ extern void qi_flush_iotlb(struct intel_iommu *iommu, u16 did, u64 addr,
 extern void qi_flush_dev_iotlb(struct intel_iommu *iommu, u16 sid, u16 pfsid,
 			u16 qdep, u64 addr, unsigned mask);
 
-void qi_flush_piotlb(struct intel_iommu *iommu, u16 did, u32 pasid, u64 addr,
-		     unsigned long npages, bool ih);
+void qi_flush_piotlb(struct intel_iommu *iommu, u16 did, unsigned int pasid,
+		     u64 addr, unsigned long npages, bool ih);
 
 void qi_flush_dev_iotlb_pasid(struct intel_iommu *iommu, u16 sid, u16 pfsid,
-			      u32 pasid, u16 qdep, u64 addr,
+			      unsigned int pasid, u16 qdep, u64 addr,
 			      unsigned int size_order, u64 granu);
 void qi_flush_pasid_cache(struct intel_iommu *iommu, u16 did, u64 granu,
-			  int pasid);
+			  unsigned int pasid);
 
 int qi_submit_sync(struct intel_iommu *iommu, struct qi_desc *desc,
 		   unsigned int count, unsigned long options);
@@ -734,11 +734,11 @@ extern int intel_svm_enable_prq(struct intel_iommu *iommu);
 extern int intel_svm_finish_prq(struct intel_iommu *iommu);
 int intel_svm_bind_gpasid(struct iommu_domain *domain, struct device *dev,
 			  struct iommu_gpasid_bind_data *data);
-int intel_svm_unbind_gpasid(struct device *dev, int pasid);
+int intel_svm_unbind_gpasid(struct device *dev, unsigned int pasid);
 struct iommu_sva *intel_svm_bind(struct device *dev, struct mm_struct *mm,
 				 void *drvdata);
 void intel_svm_unbind(struct iommu_sva *handle);
-int intel_svm_get_pasid(struct iommu_sva *handle);
+unsigned int intel_svm_get_pasid(struct iommu_sva *handle);
 struct svm_dev_ops;
 
 struct intel_svm_dev {
@@ -747,7 +747,7 @@ struct intel_svm_dev {
 	struct device *dev;
 	struct svm_dev_ops *ops;
 	struct iommu_sva sva;
-	int pasid;
+	unsigned int pasid;
 	int users;
 	u16 did;
 	u16 dev_iotlb:1;
@@ -760,7 +760,7 @@ struct intel_svm {
 
 	struct intel_iommu *iommu;
 	int flags;
-	int pasid;
+	unsigned int pasid;
 	int gpasid; /* In case that guest PASID is different from host PASID */
 	struct list_head devs;
 	struct list_head list;
diff --git a/include/linux/intel-svm.h b/include/linux/intel-svm.h
index c9e7e601950d..7ec24f19b7d3 100644
--- a/include/linux/intel-svm.h
+++ b/include/linux/intel-svm.h
@@ -11,7 +11,7 @@
 struct device;
 
 struct svm_dev_ops {
-	void (*fault_cb)(struct device *dev, int pasid, u64 address,
+	void (*fault_cb)(struct device *dev, unsigned int pasid, u64 address,
 			 void *private, int rwxp, int response);
 };
 
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 5f0b7859d2eb..813961145679 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -292,7 +292,7 @@ struct iommu_ops {
 	struct iommu_sva *(*sva_bind)(struct device *dev, struct mm_struct *mm,
 				      void *drvdata);
 	void (*sva_unbind)(struct iommu_sva *handle);
-	int (*sva_get_pasid)(struct iommu_sva *handle);
+	unsigned int (*sva_get_pasid)(struct iommu_sva *handle);
 
 	int (*page_response)(struct device *dev,
 			     struct iommu_fault_event *evt,
@@ -302,7 +302,7 @@ struct iommu_ops {
 	int (*sva_bind_gpasid)(struct iommu_domain *domain,
 			struct device *dev, struct iommu_gpasid_bind_data *data);
 
-	int (*sva_unbind_gpasid)(struct device *dev, int pasid);
+	int (*sva_unbind_gpasid)(struct device *dev, unsigned int pasid);
 
 	int (*def_domain_type)(struct device *dev);
 
@@ -656,7 +656,7 @@ struct iommu_sva *iommu_sva_bind_device(struct device *dev,
 					struct mm_struct *mm,
 					void *drvdata);
 void iommu_sva_unbind_device(struct iommu_sva *handle);
-int iommu_sva_get_pasid(struct iommu_sva *handle);
+unsigned int iommu_sva_get_pasid(struct iommu_sva *handle);
 
 #else /* CONFIG_IOMMU_API */
 
@@ -1049,7 +1049,7 @@ static inline void iommu_sva_unbind_device(struct iommu_sva *handle)
 {
 }
 
-static inline int iommu_sva_get_pasid(struct iommu_sva *handle)
+static inline unsigned int iommu_sva_get_pasid(struct iommu_sva *handle)
 {
 	return IOMMU_PASID_INVALID;
 }
diff --git a/include/linux/uacce.h b/include/linux/uacce.h
index 454c2f6672d7..667d7e691c0d 100644
--- a/include/linux/uacce.h
+++ b/include/linux/uacce.h
@@ -81,7 +81,7 @@ struct uacce_queue {
 	struct list_head list;
 	struct uacce_qfile_region *qfrs[UACCE_MAX_REGION];
 	enum uacce_q_state state;
-	int pasid;
+	unsigned int pasid;
 	struct iommu_sva *handle;
 };
 
-- 
2.19.1

