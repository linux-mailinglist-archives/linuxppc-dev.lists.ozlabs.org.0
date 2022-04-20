Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A928508E2E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 19:14:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kk6jP6lQQz3bdJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Apr 2022 03:14:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YPv5e3Jk;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YPv5e3Jk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=YPv5e3Jk; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=YPv5e3Jk; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kk6hf3Yxyz2xBx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Apr 2022 03:13:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650474829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YUXfwOQompnJdIwVAr+ky90k3csgxSJYtFYxvhspJD8=;
 b=YPv5e3Jk2akb+5zxNB9AE/jf3iOjhSq+Pyv2h1zyXEnj4/wP735qK3twkyuJ44yntF4v+z
 /ZtSNiU/UbfUVOxy/76GM178FXBgRzMHZHD4b2LkS94mU5P0yEN0NaulfB0LX6m/Melt6d
 Vy1i0K8A/udkVJ5v3mf4k6haQFYsJGI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650474829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YUXfwOQompnJdIwVAr+ky90k3csgxSJYtFYxvhspJD8=;
 b=YPv5e3Jk2akb+5zxNB9AE/jf3iOjhSq+Pyv2h1zyXEnj4/wP735qK3twkyuJ44yntF4v+z
 /ZtSNiU/UbfUVOxy/76GM178FXBgRzMHZHD4b2LkS94mU5P0yEN0NaulfB0LX6m/Melt6d
 Vy1i0K8A/udkVJ5v3mf4k6haQFYsJGI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-09l_d5-RMzOFqS6IP3QHgQ-1; Wed, 20 Apr 2022 13:13:45 -0400
X-MC-Unique: 09l_d5-RMzOFqS6IP3QHgQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 b10-20020adfc74a000000b0020ab029d5edso576937wrh.18
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Apr 2022 10:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YUXfwOQompnJdIwVAr+ky90k3csgxSJYtFYxvhspJD8=;
 b=kXFfIRWksZSt97phqs5OfBHoQJZGq9QCQ3qr4QrloheuKZrbyYbrpEAYTrceTdylIk
 GRfHY2XYTgu5iVEYENU75Vx+66/axaoI5vmsppDvfEse3y7hhog7UJE3NOIIQHB6bZ3V
 A8+9uMx4QDHXkEpk99uW4IJzabA0wLJP6FD3ot8qawbmAwvqq14pk+NbIg96FBWUiPBM
 r00biSnG8RNJxM6DJLyD19v4HOYjuk4oDkni2MBFddL5bZzuYbOlQvDimAUmZawQuP4q
 +8ZlxYcv0EdRKKLmeo932CaUIM/LlyPxH1EhK98B2MAzNS9oIWS33J783SJl57JGPm23
 8/xA==
X-Gm-Message-State: AOAM530wXbsIN0ImFHLzg1j4RZkYM4Zj/GwRnZIaIONNZyDeml4ZBEEM
 LpSE+xvSYcseagUXMD3Nhn6InvXSLQBb7NuGNmx2MeFm/Cp4/mwd3wrx+wlDIhxJoUHNXwwj6fU
 CexemZzU68a02EnIKdpqjqA986Q==
X-Received: by 2002:a1c:21c5:0:b0:38e:b464:6a39 with SMTP id
 h188-20020a1c21c5000000b0038eb4646a39mr4624178wmh.186.1650474824509; 
 Wed, 20 Apr 2022 10:13:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnxBGE3mnfNhX3DGODQmYyZGAR1i8EPUCCup/XZY5QMpdpdOqavd/9L1y6Dj1QMznlK0qbGA==
X-Received: by 2002:a1c:21c5:0:b0:38e:b464:6a39 with SMTP id
 h188-20020a1c21c5000000b0038eb4646a39mr4624108wmh.186.1650474824060; 
 Wed, 20 Apr 2022 10:13:44 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:3d00:23e4:4c84:67a5:3ccf?
 (p200300cbc7023d0023e44c8467a53ccf.dip0.t-ipconnect.de.
 [2003:cb:c702:3d00:23e4:4c84:67a5:3ccf])
 by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b00205aa05fa03sm313602wrr.58.2022.04.20.10.13.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 10:13:43 -0700 (PDT)
Message-ID: <c7e76985-f209-f110-0785-e2849acdd43c@redhat.com>
Date: Wed, 20 Apr 2022 19:13:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 1/8] mm/swap: remember PG_anon_exclusive via a swp pte
 bit
