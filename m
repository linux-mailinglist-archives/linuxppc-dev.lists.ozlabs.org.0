Return-Path: <linuxppc-dev+bounces-2788-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF789BA738
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Nov 2024 18:14:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhLlS3Wskz2yVj;
	Mon,  4 Nov 2024 04:13:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730653988;
	cv=none; b=RpV3Wh7LH7GNdikw7sAv5+Jk2k+MUAALar5ftvJMTb2B0dzVvk22zlLocqUOANuMrgUeqlB37mn42Eo3ekaQ5SApNTuMDe2l5xwrFAnJqOp5dJRTbu/KlspBG6awR9i9CBKEpMv0yZcOafcUH52/mgIjhfldGbnMmKQ80HqKYsYgVEuTzE6l9p0HHn/jMmg7GiJcm9udHPjuq8zZ40u5lBezJjMVJrvuWn0CLf3EEYUC4Y1Zcb492duXBXvnZJzZWYEvI07qs/WwNlvk6TLJwRvQPiOwvLjxKH1hWnMa2VXGE2kubsqy9Pj4hDjaQRwJ/p5tnOArW4z6h1Y2MBTudQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730653988; c=relaxed/relaxed;
	bh=dgjZirU2+CM3IoIZF9fUDkDLjmF116PQb6+FnAtdjGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JFfwrzBpxmq7yefh+4mP8tCO7fefkXNKKJ0vmc2EVZ6iSnva2SmEhmAIibktKcbA54Ycy3bN+Jkhyy2AK7aJ4KU/OVs52JXAnGD9N5g3IJuMBLcWTXt21h1aqWjrPnLNyhfS0go1YWxU6SlMNOqJO1IjNLACv/4f1QsQSovMIRXweARSXSKOh6t2zXrYvT0yGXpRQCtftrCKsE6YWUH4YB1UIt1ubEKIUrD4Cuv2sY9S+eX+GFDbzNM+w8rI2/ETo312yEiFDpC17g/Bq6biPkx+5f09mrVlyk7HdwO76N0yyXU+4ATikxED7bWWpH/xJz9Zyv+P79GlW/uYPWUDdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=V5VfZeBh; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=V5VfZeBh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhLlM5xxMz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 04:13:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1730653481;
	bh=8oN+tVBMjVju8UGiuvmEhTX5MjVK0/eJhQB1Q2KrGWg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=V5VfZeBhkpEc+BJr7U99hw+VXSO0/H281e2i3OYqzSsy0SGGDBKgbIYwAQQopjk5p
	 I7JCsIntvCcuTbL2t6kOL8I3VTTsft0tPJFg0d7SRbJHJj1BfvHU9DrPRIY2+deo0n
	 668eR2kfbt5yn/SgMliSXeyVZwt9yiewus2l4ruQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 03 Nov 2024 17:03:35 +0000
Subject: [PATCH v2 06/10] sysfs: treewide: constify attribute callback of
 bin_attribute::mmap()
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241103-sysfs-const-bin_attr-v2-6-71110628844c@weissschuh.net>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Davidlohr Bueso <dave@stgolabs.net>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Dave Jiang <dave.jiang@intel.com>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
 Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 "David E. Box" <david.e.box@linux.intel.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Logan Gunthorpe <logang@deltatee.com>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-rdma@vger.kernel.org, linux-mtd@lists.infradead.org, 
 platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730653468; l=7091;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=8oN+tVBMjVju8UGiuvmEhTX5MjVK0/eJhQB1Q2KrGWg=;
 b=R3n6q+Dv0Ia776qfgM6mO9COiJ/hbKbbIydIDRQ3XaMKG9aRvi7HhpKHS1X+wwbHJsRL7kye+
 ekmDB9xxV8TBGzZeTtNVftVmS4rbHM4mxGMeptcYkAQpdQnmMEfZR2L
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The mmap() callbacks should not modify the struct
bin_attribute passed as argument.
Enforce this by marking the argument as const.

