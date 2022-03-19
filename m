Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ABD4DE793
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 12:18:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KLJJx69slz3bZ7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 22:18:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EqQK3mjv;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EqQK3mjv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=EqQK3mjv; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=EqQK3mjv; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KLJJ94qkzz3089
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Mar 2022 22:17:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647688642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h01om2OJNg7UN6xR5wRvwatJof/v6Qj0aJDQ8nw06cE=;
 b=EqQK3mjvMALifaDE4O5hPUmLxr5k7qOqzDeogrbUnf6ytlzB+PGAU9eyybDXrayzFZx4Fm
 O8hQbl8mtQhw4j/Mcmv5pGVYcARJtyrN/4DfDxKIRWVyU0Hynk9IZC1xkl+JyMgMefny/s
 AMPLgzBBAhMD0d0sy+6Dc46SpbeZSFY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647688642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h01om2OJNg7UN6xR5wRvwatJof/v6Qj0aJDQ8nw06cE=;
 b=EqQK3mjvMALifaDE4O5hPUmLxr5k7qOqzDeogrbUnf6ytlzB+PGAU9eyybDXrayzFZx4Fm
 O8hQbl8mtQhw4j/Mcmv5pGVYcARJtyrN/4DfDxKIRWVyU0Hynk9IZC1xkl+JyMgMefny/s
 AMPLgzBBAhMD0d0sy+6Dc46SpbeZSFY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-KoMR8PpFNAGD5kh6Ka6XXw-1; Sat, 19 Mar 2022 07:17:20 -0400
X-MC-Unique: KoMR8PpFNAGD5kh6Ka6XXw-1
Received: by mail-wm1-f72.google.com with SMTP id
 m34-20020a05600c3b2200b0038115c73361so4040466wms.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Mar 2022 04:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=h01om2OJNg7UN6xR5wRvwatJof/v6Qj0aJDQ8nw06cE=;
 b=HHNC58dvw8H+Luh9KO0B+mf/EOZO546OPrmjl02K051AZCzI1WpWeDa32Uh2GKdGO8
 jF5K9cTnaya8FPE2cE+o3YaYUu1ZJWs0k7AnrkmPX2i5jQUSzndZGGRx+vZY8DVgAFBR
 grhXauKmxfEm1xwKBr0mDAXAweXcTveL42+EEMIrSkC8vcDP17W4ZsS4bUfmnONIllOu
 yWUaq7bvseKf9FpleTsWyDj3i0IEvJMn9wKwkZpbyYEyH1Ct+1ENayedExI6BRZ1TlX3
 sfuAzmt9oms3p/3+mtk0aKf8knJJcqQNOR9/hgrDytRVLopt73iuejCb34q01IctHUO0
 MmQw==
X-Gm-Message-State: AOAM533uClYLokdEWxLVe7sGG3gMuVKebypE/pwawQe9a5CYWh7w/DWs
 2nzV29xZJ4OVHaXLVQCBV6fp44p/TJ/LK37/ZP6/ly1n3b9lA66Gbq9puSAV8+nNXgtXgZuWckh
 BRhp0kg1sbVuv8eJzgzfEBauNGw==
X-Received: by 2002:a05:600c:3785:b0:38c:9b55:a477 with SMTP id
 o5-20020a05600c378500b0038c9b55a477mr214114wmr.164.1647688639518; 
 Sat, 19 Mar 2022 04:17:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXQYHzmUknpl8dPLzijazZTS08+rGUI4YNRhcnL/au2TdAywuFEvKBekLN0RmMcXEBv9O0Qg==
X-Received: by 2002:a05:600c:3785:b0:38c:9b55:a477 with SMTP id
 o5-20020a05600c378500b0038c9b55a477mr214049wmr.164.1647688639186; 
 Sat, 19 Mar 2022 04:17:19 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f24:9200:124e:f0bf:6f8c:cbd8?
 (p200300d82f249200124ef0bf6f8ccbd8.dip0.t-ipconnect.de.
 [2003:d8:2f24:9200:124e:f0bf:6f8c:cbd8])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c4f8f00b003842f011bc5sm12433837wmq.2.2022.03.19.04.17.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Mar 2022 04:17:18 -0700 (PDT)
