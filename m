Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D23982176D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jan 2024 06:38:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Odj7rz48;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dfCljb4P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T41q31Sy2z3cR4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jan 2024 16:38:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Odj7rz48;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dfCljb4P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T41pB0xLJz2xQH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jan 2024 16:37:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704173853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eCnGZSmn0Xbft/VvC3w27VmkfIRRQMc7XVfvoJNmfHo=;
	b=Odj7rz48zp0HHWF24KJK3cwlgQo/J4wkGft2blXKh0bPgU+Am7N0j6QZgAGM+iELbDMA3R
	cbnACgNgxhvOTt8EaPVRigYeyE72G14ntjNv3lOBY+8/EXG38cBgTjTVUW9r7LGVgjr+Cf
	8c0y4/+nBWKoaRo9KePvQmvUvj3/Fm8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704173854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eCnGZSmn0Xbft/VvC3w27VmkfIRRQMc7XVfvoJNmfHo=;
	b=dfCljb4P/Zm94hlE5D7Mk9MJ7dVJZnzqd5rw5ipiAzqqVzIdwivZaOBek4WGjkk+r0iXav
	YIHdrpH5OAY9LTWwwsPBxZbAXVQuC+/F7OCl7tp/jGaVUwIkNOkIRql4cnQwcVPV2cbC+z
	jYj7m7GjZBkGV2xDmznS0kBI+CVeGCw=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-laKnWce5Mku0qc3BgK-UkQ-1; Tue, 02 Jan 2024 00:37:32 -0500
X-MC-Unique: laKnWce5Mku0qc3BgK-UkQ-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-6d9bf77a474so1816179b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jan 2024 21:37:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704173851; x=1704778651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCnGZSmn0Xbft/VvC3w27VmkfIRRQMc7XVfvoJNmfHo=;
        b=fzj5RZtROqlEyAZuOIg9KM3wqS/ujXM4P69R8Fe17HkjTVWkHm5sNIqyloOvHS9Hxr
         xpfp8c1seK3Gb9GlSUhiQcBCJQzKDQYxdw9H1X9W2aTSUSvbgSCK06MAj4cb2we9Jis1
         a2e+krL0yP7QhIMQF36tb/htBOmjcQ0v3EzdyJuQXHPeT0qtvfZTQJpNXKtL6U+EcPWL
         LwAsCsgo2EPDqPVY6XWi/sY27ZEpGLrGTSnOVG6DJJjBUWawSujNwMjgDGHQaDlX/byo
         9uLQlLF+a5+hFx0AiIgxpawhK8DM6PdmIHfjypHk9ohfJhlg4nBQq/XDZCamjDg5GTpa
         mrOQ==
X-Gm-Message-State: AOJu0YwwkmSLmnHS2ORTxsnrBXxTmeGu2eUMlnZjOX6+SlUf4CxhHvq/
	+4XrxFnVHNnIrwrJWrfSBvbLectXGZubnjdMwJHSxPadTHQU/jclylJgQHTwB7FGBYS83R6kYaA
	Vi4pw5+fobotqzrFq5UmoZm/G44IZmaj/8w==
X-Received: by 2002:a17:902:ce86:b0:1d3:eecd:b296 with SMTP id f6-20020a170902ce8600b001d3eecdb296mr33590824plg.6.1704173851405;
        Mon, 01 Jan 2024 21:37:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHENzr2M0aJyyZm2vt3XzuVCeWLevZs5IuWsUdjc1ZzU9FWxHr/jzg4D3MMktI1x4ptpcHyFg==
X-Received: by 2002:a17:902:ce86:b0:1d3:eecd:b296 with SMTP id f6-20020a170902ce8600b001d3eecdb296mr33590810plg.6.1704173851161;
        Mon, 01 Jan 2024 21:37:31 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id v4-20020a17090331c400b001d49c0daf60sm6900347ple.265.2024.01.01.21.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 21:37:30 -0800 (PST)
Date: Tue, 2 Jan 2024 13:37:14 +0800
From: Peter Xu <peterx@redhat.com>
To: Muchun Song <muchun.song@linux.dev>
Subject: Re: [PATCH 03/13] mm: Provide generic pmd_thp_or_huge()
Message-ID: <ZZOhCuuozrBscdRC@x1n>
References: <20231219075538.414708-1-peterx@redhat.com>
 <20231219075538.414708-4-peterx@redhat.com>
 <135b3189-f459-4b57-9861-bb8acb999d91@linux.dev>
MIME-Version: 1.0
In-Reply-To: <135b3189-f459-4b57-9861-bb8acb999d91@linux.dev>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 25, 2023 at 02:29:53PM +0800, Muchun Song wrote:
> > @@ -1355,6 +1355,10 @@ static inline int pmd_write(pmd_t pmd)
> >   #endif /* pmd_write */
> >   #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> > +#ifndef pmd_thp_or_huge
> 
> I think it may be the time to rename to pmd_thp_or_hugetlb,
> the "huge" is really confusing. thp is not huge? Actually,
> it is huge. It is better to make it more specific from now on, like
> "hugetlb".

The rename will need to touch ARM code, which I wanted to avoid, see:

arch/arm64/include/asm/pgtable.h:#define pmd_thp_or_huge(pmd)   (pmd_huge(pmd) || pmd_trans_huge(pmd))

So far this series only touches generic code.  Would you mind I keep this
patch as-is, and leave renaming to later?

> 
> BTW, please cc me via the new email (muchun.song@linux.dev) next edition.

Sure.  Thanks for taking a look.

-- 
Peter Xu

