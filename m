Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 056D77F0B2F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 05:01:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mwpJWzVb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYYhd6YBZz3dHP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 15:01:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mwpJWzVb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYYgm0Cryz2xFl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 15:00:19 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AK3sHU7028378;
	Mon, 20 Nov 2023 04:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=W8eE6Pu4RY3CvN+/0SIorGrGNSG12vuH3bPVfKf3E3A=;
 b=mwpJWzVbwW/szaUunNBjCbQb9YVkC60/WeuFx5I2i1+hP2bY4MfaWmigQ7ei2T/MrtsV
 ak8eLx2Volsr62DKkOt/rkUibM8zCAVIc1bB6RoztxAWmUYNhFDC94BP0lfQud5y6M68
 wFls9jAQylcn/Ha1ZLdwBfeLzFAYbvPYgfKVANpAtiDT7NOTEI4KhiR1OGD1pVOIdsaP
 BWOv4NXaZEnCg2vlSMH+zGwmBv7PjaDXE+U2xzvSo1UliZqN5WYHmM11/pqGiyXXq3Vm
 eWK9XkUBu2bjqoYjZDxzAdJnzPlIXxD57nsqUIBZ4eP1o7SmM0WzeiFme+0fJsZP8uei xg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uf0k3jnc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 04:00:11 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AK3tfBs005207;
	Mon, 20 Nov 2023 04:00:10 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uf0k3jnbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 04:00:10 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AK1XYbP026613;
	Mon, 20 Nov 2023 04:00:09 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uf93kejxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 04:00:09 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AK407GJ10748504
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Nov 2023 04:00:07 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 671DE20040;
	Mon, 20 Nov 2023 04:00:06 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8705220043;
	Mon, 20 Nov 2023 04:00:05 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 20 Nov 2023 04:00:05 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 10A4D60100;
	Mon, 20 Nov 2023 15:00:04 +1100 (AEDT)
Message-ID: <f6152e69e6f24df66356f35053647bcf187f5a0f.camel@linux.ibm.com>
Subject: Re: [PATCH v2 4/5] powerpc/rtas: Remove trailing space
From: Andrew Donnellan <ajd@linux.ibm.com>
To: nathanl@linux.ibm.com, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas
	Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Date: Mon, 20 Nov 2023 15:00:03 +1100
In-Reply-To: <20231114-rtas-trivial-v2-4-59cbab208d57@linux.ibm.com>
References: <20231114-rtas-trivial-v2-0-59cbab208d57@linux.ibm.com>
	 <20231114-rtas-trivial-v2-4-59cbab208d57@linux.ibm.com>
Autocrypt: addr=ajd@linux.ibm.com; prefer-encrypt=mutual;
 keydata=mDMEZPaWfhYJKwYBBAHaRw8BAQdAAuMUoxVRwqphnsFua1W+WBz6I2cIn0+Ox4YypJSdBJ+0MEFuZHJldyBEb25uZWxsYW4gKElCTSBzdHVmZikgPGFqZEBsaW51eC5pYm0uY29tPoiTBBMWCgA7FiEE01kE3s9shZVYLX1Aj1Qx8QRYRqAFAmT2ln4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQj1Qx8QRYRqAdswD8DhIh4trRQYiPe+7LaM7q+0+Thz+CwUJCW3UFOf0SEO0BAPNdsi7aVV+4Oah6nYzqzH5Zbs4Tz5RY+Vsf+DD/EzUKuDgEZPaWfhIKKwYBBAGXVQEFAQEHQLN9moJRqN8Zop/kcyIjga+2qzLoVaNAL6+4diGnlr1xAwEIB4h4BBgWCgAgFiEE01kE3s9shZVYLX1Aj1Qx8QRYRqAFAmT2ln4CGwwACgkQj1Qx8QRYRqCYkwD/W+gIP9kITfU4wnLtueFUThxA0T/LF49M7k31Qb8rPCwBALeEYAlX648lzjSA07pJB68Jt39FuUno444dSVmhYtoH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Z5begk4SLb1swH5MRPsrChJIqImYZEbX
X-Proofpoint-ORIG-GUID: pIppULs8Fl8SRjUCfJJ7pcMjzwWEIvWv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_01,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311200027
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
> Use scripts/cleanfile to remove instances of trailing space in the
> core RTAS code and header.
>=20
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

