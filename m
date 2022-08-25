Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0907B5A1453
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 16:41:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MD5Hp116zz3bmL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 00:41:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YYnh7VN+;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YYnh7VN+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YYnh7VN+;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YYnh7VN+;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MD5H64lp7z2xKf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Aug 2022 00:40:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661438427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9gl8JtwHu2ieQqvlFlp3IZDIk+riOkODkt1dgMqEPWw=;
	b=YYnh7VN+NUhs83NDJ9kojKNUJNRwYCu3LOgqHIX8IGl6uhwQhwQETmdcMK//+fizqcBUxS
	tRQ77MjKvkCPaCdBvqI/8nKxefKmJTv6YA9s6Ba0dupVh+CXJNe9osxPOj7nWmEmC+JVUN
	lr4NnaF8c+RRatRnieviFDYMwxJXUHU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661438427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9gl8JtwHu2ieQqvlFlp3IZDIk+riOkODkt1dgMqEPWw=;
	b=YYnh7VN+NUhs83NDJ9kojKNUJNRwYCu3LOgqHIX8IGl6uhwQhwQETmdcMK//+fizqcBUxS
	tRQ77MjKvkCPaCdBvqI/8nKxefKmJTv6YA9s6Ba0dupVh+CXJNe9osxPOj7nWmEmC+JVUN
	lr4NnaF8c+RRatRnieviFDYMwxJXUHU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-0a2ki-4nPCq7QyDF9rE8hA-1; Thu, 25 Aug 2022 10:40:25 -0400
X-MC-Unique: 0a2ki-4nPCq7QyDF9rE8hA-1
Received: by mail-qv1-f72.google.com with SMTP id gh7-20020a05621429c700b00496b1a465b1so11726072qvb.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 07:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=9gl8JtwHu2ieQqvlFlp3IZDIk+riOkODkt1dgMqEPWw=;
        b=eq5e/HxbTog4ad0JsDzVXtECPX4JrYR4wRi6wa7u9ZwCSPm1DDFgCloJNmw+wQn80+
         NcWXLwWT/J3VhOORjoRWUijN8mSZthV08G4OVgJ2XsQX9waAOGx668FvGdGjg/aErvkG
         Uk1MWlKq8i1wc1cpjyY8VYOU03qjH5F9t/T5UMgWBwHm6SAJ384bd8rwg7VLoI+p2hST
         bsoAMRxJ0MLvP8fHyMf9P0htKpm+roa3a90el+kLKvNz5vaOPBuA+9CIhezSrsLqI3j/
         Heivap2wqZPxnVCftLJ7Y7h7yFjr3LGAQ5r4IENbLb0yl18DAw6jMqhENkNPTZnraDIP
         Zp/Q==
X-Gm-Message-State: ACgBeo1w8Dk23Ld6WXVrVfiQ5c0/Pj8neKZbZTHt1X3tiiz92Nb1hWGi
	PS0UF4/KM8JQPGQ8ztSsbekaRlGkd6wP5/6gJvJPiBOjNsia9KDL3CovbHXQ+swfy0I1mOp54ZH
	JYOJgN0FO0cgaRRzrc5jPGbcuwA==
X-Received: by 2002:a05:622a:170d:b0:344:646b:73e with SMTP id h13-20020a05622a170d00b00344646b073emr3753331qtk.138.1661438425286;
        Thu, 25 Aug 2022 07:40:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7TKKJVMyGiS6bNr+tzF2JYvmP3XOGV8sOgN2jBYX27NWJFP8fCLQ0t520JEVxHIVaRHT/sEQ==
X-Received: by 2002:a05:622a:170d:b0:344:646b:73e with SMTP id h13-20020a05622a170d00b00344646b073emr3753302qtk.138.1661438425022;
        Thu, 25 Aug 2022 07:40:25 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
        by smtp.gmail.com with ESMTPSA id j20-20020a05620a411400b006b9a24dc9d7sm17831800qko.7.2022.08.25.07.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 07:40:24 -0700 (PDT)
Date: Thu, 25 Aug 2022 10:40:21 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v2 1/2] mm/migrate_device.c: Copy pte dirty bit to page
Message-ID: <YweJ1QSChgNQnFyY@xz-m1.local>
References: <87tu6bbaq7.fsf@yhuang6-desk2.ccr.corp.intel.com>
 <1D2FB37E-831B-445E-ADDC-C1D3FF0425C1@gmail.com>
 <Yv1BJKb5he3dOHdC@xz-m1.local>
 <87czcyawl6.fsf@yhuang6-desk2.ccr.corp.intel.com>
 <Yv5QXkS4Bm9pTBeG@xz-m1.local>
 <874jy9aqts.fsf@yhuang6-desk2.ccr.corp.intel.com>
 <87czcqiecd.fsf@nvdebian.thelocal>
 <YwaJSBnp2eyMlkjw@xz-m1.local>
 <YwaOpj54/qUb5fXa@xz-m1.local>
 <87o7w9f7dp.fsf@nvdebian.thelocal>
