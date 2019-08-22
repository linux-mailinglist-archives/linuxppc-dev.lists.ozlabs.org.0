Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5723B98AD1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 07:20:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DXsc4nw7zDr7Q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 15:20:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DXqy5t2ZzDqRn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 15:18:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="e7vWV5uD"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46DXqx2NVcz8tTC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 15:18:37 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46DXqx1q2Xz9sML; Thu, 22 Aug 2019 15:18:37 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="e7vWV5uD"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46DXqw3GSpz9s7T;
 Thu, 22 Aug 2019 15:18:34 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id e11so2800144pga.5;
 Wed, 21 Aug 2019 22:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=iXHNUccWqFsxDsUpEA4HFgfiuRoSIsxb+X2sAiYxRTk=;
 b=e7vWV5uDWAhyQNNIHSNsC9RR7as+xpmRdW3F4zNo/fcykfjsq0/qaVSv6cHTGjye8/
 8L68/iWvnNkEin/Lab4aT5ssrdor5mVkgYZuQNJXkB2rbjB6DRVanfzaUkwZ7k0TxWDs
 VRAJewy0wOe/M6lnUe3s8W9MRFxma2+u1/f3mvqI3snQEPZGbyfCMNlgr02jucPnJIBA
 Hel5Ib7ZEbz4M70oo50xHMqxAXHvzNHsRk0Xejllr4WyXhPt29lKxw4frKrAsf3LG3Al
 LdFyNAP37TKnIx1lGi5Ek1ZqKdKgs0H6z7IpvzyR0svz6DvGmwfk9llG42A71ZKL/EbE
 uphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=iXHNUccWqFsxDsUpEA4HFgfiuRoSIsxb+X2sAiYxRTk=;
 b=OeZc1ncE9PGKSrcTnAYnCziaQeleNXtn58XB/I0b3sBw9c1FS1QqC9rFn+N2hu+bEI
 ZJbI6ZNfCubnupcXXXvnLRTEhW7kauebmONmLmoAwsxnpoy8lX2uXWSTdYb40Os3I9l0
 ChBmgzz8T3/zT6dJmYj+VIMOEuwbjd0j+HVmUOzbNErJhD7NNN1Vha7qSXUhjuW60nbz
 qezzFBYnKQOM7WchwGuevz9IvqD0l+o6qamdzAAeUzOIcUH4SiKQnSRwIQnSvH/CrkdT
 1rfuFKfEY0CS1xI1TcbJExUi96T0BxDEkxbZA8mpjrJ8LUPzoL6ahylwoOK/rQyaxXXM
 kPOg==
X-Gm-Message-State: APjAAAVwbfeO49uMfA7nwkD+ktR7h76m7CT31bB82W9xAF2P8Uhm0lrn
 z4/mbr9zSxElFqk6QqGG+ZM=
X-Google-Smtp-Source: APXvYqyAGqb/LU7PAogJtMNpNOTBuRVQDjjsalnYDNzZv6RnYRVYukBbxuxf3taPJrNsuQqyBxJv+w==
X-Received: by 2002:a63:b46:: with SMTP id a6mr32689753pgl.235.1566451112386; 
 Wed, 21 Aug 2019 22:18:32 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id j6sm42686111pfg.158.2019.08.21.22.18.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 22:18:31 -0700 (PDT)
Message-ID: <23135466fc524a13cd76532ec59f84de51152a1c.camel@gmail.com>
Subject: Re: [PATCH v2 2/4] powerpc: expose secure variables to userspace
 via sysfs
From: Oliver O'Halloran <oohall@gmail.com>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org, 
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
Date: Thu, 22 Aug 2019 15:18:23 +1000
In-Reply-To: <1566400103-18201-3-git-send-email-nayna@linux.ibm.com>
References: <1566400103-18201-1-git-send-email-nayna@linux.ibm.com>
 <1566400103-18201-3-git-send-email-nayna@linux.ibm.com>
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

