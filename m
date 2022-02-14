Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 185DA4B407C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 04:50:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxqxT52pBz3cQN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 14:50:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OUfSCJbl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=OUfSCJbl; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxqwr48Jfz3bSs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 14:49:47 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id l8so3523006pls.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Feb 2022 19:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=n1oe3YED/rpwjOb6dkJMt8et3HrAkUYUWhgrqI+Urdc=;
 b=OUfSCJblaA0TMwHQJWVVrUOb9iaatxq+CS3X8nRnli8MbD59DkWSH02Lg9OGxrOct0
 4zmeRtaoVUtbhlRB6KXXhCC38sxYazaCBEjCb/6pOA24PwBsGnTAO0icl/Sz/IlDJQ0N
 STs6R1kdMTcW/L1iirn0WmmoBtWzpcvIh6gvDyGaC1Y2Vtk5QBCSLkPoIB8XCCg7eJFN
 ESaCfMpjc47a8tIT1ej5zsu50kGyN47tduucejlyv+NmdOOcBcmNE4IPGz6zli5eDiZH
 U1IhuHgaU0Ej9F/ZNQOR5IX6f2v5P9T/kmU352kqCGrlfBSGU84J9NUjBq7TeqvOR02a
 NP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=n1oe3YED/rpwjOb6dkJMt8et3HrAkUYUWhgrqI+Urdc=;
 b=wjt2j0H0poQ/qA6hzuxEH+S6VpX+8Oe2cDmj9ljUHk/lUI7P9on2Hnu64Krm3U34yQ
 lxm91sUifhp1xp/z5VdN+khgD90RNJYlfC5nr3Qc1A0xIbGPGUnOTxD4LyciD7Yjq/B1
 YGn0hOvCl79xkG5hIxSzee5cHzqPNcp4RAOP8EjMm3FfOVTfgz5ublnKclInckJjUDRE
 sFHbNhIlr+etNqULiemWLDu0UrV73ypyy511BD8SkI1q4GpDVOQuxdk8KwzSdAzsGjDA
 +mPFDjGFhrAeFRKj+HZGImmcCQua72RFvGOt2rZ0Yu39GG2REggmg3snGB2EcliNm0hI
 NzTw==
X-Gm-Message-State: AOAM531WUekMJP6cVJyy6fPXhMz9csdDE6zczucBo5RWrlT7M7AvryIh
 /97hLSsoHhoX4TGKwij6bHE=
X-Google-Smtp-Source: ABdhPJxC7rdOWHBSNXUtnUgB616D6yUBNEz49pW9eb9kaLC1y33EBJ78OknsRmnZlhIbuG3GddXnFA==
X-Received: by 2002:a17:902:e844:: with SMTP id
 t4mr7027672plg.22.1644810585046; 
 Sun, 13 Feb 2022 19:49:45 -0800 (PST)
Received: from localhost (27-33-251-132.static.tpgi.com.au. [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id my18sm12143746pjb.57.2022.02.13.19.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 19:49:44 -0800 (PST)
Date: Mon, 14 Feb 2022 13:49:39 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 09/10] powerpc/pseries/vas: sysfs interface to export
 capabilities
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
 <515519cbe4a63be118d330a96daf6c3d2f4d18e6.camel@linux.ibm.com>
In-Reply-To: <515519cbe4a63be118d330a96daf6c3d2f4d18e6.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1644810106.23kit14zzn.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of January 22, 2022 6:00 am:
>=20
> The hypervisor provides the available VAS GZIP capabilities such
> as default or QoS window type and the target available credits in
> each type. This patch creates sysfs entries and exports the target,
> used and the available credits for each feature.
>=20
> This interface can be used by the user space to determine the credits
> usage or to set the target credits in the case of QoS type (for DLPAR).
>=20
> /sys/devices/vas/vas0/gzip/def_caps: (default GZIP capabilities)
> 	avail_creds /* Available credits to use */
> 	target_creds /* Total credits available. Can be
> 			 /* changed with DLPAR operation */
> 	used_creds  /* Used credits */
>=20
> /sys/devices/vas/vas0/gzip/qos_caps (QoS GZIP capabilities)
> 	avail_creds
> 	target_creds
> 	used_creds

Can we not use these abbreviations in sysfs?

In the code it's one thing (I still don't prefer them but that's up to=20
you), but we should be a bit better in external ABIs. Can we also get a=20
better description of the difference between available credits and=20
target credits? They both appear to be credits available.

default_capabilities
  nr_available_credits
  nr_target_credits
  nr_used_credits

qos_capabilities
  ...

Keeping this description in the tree rather than just in the changelog
would be nice too.

>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/Makefile    |   2 +-
>  arch/powerpc/platforms/pseries/vas-sysfs.c | 218 +++++++++++++++++++++
>  arch/powerpc/platforms/pseries/vas.c       |   6 +
>  arch/powerpc/platforms/pseries/vas.h       |   6 +
>  4 files changed, 231 insertions(+), 1 deletion(-)
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
> index 000000000000..f7609cdef8f8
> --- /dev/null
> +++ b/arch/powerpc/platforms/pseries/vas-sysfs.c
> @@ -0,0 +1,218 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2016-17 IBM Corp.

Seems to have suffered a copy-paste problem.

> +	/*
> +	 * The hypervisor does not expose multiple VAS instances, but can
> +	 * see multiple VAS instances on PowerNV. So create 'vas0' directory
> +	 * on PowerVM.

powernv / pseries when you're talking about the APIs or Linux=20
implementation (or you can use OPAL / PAPR for APIs specifically too).

Thanks,
Nick

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
> index 75ccd0a599ec..32098e4a2786 100644
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
> @@ -843,6 +847,8 @@ static int __init pseries_vas_init(void)
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
> index 8ce9b84693e8..bc393bd74030 100644
> --- a/arch/powerpc/platforms/pseries/vas.h
> +++ b/arch/powerpc/platforms/pseries/vas.h
> @@ -24,6 +24,9 @@
>  #define VAS_COPY_PASTE_USER_MODE	0x00000001
>  #define VAS_COP_OP_USER_MODE		0x00000010
> =20
> +#define VAS_GZIP_QOS_CAPABILITIES	0x56516F73477A6970
> +#define VAS_GZIP_DEFAULT_CAPABILITIES	0x56446566477A6970
> +
>  /*
>   * Co-processor feature - GZIP QoS windows or GZIP default windows
>   */
> @@ -120,4 +123,7 @@ struct pseries_vas_window {
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
