Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 094EE10F655
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 05:37:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Rq2q6yDfzDq9m
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 15:37:23 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RnyV5xnxzDqPF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2019 14:48:34 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB33klin109364
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 2 Dec 2019 22:48:31 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wm6v00ygd-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Dec 2019 22:48:30 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Tue, 3 Dec 2019 03:48:27 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Dec 2019 03:48:20 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xB33mJEj46334272
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Dec 2019 03:48:19 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C32A4204C;
 Tue,  3 Dec 2019 03:48:19 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75F574203F;
 Tue,  3 Dec 2019 03:48:18 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Dec 2019 03:48:18 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3B162A03E1;
 Tue,  3 Dec 2019 14:48:13 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH v2 15/27] nvdimm/ocxl: Register a character device for
 userspace to interact with
Date: Tue,  3 Dec 2019 14:46:43 +1100
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203034655.51561-1-alastair@au1.ibm.com>
References: <20191203034655.51561-1-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19120303-4275-0000-0000-0000038A31E2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120303-4276-0000-0000-0000389DCDDB
Message-Id: <20191203034655.51561-16-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-02_06:2019-11-29,2019-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=3 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912030032
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
 Alexey Kardashevskiy <aik@ozlabs.ru>, Keith Busch <keith.busch@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Frederic Barrat <fbarrat@linux.ibm.com>,
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
 drivers/nvdimm/ocxl/scm.c          | 114 ++++++++++++++++++++++++++++-
 drivers/nvdimm/ocxl/scm_internal.h |   2 +
 2 files changed, 115 insertions(+), 1 deletion(-)

diff --git a/drivers/nvdimm/ocxl/scm.c b/drivers/nvdimm/ocxl/scm.c
index 6c16ca7fabfa..c313a473a28e 100644
--- a/drivers/nvdimm/ocxl/scm.c
+++ b/drivers/nvdimm/ocxl/scm.c
@@ -9,6 +9,7 @@
 #include <misc/ocxl.h>
 #include <linux/delay.h>
 #include <linux/ndctl.h>
+#include <linux/fs.h>
 #include <linux/mm_types.h>
 #include <linux/memory_hotplug.h>
 #include "scm_internal.h"
@@ -386,6 +387,9 @@ static void free_scm(struct scm_data *scm_data)
 
 	free_scm_minor(scm_data);
 
+	if (scm_data->cdev.owner)
+		cdev_del(&scm_data->cdev);
+
 	if (scm_data->metadata_addr)
 		devm_memunmap(&scm_data->dev, scm_data->metadata_addr);
 
@@ -444,6 +448,70 @@ static int scm_register(struct scm_data *scm_data)
 	return rc;
 }
 
