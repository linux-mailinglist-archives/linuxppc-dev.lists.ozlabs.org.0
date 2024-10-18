Return-Path: <linuxppc-dev+bounces-2372-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B88519A41C3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 16:55:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVSRP4fQfz3bmH;
	Sat, 19 Oct 2024 01:54:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729263297;
	cv=none; b=IqAGAdCjkW7eoKM9XITMkfdauatST1eCWu3Uo86K1F3KnxfrorJ5F9AYNQTlA56y/Ap+WVrGwL9x3XK0432B7IwWreaG/KMTmW/JJQG11PMsGc3XpxUHWFyDwf+S1hyBjceemh4PQfgVsK60u6V72csMtWebalKLWzys3JiLeVnsp4Q0SnB/dZadUGHqXBPjFMZai3n4wiRtJWTv7J5oIQM5hdFefhwgBkXMWIoLrIkWzxl7wcxbielz0gWlt3v8m9Jd2GJofxRumVBgix/TO2mTyuGDsitAOaSQ2Mi7he7b8097kT48kPsrd2qF9vkH3t+3hx8i9GW9pSN3gBLUJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729263297; c=relaxed/relaxed;
	bh=wuAbHxiPkGV2NkdygUsactUToW9jLAcb4zeAhpmaSGA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cYfyxB3PYRL6qcyJJ6KaKVZxBZ0rDEVOzJe/2E6yj0u8+28FTIL1HsOJ8+hTs7s7lLkGugxJhKVYgoRJhWJqHKGTieOd9r4BmouR/UUhh1UvSz26HaN8M4y/Pr8y3XhYDWcJ0sjHmSSEXKhiabAijk7FsP4raM63o4QIT3gFPhKSxkpA7+oxHWF4WV6vp4N5nUw+B2T9roWDQbPDVegiTxWvNp9BBGgxrVJXs4IdUDfeECTLSqTLj1KctQlpua7QaPotij90y7RRwguhJRepaUTQAmcNFWpe5iPAi31fzz2smEhB4QL9o6YhScMbmIxu1aIrLbeQhCMcvc3SA62MqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jjBr11oB; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jjBr11oB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVSRN0nRTz2yVZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 01:54:55 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IA0vxR014451;
	Fri, 18 Oct 2024 14:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=wuAbHx
	iPkGV2NkdygUsactUToW9jLAcb4zeAhpmaSGA=; b=jjBr11oB+taVHxPvp7t2fH
	IwtS9I9CcUtrvza5d0lRNY5GR1ZriAFyDSZZy9B8DDrpooehGrHm3Uj20pf8r1au
	KR4Z88OJuMI2Kv7ngGuDqhkSymEPm+DxfRmwiePnlmZiRZWYXX6SSMnNRGNx9iGJ
	bgSadKfnndhqJ4whOEBZGoQ3VUBgx/ZBoQtH0u3zYbFk65ol/xgc+WP4SHNZC9LA
	73jV/uHtRXiIYvQubPcmwy5hrZFahnAlcftUKoWFj/QK6IvJkkyuMtVhLtkDMdbM
	8Q8w/Mp14LxjNI75qFkLhsIyz9xopHAqR6kSDOtZmDIArvSTtu8sDpwSA+q5Jnig
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42aqgr9hqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 14:54:41 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49IEsebp001706;
	Fri, 18 Oct 2024 14:54:40 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42aqgr9hqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 14:54:40 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49IEAfaK027499;
	Fri, 18 Oct 2024 14:54:39 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4283ty58w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 14:54:39 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49IEsc7f48955862
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Oct 2024 14:54:38 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8825858058;
	Fri, 18 Oct 2024 14:54:38 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D64E558057;
	Fri, 18 Oct 2024 14:54:30 +0000 (GMT)
Received: from [9.43.75.71] (unknown [9.43.75.71])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Oct 2024 14:54:30 +0000 (GMT)
Message-ID: <b66e69a9-7098-44f6-822d-f19bfe85117d@linux.ibm.com>
Date: Fri, 18 Oct 2024 20:24:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 1/3] fadump: Refactor and prepare fadump_cma_init for
 late init
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org, Sourabh Jain <sourabhjain@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>, Zi Yan <ziy@nvidia.com>,
        David Hildenbrand <david@redhat.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
        Donet Tom <donettom@linux.vnet.ibm.com>,
        LKML
 <linux-kernel@vger.kernel.org>,
        Sachin P Bappalige <sachinpb@linux.ibm.com>
References: <030b6d46fddac126a6cf7e119bea48055338f0ed.1728658614.git.ritesh.list@gmail.com>
 <941875f7-0d7f-4ba3-bc7c-7aedc3b20dae@linux.ibm.com>
 <87bjznyliv.fsf@gmail.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <87bjznyliv.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4bogdjanN3TYYCy_sgTWtiLvonWB_FNz
