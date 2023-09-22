Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 317AA7AADC5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 11:24:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=HC7A5qwR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsRfT0Jblz3dW5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 19:24:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=HC7A5qwR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsRdc5b5rz3cjV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 19:23:16 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4C159621B4;
	Fri, 22 Sep 2023 09:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32460C433C7;
	Fri, 22 Sep 2023 09:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695374593;
	bh=dXskQX5Hl5xkPtfaxV8tcYegxNU8vst41m8wxd6lccM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HC7A5qwRYefrtsRKDVgbV8LB3GlGNnwCiuzuBjBf//079Vr5pHlHx7w33piVwkMSg
	 KdakR66MrSNSkYJO3jbZwCr/w2VTw33wUH/TvBJA0dAAYl+WQ5Z5GVudGyrcU4/vOf
	 0KADD+v5vZCFHY1cz6sqX/igDr/hO6uHWrXxgxmY=
Date: Fri, 22 Sep 2023 11:23:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v1 0/8] Fix set_huge_pte_at() panic on arm64
Message-ID: <2023092208-sitcom-playpen-b62d@gregkh>
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
 <20230921093026.230b2991be551093e397f462@linux-foundation.org>
 <7c5c2c00-d657-44fd-b478-743b43c57e8a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c5c2c00-d657-44fd-b478-743b43c57e8a@arm.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Peter Xu <peterx@redhat.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Helge Deller <deller@gmx.de>, Christoph Hellwig <hch@infradead.org>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, linux-parisc@vger.kernel.org, Muchun Song <muchun.so
 ng@linux.dev>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 21, 2023 at 05:35:54PM +0100, Ryan Roberts wrote:
> On 21/09/2023 17:30, Andrew Morton wrote:
> > On Thu, 21 Sep 2023 17:19:59 +0100 Ryan Roberts <ryan.roberts@arm.com> wrote:
> > 
> >> Hi All,
> >>
> >> This series fixes a bug in arm64's implementation of set_huge_pte_at(), which
> >> can result in an unprivileged user causing a kernel panic. The problem was
> >> triggered when running the new uffd poison mm selftest for HUGETLB memory. This
> >> test (and the uffd poison feature) was merged for v6.6-rc1. However, upon
> >> inspection there are multiple other pre-existing paths that can trigger this
> >> bug.
> >>
> >> Ideally, I'd like to get this fix in for v6.6 if possible? And I guess it should
> >> be backported too, given there are call sites where this can theoretically
> >> happen that pre-date v6.6-rc1 (I've cc'ed stable@vger.kernel.org).
> > 
> > This gets you a naggygram from Greg.  The way to request a backport is
> > to add cc:stable to all the changelogs.  I'll make that change to my copy.
> 
> Ahh, sorry about that... I just got the same moan from the kernel test robot too.
> 
> > 
> > 
> >> Ryan Roberts (8):
> >>   parisc: hugetlb: Convert set_huge_pte_at() to take vma
> >>   powerpc: hugetlb: Convert set_huge_pte_at() to take vma
> >>   riscv: hugetlb: Convert set_huge_pte_at() to take vma
> >>   s390: hugetlb: Convert set_huge_pte_at() to take vma
> >>   sparc: hugetlb: Convert set_huge_pte_at() to take vma
> >>   mm: hugetlb: Convert set_huge_pte_at() to take vma
> >>   arm64: hugetlb: Convert set_huge_pte_at() to take vma
> >>   arm64: hugetlb: Fix set_huge_pte_at() to work with all swap entries
> >>
> >>  arch/arm64/include/asm/hugetlb.h              |  2 +-
> >>  arch/arm64/mm/hugetlbpage.c                   | 22 ++++----------
> >>  arch/parisc/include/asm/hugetlb.h             |  2 +-
> >>  arch/parisc/mm/hugetlbpage.c                  |  4 +--
> >>  .../include/asm/nohash/32/hugetlb-8xx.h       |  3 +-
> >>  arch/powerpc/mm/book3s64/hugetlbpage.c        |  2 +-
> >>  arch/powerpc/mm/book3s64/radix_hugetlbpage.c  |  2 +-
> >>  arch/powerpc/mm/nohash/8xx.c                  |  2 +-
> >>  arch/powerpc/mm/pgtable.c                     |  7 ++++-
> >>  arch/riscv/include/asm/hugetlb.h              |  2 +-
> >>  arch/riscv/mm/hugetlbpage.c                   |  3 +-
> >>  arch/s390/include/asm/hugetlb.h               |  8 +++--
> >>  arch/s390/mm/hugetlbpage.c                    |  8 ++++-
> >>  arch/sparc/include/asm/hugetlb.h              |  8 +++--
> >>  arch/sparc/mm/hugetlbpage.c                   |  8 ++++-
> >>  include/asm-generic/hugetlb.h                 |  6 ++--
> >>  include/linux/hugetlb.h                       |  6 ++--
> >>  mm/damon/vaddr.c                              |  2 +-
> >>  mm/hugetlb.c                                  | 30 +++++++++----------
> >>  mm/migrate.c                                  |  2 +-
> >>  mm/rmap.c                                     | 10 +++----
> >>  mm/vmalloc.c                                  |  5 +++-
> >>  22 files changed, 80 insertions(+), 64 deletions(-)
> > 
> > Looks scary but it's actually a fairly modest patchset.  It could
> > easily be all rolled into a single patch for ease of backporting. 
> > Maybe Greg has an opinion?
> 
> Yes, I thought about doing that; or perhaps 2 patches - one for the interface
> change across all arches and core code, and one for the actual bug fix?

I have no issues with taking patch series, or one big patch, into stable
trees, they just have to match up with what is in Linus's tree.

so if it makes more sense to have this as a series (like you did here),
wonderful, make it a patch series.  Do not go out of your way to do
things differently just for stable kernels, that is not necessary or
needed at all.

thanks,

greg k-h