On Wed, 2019-08-21 at 11:08 -0400, Nayna Jain wrote:
> PowerNV secure variables, which store the keys used for OS kernel
> verification, are managed by the firmware. These secure variables need to
> be accessed by the userspace for addition/deletion of the certificates.
> 
> This patch adds the sysfs interface to expose secure variables for PowerNV
> secureboot. The users shall use this interface for manipulating
> the keys stored in the secure variables.
> 
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> ---
>  Documentation/ABI/testing/sysfs-secvar |  27 ++++
>  arch/powerpc/Kconfig                   |   9 ++
>  arch/powerpc/kernel/Makefile           |   1 +
>  arch/powerpc/kernel/secvar-sysfs.c     | 210 +++++++++++++++++++++++++
>  4 files changed, 247 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-secvar
>  create mode 100644 arch/powerpc/kernel/secvar-sysfs.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-secvar b/Documentation/ABI/testing/sysfs-secvar
> new file mode 100644
> index 000000000000..68f0e03d873d
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-secvar
> @@ -0,0 +1,27 @@
> +What:		/sys/firmware/secvar
> +Date:		August 2019
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:
> +		This directory exposes interfaces for interacting with
> +		the secure variables managed by OPAL firmware.
> +
> +		This is only for the powerpc/powernv platform.
> +
> +		Directory:
> +		vars:		This directory lists all the variables that
> +				are supported by the OPAL. The variables are
> +				represented in the form of directories with
> +				their variable names. The variable name is
> +				unique and is in ASCII representation. The data
> +				and size can be determined by reading their
> +				respective attribute files.
> +
> +		Each variable directory has the following files:
> +		name:		An ASCII representation of the variable name
> +		data:		A read-only file containing the value of the
> +				variable
> +		size:		An integer representation of the size of the
> +				content of the variable. In other works, it
> +				represents the size of the data
> +		update:		A write-only file that is used to submit the new
> +				value for the variable.
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 42109682b727..b4bdf77837b2 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -925,6 +925,15 @@ config PPC_SECURE_BOOT
>  	  allows user to enable OS Secure Boot on PowerPC systems that
>  	  have firmware secure boot support.
>  
> +config SECVAR_SYSFS
> +        tristate "Enable sysfs interface for POWER secure variables"
> +        depends on PPC_SECURE_BOOT
> +        help
> +          POWER secure variables are managed and controlled by firmware.
> +          These variables are exposed to userspace via sysfs to enable
> +          read/write operations on these variables. Say Y if you have
> +	  secure boot enabled and want to expose variables to userspace.
> +
>  endmenu
>  
>  config ISA_DMA_API
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 9041563f1c74..4ea7b738c3a3 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -158,6 +158,7 @@ obj-$(CONFIG_EPAPR_PARAVIRT)	+= epapr_paravirt.o epapr_hcalls.o
>  obj-$(CONFIG_KVM_GUEST)		+= kvm.o kvm_emul.o
>  
>  obj-$(CONFIG_PPC_SECURE_BOOT)	+= secboot.o ima_arch.o secvar-ops.o
> +obj-$(CONFIG_SECVAR_SYSFS)     += secvar-sysfs.o
>  
>  # Disable GCOV, KCOV & sanitizers in odd or sensitive code
>  GCOV_PROFILE_prom_init.o := n
> diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
> new file mode 100644
> index 000000000000..e46986bb29a0
> --- /dev/null
> +++ b/arch/powerpc/kernel/secvar-sysfs.c
> @@ -0,0 +1,210 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2019 IBM Corporation <nayna@linux.ibm.com>
> + *
> + * This code exposes secure variables to user via sysfs
> + */
> +
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/compat.h>
> +#include <linux/string.h>
> +#include <asm/opal.h>
> +#include <asm/secvar.h>
> +
> +//Approximating it for now, it is bound to change.
> +#define VARIABLE_MAX_SIZE  32000

this needs to be communicated from the secvar backend, maybe via a
field in the ops structure?

> +
> +static struct kobject *powerpc_kobj;
Call it secvar_kobj or something.

> +static struct secvar_operations *secvarops;
Ah, the old I-can't-believe-it's-not-global trick.

> +struct kset *secvar_kset;
shouldn't that be static too?

