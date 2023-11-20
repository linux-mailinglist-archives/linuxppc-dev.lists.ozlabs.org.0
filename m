Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DFA7F0B29
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 04:57:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XB09eQku;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYYcm44Kwz3cP3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 14:57:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XB09eQku;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYYbK431lz3cPS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 14:56:29 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AK0IQNK012318;
	Mon, 20 Nov 2023 03:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=PxbmNH0nnTzBbPZDFPXLtkxS4ze4PEk8QBY37coUodY=;
 b=XB09eQkurEfk8OrL+HuHnTHzCMPBWmw/UD1BE7Ztgrp6iGaNiYz1cg4GzvG90KGuaLft
 1Wz1ARaSxQZVRNeX7ojU2qfPE+Sr+3oy1JoBrrWUFv+JG8XA8KVjX5mWkBWELuiCXFdB
 pnCjJLrygXD6CYZNED7Rk2Zo13P8PcY6LAnbQDv2UEwVGaAbS7uBFwmnMEOVCrw/Y7fK
 nhRuggjSV/Y0vTiXdqIXF62oEq4kLYT5tO7IwrVXL10GbGzXq2zFGpLCRL06gfc4acSV
 pXpUitGKDjW0JI0FQnyKw0iMaPMqDkmk1EpHsHd0IweBhkSMZQjXUIJjNh/aoYlI0X/u cw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ufrd6qxsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 03:56:17 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AK2GEL8025517;
	Mon, 20 Nov 2023 03:56:17 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ufrd6qxsm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 03:56:17 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AK1bKRC028317;
	Mon, 20 Nov 2023 03:56:16 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uf8knepqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 03:56:16 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AK3uEhc43909726
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Nov 2023 03:56:14 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A75820043;
	Mon, 20 Nov 2023 03:56:14 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1564820040;
	Mon, 20 Nov 2023 03:56:14 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 20 Nov 2023 03:56:14 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 52BA3600A7;
	Mon, 20 Nov 2023 14:56:11 +1100 (AEDT)
Message-ID: <60d0540b743f6795827334ebc66199efae032cbf.camel@linux.ibm.com>
Subject: Re: [PATCH v2 1/5] powerpc/rtas: Drop declaration of undefined
 call_rtas() function
From: Andrew Donnellan <ajd@linux.ibm.com>
To: nathanl@linux.ibm.com, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas
	Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Date: Mon, 20 Nov 2023 14:56:02 +1100
In-Reply-To: <20231114-rtas-trivial-v2-1-59cbab208d57@linux.ibm.com>
References: <20231114-rtas-trivial-v2-0-59cbab208d57@linux.ibm.com>
	 <20231114-rtas-trivial-v2-1-59cbab208d57@linux.ibm.com>
Autocrypt: addr=ajd@linux.ibm.com; prefer-encrypt=mutual;
 keydata=mDMEZPaWfhYJKwYBBAHaRw8BAQdAAuMUoxVRwqphnsFua1W+WBz6I2cIn0+Ox4YypJSdBJ+0MEFuZHJldyBEb25uZWxsYW4gKElCTSBzdHVmZikgPGFqZEBsaW51eC5pYm0uY29tPoiTBBMWCgA7FiEE01kE3s9shZVYLX1Aj1Qx8QRYRqAFAmT2ln4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQj1Qx8QRYRqAdswD8DhIh4trRQYiPe+7LaM7q+0+Thz+CwUJCW3UFOf0SEO0BAPNdsi7aVV+4Oah6nYzqzH5Zbs4Tz5RY+Vsf+DD/EzUKuDgEZPaWfhIKKwYBBAGXVQEFAQEHQLN9moJRqN8Zop/kcyIjga+2qzLoVaNAL6+4diGnlr1xAwEIB4h4BBgWCgAgFiEE01kE3s9shZVYLX1Aj1Qx8QRYRqAFAmT2ln4CGwwACgkQj1Qx8QRYRqCYkwD/W+gIP9kITfU4wnLtueFUThxA0T/LF49M7k31Qb8rPCwBALeEYAlX648lzjSA07pJB68Jt39FuUno444dSVmhYtoH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OIXfQPZFI7tgT5x1LfCXudoQNhUbZbTN
X-Proofpoint-GUID: xV8Kk57D8WBeFzOplQTk5zTnun5zZzKs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_01,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 spamscore=0 mlxlogscore=878 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> The call_rtas() function has never been a part of arch/powerpc, and
> its implementation was removed from arch/ppc by commit 0a26b1364f14
> ("ppc: Remove CHRP, POWER3 and POWER4 support from arch/ppc").
>=20
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

grep confirms this.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
> =C2=A0arch/powerpc/include/asm/rtas.h | 2 --
> =C2=A01 file changed, 2 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/rtas.h
> b/arch/powerpc/include/asm/rtas.h
> index c697c3c74694..3bf7f0a4b07e 100644
> --- a/arch/powerpc/include/asm/rtas.h
> +++ b/arch/powerpc/include/asm/rtas.h
> @@ -542,8 +542,6 @@ static inline void pSeries_coalesce_init(void) {
> }
> =C2=A0static inline void rtas_initialize(void) { }
> =C2=A0#endif
> =C2=A0
> -extern int call_rtas(const char *, int, int, unsigned long *, ...);
> -
> =C2=A0#ifdef CONFIG_HV_PERF_CTRS
> =C2=A0void read_24x7_sys_info(void);
> =C2=A0#else
>=20

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