Message-ID: <74fdfa8c-abaa-ea48-4b82-6f0023548ead@redhat.com>
Date: Sat, 19 Mar 2022 12:17:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20220315141837.137118-1-david@redhat.com>
 <20220318234850.GD11336@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 0/7] mm: COW fixes part 3: reliable GUP R/W FOLL_GET of
 anonymous pages
In-Reply-To: <20220318234850.GD11336@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: x86@kernel.org, Jan Kara <jack@suse.cz>,
 Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Donald Dutile <ddutile@redhat.com>, Liang Zhang <zhangliang5@huawei.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Paul Mackerras <paulus@samba.org>, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 David Rientjes <rientjes@google.com>, Pedro Gomes <pedrodemargomes@gmail.com>,
 Jann Horn <jannh@google.com>, John Hubbard <jhubbard@nvidia.com>,
 Heiko Carstens <hca@linux.ibm.com>, Shakeel Butt <shakeelb@google.com>,
 Oleg Nesterov <oleg@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Oded Gabbay <oded.gabbay@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Nadav Amit <namit@vmware.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 19.03.22 00:48, Jason Gunthorpe wrote:
> On Tue, Mar 15, 2022 at 03:18:30PM +0100, David Hildenbrand wrote:
>> This is just the natural follow-up of part 2, that will also further
>> reduce "wrong COW" on the swapin path, for example, when we cannot remove
>> a page from the swapcache due to concurrent writeback, or if we have two
>> threads faulting on the same swapped-out page. Fixing O_DIRECT is just a
>> nice side-product :)

Hi Jason,

thanks or the review!

> 
> I know I would benefit alot from a description of the swap specific
> issue a bit more. Most of this message talks about clear_refs which I
> do understand a bit better.

Patch #1 contains some additional information. In general, it's the same
issue as with any other mechanism that could get the page mapped R/O
while there is a FOLL_GET | FOLL_WRITE reference to it --  for example,
DMA to that page as happens with our O_DIRECT reproducer.

Part 2 essentially fixed the other cases (i.e., clear_refs), but the
remaining swapout+refault from swapcache case is handled in this series.

> 
> Is this talking about what happens after a page gets swapped back in?
> eg the exclusive bit is missing when the page is recreated?

Right, try_to_unmap() was the last remaining case where we'd have lost
the exclusivity information -- it wasn't required for reliable GUP pins
in part 2.

Here is what happens without PG_anon_exclusive:

1. The application uses parts of an anonymous base page for direct I/O,
let's assume the first 512 bytes of page.

fd = open(filename, O_DIRECT| ...);
pread(fd, page, 512, 0);

O_DIRECT will take a FOLL_GET|FOLL_WRITE reference on the page

2. Reclaim kicks in and wants to swapout the page -- mm/vmscan.c

shrink_page_list() first adds the page to the swapcache and then unmaps
it via try_to_unmap().

After the page was successfully unmapped, pageout() will start
triggering writeback but will realize that there are additional
references on the page (via is_page_cache_freeable()) and fail.

3. The application uses unrelated parts of the page for other purposes
while the DMA is not completed, e.g., doing a a simple

page[4095]++;

The read access will fault in the page readable from the swap cache in
do_swap_page(). The write access will trigger our COW fault handler. As
we have an additional reference on the page, we will create a copy and
map it into out page table. At this point, the page table and the GUP
reference are out of sync.

4. O_DIRECT completes

The read targets the page that is no longer referenced in the page
tables. For the application, it looks like the read() never happened, as
we lost our DMA read to our page.


With PG_anon_exclusive from series part 2, we don't remember exclusivity
information in try_to_unmap() yet. do_swap_page() cannot restore it as
it has to assume the page is possibly shared.

With this series, we remember exclusivity information in try_to_unmap()
in the SWP PTE. do_swap_page() can restore it. Consequently, our COW
fault handler won't create a wrong copy and we won't go out of sync
between GUP and the page mapped into the page table.


Hope that helps!

-- 
Thanks,

David / dhildenb

