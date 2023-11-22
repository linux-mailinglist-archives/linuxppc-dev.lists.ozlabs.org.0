Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 197EF7F4A2D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 16:23:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=APW0lfRv;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=APW0lfRv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sb4kt0CPkz3dLH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 02:23:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=APW0lfRv;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=APW0lfRv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sb4jx4fSJz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 02:22:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700666542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jHf7jc7J8Bv83RTgjktPDmyDKiNjMVCeKkEQ7LZmkKc=;
	b=APW0lfRvCKQPfDD58dtNMQ7pYMjMLagPUGvTkd/Q5jcBBMd0zIoTh8vS9/DBg0KXN06OaY
	m9FdKUmocABNFVzma1RfPML5sjKjWT5fvHYd6Gsi2gV0oSj+zUnAEKZMriXWoYhZzOsKbw
	97k9VfMOpZkMw7RpUEzAI+75JL3Lsmk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700666542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jHf7jc7J8Bv83RTgjktPDmyDKiNjMVCeKkEQ7LZmkKc=;
	b=APW0lfRvCKQPfDD58dtNMQ7pYMjMLagPUGvTkd/Q5jcBBMd0zIoTh8vS9/DBg0KXN06OaY
	m9FdKUmocABNFVzma1RfPML5sjKjWT5fvHYd6Gsi2gV0oSj+zUnAEKZMriXWoYhZzOsKbw
	97k9VfMOpZkMw7RpUEzAI+75JL3Lsmk=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-NxzGvXZkN6qUUdijFsKrEg-1; Wed, 22 Nov 2023 10:22:20 -0500
X-MC-Unique: NxzGvXZkN6qUUdijFsKrEg-1
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-58d07f8a92bso63886eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 07:22:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700666540; x=1701271340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHf7jc7J8Bv83RTgjktPDmyDKiNjMVCeKkEQ7LZmkKc=;
        b=s/Mlwm5pnBsVc2dAHKT4U+YYWX/azrMhTlNImDzvd1sbDaRY90S6h/8C4wuEPmMxVf
         SfAU9VAG/HUkNmP9Pz4vyHo1TVv1feEOMlUVsSBzDN4ZncWzoa/T5hodjh+h7p6unozS
         OokvtjOTPgKxp9pA0YVob1onSBwPAu2FHKMxX/GoaWDRI0/0KZPYfXnPeiMN9YwmFwn3
         oAeqAIIFCca4E899SVf84MlkYxIf8Ge2KzbtxVmHTinwepzHav4vrJchsdk2uUwjaF6v
         7lmQoZz1vwwUe4IwiF1l6JV3UBAlZ72Cm2gK5rUX1BCNvQdmnU38t+PezjBuzMEFqE5F
         LpdA==
X-Gm-Message-State: AOJu0YxcXrvQHwJmrTk3g2SlhKxaGYW0wnTsfkqvL0APnhbgRsS7Goph
	7XpY3Me8K0mMmYrcihAVPHoJxfoaYrPrhLecnyVJJq6//PDK/Le4saTc5hMpvnNHZhc9u2fNTZk
	pYIjvOW++SsqKS+ZYicYA3p+ISg==
X-Received: by 2002:a05:6820:311:b0:58c:e80a:537d with SMTP id l17-20020a056820031100b0058ce80a537dmr3009159ooe.1.1700666539866;
        Wed, 22 Nov 2023 07:22:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOaFlUlKMrMvbpX5vlLOYOyqCZqIYmeCKyEeM2CWjyOcsp+BCB1xOxZFIWf6oSiyQQHcWwQQ==
X-Received: by 2002:a05:6820:311:b0:58c:e80a:537d with SMTP id l17-20020a056820031100b0058ce80a537dmr3009114ooe.1.1700666539416;
        Wed, 22 Nov 2023 07:22:19 -0800 (PST)
