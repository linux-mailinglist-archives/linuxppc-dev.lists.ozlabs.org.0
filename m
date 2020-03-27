Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC19A197436
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 08:05:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rMPf0G77zDqW4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 17:05:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=d-silva.org (client-ip=66.55.73.32;
 helo=ushosting.nmnhosting.com; envelope-from=alastair@d-silva.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=d-silva.org
Authentication-Results: lists.ozlabs.org; dkim=pass (4096-bit key;
 unprotected) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256
 header.s=201810a header.b=DcslQM+q; dkim-atps=neutral
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by lists.ozlabs.org (Postfix) with ESMTP id 48rM7x1t4pzDqQr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 16:53:17 +1100 (AEDT)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id 32B862DC6860;
 Mon, 30 Mar 2020 16:52:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-silva.org;
 s=201810a; t=1585547574;
 bh=UtTeCR+k2Y01sGISBjlacY9KQsMxyTaomboXrU4wwyo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DcslQM+qGci9qChZilaQA/DfS7pIdT/bNqHpbmQhKkju0pgXMUz8JD90Cz+H1bOZ/
 amHXQtG9t9iPoAPZuinrZD7AwVpmAv1jXyLxSdfobhFwpgpUM0K6qXy+IAmaP+HmlE
 TNOYm4ybNsk99pct5O+F75N7mUe3GbKAMkrk8zM0bR7/KJdH31MXZ2m7M39Aa0aERC
 hhBsydX+iRUw3CN/F63pYnhDAkKdFRLC7xbyoEEdnEDLEc7Igxlv0Of84H5ld7cps0
 V0O9+JZZ2QIz8gyRAvAlapeKh5K8RWoV3B9FGc30JME4hgJGuzP427kc5vGzXjEH5K
 owUqeLtXwXVJDdQmdwFJCqkbEpULxf9gwx8QvS5clbc3TJNV4IZ6zQDxSjW7H/+yni
 p7+SHPCkLZZZhNXt04DvM8qX26uChSVK6PmzZI5tnv7hQSlx4XtQxD11dePDdL42r1
 fDYadY3krb5KndhtNhvCfr1WBs7e97qb4o94/aLW6iqXGP3/FzACm/xRJT/ctSx5kc
 y/c+jC1pb1s+PJWQOXQuxvUmL1yb7VAP+LmMsMHoSQ9prJ0i+wFPws4FtxKpAkFTyi
 0meqZfMRKeTShg5TSQuGOSjNVPBiPoAXGTDoW4TqYnZ+7azYSrqrMhWVYgnLWN69xR
 8KL4NoIcEOzKu9p7busd2CuE=
Received: from localhost.lan ([10.0.1.179])
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTP id 02R7C4Ao045934;
 Fri, 27 Mar 2020 18:12:18 +1100 (AEDT)
 (envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: alastair@d-silva.org
Subject: [PATCH v4 15/25] nvdimm/ocxl: Register a character device for
 userspace to interact with
Date: Fri, 27 Mar 2020 18:11:52 +1100
Message-Id: <20200327071202.2159885-16-alastair@d-silva.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200327071202.2159885-1-alastair@d-silva.org>
References: <20200327071202.2159885-1-alastair@d-silva.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Fri, 27 Mar 2020 18:12:18 +1100 (AEDT)
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch introduces a character device (/dev/ocxlpmemX) which further
patches will use to interact with userspace, such as error logs,
controller stats and card debug functionality.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/nvdimm/ocxl/main.c     | 117 ++++++++++++++++++++++++++++++++-
 drivers/nvdimm/ocxl/ocxlpmem.h |   2 +
 2 files changed, 117 insertions(+), 2 deletions(-)

diff --git a/drivers/nvdimm/ocxl/main.c b/drivers/nvdimm/ocxl/main.c
index 8db573036423..9b85fcd3f1c9 100644
--- a/drivers/nvdimm/ocxl/main.c
+++ b/drivers/nvdimm/ocxl/main.c
@@ -10,6 +10,7 @@
 #include <misc/ocxl.h>
 #include <linux/delay.h>
 #include <linux/ndctl.h>
+#include <linux/fs.h>
 #include <linux/mm_types.h>
 #include <linux/memory_hotplug.h>
 #include "ocxlpmem.h"
@@ -356,6 +357,67 @@ static int ocxlpmem_register(struct ocxlpmem *ocxlpmem)
 	return device_register(&ocxlpmem->dev);
 }
 
+static void ocxlpmem_put(struct ocxlpmem *ocxlpmem)
+{
+	put_device(&ocxlpmem->dev);
+}
+
+static struct ocxlpmem *ocxlpmem_get(struct ocxlpmem *ocxlpmem)
+{
+	return (!get_device(&ocxlpmem->dev)) ? NULL : ocxlpmem;
+}
+
+static struct ocxlpmem *find_and_get_ocxlpmem(dev_t devno)
+{
+	struct ocxlpmem *ocxlpmem;
+	int minor = MINOR(devno);
+
+	mutex_lock(&minors_idr_lock);
+	ocxlpmem = idr_find(&minors_idr, minor);
+	if (ocxlpmem)
+		ocxlpmem_get(ocxlpmem);
+	mutex_unlock(&minors_idr_lock);
+
+	return ocxlpmem;
+}
+
+static int file_open(struct inode *inode, struct file *file)
+{
+	struct ocxlpmem *ocxlpmem;
+
+	ocxlpmem = find_and_get_ocxlpmem(inode->i_rdev);
+	if (!ocxlpmem)
+		return -ENODEV;
+
+	file->private_data = ocxlpmem;
+	return 0;
+}
+
+static int file_release(struct inode *inode, struct file *file)
+{
+	struct ocxlpmem *ocxlpmem = file->private_data;
+
+	ocxlpmem_put(ocxlpmem);
+	return 0;
+}
+
+static const struct file_operations fops = {
+	.owner		= THIS_MODULE,
+	.open		= file_open,
+	.release	= file_release,
+};
+
+/**
+ * create_cdev() - Create the chardev in /dev for the device
+ * @ocxlpmem: the SCM metadata
+ * Return: 0 on success, negative on failure
+ */
+static int create_cdev(struct ocxlpmem *ocxlpmem)
+{
+	cdev_init(&ocxlpmem->cdev, &fops);
+	return cdev_add(&ocxlpmem->cdev, ocxlpmem->dev.devt, 1);
+}
+
 /**
  * ocxlpmem_remove() - Free an OpenCAPI persistent memory device
  * @pdev: the PCI device information struct
@@ -376,6 +438,13 @@ static void remove(struct pci_dev *pdev)
 		if (ocxlpmem->nvdimm_bus)
 			nvdimm_bus_unregister(ocxlpmem->nvdimm_bus);
 
+		/*
+		 * Remove the cdev early to prevent a race against userspace
+		 * via the char dev
+		 */
+		if (ocxlpmem->cdev.owner)
+			cdev_del(&ocxlpmem->cdev);
+
 		device_unregister(&ocxlpmem->dev);
 	}
 }
