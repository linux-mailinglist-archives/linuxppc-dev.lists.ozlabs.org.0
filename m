Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A1A5ACF27
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 11:47:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLkG51rPkz3bgh
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 19:47:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NMDeFA1g;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NMDeFA1g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NMDeFA1g;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NMDeFA1g;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLkDW4mdrz2xHK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 19:46:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662371174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Q/0WbMfiU5pCGwYiNx91CEKF86M0nGqDiqFxeXREM8=;
	b=NMDeFA1gG8XFzvA7mPce0nh+xNc7jiR+aKr1GnFLO4RDZ0qfnSxqdgXhYD/1O6WDfnVe61
	Jxxxkq4DBLooqa4+8rXz+koJhwvkLHGJOHE4cSPqvWm6Q1kpJKSrdo/Sl0+9Q7UGjCpD2k
	8xWrs08jw8JZxQjypHH1Kx3BDRwb4IY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662371174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Q/0WbMfiU5pCGwYiNx91CEKF86M0nGqDiqFxeXREM8=;
	b=NMDeFA1gG8XFzvA7mPce0nh+xNc7jiR+aKr1GnFLO4RDZ0qfnSxqdgXhYD/1O6WDfnVe61
	Jxxxkq4DBLooqa4+8rXz+koJhwvkLHGJOHE4cSPqvWm6Q1kpJKSrdo/Sl0+9Q7UGjCpD2k
	8xWrs08jw8JZxQjypHH1Kx3BDRwb4IY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-533-Z94BgR21PIioG5E7vDj6DQ-1; Mon, 05 Sep 2022 05:46:13 -0400
X-MC-Unique: Z94BgR21PIioG5E7vDj6DQ-1
Received: by mail-wm1-f72.google.com with SMTP id v67-20020a1cac46000000b003a615c4893dso5153787wme.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Sep 2022 02:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=1Q/0WbMfiU5pCGwYiNx91CEKF86M0nGqDiqFxeXREM8=;
        b=uTOTTTYztEcaa0giC9cvhH91jEwPh6j8/vb/SQKoqIK1gBkMocPA9/HnMVIHrGvkdK
         MELE3Fnc6BSK1VrpHWjFH/KC+9jW3DfmoWjBBQwrJb1TGWBNhiwsNhYIzV3s8cJ46hNr
         gjAKi8OzrazY248Sm8B3NSNjPcUvSikKEJovrc8dDVRJ2w6d0ZO2xXVYwhjx5MFcOil2
         hI8Y3bpy7y1nfGerrGCFaU9sLztU6AiVtC9E+DAlSV8XrbnJTwN/5zqJ1pu5YXJJ0lFX
         0tZ1Shg3WMbYh+8lTAGKgNqT6vphkYO7mGYZy+bVILpBl9+GOL4I3NNrYNkn9UMthJpN
         Jmmw==
X-Gm-Message-State: ACgBeo13s6Nt0CdIHzR/bzRUwxFG7Y3fXqncO4z7/jEVi28ZGW/1TKJ3
	mX6KTnXYzYMXBoJfZja4HfAnRIvAOnNGLH1qIkHI16Fk2054rpVfCukovdVhDIy/8HKSdMOxU+D
	6uidmOyKDZu9L4ltDXJqcg0TX8w==
X-Received: by 2002:a1c:7708:0:b0:3a5:5543:cec4 with SMTP id t8-20020a1c7708000000b003a55543cec4mr10424024wmi.47.1662371171875;
        Mon, 05 Sep 2022 02:46:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4Wwy0zqSyrxArr5R3ToadS4HGGIDzAwUIVN/JrVOdKZSTGbW21NA2h//jzBvvIZj5PunHYoA==
X-Received: by 2002:a1c:7708:0:b0:3a5:5543:cec4 with SMTP id t8-20020a1c7708000000b003a55543cec4mr10424006wmi.47.1662371171554;
        Mon, 05 Sep 2022 02:46:11 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0d:ba00:c951:31d7:b2b0:8ba0? (p200300d82f0dba00c95131d7b2b08ba0.dip0.t-ipconnect.de. [2003:d8:2f0d:ba00:c951:31d7:b2b0:8ba0])
        by smtp.gmail.com with ESMTPSA id bz9-20020a056000090900b0022584c82c80sm8630307wrb.19.2022.09.05.02.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 02:46:11 -0700 (PDT)
Message-ID: <e54a4004-3de9-7ddf-9368-e98e0dc45425@redhat.com>
Date: Mon, 5 Sep 2022 11:46:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Mike Kravetz <mike.kravetz@oracle.com>
References: <20220829234053.159158-1-mike.kravetz@oracle.com>
 <608934d4-466d-975e-6458-34a91ccb4669@redhat.com> <Yw5AOZ/Kc5f3UP+s@monkey>
 <Yw6Bpsow+gUMlHCU@monkey> <739dc825-ece3-a59f-adc5-65861676e0ae@redhat.com>
 <YxJQfGSsbXd3W4m/@monkey> <323fdb0f-c5a5-e0e5-1ff4-ab971bc295cc@redhat.com>
 <c6f3d408-e050-c1dc-9864-c1b2c92369ed@csgroup.eu>
 <5f6a7c6b-5073-f050-8dae-6ee279a8bb0b@redhat.com>
 <ac9ef726-c465-ccec-363e-9cfb60c170e7@csgroup.eu>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] hugetlb: simplify hugetlb handling in follow_page_mask
