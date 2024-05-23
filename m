Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id DB6F68CDB0C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 21:46:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ACRUEcZ+;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Oyq203z1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vldnw5cm6z797b
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 05:41:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ACRUEcZ+;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Oyq203z1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VldnD3ZB1z78sS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 05:40:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716493227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OCvWufVacLGgXuxtEqrctwgkg9qLQ+urbHg5QGQf0Ok=;
	b=ACRUEcZ+WrwZAHUK07Kn73ORZmovWt0pXNMWauij/ncolqRIpjxzqUfL9x31q9gbCP+Rgx
	nP6ZWO3+ZlhOD512ahtdcLsraghQw0g8A2c6eEJhe3ZBo0n1vVi/se6m5NIcNw4/6rjYxk
	m3xxfkvCPtwd5WwBAm8jZ7BffcD/cOU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716493228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OCvWufVacLGgXuxtEqrctwgkg9qLQ+urbHg5QGQf0Ok=;
	b=Oyq203z1YImHmzRtMPlBf/xfIrJ5ko5f7hWuPDGTmNSfr+JS/H5wj7QFTZfs5isvj1h9eP
	lCWGiE1y7b78jAEB1wdNKlhdqqRYTT5bF91HOPSTddXDibfFNFDjPd3S+cwVe8jamkZBwN
	+x773Xa8OKXddLA/QYgSvOk5O9qg3nw=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-R48lQ9yeM9-IKux65e9-rA-1; Thu, 23 May 2024 15:40:25 -0400
X-MC-Unique: R48lQ9yeM9-IKux65e9-rA-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3c9b5776fccso258872b6e.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 12:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716493225; x=1717098025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCvWufVacLGgXuxtEqrctwgkg9qLQ+urbHg5QGQf0Ok=;
        b=DzxviD8O249nM1KOpTWTCpKrhWSCdMauvxz9+5MJnspeb8L6pcWspNaktUZRz/gqNs
         zjCNrlE8Bve/afCVFnFB+vWS7QMS6Nbc5XihlGFnD/sehBBZywDookw+j00ZZ4xvFZkb
         oxOnevOLNFx2ngPzmVgwYQHjuX4uPqAngB/PrNa53c8fGXlMwOcQkolG1KEUXVZacws9
         CJokzd+ALEPjZ4KeKdo+NT4Cfg4v5ZG2DzH6SeB1/OqAN1gqEuXVuaixp0eJ7Z+RddJa
         jbI5VcYyNvkVPMpFF6jUWn/xQ3vq8iEu9vbJZtvNeIBjFlzte8+yfdWjyV0G0LI6EnZB
         flGw==
X-Forwarded-Encrypted: i=1; AJvYcCUl6Y+KthU/Q8sefu1bARzUhcwwyRM6rbCcYuZiw1NlaZIpLwDBPc+0yZZlmw8IXUmIDonTTSP4KKqsc9+DwG4k5eNMXs2eAW1JHX2tSA==
X-Gm-Message-State: AOJu0YyrHQ9yjqP7TlWt302gNdQzcmwic19TUdHZlATM5cgzKACYSwev
	WxIiPTG8SyqrN5EbnwR/RVaC1IW7+Dg8nj57Xt1ZyirFkm8eLCAYf6Msb0dr23kVXg7hM7IoE0/
	/nw59JwXNTieKEzicBZZ1N1nLYuR4YawO1lNG0wod7DEJ6bJgCWGauAE/OOiqj0A=
X-Received: by 2002:a05:6808:3087:b0:3c8:4cc6:4f0c with SMTP id 5614622812f47-3d1a966af20mr343308b6e.5.1716493224718;
        Thu, 23 May 2024 12:40:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5T0Za11sb8Fsxy+MXgLZp568ubN3owF+qKZJ+eJpG1Em8U4RQw4I+vJsVrvCB0c6vSaNEQg==
X-Received: by 2002:a05:6808:3087:b0:3c8:4cc6:4f0c with SMTP id 5614622812f47-3d1a966af20mr343274b6e.5.1716493224004;
        Thu, 23 May 2024 12:40:24 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf2a3e3esm1517490185a.68.2024.05.23.12.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 12:40:23 -0700 (PDT)
