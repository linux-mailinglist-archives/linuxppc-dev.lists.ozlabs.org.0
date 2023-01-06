Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CCB65FF29
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Jan 2023 11:50:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NpKqZ0tJBz3cCW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Jan 2023 21:50:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lBfEDJ+W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NpKpf6Nxbz3bPW
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Jan 2023 21:49:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lBfEDJ+W;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NpKpY44zNz4xyK;
	Fri,  6 Jan 2023 21:49:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1673002165;
	bh=h4wz4o+tsUBqZQDwPkY917/mAdruNJ6Mx3rXfeORC/g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lBfEDJ+Wd3QKqj03xyZQ4wZZsaITbiafXjvqUChO12d4OSP13tLRwLGgrgO1IPoZg
	 kqxyQOKt+s9dKHLcrbnYvJM/EFPHwOyOYVUhCCu3YTsjtls+RV0w8ckjxbgmESmEnH
	 DnuQ1eeA8ICYri3fy2pZlXgRopyXzgzwIznA4lMKv1nZKYAOSX48igZO9lRmt03Dml
	 tVtzRTGZUpAddj9crZzZmxOQg2i9OBIo2ZG/xAqP+USz1TbVynyLZ/MAob8pJD72p+
	 tvNOwGwFWxIJxOLHQFqEoeHZGWZYO4FOJemYIod8rtv7iXsENh21QVWkzwC/u602zx
	 7F5vpG7/WUwjA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 7/7] powerpc/pseries: Implement secvars for dynamic
 secure boot
In-Reply-To: <20221230042014.154483-8-ruscur@russell.cc>
References: <20221230042014.154483-1-ruscur@russell.cc>
 <20221230042014.154483-8-ruscur@russell.cc>
Date: Fri, 06 Jan 2023 21:49:21 +1100
Message-ID: <87zgawgcpa.fsf@mpe.ellerman.id.au>
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
Cc: ajd@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Russell Currey <ruscur@russell.cc> writes:
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
> v2: Remove unnecessary config vars from sysfs and document the others,
>     thanks to review from Greg.  If we end up needing to expose more, we
>     can add them later and update the docs.
>
>     Use sysfs_emit() instead of sprintf(), thanks to Greg.
>
>     Change the size of the sysfs binary attributes to include the 8-byte
>     flags header, preventing truncation of large writes.
>
>  Documentation/ABI/testing/sysfs-secvar        |  67 ++++-
>  arch/powerpc/platforms/pseries/Kconfig        |  13 +
>  arch/powerpc/platforms/pseries/Makefile       |   4 +-
>  arch/powerpc/platforms/pseries/plpks-secvar.c | 245 ++++++++++++++++++
>  4 files changed, 326 insertions(+), 3 deletions(-)
>  create mode 100644 arch/powerpc/platforms/pseries/plpks-secvar.c
>
> diff --git a/Documentation/ABI/testing/sysfs-secvar b/Documentation/ABI/testing/sysfs-secvar
> index feebb8c57294..466a8cb92b92 100644
> --- a/Documentation/ABI/testing/sysfs-secvar
> +++ b/Documentation/ABI/testing/sysfs-secvar
> @@ -34,7 +34,7 @@ Description:	An integer representation of the size of the content of the
>  
>  What:		/sys/firmware/secvar/vars/<variable_name>/data
>  Date:		August 2019
> -Contact:	Nayna Jain h<nayna@linux.ibm.com>
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
>  Description:	A read-only file containing the value of the variable. The size
>  		of the file represents the maximum size of the variable data.
>  
> @@ -44,3 +44,68 @@ Contact:	Nayna Jain <nayna@linux.ibm.com>
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
> +		implementation provides variables to populate it, which at
> +		present is only PLPKS on the pseries platform.

I think it's OK to mention that currently this only exists for PLPKS ...

> +What:		/sys/firmware/secvar/config/version
> +Date:		December 2022
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	RO file, only present if the secvar implementation is PLPKS.

... but I don't think we want to specify that files are only present for PLPKS. 

Because if another backend wanted to create them in future, that would
technically be an ABI change.

