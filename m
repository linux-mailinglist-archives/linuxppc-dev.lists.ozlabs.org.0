Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0D98AC69D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 10:19:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JzS1BfwQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNJ7N1gzcz3dKH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 18:19:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JzS1BfwQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNJ6c2mxcz2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 18:18:32 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43M7VxR3027745;
	Mon, 22 Apr 2024 08:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=iHtK4/K4kZi8qHZQJYt5YiS118CRdpELwFWH9wFEmf0=;
 b=JzS1BfwQy6SKNfodHluA+YIYFh+XALMGlq7E4wI9W8JNw7hcPi7Q2PEr/Q12s25z5Mz0
 FiRwjgYgTLT4G3iMqM7oLfx3ZQg2m6U4x/qtEW51MybBh6Ur1WWBLIJqGHzGesf51WDF
 3MIF47oGO7M5/0vqieJboYHpLpXsNmyjI68Hh185QL2XYJu32PA28H2igKTedjteRDjP
 H5ogYlyAtioSxjdCh11nlbe6JKBUqtmAbjVwc966PQ9DGCdfxWlSRnLC+UHAP6hBLAIH
 o0H/xq7dBkURW7p5LqX6S2Kq/BM1p/ihM544HXt2/AgHnq8M6qKS5Hz8ZA2MFrLaxp0R tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xnkk6r2y2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 08:18:27 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43M8IQLR004531;
	Mon, 22 Apr 2024 08:18:26 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xnkk6r2y0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 08:18:26 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43M6ZUTe023042;
	Mon, 22 Apr 2024 08:18:25 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xms1npja8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 08:18:25 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43M8ILcR38601158
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Apr 2024 08:18:23 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B34DE20043;
	Mon, 22 Apr 2024 08:18:21 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D683F20040;
	Mon, 22 Apr 2024 08:18:20 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 22 Apr 2024 08:18:20 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 589C4600D6;
	Mon, 22 Apr 2024 18:18:17 +1000 (AEST)
Message-ID: <064f5bec41f3ef827463b620023778e01d5e7769.camel@linux.ibm.com>
Subject: Re: [PATCH v4] powerpc/pseries: make max polling consistent for
 longer H_CALLs
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 22 Apr 2024 18:18:12 +1000
In-Reply-To: <20240418031230.170954-1-nayna@linux.ibm.com>
References: <20240418031230.170954-1-nayna@linux.ibm.com>
Autocrypt: addr=ajd@linux.ibm.com; prefer-encrypt=mutual;
 keydata=mDMEZPaWfhYJKwYBBAHaRw8BAQdAAuMUoxVRwqphnsFua1W+WBz6I2cIn0+Ox4YypJSdBJ+0MEFuZHJldyBEb25uZWxsYW4gKElCTSBzdHVmZikgPGFqZEBsaW51eC5pYm0uY29tPoiTBBMWCgA7FiEE01kE3s9shZVYLX1Aj1Qx8QRYRqAFAmT2ln4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQj1Qx8QRYRqAdswD8DhIh4trRQYiPe+7LaM7q+0+Thz+CwUJCW3UFOf0SEO0BAPNdsi7aVV+4Oah6nYzqzH5Zbs4Tz5RY+Vsf+DD/EzUKuDgEZPaWfhIKKwYBBAGXVQEFAQEHQLN9moJRqN8Zop/kcyIjga+2qzLoVaNAL6+4diGnlr1xAwEIB4h4BBgWCgAgFiEE01kE3s9shZVYLX1Aj1Qx8QRYRqAFAmT2ln4CGwwACgkQj1Qx8QRYRqCYkwD/W+gIP9kITfU4wnLtueFUThxA0T/LF49M7k31Qb8rPCwBALeEYAlX648lzjSA07pJB68Jt39FuUno444dSVmhYtoH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: l4UQeqmiNhysHoSZTdjU1GxcbYTrbZfS
