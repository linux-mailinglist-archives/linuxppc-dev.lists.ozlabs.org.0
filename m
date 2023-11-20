Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E0A7F0B2A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 04:58:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VpwNGsjA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYYdh1f0Bz3cVq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 14:58:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VpwNGsjA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYYbx2hFTz3cRt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 14:57:01 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AJNfDGW026148;
	Mon, 20 Nov 2023 03:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=WlYDNhr6ooHMGNRvBiEiz00YaEUx1ajSPwwmcShHacY=;
 b=VpwNGsjAwWXbg3w1ZYYWDNW8I/oaqEUUBA8WBgQJD0zp6WAiZGAEslHUHrZI0wNevpg1
 MZQmPYYcpxBjIL6ROFd1EC4IYa+hqFrScVOkGMiIRhqiyZIPdVsARn7y7ObcZ1uLsyPA
 xroqVKrb3cpOmdnE8a9tNXZoaWMR0GbM4Hf+ef9GpoMEbWeQDbtxyXrnFc5akcRpC3Kj
 8iqaDvJc/0jFBOsYCECxME8a+pxsbpbpTccUvFD1mncfChITp4flTyXiJ5+frMUxPBMh
 wb7FotPbCwbTaDev++5PsAqov8NacE0AnAlx70m4hU2n67DwaYe4QKf65NoI4MBP4cs1 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uf7khcwau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 03:56:52 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AK3B1k3032377;
	Mon, 20 Nov 2023 03:56:51 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uf7khcwan-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 03:56:51 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AK1jYMo032390;
	Mon, 20 Nov 2023 03:56:50 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uf9tjxb16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 03:56:50 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AK3umlV55574984
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Nov 2023 03:56:49 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D756B2004B;
	Mon, 20 Nov 2023 03:56:48 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 661AE20043;
	Mon, 20 Nov 2023 03:56:48 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 20 Nov 2023 03:56:48 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DFAF6600A7;
	Mon, 20 Nov 2023 14:56:46 +1100 (AEDT)
Message-ID: <5e43e79a9aa4418d50c8e52759a9212248a0dfbc.camel@linux.ibm.com>
Subject: Re: [PATCH v2 2/5] powerpc/rtas: Remove unused
 rtas_service_present()
From: Andrew Donnellan <ajd@linux.ibm.com>
To: nathanl@linux.ibm.com, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas
	Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Date: Mon, 20 Nov 2023 14:56:46 +1100
In-Reply-To: <20231114-rtas-trivial-v2-2-59cbab208d57@linux.ibm.com>
References: <20231114-rtas-trivial-v2-0-59cbab208d57@linux.ibm.com>
	 <20231114-rtas-trivial-v2-2-59cbab208d57@linux.ibm.com>
Autocrypt: addr=ajd@linux.ibm.com; prefer-encrypt=mutual;
 keydata=mDMEZPaWfhYJKwYBBAHaRw8BAQdAAuMUoxVRwqphnsFua1W+WBz6I2cIn0+Ox4YypJSdBJ+0MEFuZHJldyBEb25uZWxsYW4gKElCTSBzdHVmZikgPGFqZEBsaW51eC5pYm0uY29tPoiTBBMWCgA7FiEE01kE3s9shZVYLX1Aj1Qx8QRYRqAFAmT2ln4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQj1Qx8QRYRqAdswD8DhIh4trRQYiPe+7LaM7q+0+Thz+CwUJCW3UFOf0SEO0BAPNdsi7aVV+4Oah6nYzqzH5Zbs4Tz5RY+Vsf+DD/EzUKuDgEZPaWfhIKKwYBBAGXVQEFAQEHQLN9moJRqN8Zop/kcyIjga+2qzLoVaNAL6+4diGnlr1xAwEIB4h4BBgWCgAgFiEE01kE3s9shZVYLX1Aj1Qx8QRYRqAFAmT2ln4CGwwACgkQj1Qx8QRYRqCYkwD/W+gIP9kITfU4wnLtueFUThxA0T/LF49M7k31Qb8rPCwBALeEYAlX648lzjSA07pJB68Jt39FuUno444dSVmhYtoH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oJzPanHMcKjo8Hds2ulAVqszDmGW1g6E
X-Proofpoint-GUID: SMNhshGIvlKTOa_Q89bcUuI16zYKUbiy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_01,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 mlxlogscore=988 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311200027
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
Cc: linuxppc-dev@lists.ozlabs.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2023-11-14 at 11:22 -0600, Nathan Lynch via B4 Relay wrote:
> From: Nathan Lynch <nathanl@linux.ibm.com>
>=20
> rtas_service_present() has no more users.
>=20
> rtas_function_implemented() is now the appropriate API for
> determining
> whether a given RTAS function is available to call.
>=20
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

grep confirms this.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
> =C2=A0arch/powerpc/include/asm/rtas.h | 1 -
> =C2=A0arch/powerpc/kernel/rtas.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5 -----
> =C2=A02 files changed, 6 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/rtas.h
> b/arch/powerpc/include/asm/rtas.h
> index 3bf7f0a4b07e..c6568a647cd0 100644
> --- a/arch/powerpc/include/asm/rtas.h
> +++ b/arch/powerpc/include/asm/rtas.h
> @@ -409,7 +409,6 @@ static inline bool
> rtas_function_implemented(const rtas_fn_handle_t handle)
> =C2=A0	return rtas_function_token(handle) !=3D RTAS_UNKNOWN_SERVICE;
> =C2=A0}
> =C2=A0extern int rtas_token(const char *service);
> -extern int rtas_service_present(const char *service);
> =C2=A0extern int rtas_call(int token, int, int, int *, ...);
> =C2=A0void rtas_call_unlocked(struct rtas_args *args, int token, int
> nargs,
> =C2=A0			int nret, ...);
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index eddc031c4b95..b5b340a91157 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -900,11 +900,6 @@ int rtas_token(const char *service)
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(rtas_token);
> =C2=A0
> -int rtas_service_present(const char *service)
> -{
> -	return rtas_token(service) !=3D RTAS_UNKNOWN_SERVICE;
> -}
> -
> =C2=A0#ifdef CONFIG_RTAS_ERROR_LOGGING
> =C2=A0
> =C2=A0static u32 rtas_error_log_max __ro_after_init =3D RTAS_ERROR_LOG_MA=
X;
>=20

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
