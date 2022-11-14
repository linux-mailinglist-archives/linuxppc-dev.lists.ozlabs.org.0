Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0676288D1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 20:01:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9zDy01cFz3f53
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 06:01:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fMNoJYWx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fMNoJYWx;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9z916KN5z3057
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 05:58:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668452294; x=1699988294;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SgviM+szPWE2044JxOu+kP67kq5kn9HLyQETM9NFZ+0=;
  b=fMNoJYWxqpA/U1I9TKWpGPqp94CqSNTi/jmvkSUtPrDrqOF8KS1ajrck
   GrbYMrpb7KT4H14uLPgl6/OXgosSZ687o8Y5jwaQl5VoW+uvGHXL1IC0w
   7WBzMwxFnfUl2V1rl8IgUkG0MfNeT8Fi4hZhKGTs1tTh19a+Hisv+g2vN
   r8JljvTLmwq2zblr3/3ybswa7FJiXPu/to4X17OjMK9NRLEA10JBe1AVg
   3ZLdjSvMrrIZ/FIHq8QHnnL0ViOHIZv5AnQ8JafzqlJSbc0UD4Edwd/vn
   Ap+0/Dqt7YSLZNdunTG0iwUPNTUqkuID2zO0QXgHlFRtI54YY1IcCpSKX
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="313200198"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="313200198"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 10:58:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="638607288"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="638607288"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 14 Nov 2022 10:58:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C6A02B7; Mon, 14 Nov 2022 20:58:24 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Helgaas <helgaas@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-pci@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 1/4] PCI: Introduce pci_dev_for_each_resource()
Date: Mon, 14 Nov 2022 20:58:19 +0200
Message-Id: <20221114185822.65038-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221114185822.65038-1-andriy.shevchenko@linux.intel.com>
References: <20221114185822.65038-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Stefano Stabellini <sstabellini@kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Miguel Ojeda <ojeda@kernel.org>, Matt Turner <mattst88@gmail.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mika Westerberg <mika.westerberg@linux.intel.com>

Instead of open-coding it everywhere introduce a tiny helper that can be
used to iterate over each resource of a PCI device, and convert the most
obvious users into it.

While at it drop doubled empty line before pdev_sort_resources().

No functional changes intended.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .clang-format                    |  2 ++
 arch/alpha/kernel/pci.c          |  5 ++---
 arch/arm/kernel/bios32.c         | 16 +++++++---------
 arch/mips/pci/pci-legacy.c       |  3 +--
 arch/powerpc/kernel/pci-common.c |  5 ++---
 arch/sparc/kernel/leon_pci.c     |  5 ++---
 arch/sparc/kernel/pci.c          | 10 ++++------
 arch/sparc/kernel/pcic.c         |  5 ++---
 drivers/pci/remove.c             |  5 ++---
 drivers/pci/setup-bus.c          | 26 ++++++++++----------------
 drivers/pci/setup-res.c          |  4 +---
 drivers/pci/xen-pcifront.c       |  4 +---
 include/linux/pci.h              | 11 +++++++++++
 13 files changed, 47 insertions(+), 54 deletions(-)

diff --git a/.clang-format b/.clang-format
index f98481a53ea8..08d579fea6cf 100644
--- a/.clang-format
+++ b/.clang-format
@@ -520,6 +520,8 @@ ForEachMacros:
   - 'of_property_for_each_string'
   - 'of_property_for_each_u32'
   - 'pci_bus_for_each_resource'
+  - 'pci_dev_for_each_resource'
+  - 'pci_dev_for_each_resource_p'
   - 'pci_doe_for_each_off'
   - 'pcl_for_each_chunk'
   - 'pcl_for_each_segment'
