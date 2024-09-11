Return-Path: <linuxppc-dev+bounces-1248-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6E6974FC9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 12:38:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3cV41Swrz2yYJ;
	Wed, 11 Sep 2024 20:38:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726051084;
	cv=none; b=Fwtyi4N4c9lD5sSbtTyKqJzaitUhxCFMvcTWzQXCzxkj5KUdmKzsiLY29HP/73N9KLZ8+5JbYYfWIgSqptytJJMV87jiHc7Cj6F9U6fvihR5Uy22BRlLivpdqEQ5cstq8yHHe1gAfqCuLP0V4JvRsgVaU46tH5bwXCnQOJj0JIy2qkbzffhKgOKFezfIB4NStKyJIIcYVnsG2xMAe3W0BkGgPbs3sq33BuzmwVA3j5pjvDNf5kXbfe/pjbtJJh2F+hfHukQwfagTluLYeMdaXPn6hq+HES8aA665rVMJccX4L1/ZvTzf4EgzevvLepUgdKk0lklQhHej8GVEGWPrcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726051084; c=relaxed/relaxed;
	bh=YWLG5iOq7dWsSaOYDY44BoDv8CAxk/83LXnLegz4dSM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k0/gkei868YXZlRCZiEyWUezcElKkPpNMV9/fCPluCzRr3M6lrThVQd4HCGaD9/nFd8+vUd99lU2mLkYEaoT2YLeWShbvpFNFk9OiAY3o7KncsJTyV0SbfICKRvZ2ploB08kkpli31kMNqpGSyukpLqnxknc57Eh1KhX3quBCafFgBX50z4CtQ5AvF9FziZVAAu0DqYoefUDX11+GV9fxN5hG3rFSRkkBPFltBnMhFs4CPbupPpVDxdCZwh4oX9cocXKoYYL6Hnb0D1YJY21QawvfawTD10Pi45BqPJzWpCt4lM5MTcoUb92x8dPPMSxRukplI/igW/dfuQXWV9nxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=okIZiwa3; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=okIZiwa3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3cV33wJkz2xQH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 20:38:02 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B4TlW7018973;
	Wed, 11 Sep 2024 10:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:in-reply-to:references:date:message-id
	:mime-version:content-type:content-transfer-encoding; s=pp1; bh=
	YWLG5iOq7dWsSaOYDY44BoDv8CAxk/83LXnLegz4dSM=; b=okIZiwa3MwxbmMPv
	KftxIx1G+6mO6qkdzbF1j5OXSY62DiKeUB2n4tFob+dWeVQmkWMT9cTnaPrz8OlC
	t9bKjpvDC0irRoTuo7mlqCcjrvi+8/AkBjZvXEs5FC45Eud8cjVwS8f4ZTi4KFxf
	+HHiaKxQU5epC1i5VIxMki0uvYPPfbioydfSOJBZVusX3y/CVRGeJsGf+t1A71hS
	nO0FbLJwfcjjTXDhB+GJEQH6QB/MIw5Kk5Ty/VdwlUvnWaEqr8JgKoMT5uoiS4ta
	1hVJu2MNsW2pTNJyve/6bwye/c0hGAqCYThFtnu05pXwncem0oAf4q8UVieQxYv9
	gULO7w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gc8qd7ds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 10:37:44 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48BAbhvE030519;
	Wed, 11 Sep 2024 10:37:43 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gc8qd7dp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 10:37:43 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48B9whUB032399;
	Wed, 11 Sep 2024 10:37:42 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41h1j0ry67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 10:37:42 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48BAbe6B11600334
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Sep 2024 10:37:40 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE0A520043;
	Wed, 11 Sep 2024 10:37:40 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 688E220040;
	Wed, 11 Sep 2024 10:37:36 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.124.215.96])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with SMTP;
	Wed, 11 Sep 2024 10:37:36 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Wed, 11 Sep 2024 16:07:34 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Michael Ellerman
 <mpe@ellerman.id.au>
Cc: Anatolij Gustschin <agust@denx.de>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao
 <naveen@kernel.org>, Scott Wood <oss@buserror.net>,
        Haoran Liu
 <liuhaoran14@163.com>,
        Shivaprasad G Bhat <sbhat@linux.ibm.com>,
        Ira Weiny
 <ira.weiny@intel.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>,
        Arnd
 Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: Switch back to struct platform_driver::remove()
In-Reply-To: <20240909130902.851274-2-u.kleine-koenig@baylibre.com>
References: <20240909130902.851274-2-u.kleine-koenig@baylibre.com>
Date: Wed, 11 Sep 2024 16:07:34 +0530
Message-ID: <871q1qcw7l.fsf@vajain21.in.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZgvJBo3GfnWPL6_Y0P-MGUVd0h4nzWzL
X-Proofpoint-ORIG-GUID: IQmWg9C45VC9NLyI7pDP4qshy5sNVQPs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 clxscore=1011 mlxlogscore=999 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409110078


Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> writes:

> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>
> Convert all pwm drivers to use .remove(), with the eventual goal to drop
> struct platform_driver::remove_new(). As .remove() and .remove_new() have
> the same prototypes, conversion is done by just changing the structure
> member name in the driver initializer.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
>  arch/powerpc/platforms/512x/mpc512x_lpbfifo.c | 2 +-
>  arch/powerpc/platforms/85xx/sgy_cts1000.c     | 2 +-
>  arch/powerpc/platforms/pasemi/gpio_mdio.c     | 2 +-
>  arch/powerpc/platforms/powernv/opal-prd.c     | 2 +-
>  arch/powerpc/platforms/pseries/papr_scm.c     | 2 +-
>  arch/powerpc/sysdev/fsl_msi.c                 | 2 +-
>  arch/powerpc/sysdev/pmi.c                     | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)
<snip>

>
>=20=20
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/pla=
tforms/pseries/papr_scm.c
> index f6a70bc92e83..d95e03b3d3e3 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -1509,7 +1509,7 @@ static const struct of_device_id papr_scm_match[] =
=3D {
>=20=20
>  static struct platform_driver papr_scm_driver =3D {
>  	.probe =3D papr_scm_probe,
> -	.remove_new =3D papr_scm_remove,
> +	.remove =3D papr_scm_remove,
>  	.driver =3D {
>  		.name =3D "papr_scm",
>  		.of_match_table =3D papr_scm_match,
> diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.c
> index e205135ae1fe..1aa0cb097c9c 100644
> --- a/arch/powerpc/sysdev/fsl_msi.c
> +++ b/arch/powerpc/sysdev/fsl_msi.c
> @@ -603,7 +603,7 @@ static struct platform_driver fsl_of_msi_driver =3D {
>  		.of_match_table =3D fsl_of_msi_ids,
>  	},
>  	.probe =3D fsl_of_msi_probe,
> -	.remove_new =3D fsl_of_msi_remove,
> +	.remove =3D fsl_of_msi_remove,
>  };
<snip>

Dont have any objections to changes in arch/powerpc/platforms/pseries/papr_=
scm.c

Reviewed-by: Vaibhav Jain <vaibhav@linux.ibm.com>



--=20
Cheers
~ Vaibhav

