Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0410D7122
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 10:36:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46spg442LqzDqyn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 19:36:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46spcw6JchzDqmb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 19:34:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JdW5VUSN"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46spcw5NJwz8tD1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 19:34:24 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46spcw4Zrqz9sPV; Tue, 15 Oct 2019 19:34:24 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JdW5VUSN"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46spcv458xz9sNx;
 Tue, 15 Oct 2019 19:34:23 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id e13so3478586pga.7;
 Tue, 15 Oct 2019 01:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=Oqe+yUr4kBIfQ9o7ODH/wgbF6SDl/Zvmj+Ww9PRoERU=;
 b=JdW5VUSNaOfTyDzUrsz2qRxHaIFBBkjPzE1pIBGucxnNygvlYt7oCSLcOXWe0/CMjw
 SflRwK4X9eAZPcDfXEjfBKgHos0S8ckakGoMMT7Da0VlDzPKvC+QNxvzNZq3l2T3cwyS
 4NCB0wzlpDOPc1xfYhEy1+P065cph+MdP7UXAp8g5sfKwdmgKljJ/E+QBOmnrVJlgsVX
 lBEkvSNkaKE1CChka46KISEXMWvW8VPwZnQU1yCuA9O7zlLz0yJI4I/bVLeS2H7aI8WU
 wzO9y6sxpFpuBGIKYa0kDOSGA0Qunugnz0wxKh6HoeHyLrC9sYhkQci9msUU9VxxvipO
 6uGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Oqe+yUr4kBIfQ9o7ODH/wgbF6SDl/Zvmj+Ww9PRoERU=;
 b=r8+/NlrtBMveYc9H6cPO2YcCdanZ26YZ6h0n46QrBnYbCSygtq7brrH5pujyPiVJG/
 kjLw68wacJS2f4kGtqUBOnt4w/fD+uGMKlsBNJ+LQx+gNBE8hayx2GxpnirAjidAutuu
 SCVDj/t7Ti19DYVcAkDjKmp+0ovsqGbXFvEd8hn7XqZNa5grWOpO8Rz+oPaNqYNBfiLO
 WLAhxF+ljSPZv3n5wZXmhrqOBcN3jJdcu7ZeXyHO/D9iGBfcE23YXJYO8BoI6stKrAXV
 kPWzW23rDD04X0caOBFxug8faCXhplhuu4wFE1t0ytv4cB4fSFLk7wSqQUKgMFTz3J20
 BBGA==
X-Gm-Message-State: APjAAAVMY3KMc2edAs7IanU6RRzpK9KidcoTweRigoOAR74Tiw7fGQks
 jFizpB5lx++UlAw8K7/vugE=
X-Google-Smtp-Source: APXvYqyAJo9YipajVt6tPVUd4Zm8v5RqUoySH4V3et0tmFYcEDVWJjHZrSWQujoVjIc8gl3CpRxtyQ==
X-Received: by 2002:a62:750d:: with SMTP id q13mr36132376pfc.58.1571128461213; 
 Tue, 15 Oct 2019 01:34:21 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id z3sm24294119pjd.25.2019.10.15.01.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 01:34:20 -0700 (PDT)
Message-ID: <1884e9c2f2021cecca9a4ca4b427e5fe0534f00e.camel@gmail.com>
Subject: Re: [PATCH v4 2/4] powerpc: expose secure variables to userspace
 via sysfs
From: Oliver O'Halloran <oohall@gmail.com>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org, 
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
Date: Tue, 15 Oct 2019 19:34:12 +1100
In-Reply-To: <1569973311-3047-3-git-send-email-nayna@linux.ibm.com>
References: <1569973311-3047-1-git-send-email-nayna@linux.ibm.com>
 <1569973311-3047-3-git-send-email-nayna@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-10-01 at 19:41 -0400, Nayna Jain wrote:
> PowerNV secure variables, which store the keys used for OS kernel
> verification, are managed by the firmware. These secure variables need to
> be accessed by the userspace for addition/deletion of the certificates.
> 
> This patch adds the sysfs interface to expose secure variables for PowerNV
> secureboot. The users shall use this interface for manipulating
> the keys stored in the secure variables.
> 
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  Documentation/ABI/testing/sysfs-secvar |  37 +++++
>  arch/powerpc/Kconfig                   |  10 ++
>  arch/powerpc/kernel/Makefile           |   1 +
>  arch/powerpc/kernel/secvar-sysfs.c     | 198 +++++++++++++++++++++++++
>  4 files changed, 246 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-secvar
>  create mode 100644 arch/powerpc/kernel/secvar-sysfs.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-secvar b/Documentation/ABI/testing/sysfs-secvar
> new file mode 100644
> index 000000000000..815bd8ec4d5e
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-secvar
> @@ -0,0 +1,37 @@
> +What:		/sys/firmware/secvar
> +Date:		August 2019
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	This directory is created if the POWER firmware supports OS
> +		secureboot, thereby secure variables. It exposes interface
> +		for reading/writing the secure variables
> +
> +What:		/sys/firmware/secvar/vars
> +Date:		August 2019
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	This directory lists all the secure variables that are supported
> +		by the firmware.
> +
> +What:		/sys/firmware/secvar/vars/<variable name>
> +Date:		August 2019
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	Each secure variable is represented as a directory named as
> +		<variable_name>. The variable name is unique and is in ASCII
> +		representation. The data and size can be determined by reading
> +		their respective attribute files.
> +
> +What:		/sys/firmware/secvar/vars/<variable_name>/size
> +Date:		August 2019
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	An integer representation of the size of the content of the
> +		variable. In other words, it represents the size of the data.
> +
> +What:		/sys/firmware/secvar/vars/<variable_name>/data
> +Date:		August 2019
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	A read-only file containing the value of the variable
> +
> +What:		/sys/firmware/secvar/vars/<variable_name>/update
> +Date:		August 2019
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	A write-only file that is used to submit the new value for the
> +		variable.

