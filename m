Return-Path: <linuxppc-dev+bounces-6613-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCC0A4B7E0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 07:23:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5pf31WyDz2ym2;
	Mon,  3 Mar 2025 17:23:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740982987;
	cv=none; b=WmEAMjTrAZcD4IjJgyO2B0q3c36i1vZQtY9rK/FJgDdrkFg/2B8jUPFyrof0oxaJI0WuzB7N3dciDT4VvAul6S9Tx9gbwMC+ywSfY8fSAhWreptrfMYx8A8l3IGqIPGwMycqpPubIqm8ZwmzrgVvwj/Vus83UOzAApEXFbyxcAO9e81SmKk1GF9OHmu/rKIx/hKcemfxZ0GRVyTixn6rCfq65sLrkcZX8O7KbBhx+jQDo4+BJYJabsFjCwS7MtSkWgL+MxtFxr6U8h4JlbLz+83eKgu1g5V7Mc3SjY1ht0BeBhYS2HxDALvMwyYX6aexTaGA2sICY4/1WbMoJszI4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740982987; c=relaxed/relaxed;
	bh=0Q/LIGTwSQvwC9lfj0Z2Ic5N5vw/5aW7jqGsWVGT2kM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IrYJNN0qFHBhfZWbWXqDsk5Mpd+bfC30SBDV5bn2jt6ihW+IGF/mFHB4GdvzL5Ymm2nGt7rNeHMLkzq72EnL5lWYOAOEwgpkHUuaGiBdQAcp2+kSRo9Volnb1BWuoPzxTnYjdOxo8UhOHglSuieEt0M0/iJaf6CVn8qSsZ6NKU9sp7IgDkZLH/TD9BwyQWJpoHGLmr3i1YGGWgl63HqRtFuFN/nXkurOaVhtO+olIMBDeqpTCZZAie4p6PPPyLr09tn836be8Paf5roYQUZcc0arc9NW6BkWAZpggoV81c82a7U1ChnpOQO/373obAlZuHJFUnjDl+9ek+f+kQXjEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jmbirCtt; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jmbirCtt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z5pf20SmMz2yQl
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 17:23:05 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 522Kerli022158;
	Mon, 3 Mar 2025 06:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=0Q/LIG
	TwSQvwC9lfj0Z2Ic5N5vw/5aW7jqGsWVGT2kM=; b=jmbirCttF9YLAfKvXymeO5
	xgRvavNAKfKyBISg/i0ARorajQ0mJXRkZv1ECNc/fWyLSZxGT+2TFU6tCzlg8CyT
	NQ3C7WEyihAn7z8zknT+wAve4Lmwz3C33F2tzhtRcQJMUTHuwWiLfyRL6ozqOLR9
	KJwvxm2xF4N6do5GSqdXeBjOcUBGfn9P2CfEozgIbm4L+NNBf6t+4zE9MRPwegTj
	RouB6+6k0n+APbG0orzqUw8PDXi0Qe82X5DdgljfzyxhCIfiUfW4PCnqJiq0WijH
	YMlb3h7+WDWgtiQUuuyTRzI4PsuX2RM1tmFcQ8NkZNBRMWNMGL3EIzHNdFvZo9zg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 454xhyhn92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 06:22:54 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5236Msd4016144;
	Mon, 3 Mar 2025 06:22:54 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 454xhyhn90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 06:22:54 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5233fOhk020936;
	Mon, 3 Mar 2025 06:22:53 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 454djn5sa6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 06:22:53 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5236MnJ118153766
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Mar 2025 06:22:49 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C3E9220043;
	Mon,  3 Mar 2025 06:22:49 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F88220040;
	Mon,  3 Mar 2025 06:22:48 +0000 (GMT)
Received: from [9.109.204.94] (unknown [9.109.204.94])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Mar 2025 06:22:47 +0000 (GMT)
Message-ID: <84a2ab12-e24a-4bd6-b562-e3154d1aa258@linux.ibm.com>
Date: Mon, 3 Mar 2025 11:52:47 +0530
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
Subject: Re: [PATCH v4] powerpc/hugetlb: Disable gigantic hugepages if fadump
 is active
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        linuxppc-dev@lists.ozlabs.org
Cc: Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20250128043358.163372-1-sourabhjain@linux.ibm.com>
 <87h64cgct3.fsf@gmail.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <87h64cgct3.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ojHu31ffOP1AZAB_xyMLcHJ7IZlrKBjC
X-Proofpoint-ORIG-GUID: CT9gcA7Lwe4xbz3mCtNn5_IcAbO4m1m3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_01,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 adultscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030037
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Ritesh,

Thanks for the review.

