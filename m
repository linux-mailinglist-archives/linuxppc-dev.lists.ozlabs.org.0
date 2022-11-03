Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B7F617B05
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 11:46:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N30mN5H7Mz3cMb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 21:46:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HdSf3CPI;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HdSf3CPI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HdSf3CPI;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HdSf3CPI;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N30lM1XW2z3bqt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 21:45:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667472312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xeIVOx9sLvuNMPr0vxXdmyPkIr4MFSUz9ymTyQBULJ4=;
	b=HdSf3CPIaOyb6pIHQ9Fwywp42lUX5VFHwuTIY2R2mE/ADJ6UfxKQvMVddsBPU2dP2IFT4f
	2RnDP0dyG9ZuhlvoAXRfpk8Avm+ZTNz6b06YL0CWDdsTsE1oaKoBE44dIdcRIRu2m2yoN5
	j6dp4g/UM6QrXEpMLWjtdCU27GEKWpw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667472312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xeIVOx9sLvuNMPr0vxXdmyPkIr4MFSUz9ymTyQBULJ4=;
	b=HdSf3CPIaOyb6pIHQ9Fwywp42lUX5VFHwuTIY2R2mE/ADJ6UfxKQvMVddsBPU2dP2IFT4f
	2RnDP0dyG9ZuhlvoAXRfpk8Avm+ZTNz6b06YL0CWDdsTsE1oaKoBE44dIdcRIRu2m2yoN5
	j6dp4g/UM6QrXEpMLWjtdCU27GEKWpw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-214-uHK46KVdMDCRx1or6a96fQ-1; Thu, 03 Nov 2022 06:45:10 -0400
X-MC-Unique: uHK46KVdMDCRx1or6a96fQ-1
Received: by mail-wr1-f72.google.com with SMTP id d23-20020adfa417000000b002364a31b7c9so355529wra.15
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Nov 2022 03:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xeIVOx9sLvuNMPr0vxXdmyPkIr4MFSUz9ymTyQBULJ4=;
        b=ND3BECNBhnxzlkFxlxcIDv5ixFTIHVy9ujzsdnle0yqkSluAL3qd6r2bwE/ZV6uZMc
         ub5y/0f+mdtLs+rzHXNBLqcfbVnJWKO4WIr07eD0HsA2JVoJraCcSM4BrumQEabHV8TC
         i5iJMZZtJrUrKSPQlaXLLtXP98EF71WkrD1iA9zFd+YyC9tnzdGa8/Z132LCJ3HLFvre
         Imq4NTBddg2PSmSAKYvctdkZMDeVA6BQSdRDYTa6PnxrDY66PYLa50MsuvalgVD/AeSg
         6/zkbZ72i5+Jbyv8WdBB0Zqd3srx6sGyHWc/ZKd7fxEpWzzXt29ajrr/O4jZ6RyNf6Ys
         H5SQ==
X-Gm-Message-State: ACrzQf2iYlF1W0THKygnGQs08HXJCetPhMZcCz/LxFs6huANDMTCwpAn
	4duENsgyWjrT6rBMn9qPygVpOeMeYls+4G2x+K6Ba1MhBZcKIRqWDiMROOLkqXX+jfqSeS/UN0K
	IOuPTgZFy31nLFSRvSB8bFWGlGw==
X-Received: by 2002:a05:6000:15c8:b0:236:812d:d3e5 with SMTP id y8-20020a05600015c800b00236812dd3e5mr18067962wry.303.1667472309205;
        Thu, 03 Nov 2022 03:45:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5VbCnR40pmKtSUyhc42THXlkmWTKWgcmaV162v3S4FqpWxW9R5nd7ZlQjR0huei6YRk+ADnQ==
X-Received: by 2002:a05:6000:15c8:b0:236:812d:d3e5 with SMTP id y8-20020a05600015c800b00236812dd3e5mr18067931wry.303.1667472308829;
        Thu, 03 Nov 2022 03:45:08 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:a400:e2d7:3ee3:8d35:ac8? (p200300cbc707a400e2d73ee38d350ac8.dip0.t-ipconnect.de. [2003:cb:c707:a400:e2d7:3ee3:8d35:ac8])
        by smtp.gmail.com with ESMTPSA id o38-20020a05600c512600b003cf4eac8e80sm1166998wms.23.2022.11.03.03.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 03:45:08 -0700 (PDT)
