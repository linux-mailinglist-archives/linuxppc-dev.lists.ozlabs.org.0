Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED82F1AD569
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 06:57:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493P362hxpzDrcF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 14:57:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493P0j2YxtzDrN7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 14:55:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=lgu6eiM6; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 493P0h1S8xz9sQx;
 Fri, 17 Apr 2020 14:55:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1587099316;
 bh=Vt1cCQL9SyJ3RL0ScBol5+O2GYKjKCUZQv4jFN4a/eE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=lgu6eiM6AmlXZDgBSzs1fmQqoRIci01WzFCJcpl1JknhBR68WDTCWol2JDuoBTrl/
 sFGF+lninlCeTZONqzLLSjy4nlHdonLaE/8pDxODVl8vZH31cU6Cr1P/I8OfkOntu0
 aT3wB1Wr+AtJjxaYDWkHzKf1SQKw1/Y7FaIrJMGMMf/QpSAJUmPBOAaHF+eA3Kizus
 qxcaCGK7e0Z4pbjfwnKDno1fBUUHFYj1/PUzfnIqBve8QeamaFr57RGgPVgsiEsOJO
 lVfg73bx5z0NGV0eFo/PZberynT+EimZaTv9W+pCqQthcLDinojj+Sd55R4j3I+/CK
 mse8cbqtt3D/A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Haren Myneni <haren@linux.ibm.com>
Subject: Re: [PATCH v5 3/9] powerpc/vas: Add VAS user space API
In-Reply-To: <1585778365.10664.479.camel@hbabu-laptop>
References: <1585777592.10664.462.camel@hbabu-laptop>
 <1585778365.10664.479.camel@hbabu-laptop>
Date: Fri, 17 Apr 2020 14:55:25 +1000
Message-ID: <87k12eiude.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Haren Myneni <haren@linux.ibm.com> writes:

