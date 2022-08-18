Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAED598644
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 16:45:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7nkQ61C8z3cdy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 00:45:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eWM0kZle;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eWM0kZle;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eWM0kZle;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eWM0kZle;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7njN5k04z2xGk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 00:44:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660833890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZlNW+boxKqgfwr0TWqSRLZOIUoJTEM6tD/36NIupE70=;
	b=eWM0kZleNy9WMT6fUahmrH5J3EhHBQP3V9TiaybrazKqb7TMvtoj/yKglHjEezEKrM4MGo
	jIrPIlwvWNECpxkdT7JgMkD7tOiPEhfC0eWFTNX1dIc7W0uTbGWlibHJeMrRGpyCaY1zLA
	oSYJ+8j98RUHwuMGaChoDGPHMwKLpZc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660833890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZlNW+boxKqgfwr0TWqSRLZOIUoJTEM6tD/36NIupE70=;
	b=eWM0kZleNy9WMT6fUahmrH5J3EhHBQP3V9TiaybrazKqb7TMvtoj/yKglHjEezEKrM4MGo
	jIrPIlwvWNECpxkdT7JgMkD7tOiPEhfC0eWFTNX1dIc7W0uTbGWlibHJeMrRGpyCaY1zLA
	oSYJ+8j98RUHwuMGaChoDGPHMwKLpZc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-332-jaWQo7OdOri2P3tjtZ1-FQ-1; Thu, 18 Aug 2022 10:44:49 -0400
X-MC-Unique: jaWQo7OdOri2P3tjtZ1-FQ-1
Received: by mail-qt1-f200.google.com with SMTP id v5-20020ac873c5000000b003434ef0a8c7so1290984qtp.21
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 07:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=ZlNW+boxKqgfwr0TWqSRLZOIUoJTEM6tD/36NIupE70=;
        b=ZsSMyLFzIaKOmbv5dcRsVig54MzDK9DmT/IV+HZRxqDGq9vuwmOm3LPVm1v+sxTsyT
         vE9Ndwrggy/ASdjx9XTuPr8cXEB73h7aVftPlb3wJ+min7rb9eB27weiVMUKS5X+6Rsy
         +4DzAbVmRrgRSgibQ5H1VjiYhPgZU/2DgwophRfZ+Vvboyv8qJ81GjFgsVAgPYTdfLHo
         K+6is/54jHb5SSpiCVPHqBD7BGJTjQXLy+7UXGY19kQ7XLYfTx3AOU2ILFXUU6sGi5/0
         c88VPBBiQnSsYMijwjUK6f5IYY95Uq0iiSG7wVUC8z48HHB11sADp1G2wnpfmuk/9xDI
         F4UA==
X-Gm-Message-State: ACgBeo23SZW7odPkOGPIVIBN+iHpOToUaTdTuu+QXbTxvC4OKd2ngISU
	Yq6OtT+Y5bwRXWfvMT5/Q4yxooz1GhJ+Lr9JzVTXojbZ4g0rC4npb2z6W+qETAX+nHp9xEKOfru
	AYiyOUWL1QVIlMT5V6lDMl3Wx8w==
X-Received: by 2002:a05:622a:1c3:b0:344:56b5:f14b with SMTP id t3-20020a05622a01c300b0034456b5f14bmr2982392qtw.152.1660833888686;
        Thu, 18 Aug 2022 07:44:48 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6Y7IFVVzndjOAS+SeXLhYlIl9eakAp1CbXrmWdBV9kzpU04h8jW0ij46cg9iIRTWVE+UYkxA==
X-Received: by 2002:a05:622a:1c3:b0:344:56b5:f14b with SMTP id t3-20020a05622a01c300b0034456b5f14bmr2982368qtw.152.1660833888473;
        Thu, 18 Aug 2022 07:44:48 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
        by smtp.gmail.com with ESMTPSA id y10-20020a05622a120a00b003435a198849sm1216076qtx.47.2022.08.18.07.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 07:44:47 -0700 (PDT)
Date: Thu, 18 Aug 2022 10:44:46 -0400
From: Peter Xu <peterx@redhat.com>
To: "Huang, Ying" <ying.huang@intel.com>
Subject: Re: [PATCH v2 1/2] mm/migrate_device.c: Copy pte dirty bit to page
Message-ID: <Yv5QXkS4Bm9pTBeG@xz-m1.local>
References: <6e77914685ede036c419fa65b6adc27f25a6c3e9.1660635033.git-series.apopple@nvidia.com>
 <CAC=cRTPGiXWjk=CYnCrhJnLx3mdkGDXZpvApo6yTbeW7+ZGajA@mail.gmail.com>
 <Yvv/eGfi3LW8WxPZ@xz-m1.local>
 <871qtfvdlw.fsf@nvdebian.thelocal>
 <YvxWUY9eafFJ27ef@xz-m1.local>
 <87o7wjtn2g.fsf@nvdebian.thelocal>
 <87tu6bbaq7.fsf@yhuang6-desk2.ccr.corp.intel.com>
 <1D2FB37E-831B-445E-ADDC-C1D3FF0425C1@gmail.com>
 <Yv1BJKb5he3dOHdC@xz-m1.local>
 <87czcyawl6.fsf@yhuang6-desk2.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <87czcyawl6.fsf@yhuang6-desk2.ccr.corp.intel.com>
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, linuxppc-dev@lists.ozlabs.org, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Hildenbrand <david@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, Alistair Popple <apopple@nvidia.com>, LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, Linux MM <linux-mm@kvack.org>, Logan Gunthorpe <logang@deltatee.com>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, stable@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, huang ying <huang.ying.caritas@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 18, 2022 at 02:34:45PM +0800, Huang, Ying wrote:
> > In this specific case, the only way to do safe tlb batching in my mind is:
> >
> > 	pte_offset_map_lock();
> > 	arch_enter_lazy_mmu_mode();
> >         // If any pending tlb, do it now
> >         if (mm_tlb_flush_pending())
> > 		flush_tlb_range(vma, start, end);
> >         else
> >                 flush_tlb_batched_pending();
> 
> I don't think we need the above 4 lines.  Because we will flush TLB
> before we access the pages.

Could you elaborate?

> Can you find any issue if we don't use the above 4 lines?

It seems okay to me to leave stall tlb at least within the scope of this
function. It only collects present ptes and flush propoerly for them.  I
don't quickly see any other implications to other not touched ptes - unlike
e.g. mprotect(), there's a strong barrier of not allowing further write
after mprotect() returns.

Still I don't know whether there'll be any side effect of having stall tlbs
in !present ptes because I'm not familiar enough with the private dev swap
migration code.  But I think having them will be safe, even if redundant.

Thanks,

-- 
Peter Xu

