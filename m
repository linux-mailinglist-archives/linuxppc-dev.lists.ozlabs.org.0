Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FFD4C0D4F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 08:29:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3SNh496jz3cWc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 18:29:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pjUQ0+EU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pjUQ0+EU; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3SN051Rfz3cPY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 18:29:20 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id
 iq13-20020a17090afb4d00b001bc4437df2cso1916687pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 23:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=YtNmflP/LqqyZV64TLc0JyvwBsSG5qNJTsA45tNE118=;
 b=pjUQ0+EUHipF2liWwxYpc/q9tNdcfOvM6GQy49khCgu6Kc3fWRnos4eCXQHqrEiU6a
 ZW9sNAXfgtUZqVsxjHxOZM2LqoOzby5hILtog8oyPDeBlyc4crjS1GGYxojEmMyiZpg0
 RCWAHlMXDSvGup6MQCBR0c3m0qPD1N697QU4rwi4rC4x46wgbOSUTAVxKgO0X1vIsfSU
 FSsVDWR5AqLYX/WW9igUfxXrPBdrEnvVxyy3a5NphGdDUnWtVDYbVDi95BfWUcxxAput
 qgieTpvON9cmQE43shmYcQjXXfDlHgL+1cyQAcLSkaOznfdYztmnfid9oGfl57N9p8W0
 8WSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=YtNmflP/LqqyZV64TLc0JyvwBsSG5qNJTsA45tNE118=;
 b=Jt79Eugxz/aWwBY9AycY1igSZbIRKtgnRSSQrdTXK0ZTtWoUUZjf3FcHw82v+z0E3v
 8VYykPu/hrP0xRVqPbim21/8uiryIqSFeUmonTxjwI0NSoifTroG6ISFMDxxJSkKNhc0
 YoIU9XSzPMZGAu6bT9V8HnN2wpdOTKC8UZvkbt3Y7Yap53DMK3GxfoHvw/KgpHpFXga+
 S7kPkErRxSfHNOv3HGUJ0/ETCnfS3FJhtLqdQWNbe2y7MteBbddY63Z9ta0rAMIQEy37
 r92w7G4ZKy0R1ICfqzf2Ve/g/vVZrtpxCcKxtpiOynY3s0OMkYxOwK4ckKTGF3+rftu4
 99iA==
X-Gm-Message-State: AOAM533nUd6Z/6bXCPfiwZ3z4hh6oz6Uezt8frIkEszdjAeyKdy+Gej0
 jbOTZhQJSDVTb+udvbwwsp8=
X-Google-Smtp-Source: ABdhPJyDB7TuUEZH1yXA9H6I1DVSSyoIj4oDbp951FU9eVF9jGopqR1FaIkghoO3RFqHjRCPVIorng==
X-Received: by 2002:a17:90a:600a:b0:1b9:dd79:ea77 with SMTP id
 y10-20020a17090a600a00b001b9dd79ea77mr7909281pji.44.1645601358946; 
 Tue, 22 Feb 2022 23:29:18 -0800 (PST)
Received: from localhost (60-240-120-95.tpgi.com.au. [60.240.120.95])
 by smtp.gmail.com with ESMTPSA id h1sm11692991pgr.7.2022.02.22.23.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 23:29:18 -0800 (PST)
Date: Wed, 23 Feb 2022 17:29:13 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 8/9] powerpc/pseries/vas: sysfs interface to export
 capabilities
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, nathanl@linux.ibm.com
References: <94434bf320affdde36090c72eeb1372f1d9978ae.camel@linux.ibm.com>
 <ae3cb43ed8a139b91df4e201048093cd0204714a.camel@linux.ibm.com>
In-Reply-To: <ae3cb43ed8a139b91df4e201048093cd0204714a.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1645601320.0l4qpd79rb.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Haren Myneni's message of February 20, 2022 6:01 am:
>=20
> The hypervisor provides the available VAS GZIP capabilities such
> as default or QoS window type and the target available credits in
> each type. This patch creates sysfs entries and exports the target,
> used and the available credits for each feature.
>=20
> This interface can be used by the user space to determine the credits
> usage or to set the target credits in the case of QoS type (for DLPAR).
>=20
> /sys/devices/vas/vas0/gzip/default_capabilities (default GZIP capabilitie=
s)
> 	nr_total_credits /* Total credits available. Can be
> 			 /* changed with DLPAR operation */
> 	nr_used_credits  /* Used credits */
>=20
> /sys/devices/vas/vas0/gzip/qos_capabilities (QoS GZIP capabilities)
> 	nr_total_credits
> 	nr_used_credits
>=20

