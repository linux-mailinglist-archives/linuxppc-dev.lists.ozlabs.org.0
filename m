Return-Path: <linuxppc-dev+bounces-8910-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FAAAC1CAE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 07:57:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3ZF61pZXz2yWK;
	Fri, 23 May 2025 15:57:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747979850;
	cv=none; b=AjANfkjXmrIys28FzyJDBt1av0HY3ifBfCes/qSWu5xw895sVwFx4eAxfGzZuncvRltc54iDpRvqqcWiJmwx6nequn7W2xP5/ostzvX9TuofzrGiZqpepsLtRR9lnYk4H0bBzZOMhQLoLG21r+pVBEJu3fAYOsv4hT1XAqtU38zPtYhWOgVGZK03LvZrzWrimaSvuZYqD8xBDc+tg6J0h7zbs8Wu/d6stx5EVwmMVhPqIrdQJMDhM4dUEI+MYf82kHqLg2Iyj03V3nCQzcV6HTgrfkTsOTJAXS0+5V9Wqbw2KFUXDQfUSrhTiwBgAvY7WE06wdketfTuqSNNFu9kRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747979850; c=relaxed/relaxed;
	bh=0RnJL3KkZs3wmTkJxrlJtYFbridthCOY7DfKrAWdtAE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mqs3mNntJBq+aBdn4FWOYafzQexB3Yvi13g2N4kfAijfhE5nKPtyJD5YOvNM4M+hM1rY/aWHmYwrkZrK+DKfZ4xcHRcd5EhOrTxpplrruLGlS3G201umu0o0DwAQxTJLWP9uo0xEJu6dBliSLUvgw2cpPo6Vbj5z/D/N3euXf9yUGf7IQpIsTix7jdjeRzQhnCGEeIZKIK8whhqKWdqunP7LC3/kMGdmmXpN8Xm+lQ2i3k76yTpt6g0Y8wfFMqC2b8ZDbCYNbNdhDalQa/6MDGrf7lroddRltRTNx/V/0u5hd0ug1DHABmEYdBJqeFNBRcCHdc4tjtSizjNKo1jUTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l6ch7RBb; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l6ch7RBb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3ZF45WRDz2ySV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 15:57:27 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MNW6bD030284;
	Fri, 23 May 2025 05:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=0RnJL3
	KkZs3wmTkJxrlJtYFbridthCOY7DfKrAWdtAE=; b=l6ch7RBbOQY7digoycCCke
	kHz/0TtkbPEIpVa2MlgsaeU3eT2yYOcvhvzPLWKzzDnjF3tnZWb4nvgVN3MVYUib
	FQ43NrCcgbBsoHuMruNjMJVdO37ZabkYTEeGMjcQcjkb9Iz4kjm0sPP83gLAYcIW
	4+IAq1roMBmBpHL8s7h/YIkdaOluEePhAniOKkWLxDYZkuQUfH8YNLE6PCXoKwy8
	ce2Bdq/XNoemQWStLsIdqW8fYEg+GNzn2jajMgbie8TJPI6MQAv53DYkSxPC98yk
	01VlobtxS8Xw5MBPiZX0896xH7WziLQYEhDEwki+Awido9/ITWPEDQf9iaP4sE7w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46t669kgr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 05:57:15 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54N5tk8K030055;
	Fri, 23 May 2025 05:57:14 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46t669kgr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 05:57:14 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54N25cEL032117;
	Fri, 23 May 2025 05:57:13 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46rwnmn4vq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 05:57:13 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54N5vCPW56885674
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 May 2025 05:57:12 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 099CE20043;
	Fri, 23 May 2025 05:57:12 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BAEB20040;
	Fri, 23 May 2025 05:57:11 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 May 2025 05:57:11 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6FA546013B;
	Fri, 23 May 2025 15:57:08 +1000 (AEST)
Message-ID: <c06c6a36356ce803654a441d4b8b2901b5f78007.camel@linux.ibm.com>
Subject: Re: [PATCH v2 1/3] powerpc/pseries: Correct secvar format
 representation for static key management
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Srish Srinivasan <ssrish@linux.ibm.com>, linux-integrity@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, zohar@linux.ibm.com,
        nayna@linux.ibm.com, linux-kernel@vger.kernel.org