In-Reply-To: <ac9ef726-c465-ccec-363e-9cfb60c170e7@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Muchun Song <songmuchun@bytedance.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, Naoya Horiguchi <naoya.horiguchi@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05.09.22 11:33, Christophe Leroy wrote:
> 
> 
> Le 05/09/2022 à 10:37, David Hildenbrand a écrit :
>> On 03.09.22 09:07, Christophe Leroy wrote:
>>> +Resending with valid powerpc list address
>>>
>>> Le 02/09/2022 à 20:52, David Hildenbrand a écrit :
>>>>>>> Adding Christophe on Cc:
>>>>>>>
>>>>>>> Christophe do you know if is_hugepd is true for all hugetlb
>>>>>>> entries, not
>>>>>>> just hugepd?
>>>
>>> is_hugepd() is true if and only if the directory entry points to a huge
>>> page directory and not to the normal lower level directory.
>>>
>>> As far as I understand if the directory entry is not pointing to any
>>> lower directory but is a huge page entry, pXd_leaf() is true.
>>>
>>>
>>>>>>>
>>>>>>> On systems without hugepd entries, I guess ptdump skips all
>>>>>>> hugetlb entries.
>>>>>>> Sigh!
>>>
>>> As far as I can see, ptdump_pXd_entry() handles the pXd_leaf() case.
>>>
>>>>>>
>>>>>> IIUC, the idea of ptdump_walk_pgd() is to dump page tables even
>>>>>> outside
>>>>>> VMAs (for debugging purposes?).
>>>>>>
>>>>>> I cannot convince myself that that's a good idea when only holding the
>>>>>> mmap lock in read mode, because we can just see page tables getting
>>>>>> freed concurrently e.g., during concurrent munmap() ... while holding
>>>>>> the mmap lock in read we may only walk inside VMA boundaries.
>>>>>>
>>>>>> That then raises the questions if we're only calling this on
>>>>>> special MMs
>>>>>> (e.g., init_mm) whereby we cannot really see concurrent munmap() and
>>>>>> where we shouldn't have hugetlb mappings or hugepd entries.
>>>
>>> At least on powerpc, PTDUMP handles only init_mm.
>>>
>>> Hugepage are used at least on powerpc 8xx for linear memory mapping, see
>>>
>>> commit 34536d780683 ("powerpc/8xx: Add a function to early map kernel
>>> via huge pages")
>>> commit cf209951fa7f ("powerpc/8xx: Map linear memory with huge pages")
>>>
>>> hugepds may also be used in the future to use huge pages for vmap and
>>> vmalloc, see commit a6a8f7c4aa7e ("powerpc/8xx: add support for huge
>>> pages on VMAP and VMALLOC")
>>>
>>> As far as I know, ppc64 also use huge pages for VMAP and VMALLOC, see
>>>
>>> commit d909f9109c30 ("powerpc/64s/radix: Enable HAVE_ARCH_HUGE_VMAP")
>>> commit 8abddd968a30 ("powerpc/64s/radix: Enable huge vmalloc mappings")
>>
>> There is a difference between an ordinary huge mapping (e.g., as used
>> for THP) and a a hugetlb mapping.
>>
>> Our current understanding is that hugepd only applies to hugetlb.
>> Wouldn't vmap/vmalloc user ordinary huge pmd entries instead of hugepd?
>>
> 
> 'hugepd' stands for huge page directory. It is independant of whether a
> huge page is used for hugetlb or for anything else, it represents the
> way pages are described in the page tables.

This patch here makes the assumption that hugepd only applies to 
hugetlb, because it removes any such handling from the !hugetlb path in 
GUP. Is that incorrect or are there valid cases where that could happen? 
(init_mm is special in that regard, i don't think it interacts with GUP 
at all).

> 
> I don't know what you mean by _ordinary_ huge pmd entry.
> 

Essentially, what we use for THP. Let me try to understand how hugepd 
interact with the rest of the system.

Do systems that support hugepd currently implement THP? Reading above 
32bit systems below, I assume not?

> Let's take the exemple of powerpc 8xx which is the one I know best. This
> is a powerpc32, so it has two levels : PGD and PTE. PGD has 1024 entries
> and each entry covers a 4Mbytes area. Normal PTE has 1024 entries and
> each entry is a 4k page. When you use 8Mbytes pages, you don't use PTEs
> as it would be a waste of memory. You use a huge page directory that has
> a single entry, and you have two PGD entries pointing to the huge page
> directory.

Thanks, I assume there are no 8MB THP, correct?

The 8MB example with 4MB PGD entries makes it sound a bit like the 
cont-PTE/cont-PMD handling on aarch64: they don't use a hugepd but 
would simply let two consecutive PGD entries point at the the relevant 
(sub) parts of the hugetlb page. No hugepd involved.

> 
> Some time ago, hupgepd was also used for 512kbytes pages and 16kbytes
> pages:
> - there was huge page directories with 8x 512kbytes pages,
> - there was huge page directories with 256x 16kbytes pages,
> 
> And the PGD/PMD entry points to a huge page directory (HUGEPD) instead
> of pointing to a page table directory (PTE).

Thanks for the example.

> 
> Since commit b250c8c08c79 ("powerpc/8xx: Manage 512k huge pages as
> standard pages."), the 8xx doesn't use anymore hugepd for 512k huge
> page, but other platforms like powerpc book3e extensively use huge page
> directories.
> 
> I hope this clarifies the subject, otherwise I'm happy to provide
> further details.

Thanks, it would be valuable to know if the assumption in this patch is 
correct: hugepd will only be found in hugetlb areas in ordinary MMs (not 
init_mm).

-- 
Thanks,

David / dhildenb

