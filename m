Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8317F7CB4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 19:17:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dD4IIHKq;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iM0F7nrg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ScNW55N8mz3vXM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Nov 2023 05:17:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dD4IIHKq;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iM0F7nrg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ScNVB45GNz3dBh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Nov 2023 05:16:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700849803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eg/pahNY1sda15m0S5y8qWCWFh+lk9Yndlzoe9hnA8c=;
	b=dD4IIHKq4IQR88d+2rojN0vcNAzaVVPApCjRYOwNfj7/Vh40nqVZZOTlUXUHILtky9fn/s
	z6hzgWQlqivZKZCb8Ui8ltCBrXatOKK0MRKwIvOaXZvmaVoUI15WJyM9X0UMDoAknoRod4
	/DfxGq5A3qDOaxHn7Nf9fqtzLYT6KcQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700849804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eg/pahNY1sda15m0S5y8qWCWFh+lk9Yndlzoe9hnA8c=;
	b=iM0F7nrgd2O7h6dt3+LKH3qYG6HukdT9kuxK1XSMCjBWl/0wX0O4MAxuXvfDs5AHe34E9r
	iu3knx4iUYkdimUAVpc3Tm/LntKebW2e5KOb0BO99FkNUyolsNtquMFCkcSoTpKccL4C32
	x4rogdqFQjRF67ZbUA6WYlSULZ35Km0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-tNEZiY-3Oe68XPgAs2Apag-1; Fri, 24 Nov 2023 13:16:40 -0500
X-MC-Unique: tNEZiY-3Oe68XPgAs2Apag-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-679d8383224so5649236d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 10:16:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700849799; x=1701454599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eg/pahNY1sda15m0S5y8qWCWFh+lk9Yndlzoe9hnA8c=;
        b=VmnoGiZQ+IjHPq7okR/YgRjzQJJmhInE4qeWHrea34rDOyBZFjEow0esY1J6vyzIj5
         AEnysRvJF7ML1HeINu4sLjSB7rnOZ8YjcukxSnJzG3eOpf3y/tNZTveo2Xii/CKv1FMU
         WF0P0Fb66Rhc6UFXU/Z3Lv3pjzt70xqQNV4AYHbJMTw89hdJFN74KNODfs6Vc7AIaD1h
         rqKXoR8+aAW8VAlbKDIOOz2xS6I1mJwRA/B3bljcmD+qJYCpeal1R2/gFvGJWugCOVSe
         odn5HHoVvX4L0PKSCUi5Y+/Ayhj9SURmnUqXMnxlso97J4dMschdPN+pNlMoX0MeMY4S
         GY+g==
X-Gm-Message-State: AOJu0YzVTxj/Ty5Hxzfhpzafr0ds9WBjThfbkxDpfpe+UK3t9JtI+w3f
	6jHx/jeMnsD5Us3AB1WYFzOBXBfE8u288km4Y6w3S+UjurhqVjBRclSWIJwjWhpmx8IcY00WzwM
	wd80JsfiBdTLZtVVuYkGj6ysHQA==
X-Received: by 2002:a05:6214:2f02:b0:67a:1458:aacd with SMTP id od2-20020a0562142f0200b0067a1458aacdmr3565269qvb.1.1700849799547;
        Fri, 24 Nov 2023 10:16:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJ43dGQneaoWsZVvBliGQZdzl2B0g+563xfr5Uv9AkDlwk6RFuauEFWEn1YHQGStxmMuIbQg==
X-Received: by 2002:a05:6214:2f02:b0:67a:1458:aacd with SMTP id od2-20020a0562142f0200b0067a1458aacdmr3565222qvb.1.1700849799109;
        Fri, 24 Nov 2023 10:16:39 -0800 (PST)
