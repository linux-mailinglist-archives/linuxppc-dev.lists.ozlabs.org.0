Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A68A46573CF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Dec 2022 09:13:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nhkn22tcBz3c8J
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Dec 2022 19:13:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gp3V2lGo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gp3V2lGo;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nhkm35Nd5z2xmy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Dec 2022 19:12:50 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 53D2C612E1;
	Wed, 28 Dec 2022 08:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B09FC433EF;
	Wed, 28 Dec 2022 08:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1672215166;
	bh=s7dzLkCAywG95n7cM0EsVwrHVQoeK5pAxCrnXODh4A4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gp3V2lGo+aJ17QdjmbDX3Bnc2qGL5a0XGCh09VEjrnCCRa8buj3JRmmauDC2swBHn
	 JVVQgBO39DDKZZdTU+EZOK2MVl3LqSM3e1qGasxDdm2bNpTtqy7dHuvErE4t6DyMh7
	 VDOnaurx0cTTWN9M5yHuuWSg36UGjH3zZ+8t5rbQ=
Date: Wed, 28 Dec 2022 09:12:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Russell Currey <ruscur@russell.cc>
Subject: Re: [PATCH 6/6] powerpc/pseries: Implement secvars for dynamic
 secure boot
Message-ID: <Y6v6ezv11U3/VI/j@kroah.com>
References: <20221228072943.429266-1-ruscur@russell.cc>
 <20221228072943.429266-7-ruscur@russell.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228072943.429266-7-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 28, 2022 at 06:29:43PM +1100, Russell Currey wrote:
> The pseries platform can support dynamic secure boot (i.e. secure boot
> using user-defined keys) using variables contained with the PowerVM LPAR
> Platform KeyStore (PLPKS).  Using the powerpc secvar API, expose the
> relevant variables for pseries dynamic secure boot through the existing
> secvar filesystem layout.
> 
> The relevant variables for dynamic secure boot are signed in the
> keystore, and can only be modified using the H_PKS_SIGNED_UPDATE hcall.
> Object labels in the keystore are encoded using ucs2 format.  With our
> fixed variable names we don't have to care about encoding outside of the
> necessary byte padding.
> 
> When a user writes to a variable, the first 8 bytes of data must contain
> the signed update flags as defined by the hypervisor.
> 
> When a user reads a variable, the first 4 bytes of data contain the
> policies defined for the object.
> 
> Limitations exist due to the underlying implementation of sysfs binary
> attributes, as is the case for the OPAL secvar implementation -
> partial writes are unsupported and writes cannot be larger than PAGE_SIZE.
> 
> Co-developed-by: Nayna Jain <nayna@linux.ibm.com>
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> Co-developed-by: Andrew Donnellan <ajd@linux.ibm.com>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> ---
>  Documentation/ABI/testing/sysfs-secvar        |   8 +
>  arch/powerpc/platforms/pseries/Kconfig        |  13 +
>  arch/powerpc/platforms/pseries/Makefile       |   4 +-
>  arch/powerpc/platforms/pseries/plpks-secvar.c | 250 ++++++++++++++++++
>  4 files changed, 273 insertions(+), 2 deletions(-)
>  create mode 100644 arch/powerpc/platforms/pseries/plpks-secvar.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-secvar b/Documentation/ABI/testing/sysfs-secvar
> index feebb8c57294..e6fef664c9c8 100644
> --- a/Documentation/ABI/testing/sysfs-secvar
> +++ b/Documentation/ABI/testing/sysfs-secvar
> @@ -44,3 +44,11 @@ Contact:	Nayna Jain <nayna@linux.ibm.com>
>  Description:	A write-only file that is used to submit the new value for the
>  		variable. The size of the file represents the maximum size of
>  		the variable data that can be written.
> +
> +What:		/sys/firmware/secvar/config
> +Date:		December 2022
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	This optional directory contains read-only config attributes as
> +		defined by the secure variable implementation.  All data is in
> +		ASCII format. The directory is only created if the backing
> +		implementation provides variables to populate it.

That is _WAY_ too vague, sorry.  You have to define the files that are
in here and what the contents of them are.

If you do not, you will get warnings from the tools that we have that
you can run on a system that wants to verify all sysfs files are
properly documented.

> diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
> index a3b4d99567cb..94e08c405d50 100644
> --- a/arch/powerpc/platforms/pseries/Kconfig
> +++ b/arch/powerpc/platforms/pseries/Kconfig
> @@ -162,6 +162,19 @@ config PSERIES_PLPKS
>  
>  	  If unsure, select N.
>  
> +config PSERIES_PLPKS_SECVAR
> +	depends on PSERIES_PLPKS
> +	depends on PPC_SECURE_BOOT
> +	bool "Support for the PLPKS secvar interface"
> +	help
> +	  PowerVM can support dynamic secure boot with user-defined keys
> +	  through the PLPKS. Keystore objects used in dynamic secure boot
> +	  can be exposed to the kernel and userspace through the powerpc
> +	  secvar infrastructure. Select this to enable the PLPKS backend
> +	  for secvars for use in pseries dynamic secure boot.
> +
> +	  If unsure, select N.
> +
>  config PAPR_SCM
>  	depends on PPC_PSERIES && MEMORY_HOTPLUG && LIBNVDIMM
>  	tristate "Support for the PAPR Storage Class Memory interface"
> diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
> index 92310202bdd7..807756991f9d 100644
> --- a/arch/powerpc/platforms/pseries/Makefile
> +++ b/arch/powerpc/platforms/pseries/Makefile
> @@ -27,8 +27,8 @@ obj-$(CONFIG_PAPR_SCM)		+= papr_scm.o
>  obj-$(CONFIG_PPC_SPLPAR)	+= vphn.o
>  obj-$(CONFIG_PPC_SVM)		+= svm.o
>  obj-$(CONFIG_FA_DUMP)		+= rtas-fadump.o
> -obj-$(CONFIG_PSERIES_PLPKS) += plpks.o
> -
> +obj-$(CONFIG_PSERIES_PLPKS)	+= plpks.o
> +obj-$(CONFIG_PSERIES_PLPKS_SECVAR)	+= plpks-secvar.o
>  obj-$(CONFIG_SUSPEND)		+= suspend.o
>  obj-$(CONFIG_PPC_VAS)		+= vas.o vas-sysfs.o
>  
> diff --git a/arch/powerpc/platforms/pseries/plpks-secvar.c b/arch/powerpc/platforms/pseries/plpks-secvar.c
> new file mode 100644
> index 000000000000..3f9ff16c03c8
> --- /dev/null
> +++ b/arch/powerpc/platforms/pseries/plpks-secvar.c
> @@ -0,0 +1,250 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Secure variable implementation using the PowerVM LPAR Platform KeyStore (PLPKS)
> + *
> + * Copyright 2022, IBM Corporation
> + * Authors: Russell Currey
> + *          Andrew Donnellan
> + *          Nayna Jain
> + */
> +
> +#define pr_fmt(fmt) "secvar: "fmt
> +
> +#include <linux/printk.h>
> +#include <linux/init.h>
> +#include <linux/types.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/kobject.h>
> +#include <asm/secvar.h>
> +#include "plpks.h"
> +
> +// Config attributes for sysfs
> +#define PLPKS_CONFIG_ATTR(name, fmt, func)			\
> +	static ssize_t name##_show(struct kobject *kobj,	\
> +				   struct kobj_attribute *attr,	\
> +				   char *buf)			\
> +	{							\
> +		return sprintf(buf, fmt, func());		\

sysfs_emit() please.

> +	}							\
> +	static struct kobj_attribute attr_##name = __ATTR_RO(name)
> +
> +PLPKS_CONFIG_ATTR(version, "%u\n", plpks_get_version);
> +PLPKS_CONFIG_ATTR(object_overhead, "%u\n", plpks_get_objoverhead);
> +PLPKS_CONFIG_ATTR(max_password_size, "%u\n", plpks_get_maxpwsize);
> +PLPKS_CONFIG_ATTR(max_object_size, "%u\n", plpks_get_maxobjectsize);
> +PLPKS_CONFIG_ATTR(max_object_label_size, "%u\n", plpks_get_maxobjectlabelsize);
> +PLPKS_CONFIG_ATTR(total_size, "%u\n", plpks_get_totalsize);
> +PLPKS_CONFIG_ATTR(used_space, "%u\n", plpks_get_usedspace);
> +PLPKS_CONFIG_ATTR(supported_policies, "%08x\n", plpks_get_supportedpolicies);
> +PLPKS_CONFIG_ATTR(max_large_object_size, "%u\n", plpks_get_maxlargeobjectsize);
> +PLPKS_CONFIG_ATTR(signed_update_algorithms, "%016llx\n", plpks_get_signedupdatealgorithms);

Looks like you know what these files and values are going to be, so
again, please document them properly.

thanks,

greg k-h
