Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C77573610D0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 19:10:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLm7Q2YkFz3bvN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 03:10:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E83ohc5Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=E83ohc5Y; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLm6t1Yfdz2yys
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 03:09:57 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13FH5QoL109381; Thu, 15 Apr 2021 13:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=RNOY/d8yZYRP0pLhpV+4fVvzfWSWc4YU6tDtd0XuG74=;
 b=E83ohc5YAGm8DZMiH2sUboATQCBIZU8MzD5q0bzbAMU+Au/WK3l80BU7NshxFrGTOLC/
 PUGFW/sKAmDMRwyJwU8a6f+WlseUc3bwsGtmfjJ5QtKAyVjuussJAqYNM0lAhzmMXjRx
 pF/Ed8M/60GbAQXzwSWTlSqxfkpKPMGmtna0hlcvsrEjys93iUoJmaoY0YbWDVLoEqc4
 CNgnIekb93v6bxqU3AggG0jIsrcbBBsdXXJUtFVOEyB3e+vZwnO03ApQlVzZuzm1Jur2
 HYAxoFSuDZcCC+mWNnzR0fp5WK8Ic0v0f3AVcLZ1iZRzihFM5PhFkM517/R+tssmtW9b WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37xs4k8x49-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 13:09:46 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13FH68Zv114010;
 Thu, 15 Apr 2021 13:09:46 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37xs4k8x3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 13:09:45 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13FH9HkA025538;
 Thu, 15 Apr 2021 17:09:43 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 37u3n8c189-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 17:09:43 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13FH9Jxd27329006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Apr 2021 17:09:19 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 394F4AE056;
 Thu, 15 Apr 2021 17:09:41 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40AB5AE053;
 Thu, 15 Apr 2021 17:09:38 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.199.56.7])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 15 Apr 2021 17:09:38 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Thu, 15 Apr 2021 22:39:37 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] powerpc/papr_scm: Properly handle UUID types and
 API
In-Reply-To: <20210415134637.17770-1-andriy.shevchenko@linux.intel.com>
References: <20210415134637.17770-1-andriy.shevchenko@linux.intel.com>
Date: Thu, 15 Apr 2021 22:39:37 +0530
Message-ID: <87eefblbji.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jdyrEc2zCvE--isOIPFNk9uE2Dg2D-xg
X-Proofpoint-ORIG-GUID: fkD8rdMtqEd7WlUBrb8Ef_ID3XQ4kkOs
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_09:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 adultscore=0 clxscore=1011 bulkscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104150106
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
Cc: Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Thanks for the patch Andy,

Unfortunately ran into a compilation issue due to missing "#include
<asm/unaligned.h>" that provides definition for
get_unaligned_le64(). Gcc reported following error:
=20
error: implicit declaration of function =E2=80=98get_unaligned_le64=E2=80=99

After including the necessary header file, kernel compiled fine and I
was able to test & verify the patch.

--=20
Cheers
~ Vaibhav

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

> Parse to and export from UUID own type, before dereferencing.
> This also fixes wrong comment (Little Endian UUID is something else)
> and should fix Sparse warnings about assigning strict types to POD.
>
> Fixes: 43001c52b603 ("powerpc/papr_scm: Use ibm,unit-guid as the iset coo=
kie")
> Fixes: 259a948c4ba1 ("powerpc/pseries/scm: Use a specific endian format f=
or storing uuid from the device tree")
> Cc: Oliver O'Halloran <oohall@gmail.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> Not tested
>  arch/powerpc/platforms/pseries/papr_scm.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/pla=
tforms/pseries/papr_scm.c
> index ae6f5d80d5ce..4366e1902890 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -1085,8 +1085,9 @@ static int papr_scm_probe(struct platform_device *p=
dev)
>  	u32 drc_index, metadata_size;
>  	u64 blocks, block_size;
>  	struct papr_scm_priv *p;
> +	u8 uuid_raw[UUID_SIZE];
>  	const char *uuid_str;
> -	u64 uuid[2];
> +	uuid_t uuid;
>  	int rc;
>=20=20
>  	/* check we have all the required DT properties */
> @@ -1129,16 +1130,18 @@ static int papr_scm_probe(struct platform_device =
*pdev)
>  	p->hcall_flush_required =3D of_property_read_bool(dn, "ibm,hcall-flush-=
required");
>=20=20
>  	/* We just need to ensure that set cookies are unique across */
> -	uuid_parse(uuid_str, (uuid_t *) uuid);
> +	uuid_parse(uuid_str, &uuid);
> +
>  	/*
>  	 * cookie1 and cookie2 are not really little endian
> -	 * we store a little endian representation of the
> +	 * we store a raw buffer representation of the
>  	 * uuid str so that we can compare this with the label
>  	 * area cookie irrespective of the endian config with which
>  	 * the kernel is built.
>  	 */
> -	p->nd_set.cookie1 =3D cpu_to_le64(uuid[0]);
> -	p->nd_set.cookie2 =3D cpu_to_le64(uuid[1]);
> +	export_uuid(uuid_raw, &uuid);
> +	p->nd_set.cookie1 =3D get_unaligned_le64(&uuid_raw[0]);
> +	p->nd_set.cookie2 =3D get_unaligned_le64(&uuid_raw[8]);
>=20=20
>  	/* might be zero */
>  	p->metadata_size =3D metadata_size;
> --=20
> 2.30.2
>

