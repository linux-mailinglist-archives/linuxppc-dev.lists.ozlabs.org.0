Return-Path: <linuxppc-dev+bounces-8289-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA7AAA8E5E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 May 2025 10:38:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrZfk5dbTz2ypW;
	Mon,  5 May 2025 18:38:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746434286;
	cv=none; b=YRicXl07l9Xfp5KTUsqfnfo7eN8wL+U+15I4tQDWx3KEUlxktzDdXogSgpSHWMIeXH2cxFqOgrtNQClG6OCFYGrscXDWbtI4KMxvprBk9SRVfrR0sDraLJmBTmO9E2R0k8KrOAA5GOqjUiNGSM49nH1BG5/GgEKrBFOUMM4rBxT1kNVVt2sEy3tU/9LKvBHeMfxpZu9UOksDyWgZwYIxRoITC7fnggHku3kLXU0JDyKGeIKTa33o7tTgqEr/GD/xfcfMoOtibjic2XLA6xQVam4uEX1NG1e7bHjLBGRB/C91NfN2DpmPRXMXOQSJfU7Hfw9ieXV2AKgOEkTBD6YU3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746434286; c=relaxed/relaxed;
	bh=LywqfgG4de4hJBurtxECn5eIa16W1Bwx6BfjvKmTng4=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fFUYdCss93Vx7rQYpS3QP/oyCgVDB+z9TU+Kzzwmc8b81rFpY1i+hr5HvVrXt4Wl5suwdAvZC+e3cFsyFWAStVWHdVKX65J8xD0eAxwZHrl35CNVzRUNHrsEiAObddBD9xvQtSun/2deG6ud7HI2H4NGxZasYgAfHIMSvSD08vd0gkUZM/4hs37JF/BhWDo5cBjFds4jhXPL+kbN/PQ+p+sa3H482xFDcOMO7TsYQNjzthxfQjxft/ZBUkpb+f8ak3E7SXRAgOPeGQgFgSQXGGxFQGVRR0QxaqW84uIdTnfIrrdztFbBpebJSyjdWaYRYT9cjyrbmmV1nnGDgfXQAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Z70BRVGa; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Z70BRVGa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZrZfj5ZjGz2ym0
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 May 2025 18:38:05 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5453MSMc003688;
	Mon, 5 May 2025 08:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Lywqfg
	G4de4hJBurtxECn5eIa16W1Bwx6BfjvKmTng4=; b=Z70BRVGapAlp5duTaDomlL
	1Dqi0ZIj3MaXf0soeNBCfdtQV66bM+6o7UUleooHvq4KEs+OBANjCq3yK+GsY23x
	O25H/v2sKmCPMile8kKXdiF6lCZ+d8PAbDckJD5Trr1LK33G8Fzj0n/RP1BStJt0
	5W0cF3L+XQqVNbJJjimh5YM/DVrO9pRUc6WMxvYTmWmLxTVjdZyQGLTxDeinQTK6
	TIwWST4ZTtHxZ9Ye0i1TeZLirWJdusEqJZcxPUUL9JvPdFIAqGaEeYqc+llmWe4W
	sE+R2k0X4SX/qU8MkBBRfZiA9cCe/ipy5Gkj60hQoQVcDwnKGOTnNLjtrexWtrNg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46e6prb9w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 08:37:52 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5458bqfu006030;
	Mon, 5 May 2025 08:37:52 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46e6prb9w0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 08:37:52 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54585Dve002738;
	Mon, 5 May 2025 08:37:51 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dxfnndam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 08:37:51 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5458bn5J42336670
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 08:37:49 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 528F020043;
	Mon,  5 May 2025 08:37:49 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8623920040;
	Mon,  5 May 2025 08:37:48 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 May 2025 08:37:48 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.150.10.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0DC9560241;
	Mon,  5 May 2025 18:37:37 +1000 (AEST)
Message-ID: <87e1185273ce21e5fd69ff071a1be986c2a0301a.camel@linux.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/pseries: Correct secvar format
 representation for static key management
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Srish Srinivasan <ssrish@linux.ibm.com>, linux-integrity@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, zohar@linux.ibm.com,
        nayna@linux.ibm.com, linux-kernel@vger.kernel.org
