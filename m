Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C259678FBB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 06:18:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1FcM306Yz3c9m
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 16:18:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qc+q5hby;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qc+q5hby;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1FbQ3gzdz30RT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 16:17:36 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id b24-20020a17090a551800b0022beefa7a23so641037pji.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 21:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNSerOSnlxxK8vSpUIDiIBbEgsavGD2AEsJ9ViQM8aw=;
        b=qc+q5hby+CrOchsp2tv7/w79by2j4LoqZxz7a7hdjbKmqFKhNuGTrdXW5eekAp0QvP
         GkzSx5a4Sfoe97/oIubS4GkWRC+rwN+aRS6A/juMvqEsUmk6Unjw0+B9OMoH8jEW7YE3
         1qKsruOKkKWejxhQYevDH+5kDbBU0dOwPthIotKQiUY+8ikAoRghSr7D3jUuWFvnVhRn
         LAijbXqLrFyYs1Fpa28PKsDtw7Q8CmLhXgWYiT1W7N9K6H9af/WuWtLTOs3eeiHoD9gi
         e46rAPFDEyfIk/gLsQlmoFDUu2uw9pQTNV254ncAqMpCEGvCHOM0Cc0GJ94ygAepRe+L
         2t6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bNSerOSnlxxK8vSpUIDiIBbEgsavGD2AEsJ9ViQM8aw=;
        b=X+8/bKxfHTxrj5qXldQs8BWS0k2Mlb4cxavwFcllN8WS/SNnqUkmdHfKcntjPn6siq
         NZ491I54folpbahWVDQDahjzQ1PhJdjttuYvp4VU+sMmd8sFz71gRwBF9DNq5I2e1JPG
         5N2P7PeIZ+JKHbdDgw83Kt5bJhOHt81GPAaOT4/jdgIxl3gzBTQAJiRWk6eCnHOzEqZz
         7zsbuAJLWzDgy7Wb0wehY6LWRgqcgLfeRYZq7mDt0JfjB2pSzkJCLdH9sP9yw6oQFHAP
         qTaHR/pH+lms7YWhRlAXuiZPLNKbol4mp4GSh0TJmb6NoOTvwFvNQVPVLUPFUKJmqDs5
         B98A==
X-Gm-Message-State: AFqh2kpuQLxRzqN844FQp8oiTg9bngX2dP8c2NZErPUj46T0UTY4WDeF
	jOowi0ftmZMOxYVzkIRXIGk=
X-Google-Smtp-Source: AMrXdXtt17GJOZw+kwZBmvuxsWk+soBEVvxmJeDAR2skEWOPCs0rXvQVU8H2fQMntCpslkG5jYcORA==
X-Received: by 2002:a05:6a20:671a:b0:af:5125:bcdd with SMTP id q26-20020a056a20671a00b000af5125bcddmr29373292pzh.55.1674537452037;
        Mon, 23 Jan 2023 21:17:32 -0800 (PST)
Received: from localhost (121-44-64-35.tpgi.com.au. [121.44.64.35])
        by smtp.gmail.com with ESMTPSA id g26-20020a62e31a000000b00576d76c9927sm520193pfh.106.2023.01.23.21.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 21:17:31 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jan 2023 15:17:24 +1000
Message-Id: <CQ05ZDYG6KNU.1G9O3ITQDIHEM@bobo>
Subject: Re: [PATCH v4 22/24] powerpc/pseries: Implement secvars for dynamic
 secure boot
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Andrew Donnellan" <ajd@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-integrity@vger.kernel.org>
X-Mailer: aerc 0.13.0
References: <20230120074306.1326298-1-ajd@linux.ibm.com>
 <20230120074306.1326298-23-ajd@linux.ibm.com>
