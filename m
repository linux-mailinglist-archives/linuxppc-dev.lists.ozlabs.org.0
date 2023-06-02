Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D8B71F9AD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 07:36:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXWvB0gdZz3f0h
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 15:36:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=E3a6AaZ3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=E3a6AaZ3;
	dkim-atps=neutral
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXWtJ0Ktmz3drj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 15:35:19 +1000 (AEST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-565d354b59fso17828537b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jun 2023 22:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685684115; x=1688276115;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BlaitmpXRewCMQojclut1KWFgZpzrF4XDGrxy0b7AoI=;
        b=E3a6AaZ3Wcq1lZLp7NnGxoPP+Sqqvy1yK8I8U7Sr9m03K8dydeKVdp3X09jrk0mT5l
         Z4gWsI110+w/R9oqWgJirwZU62nrDu5xK430A1Pp9R8v9LU5xUjKK27fq63Q3dCxL+lK
         EOER3xk6WvrcmWXOqAulAYp17HQSfpWOFuD7ebF2cknb9e8VMLdEW32HSGJvwKQf98ax
         d5K0yw+++hRSZJGGAi/XlfXqyPj54C4Vo4rdV5xGmJz6P6/NDq2CFGmLHSiJzR8ezKb9
         GO3Du3RsU6exq6DpYJrcN85L+5XjKkr2C7r3tznXuV+dxaowhBTIMhoLLvmKkcXrv/cl
         1/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685684115; x=1688276115;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BlaitmpXRewCMQojclut1KWFgZpzrF4XDGrxy0b7AoI=;
        b=KmSFsh0xFluw+VhpX6EeMuAHFX59AeQ8njZubiJ4ZjGeM6/msgYXx/EkYZrIkc3fJO
         uCOrv8Ls79VDb7jJU29WYbLi7BTb9BihP54gyrt6lW3W6KIgIGAfaBMzB3vo/IwV+Ref
         8lzey5zlst9albnJlgbJ5jQvTJiBgiJLBJKWoIeMHM4uib2Ji8Dfd7JC4zW3YA6QUWLp
         EHnuqVYO42PP6JCeKXcjKm53TFn8PPUCKV3vfsV2mHk5euCd7QH32IZzO2pOqLnBbPLI
         lbytVl9Y/5BdFImIDZYR6oHHnNTUMkU6xoQzmLw/FXzitudGO5tYI6ODKnFz9m5VpG8T
         yFmQ==
X-Gm-Message-State: AC+VfDwqFxTE7ED6odrKBNbu9Aj9q/8g9/RrSYye81f3xDAVU/MB1lPm
	/gdArclAGoSh9f4zcOic0s5+dQ==
X-Google-Smtp-Source: ACHHUZ7whn1RpfZ7H7hHcynnXPMYyLfZjTq4u0ndZfcdykRJugtYK04I6kRSON6CXC6C75fb1m2BVA==
X-Received: by 2002:a0d:fdc6:0:b0:561:e944:a559 with SMTP id n189-20020a0dfdc6000000b00561e944a559mr10559756ywf.31.1685684115539;
        Thu, 01 Jun 2023 22:35:15 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id j188-20020a0df9c5000000b0055a07e36659sm122944ywf.145.2023.06.01.22.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 22:35:14 -0700 (PDT)
Date: Thu, 1 Jun 2023 22:35:10 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 02/12] mm/pgtable: add PAE safety to __pte_offset_map()
In-Reply-To: <ZHeg3oRljRn6wlLX@ziepe.ca>
Message-ID: <40349492-6f33-2a19-4a5-eabbe6b48aca@google.com>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com> <923480d5-35ab-7cac-79d0-343d16e29318@google.com> <ZHeg3oRljRn6wlLX@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Anshuman Khandual <anshu
 man.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 31 May 2023, Jason Gunthorpe wrote:
> On Sun, May 28, 2023 at 11:16:16PM -0700, Hugh Dickins wrote:
> > There is a faint risk that __pte_offset_map(), on a 32-bit architecture
> > with a 64-bit pmd_t e.g. x86-32 with CONFIG_X86_PAE=y, would succeed on
> > a pmdval assembled from a pmd_low and a pmd_high which never belonged
> > together: their combination not pointing to a page table at all, perhaps
> > not even a valid pfn.  pmdp_get_lockless() is not enough to prevent that.
> > 
> > Guard against that (on such configs) by local_irq_save() blocking TLB
> > flush between present updates, as linux/pgtable.h suggests.  It's only
> > needed around the pmdp_get_lockless() in __pte_offset_map(): a race when
> > __pte_offset_map_lock() repeats the pmdp_get_lockless() after getting the
> > lock, would just send it back to __pte_offset_map() again.
> 
> What about the other places calling pmdp_get_lockless ? It seems like
> this is quietly making it part of the API that the caller must hold
> the IPIs off.

No, I'm making no judgment of other places where pmdp_get_lockless() is
used: examination might show that some need more care, but I'll just
assume that each is taking as much care as it needs.

But here where I'm making changes, I do see that we need this extra care.

> 
> And Jann had a note that this approach used by the lockless functions
> doesn't work anyhow:
> 
> https://lore.kernel.org/linux-mm/CAG48ez3h-mnp9ZFC10v+-BW_8NQvxbwBsMYJFP8JX31o0B17Pg@mail.gmail.com/

Thanks a lot for the link: I don't know why, but I never saw that mail
thread at all before.  I have not fully digested it yet, to be honest:
MADV_DONTNEED, doesn't flush TLB yet, etc - I'll have to get into the
right frame of mind for that.

> 
> Though we never fixed it, AFAIK..

I'm certainly depending very much on pmdp_get_lockless(): and hoping to
find its case is easier to defend than at the ptep_get_lockless() level.

Thanks,
Hugh
