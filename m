Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D92E47F0B2D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 04:59:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZOgr5cQp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYYg05L5kz3cRy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 14:59:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZOgr5cQp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYYf906lZz2xFl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 14:58:56 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AK2EPRQ017073;
	Mon, 20 Nov 2023 03:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=garyn13FBlX4Lgir4RtVqxrBVmghlDIXJ7AilseSek4=;
 b=ZOgr5cQpVFusQxnr4iq5uZC0cKlMYsJOQT5NfsdNwJzFBROde8dXFkRYStPuGSRLLlcl
 rZM1JYl74Zw5jcESm7GmrLk8IxXZ3ml4s4cSAUUCtrPJpddcqkEwD5W7lKeX/Kg7ib7v
 I9MZPHrFrK14N5vTK4FkHJ0fR6h3Ni+5taI+s0uHn2il8dt/q8pSyaqBZFp1mR0xK4Ft
 9IKzck1IslfaX6tSpohMRieFvI37EuPtmX5hsgD1MYfF0Eqq43XwySJPHR8+HV3lJ1Jx
 kCQW4a0v+JAoB3NKYEEBGIywaoeLgcN22GVlYBEim5iBfiB1SZ243QXe1m4aYA1L3R9X Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ufmv131fy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 03:58:48 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AK3vXKl015334;
	Mon, 20 Nov 2023 03:58:47 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ufmv131fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 03:58:47 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AK1U9ZA028785;
	Mon, 20 Nov 2023 03:58:47 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uf8kneq2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 03:58:46 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AK3wiSH61997528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Nov 2023 03:58:45 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE57E20043;
	Mon, 20 Nov 2023 03:58:44 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08EC720040;
	Mon, 20 Nov 2023 03:58:44 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 20 Nov 2023 03:58:43 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id CB41C600A7;
	Mon, 20 Nov 2023 14:58:41 +1100 (AEDT)
Message-ID: <3b9adff6b3e6e565c66cd1cfaf3fb9c588df6f82.camel@linux.ibm.com>
Subject: Re: [PATCH v2 3/5] powerpc/rtas: Move post_mobility_fixup()
 declaration to pseries
From: Andrew Donnellan <ajd@linux.ibm.com>
To: nathanl@linux.ibm.com, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas
	Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Date: Mon, 20 Nov 2023 14:58:41 +1100
In-Reply-To: <20231114-rtas-trivial-v2-3-59cbab208d57@linux.ibm.com>
References: <20231114-rtas-trivial-v2-0-59cbab208d57@linux.ibm.com>
	 <20231114-rtas-trivial-v2-3-59cbab208d57@linux.ibm.com>
Autocrypt: addr=ajd@linux.ibm.com; prefer-encrypt=mutual;
 keydata=mDMEZPaWfhYJKwYBBAHaRw8BAQdAAuMUoxVRwqphnsFua1W+WBz6I2cIn0+Ox4YypJSdBJ+0MEFuZHJldyBEb25uZWxsYW4gKElCTSBzdHVmZikgPGFqZEBsaW51eC5pYm0uY29tPoiTBBMWCgA7FiEE01kE3s9shZVYLX1Aj1Qx8QRYRqAFAmT2ln4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQj1Qx8QRYRqAdswD8DhIh4trRQYiPe+7LaM7q+0+Thz+CwUJCW3UFOf0SEO0BAPNdsi7aVV+4Oah6nYzqzH5Zbs4Tz5RY+Vsf+DD/EzUKuDgEZPaWfhIKKwYBBAGXVQEFAQEHQLN9moJRqN8Zop/kcyIjga+2qzLoVaNAL6+4diGnlr1xAwEIB4h4BBgWCgAgFiEE01kE3s9shZVYLX1Aj1Qx8QRYRqAFAmT2ln4CGwwACgkQj1Qx8QRYRqCYkwD/W+gIP9kITfU4wnLtueFUThxA0T/LF49M7k31Qb8rPCwBALeEYAlX648lzjSA07pJB68Jt39FuUno444dSVmhYtoH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Lf21KnFjvK2C1NXByl_e0uYocT1cNS-Z
X-Proofpoint-ORIG-GUID: i-CBYO8LjmDKPswD3SIThOttY5z-NuLs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_01,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=914 lowpriorityscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311200027
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
> This is a pseries-specific function declaration that doesn't belong
> in
> rtas.h. Move it to the pseries platform code and adjust
> pseries/suspend.c accordingly.
>=20
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

This looks correct to me (the other user is in mobility.c which already
has the header file included).

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
> =C2=A0arch/powerpc/include/asm/rtas.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 1 -
> =C2=A0arch/powerpc/platforms/pseries/pseries.h | 1 +
> =C2=A0arch/powerpc/platforms/pseries/suspend.c | 1 +
> =C2=A03 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/include/asm/rtas.h
> b/arch/powerpc/include/asm/rtas.h
> index c6568a647cd0..2365668fc13e 100644
> --- a/arch/powerpc/include/asm/rtas.h
> +++ b/arch/powerpc/include/asm/rtas.h
> @@ -444,7 +444,6 @@ extern void pSeries_log_error(char *buf, unsigned
> int err_type, int fatal);
> =C2=A0#ifdef CONFIG_PPC_PSERIES
> =C2=A0extern time64_t last_rtas_event;
> =C2=A0extern int clobbering_unread_rtas_event(void);
> -extern void post_mobility_fixup(void);
> =C2=A0int rtas_syscall_dispatch_ibm_suspend_me(u64 handle);
> =C2=A0#else
> =C2=A0static inline int clobbering_unread_rtas_event(void) { return 0; }
> diff --git a/arch/powerpc/platforms/pseries/pseries.h
> b/arch/powerpc/platforms/pseries/pseries.h
> index 8376f03f932a..1c2d736f600d 100644
> --- a/arch/powerpc/platforms/pseries/pseries.h
> +++ b/arch/powerpc/platforms/pseries/pseries.h
> @@ -55,6 +55,7 @@ extern int dlpar_detach_node(struct device_node *);
> =C2=A0extern int dlpar_acquire_drc(u32 drc_index);
> =C2=A0extern int dlpar_release_drc(u32 drc_index);
> =C2=A0extern int dlpar_unisolate_drc(u32 drc_index);
> +void post_mobility_fixup(void);
> =C2=A0
> =C2=A0void queue_hotplug_event(struct pseries_hp_errorlog *hp_errlog);
> =C2=A0int handle_dlpar_errorlog(struct pseries_hp_errorlog *hp_errlog);
> diff --git a/arch/powerpc/platforms/pseries/suspend.c
> b/arch/powerpc/platforms/pseries/suspend.c
> index 5c43435472cc..382003dfdb9a 100644
> --- a/arch/powerpc/platforms/pseries/suspend.c
> +++ b/arch/powerpc/platforms/pseries/suspend.c
> @@ -13,6 +13,7 @@
> =C2=A0#include <asm/mmu.h>
> =C2=A0#include <asm/rtas.h>
> =C2=A0#include <asm/topology.h>
> +#include "pseries.h"
> =C2=A0
> =C2=A0static struct device suspend_dev;
> =C2=A0
>=20

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
