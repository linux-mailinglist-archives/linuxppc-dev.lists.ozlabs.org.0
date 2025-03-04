Return-Path: <linuxppc-dev+bounces-6659-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C85A4D332
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 06:58:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6Q314pKKz2yvk;
	Tue,  4 Mar 2025 16:58:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1032"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741067901;
	cv=none; b=T7fC2htLyuStiAbY49LvRgPLC0EJ2HvE5qzKE+BUYogJeYFZhVoUEY5BnR71/XJM10tfoUKeXDwscRcdYC+9ozOq3YhJ1LmLlvxpKK3C+ovQG7S7TtuzUboaBmBcco5QeQyHt2AZe/+XxIx8CWDB65EKA2YUcohHSOnPowk20BCpCaAKpb7KHZBCVN4Ufo4Z3q23pmqSFKLXraje5JbQ8KNR/JmsrS2us28yTeXhVeFHqJ8iXPxp6A+/lZbhZbpTqTDkMKb5LihEPCmIkBvrdoM8ULa4eT47ybY/I0t6/mONVdwUqK05MTa6FY9TfOkpqViciWuP5SLDoCXsCRlRnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741067901; c=relaxed/relaxed;
	bh=yOaP7xeGxXC0B8/JeWLBZSowIX3CdoKm5gkTER4B97o=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=BUyQtw2eNkuZGY7tpkMUTw2RpVCtjxbEd1+/h8haTYdtUqTylCQgKiJBYLK3i7XUzOg1PsNHT1Gqhy//b05VEjxQFvPfDnk0f1tY2NeHP/IJs9xGlhaSKLysSkNZ1UgO4zPaoE/r8JLJL6263FPOnXHeypFc4AKGrrA/SBX7gfKir+1Zh7IjlfW2/LCdjCiXdBqdT5w+MABx2wc9NfDM8UjKF6Paoo+QDTQf2wcv3cXP2GfddJm3toT30/BGD/CL5zbTajqphRhRw5tWh5O7+LJmXVfCq93HIUC1zvfJ8Xibzb5IJGTt2IeGgXKou2oQ7DCooryR65AsmnyN0fteBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gCeGbrgJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gCeGbrgJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6Q301cVTz2yjV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 16:58:19 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2febaaf175fso6288658a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Mar 2025 21:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741067896; x=1741672696; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOaP7xeGxXC0B8/JeWLBZSowIX3CdoKm5gkTER4B97o=;
        b=gCeGbrgJbrNtF7eL2KFxbIPOtPgX4bAZ4epDPpV7Nz0zzf2f3wjw11xj7qfnkV6XTR
         jmPNYHFFeeiyB5yqeRl3rtNC/zzMIFdM0de825Y6BUN30dTec47wOS9lzv/jPwCAljsh
         MRW2nj7fqiTz2Bq2smpdUGT2MbMlF/MxMjGH2y0CdJiNQINxnEgDFowKkUNX5v1s7sXA
         XmOwV5wAQRubSc+MxBeMKnqDHowEoKuOzkLl1bMgm0ateMY+H05LhZ+BCvHPRzfrXfBp
         wVx0qVuYA7+vxRvi1M8oHOi5r57PRpz+TlrJeEfuvslYYnys8NjMMBxHLa9C9QiRurD1
         nnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741067896; x=1741672696;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOaP7xeGxXC0B8/JeWLBZSowIX3CdoKm5gkTER4B97o=;
        b=CwQRMzIz0e44+HbyxUsIKgvSugmGJxGX873O4Mhdw2FVvs5jbGw9CYMTWg6vLu+zaL
         uD6J/ifiMGpig8V5KUXbCc+yp47yrJz6oSx4X3zgp3ahETwVNSq0K2VuVxaB6In9PwGu
         zq2IS9Nki3PNMuOmN3w7sgLe9nH5srhhpSJfDUAGtnEr+41hnJtZWqnVv+iekRbVith8
         PHPtl5OLN0ihySaEU9GU4usQbrQkyDcix+O+6BL6KH9064xYx835K1jA9p2rh9HcBoM5
         zyzwEOSvLwfK/k/EsRMhfR5TRjSYTeSKAiFd0rDZBq4ixoO+agIVjfHGaXeR53H7gddF
         HscQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2FNkQ6ND53DBKz/XEWwwZvhQtUqAb/JBvv5TSDiBgAAukLj7MshV8TEqOnrPO1z9FXEFNKOxUPZs5GTM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzUO5UNr/T6E7du4r4M4okqLGtBsN4lIqATudKI8GD0qkBsdSuR
	TvY4U03TOfybCEKN/BmzZ62OwEcY+b6cd2jJZebS08Kgq7Q1XyTE