Date: Fri, 23 May 2025 15:57:08 +1000
In-Reply-To: <20250521105759.8408-2-ssrish@linux.ibm.com>
References: <20250521105759.8408-1-ssrish@linux.ibm.com>
	 <20250521105759.8408-2-ssrish@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
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
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=RrPFLDmK c=1 sm=1 tr=0 ts=68300e3b cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=j0dSOGOAlxuxqmnNqi0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: CcDd9yrN8iS_71Noi58spuEXY0J0-olV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA0OCBTYWx0ZWRfX1YhB2V5/JjNn sPp7ZpATPI9/oBkdmpiKK1L9XM928hmJOzDCCXyIAIw7qrvowq40TERRHIQl1NTBGc4M5Z2Ujrl YH0KNfgV5U6P1g9bQClKf2NFsUV0Q6VYzjYKkLe88O0Qzyn1ZS/mju876Ysn68M2PGyC5dzzB1l
 hULn6kLqb0boh2R92jt6sRqAiWFaf94ojCfs72mZhAzOOuCqr5o0+ilSa/19DZEaoGATYf4faCF 63mwXq/hKPVEL7ovdOx4zFTupSV0OziJuID4/zQr4SlA1Kau7EAl3qKZTQwBQ31jln72OqpTSq0 xWMz3DuXFxBuAELDbwJY68/416x2270X4BVtxCH3WgpEldOJnC/XtxwZOZtJTphPLyU7CdUuxKX
 n7h2YCvW63wWtuSqi3ExImVkA2GN0prGxCulr0jI2BuVObcBLCBXOcP0GFZatZw7r4ELrDxK
X-Proofpoint-GUID: TDISRVUD4u5HTs9v5BOFugVfQcdQG2ZJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230048
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 2025-05-21 at 16:27 +0530, Srish Srinivasan wrote:
> On a PLPKS enabled PowerVM LPAR, the secvar format property for
> static
> key management is misrepresented as "ibm,plpks-sb-unknown", creating
> reason for confusion.
>=20
> Static key management mode uses fixed, built-in keys. Dynamic key
> management mode allows keys to be updated in production to handle
> security updates without firmware rebuilds.
>=20
> Define a function named plpks_get_sb_keymgmt_mode() to retrieve the
> key management mode based on the existence of the SB_VERSION property
> in the firmware.
>=20
> Set the secvar format property to either "ibm,plpks-sb-v<version>" or
> "ibm,plpks-sb-v0" based on the key management mode, and return the
> length of the secvar format property.
>=20
> Co-developed-by: Souradeep <soura@imap.linux.ibm.com>
> Signed-off-by: Souradeep <soura@imap.linux.ibm.com>
> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Reviewed-by: Nayna Jain <nayna@linux.ibm.com>

Thanks for the fixes, minor comment about the docs below.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
> =C2=A0Documentation/ABI/testing/sysfs-secvar=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 9 ++-
> =C2=A0arch/powerpc/platforms/pseries/plpks-secvar.c | 76 +++++++++++-----=
-
> --
> =C2=A02 files changed, 52 insertions(+), 33 deletions(-)
>=20
> diff --git a/Documentation/ABI/testing/sysfs-secvar
> b/Documentation/ABI/testing/sysfs-secvar
> index 857cf12b0904..45281888e520 100644
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
> +		version number in the SB_VERSION variable in the
> keystore. The
> +		version numbering in the SB_VERSION variable starts
> from 1. The
> +		format string takes the form "ibm,plpks-sb-
> v<version>" in the
> +		case of dynamic key management mode. Otherwise, for
> any error in
> +		reading SB_VERSION it takes the form "ibm,plpks-sb-
> v0",
> +		indicating that the key management mode is static.

This last sentence is true, but makes it sound like static mode is only
used in case of errors.

Something like:

"If the SB_VERSION variable does not exist (or there is an error while
reading it), it takes the form "ibm,plpks-sb-v0", indicating that the
key management mode is static."

might be slightly clearer?

