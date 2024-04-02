Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA74894A5A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 06:19:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JdgyN+bx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V7vlZ06Wrz3dTn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 15:19:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JdgyN+bx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V7vkq4rH8z3bWH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Apr 2024 15:18:27 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43248KxO018722;
	Tue, 2 Apr 2024 04:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=yG/qkByzm8P0Biz7P+3Am7npaWa0Ipp2XV9p3Gx9xXc=;
 b=JdgyN+bxKZ5raWTq83zCQlVFOuWOO/BJHsE3+lsdTysNT+IJRjEMSQ8fkCdRIzUzP/XB
 h0o/BxusMxZKsiIaWxZN11050qs4AN1Q0BAD9E6MX1qxK7jC0lYSIIcGyy3FlmHpxntl
 oLBUypzm3uqDYd94dQ5jzjHLpI+rITvYrxJAhtDyeWtHgU9OBOnBd1Erb5JTfyI9g9MZ
 eFtiys4SsOmUlTdFS3nywpNrtKc6rEcdaW5+HZG1+LMgwlkty/VPheENDI8XaOw1Dyk+
 OlwOzeNLXtnjbnWH/yifnZjeQ9H28yng8dyCDiHONGAXOTwFpOMSo8bg1DLPiZP+B4rm LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x8aqhg0j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 04:18:21 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4324ILRR001551;
	Tue, 2 Apr 2024 04:18:21 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x8aqhg0j3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 04:18:21 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4322dNel029582;
	Tue, 2 Apr 2024 04:02:32 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x6ys2ureq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 04:02:32 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43242TgH54985076
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Apr 2024 04:02:31 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3666C20040;
	Tue,  2 Apr 2024 04:02:29 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9F7120043;
	Tue,  2 Apr 2024 04:02:28 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  2 Apr 2024 04:02:28 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.36.2.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 1EAC4602C6;
	Tue,  2 Apr 2024 15:02:22 +1100 (AEDT)
Message-ID: <aeaa414dd0ab4320967e0844101b2925eb76482e.camel@linux.ibm.com>
Subject: Re: [PATCH v3 2/2] powerpc/pseries: increase timeout value for
 plpks_signed_update_var() H_CALL
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 02 Apr 2024 15:02:12 +1100
In-Reply-To: <20240329020954.537236-2-nayna@linux.ibm.com>
References: <20240329020954.537236-1-nayna@linux.ibm.com>
	 <20240329020954.537236-2-nayna@linux.ibm.com>
Autocrypt: addr=ajd@linux.ibm.com; prefer-encrypt=mutual;
 keydata=mDMEZPaWfhYJKwYBBAHaRw8BAQdAAuMUoxVRwqphnsFua1W+WBz6I2cIn0+Ox4YypJSdBJ+0MEFuZHJldyBEb25uZWxsYW4gKElCTSBzdHVmZikgPGFqZEBsaW51eC5pYm0uY29tPoiTBBMWCgA7FiEE01kE3s9shZVYLX1Aj1Qx8QRYRqAFAmT2ln4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQj1Qx8QRYRqAdswD8DhIh4trRQYiPe+7LaM7q+0+Thz+CwUJCW3UFOf0SEO0BAPNdsi7aVV+4Oah6nYzqzH5Zbs4Tz5RY+Vsf+DD/EzUKuDgEZPaWfhIKKwYBBAGXVQEFAQEHQLN9moJRqN8Zop/kcyIjga+2qzLoVaNAL6+4diGnlr1xAwEIB4h4BBgWCgAgFiEE01kE3s9shZVYLX1Aj1Qx8QRYRqAFAmT2ln4CGwwACgkQj1Qx8QRYRqCYkwD/W+gIP9kITfU4wnLtueFUThxA0T/LF49M7k31Qb8rPCwBALeEYAlX648lzjSA07pJB68Jt39FuUno444dSVmhYtoH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TZGuDEG2tAjTLrAmMyl0VLxXTwQ5tLNS
X-Proofpoint-GUID: Nzsb0dRpx5xXzLmZhwCr3smwowGwZ_-i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_18,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2403210000 definitions=main-2404020028
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

On Thu, 2024-03-28 at 22:09 -0400, Nayna Jain wrote:
> Signed update H_CALL currently polls PHYP for 5msec. Update this to
> 5sec.

I think this description of the existing code's behaviour is incorrect:

- without your patch #1, the existing code polls for up to 5,000ms
- with your patch #1, the existing code polls for up to 5,000,000ms
(PLPKS_MAX_TIMEOUT is redefined in terms of microseconds, while we
still assume it's in milliseconds).

This patch should just be squashed into patch #1.

Andrew

>=20
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
> ---
> v3:
> =C2=A0* Addition to Patch 1 timeout patch based on Andrew's feedback.
>=20
> =C2=A0arch/powerpc/platforms/pseries/plpks.c | 7 ++++---
> =C2=A01 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/pseries/plpks.c
> b/arch/powerpc/platforms/pseries/plpks.c
> index bcfcd5acc5c2..4a595493d28a 100644
> --- a/arch/powerpc/platforms/pseries/plpks.c
> +++ b/arch/powerpc/platforms/pseries/plpks.c
> @@ -463,9 +463,10 @@ int plpks_signed_update_var(struct plpks_var
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