X-Gm-Gg: ASbGncsVv82qhZ/qub/nUHH/vls2HMytHr/U16LMrNTgkJqgmH+/XlimGVgLnyqODGM
	tx6QaxB6eaa+WEoaCNb4tQB89kRRYU/WIkVP3KAjYC8XUZTvexzLAde13m+/Vh2LyRU6BBK2X8w
	A8aI1E6RbnHO6zTV8RQf31AzK1gT4LLqtYEgzkjwezMWCfW556dpaH2qay/5te+46YuLelh3sGM
	Hc51973CfGFmngUqpE+0aeNC7tLrueHYv6+tk6woOegjCc1RcD9bangNau465DyCAnZLOk+T6eF
	O8YBfjwHry9WQtReYhFthXsQ3ENjGbaKM59pqw==
X-Google-Smtp-Source: AGHT+IGQm9LNTqjUkda6gE6UnHcmaZ8mjCoyF61Jy/cFz4ViFggX05JeQzmG4R7wafmXVo88+l2gjw==
X-Received: by 2002:a17:90b:1d86:b0:2f7:4cce:ae37 with SMTP id 98e67ed59e1d1-2febab7176amr28106736a91.18.1741067896441;
        Mon, 03 Mar 2025 21:58:16 -0800 (PST)