diff --git a/arch/alpha/kernel/pci.c b/arch/alpha/kernel/pci.c
index 64fbfb0763b2..4458eb7f44f0 100644
--- a/arch/alpha/kernel/pci.c
+++ b/arch/alpha/kernel/pci.c
@@ -288,11 +288,10 @@ pcibios_claim_one_bus(struct pci_bus *b)
 	struct pci_bus *child_bus;
 
 	list_for_each_entry(dev, &b->devices, bus_list) {
+		struct resource *r;
 		int i;
 
-		for (i = 0; i < PCI_NUM_RESOURCES; i++) {
-			struct resource *r = &dev->resource[i];
-
+		pci_dev_for_each_resource(dev, r, i) {
 			if (r->parent || !r->start || !r->flags)
 				continue;
 			if (pci_has_flag(PCI_PROBE_ONLY) ||
diff --git a/arch/arm/kernel/bios32.c b/arch/arm/kernel/bios32.c
index e7ef2b5bea9c..5254734b23e6 100644
--- a/arch/arm/kernel/bios32.c
+++ b/arch/arm/kernel/bios32.c
@@ -142,15 +142,15 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_WINBOND2, PCI_DEVICE_ID_WINBOND2_89C940F,
  */
 static void pci_fixup_dec21285(struct pci_dev *dev)
 {
-	int i;
-
 	if (dev->devfn == 0) {
+		struct resource *r;
+
 		dev->class &= 0xff;
 		dev->class |= PCI_CLASS_BRIDGE_HOST << 8;
-		for (i = 0; i < PCI_NUM_RESOURCES; i++) {
-			dev->resource[i].start = 0;
-			dev->resource[i].end   = 0;
-			dev->resource[i].flags = 0;
+		pci_dev_for_each_resource_p(dev, r) {
+			r->start = 0;
+			r->end = 0;
+			r->flags = 0;
 		}
 	}
 }
@@ -162,13 +162,11 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_DEC, PCI_DEVICE_ID_DEC_21285, pci_fixup_d
 static void pci_fixup_ide_bases(struct pci_dev *dev)
 {
 	struct resource *r;
-	int i;
 
 	if ((dev->class >> 8) != PCI_CLASS_STORAGE_IDE)
 		return;
 
-	for (i = 0; i < PCI_NUM_RESOURCES; i++) {
-		r = dev->resource + i;
+	pci_dev_for_each_resource_p(dev, r) {
 		if ((r->start & ~0x80) == 0x374) {
 			r->start |= 2;
 			r->end = r->start;
diff --git a/arch/mips/pci/pci-legacy.c b/arch/mips/pci/pci-legacy.c
index 468722c8a5c6..ec2567f8efd8 100644
--- a/arch/mips/pci/pci-legacy.c
+++ b/arch/mips/pci/pci-legacy.c
@@ -249,12 +249,11 @@ static int pcibios_enable_resources(struct pci_dev *dev, int mask)
 
 	pci_read_config_word(dev, PCI_COMMAND, &cmd);
 	old_cmd = cmd;
-	for (idx = 0; idx < PCI_NUM_RESOURCES; idx++) {
+	pci_dev_for_each_resource(dev, r, idx) {
 		/* Only set up the requested stuff */
 		if (!(mask & (1<<idx)))
 			continue;
 
-		r = &dev->resource[idx];
 		if (!(r->flags & (IORESOURCE_IO | IORESOURCE_MEM)))
 			continue;
 		if ((idx == PCI_ROM_RESOURCE) &&
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index d67cf79bf5d0..8ddcfa6bcb50 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -1452,11 +1452,10 @@ void pcibios_claim_one_bus(struct pci_bus *bus)
 	struct pci_bus *child_bus;
 
 	list_for_each_entry(dev, &bus->devices, bus_list) {
+		struct resource *r;
 		int i;
 
-		for (i = 0; i < PCI_NUM_RESOURCES; i++) {
-			struct resource *r = &dev->resource[i];
-
+		pci_dev_for_each_resource(dev, r, i) {
 			if (r->parent || !r->start || !r->flags)
 				continue;
 
diff --git a/arch/sparc/kernel/leon_pci.c b/arch/sparc/kernel/leon_pci.c
index e5e5ff6b9a5c..b6663a3fbae9 100644
--- a/arch/sparc/kernel/leon_pci.c
+++ b/arch/sparc/kernel/leon_pci.c
@@ -62,15 +62,14 @@ void leon_pci_init(struct platform_device *ofdev, struct leon_pci_info *info)
 
 int pcibios_enable_device(struct pci_dev *dev, int mask)
 {
+	struct resource *res;
 	u16 cmd, oldcmd;
 	int i;
 
 	pci_read_config_word(dev, PCI_COMMAND, &cmd);
 	oldcmd = cmd;
 
-	for (i = 0; i < PCI_NUM_RESOURCES; i++) {
-		struct resource *res = &dev->resource[i];
-
+	pci_dev_for_each_resource(dev, res, i) {
 		/* Only set up the requested stuff */
 		if (!(mask & (1<<i)))
 			continue;
diff --git a/arch/sparc/kernel/pci.c b/arch/sparc/kernel/pci.c
index cb1ef25116e9..a948a49817c7 100644
--- a/arch/sparc/kernel/pci.c
+++ b/arch/sparc/kernel/pci.c
@@ -663,11 +663,10 @@ static void pci_claim_bus_resources(struct pci_bus *bus)
 	struct pci_dev *dev;
 
 	list_for_each_entry(dev, &bus->devices, bus_list) {
+		struct resource *r;
 		int i;
 
-		for (i = 0; i < PCI_NUM_RESOURCES; i++) {
-			struct resource *r = &dev->resource[i];
-
+		pci_dev_for_each_resource(dev, r, i) {
 			if (r->parent || !r->start || !r->flags)
 				continue;
 
@@ -724,15 +723,14 @@ struct pci_bus *pci_scan_one_pbm(struct pci_pbm_info *pbm,
 
 int pcibios_enable_device(struct pci_dev *dev, int mask)
 {
+	struct resource *res;
 	u16 cmd, oldcmd;
 	int i;
 
 	pci_read_config_word(dev, PCI_COMMAND, &cmd);
 	oldcmd = cmd;
 
-	for (i = 0; i < PCI_NUM_RESOURCES; i++) {
-		struct resource *res = &dev->resource[i];
-
+	pci_dev_for_each_resource(dev, res, i) {
 		/* Only set up the requested stuff */
 		if (!(mask & (1<<i)))
 			continue;
diff --git a/arch/sparc/kernel/pcic.c b/arch/sparc/kernel/pcic.c
index ee4c9a9a171c..25fe0a061732 100644
--- a/arch/sparc/kernel/pcic.c
+++ b/arch/sparc/kernel/pcic.c
@@ -643,15 +643,14 @@ void pcibios_fixup_bus(struct pci_bus *bus)
 
 int pcibios_enable_device(struct pci_dev *dev, int mask)
 {
+	struct resource *res;
 	u16 cmd, oldcmd;
 	int i;
 
 	pci_read_config_word(dev, PCI_COMMAND, &cmd);
 	oldcmd = cmd;
 
-	for (i = 0; i < PCI_NUM_RESOURCES; i++) {
-		struct resource *res = &dev->resource[i];
-
+	pci_dev_for_each_resource(dev, res, i) {
 		/* Only set up the requested stuff */
 		if (!(mask & (1<<i)))
 			continue;
diff --git a/drivers/pci/remove.c b/drivers/pci/remove.c
index 0145aef1b930..1310e01fb540 100644
--- a/drivers/pci/remove.c
+++ b/drivers/pci/remove.c
@@ -5,10 +5,9 @@
 
 static void pci_free_resources(struct pci_dev *dev)
 {
-	int i;
+	struct resource *res;
 
-	for (i = 0; i < PCI_NUM_RESOURCES; i++) {
-		struct resource *res = dev->resource + i;
+	pci_dev_for_each_resource_p(dev, res) {
 		if (res->parent)
 			release_resource(res);
 	}
diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index dfa490da728d..7ba5f1ca0e38 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -124,20 +124,17 @@ static resource_size_t get_res_add_align(struct list_head *head,
 	return dev_res ? dev_res->min_align : 0;
 }
 
-
 /* Sort resources by alignment */
 static void pdev_sort_resources(struct pci_dev *dev, struct list_head *head)
 {
+	struct resource *r;
 	int i;
 
-	for (i = 0; i < PCI_NUM_RESOURCES; i++) {
-		struct resource *r;
+	pci_dev_for_each_resource(dev, r, i) {
 		struct pci_dev_resource *dev_res, *tmp;
 		resource_size_t r_align;
 		struct list_head *n;
 
-		r = &dev->resource[i];
-
 		if (r->flags & IORESOURCE_PCI_FIXED)
 			continue;
 
@@ -895,10 +892,9 @@ static void pbus_size_io(struct pci_bus *bus, resource_size_t min_size,
 
 	min_align = window_alignment(bus, IORESOURCE_IO);
 	list_for_each_entry(dev, &bus->devices, bus_list) {
-		int i;
+		struct resource *r;
 
-		for (i = 0; i < PCI_NUM_RESOURCES; i++) {
-			struct resource *r = &dev->resource[i];
+		pci_dev_for_each_resource_p(dev, r) {
 			unsigned long r_size;
 
 			if (r->parent || !(r->flags & IORESOURCE_IO))
@@ -1014,10 +1010,10 @@ static int pbus_size_mem(struct pci_bus *bus, unsigned long mask,
 	size = 0;
 
 	list_for_each_entry(dev, &bus->devices, bus_list) {
+		struct resource *r;
 		int i;
 
-		for (i = 0; i < PCI_NUM_RESOURCES; i++) {
-			struct resource *r = &dev->resource[i];
+		pci_dev_for_each_resource(dev, r, i) {
 			resource_size_t r_size;
 
 			if (r->parent || (r->flags & IORESOURCE_PCI_FIXED) ||
@@ -1358,11 +1354,10 @@ static void assign_fixed_resource_on_bus(struct pci_bus *b, struct resource *r)
  */
 static void pdev_assign_fixed_resources(struct pci_dev *dev)
 {
-	int i;
+	struct resource *r;
 
-	for (i = 0; i <  PCI_NUM_RESOURCES; i++) {
+	pci_dev_for_each_resource_p(dev, r) {
 		struct pci_bus *b;
-		struct resource *r = &dev->resource[i];
 
 		if (r->parent || !(r->flags & IORESOURCE_PCI_FIXED) ||
 		    !(r->flags & (IORESOURCE_IO | IORESOURCE_MEM)))
@@ -1845,13 +1840,12 @@ static void pci_bus_distribute_available_resources(struct pci_bus *bus,
 		 * peers of the upstream port.
 		 */
 		list_for_each_entry(dev, &bus->devices, bus_list) {
-			int i;
+			struct resource *dev_res;
 
 			if (dev == bridge)
 				continue;
 
-			for (i = 0; i < PCI_NUM_RESOURCES; i++) {
-				const struct resource *dev_res = &dev->resource[i];
+			pci_dev_for_each_resource_p(dev, dev_res) {
 				resource_size_t dev_sz;
 				struct resource *b_res;
 
diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
index b492e67c3d87..967f9a758923 100644
--- a/drivers/pci/setup-res.c
+++ b/drivers/pci/setup-res.c
@@ -484,12 +484,10 @@ int pci_enable_resources(struct pci_dev *dev, int mask)
 	pci_read_config_word(dev, PCI_COMMAND, &cmd);
 	old_cmd = cmd;
 
-	for (i = 0; i < PCI_NUM_RESOURCES; i++) {
+	pci_dev_for_each_resource(dev, r, i) {
 		if (!(mask & (1 << i)))
 			continue;
 
-		r = &dev->resource[i];
-
 		if (!(r->flags & (IORESOURCE_IO | IORESOURCE_MEM)))
 			continue;
 		if ((i == PCI_ROM_RESOURCE) &&
diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
index 7378e2f3e525..ce485ef59656 100644
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -390,9 +390,7 @@ static int pcifront_claim_resource(struct pci_dev *dev, void *data)
 	int i;
 	struct resource *r;
 
-	for (i = 0; i < PCI_NUM_RESOURCES; i++) {
-		r = &dev->resource[i];
-
+	pci_dev_for_each_resource(dev, r, i) {
 		if (!r->parent && r->start && r->flags) {
 			dev_info(&pdev->xdev->dev, "claiming resource %s/%d\n",
 				pci_name(dev), i);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 28af4414f789..010996c2801a 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1407,6 +1407,17 @@ int pci_request_selected_regions(struct pci_dev *, int, const char *);
 int pci_request_selected_regions_exclusive(struct pci_dev *, int, const char *);
 void pci_release_selected_regions(struct pci_dev *, int);
 
+#define __pci_dev_for_each_resource(dev, res, __i, vartype)		\
+	for (vartype __i = 0;						\
+	     res = &(dev)->resource[__i], __i < PCI_NUM_RESOURCES;	\
+	     __i++)
+
+#define pci_dev_for_each_resource(dev, res, i)				\
+	__pci_dev_for_each_resource(dev, res, i, )
+
+#define pci_dev_for_each_resource_p(dev, res)				\
+	__pci_dev_for_each_resource(dev, res, i, unsigned int)
+
 /* drivers/pci/bus.c */
 void pci_add_resource(struct list_head *resources, struct resource *res);
 void pci_add_resource_offset(struct list_head *resources, struct resource *res,
-- 
2.35.1

