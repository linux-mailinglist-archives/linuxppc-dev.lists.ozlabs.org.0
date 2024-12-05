Return-Path: <linuxppc-dev+bounces-3836-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6689E5E15
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 19:13:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y42Yw4MXTz2xjK;
	Fri,  6 Dec 2024 05:13:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733422388;
	cv=none; b=coZNDAhMUGhJFyMkUSRh5wTe8zbN0tVD0WjUX99zfk6DeobyAqWA0t8qfLpsP5qDW+sTW/BHhKYUMqEh+muMS8pX4cgetq41d7fXGHfJYwnACwzYgwsdP2fLwh5jZAal/NyGGGrohuXlgpUCC00PM6yKxjJpT6smb5QuITkkorgs1PQU/cEUjqu7tzcCZMsXAFJYsRktxTrh3jqg/Jrvi4qpoehFyMwmtAzOjqy090aVdGUEMZH2XuKxPyDdjVgfrmZqT2GMDGhoxrfnen7eFe9NNGSeNGx5ceFkgbdJrI0AP+SkRw351x7YAcYt0O2UtY4TwfsBkKwuj+Za/kogiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733422388; c=relaxed/relaxed;
	bh=cGlw91o+nrHexn6X/BuiTL1FWhww73eXoOd6hiiEq84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OTvePJlOD2ZA7nPKzG/Y6bmrdBYdeOTIpRhzwFCfeF/WvHFAC44/DlzoeZrsD0QcQ9ILhY1/KhUVgj5jZp/wM1/QgTo4Gjc6RPKB6OBBWmagz7sv9tlVievR72WBxzYo59H805nV911Pi56vglYZFWtfOXxtgyvSKQNVe7xUKGoCALLsynMrDew+t1zD2GuW8FWBib3zE5uLMsoPoYa/3/t4qxnDu2qZmWTlSFj0zPxrg53WxeliURTotBOJdn/FW3059+x4f2zZyLHBtDrDb3/+xkD9dFgmmsGNI9XVzufHJiaC6RmGDTvp7wnrEebbaT+93cZmbiMjxpEtQvaElw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L5WxvhKR; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L5WxvhKR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y42Yv2dGrz2xgv
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2024 05:13:06 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5A4aJF028365;
	Thu, 5 Dec 2024 18:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=cGlw91
	o+nrHexn6X/BuiTL1FWhww73eXoOd6hiiEq84=; b=L5WxvhKRw8DyKH/ITtKtM3
	593DIwipompVZz5cmRoPVmfbA7cxsZQl34NW3sBSds0GKK+dW6jD5pHNMmtcgJFl
	NxrbM7I/gTkiXKXOClxDDS2sEb9e12n35iRUZYxXJnd0pbTy/oMP70ildqnVH14L
	vV/d8TvLx5H8bqHzgf/f49yra50K0C+kyZhibkUjsY5yVjwxxvvpKYsTdGmPohzk
	YXYeZz423GAEB3hE5rtZ3SVKsxh3biMCv52/2lVum92PyhsljvBSLNcCAJ1BGEAE
	h2j3GVW2lb9oQutZerD31tsRy/hCxhzsaW6yR5olg80GFiAkGPQAXLzF9GS35QBA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ax65wpbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 18:12:58 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B5I4HGM031691;
	Thu, 5 Dec 2024 18:12:58 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ax65wpbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 18:12:58 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5H2wwm023015;
	Thu, 5 Dec 2024 18:12:57 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 438e1na2jv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 18:12:56 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B5ICsEa50070008
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Dec 2024 18:12:55 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD19E20049;
	Thu,  5 Dec 2024 18:12:54 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2284D20040;
	Thu,  5 Dec 2024 18:12:49 +0000 (GMT)
Received: from [9.39.27.71] (unknown [9.39.27.71])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  5 Dec 2024 18:12:48 +0000 (GMT)
Message-ID: <1f7ad21c-372f-4d7d-b3dc-9a2fb194b704@linux.ibm.com>
Date: Thu, 5 Dec 2024 23:42:47 +0530
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
Subject: Re: [RFC PATCH 2/2] s390/topology: Add initial implementation for
 selection of parked CPUs
To: Tobias Huschle <huschle@linux.ibm.com>, linux-kernel@vger.kernel.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, linux-s390@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
References: <20241204112149.25872-1-huschle@linux.ibm.com>
 <20241204112149.25872-3-huschle@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20241204112149.25872-3-huschle@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: v4kEbZjuL794IdCBoJXt4wddme7825tN
X-Proofpoint-GUID: H3adm36waO2L6ynLjyvuSXJGfo6b6ayR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0
 bulkscore=0 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412050132
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 12/4/24 16:51, Tobias Huschle wrote:
> In this simplified example, vertical low CPUs are parked generally.
> This will later be adjusted by making the parked state dependent
> on the overall utilization on the underlying hypervisor.
> 
> Vertical lows are always bound to the highest CPU IDs. This implies that
> the three types of vertically polarized CPUs are always clustered by ID.
> This has the following implications:
> - There can be scheduler domains consisting of only vertical highs
> - There can be scheduler domains consisting of only vertical lows
> 

A sched domain can have combination of these two as well. Is that not 
possible on s390?

> Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
> ---
>   arch/s390/include/asm/topology.h | 3 +++
>   arch/s390/kernel/topology.c      | 5 +++++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/arch/s390/include/asm/topology.h b/arch/s390/include/asm/topology.h
> index cef06bffad80..e86afeccde35 100644
> --- a/arch/s390/include/asm/topology.h
> +++ b/arch/s390/include/asm/topology.h
> @@ -99,6 +99,9 @@ static inline int numa_node_id(void)
>   
>   #endif /* CONFIG_NUMA */
>   
> +#define arch_cpu_parked cpu_parked
> +int cpu_parked(int cpu);
> +
>   #include <asm-generic/topology.h>
>   
>   #endif /* _ASM_S390_TOPOLOGY_H */
> diff --git a/arch/s390/kernel/topology.c b/arch/s390/kernel/topology.c
> index 4f9c301a705b..1032b65da574 100644
> --- a/arch/s390/kernel/topology.c
> +++ b/arch/s390/kernel/topology.c
> @@ -299,6 +299,11 @@ void store_topology(struct sysinfo_15_1_x *info)
>   	stsi(info, 15, 1, topology_mnest_limit());
>   }
>   
> +int cpu_parked(int cpu)
> +{
> +	return smp_cpu_get_polarization(cpu) == POLARIZATION_VL;
> +}

Curious to know how this smp_cpu_get_polarization gets updated at 
runtime? is it done by add_cpus_to_mask?

> +
>   static void __arch_update_dedicated_flag(void *arg)
>   {
>   	if (topology_cpu_dedicated(smp_processor_id()))


