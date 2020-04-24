Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2471B7040
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 11:06:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497pDx43YMzDqRJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 19:06:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=59.111.176.16; helo=m17616.mail.qiye.163.com;
 envelope-from=wenhu.wang@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vivo.com
Received: from m17616.mail.qiye.163.com (m17616.mail.qiye.163.com
 [59.111.176.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497p4n3dtVzDqNd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 18:59:05 +1000 (AEST)
Received: from ubuntu.localdomain (unknown [58.251.74.227])
 by m17616.mail.qiye.163.com (Hmail) with ESMTPA id 47900108240;
 Fri, 24 Apr 2020 16:58:55 +0800 (CST)
From: Wang Wenhu <wenhu.wang@vivo.com>
To: kernel@vivo.com
Subject: [PATCH v4,4/5] misc: sram_dynamic for user level SRAM access
Date: Fri, 24 Apr 2020 01:58:38 -0700
Message-Id: <20200424085839.60284-5-wenhu.wang@vivo.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200424085839.60284-1-wenhu.wang@vivo.com>
References: <20200424085839.60284-1-wenhu.wang@vivo.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZTlVMTUNLS0tKSU5DQ05LSllXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MyI6HDo6OTg3PFYNGBgXCTYc
 Si0wCy1VSlVKTkNMTEpDTEhDTEJPVTMWGhIXVQweFRMOVQwaFRw7DRINFFUYFBZFWVdZEgtZQVlO
 Q1VJTkpVTE9VSUlMWVdZCAFZQUlKSU5PNwY+
X-HM-Tid: 0a71ab6946ce9374kuws47900108240
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Scott Wood <oss@buserror.net>,
 Wang Wenhu <wenhu.wang@vivo.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A generic User-Kernel interface module that allows a misc device created
when a backend SRAM hardware device driver registers its APIs to support
file operations of ioctl and mmap for user space applications to allocate
SRAM memory, mmap it to process address space and free it then after.

It is extremely helpful for the user space applications that require
high performance memory accesses, such as embedded networking devices
that would process data in user space, and PowerPC e500 is one case.

Signed-off-by: Wang Wenhu <wenhu.wang@vivo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Scott Wood <oss@buserror.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
---
Changes since v1: addressed comments from Arnd
 * Changed the ioctl cmd definitions using _IO micros
 * Export interfaces for HW-SRAM drivers to register apis to available list
 * Modified allocation alignment to PAGE_SIZE
 * Use phys_addr_t as type of SRAM resource size and offset
 * Support compat_ioctl
 * Misc device name:sram
 * Use tristate for SRAM_UAPI
 * Use postcore_initcall

Changes since v2: addressed comments from Arnd, greg and Scott
 * Name the module with sram_dynamic in comparing with drivers/misc/sram.c

    I tried to tie the sram_dynamic with the abstractions in sram.c as
    Arnd suggested, and actually sram.c probes SRAM devices from devicetree
    and manages them with different partitions and create memory pools which
    are managed with genalloc functions.

    Here sram_dynamic acts only as a interface to user space. A SRAM memory
    pool is managed by the module that registers APIs to us, such as the
    backend hardware driver of Freescale 85xx Cache-SRAM.

 * Create one sram_device for each backend SRAM device(from Scott)
 * Allow only one block of SRAM memory allocated to a file descriptor(from Scott)
 * Add sysfs files for every allocated SRAM memory block
 * More documentations(As Greg commented)
 * Make uapi and non-uapi components apart(from Arnd and Greg)

Changes since v3:
 * Addressed comments from Christophe
 * Auto select SRAM_DYNAMIC by the caller modules
 * Delete useless sram_uapi.c

Links:
 v1: https://lore.kernel.org/lkml/20200418162157.50428-5-wenhu.wang@vivo.com/
 v2: https://lore.kernel.org/lkml/20200420030538.101696-1-wenhu.wang@vivo.com/
UIO version:
 v5: https://lore.kernel.org/lkml/20200417071616.44598-5-wenhu.wang@vivo.com/
---
 drivers/misc/Kconfig         |  11 +
 drivers/misc/Makefile        |   1 +
 drivers/misc/sram_dynamic.c  | 580 +++++++++++++++++++++++++++++++++++
 include/linux/sram_dynamic.h |  23 ++
 include/uapi/linux/sram.h    |  11 +
 5 files changed, 626 insertions(+)
 create mode 100644 drivers/misc/sram_dynamic.c
 create mode 100644 include/linux/sram_dynamic.h
 create mode 100644 include/uapi/linux/sram.h

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 99e151475d8f..26f161bc0282 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -465,6 +465,17 @@ config PVPANIC
 	  a paravirtualized device provided by QEMU; it lets a virtual machine
 	  (guest) communicate panic events to the host.
 
+config SRAM_DYNAMIC
+	tristate
+	help
+	  This driver allows you to create a misc device which could be used
+	  as an interface to allocate SRAM memory from user level dynamically.
+
+	  It is extremely helpful for some user space applications that require
+	  high performance memory accesses.
+
+	  If unsure, say N.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 9abf2923d831..c32085026d30 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_VMWARE_VMCI)	+= vmw_vmci/
 obj-$(CONFIG_LATTICE_ECP3_CONFIG)	+= lattice-ecp3-config.o
 obj-$(CONFIG_SRAM)		+= sram.o
 obj-$(CONFIG_SRAM_EXEC)		+= sram-exec.o
+obj-$(CONFIG_SRAM_DYNAMIC)	+= sram_dynamic.o
 obj-y				+= mic/
 obj-$(CONFIG_GENWQE)		+= genwqe/
 obj-$(CONFIG_ECHO)		+= echo/
diff --git a/drivers/misc/sram_dynamic.c b/drivers/misc/sram_dynamic.c
new file mode 100644
index 000000000000..ea2d4d92cccf
--- /dev/null
+++ b/drivers/misc/sram_dynamic.c
@@ -0,0 +1,580 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Vivo Communication Technology Co. Ltd.
+ * Copyright (C) 2020 Wang Wenhu <wenhu.wang@vivo.com>
+ * All rights reserved.
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/cdev.h>
+#include <linux/mm.h>
+#include <linux/fs.h>
+#include <linux/uaccess.h>
+#include <uapi/linux/sram.h>
+#include <linux/sram_dynamic.h>
+
+#define SRAM_MAX_DEVICES	(1U << MINORBITS)
+
+/**
+ * struct sram_res - allocated SRAM memory resource description.
+ *
+ * @virt:	virtual memory address of the SRAM memory resource
+ * @phys:	physical memory address of the SRAM memory resource
+ * @size:	size of the SRAM memory resource
+ * @sdev:	sram_device the resource belongs to
+ * @map:	sysfs directory of the resource
+ */
+struct sram_res {
+	void __iomem	*virt;
+	phys_addr_t		phys;
+	__be64		size;
+	struct sram_device *sdev;
+	struct sram_map *map;
+};
+
+/**
+ * struct sram_device - character device that act as an User-Kernel interface.
+ *
+ * A sram_device is created when specific lower level hardware SRAM driver
+ * calls sram_register_device(). The SRAM hardware device is set as the
+ * parent of sram_device. Then user can create a file descriptor when they
+ * open specific sram_device. With the file descriptor, user could request
+ * SRAM memory through ioctl syscall. Available ioctl numbers are defined
+ * in "include/uapi/linux/sram.h".
+ *
+ * @dev:	character device to be added to system during SRAM registration
+ * @owner:	owner module of the device
+ * @minor:	minor id of the character device
+ * @sa:		APIs registered by SRAM hardware driver
+ * @map_dir:	sysfs directory containing all the maps related to the SRAM
+ */
+struct sram_device {
+	struct device	dev;
+	struct module	*owner;
+	int		minor;
+	struct sram_api	*sa;
+	struct kobject	*map_dir;
+};
+
+/**
+ * sysfs map attribute fields.
+ *
+ * When a block of SRAM memory is allocated for user, specific map
+ * directory related to it would be created, the dir routine is:
+ *
+ *	/sys/class/sram/$sram_device/maps/map:$phys
+ *
+ * Within the directory are the offset and size files whose meanings
+ * are very apparent.
+ *
+ * Multiple directories could be created if different file descriptors are
+ * created by openning the SRAM device. A map directory is removed by calling
+ * sram_del_map_attr() when the memory is released.
+ */
+
+struct sram_map {
+	struct kobject kobj;
+	struct sram_res *res;
+};
+
+#define to_map(map) container_of(map, struct sram_map, kobj)
+
+static ssize_t map_addr_show(struct sram_map *map, char *buf)
+{
+	return sprintf(buf, "%llx\n", (unsigned long long)map->res->phys);
+}
+
+static ssize_t map_size_show(struct sram_map *map, char *buf)
+{
+	return sprintf(buf, "%llx\n", map->res->size);
+}
+
+struct map_sysfs_entry {
+	struct attribute attr;
+	ssize_t (*show)(struct sram_map *map, char *buf);
+	ssize_t (*store)(struct sram_map *map, const char *buf, size_t size);
+};
+
+static struct map_sysfs_entry addr_attribute =
+	__ATTR(addr, 0444, map_addr_show, NULL);
+static struct map_sysfs_entry size_attribute =
+	__ATTR(size, 0444, map_size_show, NULL);
+
+static struct attribute *attrs[] = {
+	&addr_attribute.attr,
+	&size_attribute.attr,
+	NULL,	/* need to NULL terminate the list of attributes */
+};
+
+/* callback for kobject_put */
+static void map_release(struct kobject *kobj)
+{
+	struct sram_map *map = to_map(kobj);
+
+	kfree(map);
+}
+
+static ssize_t map_type_show(struct kobject *kobj, struct attribute *attr,
+			     char *buf)
+{
+	struct sram_map *map = to_map(kobj);
+	struct map_sysfs_entry *entry;
+
+	entry = container_of(attr, struct map_sysfs_entry, attr);
+
+	if (!entry->show)
+		return -EIO;
+
+	return entry->show(map, buf);
+}
+
+static const struct sysfs_ops map_sysfs_ops = {
+	.show = map_type_show,
+};
+
+static struct kobj_type map_attr_type = {
+	.release	= map_release,
+	.sysfs_ops	= &map_sysfs_ops,
+	.default_attrs	= attrs,
+};
+
+static DEFINE_MUTEX(minor_lock);
+static int sram_major;
+static struct cdev *sram_cdev;
+static DEFINE_IDR(sram_idr);
+
+
+/**
+ * SRAM character device file operations.
+ *
+ * A file descriptor is allowed to request one and only one block of
+ * SRAM memory. An entry of struct sram_res is used to describe the
+ * allocated SRAM memory resource. If the allocation succeeds, the
+ * virt element of the entry is set to the virtual address pointing
+ * to the SRAM memory. So we use virt as the mark of whether a file
+ * descriptor related to the device is attached to a block of SRAM
+ * memory. Whenever the related SRAM memory block is released, the
+ * virt element is set to NULL.
+ */
+
+static int sram_open(struct inode *inode, struct file *filp)
+{
+	struct sram_res *res;
+	struct sram_device *sdev;
+
+	mutex_lock(&minor_lock);
+	sdev = idr_find(&sram_idr, iminor(inode));
+	mutex_unlock(&minor_lock);
+	if (!sdev)
+		return -ENODEV;
+
+	get_device(&sdev->dev);
+
+	if (!try_module_get(sdev->owner)) {
+		put_device(&sdev->dev);
+		return -ENODEV;
+	}
+
+	res = kzalloc(sizeof(*res), GFP_KERNEL);
+	if (!res) {
+		module_put(sdev->owner);
+		put_device(&sdev->dev);
+		return -ENOMEM;
+	}
+
+	res->sdev = sdev;
+
+	filp->private_data = res;
+
+	return 0;
+}
+
+static int sram_add_map_attr(struct sram_res *res)
+{
+	struct sram_device *sdev = res->sdev;
+	struct sram_map *map;
+	__be64	phys;
+	int ret;
+
+	map = kzalloc(sizeof(*map), GFP_KERNEL);
+	if (!map)
+		return -ENOMEM;
+
+	kobject_init(&map->kobj, &map_attr_type);
+
+	phys = res->phys;
+	ret = kobject_add(&map->kobj, sdev->map_dir, "map:%08llx", phys);
+	if (ret)
+		goto err_put;
+
+	ret = kobject_uevent(&map->kobj, KOBJ_ADD);
+	if (ret)
+		goto err_put;
+
+	map->res = res;
+	res->map = map;
+
+	return 0;
+err_put:
+	kobject_put(&map->kobj);
+	return ret;
+}
+
+static void sram_del_map_attr(struct sram_res *res)
+{
+	struct sram_map *map = res->map;
+
+	kobject_put(&map->kobj);
+}
+
+static long sram_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+{
+	struct sram_res *res = filp->private_data;
+	struct sram_device *sdev = res->sdev;
+	long ret = -ENOTTY;
+	__be64 size;
+
+	/**
+	 * Two ioctl cmds are supported. SRAM_UAPI_IOC_ALLOC allows
+	 * users to request SRAM memory resource, and on the opposite
+	 * side, SRAM_UAPI_IOC_FREE is used for SRAM resource free.
+	 *
+	 * One and only one block of SRAM memory resource is allowed
+	 * to be allocated and attached to a file descriptor, so we
+	 * take size as the single in parameter of SRAM_UAPI_IOC_ALLOC
+	 * ioctl operation. No parameter needs to be copy in or out for
+	 * SRAM_UAPI_IOC_FREE operation.
+	 *
+	 * It's user's choice to decide how the memory block would be
+	 * managed and used in user-space, such as a user may request a
+	 * large block of memory and then take it as a memory pool for
+	 * further allocations of user threads.
+	 */
+
+	switch (cmd) {
+	case SRAM_UAPI_IOC_ALLOC:
+		if (res->virt)
+			return -EEXIST;
+
+		if (get_user(size, (__be64 __user *)arg) == -EFAULT)
+			return -EFAULT;
+
+		/**
+		 * Size limitation is handled by the driver who
+		 * registered the sram APIs.
+		 */
+		if (!size || !PAGE_ALIGNED(size))
+			return -EINVAL;
+
+		res->virt = sdev->sa->alloc(size, &res->phys, PAGE_SIZE);
+		if (!res->virt)
+			return -ENOSPC;
+
+		res->size = size;
+
+		ret = sram_add_map_attr(res);
+		if (ret) {
+			sdev->sa->free(res->virt);
+			memset(res, 0, sizeof(*res));
+			return ret;
+		}
+		break;
+
+	case SRAM_UAPI_IOC_FREE:
+		if (res->virt) {
+			sram_del_map_attr(res);
+			sdev->sa->free(res->virt);
+			ret = 0;
+		} else {
+			ret = -EFAULT;
+		}
+		break;
+	}
+
+	return ret;
+}
+
+static int sram_mmap(struct file *filp, struct vm_area_struct *vma)
+{
+	struct sram_res *res = filp->private_data;
+
+	if (!res->virt)
+		return -EFAULT;
+
+	if (vma->vm_end - vma->vm_start > res->size)
+		return -EINVAL;
+
+	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+
+	return remap_pfn_range(vma, vma->vm_start,
+			       res->phys >> PAGE_SHIFT,
+			       vma->vm_end - vma->vm_start,
+			       vma->vm_page_prot);
+}
+
+static int sram_release(struct inode *inodp, struct file *filp)
+{
+	struct sram_res *res = filp->private_data;
+	struct sram_device *sdev = res->sdev;
+
+	/**
+	 * Should have been done with ioctl syscall, but we should still
+	 * check and release the resource if res->virt is not NULL, in case
+	 * that user did not do it apparently through ioctl syscall.
+	 */
+	if (res->virt) {
+		sram_del_map_attr(res);
+		sdev->sa->free(res->virt);
+	}
+
+	kfree(res);
+
+	put_device(&sdev->dev);
+
+	module_put(sdev->owner);
+
+	return 0;
+}
+
+static const struct file_operations sram_fops = {
+	.owner		= THIS_MODULE,
+	.open		= sram_open,
+	.unlocked_ioctl = sram_ioctl,
+	.compat_ioctl	= compat_ptr_ioctl,
+	.mmap		= sram_mmap,
+	.release	= sram_release,
+};
+
+static ssize_t name_show(struct device *dev,
+			 struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%s\n", dev_name(dev));
+}
+static DEVICE_ATTR_RO(name);
+
+static struct attribute *sram_attrs[] = {
+	&dev_attr_name.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(sram);
+
+static bool sram_class_registered;
+
+static int sram_get_minor(struct sram_device *sdev)
+{
+	int ret = -ENOMEM;
+
+	mutex_lock(&minor_lock);
+	ret = idr_alloc(&sram_idr, sdev, 0, SRAM_MAX_DEVICES, GFP_KERNEL);
+	if (ret >= 0) {
+		sdev->minor = ret;
+		ret = 0;
+	}
+	mutex_unlock(&minor_lock);
+	return ret;
+}
+
+static void sram_free_minor(struct sram_device *sdev)
+{
+	mutex_lock(&minor_lock);
+	idr_remove(&sram_idr, sdev->minor);
+	mutex_unlock(&minor_lock);
+}
+
+/* SRAM class infrastructure */
+static struct class sram_class = {
+	.name = "sram",
+	.dev_groups = sram_groups,
+};
+
+static int sram_major_init(void)
+{
+	static const char *name = "sram";
+	struct cdev *cdev = NULL;
+	dev_t sram_dev = 0;
+	int ret;
+
+	ret = alloc_chrdev_region(&sram_dev, 0, SRAM_MAX_DEVICES, name);
+	if (ret)
+		return ret;
+
+	ret = -ENOMEM;
+	cdev = cdev_alloc();
+	if (!cdev)
+		goto out_unregister;
+
+	cdev->owner = THIS_MODULE;
+	cdev->ops = &sram_fops;
+	kobject_set_name(&cdev->kobj, "%s", name);
+
+	ret = cdev_add(cdev, sram_dev, SRAM_MAX_DEVICES);
+	if (ret)
+		goto out_put;
+
+	sram_major = MAJOR(sram_dev);
+	sram_cdev = cdev;
+	return 0;
+out_put:
+	kobject_put(&cdev->kobj);
+out_unregister:
+	unregister_chrdev_region(sram_dev, SRAM_MAX_DEVICES);
+	return ret;
+}
+
+static void sram_major_cleanup(void)
+{
+	unregister_chrdev_region(MKDEV(sram_major, 0), SRAM_MAX_DEVICES);
+	cdev_del(sram_cdev);
+}
+
+static int init_sram_class(void)
+{
+	int ret;
+
+	/* Allocate and add char device to the system. */
+	ret = sram_major_init();
+	if (ret)
+		goto exit;
+
+	ret = class_register(&sram_class);
+	if (ret) {
+		pr_err("class_register failed for sram\n");
+		goto err_class_register;
+	}
+
+	sram_class_registered = true;
+
+	return 0;
+
+err_class_register:
+	sram_major_cleanup();
+exit:
+	return ret;
+}
+
+static void release_sram_class(void)
+{
+	sram_class_registered = false;
+	class_unregister(&sram_class);
+	sram_major_cleanup();
+}
+
+static void sram_device_release(struct device *dev)
+{
+	struct sram_device *sdev = dev_get_drvdata(dev);
+
+	kfree(sdev);
+}
+
+/**
+ * sram_register_device() - register a new sram interface device
+ * @owner:	module that creates the new device
+ * @parent:	parent device
+ * @sa:		sram device APIs for SRAM memory allocation and free
+ *
+ * Return:	zero on success or a negative error code.
+ */
+int __sram_register_device(struct module *owner,
+			   struct device *parent,
+			   struct sram_api *sa)
+{
+	struct sram_device *sdev;
+	int ret = 0;
+
+	if (!sram_class_registered)
+		return -EPROBE_DEFER;
+
+	if (!parent || !sa || !sa->alloc || !sa->free)
+		return -EINVAL;
+
+	sdev = kzalloc(sizeof(*sdev), GFP_KERNEL);
+	if (!sdev)
+		return -ENOMEM;
+
+	sdev->owner = owner;
+	sdev->sa = sa;
+
+	ret = sram_get_minor(sdev);
+	if (ret) {
+		kfree(sdev);
+		return ret;
+	}
+
+	device_initialize(&sdev->dev);
+	sdev->dev.devt = MKDEV(sram_major, sdev->minor);
+	sdev->dev.class = &sram_class;
+	sdev->dev.parent = parent;
+	sdev->dev.release = sram_device_release;
+	dev_set_drvdata(&sdev->dev, sdev);
+
+	if (sa->name)
+		ret = dev_set_name(&sdev->dev, "%s", sa->name);
+	else
+		ret = dev_set_name(&sdev->dev, "sram%d", sdev->minor);
+	if (ret)
+		goto err_free;
+
+	ret = device_add(&sdev->dev);
+	if (ret)
+		goto err_free;
+
+	sdev->map_dir = kobject_create_and_add("maps", &sdev->dev.kobj);
+	if (!sdev->map_dir) {
+		ret = -ENOMEM;
+		goto err_device_del;
+	}
+
+	sa->sdev = sdev;
+
+	return 0;
+err_device_del:
+	device_del(&sdev->dev);
+err_free:
+	sram_free_minor(sdev);
+	put_device(&sdev->dev);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(__sram_register_device);
+
+/**
+ * sram_unregister_device() - unregister a sram interface device
+ * @sa:	sram device APIs for SRAM memory allocation and free
+ */
+void sram_unregister_device(struct sram_api *sa)
+{
+	struct sram_device *sdev;
+
+	if (!sa || !sa->sdev)
+		return;
+
+	sdev = sa->sdev;
+
+	kobject_put(sdev->map_dir);
+
+	sram_free_minor(sdev);
+
+	sdev->sa = NULL;
+
+	device_unregister(&sdev->dev);
+}
+EXPORT_SYMBOL_GPL(sram_unregister_device);
+
+static int __init sram_uapi_init(void)
+{
+	return init_sram_class();
+}
+postcore_initcall(sram_uapi_init);
+
+static void __exit sram_uapi_exit(void)
+{
+	release_sram_class();
+	idr_destroy(&sram_idr);
+}
+module_exit(sram_uapi_exit);
+
+MODULE_AUTHOR("Wang Wenhu <wenhu.wang@vivo.com>");
+MODULE_DESCRIPTION("SRAM Dynamic Access User API Support");
+MODULE_ALIAS("platform:sram_dynamic");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/sram_dynamic.h b/include/linux/sram_dynamic.h
new file mode 100644
index 000000000000..605dcec73c4b
--- /dev/null
+++ b/include/linux/sram_dynamic.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __SRAM_DYNAMIC_H
+#define __SRAM_DYNAMIC_H
+
+struct sram_api {
+	const char	*name;
+	struct sram_device *sdev;
+	void *(*alloc)(__u32 size, phys_addr_t *phys, __u32 align);
+	void (*free)(void *ptr);
+};
+
+int __must_check
+	__sram_register_device(struct module *owner,
+			       struct device *parent,
+			       struct sram_api *sa);
+
+/* Use a define to avoid include chaining to get THIS_MODULE */
+#define sram_register_device(parent, sa) \
+	__sram_register_device(THIS_MODULE, parent, sa)
+
+void sram_unregister_device(struct sram_api *sa);
+
+#endif /* __SRAM_DYNAMIC_H */
diff --git a/include/uapi/linux/sram.h b/include/uapi/linux/sram.h
new file mode 100644
index 000000000000..9b4a2615dbfe
--- /dev/null
+++ b/include/uapi/linux/sram.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __SRAM_H
+#define __SRAM_H
+
+/* Allocate memory resource from SRAM */
+#define SRAM_UAPI_IOC_ALLOC	_IOWR('S', 0, __be64)
+
+/* Free allocated memory resource to SRAM */
+#define SRAM_UAPI_IOC_FREE	_IO('S', 1)
+
+#endif /* __SRAM_H */
-- 
2.17.1

