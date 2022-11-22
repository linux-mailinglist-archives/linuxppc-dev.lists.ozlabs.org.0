Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A074D633464
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 05:21:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGWKf3rR8z3cFP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 15:21:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e2DcV8Uj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e2DcV8Uj;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGWJl0vVWz2yHc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 15:20:38 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AM1xTKi008980
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 04:20:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ILTWbSbCe87Aoeq4lm/DWkC04ZnfNRT2DfM/7Z8pZ7M=;
 b=e2DcV8UjPWLUNeLPtUki8aGtGIpiD6Xbom6+b0hb2OaMMdZYthgZQBiVYYyltTcOJLjB
 BtvX1Mh+4xlpuHd3X7G12hB4VCEqWSK0h76Y+tyRG65X/vXy/7hHyU4J8/uM+b2sfmrj
 VNk0lihBVB6YryPys+0zftNpMwwkO4lnysfMmrYLrExLHTLiavbfpnj1mcw2ZfIhvHMA
 A9n6dPjcvZB6r64BslpvlZaiMN0H5dfmgmmlxRAJDxRG5KVGspAXggsU1gltAnxmxP1v
 BoyXqaG4+pQZ03Nx8bFsuVh2dNITNbvqDsx0he9TxSJGAmBbUOCSokoTitNgr11ztBz2 Pg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0n8g2ckx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 04:20:35 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AM4KZ8P020027
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 04:20:35 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0n8g2ckc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 04:20:35 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AM47jNe022486;
	Tue, 22 Nov 2022 04:20:33 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03fra.de.ibm.com with ESMTP id 3kxps92mmq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 04:20:33 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AM4KVwt65732952
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Nov 2022 04:20:31 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5AE7CA4051;
	Tue, 22 Nov 2022 04:20:31 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B0DD0A4040;
	Tue, 22 Nov 2022 04:20:30 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 22 Nov 2022 04:20:30 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 02162600F3;
	Tue, 22 Nov 2022 15:20:27 +1100 (AEDT)
Message-ID: <0618ef6bf94e5f5cb59e873b6faae956dd99f22b.camel@linux.ibm.com>
Subject: Re: [PATCH 09/13] powerpc/rtas: mandate RTAS syscall filtering
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 22 Nov 2022 15:20:27 +1100
In-Reply-To: <20221118150751.469393-10-nathanl@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
	 <20221118150751.469393-10-nathanl@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PBm3IiX6wLZD8jX1PdkkEPhArUBX3AG9
X-Proofpoint-ORIG-GUID: ZcfPlIzwG-mY-dZgSwAeWL8faeFDk5av
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_18,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=860 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211220028
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2022-11-18 at 09:07 -0600, Nathan Lynch wrote:
> CONFIG_PPC_RTAS_FILTER has been optional but default-enabled since
> its
> introduction. It's been enabled in enterprise distro kernels for a
> while without causing ABI breakage that wasn't easily fixed, and it
> prevents harmful abuses of the rtas syscall.
>=20
> Let's make it unconditional.
>=20
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

Agreed.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
> =C2=A0arch/powerpc/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 -----=
--------
> =C2=A0arch/powerpc/kernel/rtas.c | 16 ----------------
> =C2=A02 files changed, 29 deletions(-)
>=20
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 2ca5418457ed..8092915a4e9b 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -1012,19 +1012,6 @@ config PPC_SECVAR_SYSFS
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 read/write operati=
ons on these variables. Say Y if you have
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 secure boot enable=
d and want to expose variables to
> userspace.
> =C2=A0
> -config PPC_RTAS_FILTER
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool "Enable filtering of RTAS=
 syscalls"
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default y
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on PPC_RTAS
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The RTAS syscall API ha=
s security issues that could be used
> to
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compromise system integ=
rity. This option enforces
> restrictions on the
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RTAS calls and argument=
s passed by userspace programs to
> mitigate
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 these issues.
> -
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Say Y unless you know w=
hat you are doing and the filter is
> causing
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 problems for you.
> -
> =C2=A0endmenu
> =C2=A0
> =C2=A0config ISA_DMA_API
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index c3142d352f41..3929bcea92c0 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -1051,8 +1051,6 @@ noinstr struct pseries_errorlog
> *get_pseries_errorlog(struct rtas_error_log *log
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NULL;
> =C2=A0}
> =C2=A0
> -#ifdef CONFIG_PPC_RTAS_FILTER
> -
> =C2=A0/*
> =C2=A0 * The sys_rtas syscall, as originally designed, allows root to pas=
s
> =C2=A0 * arbitrary physical addresses to RTAS calls. A number of RTAS
> calls
> @@ -1201,20 +1199,6 @@ static void __init
> rtas_syscall_filter_init(void)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0rtas_filters[i].token =3D
> rtas_token(rtas_filters[i].name);
> =C2=A0}
> =C2=A0
> -#else
> -
> -static bool block_rtas_call(int token, int nargs,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 struct rtas_args *args)
> -{
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return false;
> -}
> -
> -static void __init rtas_syscall_filter_init(void)
> -{
> -}
> -
> -#endif /* CONFIG_PPC_RTAS_FILTER */
> -
> =C2=A0/* We assume to be passed big endian arguments */
> =C2=A0SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
> =C2=A0{

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
