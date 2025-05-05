Return-Path: <linuxppc-dev+bounces-8288-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A80AA8E5A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 May 2025 10:38:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrZfS0CWCz2yMt;
	Mon,  5 May 2025 18:37:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746434271;
	cv=none; b=ehnRrKZcuRXa6VRAfKUB9CYjIJohnf3m3Nk6UMb/GIScFPoRqkb/5tS7TxqBmqD6ngxi8Jf1JtJTtHvWSwCxFhdt0+/T3KTAeU/GtBZehcMs6hV9tO5EJ7XWU2V7LO1MpxzfpokMUOmlUHTB5wXQ36RWD8Yq0kEg7guT0L/lFDEU8s65INMhodqTf+Rmw1N6y5kv3zeaT1E0T8uJf6ekZatZx53VXkXlRdsnycHv7+EUjqotCjwL73UckDDTeTWB3wVb97KGeMJ2Bc2CEkYmsgJitk0Gz4pIgVPb7p+0thTTzTDvbBVyY9DO91JurOGBVD4dfIHbBVq/1/6UOl4T7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746434271; c=relaxed/relaxed;
	bh=HjYHCJhbRLYeVswYwB35b/DJ1fdM5oC6Lp9G8JqiXI8=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=nVMvnTgMn1JXI2LmtC5l9MkVoN0jzE4LPVYtfbVid10I+g2eWZiFvdxCcDlrArPR2Iw+PPB3ilKBCrfWzL2Oi7MRPadUg2sIKwQHuaBnxAuK8dzUPaVelG/JVbdZ8na3yIBt8SxtJYV/B9IjrynoXyXv/O/XVehcQpct1c5ouN5lEtxxSwDIA1GoaoedS7Q+IYjQzYgpK+fYbvDXJgsKcuM9gSzRTKpXvH/4YpRX7zUiEqTIPABxty11qcnNFEtvrzwkS1ANCHPFhWjlGt0W6YXfYkS0mAghMB2CnCKgfDA3PYCwG/8yNz8KdITpB0dbAkwHpWFiujiOcIQPg+Cpug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=meO40LlA; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=meO40LlA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZrZfR2C5yz2ym0
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 May 2025 18:37:50 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54580qap022980;
	Mon, 5 May 2025 08:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=HjYHCJ
	hbRLYeVswYwB35b/DJ1fdM5oC6Lp9G8JqiXI8=; b=meO40LlAdpbll/EdEIz01x
	vTAqHlMX5Ml6TWtiw8fA6rmllm5D4k+tfRO356o6/x6caH9cavzPgLjiDO/ic0+A
	qnIOk/qhV10eiddq9dkl4BDCFd4v1w6un//Wn4eROOfajh5yNKu2w6OntUYRizwr
	zyy8ZvEgRra+i4ruYxx8PLau9hBZk+ZXoI6H5OsTUXJHCQGrR9hlvERi9LsBYrej
	cVnvhU2SBPEdtCJwvUYDzbF6MdHf42rkAp/EU9xniWsaRzWP8Kfkq+y06Un/YLKl
	B7VlFKdYSAH/HXC2bI8b9aAZ4l3tIBHdJIXholcrheOFmMflwu5B3WpJYRHsLGSg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46e65huf7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 08:37:38 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5458ax2V026700;
	Mon, 5 May 2025 08:37:37 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46e65huf7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 08:37:37 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 545802OM002728;
	Mon, 5 May 2025 08:37:36 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dxfnnd9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 08:37:36 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5458bYDQ52822368
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 08:37:34 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5851E2004D;
	Mon,  5 May 2025 08:37:34 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E51462004B;
	Mon,  5 May 2025 08:37:33 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 May 2025 08:37:33 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.150.10.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C9E9260241;
	Mon,  5 May 2025 18:37:26 +1000 (AEST)
Message-ID: <94b81671ec25c305e0cc6a7d2df0c03cce979d0f.camel@linux.ibm.com>
Subject: Re: [PATCH 3/3] integrity/platform_certs: Allow loading of keys in
 static key management mode
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Srish Srinivasan <ssrish@linux.ibm.com>, linux-integrity@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, zohar@linux.ibm.com,
        nayna@linux.ibm.com, linux-kernel@vger.kernel.org