To: Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org
References: <20220329164329.208407-1-david@redhat.com>
 <20220329164329.208407-2-david@redhat.com>
 <b49f1b4c-defa-ef32-1984-0273e1fad178@suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <b49f1b4c-defa-ef32-1984-0273e1fad178@suse.cz>
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
 Ingo Molnar <mingo@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 David Rientjes <rientjes@google.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Pedro Gomes <pedrodemargomes@gmail.com>, Jann Horn <jannh@google.com>,
 John Hubbard <jhubbard@nvidia.com>, Heiko Carstens <hca@linux.ibm.com>,
 Shakeel Butt <shakeelb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Oded Gabbay <oded.gabbay@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Oleg Nesterov <oleg@redhat.com>,
 Nadav Amit <namit@vmware.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 20.04.22 19:10, Vlastimil Babka wrote:
> On 3/29/22 18:43, David Hildenbrand wrote:
>> Currently, we clear PG_anon_exclusive in try_to_unmap() and forget about
>> it. We do this, to keep fork() logic on swap entries easy and efficient:
>> for example, if we wouldn't clear it when unmapping, we'd have to lookup
>> the page in the swapcache for each and every swap entry during fork() and
>> clear PG_anon_exclusive if set.
>>
>> Instead, we want to store that information directly in the swap pte,
>> protected by the page table lock, similarly to how we handle
>> SWP_MIGRATION_READ_EXCLUSIVE for migration entries. However, for actual
>> swap entries, we don't want to mess with the swap type (e.g., still one
>> bit) because it overcomplicates swap code.
>>
>> In try_to_unmap(), we already reject to unmap in case the page might be
>> pinned, because we must not lose PG_anon_exclusive on pinned pages ever.
>> Checking if there are other unexpected references reliably *before*
>> completely unmapping a page is unfortunately not really possible: THP
>> heavily overcomplicate the situation. Once fully unmapped it's easier --
>> we, for example, make sure that there are no unexpected references
>> *after* unmapping a page before starting writeback on that page.
>>
>> So, we currently might end up unmapping a page and clearing
>> PG_anon_exclusive if that page has additional references, for example,
>> due to a FOLL_GET.
>>
>> do_swap_page() has to re-determine if a page is exclusive, which will
>> easily fail if there are other references on a page, most prominently
>> GUP references via FOLL_GET. This can currently result in memory
>> corruptions when taking a FOLL_GET | FOLL_WRITE reference on a page even
>> when fork() is never involved: try_to_unmap() will succeed, and when
>> refaulting the page, it cannot be marked exclusive and will get replaced
>> by a copy in the page tables on the next write access, resulting in writes
>> via the GUP reference to the page being lost.
>>
>> In an ideal world, everybody that uses GUP and wants to modify page
>> content, such as O_DIRECT, would properly use FOLL_PIN. However, that
>> conversion will take a while. It's easier to fix what used to work in the
>> past (FOLL_GET | FOLL_WRITE) remembering PG_anon_exclusive. In addition,
>> by remembering PG_anon_exclusive we can further reduce unnecessary COW
>> in some cases, so it's the natural thing to do.
>>
>> So let's transfer the PG_anon_exclusive information to the swap pte and
>> store it via an architecture-dependant pte bit; use that information when
>> restoring the swap pte in do_swap_page() and unuse_pte(). During fork(), we
>> simply have to clear the pte bit and are done.
>>
>> Of course, there is one corner case to handle: swap backends that don't
>> support concurrent page modifications while the page is under writeback.
>> Special case these, and drop the exclusive marker. Add a comment why that
>> is just fine (also, reuse_swap_page() would have done the same in the
>> past).
>>
>> In the future, we'll hopefully have all architectures support
>> __HAVE_ARCH_PTE_SWP_EXCLUSIVE, such that we can get rid of the empty
>> stubs and the define completely. Then, we can also convert
>> SWP_MIGRATION_READ_EXCLUSIVE. For architectures it's fairly easy to
>> support: either simply use a yet unused pte bit that can be used for swap
>> entries, steal one from the arch type bits if they exceed 5, or steal one
>> from the offset bits.
>>
>> Note: R/O FOLL_GET references were never really reliable, especially
>> when taking one on a shared page and then writing to the page (e.g., GUP
>> after fork()). FOLL_GET, including R/W references, were never really
>> reliable once fork was involved (e.g., GUP before fork(),
>> GUP during fork()). KSM steps back in case it stumbles over unexpected
>> references and is, therefore, fine.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> With the fixup as reportedy by Miaohe Lin
> 
> Acked-by: Vlastimil Babka <vbabka@suse.cz>
> 
> (sent a separate mm-commits mail to inquire about the fix going missing from
> mmotm)
> 
> https://lore.kernel.org/mm-commits/c3195d8a-2931-0749-973a-1d04e4baec94@suse.cz/T/#m4e98ccae6f747e11f45e4d0726427ba2fef740eb

Yes I saw that, thanks for catching that!


-- 
Thanks,

David / dhildenb

