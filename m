Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D62571AF9FF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 14:35:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 494q6b44KHzDqw9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 22:35:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=59.111.176.18; helo=m17618.mail.qiye.163.com;
 envelope-from=wenhu.wang@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vivo.com
Received: from m17618.mail.qiye.163.com (m17618.mail.qiye.163.com
 [59.111.176.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 494q28147TzDqDQ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Apr 2020 22:31:17 +1000 (AEST)
Received: from ubuntu.localdomain (unknown [58.251.74.226])
 by m17618.mail.qiye.163.com (Hmail) with ESMTPA id D4F4A4E1212;
 Sun, 19 Apr 2020 20:30:52 +0800 (CST)
From: Wang Wenhu <wenhu.wang@vivo.com>
To: gregkh@linuxfoundation.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] misc: new driver sram_uapi for user level SRAM access
Date: Sun, 19 Apr 2020 05:30:11 -0700
Message-Id: <20200419123011.86765-1-wenhu.wang@vivo.com>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZTlVCSUxCQkJCTEhJQkxKSVlXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PhQ6OAw5Djg0Hg0eMxhNCBEN
 ChEKCklVSlVKTkNMSUJCT05DT0pOVTMWGhIXVQweFRMOVQwaFRw7DRINFFUYFBZFWVdZEgtZQVlO
 Q1VJTkpVTE9VSUlNWVdZCAFZQUpIT0lMNwY+
X-HM-Tid: 0a71926b892e9376kuwsd4f4a4e1212
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
Cc: robh@kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Scott Wood <oss@buserror.net>, kernel@vivo.com,
 Wang Wenhu <wenhu.wang@vivo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A generic User-Kernel interface that allows a misc device created
by it to support file-operations of ioctl and mmap to access SRAM
memory from user level. Different kinds of SRAM alloction and free
APIs could be registered by specific SRAM hardware level driver to
the available list and then be chosen by users to allocate and map
SRAM memory from user level.

It is extremely helpful for the user space applications that require
high performance memory accesses. One case is that on some embedded
networking devices, data throughput is high and should be processed
form user level, and the SRAM memory buffer for the processes in user
space is of great preferences.

Signed-off-by: Wang Wenhu <wenhu.wang@vivo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Scott Wood <oss@buserror.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: linuxppc-dev@lists.ozlabs.org
---
Changes since v1:
 * Addressed comments from Arnd

Note: From this on, the SRAM_UAPI driver is dependent from any hardware
drivers, so I would only commit the patch as a series itself, while the
v1 of this patch was wrapped together with patches for Freescale device.
After this I would re-commit patches for Freescale device as another series.

Link for v1:
 * https://lore.kernel.org/lkml/20200418162157.50428-5-wenhu.wang@vivo.com/
---
 drivers/misc/Kconfig     |  11 ++
 drivers/misc/Makefile    |   1 +
 drivers/misc/sram_uapi.c | 348 +++++++++++++++++++++++++++++++++++++++
 drivers/misc/sram_uapi.h |  37 +++++
 4 files changed, 397 insertions(+)
 create mode 100644 drivers/misc/sram_uapi.c
 create mode 100644 drivers/misc/sram_uapi.h

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 99e151475d8f..b19c8b24f18e 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -465,6 +465,17 @@ config PVPANIC
 	  a paravirtualized device provided by QEMU; it lets a virtual machine
 	  (guest) communicate panic events to the host.
 
+config SRAM_UAPI
+	bool "Generic SRAM User Level API driver"
+	help
+	  This driver allows you to create a misc device which could be used
+	  as an interface to allocate SRAM memory from user level.
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
index 9abf2923d831..794447ca07ca 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_VMWARE_VMCI)	+= vmw_vmci/
 obj-$(CONFIG_LATTICE_ECP3_CONFIG)	+= lattice-ecp3-config.o
 obj-$(CONFIG_SRAM)		+= sram.o
 obj-$(CONFIG_SRAM_EXEC)		+= sram-exec.o
