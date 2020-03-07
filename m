Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ACC17C9CF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 01:36:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Z5CK0yMtzDrFp
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 11:36:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Z57x2t1GzDrCX
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 11:33:49 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0270KOTn058852; Fri, 6 Mar 2020 19:33:40 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yj6nnd3s1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 19:33:40 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0270T8Ma073606;
 Fri, 6 Mar 2020 19:33:40 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yj6nnd3rs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 19:33:40 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0270Ek96018599;
 Sat, 7 Mar 2020 00:33:39 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04wdc.us.ibm.com with ESMTP id 2yffk77a09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 07 Mar 2020 00:33:39 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0270Xc3N8782472
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 7 Mar 2020 00:33:38 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9237A6A051;
 Sat,  7 Mar 2020 00:33:38 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BE016A04F;
 Sat,  7 Mar 2020 00:33:38 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat,  7 Mar 2020 00:33:38 +0000 (GMT)
Subject: [PATCH v3 3/9] powerpc/vas: Add VAS user space API
From: Haren Myneni <haren@linux.ibm.com>
To: herbert@gondor.apana.org.au
In-Reply-To: <1583540877.9256.24.camel@hbabu-laptop>
References: <1583540877.9256.24.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 06 Mar 2020 16:33:35 -0800
Message-ID: <1583541215.9256.35.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_09:2020-03-06,
 2020-03-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 suspectscore=3
 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003070000
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
Cc: mikey@neuling.org, npiggin@gmail.com, linux-crypto@vger.kernel.org,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
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

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/include/asm/vas.h              |  11 ++
 arch/powerpc/platforms/powernv/Makefile     |   2 +-
 arch/powerpc/platforms/powernv/vas-api.c    | 290 ++++++++++++++++++++++++++++
 arch/powerpc/platforms/powernv/vas-window.c |   6 +-
 arch/powerpc/platforms/powernv/vas.h        |   2 +
 5 files changed, 307 insertions(+), 4 deletions(-)
 create mode 100644 arch/powerpc/platforms/powernv/vas-api.c

diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
index f93e6b0..e064953 100644
--- a/arch/powerpc/include/asm/vas.h
+++ b/arch/powerpc/include/asm/vas.h
@@ -163,4 +163,15 @@ struct vas_window *vas_tx_win_open(int vasid, enum vas_cop_type cop,
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
+int vas_register_coproc_api(struct module *mod);
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
index 0000000..3473a4a
--- /dev/null
+++ b/arch/powerpc/platforms/powernv/vas-api.c
@@ -0,0 +1,290 @@
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
+ * documententation for excat copy/paste usage and completion / error
+ * conditions.
+ */
+
+static char	*coproc_dev_name = "nx-gzip";
+static atomic_t	coproc_instid = ATOMIC_INIT(0);
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
+} coproc_device;
+
+/*
+ * One instance per open of a nx-gzip device. Each coproc_instance is
+ * associated with a VAS window after the caller issues
+ * VAS_GZIP_TX_WIN_OPEN ioctl.
+ */
+struct coproc_instance {
+	int id;
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
+	struct coproc_instance *instance;
+
+	instance = kzalloc(sizeof(*instance), GFP_KERNEL);
+	if (!instance)
+		return -ENOMEM;
+
+	instance->id = atomic_inc_return(&coproc_instid);
+
+	fp->private_data = instance;
+	return 0;
+}
+
+static int coproc_ioc_tx_win_open(struct file *fp, unsigned long arg)
+{
+	int rc, vasid;
+	struct vas_tx_win_attr txattr;
+	struct vas_tx_win_open_attr uattr;
+	void __user *uptr = (void __user *)arg;
+	struct vas_window *txwin;
+	struct coproc_instance *nxti = fp->private_data;
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
+static int coproc_release(struct inode *inode, struct file *fp)
+{
+	struct coproc_instance *instance;
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
+	atomic_dec(&coproc_instid);
+
+	return 0;
+}
+
+static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
+{
+	int rc;
+	pgprot_t prot;
+	u64 paste_addr;
+	unsigned long pfn;
+	struct coproc_instance *instance = fp->private_data;
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
+	vas_win_paste_addr(instance->txwin, &paste_addr, NULL);
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
+int vas_register_coproc_api(struct module *mod)
+{
+	int rc = -EINVAL;
+	dev_t devno;
+
+	rc = alloc_chrdev_region(&coproc_device.devt, 1, 1, "nx-gzip");
+	if (rc) {
+		pr_err("Unable to allocate coproc major number: %i\n", rc);
+		return rc;
+	}
+
+	pr_devel("NX-GZIP device allocated, dev [%i,%i]\n",
+			MAJOR(coproc_device.devt), MINOR(coproc_device.devt));
+
+	coproc_device.class = class_create(mod, "nx-gzip");
+	if (IS_ERR(coproc_device.class)) {
+		rc = PTR_ERR(coproc_device.class);
+		pr_err("Unable to create NX-GZIP class %d\n", rc);
+		goto err_class;
+	}
+	coproc_device.class->devnode = coproc_devnode;
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
+			devno, NULL, coproc_dev_name, MINOR(devno));
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
index e9ab851..7484296 100644
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
index 8c39a7d..a10abed 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -431,6 +431,8 @@ struct vas_winctx {
 extern void vas_return_credit(struct vas_window *window, bool tx);
 extern struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
 						uint32_t pswid);
+extern void vas_win_paste_addr(struct vas_window *window, u64 *addr,
+					int *len);
 
 static inline int vas_window_pid(struct vas_window *window)
 {
-- 
1.8.3.1



