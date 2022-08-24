Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C28425A02FC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 22:49:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCdW46hQgz3c6Y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 06:49:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HPYIAoJG;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aj/+ET2U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HPYIAoJG;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aj/+ET2U;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCdVQ3qMtz30DP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 06:48:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661374122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/rRnDONf/MIAcvQvaU+OL/iys5bxrMY05ODAN/aEOnI=;
	b=HPYIAoJGxCR8SJiLHN+D12ln0WtkHk2/hqXQXQwyoQn+CQG4Um95IvEYbAgy3EJ4CiQRiB
	tzpiN3vbbJDmIGMvH91K2dcd/Oq96QtM2aIgRiuiAXHiMjUUkeoLLAK0nztEv2UfpBvyZ3
	c4TcqEmPF1f2pu8xFiLKGpf9oH4O+Uk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661374123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/rRnDONf/MIAcvQvaU+OL/iys5bxrMY05ODAN/aEOnI=;
	b=aj/+ET2UnjpBLdj4Z8sxjtg36aqNF85XMtJ6JREFtjObE2EctYcMtdHYVXrsKzTP2orppa
	pHIwK90PoLNe+1XTWX6XU5UcREmVmLv7BiZRQyXom6GqT1DO7NxRJDFvvHR7iAKArigtU8
	MS5VMR6NRj21Dqp1Mt2986CqLAdUbPs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-52-MJ2dkjI6MlScFHV-JUD5BQ-1; Wed, 24 Aug 2022 16:48:41 -0400
X-MC-Unique: MJ2dkjI6MlScFHV-JUD5BQ-1
Received: by mail-qv1-f70.google.com with SMTP id lx4-20020a0562145f0400b00496ecf45ac4so5858133qvb.7
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 13:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=/rRnDONf/MIAcvQvaU+OL/iys5bxrMY05ODAN/aEOnI=;
        b=4gPJj9f+GR/AkTEX3a8orVrE9n9iUnoWeo4oeViFV2qIVxN272rxGrNcAH3tETSTT+
         9mMglFoTZ4jLm8tU/RMYMNzgzkIk5Z0mpK3hD/P1s+8K/H6oZ6jGfSKMSGnr/Dl/4aRu
         N+eK7M//F2Qz2yGirJaoH8HzThkTHfdlVq4APn6+tyb3SDWUA8FIKYdf/P2mGAW/yWP9
         TAA93gHr9XS8oyQKOKAdYwdZpkdMFqEkSR1LBw1nRLdbOEl2+nqNmPR5kdBe9gHUeQxt
         OE3QAkqyeIax2dqzvmOCGil5LmOTWdtK7vB39tOhN9kB+nTBHQ/HAMHN6ED7/Ovo6z1e
         1btw==
X-Gm-Message-State: ACgBeo2NrPH9v7PsG+JvCp5FizNKmmWVT3rDVyq49xsqAfDlWEcVByt/
	uh5TzUr3fnS3Z6hkLOi7jW2LkCaIKWj3T4LZSbTd4ORqBLlhEMO8H0I1YTKc6ANZbR4/2grzo+o
	ppqaMd+OsyYCxkomveuU6tRyDjw==
X-Received: by 2002:ad4:4eaf:0:b0:496:ac46:2d9c with SMTP id ed15-20020ad44eaf000000b00496ac462d9cmr868935qvb.82.1661374121421;
        Wed, 24 Aug 2022 13:48:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4s25beJjrLygCxW4UWpRepdZLtdhOdc0j/yJivVpKekwHMGeWPIw0hJ6uQX5trRhdvaC3qCw==
X-Received: by 2002:ad4:4eaf:0:b0:496:ac46:2d9c with SMTP id ed15-20020ad44eaf000000b00496ac462d9cmr868905qvb.82.1661374121119;
        Wed, 24 Aug 2022 13:48:41 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
        by smtp.gmail.com with ESMTPSA id g9-20020ac85809000000b00344576bcfefsm13976258qtg.70.2022.08.24.13.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 13:48:40 -0700 (PDT)