Date: Thu, 23 May 2024 15:40:20 -0400
From: Peter Xu <peterx@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v2 00/20] Reimplement huge pages without hugepd on
 powerpc (8xx, e500, book3s/64)
Message-ID: <Zk-bpBZ_yjsj_B2z@x1n>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <cover.1715971869.git.christophe.leroy@csgroup.eu>
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 17, 2024 at 08:59:54PM +0200, Christophe Leroy wrote:
> This is the continuation of the RFC v1 series "Reimplement huge pages
> without hugepd on powerpc 8xx". It now get rid of hugepd completely
> after handling also e500 and book3s/64
> 
> Unlike most architectures, powerpc 8xx HW requires a two-level
> pagetable topology for all page sizes. So a leaf PMD-contig approach
> is not feasible as such.
> 
> Possible sizes are 4k, 16k, 512k and 8M.
> 
> First level (PGD/PMD) covers 4M per entry. For 8M pages, two PMD entries
> must point to a single entry level-2 page table. Until now that was
> done using hugepd. This series changes it to use standard page tables
> where the entry is replicated 1024 times on each of the two pagetables
> refered by the two associated PMD entries for that 8M page.
> 
> At the moment it has to look into each helper to know if the
> hugepage ptep is a PTE or a PMD in order to know it is a 8M page or
> a lower size. I hope this can me handled by core-mm in the future.
> 
> For e500 and book3s/64 there are less constraints because it is not
> tied to the HW assisted tablewalk like on 8xx, so it is easier to use
> leaf PMDs (and PUDs).
> 
> On e500 the supported page sizes are 4M, 16M, 64M, 256M and 1G. All at
> PMD level on e500/32 and mix of PMD and PUD for e500/64. We encode page
> size with 4 available bits in PTE entries. On e300/32 PGD entries size
> is increases to 64 bits in order to allow leaf-PMD entries because PTE
> are 64 bits on e500.
> 
> On book3s/64 only the hash-4k mode is concerned. It supports 16M pages
> as cont-PMD and 16G pages as cont-PUD. In other modes (radix-4k, radix-6k
> and hash-64k) the sizes match with PMD and PUD sizes so that's just leaf
> entries.
> 
> Christophe Leroy (20):
>   mm: Provide pagesize to pmd_populate()
>   mm: Provide page size to pte_alloc_huge()
>   mm: Provide pmd to pte_leaf_size()
>   mm: Provide mm_struct and address to huge_ptep_get()
>   powerpc/mm: Allow hugepages without hugepd
>   powerpc/8xx: Fix size given to set_huge_pte_at()
>   powerpc/8xx: Rework support for 8M pages using contiguous PTE entries
>   powerpc/8xx: Simplify struct mmu_psize_def
>   powerpc/mm: Remove _PAGE_PSIZE
>   powerpc/mm: Fix __find_linux_pte() on 32 bits with PMD leaf entries
>   powerpc/mm: Complement huge_pte_alloc() for all non HUGEPD setups
>   powerpc/64e: Remove unneeded #ifdef CONFIG_PPC_E500
>   powerpc/64e: Clean up impossible setups
>   powerpc/e500: Remove enc field from struct mmu_psize_def
>   powerpc/85xx: Switch to 64 bits PGD
>   powerpc/e500: Encode hugepage size in PTE bits
>   powerpc/e500: Use contiguous PMD instead of hugepd
>   powerpc/64s: Use contiguous PMD/PUD instead of HUGEPD
>   powerpc/mm: Remove hugepd leftovers
>   mm: Remove CONFIG_ARCH_HAS_HUGEPD

Great to see this series, thanks again Christophe.

I requested for help on the lsfmm hugetlb unification session, but
unfortunately I don't think there were Power people around.. I'd like to
request help from Power developers again here on the list: it will be very
appreciated if you can help have a look at this series.

It's a direct dependent work to the hugetlb refactoring that we'll be
working on, while it looks like the hugetlb refactoring is something the
community as a whole would like to see in the near future.

We don't want to add more Power-only CONFIG_ARCH_HAS_HUGEPD checks for
hugetlb in any new code.

Currently Oscar offered help on that hugetlb project, and Oscar will start
to work on page_walk API refactoring.  I guess currently the simple way is
we'll work on top of Christophe's series.  Some proper review on this
series will definitely make it clearer on what we should do next.

Thanks,

-- 
Peter Xu