Message-ID: <37192084-fc78-2d51-3bcf-1454248dcc74@redhat.com>
Date: Thu, 3 Nov 2022 11:45:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
To: Nadav Amit <namit@vmware.com>
References: <20221102191209.289237-1-david@redhat.com>
 <20221102191209.289237-5-david@redhat.com>
 <F3022E28-3BB5-40F5-B33A-9BDBD69ACC78@vmware.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 4/6] mm/autonuma: use can_change_(pte|pmd)_writable()
 to replace savedwrite
In-Reply-To: <F3022E28-3BB5-40F5-B33A-9BDBD69ACC78@vmware.com>
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Mel Gorman <mgorman@techsingularity.net>, Anshuman Khandual <anshuman.khandual@arm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Dave Chinner <david@fromorbit.com>, kernel list <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>, Linux-MM <linux-mm@kvack.org>, Hugh Dickins <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02.11.22 22:22, Nadav Amit wrote:
> On Nov 2, 2022, at 12:12 PM, David Hildenbrand <david@redhat.com> wrote:
> 
>> !! External Email
>>
>> commit b191f9b106ea ("mm: numa: preserve PTE write permissions across a
>> NUMA hinting fault") added remembering write permissions using ordinary
>> pte_write() for PROT_NONE mapped pages to avoid write faults when
>> remapping the page !PROT_NONE on NUMA hinting faults.
>>
> 
> [ snip ]
> 
> Here’s a very shallow reviewed with some minor points...

Appreciated.

> 
>> ---
>> include/linux/mm.h |  2 ++
>> mm/huge_memory.c   | 28 +++++++++++++++++-----------
>> mm/ksm.c           |  9 ++++-----
>> mm/memory.c        | 19 ++++++++++++++++---
>> mm/mprotect.c      |  7 ++-----
>> 5 files changed, 41 insertions(+), 24 deletions(-)
>>
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 25ff9a14a777..a0deeece5e87 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -1975,6 +1975,8 @@ extern unsigned long move_page_tables(struct vm_area_struct *vma,
>> #define  MM_CP_UFFD_WP_ALL                 (MM_CP_UFFD_WP | \
>>                                             MM_CP_UFFD_WP_RESOLVE)
>>
>> +bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>> +                            pte_t pte);
> 
> It might not be customary, but how about marking it as __pure?

Right, there is no a single use of __pure in the mm domain.

> 
>> extern unsigned long change_protection(struct mmu_gather *tlb,
>>                               struct vm_area_struct *vma, unsigned long start,
>>                               unsigned long end, pgprot_t newprot,
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 2ad68e91896a..45abd27d75a0 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -1462,8 +1462,7 @@ vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf)
>>         unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
>>         int page_nid = NUMA_NO_NODE;
>>         int target_nid, last_cpupid = (-1 & LAST_CPUPID_MASK);
>> -       bool migrated = false;
>> -       bool was_writable = pmd_savedwrite(oldpmd);
>> +       bool try_change_writable, migrated = false;
>>         int flags = 0;
>>
>>         vmf->ptl = pmd_lock(vma->vm_mm, vmf->pmd);
>> @@ -1472,13 +1471,22 @@ vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf)
>>                 goto out;
>>         }
>>
>> +       /* See mprotect_fixup(). */
>> +       if (vma->vm_flags & VM_SHARED)
>> +               try_change_writable = vma_wants_writenotify(vma, vma->vm_page_prot);
>> +       else
>> +               try_change_writable = !!(vma->vm_flags & VM_WRITE);
> 
> Do you find it better to copy the code instead of extracting it to a
> separate function?

Yeah, you're right ;) usually the issue is coming up with a suitable name. Let me try.

vma_wants_manual_writability_change() hmm ...