In-Reply-To: <20230120074306.1326298-23-ajd@linux.ibm.com>
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
Cc: gjoyce@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, sudhakar@linux.ibm.com, ruscur@russell.cc, joel@jms.id.au, bgray@linux.ibm.com, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Jan 20, 2023 at 5:43 PM AEST, Andrew Donnellan wrote:
> From: Russell Currey <ruscur@russell.cc>
>
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
> partial writes are unsupported and writes cannot be larger than PAGE_SIZE=
.
> (Even when using bin_attributes, which can be larger than a single page,
> sysfs only gives us one page's worth of write buffer at a time, and the
> hypervisor does not expose an interface for partial writes.)
>
> Co-developed-by: Nayna Jain <nayna@linux.ibm.com>
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> Co-developed-by: Andrew Donnellan <ajd@linux.ibm.com>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
>
> ---
>
> v2: Remove unnecessary config vars from sysfs and document the others,
>     thanks to review from Greg.  If we end up needing to expose more, we
>     can add them later and update the docs.
>
>     Use sysfs_emit() instead of sprintf(), thanks to Greg.
>
>     Change the size of the sysfs binary attributes to include the 8-byte
>     flags header, preventing truncation of large writes.
>
> v3: plpks_set_variable(): pass var to plpks_signed_update_var() as a
>     pointer (mpe)
>
>     Update copyright date (ajd)
>
>     Consistent comment style (ajd)
>
>     Change device_initcall() to machine_arch_initcall(pseries...) so we
>     don't try to load on powernv and kill the machine (mpe)
>
>     Add config attributes into plpks_secvar_ops (mpe)
>
>     Get rid of PLPKS_SECVAR_COUNT macro (mpe)
>
>     Reworded descriptions in ABI documentation (mpe)
>
>     Switch to using secvar_ops->var_names rather than
>     secvar_ops->get_next() (ajd/mpe)
>
>     Optimise allocation/copying of buffers (mpe)
>
>     Elaborate the comment documenting the "format" string (mpe)
>
>     Return -EIO on errors in the read case (mpe)
>
>     Add "grubdbx" variable (Sudhakar Kuppusamy)
>
>     Use utf8s_to_utf16s() rather than our own "UCS-2" conversion code (mp=
e)
>
>     Change uint64_t to u64 (mpe)
>
>     Fix SB_VERSION data length (ruscur)
>
>     Stop prepending policy data on read (ruscur)
>
>     Enforce max format length on format string (not strictly needed, but
>     makes the length limit clear) (ajd)
>
>     Update include of plpks.h to reflect new path (ruscur)
>
>     Consistent constant naming scheme (ruscur)
>
> v4: Return set_secvar_ops() return code
>
>     Pass buffer size to plpks_secvar_format() (stefanb, npiggin)
>
>     Add missing null check (stefanb)
>
>     Add comment to commit message explaining PAGE_SIZE write limit (joel)
> ---
>  Documentation/ABI/testing/sysfs-secvar        |  75 +++++-
>  arch/powerpc/platforms/pseries/Makefile       |   4 +-
>  arch/powerpc/platforms/pseries/plpks-secvar.c | 215 ++++++++++++++++++
>  3 files changed, 291 insertions(+), 3 deletions(-)
>  create mode 100644 arch/powerpc/platforms/pseries/plpks-secvar.c
>
> diff --git a/Documentation/ABI/testing/sysfs-secvar b/Documentation/ABI/t=
esting/sysfs-secvar
> index feebb8c57294..a19f4d5fcec6 100644
> --- a/Documentation/ABI/testing/sysfs-secvar
> +++ b/Documentation/ABI/testing/sysfs-secvar
> @@ -18,6 +18,14 @@ Description:	A string indicating which backend is in u=
se by the firmware.
>  		This determines the format of the variable and the accepted
>  		format of variable updates.
> =20
> +		On powernv/OPAL, this value is provided by the OPAL firmware
> +		and is expected to be "ibm,edk2-compat-v1".
> +
> +		On pseries/PLPKS, this is generated by the kernel based on the
> +		version number in the SB_VERSION variable in the keystore, and
> +		has the form "ibm,plpks-sb-v<version>", or
> +		"ibm,plpks-sb-unknown" if there is no SB_VERSION variable.
> +
>  What:		/sys/firmware/secvar/vars/<variable name>
>  Date:		August 2019
>  Contact:	Nayna Jain <nayna@linux.ibm.com>
> @@ -34,7 +42,7 @@ Description:	An integer representation of the size of t=
he content of the
> =20
>  What:		/sys/firmware/secvar/vars/<variable_name>/data
>  Date:		August 2019
> -Contact:	Nayna Jain h<nayna@linux.ibm.com>
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
>  Description:	A read-only file containing the value of the variable. The =
size
>  		of the file represents the maximum size of the variable data.
> =20
> @@ -44,3 +52,68 @@ Contact:	Nayna Jain <nayna@linux.ibm.com>
>  Description:	A write-only file that is used to submit the new value for =
the
>  		variable. The size of the file represents the maximum size of
>  		the variable data that can be written.
> +
> +What:		/sys/firmware/secvar/config
> +Date:		December 2022
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	This optional directory contains read-only config attribute=
s as
> +		defined by the secure variable implementation.  All data is in
> +		ASCII format. The directory is only created if the backing
> +		implementation provides variables to populate it, which at
> +		present is only PLPKS on the pseries platform.
> +
> +What:		/sys/firmware/secvar/config/version
> +Date:		December 2022
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	Config version as reported by the hypervisor in ASCII decim=
al
> +		format.
> +
> +		Currently only provided by PLPKS on the pseries platform.
> +
> +What:		/sys/firmware/secvar/config/max_object_size
> +Date:		December 2022
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	Maximum allowed size of	objects in the keystore in bytes,
> +		represented in ASCII decimal format.
> +
> +		This is not necessarily the same as the max size that can be
> +		written to an update file as writes can contain more than
> +		object data, you should use the size of the update file for
> +		that purpose.
> +
> +		Currently only provided by PLPKS on the pseries platform.
> +
> +What:		/sys/firmware/secvar/config/total_size
> +Date:		December 2022
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	Total size of the PLPKS in bytes, represented in ASCII deci=
mal
> +		format.
> +
> +		Currently only provided by PLPKS on the pseries platform.
> +
> +What:		/sys/firmware/secvar/config/used_space
> +Date:		December 2022
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	Current space consumed by the key store, in bytes, represen=
ted
> +		in ASCII decimal format.
> +
> +		Currently only provided by PLPKS on the pseries platform.
> +
> +What:		/sys/firmware/secvar/config/supported_policies
> +Date:		December 2022
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	Bitmask of supported policy flags by the hypervisor,
> +		represented as an 8 byte hexadecimal ASCII string. Consult the
> +		hypervisor documentation for what these flags are.
> +
> +		Currently only provided by PLPKS on the pseries platform.
> +
> +What:		/sys/firmware/secvar/config/signed_update_algorithms
> +Date:		December 2022
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	Bitmask of flags indicating which algorithms the hypervisor
> +		supports for signed update of objects, represented as a 16 byte
> +		hexadecimal ASCII string. Consult the hypervisor documentation
> +		for what these flags mean.
> +
> +		Currently only provided by PLPKS on the pseries platform.
> diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platf=
orms/pseries/Makefile
> index 92310202bdd7..d52b7ec1a678 100644
> --- a/arch/powerpc/platforms/pseries/Makefile
> +++ b/arch/powerpc/platforms/pseries/Makefile
> @@ -27,8 +27,8 @@ obj-$(CONFIG_PAPR_SCM)		+=3D papr_scm.o
>  obj-$(CONFIG_PPC_SPLPAR)	+=3D vphn.o
>  obj-$(CONFIG_PPC_SVM)		+=3D svm.o
>  obj-$(CONFIG_FA_DUMP)		+=3D rtas-fadump.o
> -obj-$(CONFIG_PSERIES_PLPKS) +=3D plpks.o
> -
> +obj-$(CONFIG_PSERIES_PLPKS)	+=3D plpks.o
> +obj-$(CONFIG_PPC_SECVAR_SYSFS)	+=3D plpks-secvar.o
>  obj-$(CONFIG_SUSPEND)		+=3D suspend.o
>  obj-$(CONFIG_PPC_VAS)		+=3D vas.o vas-sysfs.o
> =20
> diff --git a/arch/powerpc/platforms/pseries/plpks-secvar.c b/arch/powerpc=
/platforms/pseries/plpks-secvar.c
> new file mode 100644
> index 000000000000..a80d9f9469f9
> --- /dev/null
> +++ b/arch/powerpc/platforms/pseries/plpks-secvar.c
> @@ -0,0 +1,215 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +// Secure variable implementation using the PowerVM LPAR Platform KeySto=
re (PLPKS)
> +//
> +// Copyright 2022, 2023 IBM Corporation
> +// Authors: Russell Currey
> +//          Andrew Donnellan
> +//          Nayna Jain
> +
> +#define pr_fmt(fmt) "secvar: "fmt
> +
> +#include <linux/printk.h>
> +#include <linux/init.h>
> +#include <linux/types.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/kobject.h>
> +#include <linux/nls.h>
> +#include <asm/machdep.h>
> +#include <asm/secvar.h>
> +#include <asm/plpks.h>
> +
> +// Config attributes for sysfs
> +#define PLPKS_CONFIG_ATTR(name, fmt, func)			\
> +	static ssize_t name##_show(struct kobject *kobj,	\
> +				   struct kobj_attribute *attr,	\
> +				   char *buf)			\
> +	{							\
> +		return sysfs_emit(buf, fmt, func());		\
> +	}							\
> +	static struct kobj_attribute attr_##name =3D __ATTR_RO(name)
> +
> +PLPKS_CONFIG_ATTR(version, "%u\n", plpks_get_version);
> +PLPKS_CONFIG_ATTR(max_object_size, "%u\n", plpks_get_maxobjectsize);
> +PLPKS_CONFIG_ATTR(total_size, "%u\n", plpks_get_totalsize);
> +PLPKS_CONFIG_ATTR(used_space, "%u\n", plpks_get_usedspace);
> +PLPKS_CONFIG_ATTR(supported_policies, "%08x\n", plpks_get_supportedpolic=
ies);
> +PLPKS_CONFIG_ATTR(signed_update_algorithms, "%016llx\n", plpks_get_signe=
dupdatealgorithms);
> +
> +static const struct attribute *config_attrs[] =3D {
> +	&attr_version.attr,
> +	&attr_max_object_size.attr,
> +	&attr_total_size.attr,
> +	&attr_used_space.attr,
> +	&attr_supported_policies.attr,
> +	&attr_signed_update_algorithms.attr,
> +	NULL,
> +};
> +
> +static u32 get_policy(const char *name)
> +{
> +	if ((strcmp(name, "db") =3D=3D 0) ||
> +	    (strcmp(name, "dbx") =3D=3D 0) ||
> +	    (strcmp(name, "grubdb") =3D=3D 0) ||
> +	    (strcmp(name, "grubdbx") =3D=3D 0) ||
> +	    (strcmp(name, "sbat") =3D=3D 0))
> +		return (PLPKS_WORLDREADABLE | PLPKS_SIGNEDUPDATE);
> +	else
> +		return PLPKS_SIGNEDUPDATE;
> +}
> +
> +static const char * const plpks_var_names[] =3D {
> +	"PK",
> +	"KEK",
> +	"db",
> +	"dbx",
> +	"grubdb",
> +	"grubdbx",
> +	"sbat",
> +	"moduledb",
> +	"trustedcadb",
> +	NULL,
> +};

