Return-Path: <linuxppc-dev+bounces-6747-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FA5A50B6E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Mar 2025 20:26:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7Mwb0bf9z2yN3;
	Thu,  6 Mar 2025 06:26:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741202767;
	cv=none; b=h2i+9lss6Ejl91wUPMQAhTUxZZoZjpdiBSLGVO4enQZqYKk/lgJYKsj27KLA/pDeN84mzgrRsfCjD+pj+/xWrF8Yqqwj2nW4H6pewrJ3xiqFQQekxOhajAXYfKD8hHpziEewDRaj0/JDvajx9xjBaXlv1zv2OvzXITT92aExE397mZdDhrtSU9eig4lUN/kqM7HBSimnleXGkBbLU73T9fLTABeWWpqccpzhNO0/zsv0PRYHbFjv/xJeVdaKEvWhAcWVnMR48Iy4fuAa4vVqW1Zz+n26fMMGGM3C/4vp5bha4Rgd3DykT7DkfiDLCQTCghIjSuJZ/DHNkQipN4Tu6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741202767; c=relaxed/relaxed;
	bh=NasVXF4uKOvoN13fiWrcNIMp9E/I/C5YbxMF6ggp/Wk=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=HcQ1YAKdUrv/jZoWbt+2Cxk6GiajbwIHPXMT5SCelGRQPyAPJ/1Qi6dFsxIUe8ZmEnU2AJ774Z9lgyoQnGdF/x1Pn5DOqMyzR8l7JRbZ7MZsP+z8xePQZyhbaEckPTblZbn2rC2NSDBpeOmjTa5+ai+3mLCevKSNZapscO2lF3Wy9JPRN1vxtiX3qY5BPPrbqEXBwaQlzW8TA3Nt5Tv+jN7GRyZ5bBSvo883gigtSA/bKkpLOOxF4Atji9bPnz6BkziPThukaJsfqZuy6dFdybzfelJtKsZTK6neqIDfvBFflf9AlsGFY9DMVZzaM8fuKojg1l8PG5V4elAqjvhFQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TYaRecTP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TYaRecTP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7MwX4Y2Cz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Mar 2025 06:26:03 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-223f4c06e9fso20627095ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Mar 2025 11:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741202761; x=1741807561; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NasVXF4uKOvoN13fiWrcNIMp9E/I/C5YbxMF6ggp/Wk=;
        b=TYaRecTPqYPppmmKATINgQsGmY63z9jegnAxvjnTWjisTnpYV01ouoa42/V+n1DGmB
         esmA6Rn5I43p0K03jJxYWEDyiMtwO4pUR0jSFXxmu36BagYa05G7GjxQLAXLGtiVOY1l
         lkZIvGpycpkPX8a4gZzF0G2TxR6wYXJuN5tBPi9sY4HMOO/6IQ1WlygQXHkCGhSKZslw
         4/m8SmI+AYBFTk1TjrcuVzIdKx6vKCIWl+WXzPUrKfl8UpMD2pXv9CedyUDiWlpC/KuM
         sR4CkZvDXCm23LrSAVC9IgvEeMk62ZuRbuQG9JaKGfjWPqqI39DPmYwlZE9mt2jZaXGe
         wNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741202761; x=1741807561;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NasVXF4uKOvoN13fiWrcNIMp9E/I/C5YbxMF6ggp/Wk=;
        b=asIrcJjRsu049czgvEIhRPHUWTZdt3RlsH5AYJ38HpWU/QFdKrZExjoN60DDMnhhTy
         rEvuS6hVWqKlquZ+fTwszJIFYpvFi79YxcRHCZwvT6mKtuW3G40MRgVqMjoJ7qciRjxC
         dSLtCJzpN9V6Y2PGpDbd6m6p4V+tHearL2Z2iN90UHHNutAmihznbv0OIFcsMFQ4pgG3
         +ZRQAPprPb0+5GyxBG5F1U4MfiAkhtxGh896Zw7gritzhLtCvZMjtuVbTueVKgc8ljnm
         Hgd4/zZMxTs29MAbQfkD6KxWrCUox/eSrHfPy7QR0gI7NJREGEqe7wWPYQ94wHNbaEfa
         I3cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsY9eW6zjly2SHxbzOc6bMJ+iKNpYqatkUezWC2WH4DvhplJBkWsXqFHoo2LKtuvvutmozBqA6GMaBoKw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxtTj5Ru4zKSmqo+9QdhuEo1o8bnjA/eCm8B2JnX99H2GE0VG26
	LjCj3yGaAQbbIUIMTLLvWuuYZP38i/kQxCKw2yrMGv8oa3IoKAYa