> +
> +static ssize_t name_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	return sprintf(buf, "%s", kobj->name);
> +}
> +
> +static ssize_t size_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	unsigned long dsize;
> +	int rc;
> +
> +	rc = secvarops->get_variable(kobj->name, strlen(kobj->name) + 1, NULL,
> +				     &dsize);
> +	if (rc) {
> +		pr_err("Error retrieving variable size %d\n", rc);
> +		return rc;
> +	}
> +
> +	rc = sprintf(buf, "%ld", dsize);
> +
> +	return rc;
> +}
> +
> +static ssize_t data_read(struct file *filep, struct kobject *kobj,
> +			 struct bin_attribute *attr, char *buf, loff_t off,
> +			 size_t count)
> +{
> +	unsigned long dsize;
> +	int rc;
> +	char *data;
> +
> +	rc = secvarops->get_variable(kobj->name, strlen(kobj->name) + 1, NULL,
> +				     &dsize);
> +	if (rc) {
> +		pr_err("Error getting variable size %d\n", rc);
> +		return rc;
> +	}
> +	pr_debug("dsize is %ld\n", dsize);
> +
> +	data = kzalloc(dsize, GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	rc = secvarops->get_variable(kobj->name, strlen(kobj->name)+1, data,
> +				     &dsize);
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
> +	rc = secvarops->set_variable(kobj->name, strlen(kobj->name)+1, buf,
> +				     count);
> +	if (rc) {
> +		pr_err("Error setting the variable %s\n", kobj->name);
> +		return rc;
> +	}
> +
> +	return count;
> +}
> +
> +static struct kobj_attribute name_attr =
> +__ATTR(name, 0444, name_show, NULL);
> +
> +static struct kobj_attribute size_attr =
> +__ATTR(size, 0444, size_show, NULL);
> +

> +static struct bin_attribute data_attr = {
> +	.attr = {.name = "data", .mode = 0444},
> +	.size = VARIABLE_MAX_SIZE,
> +	.read = data_read,
> +};

Should they be globally readable? If efivars is globally readable I'm
happy to follow that example, but mpe might have opinions.

> +
> +
> +static struct bin_attribute update_attr = {
> +	.attr = {.name = "update", .mode = 0200},
> +	.size = VARIABLE_MAX_SIZE,
> +	.write = update_write,
> +};
> +
> +static struct bin_attribute  *secvar_bin_attrs[] = {
> +	&data_attr,
> +	&update_attr,
> +	NULL,
> +};
> +
> +static struct attribute *secvar_attrs[] = {
> +	&name_attr.attr,
> +	&size_attr.attr,
> +	NULL,
> +};
> +
> +const struct attribute_group secvar_attr_group = {
> +	.attrs = secvar_attrs,
> +	.bin_attrs = secvar_bin_attrs,
> +};
> +
> +int secvar_sysfs_load(void)
> +{
> +
> +	char *name;
> +	unsigned long namesize;
> +	struct kobject *kobj;
> +	int status;
> +	int rc = 0;
> +
> +	name = kzalloc(1024, GFP_KERNEL);
> +	if (!name)
> +		return -ENOMEM;

Where'd the 1024 restriction on the length of the variable name come
from? is that enforced by firmware? If so, how does firmware
communicate the limited key length?

> +
> +	do {
> +

> +		status = secvarops->get_next_variable(name, &namesize, 1024);
does namesize need to be initialised for the first call?

> +		if (status != OPAL_SUCCESS)
> +			break;

You might want to differentiate between the error case and the "no
extra variables" case. Come to think of it, since the point of
abstracting secvar ops is to make this code indepdendent of the backend
why are we checking for OPAL_SUCCESS? The ops functions should be
returning linux return code (EIO, etc) rather than OPAL codes.

> +
> +		pr_info("name is %s\n", name);
pr_info?

> +		kobj = kobject_create_and_add(name, &(secvar_kset->kobj));
> +		if (kobj) {
> +			rc = sysfs_create_group(kobj, &secvar_attr_group);
> +			if (rc)
> +				pr_err("Error creating attributes for %s variable\n",
> +				name);
> +		} else {
> +			pr_err("Error creating sysfs entry for %s variable\n",
> +				name);
> +			rc = -EINVAL;
> +		}
> +
> +	} while ((status == OPAL_SUCCESS) && (rc == 0));

Checking status here isn't needed here since we checked it above and
broken out of the loop.

> +
> +	kfree(name);
> +	return rc;
> +}
> +
> +int secvar_sysfs_init(void)
> +{
> +	powerpc_kobj = kobject_create_and_add("secvar", firmware_kobj);
> +	if (!powerpc_kobj) {
> +		pr_err("secvar: Failed to create firmware kobj\n");
> +		return -ENODEV;
> +	}
> +
> +	secvar_kset = kset_create_and_add("vars", NULL, powerpc_kobj);
> +	if (!secvar_kset) {
> +		pr_err("secvar: sysfs kobject registration failed.\n");
> +		return -ENODEV;
> +	}
> +
> +	secvarops = get_secvar_ops();
> +	if (!secvarops) {
> +		kobject_put(powerpc_kobj);
> +		pr_err("secvar: failed to retrieve secvar operations.\n");
> +		return -ENODEV;
> +	}

Not having secvar support isn't an error. IMO checking if the ops are
defined is the first thing you should be doing. If we don't have a
defined set of ops then we don't need to do anything else.

> +
> +	secvar_sysfs_load();
> +	pr_info("Secure variables sysfs initialized");
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(secvar_sysfs_init);
> +
> +static void secvar_sysfs_exit(void)
> +{
> +	kobject_put(powerpc_kobj);
> +}
> +EXPORT_SYMBOL_GPL(secvar_sysfs_exit);
> +
> +module_init(secvar_sysfs_init);
> +module_exit(secvar_sysfs_exit);
> +

> +MODULE_AUTHOR("Nayna Jain<nayna@linux.ibm.com>");
needs a space between your name and the opening '<' of the email
> +MODULE_DESCRIPTION("sysfs interface to POWER secure variables");
> +MODULE_LICENSE("GPL");

