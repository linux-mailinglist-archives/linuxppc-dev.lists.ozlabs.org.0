Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD97A6333A9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 04:05:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGTdV0W9Pz3cKj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 14:05:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NnYrFyQO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NnYrFyQO;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGTcW46Qpz2yyZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 14:04:10 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AM1Vada026645
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 03:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=hyK+8jrJkAwnfX8Ut5pTXwBpS1oSUkJNfj1LQEP6P5o=;
 b=NnYrFyQOXgo9zGIjD+bbF88EzR4aPenCILTIrM+DcNDKzlwFdal7BOsOx3ILBpTVRpQu
 /ZSUbGHkt3Ayw6MwJhLeaqLBLUArga4KQ65liEJ4LW0PCltN4TI14kjylUdzkP+45YK5
 fHPdqHn02foHAiQUMYvahMrG1xbVFTFtuJs5hOsapRW2GwS83ktr+Noig8o+roCsiuu7
 VJIQSIrW0Xj2Si+lIRlyHohha2W5IDxnB1hxnddVxCgz5WNyrUHUzasPwFI+Ww3XUfWR
 WYlUYHbMUeldhMouKiT7Flcal4TpbITNAqVomdVMqUoNbiyyXv6ExTvvZxt1FTn6ii28 HA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0mu7hm6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 03:04:08 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AM2wM1D027101
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 03:04:07 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0mu7hm63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 03:04:07 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AM2pVjO013164;
	Tue, 22 Nov 2022 03:04:05 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma02fra.de.ibm.com with ESMTP id 3kxps8tjyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 03:04:05 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AM342Zt5898916
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Nov 2022 03:04:02 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C1EABA404D;
	Tue, 22 Nov 2022 03:04:02 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 23FF4A4053;
	Tue, 22 Nov 2022 03:04:02 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 22 Nov 2022 03:04:02 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2C33B60151;
	Tue, 22 Nov 2022 14:04:00 +1100 (AEDT)
Message-ID: <2bb6286d131fe34b4358a962f708ee0a9b85e166.camel@linux.ibm.com>
Subject: Re: [PATCH 03/13] powerpc/rtas: avoid device tree lookups in
 rtas_os_term()
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 22 Nov 2022 14:03:59 +1100
In-Reply-To: <20221118150751.469393-4-nathanl@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
	 <20221118150751.469393-4-nathanl@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8RmP1B1WEbdcfzu56Ht_9OEb1tNYhcXU
X-Proofpoint-ORIG-GUID: _RzkugwboNYR5kLoFLwwOaZl56PuXe2u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_18,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211220020
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
> rtas_os_term() is called during panic. Its behavior depends on a
> couple of conditions in the /rtas node of the device tree, the
> traversal of which entails locking and local IRQ state changes. If
> the
> kernel panics while devtree_lock is held, rtas_os_term() as currently
> written could hang.
>=20
> Instead of discovering the relevant characteristics at panic time,
> cache them in file-static variables at boot. Note the lookup for
> "ibm,extended-os-term" is converted to of_property_read_bool() since
> it is a boolean property, not a RTAS function token.
>=20
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

This seems sensible, minor comment below.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
> =C2=A0arch/powerpc/kernel/rtas.c | 14 +++++++++++---
> =C2=A01 file changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index c12dd5ed5e00..81e4996012b7 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -947,6 +947,8 @@ void __noreturn rtas_halt(void)
> =C2=A0
> =C2=A0/* Must be in the RMO region, so we place it here */
> =C2=A0static char rtas_os_term_buf[2048];
> +static s32 ibm_os_term_token =3D RTAS_UNKNOWN_SERVICE;

s32 and int are obviously identical, but rtas_token is declared using
int, as are the other variables where we cache various tokens.

> +static bool ibm_extended_os_term;
> =C2=A0
> =C2=A0void rtas_os_term(char *str)
> =C2=A0{
> @@ -958,14 +960,13 @@ void rtas_os_term(char *str)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * this property may term=
inate the partition which we want to
> avoid
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * since it interferes wi=
th panic_timeout.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (RTAS_UNKNOWN_SERVICE =3D=
=3D rtas_token("ibm,os-term") ||
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RTAS_UNKNOW=
N_SERVICE =3D=3D rtas_token("ibm,extended-os-
> term"))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ibm_os_term_token =3D=3D R=
TAS_UNKNOWN_SERVICE ||
> !ibm_extended_os_term)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0snprintf(rtas_os_term_buf=
, 2048, "OS panic: %s", str);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0do {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0status =3D rtas_call(rtas_token("ibm,os-term"), 1, 1,
> NULL,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0status =3D rtas_call(ibm_os_term_token, 1, 1, NULL,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __pa(rtas_os_term=
_buf));
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} while (rtas_busy_delay(=
status));
> =C2=A0
> @@ -1335,6 +1336,13 @@ void __init rtas_initialize(void)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0no_entry =3D of_property_=
read_u32(rtas.dev, "linux,rtas-entry",
> &entry);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rtas.entry =3D no_entry ?=
 rtas.base : entry;
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Discover these now to avoid=
 device tree lookups in the
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * panic path.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ibm_os_term_token =3D rtas_tok=
en("ibm,os-term");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ibm_extended_os_term =3D of_pr=
operty_read_bool(rtas.dev,
> "ibm,extended-os-term");
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* If RTAS was found, all=
ocate the RMO buffer for it and look
> for
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the stop-self token if=
 any
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
