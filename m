Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD37C894A49
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 06:10:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tcMIk8CL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V7vY850jxz3fQH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 15:10:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tcMIk8CL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V7vXN2Xq8z3bqC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Apr 2024 15:09:23 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4323uaiE032351;
	Tue, 2 Apr 2024 04:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=dHST0nCg/dfpDjZARJiHgxFVHYoADxIocRJUjNkmbak=;
 b=tcMIk8CL80zujxRPXHBSi/lOtS/rpK1qdazOkTpPqmkvpyds4o9h9BATLZ5nI7zxj06A
 Pukp9WqgXtostWyEdytIIx+6ao6xXctV2kgY0aGKBOA3yP5hqcsSoGcz5KTVzXL3FEpm
 JyFkDyjpHK35i6ke3lje4GhaeTyYZdjUmGcW1T71TmmIAU7wrBxgNXwmZEjysLh7fKGx
 UCVl8sQWL9R73dbnQkFosQ0kx9R5pREOmajWC7cK+3G3sNTfynE3EOGv1a0rK65YIJ+j
 Q86sicb0KyGuGE88yNW1pWwNnBlKtc/hmf9PeIC8bso7k5yoUVOc5LEy7SclZ0RasblP zA== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x8a4qg1w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 04:09:16 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4321ocUq015234;
	Tue, 2 Apr 2024 04:09:15 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x6y9kuw0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 04:09:15 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43249BRk25821640
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Apr 2024 04:09:13 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AFB6220043;
	Tue,  2 Apr 2024 04:09:11 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 38AA020040;
	Tue,  2 Apr 2024 04:09:11 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  2 Apr 2024 04:09:11 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.36.2.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 437FE602C6;
	Tue,  2 Apr 2024 15:09:07 +1100 (AEDT)
Message-ID: <ad4c59257e4133d3b99248c89745f569308b8de3.camel@linux.ibm.com>
Subject: Re: [PATCH v1] powerpc: Error on assembly warnings
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 02 Apr 2024 15:09:05 +1100
In-Reply-To: <20240326044420.577031-1-bgray@linux.ibm.com>
References: <20240326044420.577031-1-bgray@linux.ibm.com>
Autocrypt: addr=ajd@linux.ibm.com; prefer-encrypt=mutual;
 keydata=mDMEZPaWfhYJKwYBBAHaRw8BAQdAAuMUoxVRwqphnsFua1W+WBz6I2cIn0+Ox4YypJSdBJ+0MEFuZHJldyBEb25uZWxsYW4gKElCTSBzdHVmZikgPGFqZEBsaW51eC5pYm0uY29tPoiTBBMWCgA7FiEE01kE3s9shZVYLX1Aj1Qx8QRYRqAFAmT2ln4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQj1Qx8QRYRqAdswD8DhIh4trRQYiPe+7LaM7q+0+Thz+CwUJCW3UFOf0SEO0BAPNdsi7aVV+4Oah6nYzqzH5Zbs4Tz5RY+Vsf+DD/EzUKuDgEZPaWfhIKKwYBBAGXVQEFAQEHQLN9moJRqN8Zop/kcyIjga+2qzLoVaNAL6+4diGnlr1xAwEIB4h4BBgWCgAgFiEE01kE3s9shZVYLX1Aj1Qx8QRYRqAFAmT2ln4CGwwACgkQj1Qx8QRYRqCYkwD/W+gIP9kITfU4wnLtueFUThxA0T/LF49M7k31Qb8rPCwBALeEYAlX648lzjSA07pJB68Jt39FuUno444dSVmhYtoH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ubQMZEIHbkoYOOmn3pGDWM1Ur4mFkjpz
X-Proofpoint-GUID: ubQMZEIHbkoYOOmn3pGDWM1Ur4mFkjpz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_18,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxlogscore=962
 mlxscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2404020028
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

On Tue, 2024-03-26 at 15:44 +1100, Benjamin Gray wrote:
> We currently enable -Werror on the arch/powerpc subtree. However this
> only catches C warnings. Assembly warnings are logged, but the make
> invocation will still succeed. This can allow incorrect syntax such
> as
>=20
> =C2=A0 ori r3, r4, r5
>=20
> to be compiled without catching that the assembler is treating r5
> as the immediate value 5.
>=20
> To prevent this in assembly files and inline assembly, add the
> -fatal-warnings option to assembler invocations.
>=20
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

Seems like a good idea to me!

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
Tested-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
> =C2=A0arch/powerpc/Kbuild | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/Kbuild b/arch/powerpc/Kbuild
> index 22cd0d55a892..da862e9558bc 100644
> --- a/arch/powerpc/Kbuild
> +++ b/arch/powerpc/Kbuild
> @@ -1,5 +1,6 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0
> -subdir-ccflags-$(CONFIG_PPC_WERROR) :=3D -Werror
> +subdir-ccflags-$(CONFIG_PPC_WERROR) :=3D -Werror -Wa,-fatal-warnings
> +subdir-asflags-$(CONFIG_PPC_WERROR) :=3D -Wa,-fatal-warnings
> =C2=A0
> =C2=A0obj-y +=3D kernel/
> =C2=A0obj-y +=3D mm/

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