X-Gm-Gg: ASbGncur2dcYVBJlx3FUALSjZmbT2LDVUfojFN03E6gb3ydRAghgTbyELsLj/Zbzepg
	7sa+ef4TN0PuWG6oSRwfIt3+rr50ewS87W1fywHTxVfDM6CYg0a/I4WTD1S4L1Cb5zOjAloDfpg
	HyGQ0QT6NENiYKGsFUYW75HJn05ZKAffbqROMCbS3ZPHKKpEmxm2jByam7g8ZOZia8staUqM6Nh
	oriroOW3BjzUWZNPF0vkXFyMDubygcpZPnGZiUsHjTwuHm2X98sq/79Irw152hzAFBIpHaPgSv1
	6WfpFNq5y2/joE6t4gO1KyNbZeKynqtL0VnVkQ==
X-Google-Smtp-Source: AGHT+IEK6yhmENU+EM0wz6B9LTSfJimsqoiLC8xs8GC9ajBjvoON+cd+4EbVa0CCk4gQOmg+Skhmwg==
X-Received: by 2002:a17:902:fc8e:b0:21f:6546:9adc with SMTP id d9443c01a7336-224094115c8mr9358005ad.13.1741202761107;
        Wed, 05 Mar 2025 11:26:01 -0800 (PST)
