Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B674211F7F2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Dec 2019 14:21:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47bQ6K1r45zDq74
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 00:21:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47bPnm5fXKzDqNB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2019 00:07:24 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBFD777P166999; Sun, 15 Dec 2019 08:07:13 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wvue5v63s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 15 Dec 2019 08:07:12 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBFD7B28167184;
 Sun, 15 Dec 2019 08:07:11 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wvue5v62y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 15 Dec 2019 08:07:11 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBFD4xOG014362;
 Sun, 15 Dec 2019 13:07:10 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 2wvqc5x9n5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 15 Dec 2019 13:07:10 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBFD79d629294906
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 15 Dec 2019 13:07:09 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94FE5AC05B;
 Sun, 15 Dec 2019 13:07:09 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB86DAC059;
 Sun, 15 Dec 2019 13:07:08 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Sun, 15 Dec 2019 13:07:08 +0000 (GMT)
Subject: [PATCH 08/10] crypto/NX: Add NX GZIP user space API
From: Haren Myneni <haren@linux.ibm.com>
To: herbert@gondor.apana.org.au
In-Reply-To: <1576414240.16318.4066.camel@hbabu-laptop>
References: <1576414240.16318.4066.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 15 Dec 2019 05:05:19 -0800
Message-ID: <1576415119.16318.4094.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-15_03:2019-12-13,2019-12-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 phishscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912150125
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
Cc: mikey@neuling.org, npiggin@gmail.com, hch@infradead.org,
 linux-crypto@vger.kernel.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On power9, userspace can send GZIP compression requests directly to NX
once kernel establishes NX channel / window. This patch provides GZIP
engine access to user space via /dev/crypto/nx-gzip device node with
open, VAS_TX_WIN_OPEN ioctl, mmap and close operations.

Each window corresponds to file descriptor and application can open
multiple windows. After the window is opened, mmap() system call to map
the hardware address of engine's request queue into the application's
virtual address space.

Then the application can then submit one or more requests to the the
engine by using the copy/paste instructions and pasting the CRBs to
the virtual address (aka paste_address) returned by mmap().

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@us.ibm.com>
---
 drivers/crypto/nx/Makefile            |   2 +-
 drivers/crypto/nx/nx-842-powernv.h    |   2 +
 drivers/crypto/nx/nx-commom-powernv.c |  21 ++-
 drivers/crypto/nx/nx-gzip-powernv.c   | 282 ++++++++++++++++++++++++++++++++++
 4 files changed, 304 insertions(+), 3 deletions(-)
 create mode 100644 drivers/crypto/nx/nx-gzip-powernv.c

diff --git a/drivers/crypto/nx/Makefile b/drivers/crypto/nx/Makefile
index 1949449..0394a62 100644
--- a/drivers/crypto/nx/Makefile
+++ b/drivers/crypto/nx/Makefile
@@ -15,4 +15,4 @@ obj-$(CONFIG_CRYPTO_DEV_NX_COMPRESS_PSERIES) += nx-compress-pseries.o nx-compres
 obj-$(CONFIG_CRYPTO_DEV_NX_COMPRESS_POWERNV) += nx-compress-powernv.o nx-compress.o
 nx-compress-objs := nx-842.o
 nx-compress-pseries-objs := nx-842-pseries.o