How are the update mechanism's weird requirements communicated to
userspace? The design you've got for the OPAL bits is that the update
requirements depends on the secvar backend, but I see nothing plumbing
through what the secvar backend actually is.

> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index deb19ec6ba3d..89084e4e5054 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -946,6 +946,16 @@ config PPC_SECURE_BOOT
>  	  to enable OS secure boot on systems that have firmware support for
>  	  it. If in doubt say N.
>  
> +config SECVAR_SYSFS
that should probably be PPC_SECVAR_SYSFS since it's PPC specific

> +	tristate "Enable sysfs interface for POWER secure variables"
> +	depends on PPC_SECURE_BOOT
> +	depends on SYSFS
> +	help
> +	  POWER secure variables are managed and controlled by firmware.
> +	  These variables are exposed to userspace via sysfs to enable
> +	  read/write operations on these variables. Say Y if you have
> +	  secure boot enabled and want to expose variables to userspace.
> +
>  endmenu
>  
>  config ISA_DMA_API
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 3cf26427334f..116a3a5c0557 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -162,6 +162,7 @@ obj-y				+= ucall.o
>  endif
>  
>  obj-$(CONFIG_PPC_SECURE_BOOT)	+= secure_boot.o ima_arch.o secvar-ops.o
> +obj-$(CONFIG_SECVAR_SYSFS)	+= secvar-sysfs.o
>  
>  # Disable GCOV, KCOV & sanitizers in odd or sensitive code
>  GCOV_PROFILE_prom_init.o := n


> diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
> new file mode 100644
> index 000000000000..87a7cea41523
> --- /dev/null
> +++ b/arch/powerpc/kernel/secvar-sysfs.c
> @@ -0,0 +1,198 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2019 IBM Corporation <nayna@linux.ibm.com>
> + *
> + * This code exposes secure variables to user via sysfs
> + */

Adding a pr_fmt for this file would be a good idea. There's a few
pr_err()s in here that would benefit from some context.

> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/compat.h>
> +#include <linux/string.h>
> +#include <asm/secvar.h>

> +/*
> + * Since firmware checks the maximum allowed size, currently, it is default to
> + * 0. In future, it will be read from the device tree.
> + */
> +#define VARIABLE_MAX_SIZE  0

I don't see why you aren't reading it from the DT now...

> +/* Approximate value */
> +#define NAME_MAX_SIZE	   1024

Approximate?