Received: from x1n (cpe688f2e2cb7c3-cm688f2e2cb7c0.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id m13-20020a0cbf0d000000b0066d04196c3dsm4941000qvi.49.2023.11.22.07.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 07:22:18 -0800 (PST)
Date: Wed, 22 Nov 2023 10:22:11 -0500
From: Peter Xu <peterx@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in
 hugepd processing
Message-ID: <ZV4co7wcI-_wK91F@x1n>
References: <20231116012908.392077-1-peterx@redhat.com>
 <20231116012908.392077-7-peterx@redhat.com>
 <ZVsYMMJpmFV2T/Zc@infradead.org>
 <ZVzT5_3Zn-Y-6xth@x1n>
 <ZV21GCbG48nTLDzn@infradead.org>
MIME-Version: 1.0
In-Reply-To: <ZV21GCbG48nTLDzn@infradead.org>
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, James Houghton <jthoughton@google.com>, Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Vlastimil Babka <vbabka@suse.cz>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 22, 2023 at 12:00:24AM -0800, Christoph Hellwig wrote:
> On Tue, Nov 21, 2023 at 10:59:35AM -0500, Peter Xu wrote:
> > > What prevents us from ever using hugepd with file mappings?  I think
> > > it would naturally fit in with how large folios for the pagecache work.
> > > 
> > > So keeping this check and generalizing it seems like the better idea to
> > > me.
> > 
> > But then it means we're still keeping that dead code for fast-gup even if
> > we know that fact..  Or do we have a plan to add that support very soon, so
> > this code will be destined to add back?
> 
> The question wasn't mean retorical - we support arbitrary power of two
> sized folios for the pagepage, what prevents us from using hugepd with
> them right now?

Ah, didn't catch that point previously.  Hugepd is just not used outside
hugetlb right now, afaiu.

For example, __hugepte_alloc() (and that's the only one calls
hugepd_populate()) should be the function to allocate a hugepd (ppc only),
and it's only called in huge_pte_alloc(), which is part of the current
arch-specific hugetlb api.

And generic mm paths don't normally have hugepd handling, afaics.  For
example, page_vma_mapped_walk() doesn't handle hugepd at all unless in
hugetlb specific path.

There're actually (only) two generic mm paths that can handle hugepd,
namely:

  - fast-gup
  - walk_page_*() apis (aka, __walk_page_range())

For fast-gup I think the hugepd code is in use, however for walk_page_*
apis hugepd code shouldn't be reached iiuc as we have the hugetlb specific
handling (walk_hugetlb_range()), so anything within walk_pgd_range() to hit
a hugepd can be dead code to me (but note that this "dead code" is good
stuff to me, if one would like to merge hugetlb instead into generic mm).

This series tries to add slow gup into that list too, so the 3rd one to
support it.  I plan to look more into this area (e.g., __walk_page_range()
can be another good candidate soon).  I'm not sure whether we should teach
the whole mm to understand hugepd yet, but slow gup and __walk_page_range()
does look like good candidates to already remove the hugetlb specific code
paths - slow-gup has average ~add/~del LOCs (which this series does), and
__walk_page_range() can remove some code logically, no harm I yet see.

Indeed above are based on only my code observations, so I'll be more than
happy to be corrected otherwise, as early as possible.

> 
> > The other option is I can always add a comment above gup_huge_pd()
> > explaining this special bit, so that when someone is adding hugepd support
> > to file large folios we'll hopefully not forget it?  But then that
> > generalization work will only happen when the code will be needed.
> 
> If dropping the check is the right thing for now (and I think the ppc
> maintainers and willy as the large folio guy might have a more useful
> opinions than I do), leaving a comment in would be very useful.

Willy is in the loop, and I just notice I didn't really copy ppc list, even
I planned to..  I am adding the list (linuxppc-dev@lists.ozlabs.org) into
this reply.  I'll remember to do so as long as there's a new version.

The other reason I feel like hugepd may or may not be further developed for
new features like large folio is that I saw Power9 started to shift to
radix pgtables, and afaics hugepd is only supported in hash tables
(hugepd_ok()).  But again, I confess I know nothing about Power at all.

Thanks,

-- 
Peter Xu

