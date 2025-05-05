Return-Path: <linuxppc-dev+bounces-8287-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA98AA8E58
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 May 2025 10:37:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrZfR11b4z2yjN;
	Mon,  5 May 2025 18:37:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746434271;
	cv=none; b=bwubhO2ZF13nmxBcs6JQEAThGKXfuCQiRPZ/IUsgHNevEGo+f6pdBEL6+Vb5TT9X7oKtG4GDxKyU9nKieGBLaujduM2Zkk5Xx3qO9JsOsuuYBCQz91jlSVvFZnSMY2Sw+6gkjVIqbZ8tF/1pJ8r6CIWeE7UqeA+4okzufisHP0+GpPUOMAcU0JAUA72tbelEMM/z/PDqzfkS+0xRbL34U0x60mtzbN3n0mNE1ObqU69LGtjnFc/uZRO3HXbuaPpXo2Iiv2zmw5aiL34ruUA1zMWT2PbqQmAR+S+NlGWz4K72kbVvQbMOFAmcAJI6hTVtqFPmCv/m6TpWB1bwJnW2LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746434271; c=relaxed/relaxed;
	bh=sJnEdJmXfgBwSldLZE2cC4O1tLhklRfbkGj7jMDp4Hs=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ihUnbXhsmb+hiZcjiqIMLzXeLAMY0nSnj5gRBEcolTlgOML6ZlzFPOthJHfCrI0JbZcR2aiaocW+iQU3JSzItkaXFCLdyRAVkOollgFomgerLJdh8RjJ2W+k6lZ041jJARp+rZHh6tTPzqqEko0kXbPqyi/Hebm+hUP1R6fsa6R0RML8tpQSQEyQwJPiDwUjU0iSXM8n4Urbk1VTEkKBnx5eopgSRVVFBmSH36B/8r8q1OKmjG5jt6yoP2IPJEP0eDyNrz0xDazLBlCQP46mGcnm9z814mqCtpknANIq0D+lbsEh3wxZW+Oyz2AhCGUEbXGPY4fvGfWG+cH8FL/nfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lEuI0uhE; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lEuI0uhE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZrZfP6wf4z2yMt
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 May 2025 18:37:49 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544Lerbo015954;
	Mon, 5 May 2025 08:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=sJnEdJ
	mXfgBwSldLZE2cC4O1tLhklRfbkGj7jMDp4Hs=; b=lEuI0uhEbPI7TboxcaMyLH
	YwGUb4cnN5Z1HhLI+2+sJu/ZmcCWtRt4v8n82LswOUSqlou+vazb8rzaX6Mkwy8A
	JRLw/qYoPy2y1BNlc7zcYCnqTAbSGaFrzsdVpyn3BjAEfilvSoX51BIMzf146gFn
	7IQjazzR7a6srsBQrHXhb1LyiqEa+yigOxAX82gJfFD0yOjeaDvJR/YoTtPAjbmZ
	pFvYSs6ZRRHos1d2DrCYviUck/uAzqaxcLKzho1wegiyhp9WzLT/PqGhrSzBIJAG
	ReuXvlZBqUMwSPtRSBn1DPQnRcL+pZA8qZjg2x9sucCnOZQCv6pDu4tYiT7GAZ7Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46egb7swxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 08:37:32 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5458bVwS023491;
	Mon, 5 May 2025 08:37:31 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46egb7swxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 08:37:31 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5457T4kS025813;
	Mon, 5 May 2025 08:37:30 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dwuyngpp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 08:37:30 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5458bSJc41025856
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 08:37:28 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B9C920043;
	Mon,  5 May 2025 08:37:28 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6DC5D20040;
	Mon,  5 May 2025 08:37:27 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 May 2025 08:37:27 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.150.10.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BE3C3601F3;
	Mon,  5 May 2025 18:37:20 +1000 (AEST)
Message-ID: <43baab5747031ec84100939fe154fa2b071f3789.camel@linux.ibm.com>
Subject: Re: [PATCH 2/3] powerpc/secvar: Expose secvars relevant to the key
 management mode
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Srish Srinivasan <ssrish@linux.ibm.com>, linux-integrity@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, zohar@linux.ibm.com,
        nayna@linux.ibm.com, linux-kernel@vger.kernel.org
In-Reply-To: <20250430090350.30023-3-ssrish@linux.ibm.com>
References: <20250430090350.30023-1-ssrish@linux.ibm.com>
		 <20250430090350.30023-3-ssrish@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 May 2025 17:23:10 +1000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 35tEsaiZ0udvRbn6fwx-PJWiD8x-ogSE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA4MSBTYWx0ZWRfX/DxKSVTpEP4u CpWl+vcdeNJeWg32B7Jw8NrJM/hjZNEiEvDRT6M+slVVr3efcJNkt5XIlNMMUpHfuhPhSApytrl 8yq05jGIKv9D+vNiE+1/eW4chsNIPo2szUW/lVwH6fg/yTQerd8nQ19QQ2WyglHE5P7lkTbGq8K
 cYK17wsGBUuTI6wD1HHZUHD+jkXBKCT1F5jqvgu3GkHA49biqIrGuIF7v02Gen8MEicbljcNctK mUpn9VvNPO7ePBVd5F6vciQrCo7o0BmD/28mbnZ9UIA0Sv6nSIASoibZiGuOrAF700RdxhaqMgN n+JHmc0H9incqxthapP9N5or/MHK+dpK5pqUCvk+xZVGc8qMoma4I1wPTkT1RvlavDhIbqLU80+
 gYHShMNgLSHoRk6zqzK4C2Rpkj7ZpNmoOBK2oLFaEaGil1A1WGoHWGG+2/Zj2ZqkPfxXmRnx