> On power9, user space can send GZIP compression requests directly to NX
> once kernel establishes NX channel / window with VAS. This patch provides
> user space API which allows user space to establish channel using open
> VAS_TX_WIN_OPEN ioctl, mmap and close operations.
>
> Each window corresponds to file descriptor and application can open
> multiple windows. After the window is opened, VAS_TX_WIN_OPEN icoctl to
> open a window on specific VAS instance, mmap() system call to map
> the hardware address of engine's request queue into the application's
> virtual address space.
>
> Then the application can then submit one or more requests to the the
> engine by using the copy/paste instructions and pasting the CRBs to
> the virtual address (aka paste_address) returned by mmap().
>
> Only NX GZIP coprocessor type is supported right now and allow GZIP
> engine access via /dev/crypto/nx-gzip device node.
>
> Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/vas.h              |  11 ++
>  arch/powerpc/platforms/powernv/Makefile     |   2 +-
>  arch/powerpc/platforms/powernv/vas-api.c    | 257 ++++++++++++++++++++++++++++
>  arch/powerpc/platforms/powernv/vas-window.c |   6 +-
>  arch/powerpc/platforms/powernv/vas.h        |   2 +
>  5 files changed, 274 insertions(+), 4 deletions(-)
>  create mode 100644 arch/powerpc/platforms/powernv/vas-api.c
>
> diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
> index f93e6b0..e064953 100644
> --- a/arch/powerpc/include/asm/vas.h
> +++ b/arch/powerpc/include/asm/vas.h
> @@ -163,4 +163,15 @@ struct vas_window *vas_tx_win_open(int vasid, enum vas_cop_type cop,
>   */
>  int vas_paste_crb(struct vas_window *win, int offset, bool re);
>  
> +/*
> + * Register / unregister coprocessor type to VAS API which will be exported
> + * to user space. Applications can use this API to open / close window
> + * which can be used to send / receive requests directly to cooprcessor.
> + *
> + * Only NX GZIP coprocessor type is supported now, but this API can be
> + * used for others in future.
> + */
> +int vas_register_coproc_api(struct module *mod);
> +void vas_unregister_coproc_api(void);
> +
>  #endif /* __ASM_POWERPC_VAS_H */
> diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
> index 395789f..fe3f0fb 100644
> --- a/arch/powerpc/platforms/powernv/Makefile
> +++ b/arch/powerpc/platforms/powernv/Makefile
> @@ -17,7 +17,7 @@ obj-$(CONFIG_MEMORY_FAILURE)	+= opal-memory-errors.o
>  obj-$(CONFIG_OPAL_PRD)	+= opal-prd.o
>  obj-$(CONFIG_PERF_EVENTS) += opal-imc.o
>  obj-$(CONFIG_PPC_MEMTRACE)	+= memtrace.o
> -obj-$(CONFIG_PPC_VAS)	+= vas.o vas-window.o vas-debug.o vas-fault.o
> +obj-$(CONFIG_PPC_VAS)	+= vas.o vas-window.o vas-debug.o vas-fault.o vas-api.o
>  obj-$(CONFIG_OCXL_BASE)	+= ocxl.o
>  obj-$(CONFIG_SCOM_DEBUGFS) += opal-xscom.o
>  obj-$(CONFIG_PPC_SECURE_BOOT) += opal-secvar.o
> diff --git a/arch/powerpc/platforms/powernv/vas-api.c b/arch/powerpc/platforms/powernv/vas-api.c
> new file mode 100644
> index 0000000..7d049af
> --- /dev/null
> +++ b/arch/powerpc/platforms/powernv/vas-api.c
> @@ -0,0 +1,257 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * VAS user space API for its accelerators (Only NX-GZIP is supported now)
> + * Copyright (C) 2019 Haren Myneni, IBM Corp
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/device.h>
> +#include <linux/cdev.h>
> +#include <linux/fs.h>
> +#include <linux/slab.h>
> +#include <linux/uaccess.h>
> +#include <asm/vas.h>
> +#include <uapi/asm/vas-api.h>
> +#include "vas.h"
> +
> +/*
> + * The driver creates the device node that can be used as follows:
> + * For NX-GZIP
> + *
> + *	fd = open("/dev/crypto/nx-gzip", O_RDWR);
> + *	rc = ioctl(fd, VAS_TX_WIN_OPEN, &attr);
> + *	paste_addr = mmap(NULL, PAGE_SIZE, prot, MAP_SHARED, fd, 0ULL).
> + *	vas_copy(&crb, 0, 1);
> + *	vas_paste(paste_addr, 0, 1);
> + *	close(fd) or exit process to close window.
> + *
> + * where "vas_copy" and "vas_paste" are defined in copy-paste.h.
> + * copy/paste returns to the user space directly. So refer NX hardware
> + * documententation for exact copy/paste usage and completion / error
> + * conditions.
> + */
> +
> +static char	*coproc_dev_name = "nx-gzip";
> +
> +/*
> + * Wrapper object for the nx-gzip device - there is just one instance of
> + * this node for the whole system.
> + */
> +static struct coproc_dev {
> +	struct cdev cdev;
> +	struct device *device;
> +	char *name;
> +	dev_t devt;
> +	struct class *class;
> +} coproc_device;
> +
> +static char *coproc_devnode(struct device *dev, umode_t *mode)
> +{
> +	return kasprintf(GFP_KERNEL, "crypto/%s", dev_name(dev));
> +}
> +
> +static int coproc_open(struct inode *inode, struct file *fp)
> +{
> +	/*
> +	 * vas_window is allocated and assigned to fp->private_data
> +	 * in ioctl. Nothing to do here for NX GZIP.
> +	 */
> +	return 0;
> +}
> +
> +static int coproc_ioc_tx_win_open(struct file *fp, unsigned long arg)
> +{
> +	void __user *uptr = (void __user *)arg;
> +	struct vas_tx_win_attr txattr = {};
> +	struct vas_tx_win_open_attr uattr;
> +	struct vas_window *txwin;
> +	int rc, vasid;
> +
> +	/*
> +	 * One window for file descriptor
> +	 */
> +	if (fp->private_data)
> +		return -EEXIST;
> +
> +	rc = copy_from_user(&uattr, uptr, sizeof(uattr));
> +	if (rc) {
> +		pr_err("%s(): copy_from_user() returns %d\n", __func__, rc);
> +		return -EFAULT;
> +	}
> +
> +	if (uattr.version != 1) {
> +		pr_err("Invalid version\n");
> +		return -EINVAL;
> +	}
> +
> +	vasid = uattr.vas_id;
> +
> +	vas_init_tx_win_attr(&txattr, VAS_COP_TYPE_GZIP);

We shouldn't be hard coding GZIP in here.

I don't mind if you have a single coproc_dev for now, but we should at
least be passing the type etc. in from the driver.

Something like the patch below should work. Please test.

cheers


diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
index 994db6f41a19..5fa65a5af095 100644
--- a/arch/powerpc/include/asm/vas.h
+++ b/arch/powerpc/include/asm/vas.h
@@ -170,7 +170,8 @@ int vas_paste_crb(struct vas_window *win, int offset, bool re);
  * Only NX GZIP coprocessor type is supported now, but this API can be
  * used for others in future.
  */
-int vas_register_coproc_api(struct module *mod);
+int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_type,
+			    const char *name);
 void vas_unregister_coproc_api(void);
 
 #endif /* __ASM_POWERPC_VAS_H */
diff --git a/arch/powerpc/platforms/powernv/vas-api.c b/arch/powerpc/platforms/powernv/vas-api.c
index 7d049afde63a..3537a531bec1 100644
--- a/arch/powerpc/platforms/powernv/vas-api.c
+++ b/arch/powerpc/platforms/powernv/vas-api.c
@@ -31,7 +31,6 @@
  * conditions.
  */
 
-static char	*coproc_dev_name = "nx-gzip";
 
 /*
  * Wrapper object for the nx-gzip device - there is just one instance of
@@ -43,8 +42,14 @@ static struct coproc_dev {
 	char *name;
 	dev_t devt;
 	struct class *class;
+	enum vas_cop_type cop_type;
 } coproc_device;
 
+struct coproc_instance {
+	struct coproc_dev *coproc;
+	struct vas_window *txwin;
+};
+
 static char *coproc_devnode(struct device *dev, umode_t *mode)
 {
 	return kasprintf(GFP_KERNEL, "crypto/%s", dev_name(dev));
@@ -52,10 +57,15 @@ static char *coproc_devnode(struct device *dev, umode_t *mode)
 
 static int coproc_open(struct inode *inode, struct file *fp)
 {
-	/*
-	 * vas_window is allocated and assigned to fp->private_data
-	 * in ioctl. Nothing to do here for NX GZIP.
-	 */
+	struct coproc_instance *cp_inst;
+
+	cp_inst = kzalloc(sizeof(*cp_inst), GFP_KERNEL);
+	if (!cp_inst)
+		return -ENOMEM;
+
+	cp_inst->coproc = container_of(inode->i_cdev, struct coproc_dev, cdev);
+	fp->private_data = cp_inst;
+
 	return 0;
 }
 
