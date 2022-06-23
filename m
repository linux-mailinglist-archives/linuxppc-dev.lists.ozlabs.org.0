Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AF25575FC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 10:55:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTDbW05S7z3c97
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 18:55:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=V5FagiNQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=V5FagiNQ;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTDZv4gbyz3blX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 18:54:30 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BDBA6B82206;
	Thu, 23 Jun 2022 08:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8843C3411B;
	Thu, 23 Jun 2022 08:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1655974465;
	bh=53VjtG3sK4phU2SMSC2bl9AUDChPlVTKSBbfz22Eeto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V5FagiNQRRaGwBs5DXgIDrEytvCZ2Un/5qZYyH3is021RS5vAFJEe3cabYAaRjaYJ
	 PL6OXNhhhGeQRwOcjSDwN4X+9c5MiYG+Rdh1us1qSEsNuEMzwDIwHQN4WS7lxKuCKn
	 USd+DvTpWc3hb++hC/pMpNfzXusSKVKRQ9SVmUxM=
Date: Thu, 23 Jun 2022 10:54:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nayna Jain <nayna@linux.ibm.com>
Subject: Re: [RFC PATCH v2 2/3] fs: define a firmware security filesystem
 named fwsecurityfs
Message-ID: <YrQqPhi4+jHZ1WJc@kroah.com>
References: <20220622215648.96723-1-nayna@linux.ibm.com>
 <20220622215648.96723-3-nayna@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622215648.96723-3-nayna@linux.ibm.com>
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
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, Dov Murik <dovmurik@linux.ibm.com>, Dave Hansen <dave.hansen@intel.com>, linux-security-module <linux-security-module@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linux-fsdevel@vger.kernel.org, George Wilson <gcwilson@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, gjoyce@ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 22, 2022 at 05:56:47PM -0400, Nayna Jain wrote:
> securityfs is meant for linux security subsystems to expose policies/logs
> or any other information. However, there are various firmware security
> features which expose their variables for user management via kernel.
> There is currently no single place to expose these variables. Different
> platforms use sysfs/platform specific filesystem(efivarfs)/securityfs
> interface as find appropriate. Thus, there is a gap in kernel interfaces
> to expose variables for security features.
> 
> Define a firmware security filesystem (fwsecurityfs) to be used for
> exposing variables managed by firmware and to be used by firmware
> enabled security features. These variables are platform specific.
> Filesystem provides platforms to implement their own underlying
> semantics by defining own inode and file operations.
> 
> Similar to securityfs, the firmware security filesystem is recommended
> to be exposed on a well known mount point /sys/firmware/security.
> Platforms can define their own directory or file structure under this path.
> 
> Example:
> 
> # mount -t fwsecurityfs fwsecurityfs /sys/firmware/security
> 
> # cd /sys/firmware/security/
> 
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> ---
>  fs/Kconfig                   |   1 +
>  fs/Makefile                  |   1 +
>  fs/fwsecurityfs/Kconfig      |  14 +++
>  fs/fwsecurityfs/Makefile     |  10 +++
>  fs/fwsecurityfs/inode.c      | 159 +++++++++++++++++++++++++++++++++++
>  fs/fwsecurityfs/internal.h   |  13 +++
>  fs/fwsecurityfs/super.c      | 154 +++++++++++++++++++++++++++++++++
>  include/linux/fwsecurityfs.h |  29 +++++++
>  include/uapi/linux/magic.h   |   1 +
>  9 files changed, 382 insertions(+)
>  create mode 100644 fs/fwsecurityfs/Kconfig
>  create mode 100644 fs/fwsecurityfs/Makefile
>  create mode 100644 fs/fwsecurityfs/inode.c
>  create mode 100644 fs/fwsecurityfs/internal.h
>  create mode 100644 fs/fwsecurityfs/super.c
>  create mode 100644 include/linux/fwsecurityfs.h
> 
> diff --git a/fs/Kconfig b/fs/Kconfig
> index 5976eb33535f..19ea28143428 100644
> --- a/fs/Kconfig
> +++ b/fs/Kconfig
> @@ -276,6 +276,7 @@ config ARCH_HAS_GIGANTIC_PAGE
>  
>  source "fs/configfs/Kconfig"
>  source "fs/efivarfs/Kconfig"
> +source "fs/fwsecurityfs/Kconfig"
>  
>  endmenu
>  
> diff --git a/fs/Makefile b/fs/Makefile
> index 208a74e0b00e..5792cd0443cb 100644
> --- a/fs/Makefile
> +++ b/fs/Makefile
> @@ -137,6 +137,7 @@ obj-$(CONFIG_F2FS_FS)		+= f2fs/
>  obj-$(CONFIG_CEPH_FS)		+= ceph/
>  obj-$(CONFIG_PSTORE)		+= pstore/
>  obj-$(CONFIG_EFIVAR_FS)		+= efivarfs/
> +obj-$(CONFIG_FWSECURITYFS)		+= fwsecurityfs/
>  obj-$(CONFIG_EROFS_FS)		+= erofs/
>  obj-$(CONFIG_VBOXSF_FS)		+= vboxsf/
>  obj-$(CONFIG_ZONEFS_FS)		+= zonefs/
> diff --git a/fs/fwsecurityfs/Kconfig b/fs/fwsecurityfs/Kconfig
> new file mode 100644
> index 000000000000..f1665511eeb9
> --- /dev/null
> +++ b/fs/fwsecurityfs/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Copyright (C) 2022 IBM Corporation
> +# Author: Nayna Jain <nayna@linux.ibm.com>
> +#
> +
> +config FWSECURITYFS
> +	bool "Enable the fwsecurityfs filesystem"
> +	help
> +	  This will build the fwsecurityfs file system which is recommended
> +	  to be mounted on /sys/firmware/security. This can be used by
> +	  platforms to expose their variables which are managed by firmware.
> +
> +	  If you are unsure how to answer this question, answer N.
> diff --git a/fs/fwsecurityfs/Makefile b/fs/fwsecurityfs/Makefile
> new file mode 100644
> index 000000000000..b9931d180178
> --- /dev/null
> +++ b/fs/fwsecurityfs/Makefile
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Copyright (C) 2022 IBM Corporation
> +# Author: Nayna Jain <nayna@linux.ibm.com>
> +#
> +# Makefile for the firmware security filesystem
> +
> +obj-$(CONFIG_FWSECURITYFS)		+= fwsecurityfs.o
> +
> +fwsecurityfs-objs			:= inode.o super.o
> diff --git a/fs/fwsecurityfs/inode.c b/fs/fwsecurityfs/inode.c
> new file mode 100644
> index 000000000000..5d06dc0de059
> --- /dev/null
> +++ b/fs/fwsecurityfs/inode.c
> @@ -0,0 +1,159 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2022 IBM Corporation
> + * Author: Nayna Jain <nayna@linux.ibm.com>
> + */
> +
> +#include <linux/sysfs.h>
> +#include <linux/kobject.h>
> +#include <linux/fs.h>
> +#include <linux/fs_context.h>
> +#include <linux/mount.h>
> +#include <linux/pagemap.h>
> +#include <linux/init.h>
> +#include <linux/namei.h>
> +#include <linux/security.h>
> +#include <linux/lsm_hooks.h>
> +#include <linux/magic.h>
> +#include <linux/ctype.h>
> +#include <linux/fwsecurityfs.h>
> +
> +#include "internal.h"
> +
> +int fwsecurityfs_remove_file(struct dentry *dentry)
> +{
> +	drop_nlink(d_inode(dentry));
> +	dput(dentry);
> +	return 0;
> +};
> +EXPORT_SYMBOL_GPL(fwsecurityfs_remove_file);
> +
> +int fwsecurityfs_create_file(const char *name, umode_t mode,
> +					u16 filesize, struct dentry *parent,
> +					struct dentry *dentry,
> +					const struct file_operations *fops)
> +{
> +	struct inode *inode;
> +	int error;
> +	struct inode *dir;
> +
> +	if (!parent)
> +		return -EINVAL;
> +
> +	dir = d_inode(parent);
> +	pr_debug("securityfs: creating file '%s'\n", name);

Did you forget to call simple_pin_fs() here or anywhere else?

And this can be just one function with the directory creation file, just
check the mode and you will be fine.  Look at securityfs as an example
of how to make this simpler.

> diff --git a/fs/fwsecurityfs/super.c b/fs/fwsecurityfs/super.c

super.c and inode.c can be in the same file, these are tiny, just make
one file for the filesystem logic.

thanks,

greg k-h