In-Reply-To: <20250430090350.30023-2-ssrish@linux.ibm.com>
References: <20250430090350.30023-1-ssrish@linux.ibm.com>
		 <20250430090350.30023-2-ssrish@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 May 2025 18:36:48 +1000
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
X-Authority-Analysis: v=2.4 cv=Cu2/cm4D c=1 sm=1 tr=0 ts=681878e0 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=1pvdWtJzRr1Y9INs5CoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: yx3h9ve6ShKO-texLBxnTSRaohqZR4Ku
X-Proofpoint-ORIG-GUID: VdGR1Qa07CAO3f1MDrLGFO6ai_BUFzNs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA4MSBTYWx0ZWRfX5g3ZjRuJ6sZ2 2NqHrtyk7ynUxkVnTzWp7DZdY9x/ZCZK7QACeBrlgi8lvFjPvekzpTVYxEB+QqSxrTKhcjPMAoE lZRctGyOAKNEdMRYAVMf+PVa25FvvRSdArFsloE5d0HLo4dYEyZMaXgT6GwtvlZMY2FPW9X9rZm
 0HQYOYoZm3+VOeV/ghJGXFNV7uRwXFnoyL2aPwJlni847Zvzh5BbznmfwdaCKrddrvVR+m7jzjI KLTv8sL7lnweIZ6SmJodn3moNToqRGjeWIeroycjMbbJ7skRonkDifJq/KihkDuyImzj29uB5gG AwnhLh6BUE7QG8B1i0OUXkqRI9kSdShV5C1z5O+DKsz5yfZOWFnntbahrssR1o7lB5wobJoooj1
 K7Tdo+wYyrx3qo5Yk/YsFfaHN+Ym6WSfU4PJeE0UX337YzTFSd6otwekW7NIrd8zHVmzqriA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050081
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 2025-04-30 at 14:33 +0530, Srish Srinivasan wrote:
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
> Set the secvar format property to either "ibm,plpks-sb-v1" or
> "ibm,plpks-sb-v0" based on the key management mode, and return the
> length of the secvar format property.
>=20
> Co-developed-by: Souradeep <soura@imap.linux.ibm.com>
> Signed-off-by: Souradeep <soura@imap.linux.ibm.com>
> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
> =C2=A0arch/powerpc/platforms/pseries/plpks-secvar.c | 70 +++++++++++-----=
-
> --
> =C2=A01 file changed, 40 insertions(+), 30 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/pseries/plpks-secvar.c
> b/arch/powerpc/platforms/pseries/plpks-secvar.c
> index 257fd1f8bc19..d57067a733ab 100644
> --- a/arch/powerpc/platforms/pseries/plpks-secvar.c
> +++ b/arch/powerpc/platforms/pseries/plpks-secvar.c
> @@ -152,39 +152,49 @@ static int plpks_set_variable(const char *key,
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
> + * SB_VERSION is defined as a "1 byte unsigned integer value". It is
> owned by
> + * the Partition Firmware and its presence indicates that the key
> management
> + * mode is dynamic. Only signed variables have null bytes in their
> names.
> + * SB_VERSION does not.
> + *
> + * Return 1 to indicate that the key management mode is dynamic.
> Otherwise
> + * return 0, indicating that the key management mode is static.
> + */

This description isn't accurate.

For dynamic mode, it doesn't return 1, it returns whatever version is
defined in SB_VERSION, which could be 1, or could at some later point be
a higher version.

Which makes the function name a bit of a misnomer too - it is returning
the version number, just the version number can now be zero.

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
> +		pr_info("Error %ld reading SB_VERSION from
> firmware\n", rc);

We need to check for -ENOENT, otherwise this message is going to be
printed every time you boot a machine in static mode.

I think you should handle this as the existing code does: if it's
ENOENT, return 0, and for other codes print an error and return -EIO.

> +		mode =3D 0;
> =C2=A0	}
> +	return mode;
> +}
> =C2=A0
> -	ret =3D snprintf(buf, bufsize, "ibm,plpks-sb-v%hhu", version);
> -err:
> -	return ret;
> +// PLPKS dynamic secure boot doesn't give us a format string in the
> same way
> +// OPAL does. Instead, report the format using the SB_VERSION
> variable in the
> +// keystore. The string, made up by us, takes the form "ibm,plpks-
> sb-v<n>".Set
> +// the secvar format property to either "ibm,plpks-sb-v1" or
> "ibm,plpks-sb-v0",
> +// based on the key management mode, and return the length of the
> secvar format
> +// property.
> +static ssize_t plpks_secvar_format(char *buf, size_t bufsize)
> +{
> +	u8 mode;
> +
> +	mode =3D plpks_get_sb_keymgmt_mode();
> +	return snprintf(buf, bufsize, "ibm,plpks-sb-v%hhu", mode);

It might be better to use something like "ibm,plpks-sb-static" in place
of "ibm,plpks-sb-v0" to make it instantly clear that static mode
doesn't use the same version numbering scheme as dynamic mode.

> =C2=A0}
> =C2=A0
> =C2=A0static int plpks_max_size(u64 *max_size)

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

