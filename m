Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A379731D34
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 17:57:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HtfzZGG4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qhn4d6Myhz3cFf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 01:57:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HtfzZGG4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qhmwr2S3gz3bnL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 01:51:08 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3543D615C3;
	Thu, 15 Jun 2023 15:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A065C433C0;
	Thu, 15 Jun 2023 15:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686844263;
	bh=4vpbcLIWH8N9kUhfy14gCg44JnNZ7tmcDbTQofjr2PY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HtfzZGG4h7OB0EE/lQpmPVeug5hEItWTKVdQh4sHq5pkRyi+IBc4bQYhPGfLUyXAE
	 O6q85QbbLOckkkq+ZDCntMP7kzjRH0BvUgQTZTsRtxOQVhMz+kPywYdC329KKPHRCd
	 EzHAMzGxIY08qUxBzBs5hhcSI+TdpRxjxhxRYluzPI7qsWgQhBwbTOga8HmP1oqokR
	 Nfn1KKfQ7SfISyWUrNFe+l7vvHqttosQ0oHQWcCUmbPCzjqzV6ZQmJ6Lgxc8I7me24
	 3i0BNy8Yi/K34Ad5bteBhAQILk/jkgdXefVdp3M52mTzK8Ji4AXkYMW3KmuCjB1GQn
	 39zP25YPwdB6Q==
Date: Thu, 15 Jun 2023 08:50:59 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH v2 07/23] mips: update_mmu_cache() can replace
 __update_tlb()
Message-ID: <20230615155059.GB3665766@dev-arch.thelio-3990X>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
 <178970b0-1539-8aac-76fd-972c6c46ec17@google.com>
 <20230614231758.GA1503611@dev-arch.thelio-3990X>
 <f5526f17-9d78-f7ea-427a-7e76bfeb6b8@google.com>
 <344a4da-3890-45fd-607e-b5f85ca6ad48@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <344a4da-3890-45fd-607e-b5f85ca6ad48@google.com>
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 14, 2023 at 10:43:30PM -0700, Hugh Dickins wrote:
> On Wed, 14 Jun 2023, Hugh Dickins wrote:
> > On Wed, 14 Jun 2023, Nathan Chancellor wrote:
> > > 
> > > I just bisected a crash while powering down a MIPS machine in QEMU to
> > > this change as commit 8044511d3893 ("mips: update_mmu_cache() can
> > > replace __update_tlb()") in linux-next.
> > 
> > Thank you, Nathan, that's very helpful indeed.  This patch certainly knew
> > that it wanted testing, and I'm glad to hear that it is now seeing some.
> > 
> > While powering down?  The messages below look like it was just coming up,
> > but no doubt that's because you were bisecting (or because I'm unfamiliar
> > with what messages to expect there).  It's probably irrelevant information,
> > but I wonder whether the (V)machine worked well enough for a while before
> > you first powered down and spotted the problem, or whether it's never got
> > much further than trying to run init (busybox)?  I'm trying to get a feel
> > for whether the problem occurs under common or uncommon conditions.

Ugh sorry, I have been looking into too many bugs lately and got my
wires crossed :) this is indeed a problem when running init (which is
busybox, this is a simple Buildroot file system).

> > > Unfortunately, I can still
> > > reproduce it with the existing fix you have for this change on the
> > > mailing list, which is present in next-20230614.
> > 
> > Right, that later fix was only for a build warning, nothing functional
> > (or at least I hoped that it wasn't making any functional difference).
> > 
> > Thanks a lot for the detailed instructions below: unfortunately, those
> > would draw me into a realm of testing I've never needed to enter before,
> > so a lot of time spent on setup and learning.  Usually, I just stare at
> > the source.
> > 
> > What this probably says is that I should revert most my cleanup there,
> > and keep as close to the existing code as possible.  But some change is
> > needed, and I may need to understand (or have a good guess at) what was
> > going wrong, to decide what kind of retreat will be successful.
> > 
> > Back to the source for a while: I hope I'll find examples in nearby MIPS
> > kernel source (and git history), which will hint at the right way forward.
> > Then send you a patch against next-20230614 to try, when I'm reasonably
> > confident that it's enough to satisfy my purpose, but likely not to waste
> > your time.
> 
> I'm going to take advantage of your good nature by attaching
> two alternative patches, either to go on top of next-20230614.
> 
> mips1.patch,
>  arch/mips/mm/tlb-r4k.c |   12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
> 
> is by far my favourite.  I couldn't see anything wrong with what's
> already there for mips, but it seems possible that (though I didn't
> find it) somewhere calls update_mmu_cache_pmd() on a page table.  So
> mips1.patch restores the pmd_huge() check, and cleans up further by
> removing the silly pgdp, p4dp, pudp, pmdp stuff: the pointer has now
> been passed in by the caller, why walk the tree again?  I should have
> done it this way before.
> 
> But if that doesn't work, then I'm afraid it will have to be
> mips2.patch,
>  arch/mips/include/asm/pgtable.h |   15 ++++++++++++---
>  arch/mips/mm/tlb-r3k.c          |    5 ++---
>  arch/mips/mm/tlb-r4k.c          |   27 ++++++++++++++++++---------
>  3 files changed, 32 insertions(+), 15 deletions(-)
> 
> which reverts all of the original patch and its build warning fix,
> and does a pte_unmap() to balance the silly pte_offset_map() there;
> with an apologetic comment for this being about the only place in
> the tree where I have no idea what to do if ptep were NULL.
> 
> I do hope that you find the first fixes the breakage; but if not, then

I hate to be the bearer of bad news but the first patch did not fix the
breakage, I see the same issue.

> I even more fervently hope that the second will, despite my hating it.
> Touch wood for the first, fingers crossed for the second, thanks,

Thankfully, the second one does. Thanks for the quick and thoughtful
responses!

Cheers,
Nathan
