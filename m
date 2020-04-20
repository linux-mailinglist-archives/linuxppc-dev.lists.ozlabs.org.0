Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 566571B0EF5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 16:55:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495V9Y1vwvzDqH4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 00:55:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=s+HQ9ifH; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495V5L4lJYzDqSl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 00:51:32 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 339FE206F4;
 Mon, 20 Apr 2020 14:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587394290;
 bh=AF1W7Z0McyMuwV7Fj38/Vykj+JXO1ZeVb8FzboKLiEw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s+HQ9ifHS9g5hq3XcrF/JnV2QkFrC62kEwp1RDOZ5X22A9rL0vyS/ko/5fzhNaCve
 8YTsSMG46Cx6tLCtLUopAjUgd3q9OnX5ZI2lAqtPo1DT4kpdUJzGWTgmsZimKNa6QL
 m2jfzfc6Xx2iTGXp7aqLxBn78c/Mun4yTrfs3drQ=
Date: Mon, 20 Apr 2020 16:51:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Wang Wenhu <wenhu.wang@vivo.com>
Subject: Re: [PATCH v2, RESEND] misc: new driver sram_uapi for user level SRAM
 access
Message-ID: <20200420145128.GA4131449@kroah.com>
References: <20200420030538.101696-1-wenhu.wang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420030538.101696-1-wenhu.wang@vivo.com>
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
Cc: robh@kernel.org, arnd@arndb.de, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>, kernel@vivo.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Apr 19, 2020 at 08:05:38PM -0700, Wang Wenhu wrote:
> A generic User-Kernel interface that allows a misc device created
> by it to support file-operations of ioctl and mmap to access SRAM
> memory from user level. Different kinds of SRAM alloction and free
> APIs could be registered by specific SRAM hardware level driver to
> the available list and then be chosen by users to allocate and map
> SRAM memory from user level.
> 
> It is extremely helpful for the user space applications that require
> high performance memory accesses, such as embedded networking devices
> that would process data in user space, and PowerPC e500 is a case.
> 
> Signed-off-by: Wang Wenhu <wenhu.wang@vivo.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Scott Wood <oss@buserror.net>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
> Changes since v1: addressed comments from Arnd
>  * Changed the ioctl cmd definitions using _IO micros
>  * Export interfaces for HW-SRAM drivers to register apis to available list
>  * Modified allocation alignment to PAGE_SIZE
>  * Use phys_addr_t as type of SRAM resource size and offset
>  * Support compat_ioctl
>  * Misc device name:sram
> 
> Note: From this on, the SRAM_UAPI driver is independent to any hardware
> drivers, so I would only commit the patch itself as v2, while the v1 of
> it was wrapped together with patches for Freescale L2-Cache-SRAM device.
> Then after, I'd create patches for Freescale L2-Cache-SRAM device as
> another series.
> 
> Link for v1:
>  * https://lore.kernel.org/lkml/20200418162157.50428-5-wenhu.wang@vivo.com/

Why was this a RESEND?  What was wrong with the original v2 version?

Anyway, minor review comments:

> ---
>  drivers/misc/Kconfig      |  11 ++
>  drivers/misc/Makefile     |   1 +
>  drivers/misc/sram_uapi.c  | 352 ++++++++++++++++++++++++++++++++++++++
>  include/linux/sram_uapi.h |  28 +++
>  4 files changed, 392 insertions(+)
>  create mode 100644 drivers/misc/sram_uapi.c
>  create mode 100644 include/linux/sram_uapi.h
> 
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 99e151475d8f..b19c8b24f18e 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -465,6 +465,17 @@ config PVPANIC
>  	  a paravirtualized device provided by QEMU; it lets a virtual machine
>  	  (guest) communicate panic events to the host.
>  
> +config SRAM_UAPI
> +	bool "Generic SRAM User Level API driver"
> +	help
> +	  This driver allows you to create a misc device which could be used
> +	  as an interface to allocate SRAM memory from user level.
> +
> +	  It is extremely helpful for some user space applications that require
> +	  high performance memory accesses.
> +
> +	  If unsure, say N.

