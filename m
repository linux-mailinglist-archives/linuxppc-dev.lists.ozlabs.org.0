Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5DA1AD981
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 11:09:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493VfB07bKzDrdD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 19:09:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493VVD415qzDqC8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 19:02:44 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03H91rJb023636; Fri, 17 Apr 2020 05:02:31 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30f8hnhsj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Apr 2020 05:02:31 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03H925RO024566;
 Fri, 17 Apr 2020 05:02:30 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30f8hnhsh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Apr 2020 05:02:30 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03H91qPB014511;
 Fri, 17 Apr 2020 09:02:29 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 30b5h716h1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Apr 2020 09:02:29 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03H92Stw61604322
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Apr 2020 09:02:28 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 569C4C605D;
 Fri, 17 Apr 2020 09:02:28 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCBDDC6055;
 Fri, 17 Apr 2020 09:02:27 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 17 Apr 2020 09:02:27 +0000 (GMT)
Subject: [PATCH v6 3/9] powerpc/vas: Add VAS user space API
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1587113732.2275.1096.camel@hbabu-laptop>
References: <1587113732.2275.1096.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 17 Apr 2020 02:02:01 -0700
Message-ID: <1587114121.2275.1109.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-17_03:2020-04-14,
 2020-04-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 clxscore=1015 spamscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 suspectscore=3 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004170067
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
Cc: mikey@neuling.org, herbert@gondor.apana.org.au, npiggin@gmail.com,
 linux-crypto@vger.kernel.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On power9, userspace can send GZIP compression requests directly to NX
once kernel establishes NX channel / window with VAS. This patch provides
user space API which allows user space to establish channel using open
VAS_TX_WIN_OPEN ioctl, mmap and close operations.

Each window corresponds to file descriptor and application can open
multiple windows. After the window is opened, VAS_TX_WIN_OPEN icoctl to
open a window on specific VAS instance, mmap() system call to map
the hardware address of engine's request queue into the application's
virtual address space.

Then the application can then submit one or more requests to the the
engine by using the copy/paste instructions and pasting the CRBs to
the virtual address (aka paste_address) returned by mmap().

Only NX GZIP coprocessor type is supported right now and allow GZIP
engine access via /dev/crypto/nx-gzip device node.

Thanks to Michael Ellerman for his changes and suggestions to make the
ioctl generic to support any coprocessor type.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/include/asm/vas.h              |  12 ++
 arch/powerpc/platforms/powernv/Makefile     |   2 +-
 arch/powerpc/platforms/powernv/vas-api.c    | 278 ++++++++++++++++++++++++++++
 arch/powerpc/platforms/powernv/vas-window.c |   6 +-
 arch/powerpc/platforms/powernv/vas.h        |   2 +
 5 files changed, 296 insertions(+), 4 deletions(-)
 create mode 100644 arch/powerpc/platforms/powernv/vas-api.c

diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
index f93e6b0..6e427bc 100644
--- a/arch/powerpc/include/asm/vas.h
+++ b/arch/powerpc/include/asm/vas.h
@@ -163,4 +163,16 @@ struct vas_window *vas_tx_win_open(int vasid, enum vas_cop_type cop,
  */
 int vas_paste_crb(struct vas_window *win, int offset, bool re);
 
+/*
+ * Register / unregister coprocessor type to VAS API which will be exported
+ * to user space. Applications can use this API to open / close window
+ * which can be used to send / receive requests directly to cooprcessor.
+ *
+ * Only NX GZIP coprocessor type is supported now, but this API can be
+ * used for others in future.
+ */
+int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_type,
+				const char *name);
+void vas_unregister_coproc_api(void);
+
 #endif /* __ASM_POWERPC_VAS_H */
diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
index 395789f..fe3f0fb 100644
--- a/arch/powerpc/platforms/powernv/Makefile
+++ b/arch/powerpc/platforms/powernv/Makefile
@@ -17,7 +17,7 @@ obj-$(CONFIG_MEMORY_FAILURE)	+= opal-memory-errors.o
 obj-$(CONFIG_OPAL_PRD)	+= opal-prd.o
 obj-$(CONFIG_PERF_EVENTS) += opal-imc.o
 obj-$(CONFIG_PPC_MEMTRACE)	+= memtrace.o
-obj-$(CONFIG_PPC_VAS)	+= vas.o vas-window.o vas-debug.o vas-fault.o
+obj-$(CONFIG_PPC_VAS)	+= vas.o vas-window.o vas-debug.o vas-fault.o vas-api.o
 obj-$(CONFIG_OCXL_BASE)	+= ocxl.o
 obj-$(CONFIG_SCOM_DEBUGFS) += opal-xscom.o
 obj-$(CONFIG_PPC_SECURE_BOOT) += opal-secvar.o
