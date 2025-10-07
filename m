Return-Path: <linuxppc-dev+bounces-12690-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64131BC1032
	for <lists+linuxppc-dev@lfdr.de>; Tue, 07 Oct 2025 12:28:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cgsms2qFMz3bjb;
	Tue,  7 Oct 2025 21:28:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759832925;
	cv=none; b=giyaJ813mNSZOdJG84mlsWZFNK1LP+1/wMl3wT0qh74+vI3P4vyu70b03Bh2x5uOgSJZTSZiZFA8wbD33xwnfs1xmePiemU+U++ZSvhOsXAwBYagV3iQ12Fsahzo7J2LEGodHNh1BUvscVqyjPuZJ6pMcp1N/EcdP+zdcu5Ukz5/G01iKERZVEbA7z8tui1+IOF0bcHOWd/Ri7g42kL1Bd/hTj9C9sHgi6cZ5uUAc7uNwlatxK+8wButpwgGj3CZfJ0KTCCLmNQA6QbFz7JPvwgMjQdtNd28jkYkzxyC34o9/LqOfkxesMdllZT8ULQ+/tUct6ev+8PIv8eQXzrKBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759832925; c=relaxed/relaxed;
	bh=cbSe/W8VzXaTL4OKHmy7VB7TEH8NREzZDFaWaWyO9i0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UDQp3OYc/XVkd2SCWP+hustpImHCSTOUTvdYifEsA6ZuIT9FfRPjvbNjlRb4OFy8sUaLx10OB8PntLYYD9B6dwxugAmcfhe8ff09iNF5X6Swge9YlzcSIC6qeur+frLC07pjYH0gtZDnc0BByFiIRI74JepoD9O3YipO5RJ1imOtFKcFXY3Jqm98LXC4wmL4E9DbowKXBslMwqHyEGCE8Gl3m8+fUMwK+2uaQYNyA2dQYmephDoDhFnqT+FiyZY0mCIbSUNL8yLY5MCbGVMGPFlzSxLiMIZbQXVotdXx78/+fyoM8aAU9vGJPG4cms2WUUf6L+nEstChq+2mY8g2SQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EV1ylRpy; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EV1ylRpy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cgsmq31n8z3000
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Oct 2025 21:28:42 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5971j2KR020652;
	Tue, 7 Oct 2025 10:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=cbSe/W
	8VzXaTL4OKHmy7VB7TEH8NREzZDFaWaWyO9i0=; b=EV1ylRpyHZEc+CT5glomlL
	XOXQCEo4Dd4WiUeAlMKldfz3Fa2KOag//VHPpqjJmotuMp5zsoCUrkrdCBpsL1AY
	nL02W7JFqC3hNL3BXLYrml3OejwmP8eQLh6xR2byx7NOoijrFpIeMqAb+ppFjiNp
	yehcmaOFfDKxpoqUKsrp2eXAagvNfUv6u9I77/f+VOCsJ6R2/9ycF/MCHyBJgyCj
	8m+OqSFsJd92+LuujZEMZe1pb1L9oqBi3rbShRGILi2RvQ9MrD23Q6Mq5ew9XJu7
	XtTjfT54i3yszrTGMcOAVpQpjc4NidSLrTzTFU5cQGu1GGXCVz6sdjhGQb4sQmKg
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49ju8anx6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Oct 2025 10:28:32 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5978XZ9D019601;
	Tue, 7 Oct 2025 10:28:31 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 49kdwsaxvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Oct 2025 10:28:31 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 597ASSNx46989744
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Oct 2025 10:28:28 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A74620040;
	Tue,  7 Oct 2025 10:28:28 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F06020043;
	Tue,  7 Oct 2025 10:28:27 +0000 (GMT)
Received: from [9.78.106.240] (unknown [9.78.106.240])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Oct 2025 10:28:27 +0000 (GMT)
Message-ID: <89ec78e5-4fe3-4100-9ae1-23f6a9f36e77@linux.ibm.com>
Date: Tue, 7 Oct 2025 15:58:26 +0530
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
Subject: Re: powerpc/fadump: skip parameter area allocation when fadump is
 disabled
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <20251007074023.176163-1-sourabhjain@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20251007074023.176163-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NMpLb9lpVmgBAMdqd1eCz1lcNEjQX0mN
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=68e4eb50 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VnNF1IyMAAAA:8 a=WqWALAZGvOM0UOBZ99wA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMiBTYWx0ZWRfX1wjOwTgKnIJI
 fDEUqIGxmmNCbQ0u70YfQkA6dUmR80pUGfejz0sRU5v412MYl3kqOv9c0X8nbEreGAP6z7JfxjD
 h7D5RcMd6DwRcJTU2ECadss98CgkTjabTK87NsTVPPLZ75inDMf3LIKjM3emJboOKP8nM9yZg7M
 ftVnpK88Kz8ZJClAXsXp3UV076Ow60n96edGLrMlwMvHYuKMpESAzhVRhKYVNk9zsSg70VW5JnP
 AuL2wzXYDeofQErWZwmVwtW3h9YIoxc5DZD0tZlhM03gdCpm0j50WDA1AYg5Ihm8BkWT0+mG6Wg
 lUp09oKbufFqFgiuBQ6lvXu121AcfB/pvHTrXmUv6Te9BE6qXpZe+KyTGPPsUAwEmT/S2Kxmc6V
 sH6CpZwacMBPTiLYlD97mop2aeVosA==
X-Proofpoint-ORIG-GUID: NMpLb9lpVmgBAMdqd1eCz1lcNEjQX0mN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040022
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 07/10/25 1:10 pm, Sourabh Jain wrote:
> Fadump allocates memory to pass additional kernel command-line argument
> to the fadump kernel. However, this allocation is not needed when fadump
> is disabled. So avoid allocating memory for the additional parameter
> area in such cases.
> 

This needs the fixes tag...

Fixes: f4892c68ecc1 ("powerpc/fadump: allocate memory for additional 
parameters early")

Otherwise, looks good to me.

Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>

> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>   arch/powerpc/kernel/fadump.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 5782e743fd27..4ebc333dd786 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -1747,6 +1747,9 @@ void __init fadump_setup_param_area(void)
>   {
>   	phys_addr_t range_start, range_end;
>   
> +	if (!fw_dump.fadump_enabled)
> +		return;
> +
>   	if (!fw_dump.param_area_supported || fw_dump.dump_active)
>   		return;
>   


