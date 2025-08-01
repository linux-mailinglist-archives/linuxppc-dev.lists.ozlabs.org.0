Return-Path: <linuxppc-dev+bounces-10509-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C083B18308
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Aug 2025 15:57:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btnb75psvz2yfL;
	Fri,  1 Aug 2025 23:57:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754056675;
	cv=none; b=ito6P7ZY93Q/khaf+tOltDerYRN13sINwFzTyJrbbr/siC464zTOg/yf4OUdPxmzJ71NvsqWxVrPySCT5//Eq2jmWn6qUyHyYnvPqDzyhsabVyW9PBblWBkOqyCF8jAchK8iv+t5EzeLNFuo9Ix0f0YF+x8FG0nXEIg2VL2DBqjcCTk69d9KYwi9z8l+P/UxMV0C9qvXJvF2Psqr9sq68EvKeTuFfvgRWbIDjlwZPjztrKZ75Lu/ySq/55xsvpY2S9ZLL72AOaVZ9QpU1eT5oZED8dL+bdgh9O/C5jSE0lM+uN5w+Bmu4HwLiJm3RAWZWYVxCTbn/TtZZ9M3u0fRHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754056675; c=relaxed/relaxed;
	bh=F21j2vsKrTzEgCJ58dBdfo1wfRZGwROFMGfRXDGEHrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ef3DJepuodQc9q8trlF7givIJionYqWhDz6OLf9mewCl4ZBb5MpqW9nSBHRpALz74HoNc6NJwTI0dSSHrMzatjsCDz1nWQprY5uZqY07NKkDIi2suG9pMzo7S8QCgsec6FvFaf3J+kM1jJk4uaqNbnlVFvyUrAOq/gGcI2uyLijGmUiLAEMWpMoTP6z9Ann/r/r4cg2FExHlFwFGIb0ikEWs6SNfKj+zbYeB8YWe1Sp4N24Cc/mE294XBjXjzdEekRB5IGBDY1644tiNY6LGVF9Mm9ZWb4Mj277tlwvM09dn3xC2bsyKMtCgZSgnSnWZnrbFo0+jnrvmIKxv4xghfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rb4WElaJ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rb4WElaJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4btnb64Tjzz2xRs
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Aug 2025 23:57:53 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571DUW1e025685;
	Fri, 1 Aug 2025 13:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=F21j2v
	sKrTzEgCJ58dBdfo1wfRZGwROFMGfRXDGEHrs=; b=Rb4WElaJhDROwuXUayCa0t
	YqcFAMU8aJjn7bvwJ61Jwejgii7N0dTH+8E63NRGHzA84+MCtwGP5gbC4vLKnTPJ
	8bafp1wfMcjSt43wv/89e6G2AI29GkMl9Dh5Y0MV0IWJmPUcyKyv62yXg+M9RaN3
	qm8ZeDPVxieFC/vNA5cKNJSHaIvIC6Bi4iZIN3u9c/CWjNwZr20IYjdYFa6Pbz9S
	z1lrLJroedhm8IFT7LE77k0/L2LHDxBCehfWypMh2/8LkTB0R/En4mOefTq9u/m3
	4e7cuortv1CcGxxAujFh/jC5szE646v/XHYJDCNVv+Cl/EK7XrVpxxiHbZLmRpeg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 487bu0ekg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 13:57:31 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 571DunlH015664;
	Fri, 1 Aug 2025 13:57:30 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 487bu0ekfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 13:57:30 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 571DcReq015952;
	Fri, 1 Aug 2025 13:57:30 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 485aun1hcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 13:57:29 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 571DvPbD59113888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Aug 2025 13:57:25 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C52EA2004B;
	Fri,  1 Aug 2025 13:57:25 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F18820040;
	Fri,  1 Aug 2025 13:57:23 +0000 (GMT)
Received: from [9.39.23.28] (unknown [9.39.23.28])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  1 Aug 2025 13:57:23 +0000 (GMT)
Message-ID: <da3a0717-fe3a-49db-bebd-f231a7fdedb7@linux.ibm.com>
Date: Fri, 1 Aug 2025 19:27:22 +0530
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
Subject: Re: [PATCH] pseries/lparcfg: Add resource group monitoring
To: Srikar Dronamraju <srikar@linux.ibm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
        =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Tyrel Datwyler <tyreld@linux.ibm.com>, linux-kernel@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>
References: <20250716104600.59102-1-srikar@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250716104600.59102-1-srikar@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=ZNPXmW7b c=1 sm=1 tr=0 ts=688cc7cb cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8
 a=1UX6Do5GAAAA:8 a=voM4FWlXAAAA:8 a=VwQbUJbxAAAA:8 a=GWtWlM49-EJBfVYlMYMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Et2XPkok5AAZYJIKzHr1:22
 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: SBK4bZsuubV6sSpEbK9HQD3xi9o0RGf5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwNSBTYWx0ZWRfX7413cyPD2YOP
 kb9IZbTdSWvnyT/XJN/o4HvieR3q6DOggIb5K+YSgWa2EtGhOxiGPDBVel+g4QoXds9SQd7JjSQ
 nkb7qOTcFQQ8LSc78Ka0DIlV3wRjvK9pgbxC4QB5pa6skjs3/P9zhMavU1MMjoHTLPLM91wC7Fm
 v05YeEQWY3sUKUTEBfllvnoMKoUjEqR0mFkc20o1pW2HEQ3IVDITPwUXo2vKl37mDtoC2ZDzeUk
 QcczgABH7zVylsAjzZ3VpfPow+9T1pG9KAzpbKGZ79EGYFiogjCEog4mCM8nQvYvKX54rrEoHtz
 AdLvlUrvpn5YaWKk1jkOT5dZGkPty8QIjHyuDOqHdZpyR7AvdDfmF5UZjIcM26ezEVAqYSi2wAj
 Uk/6JLoi/EVQWLyOdV6oH7AA+D6Z+LTR84eTStFtjIDWbpnTUliB1I4JX26fRnCSNPrL1eU3
