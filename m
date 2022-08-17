Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FD9596783
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 04:46:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6spg4lB0z3cDt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 12:46:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=igBR8u9I;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=igBR8u9I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=igBR8u9I;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=igBR8u9I;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6sp174PBz2xn8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 12:45:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660704341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sFFVgLR/Ut+q9B0hkN4LXK9LXiRNRRxKcE0ZSUfZXQc=;
	b=igBR8u9IhUYcHwo5l1rjuJfd2rcU5ceZRs3Qp1ncSYfPTyixtv34Ch0k2xoMln+3l+R28N
	D31pbiAHOaXoKgMS3UVUbxJ42LFMZALnE2ySckpRILTsKugI8yMHPTxFrEEVQzt8jaVMeU
	WjvsMmQ/UqDcpZKSSQWEMcbOeqz+Vqk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660704341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sFFVgLR/Ut+q9B0hkN4LXK9LXiRNRRxKcE0ZSUfZXQc=;
	b=igBR8u9IhUYcHwo5l1rjuJfd2rcU5ceZRs3Qp1ncSYfPTyixtv34Ch0k2xoMln+3l+R28N
	D31pbiAHOaXoKgMS3UVUbxJ42LFMZALnE2ySckpRILTsKugI8yMHPTxFrEEVQzt8jaVMeU
	WjvsMmQ/UqDcpZKSSQWEMcbOeqz+Vqk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-442-irBBVxYOOe-TQHZfp6Rmbw-1; Tue, 16 Aug 2022 22:45:40 -0400
X-MC-Unique: irBBVxYOOe-TQHZfp6Rmbw-1
Received: by mail-qv1-f70.google.com with SMTP id oh2-20020a056214438200b0047bd798af75so5415642qvb.6
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 19:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=sFFVgLR/Ut+q9B0hkN4LXK9LXiRNRRxKcE0ZSUfZXQc=;
        b=U2A9HQmGBUtUcAhADgtmTOMOKASgYz4etgv3Vy7EZpTmifBgiPbSnVYorFORzJhP/6
         /caAtXf14Og99DINX1c/qfhtc4wu7NuNqsXG/pM6g0GtUa1tgOuTGiVK2nlc0TcF5qLV
         MA/5Q5QAKLl6CktpkaVzJSEqJxcJD9JYmiO2H2VQgqZImPbUmypRy4t2HNQQwwL3IkGa
         CcVxu8fqNMKc5Unsl2XX/nWoIGsN/hI8Q7wA/O6HBuDHzClwmvVXd/bjL7P3HhUhi9ox
         tQHXebd4IMk1J8tVHv2HCim1TADl+CAwEXjHLGtISTr0hUIxHdcHu1jZDb0u0Al0X861
         6Y4w==
X-Gm-Message-State: ACgBeo1pAH7Wsh1iyNddTO88vort5DW+ykR2Jh1Y6yy0ndYkE/4lWK83
	/9kviRL+pR2YOROWAXb5zeEf7dDvJ4SZrc9dH+IeJrv5CMpu2tmyrjwkCAmvIHKwtnStVL7A5Mh
	Nx3z/wrmjQpuzEkXd3d+9FH9Q4Q==
X-Received: by 2002:a37:64c3:0:b0:6ba:f404:8ff2 with SMTP id y186-20020a3764c3000000b006baf4048ff2mr12451585qkb.397.1660704339586;
        Tue, 16 Aug 2022 19:45:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5ynDdWHuXl7m7xK2zUJirotuz+hRQv269GrLiXRjE8J+k1PvWsa2cxvxjorZ2Ww5yhRCP3kw==
X-Received: by 2002:a37:64c3:0:b0:6ba:f404:8ff2 with SMTP id y186-20020a3764c3000000b006baf4048ff2mr12451556qkb.397.1660704339333;
        Tue, 16 Aug 2022 19:45:39 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
        by smtp.gmail.com with ESMTPSA id w17-20020a05620a0e9100b006bb568016easm4148710qkm.116.2022.08.16.19.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 19:45:38 -0700 (PDT)
