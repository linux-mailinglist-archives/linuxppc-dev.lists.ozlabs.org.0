Return-Path: <linuxppc-dev+bounces-6614-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B71A4B7ED
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 07:34:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5pvZ5wM4z305n;
	Mon,  3 Mar 2025 17:34:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740983690;
	cv=none; b=kWZZof7N4t6zwvtnVhSvp0NJ7aPzxZwFvopfuFWSEIZNphUKafkRUi9HvOBZN6zzaLTEy18zBPswgqO7K30T1HM+DF4svtSdh2cjl7bO8JsKN9VXwSMFnQNiR5/NQ/gq5ii1vi3eqWJqQWdf4AqV2dhOyEXDRHPMl/A9YtWqP9KWVhLKAzzGJpuGyX5LxvN8C9OOx1K69c4/PKD7gbm+WbwBSznP2lfmUycqPxLi7UTwWttXN1MM8uNduN3x3NbBoGb5zqHCxYw5lk1/pYtC8z+ifkY4Wi+JDNa+bPE6Gsjcald9PDogFh6DVGPJGEYUilfD+lSiucPzReT6XtR0MA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740983690; c=relaxed/relaxed;
	bh=tXXNTAISiIYLBcpmXtJ8R1M+lAj8xDEmCOsjYWvoFWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HiLT/yr+u8hwgEz/ettLWdEFbNFygtnWMZqrtsCCG/IgAxdCJjjhvnsraLBJcNRs8qBNV/Zs0Y+dmk/TKM2w6qU28sCtZnO7w+mgStfpT8OgR2OpbdqN3UjqQ1SG+3Cx91JuCbdVCKZSx59N1LxelFPL9DOu6J3Q43HpNeWVPPMdFHe93BYVPvr4ICfz+raEbkrHiO9v4zwRx58+1W2eHmicrIJcxd4rbr8QZq/rLuCy1gr9uMn+DQDw+I91Z65SMV8qml4pXCdzr232BngzczApaY0VyVTMq/Tp+seUqb8mrMAsb8NKzz3FQfFgFqVoOJNVia0B656HSDi9QZqEmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kx3UECam; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kx3UECam;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z5pvY6qs6z2ynR
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 17:34:49 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523631SX004314;
	Mon, 3 Mar 2025 06:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=tXXNTA
	ISiIYLBcpmXtJ8R1M+lAj8xDEmCOsjYWvoFWs=; b=kx3UECamPvx0Sk5N0rQRqn
	p90Jhda9uDT7ry2hWSRuXswHPFt1qh5jHMyr4+DtbD+as6kCcI3PJx5igsUIPeBp
	QPbRiQWS/nenREcykkcwdY8iuhqMUzaYQ2nb/T4oyXJo6PbV2TGxGFATPO4Je6nR
	l3OHrO2485SB4p5K3vYe31Qs6jQTULtMyV6ewF8zGvUH8+0LZI42c2Ope917melj
	RBB8eP0xxQ4eHGSm89KsZZH86ePAf8UEcKvuMxGxtipndIX+/4SGfhXFgmC/CB7Y
	TZ6N+j8KftonZV3lQk7Q42XMlpnPhn5GYX3RIZIKcqECHkIpzXHIJrAKdWNS4UPw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 454rrnjyjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 06:34:39 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5236XLl6024438;
	Mon, 3 Mar 2025 06:34:38 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 454rrnjyjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 06:34:38 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52331pHC032680;
	Mon, 3 Mar 2025 06:34:38 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 454cjsp17p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 06:34:37 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5236YWV847907122
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Mar 2025 06:34:32 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 43D5520040;
	Mon,  3 Mar 2025 06:34:32 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A588B20043;
	Mon,  3 Mar 2025 06:34:30 +0000 (GMT)
Received: from [9.109.204.94] (unknown [9.109.204.94])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Mar 2025 06:34:30 +0000 (GMT)
Message-ID: <ff99f87d-851d-4f0a-8d07-988066d016a1@linux.ibm.com>
Date: Mon, 3 Mar 2025 12:04:29 +0530
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
X-Proofpoint-GUID: KJ7Mucj6MzhcIzJtxkktE8ElmS_rvm0L
X-Proofpoint-ORIG-GUID: E9WZKamKYsDT2vRu__B_WV6vNmSfkM5p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_02,2025-03-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030048
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

In mm/hugetlb.c:hugepages_setup(), we have:

if (hugetlb_max_hstate && hstate_is_gigantic(parsed_hstate))
     hugetlb_hstate_alloc_pages(parsed_hstate);

I believe the above code allocates memory for gigantic pages, and 
mm/hugetlb.c:hugetlb_init()
is called later because it is a subsys_initcall.

So, by the time the kernel reaches hugetlb_init(), the gigantic pages 
are already
allocated. Isn't that right?

With this understanding, this patch avoids populating hstate so that 
gigantic
huge page allocation fails for the fadump kernel.

Please let me know your opinion.


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

Thanks for pointing it. I will fix it.

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