X-Proofpoint-GUID: mb_0c3hhABXJtT4kyYOkqupdJp7SAdyx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010105
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 7/16/25 16:15, Srikar Dronamraju wrote:
> Systems can now be partitioned into resource groups. By default all
> systems will be part of default resource group. Once a resource group is
> created, and resources allocated to the resource group, those resources
> will be removed from the default resource group. If a LPAR moved to a
> resource group, then it can only use resources in the resource group.
> 
> So maximum processors that can be allocated to a LPAR can be equal or
> smaller than the resources in the resource group.
> 
> lparcfg can now exposes the resource group id to which this LPAR belongs
> to. It also exposes the number of processors in the current resource
> group. The default resource group id happens to be 0. These would be
> documented in the upcoming PAPR update.

Could you please add a link to patch on power utils on how it is being consumed?

> 
> Example of an LPAR in a default resource group
> root@ltcp11-lp3 $ grep resource_group /proc/powerpc/lparcfg
> resource_group_number=0
> resource_group_active_processors=50
> root@ltcp11-lp3 $
> 
> Example of an LPAR in a non-default resource group
> root@ltcp11-lp5 $ grep resource_group /proc/powerpc/lparcfg
> resource_group_number=1
> resource_group_active_processors=30
> root@ltcp11-lp5 $
> 
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: "Thomas Weißschuh" <thomas.weissschuh@linutronix.de>
> Cc: Tyrel Datwyler <tyreld@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
> ---
>   arch/powerpc/platforms/pseries/lparcfg.c | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
> index cc22924f159f..6554537984fb 100644
> --- a/arch/powerpc/platforms/pseries/lparcfg.c
> +++ b/arch/powerpc/platforms/pseries/lparcfg.c

Does MODULE_VERS need to increased?

> @@ -78,6 +78,8 @@ struct hvcall_ppp_data {
>   	u8	capped;
>   	u8	weight;
>   	u8	unallocated_weight;
> +	u8      resource_group_index;
> +	u16     active_procs_in_resource_group;
>   	u16	active_procs_in_pool;
>   	u16	active_system_procs;
>   	u16	phys_platform_procs;
> @@ -86,7 +88,7 @@ struct hvcall_ppp_data {
>   };
>   
>   /*
> - * H_GET_PPP hcall returns info in 4 parms.
> + * H_GET_PPP hcall returns info in 5 parms.
>    *  entitled_capacity,unallocated_capacity,
>    *  aggregation, resource_capability).
>    *
> @@ -94,11 +96,11 @@ struct hvcall_ppp_data {
>    *  R5 = Unallocated Processor Capacity Percentage.
>    *  R6 (AABBCCDDEEFFGGHH).
>    *      XXXX - reserved (0)
> - *          XXXX - reserved (0)
> + *          XXXX - Active Cores in Resource Group
>    *              XXXX - Group Number
>    *                  XXXX - Pool Number.
>    *  R7 (IIJJKKLLMMNNOOPP).
> - *      XX - reserved. (0)
> + *      XX - Resource group Number
>    *        XX - bit 0-6 reserved (0).   bit 7 is Capped indicator.
>    *          XX - variable processor Capacity Weight
>    *            XX - Unallocated Variable Processor Capacity Weight.
> @@ -120,9 +122,11 @@ static unsigned int h_get_ppp(struct hvcall_ppp_data *ppp_data)
>   	ppp_data->entitlement = retbuf[0];
>   	ppp_data->unallocated_entitlement = retbuf[1];
>   
> +	ppp_data->active_procs_in_resource_group = (retbuf[2] >> 4 * 8) & 0xffff;
>   	ppp_data->group_num = (retbuf[2] >> 2 * 8) & 0xffff;
>   	ppp_data->pool_num = retbuf[2] & 0xffff;
>   
> +	ppp_data->resource_group_index = (retbuf[3] >> 7 *  8) & 0xff;
>   	ppp_data->capped = (retbuf[3] >> 6 * 8) & 0x01;
>   	ppp_data->weight = (retbuf[3] >> 5 * 8) & 0xff;
>   	ppp_data->unallocated_weight = (retbuf[3] >> 4 * 8) & 0xff;
> @@ -236,6 +240,13 @@ static void parse_ppp_data(struct seq_file *m)
>   	seq_printf(m, "unallocated_capacity=%lld\n",
>   		   ppp_data.unallocated_entitlement);
>   
> +	if (ppp_data.active_procs_in_resource_group)  {

ppp_data.active_procs_in_resource_group can ever be zero?

If the entry is absent in lparcfg, then lparstat will print it as 0 (which happens to be
default RG, while default RG may have processors)

> +		seq_printf(m, "resource_group_number=%d\n",
> +				ppp_data.resource_group_index);
> +		seq_printf(m, "resource_group_active_processors=%d\n",
> +				ppp_data.active_procs_in_resource_group);
> +	}
> +
>   	/* The last bits of information returned from h_get_ppp are only
>   	 * valid if the ibm,partition-performance-parameters-level
>   	 * property is >= 1.


