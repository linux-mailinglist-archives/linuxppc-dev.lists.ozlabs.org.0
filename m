Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6395B89909A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 23:48:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X7drrplw;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X7drrplw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9Zxz1FNYz3vXM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 08:48:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X7drrplw;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X7drrplw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9ZxF4Vrmz3bp7
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 08:48:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712267293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d56SKhTEmtwwDufddPphJGQfZPKBUJnUzF2wWqxF3/c=;
	b=X7drrplwCIou89vX3EWjevFB3k1McXSAdYxQHkKnVOQcso0AgIKdnIzEELCEKOAIoD1fwt
	Gbw+7fHRHMEo2PtwvXA0J/qD6rhU8NUbcRH8wJMDMt9A0eMQFEsyEADKYfapYvdHGOilc1
	CDRTPJ4V+CnQ3ScdsiOgbH5l5Wi+/MI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712267293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d56SKhTEmtwwDufddPphJGQfZPKBUJnUzF2wWqxF3/c=;
	b=X7drrplwCIou89vX3EWjevFB3k1McXSAdYxQHkKnVOQcso0AgIKdnIzEELCEKOAIoD1fwt
	Gbw+7fHRHMEo2PtwvXA0J/qD6rhU8NUbcRH8wJMDMt9A0eMQFEsyEADKYfapYvdHGOilc1
	CDRTPJ4V+CnQ3ScdsiOgbH5l5Wi+/MI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-mJVxAp-aMGiM_jqNuvmgnA-1; Thu, 04 Apr 2024 17:48:12 -0400
X-MC-Unique: mJVxAp-aMGiM_jqNuvmgnA-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-78d41af5bebso33979685a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Apr 2024 14:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712267292; x=1712872092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d56SKhTEmtwwDufddPphJGQfZPKBUJnUzF2wWqxF3/c=;
        b=SrkDz11vhWENUhLyELB5AxkDGYFa324ObMHsiVrojloOs01awtABtN7PmQCWGRr137
         /vawii19/BGV64I6diuHeU701JXeGVHCYC1irZiILeDyx9Q7BnMEK0y0PoWVGcEuz3fn
         csjD6vmxR/ulYodt100JWgvR8HSb/oHAqNPVmLkBZlTir7BtUEGqdh0cjNUpNdTvv3cb
         iJge1Tt1yjEh5cAJ3aCjFVDJG3LTPI5ubIvqA8+LTxrRRRRmm1W2L2cm82MClSM1pYkb
         fSNaDwpawstklhGP8GyZ/mm8glf+NcFZF2SrkX9YmxVwriSbfYkpAcOaMMXanRsBypLO
         VPqw==
X-Forwarded-Encrypted: i=1; AJvYcCVnyzFLbfjvgj1AEngYolgfC2glM+X1y+teynGIa6otHxfU+EhuH6eVl7Y8mKrHAKebzwvDvV6oj4GLAAxlJ5TF5GCgGMaYH93bbbiVbw==
X-Gm-Message-State: AOJu0YwtW3vblxjgtGpDRt6jRvPEdmAgVU2+S1Fn/9v0J4pLIgei9AjD
	HBnCrwR85GrV0qT+rEwExeCG6gsGS4xdldnXRCA6qW+KgMJlgLciNeZ6CdlSUtV0fLG8Sd9mZNZ
	byAP4MIllrA/cpsFPXL883q/n5HfxPr/A7gtW8XnCfIy8JMlBloKC6VVHO79ArKI=
X-Received: by 2002:a05:620a:4710:b0:78d:3b13:f5ab with SMTP id bs16-20020a05620a471000b0078d3b13f5abmr4681200qkb.0.1712267291537;
        Thu, 04 Apr 2024 14:48:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGchKyZTo6ytc9p0sjvCKGDIoG+ERHoc+VJC1tNlLSTRdcMUNyMf3HEESrAIicSQ8HrtIJ6pQ==