Thanks for the cleanup, LGTM.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
> =C2=A0arch/powerpc/include/asm/rtas.h |=C2=A0 6 +++---
> =C2=A0arch/powerpc/kernel/rtas.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 18 +++++=
++++---------
> =C2=A02 files changed, 12 insertions(+), 12 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/rtas.h
> b/arch/powerpc/include/asm/rtas.h
> index 2365668fc13e..1bed6be8ada3 100644
> --- a/arch/powerpc/include/asm/rtas.h
> +++ b/arch/powerpc/include/asm/rtas.h
> @@ -268,7 +268,7 @@ typedef struct {
> =C2=A0#define RTAS_TYPE_DEALLOC		0xE3
> =C2=A0#define RTAS_TYPE_DUMP			0xE4
> =C2=A0#define RTAS_TYPE_HOTPLUG		0xE5
> -/* I don't add PowerMGM events right now, this is a different topic
> */=20
> +/* I don't add PowerMGM events right now, this is a different topic
> */
> =C2=A0#define RTAS_TYPE_PMGM_POWER_SW_ON	0x60
> =C2=A0#define RTAS_TYPE_PMGM_POWER_SW_OFF	0x61
> =C2=A0#define RTAS_TYPE_PMGM_LID_OPEN		0x62
> @@ -461,7 +461,7 @@ static inline void rtas_cancel_event_scan(void) {
> }
> =C2=A0
> =C2=A0/* Error types logged.=C2=A0 */
> =C2=A0#define ERR_FLAG_ALREADY_LOGGED	0x0
> -#define ERR_FLAG_BOOT		0x1=C2=A0	/* log was pulled from NVRAM
> on boot */
> +#define ERR_FLAG_BOOT		0x1	/* log was pulled from NVRAM
> on boot */
> =C2=A0#define ERR_TYPE_RTAS_LOG	0x2	/* from rtas event-scan */
> =C2=A0#define ERR_TYPE_KERNEL_PANIC	0x4	/* from die()/panic() */
> =C2=A0#define ERR_TYPE_KERNEL_PANIC_GZ 0x8	/* ditto, compressed */
> @@ -471,7 +471,7 @@ static inline void rtas_cancel_event_scan(void) {
> }
> =C2=A0	(ERR_TYPE_RTAS_LOG | ERR_TYPE_KERNEL_PANIC |
> ERR_TYPE_KERNEL_PANIC_GZ)
> =C2=A0
> =C2=A0#define RTAS_DEBUG KERN_DEBUG "RTAS: "
> -=20
> +
> =C2=A0#define RTAS_ERROR_LOG_MAX 2048
> =C2=A0
> =C2=A0/*
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index b5b340a91157..c49f078382a9 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -670,7 +670,7 @@ static void call_rtas_display_status_delay(char
> c)
> =C2=A0	static int pending_newline =3D 0;=C2=A0 /* did last write end with
> unprinted newline? */
> =C2=A0	static int width =3D 16;
> =C2=A0
> -	if (c =3D=3D '\n') {=09
> +	if (c =3D=3D '\n') {
> =C2=A0		while (width-- > 0)
> =C2=A0			call_rtas_display_status(' ');
> =C2=A0		width =3D 16;
> @@ -680,7 +680,7 @@ static void call_rtas_display_status_delay(char
> c)
> =C2=A0		if (pending_newline) {
> =C2=A0			call_rtas_display_status('\r');
> =C2=A0			call_rtas_display_status('\n');
> -		}=20
> +		}
> =C2=A0		pending_newline =3D 0;
> =C2=A0		if (width--) {
> =C2=A0			call_rtas_display_status(c);
> @@ -820,7 +820,7 @@ void rtas_progress(char *s, unsigned short hex)
> =C2=A0		else
> =C2=A0			rtas_call(display_character, 1, 1, NULL,
> '\r');
> =C2=A0	}
> -=20
> +
> =C2=A0	if (row_width)
> =C2=A0		width =3D row_width[current_line];
> =C2=A0	else
> @@ -840,9 +840,9 @@ void rtas_progress(char *s, unsigned short hex)
> =C2=A0				spin_unlock(&progress_lock);
> =C2=A0				return;
> =C2=A0			}
> -=20
> +
> =C2=A0			/* RTAS wants CR-LF, not just LF */
> -=20
> +
> =C2=A0			if (*os =3D=3D '\n') {
> =C2=A0				rtas_call(display_character, 1, 1,
> NULL, '\r');
> =C2=A0				rtas_call(display_character, 1, 1,
> NULL, '\n');
> @@ -852,7 +852,7 @@ void rtas_progress(char *s, unsigned short hex)
> =C2=A0				 */
> =C2=A0				rtas_call(display_character, 1, 1,
> NULL, *os);
> =C2=A0			}
> -=20
> +
> =C2=A0			if (row_width)
> =C2=A0				width =3D row_width[current_line];
> =C2=A0			else
> @@ -861,15 +861,15 @@ void rtas_progress(char *s, unsigned short hex)
> =C2=A0			width--;
> =C2=A0			rtas_call(display_character, 1, 1, NULL,
> *os);
> =C2=A0		}
> -=20
> +
> =C2=A0		os++;
> -=20
> +
> =C2=A0		/* if we overwrite the screen length */
> =C2=A0		if (width <=3D 0)
> =C2=A0			while ((*os !=3D 0) && (*os !=3D '\n') && (*os
> !=3D '\r'))
> =C2=A0				os++;
> =C2=A0	}
> -=20
> +
> =C2=A0	spin_unlock(&progress_lock);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(rtas_progress);		/* needed by
> rtas_flash module */
>=20

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