Received: from dw-tp ([171.76.80.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501f9d96sm116850675ad.54.2025.03.05.11.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 11:26:00 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Hari Bathini <hbathini@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4] powerpc/hugetlb: Disable gigantic hugepages if fadump is active
In-Reply-To: <0a6a29f2-e7a9-4c51-8ab4-3e2c33843d1c@linux.ibm.com>
Date: Thu, 06 Mar 2025 00:47:51 +0530
Message-ID: <877c5370dc.fsf@gmail.com>
References: <20250128043358.163372-1-sourabhjain@linux.ibm.com> <87h64cgct3.fsf@gmail.com> <84a2ab12-e24a-4bd6-b562-e3154d1aa258@linux.ibm.com> <87frjttmt7.fsf@gmail.com> <0a6a29f2-e7a9-4c51-8ab4-3e2c33843d1c@linux.ibm.com>
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
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MALFORMED_FREEMAIL,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Sourabh Jain <sourabhjain@linux.ibm.com> writes:

> Hello Ritesh,
>
>
> On 04/03/25 10:27, Ritesh Harjani (IBM) wrote:
>> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>>
>>> Hello Ritesh,
>>>
>>> Thanks for the review.
>>>
>>> On 02/03/25 12:05, Ritesh Harjani (IBM) wrote:
>>>> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>>>>
>>>>> The fadump kernel boots with limited memory solely to collect the kernel
>>>>> core dump. Having gigantic hugepages in the fadump kernel is of no use.
>>>> Sure got it.
>>>>
>>>>> Many times, the fadump kernel encounters OOM (Out of Memory) issues if
>>>>> gigantic hugepages are allocated.
>>>>>
>>>>> To address this, disable gigantic hugepages if fadump is active by
>>>>> returning early from arch_hugetlb_valid_size() using
>>>>> hugepages_supported(). When fadump is active, the global variable
>>>>> hugetlb_disabled is set to true, which is later used by the
>>>>> PowerPC-specific hugepages_supported() function to determine hugepage
>>>>> support.
>>>>>
>>>>> Returning early from arch_hugetlb_vali_size() not only disables
>>>>> gigantic hugepages but also avoids unnecessary hstate initialization for
>>>>> every hugepage size supported by the platform.
>>>>>
>>>>> kernel logs related to hugepages with this patch included:
>>>>> kernel argument passed: hugepagesz=1G hugepages=1
>>>>>
>>>>> First kernel: gigantic hugepage got allocated
>>>>> ==============================================
>>>>>
>>>>> dmesg | grep -i "hugetlb"
>>>>> -------------------------
>>>>> HugeTLB: registered 1.00 GiB page size, pre-allocated 1 pages
>>>>> HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
>>>>> HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
>>>>> HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
>>>>>
>>>>> $ cat /proc/meminfo | grep -i "hugetlb"
>>>>> -------------------------------------
>>>>> Hugetlb:         1048576 kB
>>>> Was this tested with patch [1] in your local tree?
>>>>
>>>> [1]: https://web.git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=d629d7a8efc33
>>>>
>>>> IIUC, this patch [1] disables the boot time allocation of hugepages.
>>>> Isn't it also disabling the boot time allocation for gigantic huge pages
>>>> passed by the cmdline params like hugepagesz=1G and hugepages=2 ?
>>> Yes, I had the patch [1] in my tree.
>>>
>>> My understanding is that gigantic pages are allocated before normal huge
>>> pages.
>>>
>>> In hugepages_setup() in hugetlb.c, we have:
>>>
>>>       if (hugetlb_max_hstate && hstate_is_gigantic(parsed_hstate))
>>>           hugetlb_hstate_alloc_pages(parsed_hstate);
>>>
>>> I believe the above code allocates memory for gigantic pages, and
>>> hugetlb_init() is
>>> called later because it is a subsys_initcall.
>>>
>>> So, by the time the kernel reaches hugetlb_init(), the gigantic pages
>>> are already
>>> allocated. Isn't that right?
>>>
>>> Please let me know your opinion.
>> Yes, you are right. We are allocating hugepages from memblock, however
>> this isn't getting advertized anywhere. i.e. there is no way one can
>> know from any user interface on whether hugepages were allocated or not.
>> i.e. for fadump kernel when hugepagesz= and hugepages= params are
>> passed, though it will allocate gigantic pages, it won't advertize this
>> in meminfo or anywhere else. This was adding the confusion when I tested
>> this (which wasn't clear from the commit msg either).
>>
>> And I guess this is happening during fadump kernel because of our patch
>> [1], which added a check to see whether hugetlb_disabled is true in
>> hugepages_supported(). Due to this hugetlb_init() is now not doing the
>> rest of the initialization for those gigantic pages which were allocated
>> due to cmdline options from hugepages_setup().
>>
>> [1]: https://lore.kernel.org/linuxppc-dev/20241202054310.928610-1-sourabhjain@linux.ibm.com/
>>
>> Now as we know from below that fadump can set hugetlb_disabled call in early_setup().
>> i.e. fadump can mark hugetlb_disabled to true in
>> early_setup() -> early_init_devtree() -> fadump_reserve_mem()
>>
>> And hugepages_setup() and hugepagesz_setup() gets called late in
>> start_kernel() -> parse_args()
>>
>>
>> And we already check for hugepages_supported() in all necessary calls in
>> mm/hugetlb.c. So IMO, this check should go in mm/hugetlb.c in
>> hugepagesz_setup() and hugepages_setup(). Because otherwise every arch
>> implementation will end up duplicating this by adding
>> hugepages_supported() check in their arch implementation of
>> arch_hugetlb_valid_size().
>>
>> e.g. references of hugepages_supported() checks in mm/hugetlb.c
>>
>> mm/hugetlb.c hugetlb_show_meminfo_node 4959 if (!hugepages_supported())
>> mm/hugetlb.c hugetlb_report_node_meminfo 4943 if (!hugepages_supported())
>> mm/hugetlb.c hugetlb_report_meminfo 4914 if (!hugepages_supported())
>> mm/hugetlb.c hugetlb_overcommit_handler 4848 if (!hugepages_supported())
>> mm/hugetlb.c hugetlb_sysctl_handler_common 4809 if (!hugepages_supported())
>> mm/hugetlb.c hugetlb_init 4461 if (!hugepages_supported()) {
>> mm/hugetlb.c dissolve_free_hugetlb_folios 2211 if (!hugepages_supported())
>> fs/hugetlbfs/inode.c init_hugetlbfs_fs 1604 if (!hugepages_supported()) {
>>
>>
>> Let me also see the history on why this wasn't done earlier though...
>>
>> ... Oh actually there is more history to this. See [2]. We already had
>> hugepages_supported() check in hugepages_setup() and other places
>> earlier which was removed to fix some other problem in ppc ;)
>>
>> [2]: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c2833a5bf75b3657c4dd20b3709c8c702754cb1f
>>
>>
>> Hence I believe this needs a wider cleanup than just fixing it for our
>> arch. I see there is a patch series already fixing these code paths,
>> which is also cleaning up the path of gigantic hugepage allocation in
>> hugepages_setup(). I think it is in mm-unstable branch too. Can we
>> please review & test that to make sure that the fadump usecase of
>> disabling hugepages & gigantic are getting covered properly?
>>
>> [3]: https://lore.kernel.org/all/20250228182928.2645936-1-fvdl@google.com/
>
> I evaluated the patch series [3] for the fadump issue, and here are my 
> observations:
>
> Currently, the patch series [3] does not fix the issue I am trying to 
> address with this patch.
>
> With patch series [3] applied, I see the following logs when booting the 
> fadump kernel with
> hugepagesz=1G hugepages=1
> |
> |
> With just Patch series [3]:
> ------------------------------------
>
> kdump:/# dmesg | grep -i HugeTLB
> [    0.000000] HugeTLB: allocating 10 of page size 1.00 GiB failed.  
> Only allocated 9 hugepages.
> [    0.405964] HugeTLB support is disabled!
> [    0.409162] HugeTLB: huge pages not supported, ignoring associated 
> command-line parameters
> [    0.437740] hugetlbfs: disabling because there are no supported 
> hugepage sizes
>
> One good thing is that the kernel now at least reports the gigantic 
> pages allocated, which was
> not the case before. I think patch series [3] introduced that improvement.
>
> Now, on top of patch series [3], I applied this fix, and the kernel 
> prints the following logs:
>
> Patch series [3] + this fix:
> ------------------------------------
>
> [    0.000000] HugeTLB: unsupported hugepagesz=1G
> [    0.000000] HugeTLB: hugepages=10 does not follow a valid hugepagesz, 
> ignoring
> [    0.366158] HugeTLB support is disabled!
> [    0.398004] hugetlbfs: disabling because there are no supported 
> hugepage sizes
>
> With these logs, one can clearly identify what is happening.
>
> What are your thoughts on this fix now?
>
> Do you still think handling this in generic code is better?

I believe so yes (unless we have a valid reason for not doing that).
hugepages_supported() is an arch specific call. If you see the prints
above what we are essentially saying is that this is not a valid
hugepagesz. But that's not the case really right. What it should just
reflect is that the hugepages support is disabled. 

That being said, I will have to go and look into that series to suggest,
where in that path it should use hugepages_supported() arch call to see
if the hugepages are supported or not before initializing. And hopefully
as you suggested since our cmdline parsing problem was already solved,
it should not be a problem in using hugepages_supported() during cmdline
parsing phase.
But let me check that series and get back.


> Given that I was already advised to handle things in arch
> code. [4]
>
> Or should we keep it this way?
> One advantage handling things in arch_hugetlb_valid_size() is that it helps
> avoid populating hstates since it is not required anyway. I am not claiming
> that it is not possible in generic code.

IMO, even adding hugepages_supported() check at the right place should avoid
populating hstates too. But let's confirm that.

-ritesh

>
> Thoughts?
>
> Thanks,
> Sourabh Jain
>
>
> [3]: https://lore.kernel.org/all/20250228182928.2645936-1-fvdl@google.com/
> [4]: https://lore.kernel.org/all/20250122150613.28a92438@thinkpad-T15/