X-Proofpoint-GUID: 6sJJXsusFzLs8VonsFBslxb73qcPWjO2
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 spamscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410180094
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 10/14/24 4:54 PM, Ritesh Harjani (IBM) wrote:
> Madhavan Srinivasan <maddy@linux.ibm.com> writes:
> 
>> On 10/11/24 8:30 PM, Ritesh Harjani (IBM) wrote:
>>> We anyway don't use any return values from fadump_cma_init(). Since
>>> fadump_reserve_mem() from where fadump_cma_init() gets called today,
>>> already has the required checks.
>>> This patch makes this function return type as void. Let's also handle
>>> extra cases like return if fadump_supported is false or dump_active, so
>>> that in later patches we can call fadump_cma_init() separately from
>>> setup_arch().
>>
>> Usually patches to this file are posted with title format of
>>
>> powerpc/fadump:<>
> 
> yes. I guess it is good to do it that way (I might have missed it)
> Although commit history of oldest few patches to fadump shows..
> 
> ebaeb5ae2437 fadump: Convert firmware-assisted cpu state dump data into elf notes.
> 2df173d9e85d fadump: Initialize elfcore header and add PT_LOAD program headers.
> 3ccc00a7e04f fadump: Register for firmware assisted dump.
> eb39c8803d0e fadump: Reserve the memory for firmware assisted dump.
> 
>>

Patchset looks fine to me. 

Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com> for the series.


>>
>>>
>>> Acked-by: Hari Bathini <hbathini@linux.ibm.com>
>>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>>> ---
>>> v2 -> v3: Separated the series into 2 as discussed in v2.
>>> [v2]: https://lore.kernel.org/linuxppc-dev/cover.1728585512.git.ritesh.list@gmail.com/
>>>
>>>  arch/powerpc/kernel/fadump.c | 23 +++++++++--------------
>>>  1 file changed, 9 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>>> index a612e7513a4f..162327d66982 100644
>>> --- a/arch/powerpc/kernel/fadump.c
>>> +++ b/arch/powerpc/kernel/fadump.c
>>> @@ -78,27 +78,23 @@ static struct cma *fadump_cma;
>>>   * But for some reason even if it fails we still have the memory reservation
>>>   * with us and we can still continue doing fadump.
>>>   */
>>> -static int __init fadump_cma_init(void)
>>> +static void __init fadump_cma_init(void)
>>>  {
>>>  	unsigned long long base, size;
>>>  	int rc;
>>>
>>> -	if (!fw_dump.fadump_enabled)
>>> -		return 0;
>>> -
>>> +	if (!fw_dump.fadump_supported || !fw_dump.fadump_enabled ||
>>> +			fw_dump.dump_active)
>>> +		return;
>>
>> Is these checks even needed here? fadump_reserve_mem() checked for all
>> these already, also dont see any other caller for fadump_cma_init(). 
>>
>>
> 
> In the next patch we will move fadump_cma_init() call from within
> fadump_reserve_mem() to setup_arch(). Hence we need these extra checks
> in fadump_cma_init() as well. I mentioned the same in the commit msg of
> this patch too.
> 
>>>  	/*
>>>  	 * Do not use CMA if user has provided fadump=nocma kernel parameter.
>>> -	 * Return 1 to continue with fadump old behaviour.
>>>  	 */
>>> -	if (fw_dump.nocma)
>>> -		return 1;
>>> +	if (fw_dump.nocma || !fw_dump.boot_memory_size)
>>> +		return;
>>>
>>>  	base = fw_dump.reserve_dump_area_start;
>>>  	size = fw_dump.boot_memory_size;
>>>
>>> -	if (!size)
>>> -		return 0;
>>
>> So this is the only place where we return 0, which in turn will make the
>> "ret" in fadump_reserve_mem() as zero forcing to call reserve_crashkernel()
>> in early_init_devtree().
>>
>> we are removing it, becos we know "size" here will never be zero?
>>
>>
> 
> yes. Because we already check if boot_memory_size is less than
> bootmem_min in fadump_reserve_mem(). If it is less, then we fail and
> disable fadump (fadump_enabled = 0).
> 
> So then there is no need to check for !boot_memory_size in here.
> 
> fadump_reseve_mem( ) {
> <...>
> 	if (!fw_dump.dump_active) {
> 		fw_dump.boot_memory_size =
> 			PAGE_ALIGN(fadump_calculate_reserve_size());
> 
> 		bootmem_min = fw_dump.ops->fadump_get_bootmem_min();
> 		if (fw_dump.boot_memory_size < bootmem_min) {
> 			pr_err("Can't enable fadump with boot memory size (0x%lx) less than 0x%llx\n",
> 			       fw_dump.boot_memory_size, bootmem_min);
> 			goto error_out;
> 		}
>     <...>    
>     }
> <...>
> error_out:
> 	fw_dump.fadump_enabled = 0;
> 	fw_dump.reserve_dump_area_size = 0;
> 	return 0;
> }
> 
> 
> Thanks for the review!
> -ritesh


