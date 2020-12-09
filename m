Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 171002D39AF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 05:41:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrPWc16v5zDqmh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 15:41:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rG9n9auN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrPTf3kYNzDqFG
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 15:39:34 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B94XL93142934; Tue, 8 Dec 2020 23:39:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=/0AV9Qngqn3c9QYbpN8Uha2cR24sAYVMds9C7FY8VCQ=;
 b=rG9n9auNU/1IlbfjChNUE5StDJ8mYcFp6lD+jE4yPmoo1PQbbtpvzqQv/LExU5tjrTp+
 HnRwiF6ap56ukVVu/JgD+PZlMiXiRKzgasHxF3aUTvMUStfsQIiZFik+dTOiOuC0/FJI
 E2jvC1kG+JrwN4sX8GQGNkgs718NIs52ky4CLSls5BLfBIBwim6zfAczxPmLMdPPmTEe
 18eVIshHLcV4v9Am1FieV7/CBcCRd2H+xNfErIZQzTd+3Z6RBjS9x/YY34yQ/LE808AC
 kk/owkhEKSjDzWHrZgZS14OOwPRpUj312KfrLGo+eLMzz0TNChagXdZLXxDXNqEAK8CD jA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35aab97xad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 23:39:24 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B94W7nJ022777;
 Wed, 9 Dec 2020 04:39:23 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 3581u9v1h6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 04:39:23 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B94dMtm1311332
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 04:39:22 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFF6BAC05B;
 Wed,  9 Dec 2020 04:39:22 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F08BAC059;
 Wed,  9 Dec 2020 04:39:21 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.38.90])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  9 Dec 2020 04:39:21 +0000 (GMT)
X-Mailer: emacs 27.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 04/13] powerpc/xive: Use cpu_to_node() instead of ibm,
 chip-id property
In-Reply-To: <20201208151124.1329942-5-clg@kaod.org>
References: <20201208151124.1329942-1-clg@kaod.org>
 <20201208151124.1329942-5-clg@kaod.org>
Date: Wed, 09 Dec 2020 10:09:18 +0530
Message-ID: <877dpregp5.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_03:2020-12-08,
 2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 bulkscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090031
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
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> The 'chip_id' field of the XIVE CPU structure is used to choose a
> target for a source located on the same chip when possible. This field
> is assigned on the PowerNV platform using the "ibm,chip-id" property
> on pSeries under KVM when NUMA nodes are defined but it is undefined
> under PowerVM. The XIVE source structure has a similar field
> 'src_chip' which is only assigned on the PowerNV platform.
>
> cpu_to_node() returns a compatible value on all platforms, 0 being the
> default node. It will also give us the opportunity to set the affinity
> of a source on pSeries when we can localize them.

But we should avoid assuming that linux numa node number is equivalent
to chip id [1]. What do we expect this value represents on virtualized
platforms like PowerVM and KVM? Is this used for a hcall?


[1] https://lore.kernel.org/linuxppc-dev/20200817103238.158133-1-aneesh.kum=
ar@linux.ibm.com

>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  arch/powerpc/sysdev/xive/common.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
> index ee375daf8114..605238ca65e4 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -1342,16 +1342,11 @@ static int xive_prepare_cpu(unsigned int cpu)
>=20=20
>  	xc =3D per_cpu(xive_cpu, cpu);
>  	if (!xc) {
> -		struct device_node *np;
> -
>  		xc =3D kzalloc_node(sizeof(struct xive_cpu),
>  				  GFP_KERNEL, cpu_to_node(cpu));
>  		if (!xc)
>  			return -ENOMEM;
> -		np =3D of_get_cpu_node(cpu, NULL);
> -		if (np)
> -			xc->chip_id =3D of_get_ibm_chip_id(np);
> -		of_node_put(np);
> +		xc->chip_id =3D cpu_to_node(cpu);
>  		xc->hw_ipi =3D XIVE_BAD_IRQ;
>=20=20
>  		per_cpu(xive_cpu, cpu) =3D xc;
> --=20
> 2.26.2