Received: from x1n (cpe688f2e2cb7c3-cm688f2e2cb7c0.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id cp4-20020ad44ae4000000b0067a154df4cesm747802qvb.70.2023.11.24.10.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 10:16:38 -0800 (PST)
Date: Fri, 24 Nov 2023 13:16:35 -0500
From: Peter Xu <peterx@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in
 hugepd processing
Message-ID: <ZWDog_cz66g38d0I@x1n>
References: <20231116012908.392077-1-peterx@redhat.com>
 <20231116012908.392077-7-peterx@redhat.com>
 <ZVsYMMJpmFV2T/Zc@infradead.org>
 <ZVzT5_3Zn-Y-6xth@x1n>
 <ZV21GCbG48nTLDzn@infradead.org>
 <ZV4co7wcI-_wK91F@x1n>
 <57be0ed0-f1d7-4583-9a5f-3ed7deb0ea97@csgroup.eu>
 <ZV-p7haI5SmIYACs@x1n>
 <1a1cbd2c-ef59-4b73-bffc-a375bf81243c@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <1a1cbd2c-ef59-4b73-bffc-a375bf81243c@csgroup.eu>
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, James Houghton <jthoughton@google.com>, Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Vlastimil Babka <vbabka@suse.cz>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, Christophe, Michael, Aneesh,

[I'll reply altogether here]

On Fri, Nov 24, 2023 at 07:03:11AM +0000, Christophe Leroy wrote:
> I added that code with commit e17eae2b8399 ("mm: pagewalk: fix walk for 
> hugepage tables") because I was getting crazy displays when dumping 
> /sys/kernel/debug/pagetables
> 
> Huge pages can be used for many thing.
> 
> On powerpc 8xx, there are 4 possible page size: 4k, 16k, 512k and 8M.
> Each PGD entry addresses 4M areas, so hugepd is used for anything using 
> 8M pages. Could have used regular page tables instead, but it is not 
> worth allocating a 4k table when the HW will only read first entry.
> 
> At the time being, linear memory mapping is performed with 8M pages, so 
> ptdump_walk_pgd() will walk into huge page directories.
> 
> Also, huge pages can be used in vmalloc() and in vmap(). At the time 
> being we support 512k pages there on the 8xx. 8M pages will be supported 
> once vmalloc() and vmap() support hugepd, as explained in commit 
> a6a8f7c4aa7e ("powerpc/8xx: add support for huge pages on VMAP and VMALLOC")
> 
> So yes as a conclusion hugepd is used outside hugetlbfs, hope it 
> clarifies things.

Yes it does, thanks a lot for all of your replies.

So I think this is what I missed: on Freescale ppc 8xx there's a special
hugepd_populate_kernel() defined to install kernel pgtables for hugepd.
Obviously I didn't check further than hugepd_populate() when I first
looked, and stopped at the first instance of hugepd_populate() definition
on the 64 bits ppc.

For this specific patch: I suppose the change is still all fine to reuse
the fast-gup function, because it is still true when there's a VMA present
(GUP applies only to user mappings, nothing like KASAN should ever pop up).
So AFAIU it's still true that hugepd is only used in hugetlb pages in this
case even for Freescale 8xx, and nothing should yet explode.  So maybe I
can still keep the code changes.

However the comment at least definitely needs fixing (that I'm going to add
some, which hch requested and I agree), that is not yet in the patch I
posted here but I'll refine them locally.

For the whole work: the purpose of it is to start merging hugetlb pgtable
processing with generic mm.  That is my take of previous lsfmm discussions
in the community on how we should move forward with hugetlb in the future,
to avoid code duplications against generic mm.  Hugetlb is kind of blocked
on adding new (especially, large) features in general because of such
complexity.  This is all about that, but a small step towards it.

I see that it seems a trend to make hugepd more general.  Christophe's fix
on dump pgtable is exactly what I would also look for if keep going.  I
hope that's the right way to go.

I'll also need to think more on how this will affect my plan, currently it
seems all fine: I won't ever try to change any kernel mapping specific
code. I suppose any hugetlbfs based test should still cover all codes I
will touch on hugepd.  Then it should just work for kernel mappings on
Freescales; it'll be great if e.g. Christophe can help me double check that
if the series can stablize in a few versions.  If any of you have any hint
on testing it'll be more than welcomed, either specific test case or hints;
currently I'm still at a phase looking for a valid ppc systems - QEMU tcg
ppc64 emulation on x86 is slow enough to let me give up already.

Considering hugepd's specialty in ppc and the possibility that I'll break
it, there's yet another option which is I only apply the new logic into
archs with !ARCH_HAS_HUGEPD.  It'll make my life easier, but that also
means even if my attempt would work out anything new will by default rule
ppc out.  And we'll have a bunch of "#ifdef ARCH_HAS_HUGEPD" in generic
code, which is not preferred either.  For gup, it might be relatively easy
when comparing to the rest. I'm still hesitating for the long term plan.

Please let me know if you have any thoughts on any of above.

Thanks!

-- 
Peter Xu