> +static struct kobject *secvar_kobj;
> +static struct kset *secvar_kset;
> +
> +static ssize_t size_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	uint64_t dsize;
> +	int rc;
> +
> +	rc = secvar_ops->get(kobj->name, strlen(kobj->name) + 1, NULL, &dsize);
> +	if (rc) {
> +		pr_err("Error retrieving variable size %d\n", rc);
> +		return rc;
> +	}
> +
> +	rc = sprintf(buf, "%llu\n", dsize);
> +
> +	return rc;
> +}
> +
> +static ssize_t data_read(struct file *filep, struct kobject *kobj,
> +			 struct bin_attribute *attr, char *buf, loff_t off,
> +			 size_t count)
> +{
> +	uint64_t dsize;
> +	int rc;
> +	char *data;

Can you swap the declarations of rc and data.

We try to keep declarations in reverse christmas tree style in
arch/powerpc/. We're pretty bad at enforcing that, but there's no
reason to be gratuitiously different.

> +
> +	rc = secvar_ops->get(kobj->name, strlen(kobj->name) + 1, NULL, &dsize);
> +	if (rc) {
> +		pr_err("Error getting variable size %d\n", rc);
> +		return rc;
> +	}
> +	pr_debug("dsize is %llu\n", dsize);
> +
> +	data = kzalloc(dsize, GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	rc = secvar_ops->get(kobj->name, strlen(kobj->name)+1, data, &dsize);
> +	if (rc) {
> +		pr_err("Error getting variable %d\n", rc);
> +		goto data_fail;
> +	}
> +
> +	rc = memory_read_from_buffer(buf, count, &off, data, dsize);
> +
> +data_fail:
> +	kfree(data);
> +	return rc;
> +}
> +
> +static ssize_t update_write(struct file *filep, struct kobject *kobj,
> +			    struct bin_attribute *attr, char *buf, loff_t off,
> +			    size_t count)
> +{
> +	int rc;
> +
> +	pr_debug("count is %ld\n", count);
> +	rc = secvar_ops->set(kobj->name, strlen(kobj->name)+1, buf, count);
> +	if (rc) {
> +		pr_err("Error setting the variable %s\n", kobj->name);
> +		return rc;
> +	}
> +
> +	return count;
> +}
> +

> +static struct kobj_attribute size_attr = __ATTR_RO(size);
> +
> +static struct bin_attribute data_attr = __BIN_ATTR_RO(data, VARIABLE_MAX_SIZE);
> +
> +static struct bin_attribute update_attr = __BIN_ATTR_WO(update,
> +							VARIABLE_MAX_SIZE);

Isn't this going to be all wrong if VARIABLE_MAX_SIZE is ever non-zero?

> +
> +static struct bin_attribute  *secvar_bin_attrs[] = {
> +	&data_attr,
> +	&update_attr,
> +	NULL,
> +};
> +
> +static struct attribute *secvar_attrs[] = {
> +	&size_attr.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group secvar_attr_group = {
> +	.attrs = secvar_attrs,
> +	.bin_attrs = secvar_bin_attrs,
> +};
> +__ATTRIBUTE_GROUPS(secvar_attr);
> +
> +static struct kobj_type secvar_ktype = {
> +	.sysfs_ops	= &kobj_sysfs_ops,
> +	.default_groups = secvar_attr_groups,
> +};
> +
> +static int secvar_sysfs_load(void)
> +{
> +	char *name;
> +	uint64_t namesize = 0;
> +	struct kobject *kobj;
> +	int rc;
> +
> +	name = kzalloc(NAME_MAX_SIZE, GFP_KERNEL);
> +	if (!name)
> +		return -ENOMEM;
> +
> +	do {
> +		rc = secvar_ops->get_next(name, &namesize, NAME_MAX_SIZE);
> +		if (rc) {
> +			if (rc != -ENOENT)
> +				pr_err("error getting secvar from firmware %d\n",
> +					rc);
> +			break;
> +		}
> +
> +		kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
> +		if (!kobj)
> +			return -ENOMEM;
> +
> +		kobject_init(kobj, &secvar_ktype);
> +
> +		rc = kobject_add(kobj, &secvar_kset->kobj, "%s", name);
> +		if (rc) {
> +			pr_warn("kobject_add error %d for attribute: %s\n", rc,
> +				name);
> +			kobject_put(kobj);
> +			kobj = NULL;
> +		}
> +
> +		if (kobj)
> +			kobject_uevent(kobj, KOBJ_ADD);
> +
> +	} while (!rc);
> +
> +	kfree(name);
> +	return rc;
> +}
> +
> +static int secvar_sysfs_init(void)
> +{
> +	if (!secvar_ops) {
> +		pr_warn("secvar: failed to retrieve secvar operations.\n");
> +		return -ENODEV;
> +	}
> +
> +	secvar_kobj = kobject_create_and_add("secvar", firmware_kobj);
> +	if (!secvar_kobj) {
> +		pr_err("secvar: Failed to create firmware kobj\n");
> +		return -ENOMEM;
> +	}
> +
> +	secvar_kset = kset_create_and_add("vars", NULL, secvar_kobj);
> +	if (!secvar_kset) {
> +		pr_err("secvar: sysfs kobject registration failed.\n");
> +		kobject_put(secvar_kobj);
> +		return -ENOMEM;
> +	}
> +
> +	secvar_sysfs_load();
> +
> +	return 0;
> +}
> +
> +static void secvar_sysfs_exit(void)
> +{
> +	kset_unregister(secvar_kset);
> +	kobject_put(secvar_kobj);
> +}
> +
> +module_init(secvar_sysfs_init);
> +module_exit(secvar_sysfs_exit);
> +
> +MODULE_AUTHOR("Nayna Jain <nayna@linux.ibm.com>");
> +MODULE_DESCRIPTION("sysfs interface to POWER secure variables");
> +MODULE_LICENSE("GPL");

Is there anything that'll force the module to be loaded at runtime?

If not it might be worth making this builtin and turning the OPAL API
bit into a platform device driver. We can instantiate a platform device
from the DT node during opal_init() and the modalias based module
loading should handle the rest for you.

I would like to get people using platform device drivers for random
OPAL provided stuff. All the ~artisinal~hand~crafted~ device-tree
parsing in the powernv platform is getting a bit ridiculous...

Oliver