Naming is hard, but shouldn't this just be "sram" and drop the whole
"UAPI" stuff everywhere?  That doesn't make much sense as drivers are
just interfaces to userspace...


> +
>  source "drivers/misc/c2port/Kconfig"
>  source "drivers/misc/eeprom/Kconfig"
>  source "drivers/misc/cb710/Kconfig"
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index 9abf2923d831..794447ca07ca 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -46,6 +46,7 @@ obj-$(CONFIG_VMWARE_VMCI)	+= vmw_vmci/
>  obj-$(CONFIG_LATTICE_ECP3_CONFIG)	+= lattice-ecp3-config.o
>  obj-$(CONFIG_SRAM)		+= sram.o
>  obj-$(CONFIG_SRAM_EXEC)		+= sram-exec.o
> +obj-$(CONFIG_SRAM_UAPI)		+= sram_uapi.o
>  obj-y				+= mic/
>  obj-$(CONFIG_GENWQE)		+= genwqe/
>  obj-$(CONFIG_ECHO)		+= echo/
> diff --git a/drivers/misc/sram_uapi.c b/drivers/misc/sram_uapi.c
> new file mode 100644
> index 000000000000..66c7b56b635f
> --- /dev/null
> +++ b/drivers/misc/sram_uapi.c
> @@ -0,0 +1,352 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 Vivo Communication Technology Co. Ltd.
> + * Copyright (C) 2020 Wang Wenhu <wenhu.wang@vivo.com>
> + * All rights reserved.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +#include <linux/mm.h>
> +#include <linux/fs.h>
> +#include <linux/miscdevice.h>
> +#include <linux/uaccess.h>
> +#include <linux/sram_uapi.h>
> +
> +#define DRIVER_NAME	"sram_uapi"

If you really need this, just use KBUILD_MODNAME instead.  But I don't
think you need it, as most drivers do not.


> +
> +struct res_info {
> +	phys_addr_t offset;
> +	phys_addr_t size;
> +};
> +
> +struct sram_resource {
> +	struct list_head	list;
> +	struct res_info		info;
> +	phys_addr_t		phys;
> +	void			*virt;
> +	struct vm_area_struct	*vma;
> +	struct sram_uapi	*parent;
> +};
> +
> +struct sram_uapi {
> +	struct list_head	res_list;
> +	struct sram_api		*sa;
> +};
> +
> +static DEFINE_MUTEX(sram_api_list_lock);
> +static LIST_HEAD(sram_api_list);
> +
> +long sram_api_register(struct sram_api *sa)

Why are all of these functions global?

And shouldn't this return an 'int'?

> +{
> +	struct sram_api *cur;
> +
> +	if (!sa || !sa->name || !sa->sram_alloc || !sa->sram_free)
> +		return -EINVAL;

How can any of these be true?  You control all the callers of this
function.

> +
> +	mutex_lock(&sram_api_list_lock);
> +	list_for_each_entry(cur, &sram_api_list, list) {
> +		if (cur->type == sa->type) {
> +			pr_err("error sram %s type %d exists\n", sa->name,
> +			       sa->type);
> +			mutex_unlock(&sram_api_list_lock);
> +			return -EEXIST;
> +		}
> +	}
> +
> +	kref_init(&sa->kref);

So the caller has to allocate the space and set some things up, but not
everything?  That's a mess, why not just do it either all at once with
an "allocate" like function, or just do it all in one function.  Why is
this a separate function anyway?

> +	list_add_tail(&sa->list, &sram_api_list);
> +	pr_info("sram %s type %d registered\n", sa->name, sa->type);

Don't leave debugging comments in the driver, if all goes well a driver
should be totally silent.  Only log errors.

> +
> +	mutex_unlock(&sram_api_list_lock);
> +
> +	return 0;
> +};
> +EXPORT_SYMBOL(sram_api_register);

Exported for what?  This is a stand-alone driver, nothing else uses
these symbols.

> +
> +long sram_api_unregister(struct sram_api *sa)

Why long?