Received: from dw-tp ([171.76.80.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fed5700987sm6837271a91.30.2025.03.03.21.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 21:58:15 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Hari Bathini <hbathini@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4] powerpc/hugetlb: Disable gigantic hugepages if fadump is active
In-Reply-To: <84a2ab12-e24a-4bd6-b562-e3154d1aa258@linux.ibm.com>
Date: Tue, 04 Mar 2025 10:27:40 +0530
Message-ID: <87frjttmt7.fsf@gmail.com>
References: <20250128043358.163372-1-sourabhjain@linux.ibm.com> <87h64cgct3.fsf@gmail.com> <84a2ab12-e24a-4bd6-b562-e3154d1aa258@linux.ibm.com>
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
> Thanks for the review.
>
> On 02/03/25 12:05, Ritesh Harjani (IBM) wrote:
>> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>>
>>> The fadump kernel boots with limited memory solely to collect the kernel
>>> core dump. Having gigantic hugepages in the fadump kernel is of no use.
>> Sure got it.
>>
>>> Many times, the fadump kernel encounters OOM (Out of Memory) issues if
>>> gigantic hugepages are allocated.
>>>
>>> To address this, disable gigantic hugepages if fadump is active by
>>> returning early from arch_hugetlb_valid_size() using
>>> hugepages_supported(). When fadump is active, the global variable
>>> hugetlb_disabled is set to true, which is later used by the
>>> PowerPC-specific hugepages_supported() function to determine hugepage
>>> support.
>>>
>>> Returning early from arch_hugetlb_vali_size() not only disables
>>> gigantic hugepages but also avoids unnecessary hstate initialization for
>>> every hugepage size supported by the platform.
>>>
>>> kernel logs related to hugepages with this patch included:
>>> kernel argument passed: hugepagesz=1G hugepages=1
>>>
>>> First kernel: gigantic hugepage got allocated
>>> ==============================================
>>>
>>> dmesg | grep -i "hugetlb"
>>> -------------------------
>>> HugeTLB: registered 1.00 GiB page size, pre-allocated 1 pages
>>> HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
>>> HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
>>> HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
>>>
>>> $ cat /proc/meminfo | grep -i "hugetlb"
>>> -------------------------------------
>>> Hugetlb:         1048576 kB
>> Was this tested with patch [1] in your local tree?
>>
>> [1]: https://web.git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=d629d7a8efc33
>>
>> IIUC, this patch [1] disables the boot time allocation of hugepages.
>> Isn't it also disabling the boot time allocation for gigantic huge pages
>> passed by the cmdline params like hugepagesz=1G and hugepages=2 ?
>
> Yes, I had the patch [1] in my tree.
>
> My understanding is that gigantic pages are allocated before normal huge 
> pages.
>
> In hugepages_setup() in hugetlb.c, we have:
>
>      if (hugetlb_max_hstate && hstate_is_gigantic(parsed_hstate))
>          hugetlb_hstate_alloc_pages(parsed_hstate);
>
> I believe the above code allocates memory for gigantic pages, and 
> hugetlb_init() is
> called later because it is a subsys_initcall.
>
> So, by the time the kernel reaches hugetlb_init(), the gigantic pages 
> are already
> allocated. Isn't that right?
>
> Please let me know your opinion.

Yes, you are right. We are allocating hugepages from memblock, however
this isn't getting advertized anywhere. i.e. there is no way one can
know from any user interface on whether hugepages were allocated or not.
i.e. for fadump kernel when hugepagesz= and hugepages= params are
passed, though it will allocate gigantic pages, it won't advertize this
in meminfo or anywhere else. This was adding the confusion when I tested
this (which wasn't clear from the commit msg either).

And I guess this is happening during fadump kernel because of our patch
[1], which added a check to see whether hugetlb_disabled is true in
hugepages_supported(). Due to this hugetlb_init() is now not doing the
rest of the initialization for those gigantic pages which were allocated
due to cmdline options from hugepages_setup().

[1]: https://lore.kernel.org/linuxppc-dev/20241202054310.928610-1-sourabhjain@linux.ibm.com/

Now as we know from below that fadump can set hugetlb_disabled call in early_setup().
i.e. fadump can mark hugetlb_disabled to true in 
early_setup() -> early_init_devtree() -> fadump_reserve_mem()

And hugepages_setup() and hugepagesz_setup() gets called late in
start_kernel() -> parse_args() 


And we already check for hugepages_supported() in all necessary calls in
mm/hugetlb.c. So IMO, this check should go in mm/hugetlb.c in
hugepagesz_setup() and hugepages_setup(). Because otherwise every arch
implementation will end up duplicating this by adding
hugepages_supported() check in their arch implementation of
arch_hugetlb_valid_size().

e.g. references of hugepages_supported() checks in mm/hugetlb.c

mm/hugetlb.c hugetlb_show_meminfo_node 4959 if (!hugepages_supported())    
mm/hugetlb.c hugetlb_report_node_meminfo 4943 if (!hugepages_supported())  
mm/hugetlb.c hugetlb_report_meminfo 4914 if (!hugepages_supported())       
mm/hugetlb.c hugetlb_overcommit_handler 4848 if (!hugepages_supported())   
mm/hugetlb.c hugetlb_sysctl_handler_common 4809 if (!hugepages_supported())
mm/hugetlb.c hugetlb_init 4461 if (!hugepages_supported()) {               
mm/hugetlb.c dissolve_free_hugetlb_folios 2211 if (!hugepages_supported()) 
fs/hugetlbfs/inode.c init_hugetlbfs_fs 1604 if (!hugepages_supported()) {  


Let me also see the history on why this wasn't done earlier though... 

... Oh actually there is more history to this. See [2]. We already had
hugepages_supported() check in hugepages_setup() and other places
earlier which was removed to fix some other problem in ppc ;)

[2]: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c2833a5bf75b3657c4dd20b3709c8c702754cb1f


Hence I believe this needs a wider cleanup than just fixing it for our
arch. I see there is a patch series already fixing these code paths,
which is also cleaning up the path of gigantic hugepage allocation in
hugepages_setup(). I think it is in mm-unstable branch too. Can we
please review & test that to make sure that the fadump usecase of
disabling hugepages & gigantic are getting covered properly?

[3]: https://lore.kernel.org/all/20250228182928.2645936-1-fvdl@google.com/


Thoughts?

-ritesh

>
> Thanks,
> Sourabh Jain
>
>
>>
>>
>>> HugeTLB: registered 1.00 GiB page size, pre-allocated 1 pages
>> This print comes from report_hugepages(). The only place from where
>> report_hugepages() gets called is hugetlb_init(). hugetlb_init() is what
>> is responsible for hugepages & gigantic hugepage allocations of the
>> passed kernel cmdline params.
>>
>> But hugetlb_init() already checks for hugepages_supported() in the very
>> beginning. So I am not sure whether we need this extra patch to disable
>> gigantic hugepages allocation by the kernel cmdline params like
>> hugepagesz=1G and hugepages=2 type of options.
>>
>> Hence I was wondering if you had this patch [1] in your tree when you were
>> testing this?
>>
>> But I may be missing something. Could you please help clarify on whether
>> we really need this patch to disable gigantic hugetlb page allocations?
>>
>>> Fadump kernel: gigantic hugepage not allocated
>>> ===============================================
>>>
>>> dmesg | grep -i "hugetlb"
>>> -------------------------
>>> [    0.000000] HugeTLB: unsupported hugepagesz=1G
>>> [    0.000000] HugeTLB: hugepages=1 does not follow a valid hugepagesz, ignoring
>>> [    0.706375] HugeTLB support is disabled!
>>> [    0.773530] hugetlbfs: disabling because there are no supported hugepage sizes
>>>
>>> $ cat /proc/meminfo | grep -i "hugetlb"
>>> ----------------------------------
>>> <Nothing>

What I meant was, when we pass hugepagesz= and hugepages= and fadump=on,
then during the fadump kernel, we still will see the above prints and
nothing in meminfo even w/o this patch (because the user interfaces will
be disabled since hugetlb_supported() is false).
This observation should have been mentioned in the commit msg to avoid
the confusion :)


>>>
>>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> Cc: Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
>> I guess the extra " in the above was not adding me in the cc list.
>> Hence I missed to see this patch early.
>
> Thanks for point it out. I will fix it.
>
>
>>
>> -ritesh
>>
>>
>>> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>> ---
>>> Changelog:
>>>
>>> v1:
>>> https://lore.kernel.org/all/20250121150419.1342794-1-sourabhjain@linux.ibm.com/
>>>
>>> v2:
>>> https://lore.kernel.org/all/20250124103220.111303-1-sourabhjain@linux.ibm.com/
>>>   - disable gigantic hugepage in arch code, arch_hugetlb_valid_size()
>>>
>>> v3:
>>> https://lore.kernel.org/all/20250125104928.88881-1-sourabhjain@linux.ibm.com/
>>>   - Do not modify the initialization of the shift variable
>>>
>>> v4:
>>> - Update commit message to include how hugepages_supported() detects
>>>    hugepages support when fadump is active
>>> - Add Reviewed-by tag
>>> - NO functional change
>>>
>>> ---
>>>   arch/powerpc/mm/hugetlbpage.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
>>> index 6b043180220a..88cfd182db4e 100644
>>> --- a/arch/powerpc/mm/hugetlbpage.c
>>> +++ b/arch/powerpc/mm/hugetlbpage.c
>>> @@ -138,6 +138,9 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
>>>   	int shift = __ffs(size);
>>>   	int mmu_psize;
>>>
>>> +	if (!hugepages_supported())
>>> +		return false;
>>> +
>>>   	/* Check that it is a page size supported by the hardware and
>>>   	 * that it fits within pagetable and slice limits. */
>>>   	if (size <= PAGE_SIZE || !is_power_of_2(size))
>>> --
>>> 2.48.1

