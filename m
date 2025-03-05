Return-Path: <linuxppc-dev+bounces-6726-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B84BAA4FC60
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Mar 2025 11:40:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z78G165Y6z3br2;
	Wed,  5 Mar 2025 21:40:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741171225;
	cv=none; b=iTpiSYsd6v6K/4wbHYoIitDYwpEPnW2NmsksUR4is/J1nwKP5j/4RToytIS03708Vmz4lmQcyk8KArA4KkAJ9g7269OwkMLXFQaPCH+WV6LqjMdkr/MxX6BKkerqC0E0BuGufHLQiWn3kor1E/NvYIz9joUoY6pW7cz6SLzaiGP0j2qegtaRsRxuOgwV+UgK3Wstc0XZKUOh4FmU1MDfSg3TYJ02kaoGeWxPsgvUwTqSa+qj9LQbDbaBindRbmnly7aaM3TxMxS5wm4L4nueqVQsoMWUiiPuQIvTu9rtmWl2of5vwF2+yTI1YAFVq9T6N2CR/863zlzGvo8ni8oU0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741171225; c=relaxed/relaxed;
	bh=AOT/XADUsodPH5uByyCfM0uxzy+gUpgiF/KlsHaGmrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bJz9CW6FbFwexgtMdLv7ssk3fEZgSmLCK8vC0wld0fORQjRovnXEH/Obwy1WLi+2Y8kEjk7WwSSIn3f94HE72Zko84tCeF+I/kw5qKphJchqiyHgA4JqZabZYuES0zVcmOkZaV5IbneO1P+Kyux9JBnaOiBvPmJSU+XhZ68X0yFjRAVIqqnkF6mFCCy/XEphEuW7FSnzNkQDUKsR1wX0shcuD0zUramG/6hMgA4w8CDJgcn3nrRmWHvzu4h6Jh3PbRI/2SSvBQBCrrMTPfwUJI3ArR1tiiCPaE+OWQNjG16EaF/SCNuVtcm6en3LNPtPG1XD1Kg/URv/6qlIJulwuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ePVS2UkV; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ePVS2UkV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z78G00nj3z3bqM
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 21:40:23 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5258sewA013361;
	Wed, 5 Mar 2025 10:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=AOT/XA
	DUsodPH5uByyCfM0uxzy+gUpgiF/KlsHaGmrU=; b=ePVS2UkVGxqiOX3Ik+DZY3
	pwczX3UUlOfUzFwQVwloqAJDV6AXqjw7h7J0zhOtEOyFwKAq9jOMXpTp+tpbqa0W
	cHYvs4QpJegFZnEusxkhZEL9QOxW41+JzwcnlcaD5cjlbUxnfs5+fBxgMUczQOwa
	T3S9Fl4yDqp4NV9ewhjizuRVHIGrcimTSMwmTp6X/Z1/hwDJ/3lqGlmymfNdrsm+
	z62jz99rBbyIuVcMgW9WfQh4dJ4ay94AIXcXqUVgHDxRD56yYCtxZHcYoA7jB5bc
	H1Ga4cCKtdvm6M0pSxKspDZx5ZFXR0YdsgwzLJJvwFt1wPnTVlbU5oMsRt8UNb6w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4568r0jymy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 10:40:13 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 525AXKwi006106;
	Wed, 5 Mar 2025 10:40:12 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4568r0jymv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 10:40:12 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 525A1TJY000362;
	Wed, 5 Mar 2025 10:40:12 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 454cjt2j7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 10:40:12 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 525Ae8GT34931164
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Mar 2025 10:40:08 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C46902017E;
	Wed,  5 Mar 2025 09:38:41 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D6022017B;
	Wed,  5 Mar 2025 09:38:39 +0000 (GMT)
Received: from [9.43.95.149] (unknown [9.43.95.149])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Mar 2025 09:38:39 +0000 (GMT)
Message-ID: <0a6a29f2-e7a9-4c51-8ab4-3e2c33843d1c@linux.ibm.com>
Date: Wed, 5 Mar 2025 15:08:38 +0530
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
X-Proofpoint-GUID: 5K36MdV3STT0gJVh0D4Ux3dG8QFf9CZo
X-Proofpoint-ORIG-GUID: 4leXb78WwicdL0G3TvonSDWaeu2dWmIJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 mlxscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503050084
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
>
> And I guess this is happening during fadump kernel because of our patch
> [1], which added a check to see whether hugetlb_disabled is true in
> hugepages_supported(). Due to this hugetlb_init() is now not doing the
> rest of the initialization for those gigantic pages which were allocated
> due to cmdline options from hugepages_setup().
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
>
> Hence I believe this needs a wider cleanup than just fixing it for our
> arch. I see there is a patch series already fixing these code paths,
> which is also cleaning up the path of gigantic hugepage allocation in
> hugepages_setup(). I think it is in mm-unstable branch too. Can we
> please review & test that to make sure that the fadump usecase of
> disabling hugepages & gigantic are getting covered properly?
>
> [3]: https://lore.kernel.org/all/20250228182928.2645936-1-fvdl@google.com/

I evaluated the patch series [3] for the fadump issue, and here are my 
observations:

Currently, the patch series [3] does not fix the issue I am trying to 
address with this patch.

With patch series [3] applied, I see the following logs when booting the 
fadump kernel with
hugepagesz=1G hugepages=1
|
|
With just Patch series [3]:
------------------------------------

kdump:/# dmesg | grep -i HugeTLB
[    0.000000] HugeTLB: allocating 10 of page size 1.00 GiB failed.  
Only allocated 9 hugepages.
[    0.405964] HugeTLB support is disabled!
[    0.409162] HugeTLB: huge pages not supported, ignoring associated 
command-line parameters
[    0.437740] hugetlbfs: disabling because there are no supported 
hugepage sizes

One good thing is that the kernel now at least reports the gigantic 
pages allocated, which was
not the case before. I think patch series [3] introduced that improvement.

Now, on top of patch series [3], I applied this fix, and the kernel 
prints the following logs:

Patch series [3] + this fix:
------------------------------------

[    0.000000] HugeTLB: unsupported hugepagesz=1G
[    0.000000] HugeTLB: hugepages=10 does not follow a valid hugepagesz, 
ignoring
[    0.366158] HugeTLB support is disabled!
[    0.398004] hugetlbfs: disabling because there are no supported 
hugepage sizes

With these logs, one can clearly identify what is happening.

What are your thoughts on this fix now?

Do you still think handling this in generic code is better?
Given that I was already advised to handle things in arch
code. [4]

Or should we keep it this way?
One advantage handling things in arch_hugetlb_valid_size() is that it helps
avoid populating hstates since it is not required anyway. I am not claiming
that it is not possible in generic code.

Thoughts?

Thanks,
Sourabh Jain


[3]: https://lore.kernel.org/all/20250228182928.2645936-1-fvdl@google.com/
[4]: https://lore.kernel.org/all/20250122150613.28a92438@thinkpad-T15/