Var and key are used somewhat interchangeably? These are keys, I think?
And plpks could have other vars but we're only interested in (at least a
subset of) keys here if I understood right.

I guess the terminology is like that throughout secvar so maybe nothing
to be done.

> +
> +static int plpks_get_variable(const char *key, u64 key_len, u8 *data,
> +			      u64 *data_size)
> +{
> +	struct plpks_var var =3D {0};
> +	int rc =3D 0;
> +
> +	var.name =3D kcalloc(key_len - 1, sizeof(wchar_t), GFP_KERNEL);
> +	if (!var.name)
> +		return -ENOMEM;
> +	rc =3D utf8s_to_utf16s(key, key_len - 1, UTF16_LITTLE_ENDIAN, (wchar_t =
*)var.name,
> +			     key_len - 1);
> +	if (rc < 0)
> +		goto err;

Okay I can't work out why it's key_len - 1 rather than key_len.

> +	var.namelen =3D rc * 2;
> +
> +	var.os =3D PLPKS_VAR_LINUX;
> +	if (data) {
> +		var.data =3D data;
> +		var.datalen =3D *data_size;
> +	}
> +	rc =3D plpks_read_os_var(&var);
> +
> +	if (rc)
> +		goto err;
> +
> +	*data_size =3D var.datalen;
> +
> +err:
> +	kfree(var.name);
> +	if (rc && rc !=3D -ENOENT) {
> +		pr_err("Failed to read variable '%s': %d\n", key, rc);
> +		// Return -EIO since userspace probably doesn't care about the
> +		// specific error
> +		rc =3D -EIO;
> +	}
> +	return rc;
> +}
> +
> +static int plpks_set_variable(const char *key, u64 key_len, u8 *data,
> +			      u64 data_size)
> +{
> +	struct plpks_var var =3D {0};
> +	int rc =3D 0;
> +	u64 flags;
> +
> +	// Secure variables need to be prefixed with 8 bytes of flags.
> +	// We only want to perform the write if we have at least one byte of da=
ta.
> +	if (data_size <=3D sizeof(flags))

So it's unstructured 8 byte of flags, not a u64 integer? Why not u8
flags[8] then?

> +		return -EINVAL;
> +
> +	var.name =3D kcalloc(key_len - 1, sizeof(wchar_t), GFP_KERNEL);
> +	if (!var.name)
> +		return -ENOMEM;
> +	rc =3D utf8s_to_utf16s(key, key_len - 1, UTF16_LITTLE_ENDIAN, (wchar_t =
*)var.name,
> +			     key_len - 1);
> +	if (rc < 0)
> +		goto err;
> +	var.namelen =3D rc * 2;
> +
> +	memcpy(&flags, data, sizeof(flags));
> +
> +	var.datalen =3D data_size - sizeof(flags);
> +	var.data =3D data + sizeof(flags);
> +	var.os =3D PLPKS_VAR_LINUX;
> +	var.policy =3D get_policy(key);
> +
> +	// Unlike in the read case, the plpks error code can be useful to
> +	// userspace on write, so we return it rather than just -EIO
> +	rc =3D plpks_signed_update_var(&var, flags);
> +
> +err:
> +	kfree(var.name);
> +	return rc;
> +}
> +
> +// PLPKS dynamic secure boot doesn't give us a format string in the same=
 way OPAL does.