> +		Contains the config version as reported by the hypervisor in
> +		ASCII decimal format.
> +
> +What:		/sys/firmware/secvar/config/max_object_size
> +Date:		December 2022
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	RO file, only present if the secvar implementation is PLPKS.
> +
> +		Contains the maximum allowed size of objects in the keystore
> +		in bytes, represented in ASCII decimal format.
> +
> +		This is not necessarily the same as the max size that can be
> +		written to an update file as writes can contain more than
> +		object data, you should use the size of the update file for
> +		that purpose.
> +
> +What:		/sys/firmware/secvar/config/total_size
> +Date:		December 2022
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	RO file, only present if the secvar implementation is PLPKS.
> +
> +		Contains the total size of the PLPKS in bytes, represented in
> +		ASCII decimal format.

Similarly here I think the description should be written in a way that
is agnostic about the backend. So eg. "Contains the total size of the
key store in bytes".


> +What:		/sys/firmware/secvar/config/used_space
> +Date:		December 2022
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	RO file, only present if the secvar implementation is PLPKS.
> +
> +		Contains the current space consumed of the PLPKS in bytes,
> +		represented in ASCII decimal format.
> +
> +What:		/sys/firmware/secvar/config/supported_policies
> +Date:		December 2022
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	RO file, only present if the secvar implementation is PLPKS.
> +
> +		Contains a bitmask of supported policy flags by the hypervisor,
> +		represented as an 8 byte hexadecimal ASCII string.  Consult the
> +		hypervisor documentation for what these flags are.
> +
> +What:		/sys/firmware/secvar/config/signed_update_algorithms
> +Date:		December 2022
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	RO file, only present if the secvar implementation is PLPKS.
> +
> +		Contains a bitmask of flags indicating which algorithms the
> +		hypervisor supports objects to be signed with when modifying
> +		secvars, represented as a 16 byte hexadecimal ASCII string.
> +		Consult the hypervisor documentation for what these flags mean.
 
Can this at least say "as defined in PAPR version X section Y"?

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

I don't think we need that config option at all, or if we do it should
not be user selectable and just enabled automatically by PSERIES_PLPKS.

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

I'm not convinced the secvar parts need to be in a separate C file.

If it was all in plpks.c we could avoid all/most of plpks.h and a bunch
of accessors and so on.

But I don't feel that strongly about it if you think it's better separate.

> diff --git a/arch/powerpc/platforms/pseries/plpks-secvar.c b/arch/powerpc/platforms/pseries/plpks-secvar.c
> new file mode 100644
> index 000000000000..8298f039bef4
> --- /dev/null
> +++ b/arch/powerpc/platforms/pseries/plpks-secvar.c
> @@ -0,0 +1,245 @@
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
> +		return sysfs_emit(buf, fmt, func());		\
> +	}							\
> +	static struct kobj_attribute attr_##name = __ATTR_RO(name)
> +
> +PLPKS_CONFIG_ATTR(version, "%u\n", plpks_get_version);
> +PLPKS_CONFIG_ATTR(max_object_size, "%u\n", plpks_get_maxobjectsize);
> +PLPKS_CONFIG_ATTR(total_size, "%u\n", plpks_get_totalsize);
> +PLPKS_CONFIG_ATTR(used_space, "%u\n", plpks_get_usedspace);
> +PLPKS_CONFIG_ATTR(supported_policies, "%08x\n", plpks_get_supportedpolicies);
> +PLPKS_CONFIG_ATTR(signed_update_algorithms, "%016llx\n", plpks_get_signedupdatealgorithms);

For those last two I wonder if we should be decoding the integer values
into a comma separated list of named flags?

Just blatting out the integer values is a bit gross. It's not helpful
for shell scripts, and a consumer written in C has to strtoull() the
value back into an integer before it can decode it.

> +static const struct attribute *config_attrs[] = {
> +	&attr_version.attr,
> +	&attr_max_object_size.attr,
> +	&attr_total_size.attr,
> +	&attr_used_space.attr,
> +	&attr_supported_policies.attr,
> +	&attr_signed_update_algorithms.attr,
> +	NULL,
> +};
> +
> +static u16 get_ucs2name(const char *name, uint8_t **ucs2_name)
> +{
> +	int namelen = strlen(name) * 2;
> +	*ucs2_name = kzalloc(namelen, GFP_KERNEL);
> +
> +	if (!*ucs2_name)
> +		return 0;
> +
> +	for (int i = 0; name[i]; i++) {
> +		(*ucs2_name)[i * 2] = name[i];
> +		(*ucs2_name)[i * 2 + 1] = '\0';
> +	}
> +
> +	return namelen;
> +}