As there are not many callback implementers perform this change
throughout the tree at once.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/alpha/kernel/pci-sysfs.c          |  6 +++---
 drivers/misc/ocxl/sysfs.c              |  2 +-
 drivers/pci/p2pdma.c                   |  2 +-
 drivers/pci/pci-sysfs.c                | 10 +++++-----
 drivers/platform/x86/intel/pmt/class.c |  2 +-
 drivers/uio/uio_hv_generic.c           |  2 +-
 include/linux/sysfs.h                  |  2 +-
 7 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/alpha/kernel/pci-sysfs.c b/arch/alpha/kernel/pci-sysfs.c
index 5808a66e2a81f7eba9a245fd6a343406a1ade87d..3048758304b57afa01ddeb6558c39bdb48c9a3f6 100644
--- a/arch/alpha/kernel/pci-sysfs.c
+++ b/arch/alpha/kernel/pci-sysfs.c
@@ -64,7 +64,7 @@ static int __pci_mmap_fits(struct pci_dev *pdev, int num,
  * Return: %0 on success, negative error code otherwise
  */
 static int pci_mmap_resource(struct kobject *kobj,
-			     struct bin_attribute *attr,
+			     const struct bin_attribute *attr,
 			     struct vm_area_struct *vma, int sparse)
 {
 	struct pci_dev *pdev = to_pci_dev(kobj_to_dev(kobj));
@@ -93,14 +93,14 @@ static int pci_mmap_resource(struct kobject *kobj,
 }
 
 static int pci_mmap_resource_sparse(struct file *filp, struct kobject *kobj,
-				    struct bin_attribute *attr,
+				    const struct bin_attribute *attr,
 				    struct vm_area_struct *vma)
 {
 	return pci_mmap_resource(kobj, attr, vma, 1);
 }
 
 static int pci_mmap_resource_dense(struct file *filp, struct kobject *kobj,
-				   struct bin_attribute *attr,
+				   const struct bin_attribute *attr,
 				   struct vm_area_struct *vma)
 {
 	return pci_mmap_resource(kobj, attr, vma, 0);
diff --git a/drivers/misc/ocxl/sysfs.c b/drivers/misc/ocxl/sysfs.c
index 405180d47d9bff0aaa7a736bb3fecfbe318db961..07520d6e6dc55702696b8656440914c379e6e27a 100644
--- a/drivers/misc/ocxl/sysfs.c
+++ b/drivers/misc/ocxl/sysfs.c
@@ -125,7 +125,7 @@ static const struct vm_operations_struct global_mmio_vmops = {
 };
 
 static int global_mmio_mmap(struct file *filp, struct kobject *kobj,
-			struct bin_attribute *bin_attr,
+			const struct bin_attribute *bin_attr,
 			struct vm_area_struct *vma)
 {
 	struct ocxl_afu *afu = to_afu(kobj_to_dev(kobj));
diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index 4f47a13cb500ff5339cde426b6ccb020fcd74ae7..7abd4f546d3c071f31e622d881f5c5ac3e4de55e 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -90,7 +90,7 @@ static ssize_t published_show(struct device *dev, struct device_attribute *attr,
 static DEVICE_ATTR_RO(published);
 
 static int p2pmem_alloc_mmap(struct file *filp, struct kobject *kobj,
-		struct bin_attribute *attr, struct vm_area_struct *vma)
+		const struct bin_attribute *attr, struct vm_area_struct *vma)
 {
 	struct pci_dev *pdev = to_pci_dev(kobj_to_dev(kobj));
 	size_t len = vma->vm_end - vma->vm_start;
diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 13912940ed2bb66c0086e5bea9a3cb6417ac14dd..0ad3427228b12aa95325c6fc00e9686740559238 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -910,7 +910,7 @@ static ssize_t pci_write_legacy_io(struct file *filp, struct kobject *kobj,
  * memory space.
  */
 static int pci_mmap_legacy_mem(struct file *filp, struct kobject *kobj,
-			       struct bin_attribute *attr,
+			       const struct bin_attribute *attr,
 			       struct vm_area_struct *vma)
 {
 	struct pci_bus *bus = to_pci_bus(kobj_to_dev(kobj));
@@ -930,7 +930,7 @@ static int pci_mmap_legacy_mem(struct file *filp, struct kobject *kobj,
  * memory space. Returns -ENOSYS if the operation isn't supported
  */
 static int pci_mmap_legacy_io(struct file *filp, struct kobject *kobj,
-			      struct bin_attribute *attr,
+			      const struct bin_attribute *attr,
 			      struct vm_area_struct *vma)
 {
 	struct pci_bus *bus = to_pci_bus(kobj_to_dev(kobj));
@@ -1034,7 +1034,7 @@ void pci_remove_legacy_files(struct pci_bus *b)
  *
  * Use the regular PCI mapping routines to map a PCI resource into userspace.
  */
-static int pci_mmap_resource(struct kobject *kobj, struct bin_attribute *attr,
+static int pci_mmap_resource(struct kobject *kobj, const struct bin_attribute *attr,
 			     struct vm_area_struct *vma, int write_combine)
 {
 	struct pci_dev *pdev = to_pci_dev(kobj_to_dev(kobj));
@@ -1059,14 +1059,14 @@ static int pci_mmap_resource(struct kobject *kobj, struct bin_attribute *attr,
 }
 
 static int pci_mmap_resource_uc(struct file *filp, struct kobject *kobj,
-				struct bin_attribute *attr,
+				const struct bin_attribute *attr,
 				struct vm_area_struct *vma)
 {
 	return pci_mmap_resource(kobj, attr, vma, 0);
 }
 
 static int pci_mmap_resource_wc(struct file *filp, struct kobject *kobj,
-				struct bin_attribute *attr,
+				const struct bin_attribute *attr,
 				struct vm_area_struct *vma)
 {
 	return pci_mmap_resource(kobj, attr, vma, 1);
diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index c04bb7f97a4db13268fc5697887951cf8f0f5a25..f9afa23e754b8b68bd59b72d6a72d26503a21f31 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -103,7 +103,7 @@ intel_pmt_read(struct file *filp, struct kobject *kobj,
 
 static int
 intel_pmt_mmap(struct file *filp, struct kobject *kobj,
-		struct bin_attribute *attr, struct vm_area_struct *vma)
+		const struct bin_attribute *attr, struct vm_area_struct *vma)
 {
 	struct intel_pmt_entry *entry = container_of(attr,
 						     struct intel_pmt_entry,
diff --git a/drivers/uio/uio_hv_generic.c b/drivers/uio/uio_hv_generic.c
index 8704095994118c2660f345c504b5ea466d053efb..3976360d0096d6681faf88815cc6277fb76a1d9f 100644
--- a/drivers/uio/uio_hv_generic.c
+++ b/drivers/uio/uio_hv_generic.c
@@ -135,7 +135,7 @@ static void hv_uio_rescind(struct vmbus_channel *channel)
  * The ring buffer is allocated as contiguous memory by vmbus_open
  */
 static int hv_uio_ring_mmap(struct file *filp, struct kobject *kobj,
-			    struct bin_attribute *attr,
+			    const struct bin_attribute *attr,
 			    struct vm_area_struct *vma)
 {
 	struct vmbus_channel *channel
diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index d1b22d56198b55ee39fe4c4fc994f5b753641992..9fcdc8cd3118f359742bfd8b708d5c3eff511042 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -309,7 +309,7 @@ struct bin_attribute {
 			 char *, loff_t, size_t);
 	loff_t (*llseek)(struct file *, struct kobject *, struct bin_attribute *,
 			 loff_t, int);
-	int (*mmap)(struct file *, struct kobject *, struct bin_attribute *attr,
+	int (*mmap)(struct file *, struct kobject *, const struct bin_attribute *attr,
 		    struct vm_area_struct *vma);
 };
 

-- 
2.47.0


