Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD39166E4A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 05:15:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Nyn22BVyzDqWt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 15:15:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=au1.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=alastair@au1.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Nxll66N4zDqb5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 14:29:39 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01L3L09D107836
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 22:29:36 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ya6e618hf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 22:29:36 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Fri, 21 Feb 2020 03:29:33 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 21 Feb 2020 03:29:27 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01L3SBe549086650
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Feb 2020 03:28:11 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1757FA404D;
 Fri, 21 Feb 2020 03:28:11 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7252BA4040;
 Fri, 21 Feb 2020 03:28:10 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 Feb 2020 03:28:10 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7B369A03DD;
 Fri, 21 Feb 2020 14:28:03 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH v3 16/27] powerpc/powernv/pmem: Register a character device
 for userspace to interact with
Date: Fri, 21 Feb 2020 14:27:09 +1100
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221032720.33893-1-alastair@au1.ibm.com>
References: <20200221032720.33893-1-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022103-0012-0000-0000-00000388D1D4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022103-0013-0000-0000-000021C56A75
Message-Id: <20200221032720.33893-17-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_19:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=3 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002210020
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

From: Alastair D'Silva <alastair@d-silva.org>

This patch introduces a character device (/dev/ocxl-scmX) which further
patches will use to interact with userspace.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 arch/powerpc/platforms/powernv/pmem/ocxl.c    | 116 +++++++++++++++++-
 .../platforms/powernv/pmem/ocxl_internal.h    |   2 +
 2 files changed, 116 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl.c b/arch/powerpc/platforms/powernv/pmem/ocxl.c
index b8bd7e703b19..63109a870d2c 100644
--- a/arch/powerpc/platforms/powernv/pmem/ocxl.c
+++ b/arch/powerpc/platforms/powernv/pmem/ocxl.c
@@ -10,6 +10,7 @@
 #include <misc/ocxl.h>
 #include <linux/delay.h>
 #include <linux/ndctl.h>
+#include <linux/fs.h>
 #include <linux/mm_types.h>
 #include <linux/memory_hotplug.h>
 #include "ocxl_internal.h"
@@ -339,6 +340,9 @@ static void free_ocxlpmem(struct ocxlpmem *ocxlpmem)
 
 	free_minor(ocxlpmem);
 
+	if (ocxlpmem->cdev.owner)
+		cdev_del(&ocxlpmem->cdev);
+
 	if (ocxlpmem->metadata_addr)
 		devm_memunmap(&ocxlpmem->dev, ocxlpmem->metadata_addr);
 
@@ -396,6 +400,70 @@ static int ocxlpmem_register(struct ocxlpmem *ocxlpmem)
 	return device_register(&ocxlpmem->dev);
 }
 
+static void ocxlpmem_put(struct ocxlpmem *ocxlpmem)
+{
+	put_device(&ocxlpmem->dev);
+}
+
+static struct ocxlpmem *ocxlpmem_get(struct ocxlpmem *ocxlpmem)
+{
+	return (get_device(&ocxlpmem->dev) == NULL) ? NULL : ocxlpmem;
+}
+
+static struct ocxlpmem *find_and_get_ocxlpmem(dev_t devno)
+{
+	struct ocxlpmem *ocxlpmem;
+	int minor = MINOR(devno);
+	/*
+	 * We don't declare an RCU critical section here, as our AFU
+	 * is protected by a reference counter on the device. By the time the
+	 * minor number of a device is removed from the idr, the ref count of
+	 * the device is already at 0, so no user API will access that AFU and
+	 * this function can't return it.
+	 */
+	ocxlpmem = idr_find(&minors_idr, minor);
+	if (ocxlpmem)
+		ocxlpmem_get(ocxlpmem);
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
@@ -572,6 +640,11 @@ static int probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto err;
 	}
 
+	if (create_cdev(ocxlpmem)) {
+		dev_err(&pdev->dev, "Could not create character device\n");
+		goto err;
+	}
+
 	elapsed = 0;
 	timeout = ocxlpmem->readiness_timeout + ocxlpmem->memory_available_timeout;
 	while (!is_usable(ocxlpmem, false)) {
@@ -613,20 +686,59 @@ static struct pci_driver pci_driver = {
 	.shutdown = ocxlpmem_remove,
 };
 
+static int file_init(void)
+{
+	int rc;
+
+	mutex_init(&minors_idr_lock);
+	idr_init(&minors_idr);
+
+	rc = alloc_chrdev_region(&ocxlpmem_dev, 0, NUM_MINORS, "ocxl-pmem");
+	if (rc) {
+		idr_destroy(&minors_idr);
+		pr_err("Unable to allocate OpenCAPI persistent memory major number: %d\n", rc);
+		return rc;
+	}
+
+	ocxlpmem_class = class_create(THIS_MODULE, "ocxl-pmem");
+	if (IS_ERR(ocxlpmem_class)) {
+		idr_destroy(&minors_idr);
+		pr_err("Unable to create ocxl-pmem class\n");
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
-	int rc = 0;
+	int rc;
 
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
diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
index 28e2020f6355..d2d81fec7bb1 100644
--- a/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
+++ b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
@@ -2,6 +2,7 @@
 // Copyright 2019 IBM Corp.
 
 #include <linux/pci.h>
+#include <linux/cdev.h>
 #include <misc/ocxl.h>
 #include <linux/libnvdimm.h>
 #include <linux/mm.h>
@@ -99,6 +100,7 @@ struct ocxlpmem_function0 {
 struct ocxlpmem {
 	struct device dev;
 	struct pci_dev *pdev;
+	struct cdev cdev;
 	struct ocxl_fn *ocxl_fn;
 	struct nd_interleave_set nd_set;
 	struct nvdimm_bus_descriptor bus_desc;
-- 
2.24.1

