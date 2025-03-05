Return-Path: <linuxppc-dev+bounces-6720-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C90A4F6AF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Mar 2025 06:48:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z71n737rSz2xs7;
	Wed,  5 Mar 2025 16:48:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741153707;
	cv=none; b=oRKsvhxZ8B/hiEOrwUkfzW3odqqDYVG0RdKpVN09PhExbAK3akyBhgk3RWNULaCz+PnQmDr5gGATR9oCeJpockn/gh4cIUBfQtRCvuvB6Y0QAVZtsZPqN7BhPHY1hCnRutFVpxfyZ6OK3w1N+LIxKHgUg5fRiRZz7G1tfuhlIceYSieuM720zSCqfJQyaMgSG+BAP0hDEXDlmyk69/NFstIf/j+7OvFUefm7vPbfx7dnhoNAClCDkxMMJeKWZGLm6yzYgwuKeDM5UORaTEV4QaYzLv7kcP5xwXQnREcXQ45LhXARgiHa6uFNIIk4mV3snYoJBtPTq62Q+DM77LcpkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741153707; c=relaxed/relaxed;
	bh=z6B2K4cnW420moB6JQnXAaxoq/qai9TLlTb84oNvWc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D87Izu8HQO3CW6+HQGXbvaY3whMS5GzrHakx2w20f+jt0R4xf29e2fjdkPy65YHCFairTuNk3cj0mfk/aTEsMnPRqiy+/c2hOhotqlgajZQZP1UW56cqMzq4HthwlEHv1K29GtMzgTGktuacCRIJ46ZHi/QfjFnPy5UWqzBLd/SCg2QZ6+qi31a9hukbYiA+CsAHccmf3ecstgFG1Ahn8KZrKVZr3gy1jBGfMvbF1zTwy05rTdYkaFtxyoaKNUXAD3qBEfnXlgZ+Y2aagu8Bp8GfkOP65yCs9x0+oSK8o6fQYp1jARGWfjyZ28VlihNRWKM0DmasD4hgOIeZb63cTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=laKUloCC; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=laKUloCC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z71n604hlz2xmk
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 16:48:25 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524KZek5007513;
	Wed, 5 Mar 2025 05:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=z6B2K4
	cnW420moB6JQnXAaxoq/qai9TLlTb84oNvWc0=; b=laKUloCC4KhBq3ZJF2NKFA
	Uz8zuswc5uEg0z3qDePUN0U/YXzxsUuDPDEqerCsmMCbpcggVeaZVGyEyLwety8a
	A1Vbcvb4e3M0CTsV3tGMcL7z35u/saiT5WXbixQ67Rt5Ja4EjGBLB2FpfBz3WQD1
	41KQ1010Z11rOUoK5JYYTW3vhbJIi/CdGgxYzx12XR2UL6Frhfhv9C6zvLYGvYnZ
	99nQkz1o+dKST1/BvR0Np5NTSMEWhx6wAAe1iO10jv3a/QY2ODUW4SyAHMNYabQJ
	QnoLVMGKnACERnSp3XnJWVaEwgxQ+LdJ5rPEErWVnvqnmjZC1NkbVmY/DRJnv7MQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4568pp9pms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 05:48:14 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5255guH9005090;
	Wed, 5 Mar 2025 05:48:13 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4568pp9pmq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 05:48:13 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5254QDYl020873;
	Wed, 5 Mar 2025 05:48:12 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 454esk0ww0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 05:48:12 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5255m9pX56689056
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Mar 2025 05:48:09 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 604CC20043;
	Wed,  5 Mar 2025 05:48:09 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 46FC920040;
	Wed,  5 Mar 2025 05:48:07 +0000 (GMT)
Received: from [9.43.95.149] (unknown [9.43.95.149])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Mar 2025 05:48:06 +0000 (GMT)
Message-ID: <96f3bbe1-821c-4792-a22f-3ecc3aecb6a4@linux.ibm.com>
Date: Wed, 5 Mar 2025 11:18:06 +0530
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
 <84a2ab12-e24a-4bd6-b562-e3154d1aa258@linux.ibm.com>
 <87frjttmt7.fsf@gmail.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <87frjttmt7.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OXHN0Cycem6Fn1-5ddMQJwdDY4_dZBuL
X-Proofpoint-ORIG-GUID: e-Har3NtIaj3M9ra4R9Cldsa6gRYR85A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_03,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050041
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Ritesh,


