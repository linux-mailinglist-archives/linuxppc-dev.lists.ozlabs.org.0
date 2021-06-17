Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6053ABFA6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 01:42:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5drY5btnz3c5d
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 09:42:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=nbOwUSrQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nbOwUSrQ; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5dr71VlGz2yWR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 09:41:58 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id g22so6269365pgk.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 16:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=K+fJ72/SIYHOrqzX5FH87X9YXV2avJmC8rzhC9oBgfk=;
 b=nbOwUSrQFLLBKHTyOdWHnaFscRFE1PeAv60TJ0I8QTGK4tp7PaWOZAtm23L1rzJ/gO
 VQLBeJSnwf11UpXvi/4T6qNOrK2Tv++e71GAJzDSptzIer2RXEGWsr4KbY82ZLnK4CJk
 UOhE3iFISC9Gbxmjmh5mjMEaTuYYRxyQAA+q+TmnY0TDaxcUo8/hjaidsthl5E3bupdw
 +Vd1zZTSSqC9P58GzDH50uwBvKcprhLqHApn6Rv7AUshPC4jyKGj7ZYYV53HC28jj1aH
 prMCKPbPCtE0pySMd4UzwVFlNkEvifcCDyKCVtWMdBJi4/9nQjA+iZHFrZW3VyadrDx2
 0Owg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=K+fJ72/SIYHOrqzX5FH87X9YXV2avJmC8rzhC9oBgfk=;
 b=mYh2BjQTexdMbEp4h6UDTkLsG5BMhUnutzLzVQCPL1YCNZnz+qKZXGu98WzjUV1lzA
 9BXiloTP/lT6lEIxom5tAyGWUt0ZE+OPSMalR7Gk5w0mtlLt/bbIEkutTeEozDDAF/C/
 zRrP+kx19oHl+TkIdMajEYXa6guhPcQxZr8vTaY1ZTDc9Ro/NovI5dvnIThXWPaxp80L
 xh/TSZV/DGankxALwahvyugopTrllhcD4C7aitxEnPmxQ47IiFdZLe9Da6jyXEfJRU5Z
 LH5woSKLK/4F/ECb3vIz5d1EhfQN5Fgel2fUFqvAYiwKzyq1TRcor9LBYTvlk6kwchKK
 77SQ==
X-Gm-Message-State: AOAM531bdrXvvM6HXWcdf7YYIS8ZC3uYDLFyhCURLaKT2hHTJbNk5D8s
 P0WfPwYppi3hxI/VPmfCc88=
X-Google-Smtp-Source: ABdhPJzv+5cSku/txUzCCO5gjQEuu+w4sOq/rwxt90OzixWKfAwshRWuenOeW6LPcdsGpPqNdN1dXw==
X-Received: by 2002:a62:1b91:0:b029:2fd:2904:938a with SMTP id
 b139-20020a621b910000b02902fd2904938amr2112334pfb.18.1623973315453; 
 Thu, 17 Jun 2021 16:41:55 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id x2sm6196593pfp.155.2021.06.17.16.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 16:41:55 -0700 (PDT)
Date: Fri, 18 Jun 2021 09:41:49 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 16/17] crypto/nx: Add sysfs interface to export NX
 capabilities
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
 <510da86abbd904878d5f13d74aba72603c37d783.camel@linux.ibm.com>
In-Reply-To: <510da86abbd904878d5f13d74aba72603c37d783.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1623972971.4k5lhowaxz.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of June 18, 2021 6:39 am:
>=20
> Export NX-GZIP capabilities to usrespace in sysfs
> /sys/devices/vio/ibm,compression-v1/nx_gzip_caps directory.
> These are queried by userspace accelerator libraries to set
> minimum length heuristics and maximum limits on request sizes.
>=20
> NX-GZIP capabilities:
> min_compress_len  /*Recommended minimum compress length in bytes*/
> min_decompress_len /*Recommended minimum decompress length in bytes*/
> req_max_processed_len /* Maximum number of bytes processed in one
> 			request */
>=20
> NX will return RMA_Reject if the request buffer size is greater
> than req_max_processed_len.
>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Acked-by: Herbert Xu <herbert@gondor.apana.org.au>

Again, if you could just move those ^^ C style comments into the
code. Possibly have a small comment with the sysfs stuff saying that=20
it's ABI which userspace code queries when using the accelerator (or
if you have an ABI documentation somewhere, point the comments to that).

sysfs is ABI, but some bits are more ABI than others, it would just be
good to be clear that it is actually used, and can't be changed.

Aside from that,

Acked-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

> ---
>  drivers/crypto/nx/nx-common-pseries.c | 43 +++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>=20
> diff --git a/drivers/crypto/nx/nx-common-pseries.c b/drivers/crypto/nx/nx=
-common-pseries.c
> index 9fc2abb56019..f51a50d40504 100644
> --- a/drivers/crypto/nx/nx-common-pseries.c
> +++ b/drivers/crypto/nx/nx-common-pseries.c
> @@ -967,6 +967,36 @@ static struct attribute_group nx842_attribute_group =
=3D {
>  	.attrs =3D nx842_sysfs_entries,
>  };
> =20
> +#define	nxcop_caps_read(_name)						\
> +static ssize_t nxcop_##_name##_show(struct device *dev,			\
> +			struct device_attribute *attr, char *buf)	\
> +{									\
> +	return sprintf(buf, "%lld\n", nx_cop_caps._name);		\
> +}
> +
> +#define NXCT_ATTR_RO(_name)						\
> +	nxcop_caps_read(_name);						\
> +	static struct device_attribute dev_attr_##_name =3D __ATTR(_name,	\
> +						0444,			\
> +						nxcop_##_name##_show,	\
> +						NULL);
> +
> +NXCT_ATTR_RO(req_max_processed_len);
> +NXCT_ATTR_RO(min_compress_len);
> +NXCT_ATTR_RO(min_decompress_len);
> +
> +static struct attribute *nxcop_caps_sysfs_entries[] =3D {
> +	&dev_attr_req_max_processed_len.attr,
> +	&dev_attr_min_compress_len.attr,
> +	&dev_attr_min_decompress_len.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group nxcop_caps_attr_group =3D {
> +	.name	=3D	"nx_gzip_caps",
> +	.attrs	=3D	nxcop_caps_sysfs_entries,
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
> +					&nxcop_caps_attr_group)) {
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
> +		sysfs_remove_group(&viodev->dev.kobj, &nxcop_caps_attr_group);
> +
>  	crypto_unregister_alg(&nx842_pseries_alg);
> =20
>  	spin_lock_irqsave(&devdata_mutex, flags);
> --=20
> 2.18.2
>=20
>=20
>=20