diff --git a/arch/powerpc/platforms/powernv/vas-api.c b/arch/powerpc/platforms/powernv/vas-api.c
new file mode 100644
index 0000000..98ed5d8
--- /dev/null
+++ b/arch/powerpc/platforms/powernv/vas-api.c
@@ -0,0 +1,278 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * VAS user space API for its accelerators (Only NX-GZIP is supported now)
+ * Copyright (C) 2019 Haren Myneni, IBM Corp
+ */
+
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/cdev.h>
+#include <linux/fs.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+#include <asm/vas.h>
+#include <uapi/asm/vas-api.h>
+#include "vas.h"
+
+/*
+ * The driver creates the device node that can be used as follows:
+ * For NX-GZIP
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
+ * documententation for exact copy/paste usage and completion / error
+ * conditions.
+ */
+
+/*
+ * Wrapper object for the nx-gzip device - there is just one instance of
+ * this node for the whole system.
+ */
+static struct coproc_dev {
+	struct cdev cdev;
+	struct device *device;
+	char *name;
+	dev_t devt;
+	struct class *class;
+	enum vas_cop_type cop_type;
+} coproc_device;
+
+struct coproc_instance {
+	struct coproc_dev *coproc;
+	struct vas_window *txwin;
+};
+
+static char *coproc_devnode(struct device *dev, umode_t *mode)
+{
+	return kasprintf(GFP_KERNEL, "crypto/%s", dev_name(dev));
+}
+
+static int coproc_open(struct inode *inode, struct file *fp)
+{
+	struct coproc_instance *cp_inst;
+
+	cp_inst = kzalloc(sizeof(*cp_inst), GFP_KERNEL);
+	if (!cp_inst)
+		return -ENOMEM;
+
+	cp_inst->coproc = container_of(inode->i_cdev, struct coproc_dev,
+					cdev);
+	fp->private_data = cp_inst;
+
+	return 0;
+}
+
+static int coproc_ioc_tx_win_open(struct file *fp, unsigned long arg)
+{
+	void __user *uptr = (void __user *)arg;
+	struct vas_tx_win_attr txattr = {};
+	struct vas_tx_win_open_attr uattr;
+	struct coproc_instance *cp_inst;
+	struct vas_window *txwin;
+	int rc, vasid;
+
+	cp_inst = fp->private_data;
+
+	/*
+	 * One window for file descriptor
+	 */
+	if (cp_inst->txwin)
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
+	vas_init_tx_win_attr(&txattr, cp_inst->coproc->cop_type);
+
+	txattr.lpid = mfspr(SPRN_LPID);
+	txattr.pidr = mfspr(SPRN_PID);
+	txattr.user_win = true;
+	txattr.rsvd_txbuf_count = false;
+	txattr.pswid = false;
+
+	pr_devel("Pid %d: Opening txwin, PIDR %ld\n", txattr.pidr,
+				mfspr(SPRN_PID));
+
+	txwin = vas_tx_win_open(vasid, cp_inst->coproc->cop_type, &txattr);
+	if (IS_ERR(txwin)) {
+		pr_err("%s() vas_tx_win_open() failed, %ld\n", __func__,
+					PTR_ERR(txwin));
+		return PTR_ERR(txwin);
+	}
+
+	cp_inst->txwin = txwin;
+
+	return 0;
+}
+
+static int coproc_release(struct inode *inode, struct file *fp)
+{
+	struct coproc_instance *cp_inst = fp->private_data;
+
+	if (cp_inst->txwin) {
+		vas_win_close(cp_inst->txwin);
+		cp_inst->txwin = NULL;
+	}
+
+	kfree(cp_inst);
+	fp->private_data = NULL;
+
+	/*
+	 * We don't know here if user has other receive windows
+	 * open, so we can't really call clear_thread_tidr().
+	 * So, once the process calls set_thread_tidr(), the
+	 * TIDR value sticks around until process exits, resulting
+	 * in an extra copy in restore_sprs().
+	 */
+
+	return 0;
+}
+
+static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
+{
+	struct coproc_instance *cp_inst = fp->private_data;
+	struct vas_window *txwin;
+	unsigned long pfn;
+	u64 paste_addr;
+	pgprot_t prot;
+	int rc;
+
+	txwin = cp_inst->txwin;
+
+	if ((vma->vm_end - vma->vm_start) > PAGE_SIZE) {
+		pr_debug("%s(): size 0x%zx, PAGE_SIZE 0x%zx\n", __func__,
+				(vma->vm_end - vma->vm_start), PAGE_SIZE);
+		return -EINVAL;
+	}
+
+	/* Ensure instance has an open send window */
+	if (!txwin) {
+		pr_err("%s(): No send window open?\n", __func__);
+		return -EINVAL;
+	}
+
+	vas_win_paste_addr(txwin, &paste_addr, NULL);
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
+static long coproc_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	switch (cmd) {
+	case VAS_TX_WIN_OPEN:
+		return coproc_ioc_tx_win_open(fp, arg);
+	default:
+		return -EINVAL;
+	}
+}
+
+static struct file_operations coproc_fops = {
+	.open = coproc_open,
+	.release = coproc_release,
+	.mmap = coproc_mmap,
+	.unlocked_ioctl = coproc_ioctl,
+};
+
+/*
+ * Supporting only nx-gzip coprocessor type now, but this API code
+ * extended to other coprocessor types later.
+ */
+int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_type,
+				const char *name)
+{
+	int rc = -EINVAL;
+	dev_t devno;
+
+	rc = alloc_chrdev_region(&coproc_device.devt, 1, 1, name);
+	if (rc) {
+		pr_err("Unable to allocate coproc major number: %i\n", rc);
+		return rc;
+	}
+
+	pr_devel("%s device allocated, dev [%i,%i]\n", name,
+			MAJOR(coproc_device.devt), MINOR(coproc_device.devt));
+
+	coproc_device.class = class_create(mod, name);
+	if (IS_ERR(coproc_device.class)) {
+		rc = PTR_ERR(coproc_device.class);
+		pr_err("Unable to create %s class %d\n", name, rc);
+		goto err_class;
+	}
+	coproc_device.class->devnode = coproc_devnode;
+	coproc_device.cop_type = cop_type;
+
+	coproc_fops.owner = mod;
+	cdev_init(&coproc_device.cdev, &coproc_fops);
+
+	devno = MKDEV(MAJOR(coproc_device.devt), 0);
+	rc = cdev_add(&coproc_device.cdev, devno, 1);
+	if (rc) {
+		pr_err("cdev_add() failed %d\n", rc);
+		goto err_cdev;
+	}
+
+	coproc_device.device = device_create(coproc_device.class, NULL,
+			devno, NULL, name, MINOR(devno));
+	if (IS_ERR(coproc_device.device)) {
+		rc = PTR_ERR(coproc_device.device);
+		pr_err("Unable to create coproc-%d %d\n", MINOR(devno), rc);
+		goto err;
+	}
+
+	pr_devel("%s: Added dev [%d,%d]\n", __func__, MAJOR(devno),
+			MINOR(devno));
+
+	return 0;
+
+err:
+	cdev_del(&coproc_device.cdev);
+err_cdev:
+	class_destroy(coproc_device.class);
+err_class:
+	unregister_chrdev_region(coproc_device.devt, 1);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(vas_register_coproc_api);
+
+void vas_unregister_coproc_api(void)
+{
+	dev_t devno;
+
+	cdev_del(&coproc_device.cdev);
+	devno = MKDEV(MAJOR(coproc_device.devt), 0);
+	device_destroy(coproc_device.class, devno);
+
+	class_destroy(coproc_device.class);
+	unregister_chrdev_region(coproc_device.devt, 1);
+}
+EXPORT_SYMBOL_GPL(vas_unregister_coproc_api);
diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index 52844a1..6434f9c 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -26,7 +26,7 @@
  * Compute the paste address region for the window @window using the
  * ->paste_base_addr and ->paste_win_id_shift we got from device tree.
  */
-static void compute_paste_address(struct vas_window *window, u64 *addr, int *len)
+void vas_win_paste_addr(struct vas_window *window, u64 *addr, int *len)
 {
 	int winid;
 	u64 base, shift;
@@ -80,7 +80,7 @@ static void *map_paste_region(struct vas_window *txwin)
 		goto free_name;
 
 	txwin->paste_addr_name = name;
-	compute_paste_address(txwin, &start, &len);
+	vas_win_paste_addr(txwin, &start, &len);
 
 	if (!request_mem_region(start, len, name)) {
 		pr_devel("%s(): request_mem_region(0x%llx, %d) failed\n",
@@ -138,7 +138,7 @@ static void unmap_paste_region(struct vas_window *window)
 	u64 busaddr_start;
 
 	if (window->paste_kaddr) {
-		compute_paste_address(window, &busaddr_start, &len);
+		vas_win_paste_addr(window, &busaddr_start, &len);
 		unmap_region(window->paste_kaddr, busaddr_start, len);
 		window->paste_kaddr = NULL;
 		kfree(window->paste_addr_name);
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index a7143b1..70f793e 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -437,6 +437,8 @@ struct vas_winctx {
 extern void vas_return_credit(struct vas_window *window, bool tx);
 extern struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
 						uint32_t pswid);
+extern void vas_win_paste_addr(struct vas_window *window, u64 *addr,
+					int *len);
 
 static inline int vas_window_pid(struct vas_window *window)
 {
-- 
1.8.3.1