@@ -527,11 +596,18 @@ static int probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto err;
 	}
 
-	if (setup_command_metadata(ocxlpmem)) {
+	rc = setup_command_metadata(ocxlpmem);
+	if (rc) {
 		dev_err(&pdev->dev, "Could not read command metadata\n");
 		goto err;
 	}
 
+	rc = create_cdev(ocxlpmem);
+	if (rc) {
+		dev_err(&pdev->dev, "Could not create character device\n");
+		goto err;
+	}
+
 	elapsed = 0;
 	timeout = ocxlpmem->readiness_timeout +
 		  ocxlpmem->memory_available_timeout;
@@ -599,6 +675,36 @@ static struct pci_driver pci_driver = {
 	.shutdown = remove,
 };
 
+static int file_init(void)
+{
+	int rc;
+
+	rc = alloc_chrdev_region(&ocxlpmem_dev, 0, NUM_MINORS, "ocxlpmem");
+	if (rc) {
+		idr_destroy(&minors_idr);
+		pr_err("Unable to allocate OpenCAPI persistent memory major number: %d\n",
+		       rc);
+		return rc;
+	}
+
+	ocxlpmem_class = class_create(THIS_MODULE, "ocxlpmem");
+	if (IS_ERR(ocxlpmem_class)) {
+		idr_destroy(&minors_idr);
+		pr_err("Unable to create ocxlpmem class\n");
+		unregister_chrdev_region(ocxlpmem_dev, NUM_MINORS);
+		return PTR_ERR(ocxlpmem_class);
+	}
+
+	return 0;
+}
+
+static void file_exit(void)
+{
+	class_destroy(ocxlpmem_class);
+	unregister_chrdev_region(ocxlpmem_dev, NUM_MINORS);
+	idr_destroy(&minors_idr);
+}
+
 static int __init ocxlpmem_init(void)
 {
 	int rc;
@@ -606,16 +712,23 @@ static int __init ocxlpmem_init(void)
 	mutex_init(&minors_idr_lock);
 	idr_init(&minors_idr);
 
-	rc = pci_register_driver(&pci_driver);
+	rc = file_init();
 	if (rc)
 		return rc;
 
+	rc = pci_register_driver(&pci_driver);
+	if (rc) {
+		file_exit();
+		return rc;
+	}
+
 	return 0;
 }
 
 static void ocxlpmem_exit(void)
 {
 	pci_unregister_driver(&pci_driver);
+	file_exit();
 }
 
 module_init(ocxlpmem_init);
diff --git a/drivers/nvdimm/ocxl/ocxlpmem.h b/drivers/nvdimm/ocxl/ocxlpmem.h
index b72b3f909fc3..ee3bd651f254 100644
--- a/drivers/nvdimm/ocxl/ocxlpmem.h
+++ b/drivers/nvdimm/ocxl/ocxlpmem.h
@@ -2,6 +2,7 @@
 // Copyright 2020 IBM Corp.
 
 #include <linux/pci.h>
+#include <linux/cdev.h>
 #include <misc/ocxl.h>
 #include <linux/libnvdimm.h>
 #include <linux/mm.h>
@@ -103,6 +104,7 @@ struct command_metadata {
 struct ocxlpmem {
 	struct device dev;
 	struct pci_dev *pdev;
+	struct cdev cdev;
 	struct ocxl_fn *ocxl_fn;
 	struct nd_interleave_set nd_set;
 	struct nvdimm_bus_descriptor bus_desc;
-- 
2.24.1