-nx-compress-powernv-objs := nx-commom-powernv.o nx-842-powernv.o
+nx-compress-powernv-objs := nx-commom-powernv.o nx-842-powernv.o nx-gzip-powernv.o
diff --git a/drivers/crypto/nx/nx-842-powernv.h b/drivers/crypto/nx/nx-842-powernv.h
index b754023..8aca108 100644
--- a/drivers/crypto/nx/nx-842-powernv.h
+++ b/drivers/crypto/nx/nx-842-powernv.h
@@ -25,5 +25,7 @@ extern int nx842_exec_vas(const unsigned char *in, unsigned int inlen,
 extern int (*nx842_powernv_exec)(const unsigned char *in, unsigned int inlen,
 				unsigned char *out, unsigned int *outlenp,
 				void *workmem, int fc);
+extern int nxgzip_device_create(void);
+extern void nxgzip_device_delete(void);
 
 #endif /* __NX_COMPRESS_POWERNV_H__ */
diff --git a/drivers/crypto/nx/nx-commom-powernv.c b/drivers/crypto/nx/nx-commom-powernv.c
index 7cc736f..2b89677 100644
--- a/drivers/crypto/nx/nx-commom-powernv.c
+++ b/drivers/crypto/nx/nx-commom-powernv.c
@@ -427,10 +427,19 @@ static __init int nx_compress_powernv_init(void)
 		nx842_powernv_exec = nx842_exec_icswx;
 	} else {
 		/*
+		 * Creat nx-gxip char device for user space API.
+		 * /dev/crypto/nx-gzip.
+		 * 842 compression is supported only in kernel.
+		 */
+		ret = nxgzip_device_create();
+
+		/*
 		 * GZIP is not supported in kernel right now.
 		 * So open tx windows only for 842.
 		 */
-		ret = nx_open_percpu_txwins();
+		if (!ret)
+			ret = nx_open_percpu_txwins();
+
 		if (ret) {
 			nx_delete_coprocs();
 			return ret;
@@ -440,6 +449,7 @@ static __init int nx_compress_powernv_init(void)
 	}
 
 	ret = crypto_register_alg(&nx842_powernv_alg);
+
 	if (ret) {
 		nx_delete_coprocs();
 		return ret;
@@ -451,8 +461,15 @@ static __init int nx_compress_powernv_init(void)
 
 static void __exit nx_compress_powernv_exit(void)
 {
-	crypto_unregister_alg(&nx842_powernv_alg);
+	/*
+	 * GZIP engine is supported only power9 or later.
+	 * nx842_ct is used on power8 (icswx) and nx-gzip device is
+	 * created on power9 during init.
+	 */
+	if (!nx842_ct)
+		nxgzip_device_delete();
 
+	crypto_unregister_alg(&nx842_powernv_alg);
 	nx_delete_coprocs();
 }
 module_exit(nx_compress_powernv_exit);
diff --git a/drivers/crypto/nx/nx-gzip-powernv.c b/drivers/crypto/nx/nx-gzip-powernv.c
new file mode 100644
index 0000000..cfacfea
--- /dev/null
+++ b/drivers/crypto/nx/nx-gzip-powernv.c
@@ -0,0 +1,282 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * IBM PowerNV NX gzip compression user space API
+ * Copyright (C) 2019 Haren Myneni, IBM Corp
+ */
+
+#include <linux/device.h>
+#include <linux/cdev.h>
+#include <linux/fs.h>
+#include <linux/uaccess.h>
+#include <asm/vas.h>
+#include <uapi/asm/vas-api.h>
+#include "nx-842-powernv.h"
+
+/*
+ * The driver creates the device /dev/crypto/nx-gzip that can be
+ * used as follows:
+ *
+ *	fd = open("/dev/crypto/nx-gzip", O_RDWR);
+ *	rc = ioctl(fd, VAS_TX_WIN_OPEN, &attr);
+ *	paste_addr = mmap(NULL, PAGE_SIZE, prot, MAP_SHARED, fd, 0ULL).
+ *	vas_copy(&crb, 0, 1);
+ *	vas_paste(paste_addr, 0, 1);
+ *	close(fd) or exit process to close window.
+ *
+ * where "vas_copy" and "vas_paste" are defined in copy-paste.h.
+ * copy/paste returns to the user space directly. So refer NX hardware
+ * documententation for excat copy/paste usage and completion / error
+ * conditions.
+ */
+
+static char	*nxgzip_dev_name = "nx-gzip";
+static atomic_t	nxgzip_instid = ATOMIC_INIT(0);
+
+/*
+ * Wrapper object for the nx-gzip device - there is just one instance of
+ * this node for the whole system.
+ */
+struct nxgzip_dev {
+	struct cdev cdev;
+	struct device *device;
+	char *name;
+	dev_t devt;
+	struct class *class;
+} nxgzip_device;
+
+/*
+ * One instance per open of a nx-gzip device. Each nxgzip_instance is
+ * associated with a VAS window after the caller issues
+ * VAS_GZIP_TX_WIN_OPEN ioctl.
+ */
+struct nxgzip_instance {
+	int id;
+	struct vas_window *txwin;
+};
+
+static char *nxgzip_devnode(struct device *dev, umode_t *mode)
+{
+	return kasprintf(GFP_KERNEL, "crypto/%s", dev_name(dev));
+}
+
+static int nxgzip_open(struct inode *inode, struct file *fp)
+{
+	struct nxgzip_instance *instance;
+
+	instance = kzalloc(sizeof(*instance), GFP_KERNEL);
+	if (!instance)
+		return -ENOMEM;
+
+	instance->id = atomic_inc_return(&nxgzip_instid);
+
+	fp->private_data = instance;
+	return 0;
+}
+
+static int nx_ioc_gzip_tx_win_open(struct file *fp, unsigned long arg)
+{
+	int rc, vasid;
+	struct vas_tx_win_attr txattr;
+	struct vas_tx_win_open_attr uattr;
+	void __user *uptr = (void *)arg;
+	struct vas_window *txwin;
+	struct nxgzip_instance *nxti = fp->private_data;
+
+	if (!nxti)
+		return -EINVAL;
+
+	/*
+	 * One window for file descriptor
+	 */
+	if (nxti->txwin)
+		return -EEXIST;
+
+	rc = copy_from_user(&uattr, uptr, sizeof(uattr));
+	if (rc) {
+		pr_err("%s(): copy_from_user() returns %d\n", __func__, rc);
+		return -EFAULT;
+	}
+
+	if (uattr.version != 1) {
+		pr_err("Invalid version\n");
+		return -EINVAL;
+	}
+
+	vasid = uattr.vas_id;
+
+	memset(&txattr, 0, sizeof(struct vas_tx_win_attr));
+	vas_init_tx_win_attr(&txattr, VAS_COP_TYPE_GZIP);
+
+	txattr.lpid = mfspr(SPRN_LPID);
+	txattr.pidr = mfspr(SPRN_PID);
+	txattr.user_win = true;
+	txattr.rsvd_txbuf_count = false;
+	txattr.pswid = false;
+	/*
+	 * txattr.wcreds_max is set to VAS_WCREDS_DEFAULT (1024) in
+	 * vas-window.c, but can be changed specific to GZIP depends
+	 * on user space need.
+	 * If needed to set txattr.wcreds_max here.
+	 */
+
+	pr_devel("Pid %d: Opening txwin, PIDR %ld\n", txattr.pidr,
+				mfspr(SPRN_PID));
+
+	txwin = vas_tx_win_open(vasid, VAS_COP_TYPE_GZIP, &txattr);
+	if (IS_ERR(txwin)) {
+		pr_err("%s() vas_tx_win_open() failed, %ld\n", __func__,
+					PTR_ERR(txwin));
+		return PTR_ERR(txwin);
+	}
+
+	nxti->txwin = txwin;
+
+	return 0;
+}
+
+static int nxgzip_release(struct inode *inode, struct file *fp)
+{
+	struct nxgzip_instance *instance;
+
+	instance = fp->private_data;
+
+	if (instance && instance->txwin) {
+		vas_win_close(instance->txwin);
+		instance->txwin = NULL;
+	}
+
+	/*
+	 * We don't know here if user has other receive windows
+	 * open, so we can't really call clear_thread_tidr().
+	 * So, once the process calls set_thread_tidr(), the
+	 * TIDR value sticks around until process exits, resulting
+	 * in an extra copy in restore_sprs().
+	 */
+
+	kfree(instance);
+	fp->private_data = NULL;
+	atomic_dec(&nxgzip_instid);
+
+	return 0;
+}
+
+static int nxgzip_mmap(struct file *fp, struct vm_area_struct *vma)
+{
+	int rc;
+	pgprot_t prot;
+	u64 paste_addr;
+	unsigned long pfn;
+	struct nxgzip_instance *instance = fp->private_data;
+
+	if ((vma->vm_end - vma->vm_start) > PAGE_SIZE) {
+		pr_debug("%s(): size 0x%zx, PAGE_SIZE 0x%zx\n", __func__,
+				(vma->vm_end - vma->vm_start), PAGE_SIZE);
+		return -EINVAL;
+	}
+
+	/* Ensure instance has an open send window */
+	if (!instance->txwin) {
+		pr_err("%s(): No send window open?\n", __func__);
+		return -EINVAL;
+	}
+
+	paste_addr = vas_win_paste_addr(instance->txwin);
+	pfn = paste_addr >> PAGE_SHIFT;
+
+	/* flags, page_prot from cxl_mmap(), except we want cachable */
+	vma->vm_flags |= VM_IO | VM_PFNMAP;
+	vma->vm_page_prot = pgprot_cached(vma->vm_page_prot);
+
+	prot = __pgprot(pgprot_val(vma->vm_page_prot) | _PAGE_DIRTY);
+
+	rc = remap_pfn_range(vma, vma->vm_start, pfn + vma->vm_pgoff,
+			vma->vm_end - vma->vm_start, prot);
+
+	pr_devel("%s(): paste addr %llx at %lx, rc %d\n", __func__,
+			paste_addr, vma->vm_start, rc);
+
+	return rc;
+}
+
+static long nxgzip_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	switch (cmd) {
+	case VAS_TX_WIN_OPEN:
+		return nx_ioc_gzip_tx_win_open(fp, arg);
+	default:
+		return -EINVAL;
+	}
+}
+
+const struct file_operations nxgzip_fops = {
+	.owner = THIS_MODULE,
+	.open = nxgzip_open,
+	.release = nxgzip_release,
+	.mmap = nxgzip_mmap,
+	.unlocked_ioctl = nxgzip_ioctl,
+};
+
+int nxgzip_device_create(void)
+{
+	int rc = -EINVAL;
+	dev_t devno;
+
+	rc = alloc_chrdev_region(&nxgzip_device.devt, 1, 1, "nx-gzip");
+	if (rc) {
+		pr_err("Unable to allocate nxgzip major number: %i\n", rc);
+		return rc;
+	}
+
+	pr_devel("NX-GZIP device allocated, dev [%i,%i]\n",
+			MAJOR(nxgzip_device.devt), MINOR(nxgzip_device.devt));
+
+	nxgzip_device.class = class_create(THIS_MODULE, "nxgzip");
+	if (IS_ERR(nxgzip_device.class)) {
+		rc = PTR_ERR(nxgzip_device.class);
+		pr_err("Unable to create NX-GZIP class %d\n", rc);
+		goto err_class;
+	}
+	nxgzip_device.class->devnode = nxgzip_devnode;
+
+	cdev_init(&nxgzip_device.cdev, &nxgzip_fops);
+
+	devno = MKDEV(MAJOR(nxgzip_device.devt), 0);
+	rc = cdev_add(&nxgzip_device.cdev, devno, 1);
+	if (rc) {
+		pr_err("cdev_add() failed %d\n", rc);
+		goto err_cdev;
+	}
+
+	nxgzip_device.device = device_create(nxgzip_device.class, NULL,
+			devno, NULL, nxgzip_dev_name, MINOR(devno));
+	if (IS_ERR(nxgzip_device.device)) {
+		rc = PTR_ERR(nxgzip_device.device);
+		pr_err("Unable to create nxgzip-%d %d\n", MINOR(devno), rc);
+		goto err;
+	}
+
+	pr_devel("%s: Added dev [%d,%d]\n", __func__, MAJOR(devno),
+			MINOR(devno));
+
+	return 0;
+
+err:
+	cdev_del(&nxgzip_device.cdev);
+err_cdev:
+	class_destroy(nxgzip_device.class);
+err_class:
+	unregister_chrdev_region(nxgzip_device.devt, 1);
+	return rc;
+}
+
+void nxgzip_device_delete(void)
+{
+	dev_t devno;
+
+	cdev_del(&nxgzip_device.cdev);
+	devno = MKDEV(MAJOR(nxgzip_device.devt), 0);
+	device_destroy(nxgzip_device.class, devno);
+
+	class_destroy(nxgzip_device.class);
+	unregister_chrdev_region(nxgzip_device.devt, 1);
+}
-- 
1.8.3.1



