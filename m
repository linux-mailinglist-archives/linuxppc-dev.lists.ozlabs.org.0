Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 750AE6382E6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Nov 2022 04:55:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJLcj2kJJz3f4B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Nov 2022 14:55:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iQ8Kg3cu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iQ8Kg3cu;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NJLbk33VHz3c8V
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Nov 2022 14:54:58 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AP3nmw5000352;
	Fri, 25 Nov 2022 03:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=HJUienV0RagQ8gCM1SJ68Z6cmIDsNUFFsKBQDG8413g=;
 b=iQ8Kg3cu7WpY2/7tz9qVm+yzVzK6im4IEWMKXUcRI1cn45Ow+bx3+qRPngzc6QUdEeYz
 WbzhMh1ZFhTIJv1cJmvDc7qq5pwexY+9Ik+pq8ReB5WyNQriNIM2mXJRsbME6GfzwP3W
 H+mrc1ZQjoJEnbG3y4xNwNNJmgbiTOp3hjSh2s1cjDcxakYUU1Ys4x/bvM5tL7y3Mn62
 0Zw9IbXDV5mILrdqZymwU7TFpTPPkxo+/Ll8l6yfccFkLxXECB5u+wcZ35jSJP9uNfR9
 uoG2+ox0avNtqfkxydsGbxTy37Zi39+EoIsh4OQrsduMhMM8SEy5q0WNa1d+SRS8G6kV Xw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m2p5381nm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Nov 2022 03:54:49 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AP3r6Ud011719;
	Fri, 25 Nov 2022 03:54:49 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m2p5381na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Nov 2022 03:54:49 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AP3pXBm009757;
	Fri, 25 Nov 2022 03:54:46 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06ams.nl.ibm.com with ESMTP id 3kxpdj10mu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Nov 2022 03:54:46 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AP3mQeT10486424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Nov 2022 03:48:26 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 60ACC4C04A;
	Fri, 25 Nov 2022 03:54:44 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A6ED4C046;
	Fri, 25 Nov 2022 03:54:44 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 25 Nov 2022 03:54:43 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 1B95E6038E;
	Fri, 25 Nov 2022 14:54:36 +1100 (AEDT)
Message-ID: <57e96767cc52a3ce0c4d9fc25c90ada2f82eabfc.camel@linux.ibm.com>
Subject: Re: [PATCH 1/6] powerpc/pseries: fix the object owners enum value
 in plpks driver
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 25 Nov 2022 14:54:35 +1100
In-Reply-To: <20221106205839.600442-2-nayna@linux.ibm.com>
References: <20221106205839.600442-1-nayna@linux.ibm.com>
	 <20221106205839.600442-2-nayna@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LVJLmTvNs7xJOjc2iYc48jYHqCvPZbl3
X-Proofpoint-GUID: 0A_fqqcGeuXin-uKL-9qOmMfyQDuhjng
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_14,2022-11-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=991
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211250026
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
Cc: gjoyce@linux.vnet.ibm.com, npiggin@gmail.com, brking@linux.ibm.com, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 2022-11-06 at 15:58 -0500, Nayna Jain wrote:
> OS_VAR_LINUX enum in PLPKS driver should be 0x02 instead of 0x01.

This should be PLPKS_VAR_LINUX. And it's a macro, not an enum.

The new value does indeed match the (currently IBM internal)
specification - 0x01 is AIX.

>=20
> Fixes: 2454a7af0f2a ("powerpc/pseries: define driver for Platform
> KeyStore")
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>

Should be noted that at present, this macro isn't used anywhere - it is
used in a future series.

> ---
> =C2=A0arch/powerpc/platforms/pseries/plpks.h | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/platforms/pseries/plpks.h
> b/arch/powerpc/platforms/pseries/plpks.h
> index c6a291367bb1..275ccd86bfb5 100644
> --- a/arch/powerpc/platforms/pseries/plpks.h
> +++ b/arch/powerpc/platforms/pseries/plpks.h
> @@ -17,7 +17,7 @@
> =C2=A0#define WORLDREADABLE 0x08000000
> =C2=A0#define SIGNEDUPDATE 0x01000000
> =C2=A0
> -#define PLPKS_VAR_LINUX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00=
x01
> +#define PLPKS_VAR_LINUX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00=
x02
> =C2=A0#define PLPKS_VAR_COMMON=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00=
x04
> =C2=A0
> =C2=A0struct plpks_var {

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