@@ -64,13 +74,16 @@ static int coproc_ioc_tx_win_open(struct file *fp, unsigned long arg)
 	void __user *uptr = (void __user *)arg;
 	struct vas_tx_win_attr txattr = {};
 	struct vas_tx_win_open_attr uattr;
+	struct coproc_instance *cp_inst;
 	struct vas_window *txwin;
 	int rc, vasid;
 
+	cp_inst = fp->private_data;
+
 	/*
 	 * One window for file descriptor
 	 */
-	if (fp->private_data)
+	if (cp_inst->txwin)
 		return -EEXIST;
 
 	rc = copy_from_user(&uattr, uptr, sizeof(uattr));
@@ -86,7 +99,7 @@ static int coproc_ioc_tx_win_open(struct file *fp, unsigned long arg)
 
 	vasid = uattr.vas_id;
 
-	vas_init_tx_win_attr(&txattr, VAS_COP_TYPE_GZIP);
+	vas_init_tx_win_attr(&txattr, cp_inst->coproc->cop_type);
 
 	txattr.lpid = mfspr(SPRN_LPID);
 	txattr.pidr = mfspr(SPRN_PID);
@@ -97,27 +110,30 @@ static int coproc_ioc_tx_win_open(struct file *fp, unsigned long arg)
 	pr_devel("Pid %d: Opening txwin, PIDR %ld\n", txattr.pidr,
 				mfspr(SPRN_PID));
 
-	txwin = vas_tx_win_open(vasid, VAS_COP_TYPE_GZIP, &txattr);
+	txwin = vas_tx_win_open(vasid, cp_inst->coproc->cop_type, &txattr);
 	if (IS_ERR(txwin)) {
 		pr_err("%s() vas_tx_win_open() failed, %ld\n", __func__,
 					PTR_ERR(txwin));
 		return PTR_ERR(txwin);
 	}
 