MIME-Version: 1.0
In-Reply-To: <87o7w9f7dp.fsf@nvdebian.thelocal>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, John Hubbard <jhubbard@nvidia.com>, David Hildenbrand <david@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, Linux MM <linux-mm@kvack.org>, Logan Gunthorpe <logang@deltatee.com>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, "Huang, Ying" <ying.huang@intel.com>, stable@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, huang ying <huang.ying.caritas@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 25, 2022 at 10:42:41AM +1000, Alistair Popple wrote:
> 
> Peter Xu <peterx@redhat.com> writes:
> 
> > On Wed, Aug 24, 2022 at 04:25:44PM -0400, Peter Xu wrote:
> >> On Wed, Aug 24, 2022 at 11:56:25AM +1000, Alistair Popple wrote:
> >> > >> Still I don't know whether there'll be any side effect of having stall tlbs
> >> > >> in !present ptes because I'm not familiar enough with the private dev swap
> >> > >> migration code.  But I think having them will be safe, even if redundant.
> >> >
> >> > What side-effect were you thinking of? I don't see any issue with not
> >> > TLB flushing stale device-private TLBs prior to the migration because
> >> > they're not accessible anyway and shouldn't be in any TLB.
> >>
> >> Sorry to be misleading, I never meant we must add them.  As I said it's
> >> just that I don't know the code well so I don't know whether it's safe to
> >> not have it.
> >>
> >> IIUC it's about whether having stall system-ram stall tlb in other
> >> processor would matter or not here.  E.g. some none pte that this code
> >> collected (boosted both "cpages" and "npages" for a none pte) could have
> >> stall tlb in other cores that makes the page writable there.
> >
> > For this one, let me give a more detailed example.
> 
> Thanks, I would have been completely lost about what you were talking
> about without this :-)
> 
> > It's about whether below could happen:
> >
> >        thread 1                thread 2                 thread 3
> >        --------                --------                 --------
> >                           write to page P (data=P1)
> >                             (cached TLB writable)
> >   zap_pte_range()
> >     pgtable lock
> >     clear pte for page P
> >     pgtable unlock
> >     ...
> >                                                      migrate_vma_collect
> >                                                        pte none, npages++, cpages++
> >                                                        allocate device page
> >                                                        copy data (with P1)
> >                                                        map pte as device swap
> >                           write to page P again
> >                           (data updated from P1->P2)
> >   flush tlb
> >
> > Then at last from processor side P should have data P2 but actually from
> > device memory it's P1. Data corrupt.
> 
> In the above scenario migrate_vma_collect_pmd() will observe pte_none.
> This will mark the src_pfn[] array as needing a new zero page which will
> be installed by migrate_vma_pages()->migrate_vma_insert_page().
> 
> So there is no data to be copied hence there can't be any data
> corruption. Remember these are private anonymous pages, so any
> zap_pte_range() indicates the data is no longer needed (eg.
> MADV_DONTNEED).

My bad to have provided an example but invalid. :)

So if the trylock in the function is the only way to migrate this page,
then I agree stall tlb is fine.

> 
> >>
> >> When I said I'm not familiar with the code, it's majorly about one thing I
> >> never figured out myself, in that migrate_vma_collect_pmd() has this
> >> optimization to trylock on the page, collect if it succeeded:
> >>
> >>   /*
> >>    * Optimize for the common case where page is only mapped once
> >>    * in one process. If we can lock the page, then we can safely
> >>    * set up a special migration page table entry now.
> >>    */
> >>    if (trylock_page(page)) {
> >>           ...
> >>    } else {
> >>           put_page(page);
> >>           mpfn = 0;
> >>    }
> >>
> >> But it's kind of against a pure "optimization" in that if trylock failed,
> >> we'll clear the mpfn so the src[i] will be zero at last.  Then will we
> >> directly give up on this page, or will we try to lock_page() again
> >> somewhere?
> 
> That comment is out dated. We used to try locking the page again but
> that was removed by ab09243aa95a ("mm/migrate.c: remove
> MIGRATE_PFN_LOCKED"). See
> https://lkml.kernel.org/r/20211025041608.289017-1-apopple@nvidia.com
> 
> Will post a clean-up for it.

That'll help, thanks.

-- 
Peter Xu