Looks good, thanks


Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/Makefile    |   2 +-
>  arch/powerpc/platforms/pseries/vas-sysfs.c | 226 +++++++++++++++++++++
>  arch/powerpc/platforms/pseries/vas.c       |   6 +
>  arch/powerpc/platforms/pseries/vas.h       |   6 +
>  4 files changed, 239 insertions(+), 1 deletion(-)
>  create mode 100644 arch/powerpc/platforms/pseries/vas-sysfs.c
>=20
> diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platf=
orms/pseries/Makefile
> index ee60b59024b4..29b522d2c755 100644
> --- a/arch/powerpc/platforms/pseries/Makefile
> +++ b/arch/powerpc/platforms/pseries/Makefile
> @@ -29,6 +29,6 @@ obj-$(CONFIG_PPC_SVM)		+=3D svm.o
>  obj-$(CONFIG_FA_DUMP)		+=3D rtas-fadump.o
> =20
>  obj-$(CONFIG_SUSPEND)		+=3D suspend.o
> -obj-$(CONFIG_PPC_VAS)		+=3D vas.o
> +obj-$(CONFIG_PPC_VAS)		+=3D vas.o vas-sysfs.o
> =20
>  obj-$(CONFIG_ARCH_HAS_CC_PLATFORM)	+=3D cc_platform.o
> diff --git a/arch/powerpc/platforms/pseries/vas-sysfs.c b/arch/powerpc/pl=
atforms/pseries/vas-sysfs.c
> new file mode 100644
> index 000000000000..e24d3edb3021
> --- /dev/null
> +++ b/arch/powerpc/platforms/pseries/vas-sysfs.c
> @@ -0,0 +1,226 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2022-23 IBM Corp.
> + */
> +
> +#define pr_fmt(fmt) "vas: " fmt
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/miscdevice.h>
> +#include <linux/kobject.h>
> +#include <linux/slab.h>
> +#include <linux/mm.h>
> +
> +#include "vas.h"
> +
> +#ifdef CONFIG_SYSFS
> +static struct kobject *pseries_vas_kobj;
> +static struct kobject *gzip_caps_kobj;
> +
> +struct vas_caps_entry {
> +	struct kobject kobj;
> +	struct vas_cop_feat_caps *caps;
> +};
> +
> +#define to_caps_entry(entry) container_of(entry, struct vas_caps_entry, =
kobj)
> +
> +#define sysfs_caps_entry_read(_name)					\
> +static ssize_t _name##_show(struct vas_cop_feat_caps *caps, char *buf) 	=
\
> +{									\
> +	return sprintf(buf, "%d\n", atomic_read(&caps->_name));	\
> +}
> +
> +struct vas_sysfs_entry {
> +	struct attribute attr;
> +	ssize_t (*show)(struct vas_cop_feat_caps *, char *);
> +	ssize_t (*store)(struct vas_cop_feat_caps *, const char *, size_t);
> +};
> +
> +#define VAS_ATTR_RO(_name)	\
> +	sysfs_caps_entry_read(_name);		\
> +	static struct vas_sysfs_entry _name##_attribute =3D __ATTR(_name,	\
> +				0444, _name##_show, NULL);
> +
> +/*
> + * Create sysfs interface:
> + * /sys/devices/vas/vas0/gzip/default_capabilities
> + *	This directory contains the following VAS GZIP capabilities
> + *	for the defaule credit type.
> + * /sys/devices/vas/vas0/gzip/default_capabilities/nr_total_credits
> + *	Total number of default credits assigned to the LPAR which
> + *	can be changed with DLPAR operation.
> + * /sys/devices/vas/vas0/gzip/default_capabilities/nr_used_credits
> + *	Number of credits used by the user space. One credit will
> + *	be assigned for each window open.
> + *
> + * /sys/devices/vas/vas0/gzip/qos_capabilities
> + *	This directory contains the following VAS GZIP capabilities
> + *	for the Quality of Service (QoS) credit type.
> + * /sys/devices/vas/vas0/gzip/qos_capabilities/nr_total_credits
> + *	Total number of QoS credits assigned to the LPAR. The user
> + *	has to define this value using HMC interface. It can be
> + *	changed dynamically by the user.
> + * /sys/devices/vas/vas0/gzip/qos_capabilities/nr_used_credits
> + *	Number of credits used by the user space.
> + */
> +
> +VAS_ATTR_RO(nr_total_credits);
> +VAS_ATTR_RO(nr_used_credits);
> +
> +static struct attribute *vas_capab_attrs[] =3D {
> +	&nr_total_credits_attribute.attr,
> +	&nr_used_credits_attribute.attr,
> +	NULL,
> +};
> +
> +static ssize_t vas_type_show(struct kobject *kobj, struct attribute *att=
r,
> +			     char *buf)
> +{
> +	struct vas_caps_entry *centry;
> +	struct vas_cop_feat_caps *caps;
> +	struct vas_sysfs_entry *entry;
> +
> +	centry =3D to_caps_entry(kobj);
> +	caps =3D centry->caps;
> +	entry =3D container_of(attr, struct vas_sysfs_entry, attr);
> +
> +	if (!entry->show)
> +		return -EIO;
> +
> +	return entry->show(caps, buf);
> +}
> +
> +static ssize_t vas_type_store(struct kobject *kobj, struct attribute *at=
tr,
> +			      const char *buf, size_t count)
> +{
> +	struct vas_caps_entry *centry;
> +	struct vas_cop_feat_caps *caps;
> +	struct vas_sysfs_entry *entry;
> +
> +	centry =3D to_caps_entry(kobj);
> +	caps =3D centry->caps;
> +	entry =3D container_of(attr, struct vas_sysfs_entry, attr);
> +	if (!entry->store)
> +		return -EIO;
> +
> +	return entry->store(caps, buf, count);
> +}
> +
> +static void vas_type_release(struct kobject *kobj)
> +{
> +	struct vas_caps_entry *centry =3D to_caps_entry(kobj);
> +	kfree(centry);
> +}
> +
> +static const struct sysfs_ops vas_sysfs_ops =3D {
> +	.show	=3D	vas_type_show,
> +	.store	=3D	vas_type_store,
> +};
> +
> +static struct kobj_type vas_attr_type =3D {
> +		.release	=3D	vas_type_release,
> +		.sysfs_ops      =3D       &vas_sysfs_ops,
> +		.default_attrs  =3D       vas_capab_attrs,
> +};
> +
> +static char *vas_caps_kobj_name(struct vas_cop_feat_caps *caps,
> +				struct kobject **kobj)
> +{
> +	if (caps->descriptor =3D=3D VAS_GZIP_QOS_CAPABILITIES) {
> +		*kobj =3D gzip_caps_kobj;
> +		return "qos_capabilities";
> +	} else if (caps->descriptor =3D=3D VAS_GZIP_DEFAULT_CAPABILITIES) {
> +		*kobj =3D gzip_caps_kobj;
> +		return "default_capabilities";
> +	} else
> +		return "Unknown";
> +}
> +
> +/*
> + * Add feature specific capability dir entry.
> + * Ex: VDefGzip or VQosGzip
> + */
> +int sysfs_add_vas_caps(struct vas_cop_feat_caps *caps)
> +{
> +	struct vas_caps_entry *centry;
> +	struct kobject *kobj =3D NULL;
> +	int ret =3D 0;
> +	char *name;
> +
> +	centry =3D kzalloc(sizeof(*centry), GFP_KERNEL);
> +	if (!centry)
> +		return -ENOMEM;
> +
> +	kobject_init(&centry->kobj, &vas_attr_type);
> +	centry->caps =3D caps;
> +	name  =3D vas_caps_kobj_name(caps, &kobj);
> +
> +	if (kobj) {
> +		ret =3D kobject_add(&centry->kobj, kobj, "%s", name);
> +
> +		if (ret) {
> +			pr_err("VAS: sysfs kobject add / event failed %d\n",
> +					ret);
> +			kobject_put(&centry->kobj);
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static struct miscdevice vas_miscdev =3D {
> +	.minor =3D MISC_DYNAMIC_MINOR,
> +	.name =3D "vas",
> +};
> +
> +/*
> + * Add VAS and VasCaps (overall capabilities) dir entries.
> + */
> +int __init sysfs_pseries_vas_init(struct vas_all_caps *vas_caps)
> +{
> +	int ret;
> +
> +	ret =3D misc_register(&vas_miscdev);
> +	if (ret < 0) {
> +		pr_err("%s: register vas misc device failed\n", __func__);
> +		return ret;
> +	}
> +
> +	/*
> +	 * The hypervisor does not expose multiple VAS instances, but can
> +	 * see multiple VAS instances on PowerNV. So create 'vas0' directory
> +	 * on pseries.
> +	 */
> +	pseries_vas_kobj =3D kobject_create_and_add("vas0",
> +					&vas_miscdev.this_device->kobj);
> +	if (!pseries_vas_kobj) {
> +		pr_err("Failed to create VAS sysfs entry\n");
> +		return -ENOMEM;
> +	}
> +
> +	if ((vas_caps->feat_type & VAS_GZIP_QOS_FEAT_BIT) ||
> +		(vas_caps->feat_type & VAS_GZIP_DEF_FEAT_BIT)) {
> +		gzip_caps_kobj =3D kobject_create_and_add("gzip",
> +						       pseries_vas_kobj);
> +		if (!gzip_caps_kobj) {
> +			pr_err("Failed to create VAS GZIP capability entry\n");
> +			kobject_put(pseries_vas_kobj);
> +			return -ENOMEM;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +#else
> +int sysfs_add_vas_caps(struct vas_cop_feat_caps *caps)
> +{
> +	return 0;
> +}
> +
> +int __init sysfs_pseries_vas_init(struct vas_all_caps *vas_caps)
> +{
> +	return 0;
> +}
> +#endif
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platform=
s/pseries/vas.c
> index 96178dd58adf..ca0ad191229d 100644
> --- a/arch/powerpc/platforms/pseries/vas.c
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -560,6 +560,10 @@ static int __init get_vas_capabilities(u8 feat, enum=
 vas_cop_feat_type type,
>  		}
>  	}
> =20
> +	rc =3D sysfs_add_vas_caps(caps);
> +	if (rc)
> +		return rc;
> +
>  	copypaste_feat =3D true;
> =20
>  	return 0;
> @@ -844,6 +848,8 @@ static int __init pseries_vas_init(void)
>  	caps_all.descriptor =3D be64_to_cpu(hv_caps->descriptor);
>  	caps_all.feat_type =3D be64_to_cpu(hv_caps->feat_type);
> =20
> +	sysfs_pseries_vas_init(&caps_all);
> +
>  	hv_cop_caps =3D kmalloc(sizeof(*hv_cop_caps), GFP_KERNEL);
>  	if (!hv_cop_caps) {
>  		rc =3D -ENOMEM;
> diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platform=
s/pseries/vas.h
> index 701363cfd7c1..f1bdb776021e 100644
> --- a/arch/powerpc/platforms/pseries/vas.h
> +++ b/arch/powerpc/platforms/pseries/vas.h
> @@ -30,6 +30,9 @@
>  #define VAS_COPY_PASTE_USER_MODE	0x00000001
>  #define VAS_COP_OP_USER_MODE		0x00000010
> =20
> +#define VAS_GZIP_QOS_CAPABILITIES	0x56516F73477A6970
> +#define VAS_GZIP_DEFAULT_CAPABILITIES	0x56446566477A6970
> +
>  /*
>   * Co-processor feature - GZIP QoS windows or GZIP default windows
>   */
> @@ -125,4 +128,7 @@ struct pseries_vas_window {
>  	char *name;
>  	int fault_virq;
>  };
> +
> +int sysfs_add_vas_caps(struct vas_cop_feat_caps *caps);
> +int __init sysfs_pseries_vas_init(struct vas_all_caps *vas_caps);
>  #endif /* _VAS_H */
> --=20
> 2.27.0
>=20
>=20
>=20