X-Authority-Analysis: v=2.4 cv=YcK95xRf c=1 sm=1 tr=0 ts=681878cc cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=q79MgDi7yVbGD4n-FgcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: OjVXDvUkOp_ULUg-xePAuknCUwHRtP36
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 spamscore=0 mlxscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050081
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 2025-04-30 at 14:33 +0530, Srish Srinivasan wrote:
> The PLPKS enabled PowerVM LPAR sysfs exposes all of the secure boot
> secvars irrespective of the key management mode.
>=20
> The PowerVM LPAR supports static and dynamic key management for
> secure
> boot. The key management option can be updated in the management
> console. Only in the dynamic key mode can the user modify the secure
> boot secvars db, dbx, grubdb, grubdbx, and sbat, which are exposed
> via
> the sysfs interface. But the sysfs interface exposes these secvars
> even
> in the static key mode. This could lead to errors when reading them
> or
> writing to them in the static key mode.
>=20
> Expose only PK, trustedcadb, and moduledb in the static key mode to
> enable loading of signed third-party kernel modules.
>=20
> Co-developed-by: Souradeep <soura@imap.linux.ibm.com>
> Signed-off-by: Souradeep <soura@imap.linux.ibm.com>
> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

I'm assuming it's been determined that there's no value in letting
userspace see db/dbx/etc in a read-only way in static mode?

With one comment below:

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
> =C2=A0Documentation/ABI/testing/sysfs-secvar=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 9 ++++--
> =C2=A0arch/powerpc/platforms/pseries/plpks-secvar.c | 28 ++++++++++++++++=
-
> --
> =C2=A02 files changed, 30 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/ABI/testing/sysfs-secvar
> b/Documentation/ABI/testing/sysfs-secvar
> index 857cf12b0904..2bdc7d9c0c10 100644
> --- a/Documentation/ABI/testing/sysfs-secvar
> +++ b/Documentation/ABI/testing/sysfs-secvar
> @@ -22,9 +22,12 @@ Description:	A string indicating which backend is
> in use by the firmware.
> =C2=A0		and is expected to be "ibm,edk2-compat-v1".
> =C2=A0
> =C2=A0		On pseries/PLPKS, this is generated by the kernel
> based on the
> -		version number in the SB_VERSION variable in the
> keystore, and
> -		has the form "ibm,plpks-sb-v<version>", or
> -		"ibm,plpks-sb-unknown" if there is no SB_VERSION
> variable.
> +		existence of the SB_VERSION property in firmware.
> This string
> +		takes the form "ibm,plpks-sb-v1" in the presence of
> SB_VERSION,
> +		indicating the key management mode is dynamic.
> Otherwise it
> +		takes the form "ibm,plpks-sb-v0" in the static key
> management
> +		mode. Only secvars relevant to the key management
> mode are
> +		exposed.

Everything except the last sentence here is relevant to the previous
patch in the series (noting my comments on the previous patch about the
string).

The last sentence is more related to the <variable name> entry than the
format entry, and perhaps worth including a list of what variables are
applicable to each mode.

> =C2=A0
> =C2=A0What:		/sys/firmware/secvar/vars/<variable name>
> =C2=A0Date:		August 2019
> diff --git a/arch/powerpc/platforms/pseries/plpks-secvar.c
> b/arch/powerpc/platforms/pseries/plpks-secvar.c
> index d57067a733ab..cbcb2c356f2a 100644
> --- a/arch/powerpc/platforms/pseries/plpks-secvar.c
> +++ b/arch/powerpc/platforms/pseries/plpks-secvar.c
> @@ -59,7 +59,14 @@ static u32 get_policy(const char *name)
> =C2=A0		return PLPKS_SIGNEDUPDATE;
> =C2=A0}
> =C2=A0
> -static const char * const plpks_var_names[] =3D {
> +static const char * const plpks_var_names_static[] =3D {
> +	"PK",
> +	"moduledb",
> +	"trustedcadb",
> +	NULL,
> +};
> +
> +static const char * const plpks_var_names_dynamic[] =3D {
> =C2=A0	"PK",
> =C2=A0	"KEK",
> =C2=A0	"db",
> @@ -207,21 +214,34 @@ static int plpks_max_size(u64 *max_size)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static const struct secvar_operations plpks_secvar_ops_static =3D {
> +	.get =3D plpks_get_variable,
> +	.set =3D plpks_set_variable,
> +	.format =3D plpks_secvar_format,
> +	.max_size =3D plpks_max_size,
> +	.config_attrs =3D config_attrs,
> +	.var_names =3D plpks_var_names_static,
> +};
> =C2=A0
> -static const struct secvar_operations plpks_secvar_ops =3D {
> +static const struct secvar_operations plpks_secvar_ops_dynamic =3D {
> =C2=A0	.get =3D plpks_get_variable,
> =C2=A0	.set =3D plpks_set_variable,
> =C2=A0	.format =3D plpks_secvar_format,
> =C2=A0	.max_size =3D plpks_max_size,
> =C2=A0	.config_attrs =3D config_attrs,
> -	.var_names =3D plpks_var_names,
> +	.var_names =3D plpks_var_names_dynamic,
> =C2=A0};
> =C2=A0
> =C2=A0static int plpks_secvar_init(void)
> =C2=A0{
> +	u8 mode;
> +
> =C2=A0	if (!plpks_is_available())
> =C2=A0		return -ENODEV;
> =C2=A0
> -	return set_secvar_ops(&plpks_secvar_ops);
> +	mode =3D plpks_get_sb_keymgmt_mode();
> +	if (mode)
> +		return set_secvar_ops(&plpks_secvar_ops_dynamic);
> +	return set_secvar_ops(&plpks_secvar_ops_static);
> =C2=A0}
> =C2=A0machine_device_initcall(pseries, plpks_secvar_init);

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