There are some ucs2 routines in lib/ucs2_string.c, can we use any of
them?

> +static u32 get_policy(const char *name)
> +{
> +	if ((strcmp(name, "db") == 0) ||
> +	    (strcmp(name, "dbx") == 0) ||
> +	    (strcmp(name, "grubdb") == 0) ||
> +	    (strcmp(name, "sbat") == 0))
> +		return (WORLDREADABLE | SIGNEDUPDATE);
> +	else
> +		return SIGNEDUPDATE;
> +}
> +
> +#define PLPKS_SECVAR_COUNT 8

I don't think we need that. Just declare the array as unsized and then
use ARRAY_SIZE(var_names) in plpks_get_next_variable().

> +static char *var_names[PLPKS_SECVAR_COUNT] = {
> +	"PK",
> +	"KEK",
> +	"db",
> +	"dbx",
> +	"grubdb",
> +	"sbat",
> +	"moduledb",
> +	"trustedcadb",
> +};
> +
> +static int plpks_get_variable(const char *key, uint64_t key_len,
> +			      u8 *data, uint64_t *data_size)
> +{
> +	struct plpks_var var = {0};
> +	u16 ucs2_namelen;
> +	u8 *ucs2_name;
> +	int rc = 0;
> +
> +	ucs2_namelen = get_ucs2name(key, &ucs2_name);
> +	if (!ucs2_namelen)
> +		return -ENOMEM;
> +
> +	var.name = ucs2_name;
> +	var.namelen = ucs2_namelen;
> +	var.os = PLPKS_VAR_LINUX;
> +	rc = plpks_read_os_var(&var);
> +
> +	if (rc)
> +		goto err;
> +
> +	*data_size = var.datalen + sizeof(var.policy);
> +
> +	// We can be called with data = NULL to just get the object size.
> +	if (data) {
> +		memcpy(data, &var.policy, sizeof(var.policy));
> +		memcpy(data + sizeof(var.policy), var.data, var.datalen);
> +	}

There's a lot of allocation and copying going on. The secvar-sysfs.c
data_read() has kzalloc'ed data, but only after already doing the hcall
to get the size. Then plpks_read_os_var() does an allocation for the
hcall and then another allocation of the exact data size. Then data_read()
does another copy into the sysfs supplied buffer.

So to read a single variable we do the hcall twice, and allocate/copy
the content of the variable 4 times?

 - Hypervisor into "output" in plpks_read_var().
 - "output" into "var->data" in plpks_read_var().
 - "var.data" into "data" in plpks_get_variable().
 - "data" into "buf" in data_read().

As long as maxobjsize is < PAGE_SIZE I think we could do the hcall
directly into "buf". Maybe we want to avoid writing into "buf" directly
in case the hcall fails or something, but the other 3 copies seem
unnecessary.

> +	kfree(var.data);
> +err:
> +	kfree(ucs2_name);
> +	return rc;
> +}
> +
> +static int plpks_set_variable(const char *key, uint64_t key_len,
> +			      u8 *data, uint64_t data_size)
> +{
> +	struct plpks_var var = {0};
> +	u16 ucs2_namelen;
> +	u8 *ucs2_name;
> +	int rc = 0;
> +	u64 flags;
> +
> +	// Secure variables need to be prefixed with 8 bytes of flags.
> +	// We only want to perform the write if we have at least one byte of data.
> +	if (data_size <= sizeof(flags))
> +		return -EINVAL;
> +
> +	ucs2_namelen = get_ucs2name(key, &ucs2_name);
> +	if (!ucs2_namelen)
> +		return -ENOMEM;
> +
> +	memcpy(&flags, data, sizeof(flags));
> +
> +	var.datalen = data_size - sizeof(flags);
> +	var.data = kzalloc(var.datalen, GFP_KERNEL);
> +	if (!var.data) {
> +		rc = -ENOMEM;
> +		goto err;
> +	}
> +
> +	memcpy(var.data, data + sizeof(flags), var.datalen);
> +
> +	var.name = ucs2_name;
> +	var.namelen = ucs2_namelen;
> +	var.os = PLPKS_VAR_LINUX;
> +	var.policy = get_policy(key);
> +
> +	rc = plpks_signed_update_var(var, flags);
> +
> +	kfree(var.data);
> +err:
> +	kfree(ucs2_name);
> +	return rc;
> +}
> +
> +/*
> + * get_next() in the secvar API is designed for the OPAL API.
> + * If *key is 0, it returns the first variable in the keystore.
> + * Otherwise, you pass the name of a key and it returns next in line.
> + *
> + * We're going to cheat here - since we have fixed keys and don't care about
> + * key_len, we can just use it as an index.
> + */