> =C2=A0
> =C2=A0What:		/sys/firmware/secvar/vars/<variable name>
> =C2=A0Date:		August 2019
> diff --git a/arch/powerpc/platforms/pseries/plpks-secvar.c
> b/arch/powerpc/platforms/pseries/plpks-secvar.c
> index 257fd1f8bc19..767e5e8c6990 100644
> --- a/arch/powerpc/platforms/pseries/plpks-secvar.c
> +++ b/arch/powerpc/platforms/pseries/plpks-secvar.c
> @@ -152,39 +152,55 @@ static int plpks_set_variable(const char *key,
> u64 key_len, u8 *data,
> =C2=A0	return rc;
> =C2=A0}
> =C2=A0
> -// PLPKS dynamic secure boot doesn't give us a format string in the
> same way OPAL does.
> -// Instead, report the format using the SB_VERSION variable in the
> keystore.
> -// The string is made up by us, and takes the form "ibm,plpks-sb-
> v<n>" (or "ibm,plpks-sb-unknown"
> -// if the SB_VERSION variable doesn't exist). Hypervisor defines the
> SB_VERSION variable as a
> -// "1 byte unsigned integer value".
> -static ssize_t plpks_secvar_format(char *buf, size_t bufsize)
> +/*
> + * Return the key management mode.
> + *
> + * SB_VERSION is defined as a "1 byte unsigned integer value",
> taking values
> + * starting from 1. It is owned by the Partition Firmware and its
> presence
> + * indicates that the key management mode is dynamic. Any failure in
> + * reading SB_VERSION defaults the key management mode to static.
> The error
> + * codes -ENOENT or -EPERM are expected in static key management
> mode. An
> + * unexpected error code will have to be investigated. Only signed
> variables
> + * have null bytes in their names, SB_VERSION does not.
> + *
> + * Return 0 to indicate that the key management mode is static.
> Otherwise
> + * return the SB_VERSION value to indicate that the key management
> mode is
> + * dynamic.
> + */
> +static u8 plpks_get_sb_keymgmt_mode(void)
> =C2=A0{
> -	struct plpks_var var =3D {0};
> -	ssize_t ret;
> -	u8 version;
> -
> -	var.component =3D NULL;
> -	// Only the signed variables have null bytes in their names,
> this one doesn't
> -	var.name =3D "SB_VERSION";
> -	var.namelen =3D strlen(var.name);
> -	var.datalen =3D 1;
> -	var.data =3D &version;
> -
> -	// Unlike the other vars, SB_VERSION is owned by firmware
> instead of the OS
> -	ret =3D plpks_read_fw_var(&var);
> -	if (ret) {
> -		if (ret =3D=3D -ENOENT) {
> -			ret =3D snprintf(buf, bufsize, "ibm,plpks-sb-
> unknown");
> -		} else {
> -			pr_err("Error %ld reading SB_VERSION from
> firmware\n", ret);
> -			ret =3D -EIO;
> -		}
> -		goto err;
> +	u8 mode;
> +	ssize_t rc;
> +	struct plpks_var var =3D {
> +		.component =3D NULL,
> +		.name =3D "SB_VERSION",
> +		.namelen =3D 10,
> +		.datalen =3D 1,
> +		.data =3D &mode,
> +	};
> +
> +	rc =3D plpks_read_fw_var(&var);
> +	if (rc) {
> +		if (rc !=3D -ENOENT && rc !=3D -EPERM)
> +			pr_info("Error %ld reading SB_VERSION from
> firmware\n", rc);
> +		mode =3D 0;
> =C2=A0	}
> +	return mode;
> +}
> =C2=A0
> -	ret =3D snprintf(buf, bufsize, "ibm,plpks-sb-v%hhu", version);
> -err:
> -	return ret;
> +/*
> + * PLPKS dynamic secure boot doesn't give us a format string in the
> same way
> + * OPAL does. Instead, report the format using the SB_VERSION
> variable in the
> + * keystore. The string, made up by us, takes the form of either
> + * "ibm,plpks-sb-v<n>" or "ibm,plpks-sb-v0", based on the key
> management mode,
> + * and return the length of the secvar format property.
> + */
> +static ssize_t plpks_secvar_format(char *buf, size_t bufsize)
> +{
> +	u8 mode;
> +
> +	mode =3D plpks_get_sb_keymgmt_mode();
> +	return snprintf(buf, bufsize, "ibm,plpks-sb-v%hhu", mode);
> =C2=A0}
> =C2=A0
> =C2=A0static int plpks_max_size(u64 *max_size)

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

