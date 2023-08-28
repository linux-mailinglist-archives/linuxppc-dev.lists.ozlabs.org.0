Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 669AD78A6C7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 09:49:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M6vTo1r3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZ2lC27pzz3c7c
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 17:49:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M6vTo1r3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZ2jK6P0Hz3brX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 17:48:05 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37S7BANM024319;
	Mon, 28 Aug 2023 07:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ym0Pt28SMsAiTwoXVdHK+/VhndDLgyHIiX6JMgAWs20=;
 b=M6vTo1r3JB1GcB1Nt+2rUD+d90DegN/k3qXdcidbrcJOk+fmpc6YYmX7p1S+22W0ZSN5
 v4YyyShjhqV1fCMNz8Y6BMgPM922ESJKpzbLNKIJi6e4r/wvqJhclzIkyR+RSbxUJqVo
 mRDbEFjTOid6cq903wCvBUQzuNprhwhESUBdgsiNJ8Nbswp/vO1PvAu/C8IH1Y5STDOq
 Pzh85iHtdhPLi+xy27I2DGUQ/3wgHXvZnUkdAmV7hxwJUWnNf5hoanYwDCHCtvqoxakC
 5hHEOG0fD+a5Q9mfptmRJtBElBIGDurGmTEVGC7WGfOV8Xz1amHFySMBhD9S8TGh5D7J lQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sradxn6uv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Aug 2023 07:47:58 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37S79cL8015189;
	Mon, 28 Aug 2023 07:47:57 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sradxn6um-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Aug 2023 07:47:57 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37S7UKlg009967;
	Mon, 28 Aug 2023 07:47:57 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sqw7k0u1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Aug 2023 07:47:56 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37S7lsCU22676040
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Aug 2023 07:47:55 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DECEC20040;
	Mon, 28 Aug 2023 07:47:54 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5A8920043;
	Mon, 28 Aug 2023 07:47:53 +0000 (GMT)
Received: from [9.109.212.144] (unknown [9.109.212.144])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Aug 2023 07:47:53 +0000 (GMT)
Message-ID: <a02e76b2-ed98-3723-437b-ea07582e1d7a@linux.ibm.com>
Date: Mon, 28 Aug 2023 13:17:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] powerpc/mm/book3s64: Fix build error with SPARSEMEM
 disabled
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
References: <20230828074658.59553-1-aneesh.kumar@linux.ibm.com>
Content-Language: en-US
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <20230828074658.59553-1-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EIWQxAeZuXkcwVqkkGmU4gCD9zempsrp
X-Proofpoint-ORIG-GUID: qT-zJskW5nRleNbBUV3VEA-KxHeabStZ
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_04,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308280068
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
Cc: foraker1@llnl.gov, Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/28/23 1:16 PM, Aneesh Kumar K.V wrote:
> With CONFIG_SPARSEMEM disabled the below kernel build error is observed.
> 
>  arch/powerpc/mm/init_64.c:477:38: error: use of undeclared identifier 'SECTION_SIZE_BITS'
> 
> CONFIG_MEMORY_HOTPLUG depends on CONFIG_SPARSEMEM and it is more clear
> to describe the code dependency in terms of MEMORY_HOTPLUG. Outside
> memory hotplug the kernel uses memory_block_size for kernel directmap.
> Instead of depending on SECTION_SIZE_BITS to compute the direct map
> page size, add a new #define which defaults to 16M(same as existing
> SECTION_SIZE)
> 

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308251532.k9PpWEAD-lkp@intel.com/

> Fixes: 4d15721177d5 ("powerpc/mm: Cleanup memory block size probing")
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/init_64.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
> index fcda46c2b8df..e3d7379ef480 100644
> --- a/arch/powerpc/mm/init_64.c
> +++ b/arch/powerpc/mm/init_64.c
> @@ -472,12 +472,23 @@ static int __init dt_scan_mmu_pid_width(unsigned long node,
>  	return 1;
>  }
>  
> +/*
> + * Outside hotplug the kernel uses this value to map the kernel direct map
> + * with radix. To be compatible with older kernels, let's keep this value
> + * as 16M which is also SECTION_SIZE with SPARSEMEM. We can ideally map
> + * things with 1GB size in the case where we don't support hotplug.
> + */
> +#ifndef CONFIG_MEMORY_HOTPLUG
> +#define DEFAULT_MEMORY_BLOCK_SIZE	SZ_16M
> +#else
> +#define DEFAULT_MEMORY_BLOCK_SIZE	MIN_MEMORY_BLOCK_SIZE
> +#endif
> +
>  static void update_memory_block_size(unsigned long *block_size, unsigned long mem_size)
>  {
> -	unsigned long section_size = 1UL << SECTION_SIZE_BITS;
> -
> -	for (; *block_size > section_size; *block_size >>= 2) {
> +	unsigned long min_memory_block_size = DEFAULT_MEMORY_BLOCK_SIZE;
>  
> +	for (; *block_size > min_memory_block_size; *block_size >>= 2) {
>  		if ((mem_size & *block_size) == 0)
>  			break;
>  	}
> @@ -507,7 +518,7 @@ static int __init probe_memory_block_size(unsigned long node, const char *uname,
>  			/*
>  			 * Nothing in the device tree
>  			 */
> -			*block_size = MIN_MEMORY_BLOCK_SIZE;
> +			*block_size = DEFAULT_MEMORY_BLOCK_SIZE;
>  		else
>  			*block_size = of_read_number(prop, dt_root_size_cells);
>  		/*