Date: Wed, 24 Aug 2022 16:48:38 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v2 1/2] mm/migrate_device.c: Copy pte dirty bit to page
Message-ID: <YwaOpj54/qUb5fXa@xz-m1.local>
References: <YvxWUY9eafFJ27ef@xz-m1.local>
 <87o7wjtn2g.fsf@nvdebian.thelocal>
 <87tu6bbaq7.fsf@yhuang6-desk2.ccr.corp.intel.com>
 <1D2FB37E-831B-445E-ADDC-C1D3FF0425C1@gmail.com>
 <Yv1BJKb5he3dOHdC@xz-m1.local>
 <87czcyawl6.fsf@yhuang6-desk2.ccr.corp.intel.com>
 <Yv5QXkS4Bm9pTBeG@xz-m1.local>
 <874jy9aqts.fsf@yhuang6-desk2.ccr.corp.intel.com>
 <87czcqiecd.fsf@nvdebian.thelocal>
 <YwaJSBnp2eyMlkjw@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <YwaJSBnp2eyMlkjw@xz-m1.local>
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

On Wed, Aug 24, 2022 at 04:25:44PM -0400, Peter Xu wrote:
> On Wed, Aug 24, 2022 at 11:56:25AM +1000, Alistair Popple wrote:
> > >> Still I don't know whether there'll be any side effect of having stall tlbs
> > >> in !present ptes because I'm not familiar enough with the private dev swap
> > >> migration code.  But I think having them will be safe, even if redundant.
> > 
> > What side-effect were you thinking of? I don't see any issue with not
> > TLB flushing stale device-private TLBs prior to the migration because
> > they're not accessible anyway and shouldn't be in any TLB.
> 
> Sorry to be misleading, I never meant we must add them.  As I said it's
> just that I don't know the code well so I don't know whether it's safe to
> not have it.
> 
> IIUC it's about whether having stall system-ram stall tlb in other
> processor would matter or not here.  E.g. some none pte that this code
> collected (boosted both "cpages" and "npages" for a none pte) could have
> stall tlb in other cores that makes the page writable there.

For this one, let me give a more detailed example.

It's about whether below could happen:

       thread 1                thread 2                 thread 3
       --------                --------                 --------
                          write to page P (data=P1)
                            (cached TLB writable)
  zap_pte_range()
    pgtable lock
    clear pte for page P
    pgtable unlock
    ...
                                                     migrate_vma_collect
                                                       pte none, npages++, cpages++
                                                       allocate device page
                                                       copy data (with P1)
                                                       map pte as device swap 
                          write to page P again
                          (data updated from P1->P2)
  flush tlb

Then at last from processor side P should have data P2 but actually from
device memory it's P1. Data corrupt.

> 
> When I said I'm not familiar with the code, it's majorly about one thing I
> never figured out myself, in that migrate_vma_collect_pmd() has this
> optimization to trylock on the page, collect if it succeeded:
> 
>   /*
>    * Optimize for the common case where page is only mapped once
>    * in one process. If we can lock the page, then we can safely
>    * set up a special migration page table entry now.
>    */
>    if (trylock_page(page)) {
>           ...
>    } else {
>           put_page(page);
>           mpfn = 0;
>    }
> 
> But it's kind of against a pure "optimization" in that if trylock failed,
> we'll clear the mpfn so the src[i] will be zero at last.  Then will we
> directly give up on this page, or will we try to lock_page() again
> somewhere?
> 
> The future unmap op is also based on this "cpages", not "npages":
> 
> 	if (args->cpages)
> 		migrate_vma_unmap(args);
> 
> So I never figured out how this code really works.  It'll be great if you
> could shed some light to it.
> 
> Thanks,
> 
> -- 
> Peter Xu

-- 
Peter Xu