X-Proofpoint-GUID: BgIf3WwshxY7H03DSidrf-JKn0zMXcMU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_05,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404220037
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
Cc: Greg Joyce <gjoyce@linux.vnet.ibm.com>, npiggin@gmail.com, Nageswara R Sastry <rnsastry@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2024-04-17 at 23:12 -0400, Nayna Jain wrote:
> Currently, plpks_confirm_object_flushed() function polls for 5msec in
> total instead of 5sec.
>=20
> Keep max polling time consistent for all the H_CALLs, which take
> longer
> than expected, to be 5sec. Also, make use of fsleep() everywhere to
> insert delay.
>=20
> Reported-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
> Fixes: 2454a7af0f2a ("powerpc/pseries: define driver for Platform
> KeyStore")
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
> v4:
> =C2=A0* As per Andrew's feedback, squashed Patch 2 with Patch 1.
> Now it is single patch.
>=20
> v3:
> =C2=A0* Addition to Patch 1 timeout patch based on Andrew's feedback.
>=20
> v2:
> * Updated based on feedback from Michael Ellerman
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Replaced usleep_range with fsl=
eep.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Since there is no more need to=
 specify range, sleep time is
> reverted back to 10 msec.
>=20
> =C2=A0arch/powerpc/include/asm/plpks.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 5 ++---
> =C2=A0arch/powerpc/platforms/pseries/plpks.c | 10 +++++-----
> =C2=A02 files changed, 7 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/plpks.h
> b/arch/powerpc/include/asm/plpks.h
> index 23b77027c916..7a84069759b0 100644
> --- a/arch/powerpc/include/asm/plpks.h
> +++ b/arch/powerpc/include/asm/plpks.h
> @@ -44,9 +44,8 @@
> =C2=A0#define PLPKS_MAX_DATA_SIZE		4000
> =C2=A0
> =C2=A0// Timeouts for PLPKS operations
> -#define PLPKS_MAX_TIMEOUT		5000 // msec
> -#define PLPKS_FLUSH_SLEEP		10 // msec
> -#define PLPKS_FLUSH_SLEEP_RANGE		400
> +#define PLPKS_MAX_TIMEOUT		(5 * USEC_PER_SEC)
> +#define PLPKS_FLUSH_SLEEP		10000 // usec
> =C2=A0
> =C2=A0struct plpks_var {
> =C2=A0	char *component;
> diff --git a/arch/powerpc/platforms/pseries/plpks.c
> b/arch/powerpc/platforms/pseries/plpks.c
> index febe18f251d0..4a595493d28a 100644
> --- a/arch/powerpc/platforms/pseries/plpks.c
> +++ b/arch/powerpc/platforms/pseries/plpks.c
> @@ -415,8 +415,7 @@ static int plpks_confirm_object_flushed(struct
> label *label,
> =C2=A0			break;
> =C2=A0		}
> =C2=A0
> -		usleep_range(PLPKS_FLUSH_SLEEP,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 PLPKS_FLUSH_SLEEP +
> PLPKS_FLUSH_SLEEP_RANGE);
> +		fsleep(PLPKS_FLUSH_SLEEP);
> =C2=A0		timeout =3D timeout + PLPKS_FLUSH_SLEEP;
> =C2=A0	} while (timeout < PLPKS_MAX_TIMEOUT);
> =C2=A0
> @@ -464,9 +463,10 @@ int plpks_signed_update_var(struct plpks_var
> *var, u64 flags)
> =C2=A0
> =C2=A0		continuetoken =3D retbuf[0];
> =C2=A0		if (pseries_status_to_err(rc) =3D=3D -EBUSY) {
> -			int delay_ms =3D get_longbusy_msecs(rc);
> -			mdelay(delay_ms);
> -			timeout +=3D delay_ms;
> +			int delay_us =3D get_longbusy_msecs(rc) *
> 1000;
> +
> +			fsleep(delay_us);
> +			timeout +=3D delay_us;
> =C2=A0		}
> =C2=A0		rc =3D pseries_status_to_err(rc);
> =C2=A0	} while (rc =3D=3D -EBUSY && timeout < PLPKS_MAX_TIMEOUT);

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