On 04/03/25 10:27, Ritesh Harjani (IBM) wrote:
> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>
>> Hello Ritesh,
>>
>> Thanks for the review.
>>
>> On 02/03/25 12:05, Ritesh Harjani (IBM) wrote:
>>> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>>>
>>>> The fadump kernel boots with limited memory solely to collect the kernel
>>>> core dump. Having gigantic hugepages in the fadump kernel is of no use.
>>> Sure got it.
>>>
>>>> Many times, the fadump kernel encounters OOM (Out of Memory) issues if
>>>> gigantic hugepages are allocated.
>>>>
>>>> To address this, disable gigantic hugepages if fadump is active by
>>>> returning early from arch_hugetlb_valid_size() using
>>>> hugepages_supported(). When fadump is active, the global variable
>>>> hugetlb_disabled is set to true, which is later used by the
>>>> PowerPC-specific hugepages_supported() function to determine hugepage
>>>> support.
>>>>
>>>> Returning early from arch_hugetlb_vali_size() not only disables
>>>> gigantic hugepages but also avoids unnecessary hstate initialization for
>>>> every hugepage size supported by the platform.
>>>>
>>>> kernel logs related to hugepages with this patch included:
>>>> kernel argument passed: hugepagesz=1G hugepages=1
>>>>
>>>> First kernel: gigantic hugepage got allocated
>>>> ==============================================
>>>>
>>>> dmesg | grep -i "hugetlb"
>>>> -------------------------
>>>> HugeTLB: registered 1.00 GiB page size, pre-allocated 1 pages
>>>> HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
>>>> HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
>>>> HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
>>>>
>>>> $ cat /proc/meminfo | grep -i "hugetlb"
>>>> -------------------------------------
>>>> Hugetlb:         1048576 kB
>>> Was this tested with patch [1] in your local tree?
>>>
>>> [1]: https://web.git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=d629d7a8efc33
>>>
>>> IIUC, this patch [1] disables the boot time allocation of hugepages.
>>> Isn't it also disabling the boot time allocation for gigantic huge pages
>>> passed by the cmdline params like hugepagesz=1G and hugepages=2 ?
>> Yes, I had the patch [1] in my tree.
>>
>> My understanding is that gigantic pages are allocated before normal huge
>> pages.
>>
>> In hugepages_setup() in hugetlb.c, we have:
>>
>>       if (hugetlb_max_hstate && hstate_is_gigantic(parsed_hstate))
>>           hugetlb_hstate_alloc_pages(parsed_hstate);
>>
>> I believe the above code allocates memory for gigantic pages, and
>> hugetlb_init() is
>> called later because it is a subsys_initcall.
>>
>> So, by the time the kernel reaches hugetlb_init(), the gigantic pages
>> are already
>> allocated. Isn't that right?
>>
>> Please let me know your opinion.
> Yes, you are right. We are allocating hugepages from memblock, however
> this isn't getting advertized anywhere. i.e. there is no way one can
> know from any user interface on whether hugepages were allocated or not.
> i.e. for fadump kernel when hugepagesz= and hugepages= params are
> passed, though it will allocate gigantic pages, it won't advertize this
> in meminfo or anywhere else. This was adding the confusion when I tested
> this (which wasn't clear from the commit msg either).

Yeah I should have added that in my commit message.

>
> And I guess this is happening during fadump kernel because of our patch
> [1], which added a check to see whether hugetlb_disabled is true in-
> hugepages_supported(). Due to this hugetlb_init() is now not doing the
> rest of the initialization for those gigantic pages which were allocated
> due to cmdline options from hugepages_setup().

Yeah patch [1] has disabled the hugetlb initialization.

>
> [1]: https://lore.kernel.org/linuxppc-dev/20241202054310.928610-1-sourabhjain@linux.ibm.com/
>
> Now as we know from below that fadump can set hugetlb_disabled call in early_setup().
> i.e. fadump can mark hugetlb_disabled to true in
> early_setup() -> early_init_devtree() -> fadump_reserve_mem()
>
> And hugepages_setup() and hugepagesz_setup() gets called late in
> start_kernel() -> parse_args()
>
>
> And we already check for hugepages_supported() in all necessary calls in
> mm/hugetlb.c. So IMO, this check should go in mm/hugetlb.c in
> hugepagesz_setup() and hugepages_setup(). Because otherwise every arch
> implementation will end up duplicating this by adding
> hugepages_supported() check in their arch implementation of
> arch_hugetlb_valid_size().
>
> e.g. references of hugepages_supported() checks in mm/hugetlb.c
>
> mm/hugetlb.c hugetlb_show_meminfo_node 4959 if (!hugepages_supported())
> mm/hugetlb.c hugetlb_report_node_meminfo 4943 if (!hugepages_supported())
> mm/hugetlb.c hugetlb_report_meminfo 4914 if (!hugepages_supported())
> mm/hugetlb.c hugetlb_overcommit_handler 4848 if (!hugepages_supported())
> mm/hugetlb.c hugetlb_sysctl_handler_common 4809 if (!hugepages_supported())
> mm/hugetlb.c hugetlb_init 4461 if (!hugepages_supported()) {
> mm/hugetlb.c dissolve_free_hugetlb_folios 2211 if (!hugepages_supported())
> fs/hugetlbfs/inode.c init_hugetlbfs_fs 1604 if (!hugepages_supported()) {

v1 proposed to do it in generic code:
https://lore.kernel.org/all/20250121150419.1342794-1-sourabhjain@linux.ibm.com/

But it was suggested to try it in arch specific code.


>
>
> Let me also see the history on why this wasn't done earlier though...
>
> ... Oh actually there is more history to this. See [2]. We already had
> hugepages_supported() check in hugepages_setup() and other places
> earlier which was removed to fix some other problem in ppc ;)
>
> [2]: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c2833a5bf75b3657c4dd20b3709c8c702754cb1f
>

IIUC, I think it was done because the HPAGE_SHIFT was not initialized 
early enough
on powrepc. But it is no longer the case after the below commit:

2354ad252b66 ("powerpc/mm: Update default hugetlb size early")

> Hence I believe this needs a wider cleanup than just fixing it for our
> arch. I see there is a patch series already fixing these code paths,
> which is also cleaning up the path of gigantic hugepage allocation in
> hugepages_setup(). I think it is in mm-unstable branch too. Can we
> please review & test that to make sure that the fadump usecase of
> disabling hugepages & gigantic are getting covered properly?
>
> [3]: https://lore.kernel.org/all/20250228182928.2645936-1-fvdl@google.com/
>
>
> Thoughts?

Agree, if there is cleanup happening already we should try to handle things
there itself. I will review the patch series [3].

Thanks, Ritesh, for the detailed review! Appreciate your time and effort.

Thanks,
Sourabh Jain


>
> -ritesh
>
>> Thanks,
>> Sourabh Jain
>>
>>
>>>
>>>> HugeTLB: registered 1.00 GiB page size, pre-allocated 1 pages
>>> This print comes from report_hugepages(). The only place from where
>>> report_hugepages() gets called is hugetlb_init(). hugetlb_init() is what
>>> is responsible for hugepages & gigantic hugepage allocations of the
>>> passed kernel cmdline params.
>>>
>>> But hugetlb_init() already checks for hugepages_supported() in the very
>>> beginning. So I am not sure whether we need this extra patch to disable
>>> gigantic hugepages allocation by the kernel cmdline params like
>>> hugepagesz=1G and hugepages=2 type of options.
>>>
>>> Hence I was wondering if you had this patch [1] in your tree when you were
>>> testing this?
>>>
>>> But I may be missing something. Could you please help clarify on whether
>>> we really need this patch to disable gigantic hugetlb page allocations?
>>>
>>>> Fadump kernel: gigantic hugepage not allocated
>>>> ===============================================
>>>>
>>>> dmesg | grep -i "hugetlb"
>>>> -------------------------
>>>> [    0.000000] HugeTLB: unsupported hugepagesz=1G
>>>> [    0.000000] HugeTLB: hugepages=1 does not follow a valid hugepagesz, ignoring
>>>> [    0.706375] HugeTLB support is disabled!
>>>> [    0.773530] hugetlbfs: disabling because there are no supported hugepage sizes
>>>>
>>>> $ cat /proc/meminfo | grep -i "hugetlb"
>>>> ----------------------------------
>>>> <Nothing>
> What I meant was, when we pass hugepagesz= and hugepages= and fadump=on,
> then during the fadump kernel, we still will see the above prints and
> nothing in meminfo even w/o this patch (because the user interfaces will
> be disabled since hugetlb_supported() is false).
> This observation should have been mentioned in the commit msg to avoid
> the confusion :)
>
>
>>>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>>>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>>>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>>> Cc: Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
>>> I guess the extra " in the above was not adding me in the cc list.
>>> Hence I missed to see this patch early.
>> Thanks for point it out. I will fix it.
>>
>>
>>> -ritesh
>>>
>>>
>>>> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>>> ---
>>>> Changelog:
>>>>
>>>> v1:
>>>> https://lore.kernel.org/all/20250121150419.1342794-1-sourabhjain@linux.ibm.com/
>>>>
>>>> v2:
>>>> https://lore.kernel.org/all/20250124103220.111303-1-sourabhjain@linux.ibm.com/
>>>>    - disable gigantic hugepage in arch code, arch_hugetlb_valid_size()
>>>>
>>>> v3:
>>>> https://lore.kernel.org/all/20250125104928.88881-1-sourabhjain@linux.ibm.com/
>>>>    - Do not modify the initialization of the shift variable
>>>>
>>>> v4:
>>>> - Update commit message to include how hugepages_supported() detects
>>>>     hugepages support when fadump is active
>>>> - Add Reviewed-by tag
>>>> - NO functional change
>>>>
>>>> ---
>>>>    arch/powerpc/mm/hugetlbpage.c | 3 +++
>>>>    1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
>>>> index 6b043180220a..88cfd182db4e 100644
>>>> --- a/arch/powerpc/mm/hugetlbpage.c
>>>> +++ b/arch/powerpc/mm/hugetlbpage.c
>>>> @@ -138,6 +138,9 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
>>>>    	int shift = __ffs(size);
>>>>    	int mmu_psize;
>>>>
>>>> +	if (!hugepages_supported())
>>>> +		return false;
>>>> +
>>>>    	/* Check that it is a page size supported by the hardware and
>>>>    	 * that it fits within pagetable and slice limits. */
>>>>    	if (size <= PAGE_SIZE || !is_power_of_2(size))
>>>> --
>>>> 2.48.1


