Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5866E3DA6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 04:53:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0BSD62dkz3cfj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 12:53:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ed8EdUZ7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ed8EdUZ7;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0BR956DYz3cL0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 12:52:05 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33GNuiqp012777;
	Mon, 17 Apr 2023 02:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=LsPMTX9h0E65n3F4RRpYT7w/S1F+bUfDEHsZVfy01wg=;
 b=ed8EdUZ7mzeIpSSjbeKDQGELId176Fb/SZssNXJ343HIRWlUhZkVfGEYyC8rEEK+M0ub
 RhiT5MyBiVQkbWB4OT3Dc2xoCvbwoYxxeTQmeGuEYqyewniSHT10B/W2bN1WGNbEPQWJ
 kVaPy5IAJhtclv8xHYHHcOZYmNjzYFEb7AVxz4woBDU8Zjm9WDvxFQp/iY9W6f3aEOjy
 1WLp9FEXjjdCIJQLDN7a31sExhf34c1NoYYMzcX+1rOPzaNYAq7rNtvZWPqhSRqOXrTA
 4NCPb+i5+Kg4SogZ86bmP9JDe9WBL3h/9EbtKLs7pT5Fal+vU6kJWEcCCJxJ4wMoJevk Tg== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q0e6a3hdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Apr 2023 02:52:00 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33GLieIV004216;
	Mon, 17 Apr 2023 02:51:58 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3pykj68twt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Apr 2023 02:51:58 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33H2ptxO1573608
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Apr 2023 02:51:55 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1603F20043;
	Mon, 17 Apr 2023 02:51:55 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A18620040;
	Mon, 17 Apr 2023 02:51:54 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Apr 2023 02:51:54 +0000 (GMT)
Received: from [9.192.255.36] (unknown [9.192.255.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id F2BE160142;
	Mon, 17 Apr 2023 12:51:50 +1000 (AEST)
Message-ID: <00e463e1c414efb813e80c43bbe65db04cca4e2d.camel@linux.ibm.com>
Subject: Re: [PATCH 06/32] powerpc/configs/64s: Add secure boot options to
 defconfig
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 17 Apr 2023 12:51:39 +1000
In-Reply-To: <20230414132415.821564-6-mpe@ellerman.id.au>
References: <20230414132415.821564-1-mpe@ellerman.id.au>
	 <20230414132415.821564-6-mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: e0_aeSRVLrLjrnBN5RQBNJaldTED5DQi
X-Proofpoint-GUID: e0_aeSRVLrLjrnBN5RQBNJaldTED5DQi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-16_16,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 clxscore=1011 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304170022
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2023-04-14 at 23:23 +1000, Michael Ellerman wrote:
> Add the numerous options required to get secure boot enabled.
>=20
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
> =C2=A0arch/powerpc/configs/ppc64_defconfig | 17 ++++++++++++++++-
> =C2=A01 file changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/configs/ppc64_defconfig
> b/arch/powerpc/configs/ppc64_defconfig
> index d98fe52a5892..f185adc128db 100644
> --- a/arch/powerpc/configs/ppc64_defconfig
> +++ b/arch/powerpc/configs/ppc64_defconfig
> @@ -54,6 +54,7 @@ CONFIG_CRASH_DUMP=3Dy
> =C2=A0CONFIG_FA_DUMP=3Dy
> =C2=A0CONFIG_IRQ_ALL_CPUS=3Dy
> =C2=A0CONFIG_SCHED_SMT=3Dy
> +CONFIG_PPC_SECURE_BOOT=3Dy

Can we add CONFIG_PPC_SECVAR_SYSFS=3Dy as well?

> =C2=A0CONFIG_VIRTUALIZATION=3Dy
> =C2=A0CONFIG_KVM_BOOK3S_64=3Dm
> =C2=A0CONFIG_KVM_BOOK3S_64_HV=3Dm
> @@ -335,13 +336,25 @@ CONFIG_NLS_CODEPAGE_437=3Dy
> =C2=A0CONFIG_NLS_ASCII=3Dy
> =C2=A0CONFIG_NLS_ISO8859_1=3Dy
> =C2=A0CONFIG_NLS_UTF8=3Dy
> +CONFIG_SECURITY=3Dy
> +CONFIG_SECURITY_LOCKDOWN_LSM=3Dy
> +CONFIG_SECURITY_LOCKDOWN_LSM_EARLY=3Dy
> +CONFIG_INTEGRITY_SIGNATURE=3Dy
> +CONFIG_INTEGRITY_ASYMMETRIC_KEYS=3Dy
> +CONFIG_INTEGRITY_PLATFORM_KEYRING=3Dy
> +CONFIG_IMA=3Dy
> +CONFIG_IMA_KEXEC=3Dy
> +CONFIG_IMA_DEFAULT_HASH_SHA256=3Dy
> +CONFIG_IMA_WRITE_POLICY=3Dy
> +CONFIG_IMA_APPRAISE=3Dy
> +CONFIG_IMA_ARCH_POLICY=3Dy
> +CONFIG_IMA_APPRAISE_MODSIG=3Dy
> =C2=A0CONFIG_CRYPTO_TEST=3Dm
> =C2=A0CONFIG_CRYPTO_BLOWFISH=3Dm
> =C2=A0CONFIG_CRYPTO_CAST6=3Dm
> =C2=A0CONFIG_CRYPTO_SERPENT=3Dm
> =C2=A0CONFIG_CRYPTO_TWOFISH=3Dm
> =C2=A0CONFIG_CRYPTO_PCBC=3Dm
> -CONFIG_CRYPTO_HMAC=3Dy
> =C2=A0CONFIG_CRYPTO_MICHAEL_MIC=3Dm
> =C2=A0CONFIG_CRYPTO_SHA256=3Dy
> =C2=A0CONFIG_CRYPTO_WP512=3Dm
> @@ -352,6 +365,8 @@ CONFIG_CRYPTO_SHA1_PPC=3Dm
> =C2=A0CONFIG_CRYPTO_DEV_NX=3Dy
> =C2=A0CONFIG_CRYPTO_DEV_NX_ENCRYPT=3Dm
> =C2=A0CONFIG_CRYPTO_DEV_VMX=3Dy
> +CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> +CONFIG_SYSTEM_BLACKLIST_KEYRING=3Dy
> =C2=A0CONFIG_PRINTK_TIME=3Dy
> =C2=A0CONFIG_PRINTK_CALLER=3Dy
> =C2=A0CONFIG_DEBUG_KERNEL=3Dy

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
