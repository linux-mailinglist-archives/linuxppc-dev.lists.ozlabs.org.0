Return-Path: <linuxppc-dev+bounces-3335-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDDB9D008B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2024 19:49:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrNH35FqHz2yVd;
	Sun, 17 Nov 2024 05:49:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731782991;
	cv=none; b=L9o0Qge74pndhl+grdoIdnPUpl7XrJMNbVeSMUUSgXnLFtbC27xHmAMz0zQoicjSkROs88faChKbYf5PbdTvBS2JX78K0FI3ZOto2bgggeIKC8h/UVZDiHCSW+upTM1fXX2KkVRLErb38bqSXBpbBlCm9LeVHwL95JO/1EKQ85TH/PrzIQ/4zBEOeeTxBx0iryOBLMASLlIW+SWJfrOCOtc9e3PivJglxwopAsgSg31vacHo9pjlzugXDy5tEQyGFo6eHNLW2g9DJQBzDUyf8qcGuYVODIlXFV1SMnAxe/djvorDFt5f37xYeXqG7AkVO5/dQkbTAWaWayPG1X9fgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731782991; c=relaxed/relaxed;
	bh=6xeBH+PbA82p0Um5syqepIg2jkxHzt8iwRiqtTHV8cw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GHYD7dKqI3pMnSUllruwZSB0dqCJullDzzEgWodrYZDeAFsxcEcXuo//hQVZjVwidxINUCkR27L39y+14uhIixmXVII974yvw8bWiav1KAsAFqE/JnfeAOByz8F7GPxupsmE5Nq+9lyvyOQh7RjTdapGJhQeDgO7XND/EhHdXf1iHD8M9BZnPyh9qPOiop1lTrUuQeP++KDa84BCQMRp7HR2qufL5++kgSMukQwY0lDT769BjGKYHa9RyfSVk2B729KW0spnxJm+jcXXXTPC6fEz9mbbUBmli6Nc2x+B2xKHHOEM4B1+CZpyTCsTKf1z3M50NuwA+Q5zUFaKBROhgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DPswHYb9; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DPswHYb9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrNH21CJGz2yRM
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 05:49:49 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AGFRGGQ015153;
	Sat, 16 Nov 2024 18:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=6xeBH+
	PbA82p0Um5syqepIg2jkxHzt8iwRiqtTHV8cw=; b=DPswHYb9BxUDEn0vxDO2cX
	CDmNFHv3LO9RANsUmVHBNvf0ikO/3BnTydFQKjBq8TyR+RRkjLzPVUfFlkGDofFb
	GngcTPT/v9uq6e/UsHwjYWHLNWVws/s1mgKl5+wXzmWCL79QfaWLj98US6G9bbcE
	e2F3QTY8vIp888yqoQut0b0bWVdRU8lFmuBAad+eWJbftOxSCzgzn7slIWVY9c46
	vDAceqcKsWrynq1LyiGyq0WjvF6b1a7jDujstgDzOYwPf+198PDr89h82PKsNwRe
	DwcerN8K6QRmRW3JjTIAzGj1EBaQQHNn7UNd9hqzXY8EkNrpPVDhdaegYp1Yh1ww
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42xk2vjehf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Nov 2024 18:49:35 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AGInZXj000877;
	Sat, 16 Nov 2024 18:49:35 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42xk2vjehd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Nov 2024 18:49:35 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AGIZR7a010521;
	Sat, 16 Nov 2024 18:49:34 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 42tj2scpf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Nov 2024 18:49:34 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4AGInXHQ55836974
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 16 Nov 2024 18:49:34 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D5A0258055;
	Sat, 16 Nov 2024 18:49:33 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 375C358043;
	Sat, 16 Nov 2024 18:49:29 +0000 (GMT)
Received: from [9.43.59.42] (unknown [9.43.59.42])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 16 Nov 2024 18:49:28 +0000 (GMT)
Message-ID: <7afed940-86b3-49dc-8e68-4cc6b5c94168@linux.ibm.com>
Date: Sun, 17 Nov 2024 00:19:25 +0530
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: powerpc: Mark Maddy as "M"
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Cc: christophe.leroy@csgroup.eu, naveen@kernel.org, npiggin@gmail.com
References: <20241115045442.675721-1-mpe@ellerman.id.au>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20241115045442.675721-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0fJN1bKuMbhGCQs1sn3O6k6Td7-ry2nN
X-Proofpoint-GUID: LUjfGHWRMq8RikcyfoUkHVtsnZ3PFuaA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 spamscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=944 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411160160
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 11/15/24 10:24 AM, Michael Ellerman wrote:
> Mark Maddy as a co-maintainer, so that he can get a kernel.org account
> and help manage the powerpc tree on kernel.org.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 21fdaa19229a..4fdb9759f37d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13071,7 +13071,7 @@ M:	Michael Ellerman <mpe@ellerman.id.au>
>  R:	Nicholas Piggin <npiggin@gmail.com>
>  R:	Christophe Leroy <christophe.leroy@csgroup.eu>
>  R:	Naveen N Rao <naveen@kernel.org>
> -R:	Madhavan Srinivasan <maddy@linux.ibm.com>
> +M:	Madhavan Srinivasan <maddy@linux.ibm.com>
>  L:	linuxppc-dev@lists.ozlabs.org
>  S:	Supported
>  W:	https://github.com/linuxppc/wiki/wiki


