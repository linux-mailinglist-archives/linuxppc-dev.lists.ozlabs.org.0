Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EADD5A02A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 22:26:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCd0m1mFRz3c6n
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 06:26:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TU36UDUF;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TU36UDUF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TU36UDUF;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TU36UDUF;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCd0312Kfz304n
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 06:25:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661372749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WcGllBx/E+hwvIFs2WxQDGDJChMuYQJTiL0H+5A7OM0=;
	b=TU36UDUF5tc3Y4XVjVatqgkZdgawz+vG3zQBs25yaq4wU4QkL7hTEK+s+drxT+Y6tCibRs
	nuG1MmHD0cIKaUfA6agjh+tSihzH9zGE86R51aG1o66DDqL4ZgBPELsvG5KE2GCreMQU9/
	EGlBm4kIIw+Y8zvT8Gv3LlpgAMIx+ck=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661372749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WcGllBx/E+hwvIFs2WxQDGDJChMuYQJTiL0H+5A7OM0=;
	b=TU36UDUF5tc3Y4XVjVatqgkZdgawz+vG3zQBs25yaq4wU4QkL7hTEK+s+drxT+Y6tCibRs
	nuG1MmHD0cIKaUfA6agjh+tSihzH9zGE86R51aG1o66DDqL4ZgBPELsvG5KE2GCreMQU9/
	EGlBm4kIIw+Y8zvT8Gv3LlpgAMIx+ck=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-300-ChULvSrlN0eVtfRUjjQRvQ-1; Wed, 24 Aug 2022 16:25:48 -0400
X-MC-Unique: ChULvSrlN0eVtfRUjjQRvQ-1
Received: by mail-qt1-f197.google.com with SMTP id v13-20020a05622a188d00b00343794bd1daso13873189qtc.23
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 13:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=WcGllBx/E+hwvIFs2WxQDGDJChMuYQJTiL0H+5A7OM0=;
        b=PMOUux7S2Yo1b2/tVdoZ/aKryEjTDAL1dx6K+G86WumTyRIr0U96Rl1lyXb9ZZDQ8Q
         mkSeKnYy28bCWXtuzgYdlIH3Q4gKyeqfg2Yvn4gBZlR4Lc0jNbcQc9prJptoc6J9ctFH
         PkCoF0MHGAgaOZtbEiyueX3WLUtSpE2BpoHYwoeKm5l2nUHAVXcayUDAO1lx16wJuXU7
         rIb6QoXueMzzB5Y5UY659v8MFUwpJ1pZels1Q41jPJhjhG8Obnv64q0vNqoC3YNA6O5H
         q1cWTIkVkRWYtkhe8e7RojeXR4/YSaXCUXh6AGO7TC6lFLY/ja7Q5VUX7IdjbGx2UUId
         MMBw==
X-Gm-Message-State: ACgBeo2yhIsSL5z+1Tijq4X3qDCNknt3VGxyEYjSIOKwIP9+Em5twXhc
	tSKtwIWOZju5Qf2cWAoDzCBME1T7BWvTSfuECMlSjDFYLvH2HqB/8DVOkOIqzP/xjDivHb2O0/n
	uRTpnGvrbpJc26LcoZBFrURvPuw==
X-Received: by 2002:ac8:7e83:0:b0:344:7ee0:1241 with SMTP id w3-20020ac87e83000000b003447ee01241mr889839qtj.587.1661372747569;
        Wed, 24 Aug 2022 13:25:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4At86RE03P4mlSnr4jeclId4tDLoIpgKf+KL9cAcwLzF1s7WEI2JSHt6UJKgXWx7E14+/57Q==
X-Received: by 2002:ac8:7e83:0:b0:344:7ee0:1241 with SMTP id w3-20020ac87e83000000b003447ee01241mr889808qtj.587.1661372747336;
        Wed, 24 Aug 2022 13:25:47 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
        by smtp.gmail.com with ESMTPSA id v16-20020a05620a0f1000b006b97151d2b3sm16098374qkl.67.2022.08.24.13.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 13:25:46 -0700 (PDT)
Date: Wed, 24 Aug 2022 16:25:44 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v2 1/2] mm/migrate_device.c: Copy pte dirty bit to page
Message-ID: <YwaJSBnp2eyMlkjw@xz-m1.local>
References: <871qtfvdlw.fsf@nvdebian.thelocal>
 <YvxWUY9eafFJ27ef@xz-m1.local>
 <87o7wjtn2g.fsf@nvdebian.thelocal>
 <87tu6bbaq7.fsf@yhuang6-desk2.ccr.corp.intel.com>
 <1D2FB37E-831B-445E-ADDC-C1D3FF0425C1@gmail.com>
 <Yv1BJKb5he3dOHdC@xz-m1.local>
 <87czcyawl6.fsf@yhuang6-desk2.ccr.corp.intel.com>
 <Yv5QXkS4Bm9pTBeG@xz-m1.local>
 <874jy9aqts.fsf@yhuang6-desk2.ccr.corp.intel.com>
 <87czcqiecd.fsf@nvdebian.thelocal>
MIME-Version: 1.0
In-Reply-To: <87czcqiecd.fsf@nvdebian.thelocal>
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

On Wed, Aug 24, 2022 at 11:56:25AM +1000, Alistair Popple wrote:
> >> Still I don't know whether there'll be any side effect of having stall tlbs
> >> in !present ptes because I'm not familiar enough with the private dev swap
> >> migration code.  But I think having them will be safe, even if redundant.
> 
> What side-effect were you thinking of? I don't see any issue with not
> TLB flushing stale device-private TLBs prior to the migration because
> they're not accessible anyway and shouldn't be in any TLB.

Sorry to be misleading, I never meant we must add them.  As I said it's
just that I don't know the code well so I don't know whether it's safe to
not have it.

IIUC it's about whether having stall system-ram stall tlb in other
processor would matter or not here.  E.g. some none pte that this code
collected (boosted both "cpages" and "npages" for a none pte) could have
stall tlb in other cores that makes the page writable there.

When I said I'm not familiar with the code, it's majorly about one thing I
never figured out myself, in that migrate_vma_collect_pmd() has this
optimization to trylock on the page, collect if it succeeded:

  /*
   * Optimize for the common case where page is only mapped once
   * in one process. If we can lock the page, then we can safely
   * set up a special migration page table entry now.
   */
   if (trylock_page(page)) {
          ...
   } else {
          put_page(page);
          mpfn = 0;
   }

But it's kind of against a pure "optimization" in that if trylock failed,
we'll clear the mpfn so the src[i] will be zero at last.  Then will we
directly give up on this page, or will we try to lock_page() again
somewhere?

The future unmap op is also based on this "cpages", not "npages":

	if (args->cpages)
		migrate_vma_unmap(args);

So I never figured out how this code really works.  It'll be great if you
could shed some light to it.

Thanks,

-- 
Peter Xu