> +{
> +	struct sram_api *cur, *tmp;
> +	long ret = -ENODEV;
> +
> +	if (!sa || !sa->name || !sa->sram_alloc || !sa->sram_free)
> +		return -EINVAL;

Again, how can any of this be true?

> +
> +	mutex_lock(&sram_api_list_lock);
> +	list_for_each_entry_safe(cur, tmp, &sram_api_list, list) {
> +		if (cur->type == sa->type && !strcmp(cur->name, sa->name)) {
> +			if (kref_read(&cur->kref)) {
> +				pr_err("error sram %s type %d is busy\n",
> +					sa->name, sa->type);
> +				ret = -EBUSY;
> +			} else {
> +				list_del(&cur->list);
> +				pr_info("sram %s type %d unregistered\n",
> +					sa->name, sa->type);
> +				ret = 0;
> +			}
> +			break;
> +		}
> +	}
> +	mutex_unlock(&sram_api_list_lock);
> +
> +	return ret;
> +};
> +EXPORT_SYMBOL(sram_api_unregister);
> +
> +static struct sram_api *get_sram_api_from_type(__u32 type)
> +{
> +	struct sram_api *cur;
> +
> +	mutex_lock(&sram_api_list_lock);
> +	list_for_each_entry(cur, &sram_api_list, list) {
> +		if (cur->type == type) {
> +			kref_get(&cur->kref);
> +			mutex_unlock(&sram_api_list_lock);
> +			return cur;

Document that the reference count is incremented, or someone will forget
that.


> +		}
> +	}
> +	mutex_unlock(&sram_api_list_lock);
> +
> +	return NULL;
> +}
> +
> +static void sram_uapi_res_insert(struct sram_uapi *uapi,
> +				 struct sram_resource *res)
> +{
> +	struct sram_resource *cur, *tmp;
> +	struct list_head *head = &uapi->res_list;
> +
> +	list_for_each_entry_safe(cur, tmp, head, list) {
> +		if (&tmp->list != head &&
> +		    (cur->info.offset + cur->info.size + res->info.size <=
> +		    tmp->info.offset)) {
> +			res->info.offset = cur->info.offset + cur->info.size;

This feels really odd, what are you doing here with this loop to try to
find a space and then put it in and then change the resource???


> +			res->parent = uapi;
> +			list_add(&res->list, &cur->list);
> +			return;
> +		}
> +	}
> +
> +	if (list_empty(head))
> +		res->info.offset = 0;
> +	else {
> +		tmp = list_last_entry(head, struct sram_resource, list);
> +		res->info.offset = tmp->info.offset + tmp->info.size;
> +	}
> +	list_add_tail(&res->list, head);

No locking anywhere?

> +}
> +
> +static struct sram_resource *sram_uapi_res_delete(struct sram_uapi *uapi,
> +						  struct res_info *info)
> +{
> +	struct sram_resource *res, *tmp;
> +
> +	list_for_each_entry_safe(res, tmp, &uapi->res_list, list) {
> +		if (res->info.offset == info->offset) {

Why is the offset somehow the "key" for this?

> +			list_del(&res->list);
> +			res->parent = NULL;
> +			return res;
> +		}
> +	}

No locking anywhere?

> +
> +	return NULL;
> +}
> +
> +static struct sram_resource *sram_uapi_find_res(struct sram_uapi *uapi,
> +						__u32 offset)
> +{
> +	struct sram_resource *res;
> +
> +	list_for_each_entry(res, &uapi->res_list, list) {
> +		if (res->info.offset == offset)
> +			return res;
> +	}

No lock???  No reference counting?

> +
> +	return NULL;
> +}
> +
> +static int sram_uapi_open(struct inode *inode, struct file *filp)
> +{
> +	struct sram_uapi *uapi;
> +
> +	uapi = kzalloc(sizeof(*uapi), GFP_KERNEL);
> +	if (!uapi)
> +		return -ENOMEM;
> +
> +	INIT_LIST_HEAD(&uapi->res_list);
> +	filp->private_data = uapi;
> +
> +	return 0;
> +}
> +
> +static long sram_uapi_ioctl(struct file *filp, unsigned int cmd,
> +			    unsigned long arg)
> +{
> +	struct sram_uapi *uapi = filp->private_data;
> +	struct sram_resource *res;
> +	struct res_info info;
> +	long ret = -ENOIOCTLCMD;

-ENOTTY?

> +	int size;
> +	__u32 type;
> +
> +	if (!uapi)
> +		return ret;
> +
> +	switch (cmd) {
> +	case SRAM_UAPI_IOC_SET_SRAM_TYPE:
> +		if (uapi->sa)
> +			return -EEXIST;
> +
> +		get_user(type, (const __u32 __user *)arg);
> +		uapi->sa = get_sram_api_from_type(type);
> +		if (uapi->sa)
> +			ret = 0;
> +		else
> +			ret = -ENODEV;
> +
> +		break;

Why does userspace have to set the type of sram?


> +
> +	case SRAM_UAPI_IOC_ALLOC:
> +		if (!uapi->sa)
> +			return -EINVAL;
> +
> +		res = kzalloc(sizeof(*res), GFP_KERNEL);
> +		if (!res)
> +			return -ENOMEM;
> +
> +		size = copy_from_user((void *)&res->info,
> +				      (const void __user *)arg,
> +				      sizeof(res->info));
> +		if (!PAGE_ALIGNED(res->info.size) || !res->info.size)
> +			return -EINVAL;
> +
> +		res->virt = (void *)uapi->sa->sram_alloc(res->info.size,
> +							 &res->phys,
> +							 PAGE_SIZE);

Look ma, userspace just allocated as much memory as it asked for!

Remember, all input is evil, check everything.

And, as is obvious now, this isn't really a "driver", it's a shim layer
for something else.  Who sets up sram_alloc()?

> +		if (!res->virt) {
> +			kfree(res);
> +			return -ENOMEM;
> +		}
> +
> +		sram_uapi_res_insert(uapi, res);
> +		size = copy_to_user((void __user *)arg,
> +				    (const void *)&res->info,
> +				    sizeof(res->info));

an alloc function copies a bunch of memory to userspace????

You need to document the heck out of this new interface as it really
does not make sense to me, sorry.

> +
> +		ret = 0;
> +		break;
> +
> +	case SRAM_UAPI_IOC_FREE:
> +		if (!uapi->sa)
> +			return -EINVAL;
> +
> +		size = copy_from_user((void *)&info, (const void __user *)arg,
> +				      sizeof(info));
> +
> +		res = sram_uapi_res_delete(uapi, &info);
> +		if (!res) {
> +			pr_err("error no sram resource found\n");
> +			return -EINVAL;
> +		}
> +
> +		uapi->sa->sram_free(res->virt);
> +		kfree(res);

Two step delete function with locking at all?  Ugh :(


> +
> +		ret = 0;
> +		break;
> +
> +	default:
> +		pr_err("error no cmd not supported\n");
> +		break;

Userspace now can spam the kernel log, do not do that.

> +	}
> +
> +	return ret;
> +}
> +
> +static int sram_uapi_mmap(struct file *filp, struct vm_area_struct *vma)
> +{
> +	struct sram_uapi *uapi = filp->private_data;
> +	struct sram_resource *res;
> +
> +	res = sram_uapi_find_res(uapi, vma->vm_pgoff);
> +	if (!res)
> +		return -EINVAL;
> +
> +	if (vma->vm_end - vma->vm_start > res->info.size)
> +		return -EINVAL;
> +
> +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> +
> +	return remap_pfn_range(vma, vma->vm_start,
> +			       res->phys >> PAGE_SHIFT,
> +			       vma->vm_end - vma->vm_start,
> +			       vma->vm_page_prot);
> +}
> +
> +static void sram_uapi_res_release(struct sram_uapi *uapi)
> +{
> +	struct sram_resource *res, *tmp;
> +
> +	list_for_each_entry_safe(res, tmp, &uapi->res_list, list) {
> +		list_del(&res->list);
> +		uapi->sa->sram_free(res->virt);
> +		kfree(res);
> +	}
> +}
> +
> +static int sram_uapi_release(struct inode *inodp, struct file *filp)
> +{
> +	struct sram_uapi *uapi = filp->private_data;
> +
> +	sram_uapi_res_release(uapi);
> +	if (uapi->sa)
> +		kref_put(&uapi->sa->kref, NULL);

Um, hm, how do I put this nicely.

Wow, this is wrong.  So so so so so so wrong.

There's documentation in the kernel tree about how wrong this is.  The
kernel itself will warn you about how wrong this is.  Actually, no, it
will just crash.  If this function ever gets called your kernel just
blew up, so you really really really did not test this code at all.

{sigh}

Someone owes me a new bottle of whisky, this one is about to be empty...




> +
> +	kfree(uapi);
> +
> +	return 0;
> +}
> +
> +static const struct file_operations sram_uapi_ops = {
> +	.owner		= THIS_MODULE,
> +	.open		= sram_uapi_open,
> +	.unlocked_ioctl = sram_uapi_ioctl,
> +	.compat_ioctl	= compat_ptr_ioctl,
> +	.mmap		= sram_uapi_mmap,
> +	.release	= sram_uapi_release,
> +};
> +
> +static struct miscdevice sram_uapi_miscdev = {
> +	MISC_DYNAMIC_MINOR,
> +	"sram",
> +	&sram_uapi_ops,

named identifiers please, this isn't the 1980's.

> +};
> +
> +static int __init sram_uapi_init(void)
> +{
> +	int ret;
> +
> +	INIT_LIST_HEAD(&sram_api_list);

Why do you need a static list?

> +	mutex_init(&sram_api_list_lock);

Why do you need a static lock?

> +
> +	ret = misc_register(&sram_uapi_miscdev);
> +	if (ret)
> +		pr_err("failed to register sram uapi misc device\n");

No need for the error, don't be noisy.

> +
> +	return ret;
> +}
> +
> +static void __exit sram_uapi_exit(void)
> +{
> +	misc_deregister(&sram_uapi_miscdev);
> +}
> +
> +module_init(sram_uapi_init);
> +module_exit(sram_uapi_exit);

drop the crazy static list and lock (again, this isn't the 1990's), and
you can get rid of the module_init/exit stuff too and just use a single
line to register the misc device.

Meta-comment here, you are trying to create a driver with a new api, but
you have no real users of this api, so no one knows if this really is
the correct api at all.  That's not ok, especially for one that is
purporting to be so "generic" as to claim it is a sram driver for
everyone.




> +
> +MODULE_AUTHOR("Wang Wenhu <wenhu.wang@vivo.com>");
> +MODULE_DESCRIPTION("SRAM User API Driver");
> +MODULE_ALIAS("platform:" DRIVER_NAME);
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/sram_uapi.h b/include/linux/sram_uapi.h
> new file mode 100644
> index 000000000000..50fbf9dc308f
> --- /dev/null
> +++ b/include/linux/sram_uapi.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __SRAM_UAPI_H
> +#define __SRAM_UAPI_H
> +
> +/* Set SRAM type to be accessed */
> +#define SRAM_UAPI_IOC_SET_SRAM_TYPE	_IOW('S', 0, __u32)
> +
> +/* Allocate resource from SRAM */
> +#define SRAM_UAPI_IOC_ALLOC		_IOWR('S', 1, struct res_info)
> +
> +/* Free allocated resource of SRAM */
> +#define SRAM_UAPI_IOC_FREE		_IOW('S', 2, struct res_info)
> +
> +struct sram_api {
> +	struct list_head	list;
> +	struct kref		kref;
> +	__u32			type;
> +	const char		*name;
> +
> +	long (*sram_alloc)(__u32 size, phys_addr_t *phys, __u32 align);
> +	void (*sram_free)(void *ptr);
> +};

Why is this structure in a uapi header file?

Oh wait, this isn't a uapi header file, this thing doesn't work at all.

ugh, this needs _so_ much work.

And again, someone owes me more whisky....

greg k-h