On 02/03/25 12:05, Ritesh Harjani (IBM) wrote:
> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>
>> The fadump kernel boots with limited memory solely to collect the kernel
>> core dump. Having gigantic hugepages in the fadump kernel is of no use.
> Sure got it.
>
>> Many times, the fadump kernel encounters OOM (Out of Memory) issues if
>> gigantic hugepages are allocated.
>>
>> To address this, disable gigantic hugepages if fadump is active by
>> returning early from arch_hugetlb_valid_size() using
>> hugepages_supported(). When fadump is active, the global variable
>> hugetlb_disabled is set to true, which is later used by the
>> PowerPC-specific hugepages_supported() function to determine hugepage
>> support.
>>
>> Returning early from arch_hugetlb_vali_size() not only disables
>> gigantic hugepages but also avoids unnecessary hstate initialization for
>> every hugepage size supported by the platform.
>>
>> kernel logs related to hugepages with this patch included:
>> kernel argument passed: hugepagesz=1G hugepages=1
>>
>> First kernel: gigantic hugepage got allocated
>> ==============================================
>>
>> dmesg | grep -i "hugetlb"
>> -------------------------
>> HugeTLB: registered 1.00 GiB page size, pre-allocated 1 pages
>> HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
>> HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
>> HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
>>
>> $ cat /proc/meminfo | grep -i "hugetlb"
>> -------------------------------------
>> Hugetlb:         1048576 kB
> Was this tested with patch [1] in your local tree?
>
> [1]: https://web.git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=d629d7a8efc33
>
> IIUC, this patch [1] disables the boot time allocation of hugepages.
> Isn't it also disabling the boot time allocation for gigantic huge pages
> passed by the cmdline params like hugepagesz=1G and hugepages=2 ?

Yes, I had the patch [1] in my tree.

My understanding is that gigantic pages are allocated before normal huge 
pages.

In hugepages_setup() in hugetlb.c, we have:

     if (hugetlb_max_hstate && hstate_is_gigantic(parsed_hstate))
         hugetlb_hstate_alloc_pages(parsed_hstate);

I believe the above code allocates memory for gigantic pages, and 
hugetlb_init() is
called later because it is a subsys_initcall.

So, by the time the kernel reaches hugetlb_init(), the gigantic pages 
are already
allocated. Isn't that right?

Please let me know your opinion.

Thanks,
Sourabh Jain


>
>
>> HugeTLB: registered 1.00 GiB page size, pre-allocated 1 pages
> This print comes from report_hugepages(). The only place from where
> report_hugepages() gets called is hugetlb_init(). hugetlb_init() is what
> is responsible for hugepages & gigantic hugepage allocations of the
> passed kernel cmdline params.
>
> But hugetlb_init() already checks for hugepages_supported() in the very
> beginning. So I am not sure whether we need this extra patch to disable
> gigantic hugepages allocation by the kernel cmdline params like
> hugepagesz=1G and hugepages=2 type of options.
>
> Hence I was wondering if you had this patch [1] in your tree when you were
> testing this?
>
> But I may be missing something. Could you please help clarify on whether
> we really need this patch to disable gigantic hugetlb page allocations?
>
>> Fadump kernel: gigantic hugepage not allocated
>> ===============================================
>>
>> dmesg | grep -i "hugetlb"
>> -------------------------
>> [    0.000000] HugeTLB: unsupported hugepagesz=1G
>> [    0.000000] HugeTLB: hugepages=1 does not follow a valid hugepagesz, ignoring
>> [    0.706375] HugeTLB support is disabled!
>> [    0.773530] hugetlbfs: disabling because there are no supported hugepage sizes
>>
>> $ cat /proc/meminfo | grep -i "hugetlb"
>> ----------------------------------
>> <Nothing>
>>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
> I guess the extra " in the above was not adding me in the cc list.
> Hence I missed to see this patch early.

Thanks for point it out. I will fix it.


>
> -ritesh
>
>
>> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>> Changelog:
>>
>> v1:
>> https://lore.kernel.org/all/20250121150419.1342794-1-sourabhjain@linux.ibm.com/
>>
>> v2:
>> https://lore.kernel.org/all/20250124103220.111303-1-sourabhjain@linux.ibm.com/
>>   - disable gigantic hugepage in arch code, arch_hugetlb_valid_size()
>>
>> v3:
>> https://lore.kernel.org/all/20250125104928.88881-1-sourabhjain@linux.ibm.com/
>>   - Do not modify the initialization of the shift variable
>>
>> v4:
>> - Update commit message to include how hugepages_supported() detects
>>    hugepages support when fadump is active
>> - Add Reviewed-by tag
>> - NO functional change
>>
>> ---
>>   arch/powerpc/mm/hugetlbpage.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
>> index 6b043180220a..88cfd182db4e 100644
>> --- a/arch/powerpc/mm/hugetlbpage.c
>> +++ b/arch/powerpc/mm/hugetlbpage.c
>> @@ -138,6 +138,9 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
>>   	int shift = __ffs(size);
>>   	int mmu_psize;
>>
>> +	if (!hugepages_supported())
>> +		return false;
>> +
>>   	/* Check that it is a page size supported by the hardware and
>>   	 * that it fits within pagetable and slice limits. */
>>   	if (size <= PAGE_SIZE || !is_power_of_2(size))
>> --
>> 2.48.1