> 
>> +
>>         pmd = pmd_modify(oldpmd, vma->vm_page_prot);
>>         page = vm_normal_page_pmd(vma, haddr, pmd);
>>         if (!page)
>>                 goto out_map;
>>
>>         /* See similar comment in do_numa_page for explanation */
>> -       if (!was_writable)
>> +       if (try_change_writable && !pmd_write(pmd) &&
>> +            can_change_pmd_writable(vma, vmf->address, pmd))
>> +               pmd = pmd_mkwrite(pmd);
>> +       if (!pmd_write(pmd))
>>                 flags |= TNF_NO_GROUP;
>>
>>         page_nid = page_to_nid(page);
>> @@ -1523,8 +1531,12 @@ vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf)
>>         /* Restore the PMD */
>>         pmd = pmd_modify(oldpmd, vma->vm_page_prot);
>>         pmd = pmd_mkyoung(pmd);
>> -       if (was_writable)
>> +
>> +       /* Similar to mprotect() protection updates, avoid write faults. */
>> +       if (try_change_writable && !pmd_write(pmd) &&
>> +            can_change_pmd_writable(vma, vmf->address, pmd))
> 
> Why do I have a deja-vu? :)
> 
> There must be a way to avoid the redundant code and specifically the call to
> can_change_pmd_writable(), no?

The issue is that as soon as we drop the page table lock, that information is stale.
Especially, after we fail migration.

So the following should work, however, if we fail migration we wouldn't map the
page writable and would have to re-calculate:

diff --git a/mm/memory.c b/mm/memory.c
index c5599a9279b1..a997625641e4 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4674,10 +4674,10 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
         struct vm_area_struct *vma = vmf->vma;
         struct page *page = NULL;
         int page_nid = NUMA_NO_NODE;
+       bool writable = false;
         int last_cpupid;
         int target_nid;
         pte_t pte, old_pte;
-       bool was_writable = pte_savedwrite(vmf->orig_pte);
         int flags = 0;
  
         /*
@@ -4696,6 +4696,17 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
         old_pte = ptep_get(vmf->pte);
         pte = pte_modify(old_pte, vma->vm_page_prot);
  
+       /*
+        * Detect now whether the PTE is or can be writable. Note that this
+        * information is valid as long as we're holding the PT lock, so also on
+        * the remap path below.
+        */
+       writable = pte_write(pte);
+       if (!writable && vma_wants_manual_writability_change(vma) &&
+           can_change_pte_writable(vma, vmf->address, pte);
+           writable = true;
+       }
+
         page = vm_normal_page(vma, vmf->address, pte);
         if (!page || is_zone_device_page(page))
                 goto out_map;
@@ -4712,7 +4723,7 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
          * pte_dirty has unpredictable behaviour between PTE scan updates,
          * background writeback, dirty balancing and application behaviour.
          */
-       if (!was_writable)
+       if (!writable)
                 flags |= TNF_NO_GROUP;
  
         /*
@@ -4738,6 +4749,7 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
                 put_page(page);
                 goto out_map;
         }
+       writable = false;
         pte_unmap_unlock(vmf->pte, vmf->ptl);
  
         /* Migrate to the requested node */
@@ -4767,7 +4779,7 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
         old_pte = ptep_modify_prot_start(vma, vmf->address, vmf->pte);
         pte = pte_modify(old_pte, vma->vm_page_prot);
         pte = pte_mkyoung(pte);
-       if (was_writable)
+       if (writable)
                 pte = pte_mkwrite(pte);
         ptep_modify_prot_commit(vma, vmf->address, vmf->pte, old_pte, pte);
         update_mmu_cache(vma, vmf->address, vmf->pte);


To me, the less error-prone approach is to re-calculate.


[...]
>> --- a/mm/ksm.c
>> +++ b/mm/ksm.c
>> @@ -1069,7 +1069,6 @@ static int write_protect_page(struct vm_area_struct *vma, struct page *page,
>>
>>         anon_exclusive = PageAnonExclusive(page);
>>         if (pte_write(*pvmw.pte) || pte_dirty(*pvmw.pte) ||
>> -           (pte_protnone(*pvmw.pte) && pte_savedwrite(*pvmw.pte)) ||
> 
> Not related to your code, but it does not make me comfortable that PTE’s
> status bits (which are volatile) are not accessed in this manner.
> 
> Especially since the PTE is later saved into orig_pte. It would feel safer
> to do READ_ONCE(*pvmw.pte) and work on it (probably in a separate patch).

I assume you are talking about the dirty bit. I don't immediately see how something
could go wrong here, but I agree that it might look cleaner that way.

Anyhow, independent of this series, so I'll leave that alone for now but add a
note for the future.

-- 
Thanks,

David / dhildenb