-	fp->private_data = txwin;
+	cp_inst->txwin = txwin;
 
 	return 0;
 }
 
 static int coproc_release(struct inode *inode, struct file *fp)
 {
-	struct vas_window *txwin = fp->private_data;
+	struct coproc_instance *cp_inst = fp->private_data;
 
-	if (txwin) {
-		vas_win_close(txwin);
-		fp->private_data = NULL;
+	if (cp_inst->txwin) {
+		vas_win_close(cp_inst->txwin);
+		cp_inst->txwin = NULL;
 	}
 
+	kfree(cp_inst);
+	fp->private_data = NULL;
+
 	/*
 	 * We don't know here if user has other receive windows
 	 * open, so we can't really call clear_thread_tidr().
@@ -131,12 +147,15 @@ static int coproc_release(struct inode *inode, struct file *fp)
 
 static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
 {
-	struct vas_window *txwin = fp->private_data;
+	struct coproc_instance *cp_inst = fp->private_data;
+	struct vas_window *txwin;
 	unsigned long pfn;
 	u64 paste_addr;
 	pgprot_t prot;
 	int rc;
 
+	txwin = cp_inst->txwin;
+
 	if ((vma->vm_end - vma->vm_start) > PAGE_SIZE) {
 		pr_debug("%s(): size 0x%zx, PAGE_SIZE 0x%zx\n", __func__,
 				(vma->vm_end - vma->vm_start), PAGE_SIZE);
@@ -188,28 +207,30 @@ static struct file_operations coproc_fops = {
  * Supporting only nx-gzip coprocessor type now, but this API code
  * extended to other coprocessor types later.
  */
-int vas_register_coproc_api(struct module *mod)
+int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_type,
+			    const char *name)
 {
 	int rc = -EINVAL;
 	dev_t devno;
 
-	rc = alloc_chrdev_region(&coproc_device.devt, 1, 1, coproc_dev_name);
+	rc = alloc_chrdev_region(&coproc_device.devt, 1, 1, name);
 	if (rc) {
 		pr_err("Unable to allocate coproc major number: %i\n", rc);
 		return rc;
 	}
 
-	pr_devel("%s device allocated, dev [%i,%i]\n", coproc_dev_name,
-			MAJOR(coproc_device.devt), MINOR(coproc_device.devt));
+	pr_devel("%s device allocated, dev [%i,%i]\n", name,
+		 MAJOR(coproc_device.devt), MINOR(coproc_device.devt));
 
-	coproc_device.class = class_create(mod, coproc_dev_name);
+	coproc_device.class = class_create(mod, name);
 	if (IS_ERR(coproc_device.class)) {
 		rc = PTR_ERR(coproc_device.class);
-		pr_err("Unable to create %s class %d\n", coproc_dev_name, rc);
+		pr_err("Unable to create %s class %d\n", name, rc);
 		goto err_class;
 	}
 	coproc_device.class->devnode = coproc_devnode;
 
+	coproc_device.cop_type = cop_type;
 	coproc_fops.owner = mod;
 	cdev_init(&coproc_device.cdev, &coproc_fops);
 
@@ -221,7 +242,7 @@ int vas_register_coproc_api(struct module *mod)
 	}
 
 	coproc_device.device = device_create(coproc_device.class, NULL,
-			devno, NULL, coproc_dev_name, MINOR(devno));
+			devno, NULL, name, MINOR(devno));
 	if (IS_ERR(coproc_device.device)) {
 		rc = PTR_ERR(coproc_device.device);
 		pr_err("Unable to create coproc-%d %d\n", MINOR(devno), rc);
diff --git a/drivers/crypto/nx/nx-common-powernv.c b/drivers/crypto/nx/nx-common-powernv.c
index 38333e475097..1979fa6055de 100644
--- a/drivers/crypto/nx/nx-common-powernv.c
+++ b/drivers/crypto/nx/nx-common-powernv.c
@@ -1088,7 +1088,7 @@ static __init int nx_compress_powernv_init(void)
 		 * that user space can use GZIP engine.
 		 * 842 compression is supported only in kernel.
 		 */
-		ret = vas_register_coproc_api(THIS_MODULE);
+		ret = vas_register_coproc_api(THIS_MODULE, VAS_COP_TYPE_GZIP, "nx-gzip");
 
 		/*
 		 * GZIP is not supported in kernel right now.
