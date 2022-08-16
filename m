Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF095963BF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 22:35:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6jbG4vmyz3cD7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 06:35:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=emKok07g;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=emKok07g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=emKok07g;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=emKok07g;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6jZX3vLSz3bVt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 06:35:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660682110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8qNWq56WcsAjV+d0DPWCWS43jEIePhWAAvwxxzNI+Yo=;
	b=emKok07gEvfJwSe/wpjLGYPDE8+1mCvDFPOOx/qX7FlYAW68rqT6ZgdAM+bJsaIygd4qeU
	eyXpi0jCNAnDJA79hG0rb3na5M/qClBsPtc3McqAjqlEUYrKtrwVSEvX8tIQMeAfGzyu8x
	GJDxFH8qMibTDZ8BRbYtKua/qbsx7Bs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660682110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8qNWq56WcsAjV+d0DPWCWS43jEIePhWAAvwxxzNI+Yo=;
	b=emKok07gEvfJwSe/wpjLGYPDE8+1mCvDFPOOx/qX7FlYAW68rqT6ZgdAM+bJsaIygd4qeU
	eyXpi0jCNAnDJA79hG0rb3na5M/qClBsPtc3McqAjqlEUYrKtrwVSEvX8tIQMeAfGzyu8x
	GJDxFH8qMibTDZ8BRbYtKua/qbsx7Bs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-260-FSDxaqNYP2uT-N-J9U_7Bg-1; Tue, 16 Aug 2022 16:35:07 -0400
X-MC-Unique: FSDxaqNYP2uT-N-J9U_7Bg-1
Received: by mail-qk1-f199.google.com with SMTP id n15-20020a05620a294f00b006b5768a0ed0so10036573qkp.7
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 13:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=8qNWq56WcsAjV+d0DPWCWS43jEIePhWAAvwxxzNI+Yo=;
        b=tRcwv3eGBf2FzuZe61ansv2uV52pqKBIOaMOEvfPF3wCsJsRloyFJx8x+Mk8Fx7/2a
         LDElpvA5sTjkr6UMditNsKRDAdUgZ6NZa7Dfw6hKPwIAMStQM8VYvFgMFE3SabKDxIie
         hKWrLFPoBff/6xcqG8WQwfJrS6lWofl3flqpFghxZlD0GQJkyJbodasHbdu4aAM528UJ
         PQ0vwlKVK5Ow8/c5y0dnOImgQ9mq3Ra71//wBnoeWF5juZKw/Tu3RIrZGHiaiQAWtJ1S
         ASpwQfzXJMGE9quOKFDDKfKVfNtcc6wgK46cSj7AT3mY8WSe6H+gDK8y8iy/Y6mzn5ei
         ep/g==
X-Gm-Message-State: ACgBeo3LtvLoWrpsDJoM78U1u+jJT/zRBFiQpVEL7xI535u2RmZJ/KYk
	wzpYZQlOuAU4NDHRItR9GyM3SbM/umuw2+mFGJfabgFSaE/nHfM4U+1cuU1YkVqEhZqnWa2iwdi
	uQqWFVaUmpsGugNJq04gmMKQKNg==
X-Received: by 2002:a05:6214:2aa2:b0:477:1882:3dc with SMTP id js2-20020a0562142aa200b00477188203dcmr19064872qvb.11.1660682106683;
        Tue, 16 Aug 2022 13:35:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6sxNDlfRThn/rIz3JOnzmI+jYq7VbHmqoYMTVRKckqHUaSQxZWhXW5hA43Dz2DbrziOS2X+w==
X-Received: by 2002:a05:6214:2aa2:b0:477:1882:3dc with SMTP id js2-20020a0562142aa200b00477188203dcmr19064852qvb.11.1660682106470;
        Tue, 16 Aug 2022 13:35:06 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
        by smtp.gmail.com with ESMTPSA id l1-20020a05620a28c100b006b958c34bf1sm3222130qkp.10.2022.08.16.13.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:35:05 -0700 (PDT)
Date: Tue, 16 Aug 2022 16:35:04 -0400
From: Peter Xu <peterx@redhat.com>
To: huang ying <huang.ying.caritas@gmail.com>
Subject: Re: [PATCH v2 1/2] mm/migrate_device.c: Copy pte dirty bit to page
Message-ID: <Yvv/eGfi3LW8WxPZ@xz-m1.local>
References: <6e77914685ede036c419fa65b6adc27f25a6c3e9.1660635033.git-series.apopple@nvidia.com>
 <CAC=cRTPGiXWjk=CYnCrhJnLx3mdkGDXZpvApo6yTbeW7+ZGajA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAC=cRTPGiXWjk=CYnCrhJnLx3mdkGDXZpvApo6yTbeW7+ZGajA@mail.gmail.com>
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, linuxppc-dev@lists.ozlabs.org, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Felix Kuehling <Felix.Kuehling@amd.com>, Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Huang Ying <ying.huang@intel.com>, stable@vger.kernel.org, akpm@linux-foundation.org, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 16, 2022 at 04:10:29PM +0800, huang ying wrote:
> > @@ -193,11 +194,10 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >                         bool anon_exclusive;
> >                         pte_t swp_pte;
> >
> > +                       flush_cache_page(vma, addr, pte_pfn(*ptep));
> > +                       pte = ptep_clear_flush(vma, addr, ptep);
> 
> Although I think it's possible to batch the TLB flushing just before
> unlocking PTL.  The current code looks correct.

If we're with unconditionally ptep_clear_flush(), does it mean we should
probably drop the "unmapped" and the last flush_tlb_range() already since
they'll be redundant?

If that'll need to be dropped, it looks indeed better to still keep the
batch to me but just move it earlier (before unlock iiuc then it'll be
safe), then we can keep using ptep_get_and_clear() afaiu but keep "pte"
updated.

Thanks,

-- 
Peter Xu