+static void scm_put(struct scm_data *scm_data)
+{
+	put_device(&scm_data->dev);
+}
+
+static struct scm_data *scm_get(struct scm_data *scm_data)
+{
+	return (get_device(&scm_data->dev) == NULL) ? NULL : scm_data;
+}
+
+static struct scm_data *find_and_get_scm(dev_t devno)
+{
+	struct scm_data *scm_data;
+	int minor = MINOR(devno);
+	/*
+	 * We don't declare an RCU critical section here, as our AFU
+	 * is protected by a reference counter on the device. By the time the
+	 * minor number of a device is removed from the idr, the ref count of
+	 * the device is already at 0, so no user API will access that AFU and
+	 * this function can't return it.
+	 */
+	scm_data = idr_find(&minors_idr, minor);
+	if (scm_data)
+		scm_get(scm_data);
+	return scm_data;
+}
+
+static int scm_file_open(struct inode *inode, struct file *file)
+{
+	struct scm_data *scm_data;
+
+	scm_data = find_and_get_scm(inode->i_rdev);
+	if (!scm_data)
+		return -ENODEV;
+
+	file->private_data = scm_data;
+	return 0;
+}
+
+static int scm_file_release(struct inode *inode, struct file *file)
+{
+	struct scm_data *scm_data = file->private_data;
+
+	scm_put(scm_data);
+	return 0;
+}
+
+static const struct file_operations scm_fops = {
+	.owner		= THIS_MODULE,
+	.open		= scm_file_open,
+	.release	= scm_file_release,
+};
+
+/**
+ * scm_create_cdev() - Create the chardev in /dev for this scm device
+ * @scm_data: the SCM metadata
+ * Return: 0 on success, negative on failure
+ */
+static int scm_create_cdev(struct scm_data *scm_data)
+{
+	cdev_init(&scm_data->cdev, &scm_fops);
+	return cdev_add(&scm_data->cdev, scm_data->dev.devt, 1);
+}
+
 /**
  * scm_remove() - Free an OpenCAPI Storage Class Memory device
  * @pdev: the PCI device information struct
@@ -616,6 +684,11 @@ static int scm_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto err;
 	}
 
+	if (scm_create_cdev(scm_data)) {
+		dev_err(&pdev->dev, "Could not create SCM character device\n");
+		goto err;
+	}
+
 	elapsed = 0;
 	timeout = scm_data->readiness_timeout + scm_data->memory_available_timeout;
 	while (!scm_is_usable(scm_data)) {
@@ -653,20 +726,59 @@ static struct pci_driver scm_pci_driver = {
 	.shutdown = scm_remove,
 };
 
+static int scm_file_init(void)
+{
+	int rc;
+
+	mutex_init(&minors_idr_lock);
+	idr_init(&minors_idr);
+
+	rc = alloc_chrdev_region(&scm_dev, 0, SCM_NUM_MINORS, "ocxl-scm");
+	if (rc) {
+		idr_destroy(&minors_idr);
+		pr_err("Unable to allocate scm major number: %d\n", rc);
+		return rc;
+	}
+
+	scm_class = class_create(THIS_MODULE, "ocxl-scm");
+	if (IS_ERR(scm_class)) {
+		idr_destroy(&minors_idr);
+		pr_err("Unable to create ocxl-scm class\n");
+		unregister_chrdev_region(scm_dev, SCM_NUM_MINORS);
+		return PTR_ERR(scm_class);
+	}
+
+	return 0;
+}
+
+static void scm_file_exit(void)
+{
+	class_destroy(scm_class);
+	unregister_chrdev_region(scm_dev, SCM_NUM_MINORS);
+	idr_destroy(&minors_idr);
+}
+
 static int __init scm_init(void)
 {
 	int rc = 0;
 
-	rc = pci_register_driver(&scm_pci_driver);
+	rc = scm_file_init();
 	if (rc)
 		return rc;
 
+	rc = pci_register_driver(&scm_pci_driver);
+	if (rc) {
+		scm_file_exit();
+		return rc;
+	}
+
 	return 0;
 }
 
 static void scm_exit(void)
 {
 	pci_unregister_driver(&scm_pci_driver);
+	scm_file_exit();
 }
 
 module_init(scm_init);
diff --git a/drivers/nvdimm/ocxl/scm_internal.h b/drivers/nvdimm/ocxl/scm_internal.h
index 9575996a89e7..57491dbee1a4 100644
--- a/drivers/nvdimm/ocxl/scm_internal.h
+++ b/drivers/nvdimm/ocxl/scm_internal.h
@@ -2,6 +2,7 @@
 // Copyright 2019 IBM Corp.
 
 #include <linux/pci.h>
+#include <linux/cdev.h>
 #include <misc/ocxl.h>
 #include <linux/libnvdimm.h>
 #include <linux/mm.h>
@@ -100,6 +101,7 @@ struct scm_function_0 {
 struct scm_data {
 	struct device dev;
 	struct pci_dev *pdev;
+	struct cdev cdev;
 	struct ocxl_fn *ocxl_fn;
 	struct nd_interleave_set nd_set;
 	struct nvdimm_bus_descriptor bus_desc;
-- 
2.23.0