In-Reply-To: <20250430090350.30023-4-ssrish@linux.ibm.com>
References: <20250430090350.30023-1-ssrish@linux.ibm.com>
	 <20250430090350.30023-4-ssrish@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 May 2025 17:55:02 +1000
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
X-Authority-Analysis: v=2.4 cv=UZ1RSLSN c=1 sm=1 tr=0 ts=681878d2 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=Aq5ags53wHl_a6Sg2LMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: X0nGukAsK2T5V_918jrYKVFHxYn-9pvF
X-Proofpoint-ORIG-GUID: wWoF-Pp3jSh573gDWcBHqZ4l2c1w4Qdg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA4MSBTYWx0ZWRfX+JXLkQ1DbHhk bTsyzci1/PAbjSxz9okf3kCg0AyqcwsJKLZb/TuN988BiH560wY6ioiN6xnltNoNEkBG76AtHLn 2vSKsac6QxtpPZPEnwZXb/XPRAYBnUq2RDuSb7xMrgThkjjku7yiw1vyQNYGGRWJj/tx5lsA6ZI
 jrn/kT0/a4/PNnnu/0ORISHx9TJwAWj5YwkU4a/YVCvK42Gf74KXluwv908zKVArJt7XaldFkZ3 bZn4L6VPC5N3aKArpCpI4X9QeVD9dghJjpFAQqDxI3IZl/zM2uwcjIWCb6qoP5PbA2Yh0ibW/sQ J0sKHNa/cvXrEx1YwGQLtOJvAu674m4uVKXC+g88ul6mTG26/zSJXDnigf/lntfaA6ZbpXL8r04
 yG2h2QunL2PpkZ3WVriTLsK1bCf9k2GTeIUmJ8iz62D/75a+AY3f0jxsnr+SirjPzLuzxdj7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 impostorscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050081
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 2025-04-30 at 14:33 +0530, Srish Srinivasan wrote:
> On PLPKS enabled PowerVM LPAR, there is no provision to load signed
> third-party kernel modules when the key management mode is static.
> This
> is because keys from secure boot secvars are only loaded when the key
> management mode is dynamic.
>=20
> Allow loading of the trustedcadb and moduledb keys even in the static
> key management mode, where the secvar format string takes the form
> "ibm,plpks-sb-v0".
>=20
> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
> =C2=A0security/integrity/platform_certs/load_powerpc.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/security/integrity/platform_certs/load_powerpc.c
> b/security/integrity/platform_certs/load_powerpc.c
> index c85febca3343..714c961a00f5 100644
> --- a/security/integrity/platform_certs/load_powerpc.c
> +++ b/security/integrity/platform_certs/load_powerpc.c
> @@ -75,12 +75,13 @@ static int __init load_powerpc_certs(void)
> =C2=A0		return -ENODEV;
> =C2=A0
> =C2=A0	// Check for known secure boot implementations from OPAL or
> PLPKS
> -	if (strcmp("ibm,edk2-compat-v1", buf) && strcmp("ibm,plpks-
> sb-v1", buf)) {
> +	if (strcmp("ibm,edk2-compat-v1", buf) && strcmp("ibm,plpks-
> sb-v1", buf) &&
> +	=C2=A0=C2=A0=C2=A0 strcmp("ibm,plpks-sb-v0", buf)) {
> =C2=A0		pr_err("Unsupported secvar implementation \"%s\",
> not loading certs\n", buf);
> =C2=A0		return -ENODEV;
> =C2=A0	}
> =C2=A0
> -	if (strcmp("ibm,plpks-sb-v1", buf) =3D=3D 0)
> +	if (strcmp("ibm,plpks-sb-v1", buf) =3D=3D 0 ||
> strcmp("ibm,plpks-sb-v0", buf) =3D=3D 0)
> =C2=A0		/* PLPKS authenticated variables ESL data is
> prefixed with 8 bytes of timestamp */
> =C2=A0		offset =3D 8;
> =C2=A0

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

