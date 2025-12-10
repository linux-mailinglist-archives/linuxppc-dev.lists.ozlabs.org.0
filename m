Return-Path: <linuxppc-dev+bounces-14716-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A24CB3117
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Dec 2025 14:53:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRHHT1M0xz2yPR;
	Thu, 11 Dec 2025 00:53:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765374805;
	cv=none; b=NRPDmRV4eV9tXM5YVWSW3DIF2oFAbxgIHyjSF8A9LG753OxbhRXwwMCeDlSTvrU0rqLEWWmSluiFBvvfWb3D6wolUtDjG3RbzUbiIb4sksUMAZFk+WVGDwW8jHgR431CetDUR8JVCXVRNxO1v4YyUDDEXC51EO3RVdH9vR3bD1c8LRJ+LU+/KlfF/D8y3xI6mLqQUcP8D4UZ/mbKpieE0rFOVaZQB5Cd4zmYjzR0VKNA5F/P0tsjNIvAjLVwseDoQfK4WLeXRhefRWGN0ViDHTF5O7sYb2jLac4nAxkrzvWhaRz5ZzcZ3yzzNr8Ha9RdLIetTaruLbmoSn/WM1Ke7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765374805; c=relaxed/relaxed;
	bh=dTWZes8ZvdchycsAHVe85py3NMPH0/VgKP3QR2iL1Mk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mM2MccsOQ+vNWdozkKDdFRay5fbleu+F56ygxjhv13S3cA7TqCzYeJWNP24ukB0jNj0mYjrsJ4nBR0L/xV966uDD/FV5+LBjOap/1POQvgATs3fV1CkUDHaARrxfM6VA4vKjfKks2csb1mYcGDlDY5iWSHemRlTYfaiwxhguACSWQTYxGs6kAUoI2Y2pxTLaUuGXblp2Ve1jDa9u1LFVOG+dsTqEg7veR3kZ6zvRh9iZ8KB8w3HJuG6Ox9ADJQY1G51MW4d3swF82SoVamncz6Q2btO96S4t83jZM0iTLQBiT0vVX9dVIBpCKMoH1ymMI5T2B+MyvjszsvE2g1qYSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BLcSY9PV; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BLcSY9PV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRHHS10TYz2yK7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Dec 2025 00:53:23 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BA2UOw9016479;
	Wed, 10 Dec 2025 13:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=dTWZes
	8ZvdchycsAHVe85py3NMPH0/VgKP3QR2iL1Mk=; b=BLcSY9PVctRSc2QTyGCL72
	5XVMQTABrJaFqtySL1RnV8MtHFvvI1K3p4sRSthSMhyHc5PDHDvEjgt488JKjdLN
	nTF50U52hoDUW7EhXdvVwAI6+2uroGAj5bbeE8vhcCHVhcmOyToHRiLcGgrBkXpN
	WVvZIsGj2+p+dtNYMk1i28SQcDgGqiv3Co3qqBuUtq4oLgoc3RpDfKwc5G2/2Kv4
	kJ29Yaz+FQuK5I0QrFpBvkeHHmQs03OaO/TzMNLTl99TZvioirXjb2v0+aG9g7PT
	e1pChI5Ou/0T8NyqkjOOOnFdxsq0XGr/r6EF6BsP5BBBqwR4I7Re1vOTXHUBnEGw
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc53j0u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 13:53:19 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BAACLY9008472;
	Wed, 10 Dec 2025 13:53:19 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4avytn0u04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 13:53:19 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BADrFBE26477286
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Dec 2025 13:53:15 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C4892004B;
	Wed, 10 Dec 2025 13:53:15 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D2D3520040;
	Wed, 10 Dec 2025 13:53:14 +0000 (GMT)
Received: from [9.111.20.221] (unknown [9.111.20.221])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 Dec 2025 13:53:14 +0000 (GMT)
Message-ID: <7bc40b84-4f1a-453f-9040-4ceae4d7e638@linux.ibm.com>
Date: Wed, 10 Dec 2025 14:53:12 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update ocxl maintainer details
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Christophe Lombard <clombard@linux.ibm.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
References: <20251210-ocxl-maintainer-status-v1-1-d73981866db9@linux.ibm.com>
Content-Language: en-US
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20251210-ocxl-maintainer-status-v1-1-d73981866db9@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyMCBTYWx0ZWRfX1lzYZQs65XSi
 NcCdWzKOpvmi6WVUnKEZ4mkessp/7RHOTDHQmwKSaP+a124Y44Ehi54IxJlJ6luzzamWWHF5eDl
 33JS1NfdONlMd+uSoKD3qychVXOpL07UvIEKBbXn2R94MDomDQHwUbOEE72hQpAmTd5KGHfZMS5
 3l81rpgXMzgTH8LOIjMBxftbOAbluKUkFRIQfrGsDIxg4JKuaUhIN9C3oplVW+gAjNipto5o6HZ
 eNt4YiSZVVpGvHB9TbmY8X5M50/yyP6M5Bn/VZ44GyXO7ynfsVkfYGfe7bSJW4Puu01BC8q0b8R
 KCdXID8KBfYuYsjFdlGfbBN9TWMkqhcRQ2vWR4m0JGmtcTjHbSNUupPYUdJBdNkt74OZ8jMNbzX
 mbOfYiv8GzkXmyw2bEKMq5QaRTO/HQ==
X-Authority-Analysis: v=2.4 cv=S/DUAYsP c=1 sm=1 tr=0 ts=69397b50 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8 a=f1IPk2BvdpVkQlKAkqIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: 2rEqxz_JQWVUta6YpO8otKDCIS6XFfET
X-Proofpoint-GUID: 2rEqxz_JQWVUta6YpO8otKDCIS6XFfET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512060020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 10/12/2025 à 11:49, Andrew Donnellan a écrit :
> I am leaving IBM, and Fred isn't working on OpenCAPI either. Mahesh has
> kindly agreed to take over as maintainer to review the odd fixes that
> still come in, and he has plenty of powerpc-specific experience.
> 
> Add Mahesh as ocxl maintainer, remove Fred as a maintainer, and downgrade
> myself to reviewer using my personal email address.
> 
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---

Thanks Andrew! It's in good hands with Mahesh!

Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   MAINTAINERS | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aff3e162180d1c39b45ce0f046440d95509b8d9f..01007981fb2f2a23a4e748dbead45473f4d11591 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19002,8 +19002,8 @@ F:	drivers/net/dsa/ocelot/ocelot_ext.c
>   F:	include/linux/mfd/ocelot.h
>   
>   OCXL (Open Coherent Accelerator Processor Interface OpenCAPI) DRIVER
> -M:	Frederic Barrat <fbarrat@linux.ibm.com>
> -M:	Andrew Donnellan <ajd@linux.ibm.com>
> +M:	Mahesh J Salgaonkar <mahesh@linux.ibm.com>
> +R:	Andrew Donnellan <andrew+kernel@donnellan.id.au>
>   L:	linuxppc-dev@lists.ozlabs.org
>   S:	Odd Fixes
>   F:	Documentation/userspace-api/accelerators/ocxl.rst
> 
> ---
> base-commit: 0048fbb4011ec55c32d3148b2cda56433f273375
> change-id: 20251127-ocxl-maintainer-status-992761bbf02e
> 
> 
> --
> Andrew Donnellan    OzLabs, ADL Canberra
> ajd@linux.ibm.com   IBM Australia Limited
> 


