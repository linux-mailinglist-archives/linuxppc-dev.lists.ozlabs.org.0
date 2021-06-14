Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB20A3A5BE3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 05:46:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3HSW3N0Nz307q
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 13:46:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=f3tQ/EZl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=f3tQ/EZl; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3HS42t3Hz2y0D
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 13:46:26 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id g4so8955894pjk.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 20:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=uO45wY2elXy+SJVuWP4TdtzLCJGPN/Y8k82mx0Ey9pg=;
 b=f3tQ/EZlA+YBBHoeTBU6hM/os+vs4R/TTvsmwoAGPogWtSBK8yFEj9epQHyDIzWbFP
 P7mJhVls9qJhU7PchiqOsUGLJXw2+14jCozeks6Bf0NbB9B6yvCZ16ctP3rNAUtmCIud
 Ac0iQOzxSOdRqfpe7PD6FTfblHwP6Fbo4EDN7ckQuUbyagWkF9RwMfo8xvw7SDrrO0zl
 CQxwQUzgbZuCX71yUyhQsN8E6Ubar5nSOOI4KdZmMaCO8hVvbufhLwoTYToo41db2HSs
 lHIjwrnbYeeUt1Rmrtvr6vnjQnlebf3pKGsanN7EyEvszWwloj3ZdJs89VBvK0At4b5S
 JeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=uO45wY2elXy+SJVuWP4TdtzLCJGPN/Y8k82mx0Ey9pg=;
 b=Ah4/FjoWsBF8O5ja2cSf2mAlD0rzAiAEgPg+y1Am30MdJO6ZmVvglpl91UU4SqkcnF
 hSrCB5T1jsIywkB0G9N7bHF7KeKy66gde7yLGf8IpVhr1N9r9ZHhO0WMwIhoydC8+xr/
 8I6Gu/eqXsrXY7DCzZ9Xuq8W8oi1QhculGaB4PKqme1VxHkMQo7OqyRmS8ixrn3HDm7s
 pb+eSpFVre31dhfGHWgT52ni72FyReBGHs5PebwvGT3i95DInPbdIRXGENiEdEYndoKP
 BZP5jfpa7nfge/OU2JKfTwmKqcgH1vdLtlVz23bEI2REBhnqbjsI5T3keklxS4hFKdOk
 X50g==
X-Gm-Message-State: AOAM533/6v9UzyCxtbhWL1gn92e5ThCTAI1oIjEvfnx5sVleOU81zn9T
 YFcsZkqDA+Iy4/nMfUxFld8=
X-Google-Smtp-Source: ABdhPJzHi1T0lTV0lXjlbXRGCCsUCygglwh5MyvmvqMJOa3x2nYsK0xpHmKJbXTuL+kqCc8EnNR8zA==
X-Received: by 2002:a17:903:2311:b029:115:29a9:a3ee with SMTP id
 d17-20020a1709032311b029011529a9a3eemr14728830plh.46.1623642383687; 
 Sun, 13 Jun 2021 20:46:23 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id v21sm2857455pfu.77.2021.06.13.20.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 20:46:23 -0700 (PDT)
Date: Mon, 14 Jun 2021 13:46:18 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 17/17] crypto/nx: Add sysfs interface to export NX
 capabilities
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
 <8fd529d8612ea47cce69101b62e9498de9324850.camel@linux.ibm.com>
In-Reply-To: <8fd529d8612ea47cce69101b62e9498de9324850.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1623641974.l06sotnvf2.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of June 13, 2021 9:05 pm:
>=20
> Changes to export the following NXGZIP capabilities through sysfs:
>=20
> /sys/devices/vio/ibm,compression-v1/nx_gzip_caps:
> min_compress_len  /*Recommended minimum compress length in bytes*/
> min_decompress_len /*Recommended minimum decompress length in bytes*/
> req_max_processed_len /* Maximum number of bytes processed in one
> 			request */
>=20
> NX will return RMA_Reject if the request buffer size is greater
> than req_max_processed_len.

Similar for the previous patch, can userspace sanely use the API without=20
these capabilities? If not, reorder so the final enable comes last.

I would put those comments in the code, and make the changelog a little
higher level, including a reference or example of how userspace uses it,
which should come with any new userspace ABI.

"Export NX-GZIP capabilities to usrespace in sysfs /sys/devices/vio/...
directory. These are queried by userspace accelerator libraries to set
minimum length heuristics and maximum limits on request sizes."

Something like that. Otherwise looks okay to me.

Thanks,
Nick

>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
> ---
>  drivers/crypto/nx/nx-common-pseries.c | 43 +++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>=20
> diff --git a/drivers/crypto/nx/nx-common-pseries.c b/drivers/crypto/nx/nx=
-common-pseries.c
> index 60b5049ec9f7..db28a84a826c 100644
> --- a/drivers/crypto/nx/nx-common-pseries.c
> +++ b/drivers/crypto/nx/nx-common-pseries.c
> @@ -967,6 +967,36 @@ static struct attribute_group nx842_attribute_group =
=3D {
>  	.attrs =3D nx842_sysfs_entries,
>  };
> =20
> +#define	nxct_caps_read(_name)						\
> +static ssize_t nxct_##_name##_show(struct device *dev,			\
> +			struct device_attribute *attr, char *buf)	\
> +{									\
> +	return sprintf(buf, "%lld\n", nx_ct_caps._name);		\
> +}
> +
> +#define NXCT_ATTR_RO(_name)						\
> +	nxct_caps_read(_name);						\
> +	static struct device_attribute dev_attr_##_name =3D __ATTR(_name,	\
> +						0444,			\
> +						nxct_##_name##_show,	\
> +						NULL);
> +
> +NXCT_ATTR_RO(req_max_processed_len);
> +NXCT_ATTR_RO(min_compress_len);
> +NXCT_ATTR_RO(min_decompress_len);
> +
> +static struct attribute *nxct_caps_sysfs_entries[] =3D {
> +	&dev_attr_req_max_processed_len.attr,
> +	&dev_attr_min_compress_len.attr,
> +	&dev_attr_min_decompress_len.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group nxct_caps_attr_group =3D {
> +	.name	=3D	"nx_gzip_caps",
> +	.attrs	=3D	nxct_caps_sysfs_entries,
> +};
> +
>  static struct nx842_driver nx842_pseries_driver =3D {
>  	.name =3D		KBUILD_MODNAME,
>  	.owner =3D	THIS_MODULE,
> @@ -1056,6 +1086,16 @@ static int nx842_probe(struct vio_dev *viodev,
>  		goto error;
>  	}
> =20
> +	if (caps_feat) {
> +		if (sysfs_create_group(&viodev->dev.kobj,
> +					&nxct_caps_attr_group)) {
> +			dev_err(&viodev->dev,
> +				"Could not create sysfs NX capability entries\n");
> +			ret =3D -1;
> +			goto error;
> +		}
> +	}
> +
>  	return 0;
> =20
>  error_unlock:
> @@ -1075,6 +1115,9 @@ static void nx842_remove(struct vio_dev *viodev)
>  	pr_info("Removing IBM Power 842 compression device\n");
>  	sysfs_remove_group(&viodev->dev.kobj, &nx842_attribute_group);
> =20
> +	if (caps_feat)
> +		sysfs_remove_group(&viodev->dev.kobj, &nxct_caps_attr_group);
> +
>  	crypto_unregister_alg(&nx842_pseries_alg);
> =20
>  	spin_lock_irqsave(&devdata_mutex, flags);
> --=20
> 2.18.2
>=20
>=20
>=20