> +// Instead, report the format using the SB_VERSION variable in the keyst=
ore.
> +static ssize_t plpks_secvar_format(char *buf, size_t bufsize)
> +{
> +	struct plpks_var var =3D {0};
> +	ssize_t ret;
> +
> +	var.component =3D NULL;
> +	// Only the signed variables have null bytes in their names, this one d=
oesn't
> +	var.name =3D "SB_VERSION";
> +	var.namelen =3D 10;

Could you make that strlen(var.name) for the benefit of those of us with
missing fingers?

> +	var.datalen =3D 1;
> +	var.data =3D kzalloc(1, GFP_KERNEL);

This could just point to a u8 on stack I think?


> +	if (!var.data)
> +		return -ENOMEM;
> +
> +	// Unlike the other vars, SB_VERSION is owned by firmware instead of th=
e OS
> +	ret =3D plpks_read_fw_var(&var);
> +	if (ret) {
> +		if (ret =3D=3D -ENOENT) {
> +			ret =3D snprintf(buf, bufsize, "ibm,plpks-sb-unknown");
> +		} else {
> +			pr_err("Error %ld reading SB_VERSION from firmware\n", ret);
> +			ret =3D -EIO;
> +		}

Is there a meaningful distinction? Does anything good come of
advertising an unknown format like this?

> +		goto err;
> +	}
> +
> +	// This string is made up by us - the hypervisor doesn't provide us
> +	// with a format string in the way that OPAL firmware does. Hypervisor
> +	// defines SB_VERSION as a "1 byte unsigned integer value".

I'd put the comment about SB_VERSION at the top where you use/define it
or mention it in the comment.

> +	ret =3D snprintf(buf, bufsize, "ibm,plpks-sb-v%hhu", var.data[0]);
> +
> +err:
> +	kfree(var.data);
> +	return ret;
> +}
> +
> +static int plpks_max_size(u64 *max_size)
> +{
> +	// The max object size reported by the hypervisor is accurate for the
> +	// object itself, but we use the first 8 bytes of data on write as the
> +	// signed update flags, so the max size a user can write is larger.
> +	*max_size =3D (u64)plpks_get_maxobjectsize() + 8;

You have this 8 open coded twice (once as sizeof(u64)). You could make
it a #define at the top with a brief overview of the hcall format so you
don't need so much commentage for it. Although a note here that the
objsize does not include the flags bytes is good to keep.

Thanks,
Nick

> +
> +	return 0;
> +}
> +
> +
> +static const struct secvar_operations plpks_secvar_ops =3D {
> +	.get =3D plpks_get_variable,
> +	.set =3D plpks_set_variable,
> +	.format =3D plpks_secvar_format,
> +	.max_size =3D plpks_max_size,
> +	.config_attrs =3D config_attrs,
> +	.var_names =3D plpks_var_names,
> +};
> +
> +static int plpks_secvar_init(void)
> +{
> +	if (!plpks_is_available())
> +		return -ENODEV;
> +
> +	return set_secvar_ops(&plpks_secvar_ops);
> +}
> +machine_device_initcall(pseries, plpks_secvar_init);
> --=20
> 2.39.0