+obj-$(CONFIG_SRAM_UAPI)		+= sram_uapi.o
 obj-y				+= mic/
 obj-$(CONFIG_GENWQE)		+= genwqe/
 obj-$(CONFIG_ECHO)		+= echo/
diff --git a/drivers/misc/sram_uapi.c b/drivers/misc/sram_uapi.c
new file mode 100644
index 000000000000..858e43e559d0
--- /dev/null
+++ b/drivers/misc/sram_uapi.c
@@ -0,0 +1,348 @@
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
+#include <linux/mm.h>
+#include <linux/fs.h>
+#include <linux/miscdevice.h>
+#include <linux/uaccess.h>
+
+#include "sram_uapi.h"
+
+#define DRIVER_NAME	"sram_uapi"
+
+struct sram_resource {
+	struct list_head	list;
+	struct res_info		info;
+	phys_addr_t		phys;
+	void			*virt;
+	struct vm_area_struct	*vma;
+	struct sram_uapi	*parent;
+};
+
+struct sram_uapi {
+	struct list_head	res_list;
+	struct sram_api		*sa;
+};
+
+static DEFINE_MUTEX(sram_list_lock);
+static LIST_HEAD(sram_list);
+
+long sram_api_register(struct sram_api *sa)
+{
+	struct sram_api *cur;
+
+	if (!sa || !sa->name || !sa->sram_alloc || !sa->sram_free)
+		return -EINVAL;
+
+	mutex_lock(&sram_list_lock);
+	list_for_each_entry(cur, &sram_list, list) {
+		if (cur->type == sa->type) {
+			pr_err("error sram %s type %d exists\n", sa->name,
+			       sa->type);
+			mutex_unlock(&sram_list_lock);
+			return -EEXIST;
+		}
+	}
+
+	kref_init(&sa->kref);
+	list_add_tail(&sa->list, &sram_list);
+	pr_info("sram %s type %d registered\n", sa->name, sa->type);
+
+	mutex_unlock(&sram_list_lock);
+
+	return 0;
+};
+EXPORT_SYMBOL(sram_api_register);
+
+long sram_api_unregister(struct sram_api *sa)
+{
+	struct sram_api *cur, *tmp;
+	long ret = -ENODEV;
+
+	if (!sa || !sa->name || !sa->sram_alloc || !sa->sram_free)
+		return -EINVAL;
+
+	mutex_lock(&sram_list_lock);
+	list_for_each_entry_safe(cur, tmp, &sram_list, list) {
+		if (cur->type == sa->type && !strcmp(cur->name, sa->name)) {
+			if (kref_read(&cur->kref)) {
+				pr_err("error sram %s type %d is busy\n",
+					sa->name, sa->type);
+				ret = -EBUSY;
+			} else {
+				list_del(&cur->list);
+				pr_info("sram %s type %d unregistered\n",
+					sa->name, sa->type);
+				ret = 0;
+			}
+			break;
+		}
+	}
+	mutex_unlock(&sram_list_lock);
+
+	return ret;
+};
+EXPORT_SYMBOL(sram_api_unregister);
+
+static struct sram_api *get_sram_api_from_type(__u32 type)
+{
+	struct sram_api *cur;
+
+	mutex_lock(&sram_list_lock);
+	list_for_each_entry(cur, &sram_list, list) {
+		if (cur->type == type) {
+			kref_get(&cur->kref);
+			mutex_unlock(&sram_list_lock);
+			return cur;
+		}
+	}
+	mutex_unlock(&sram_list_lock);
+
+	return NULL;
+}
+
+static void sram_uapi_res_insert(struct sram_uapi *uapi,
+				 struct sram_resource *res)
+{
+	struct sram_resource *cur, *tmp;
+	struct list_head *head = &uapi->res_list;
+
+	list_for_each_entry_safe(cur, tmp, head, list) {
+		if (&tmp->list != head &&
+		    (cur->info.offset + cur->info.size + res->info.size <=
+		    tmp->info.offset)) {
+			res->info.offset = cur->info.offset + cur->info.size;
+			res->parent = uapi;
+			list_add(&res->list, &cur->list);
+			return;
+		}
+	}
+
+	if (list_empty(head))
+		res->info.offset = 0;
+	else {
+		tmp = list_last_entry(head, struct sram_resource, list);
+		res->info.offset = tmp->info.offset + tmp->info.size;
+	}
+	list_add_tail(&res->list, head);
+}
+
+static struct sram_resource *sram_uapi_res_delete(struct sram_uapi *uapi,
+						  struct res_info *info)
+{
+	struct sram_resource *res, *tmp;
+
+	list_for_each_entry_safe(res, tmp, &uapi->res_list, list) {
+		if (res->info.offset == info->offset) {
+			list_del(&res->list);
+			res->parent = NULL;
+			return res;
+		}
+	}
+
+	return NULL;
+}
+
+static struct sram_resource *sram_uapi_find_res(struct sram_uapi *uapi,
+						__u32 offset)
+{
+	struct sram_resource *res;
+
+	list_for_each_entry(res, &uapi->res_list, list) {
+		if (res->info.offset == offset)
+			return res;
+	}
+
+	return NULL;
+}
+
+static int sram_uapi_open(struct inode *inode, struct file *filp)
+{
+	struct sram_uapi *uapi;
+
+	uapi = kzalloc(sizeof(*uapi), GFP_KERNEL);
+	if (!uapi)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&uapi->res_list);
+	filp->private_data = uapi;
+
+	return 0;
+}
+
+static long sram_uapi_ioctl(struct file *filp, unsigned int cmd,
+			    unsigned long arg)
+{
+	struct sram_uapi *uapi = filp->private_data;
+	struct sram_resource *res;
+	struct res_info info;
+	long ret = -ENOIOCTLCMD;
+	int size;
+	__u32 type;
+
+	if (!uapi)
+		return ret;
+
+	switch (cmd) {
+	case SRAM_UAPI_IOC_SET_SRAM_TYPE:
+		if (uapi->sa)
+			return -EEXIST;
+
+		get_user(type, (const __u32 __user *)arg);
+		uapi->sa = get_sram_api_from_type(type);
+		if (uapi->sa)
+			ret = 0;
+		else
+			ret = -ENODEV;
+
+		break;
+
+	case SRAM_UAPI_IOC_ALLOC:
+		if (!uapi->sa)
+			return -EINVAL;
+
+		res = kzalloc(sizeof(*res), GFP_KERNEL);
+		if (!res)
+			return -ENOMEM;
+
+		size = copy_from_user((void *)&res->info,
+				      (const void __user *)arg,
+				      sizeof(res->info));
+		if (!PAGE_ALIGNED(res->info.size) || !res->info.size)
+			return -EINVAL;
+
+		res->virt = (void *)uapi->sa->sram_alloc(res->info.size,
+							 &res->phys,
+							 res->info.size);
+		if (!res->virt) {
+			kfree(res);
+			return -ENOMEM;
+		}
+
+		sram_uapi_res_insert(uapi, res);
+		size = copy_to_user((void __user *)arg,
+				    (const void *)&res->info,
+				    sizeof(res->info));
+
+		ret = 0;
+		break;
+
+	case SRAM_UAPI_IOC_FREE:
+		if (!uapi->sa)
+			return -EINVAL;
+
+		size = copy_from_user((void *)&info, (const void __user *)arg,
+				      sizeof(info));
+
+		res = sram_uapi_res_delete(uapi, &info);
+		if (!res) {
+			pr_err("error no sram resource found\n");
+			return -EINVAL;
+		}
+
+		uapi->sa->sram_free(res->virt);
+		kfree(res);
+
+		ret = 0;
+		break;
+
+	default:
+		pr_err("error no cmd not supported\n");
+		break;
+	}
+
+	return ret;
+}
+
+static int sram_uapi_mmap(struct file *filp, struct vm_area_struct *vma)
+{
+	struct sram_uapi *uapi = filp->private_data;
+	struct sram_resource *res;
+
+	res = sram_uapi_find_res(uapi, vma->vm_pgoff);
+	if (!res)
+		return -EINVAL;
+
+	if (vma->vm_end - vma->vm_start > res->info.size)
+		return -EINVAL;
+
+	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+
+	return remap_pfn_range(vma, vma->vm_start,
+				res->phys >> PAGE_SHIFT,
+				vma->vm_end - vma->vm_start,
+				vma->vm_page_prot);
+}
+
+static void sram_uapi_res_release(struct sram_uapi *uapi)
+{
+	struct sram_resource *res, *tmp;
+
+	list_for_each_entry_safe(res, tmp, &uapi->res_list, list) {
+		list_del(&res->list);
+		uapi->sa->sram_free(res->virt);
+		kfree(res);
+	}
+}
+
+static int sram_uapi_release(struct inode *inodp, struct file *filp)
+{
+	struct sram_uapi *uapi = filp->private_data;
+
+	sram_uapi_res_release(uapi);
+	if (uapi->sa)
+		kref_put(&uapi->sa->kref, NULL);
+
+	kfree(uapi);
+
+	return 0;
+}
+
+static const struct file_operations sram_uapi_ops = {
+	.owner		= THIS_MODULE,
+	.open		= sram_uapi_open,
+	.unlocked_ioctl = sram_uapi_ioctl,
+	.compat_ioctl	= compat_ptr_ioctl,
+	.mmap		= sram_uapi_mmap,
+	.release	= sram_uapi_release,
+};
+
+static struct miscdevice sram_uapi_miscdev = {
+	MISC_DYNAMIC_MINOR,
+	"sram",
+	&sram_uapi_ops,
+};
+
+static int __init sram_uapi_init(void)
+{
+	int ret;
+
+	INIT_LIST_HEAD(&sram_list);
+	mutex_init(&sram_list_lock);
+
+	ret = misc_register(&sram_uapi_miscdev);
+	if (ret)
+		pr_err("failed to register sram uapi misc device\n");
+
+	return ret;
+}
+
+static void __exit sram_uapi_exit(void)
+{
+	misc_deregister(&sram_uapi_miscdev);
+}
+
+module_init(sram_uapi_init);
+module_exit(sram_uapi_exit);
+
+MODULE_AUTHOR("Wang Wenhu <wenhu.wang@vivo.com>");
+MODULE_DESCRIPTION("SRAM User API Driver");
+MODULE_ALIAS("platform:" DRIVER_NAME);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/misc/sram_uapi.h b/drivers/misc/sram_uapi.h
new file mode 100644
index 000000000000..aef81cb4e701
--- /dev/null
+++ b/drivers/misc/sram_uapi.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __SRAM_UAPI_H
+#define __SRAM_UAPI_H
+
+struct res_info {
+	phys_addr_t offset;
+	phys_addr_t size;
+};
+
+struct sram_api {
+	struct list_head	list;
+	struct kref		kref;
+	__u32			type;
+	const char		*name;
+
+	long (*sram_alloc)(__u32 size, phys_addr_t *phys, __u32 align);
+	void (*sram_free)(void *ptr);
+};
+
+#define SRAM_UAPI_IOC_NUM	'S'
+
+/* Set SRAM type to be accessed */
+#define SRAM_UAPI_IOC_SET_SRAM_TYPE	_IOW(SRAM_UAPI_IOC_NUM, 0, __u32)
+
+/* Allocate resource from SRAM */
+#define SRAM_UAPI_IOC_ALLOC		_IOWR(SRAM_UAPI_IOC_NUM, 1,\
+					      struct res_info)
+
+/* Free allocated resource of SRAM */
+#define SRAM_UAPI_IOC_FREE		_IOW(SRAM_UAPI_IOC_NUM, 2,\
+					     struct res_info)
+
+extern long sram_api_register(struct sram_api *sa);
+
+extern long sram_api_unregister(struct sram_api *sa);
+
+#endif /* __SRAM_UAPI_H */
-- 
2.17.1