Date: Tue, 16 Aug 2022 22:45:37 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v2 1/2] mm/migrate_device.c: Copy pte dirty bit to page
Message-ID: <YvxWUY9eafFJ27ef@xz-m1.local>
References: <6e77914685ede036c419fa65b6adc27f25a6c3e9.1660635033.git-series.apopple@nvidia.com>
 <CAC=cRTPGiXWjk=CYnCrhJnLx3mdkGDXZpvApo6yTbeW7+ZGajA@mail.gmail.com>
 <Yvv/eGfi3LW8WxPZ@xz-m1.local>
 <871qtfvdlw.fsf@nvdebian.thelocal>
MIME-Version: 1.0
In-Reply-To: <871qtfvdlw.fsf@nvdebian.thelocal>
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Felix Kuehling <Felix.Kuehling@amd.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Logan Gunthorpe <logang@deltatee.com>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Huang Ying <ying.huang@intel.com>, stable@vger.kernel.org, akpm@linux-foundation.org, huang ying <huang.ying.caritas@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 17, 2022 at 11:49:03AM +1000, Alistair Popple wrote:
> 
> Peter Xu <peterx@redhat.com> writes:
> 
> > On Tue, Aug 16, 2022 at 04:10:29PM +0800, huang ying wrote:
> >> > @@ -193,11 +194,10 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >> >                         bool anon_exclusive;
> >> >                         pte_t swp_pte;
> >> >
> >> > +                       flush_cache_page(vma, addr, pte_pfn(*ptep));
> >> > +                       pte = ptep_clear_flush(vma, addr, ptep);
> >>
> >> Although I think it's possible to batch the TLB flushing just before
> >> unlocking PTL.  The current code looks correct.
> >
> > If we're with unconditionally ptep_clear_flush(), does it mean we should
> > probably drop the "unmapped" and the last flush_tlb_range() already since
> > they'll be redundant?
> 
> This patch does that, unless I missed something?

Yes it does.  Somehow I didn't read into the real v2 patch, sorry!

> 
> > If that'll need to be dropped, it looks indeed better to still keep the
> > batch to me but just move it earlier (before unlock iiuc then it'll be
> > safe), then we can keep using ptep_get_and_clear() afaiu but keep "pte"
> > updated.
> 
> I think we would also need to check should_defer_flush(). Looking at
> try_to_unmap_one() there is this comment:
> 
> 			if (should_defer_flush(mm, flags) && !anon_exclusive) {
> 				/*
> 				 * We clear the PTE but do not flush so potentially
> 				 * a remote CPU could still be writing to the folio.
> 				 * If the entry was previously clean then the
> 				 * architecture must guarantee that a clear->dirty
> 				 * transition on a cached TLB entry is written through
> 				 * and traps if the PTE is unmapped.
> 				 */
> 
> And as I understand it we'd need the same guarantee here. Given
> try_to_migrate_one() doesn't do batched TLB flushes either I'd rather
> keep the code as consistent as possible between
> migrate_vma_collect_pmd() and try_to_migrate_one(). I could look at
> introducing TLB flushing for both in some future patch series.

should_defer_flush() is TTU-specific code?

IIUC the caller sets TTU_BATCH_FLUSH showing that tlb can be omitted since
the caller will be responsible for doing it.  In migrate_vma_collect_pmd()
iiuc we don't need that hint because it'll be flushed within the same
function but just only after the loop of modifying the ptes.  Also it'll be
with the pgtable lock held.

Indeed try_to_migrate_one() doesn't do batching either, but IMHO it's just
harder to do due to using the vma walker (e.g., the lock is released in
not_found() implicitly so iiuc it's hard to do tlb flush batching safely in
the loop of page_vma_mapped_walk).  Also that's less a concern since the
loop will only operate upon >1 ptes only if it's a thp page mapped in ptes.
OTOH migrate_vma_collect_pmd() operates on all ptes on a pmd always.

No strong opinion anyway, it's just a bit of a pity because fundamentally
this patch is removing the batching tlb flush.  I also don't know whether
there'll be observe-able perf degrade for migrate_vma_collect_pmd(),
especially on large machines.

Thanks,

-- 
Peter Xu