That's kinda gross. Just change the ops API to do what we need? Either
add a separate get-by-index routine or change the existing one and
update the only other implementation.

> +static int plpks_get_next_variable(const char *key, uint64_t *key_len, uint64_t keybufsize)
> +{
> +	if (!key || !key_len)
> +		return -EINVAL;
> +
> +	if (*key_len >= PLPKS_SECVAR_COUNT)
> +		return -ENOENT;
> +
> +	if (strscpy((char *)key, var_names[(*key_len)++], keybufsize) < 0)
> +		return -E2BIG;
> +
> +	return 0;
> +}
> +
> +// PLPKS dynamic secure boot doesn't give us a format string in the same way OPAL does.
> +// Instead, report the format using the SB_VERSION variable in the keystore.
> +static ssize_t plpks_secvar_format(char *buf)
> +{
> +	struct plpks_var var = {0};
> +	ssize_t ret;
> +
> +	var.component = NULL;
> +	// Only the signed variables have ucs2-encoded names, this one doesn't
> +	var.name = "SB_VERSION";

Is that specified somewhere?

> +	var.namelen = 10;
> +	var.datalen = 0;
> +	var.data = NULL;
> +
> +	// Unlike the other vars, SB_VERSION is owned by firmware instead of the OS
> +	ret = plpks_read_fw_var(&var);
> +	if (ret) {
> +		if (ret == -ENOENT)
> +			return sysfs_emit(buf, "ibm,plpks-sb-unknown\n");
> +
> +		pr_err("Error %ld reading SB_VERSION from firmware\n", ret);
> +		return ret;

I'm not sure you should pass that raw error back to sysfs. Some of the
values could be confusing, eg. if you return -EINVAL it looks like a
parameter to the read() syscall was invalid. Might be better to just
return -EIO.

> +	}
> +
> +	// Hypervisor defines SB_VERSION as a "1 byte unsigned integer value"
> +	ret = sysfs_emit(buf, "ibm,plpks-sb-%hhu\n", var.data[0]);

The rest of the name string is just made up by us?

> +	kfree(var.data);
> +	return ret;
> +}
> +
> +static int plpks_max_size(uint64_t *max_size)
> +{
> +	// The max object size reported by the hypervisor is accurate for the
> +	// object itself, but we use the first 8 bytes of data on write as the
> +	// signed update flags, so the max size a user can write is larger.
> +	*max_size = (uint64_t)plpks_get_maxobjectsize() + 8;
> +
> +	return 0;
> +}
> +
> +
> +static const struct secvar_operations plpks_secvar_ops = {
> +	.get = plpks_get_variable,
> +	.get_next = plpks_get_next_variable,
> +	.set = plpks_set_variable,
> +	.format = plpks_secvar_format,
> +	.max_size = plpks_max_size,
> +};
> +
> +static int plpks_secvar_init(void)
> +{
> +	if (!plpks_is_available())
> +		return -ENODEV;
> +
> +	set_secvar_ops(&plpks_secvar_ops);
> +	set_secvar_config_attrs(config_attrs);
> +	return 0;
> +}
> +device_initcall(plpks_secvar_init);

That must be a machine_device_initcall(pseries, ...), otherwise we will
blow up doing a hcall on powernv in plpks_is_available().

cheers