X-Received: by 2002:a05:620a:4710:b0:78d:3b13:f5ab with SMTP id bs16-20020a05620a471000b0078d3b13f5abmr4680952qkb.0.1712267286207;
        Thu, 04 Apr 2024 14:48:06 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id wg6-20020a05620a568600b00789e49808ffsm105555qkn.105.2024.04.04.14.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 14:48:05 -0700 (PDT)
Date: Thu, 4 Apr 2024 17:48:03 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 00/12] mm/gup: Unify hugetlb, part 2
Message-ID: <Zg8gEyE4o_VJsTmx@x1n>
References: <20240321220802.679544-1-peterx@redhat.com>
 <20240322161000.GJ159172@nvidia.com>
 <ZgHJaJSpoeJVEccN@x1n>
 <20240326140252.GH6245@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240326140252.GH6245@nvidia.com>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, linux-arm-kernel@lists.infradead.org, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 26, 2024 at 11:02:52AM -0300, Jason Gunthorpe wrote:
> The more I look at this the more I think we need to get to Matthew's
> idea of having some kind of generic page table API that is not tightly
> tied to level. Replacing the hugetlb trick of 'everything is a PTE'
> with 5 special cases in every place seems just horrible.
> 
>    struct mm_walk_ops {
>        int (*leaf_entry)(struct mm_walk_state *state, struct mm_walk *walk);
>    }
> 
> And many cases really want something like:
>    struct mm_walk_state state;
> 
>    if (!mm_walk_seek_leaf(state, mm, address))
>           goto no_present
>    if (mm_walk_is_write(state)) ..
> 
> And detailed walking:
>    for_each_pt_leaf(state, mm, address) {
>        if (mm_walk_is_write(state)) ..
>    }
> 
> Replacing it with a mm_walk_state that retains the level or otherwise
> to allow decoding any entry composes a lot better. Forced Loop
> unrolling can get back to the current code gen in alot of places.
> 
> It also makes the power stuff a bit nicer as the mm_walk_state could
> automatically retain back pointers to the higher levels in the state
> struct too...
> 
> The puzzle is how to do it and still get reasonable efficient codegen,
> many operations are going to end up switching on some state->level to
> know how to decode the entry.

These discussions are definitely constructive, thanks Jason.  Very helpful.

I thought about this last week but got interrupted.  It does make sense to
me; it looks pretty generic and it is flexible enough as a top design.  At
least that's what I thought.

However now when I rethink about it, and look more into the code when I got
the chance, it turns out this will be a major rewrite of mostly every
walkers..  it doesn't mean that this is a bad idea, but then I'll need to
compare the other approach, because there can be a huge difference on when
we can get that code ready, I think. :)

Consider that what we (or.. I) want to teach the pXd layers are two things
right now: (1) hugetlb mappings (2) MMIO (PFN) mappings.  That mostly
shares the generic concept when working on the mm walkers no matter which
way to go, just different treatment on different type of mem.  (2) is on
top of current code and new stuff, while (1) is a refactoring to drop
hugetlb_entry() hook point as the goal.

Taking a simplest mm walker (smaps) as example, I think most codes are
ready thanks to THP's existance, and also like vm_normal_page[_pmd]() which
should even already work for pfnmaps; pud layer is missing but that should
be trivial.  It means we may have chance to drop hugetlb_entry() without an
huge overhaul yet.

Now the important question I'm asking myself is: do we really need huge p4d
or even bigger?  It's 512GB on x86, and we said "No 512 GiB pages yet"
(commit fe1e8c3e963) since 2017 - that is 7 years without chaning this
fact.  While on non-x86 p4d_leaf() never defined.  Then it's also
interesting to see how many codes are "ready" to handle p4d entries (by
looking at p4d_leaf() calls; much easier to see with the removal of the
rest huge apis..) even if none existed.

So, can we over-engineer too much if we go the generic route now?
Considering that we already have most of pmd/pud entries around in the mm
walker ops.  So far it sounds better we leave it for later, until further
justifed to be useful.  And that won't block it if it ever justified to be
needed, I'd say it can also be seen as a step forward if I can make it to
remove hugetlb_entry() first.

Comments welcomed (before I start to work on anything..).

Thanks,

-- 
Peter Xu

