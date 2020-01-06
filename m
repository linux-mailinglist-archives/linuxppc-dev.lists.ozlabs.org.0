Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B32130D5E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 07:04:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rlMJ0hs8zDqDq
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 17:04:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="LsnFF2ge"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47rlKH3dhDzDqCC
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2020 17:02:26 +1100 (AEDT)
Received: from rapoport-lnx (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5EBE120848;
 Mon,  6 Jan 2020 06:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578290544;
 bh=zI7gBUNWlwkd3lFKva8XGnIwM1FVpFdgHUCAPBjSOs4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LsnFF2geI19fPlwyYS15EN2J122xcAAudU7qPjc8Yg8rj5+ulcbot7RHDI/0f0a4C
 CzKbNb50SqVOcIHiHpJY8bFWvC6xxVOQQiQTcEG7yINVvo5T+t1qoSg+qcErMRoY42
 338+xYqXNsf3EA8fzviqqEB6MSOOfTBSjuQLpYEE=
Date: Mon, 6 Jan 2020 08:02:18 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: add support for folded p4d page tables
Message-ID: <20200106060217.GA5444@rapoport-lnx>
References: <20191209150908.6207-1-rppt@kernel.org>
 <20200102081059.GA12063@rapoport-lnx>
 <87v9ppi7ky.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v9ppi7ky.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 06, 2020 at 02:31:41PM +1100, Michael Ellerman wrote:
> Mike Rapoport <rppt@kernel.org> writes:
> > Any updates on this?
> 
> It's very ... big, and kind of intrusive.

I've tried to split it to several smaller ones, but I couldn't find a way
to do it without breaking bisectability.

As for the intrusive, most of the changes are mechanical
 
> It's not an improvement as far as the powerpc code's readability is
> concerned. I assume the plan is that the 5-level hack can eventually be
> removed and so this conversion is a prerequisite for that?
 
Yep, the idea is to remove asm-generic/pgtable-nop4d-hack.h and
asm-generic/5level-fixup.h.

And, there is a small benefit for powerpc as kernel size is reduced a bit,
e.g. for pseries_defconfig:

$ size old/vmlinux new/vmlinux
   text	   data	    bss	    dec	    hex	filename
13702955	5961022	1517520	21181497	1433439  old/vmlinux
13702507	5961006	1517520	21181033	1433269  new/vmlinux

> cheers
> 
> > On Mon, Dec 09, 2019 at 05:09:08PM +0200, Mike Rapoport wrote:
> >> From: Mike Rapoport <rppt@linux.ibm.com>
> >> 
> >> Implement primitives necessary for the 4th level folding, add walks of p4d
> >> level where appropriate and replace 5level-fixup.h with pgtable-nop4d.h.
> >> 
> >> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> >> ---
> >>  arch/powerpc/include/asm/book3s/32/pgtable.h  |  1 -
> >>  arch/powerpc/include/asm/book3s/64/hash.h     |  4 +-
> >>  arch/powerpc/include/asm/book3s/64/pgalloc.h  |  4 +-
> >>  arch/powerpc/include/asm/book3s/64/pgtable.h  | 58 ++++++++++--------
> >>  arch/powerpc/include/asm/book3s/64/radix.h    |  6 +-
> >>  arch/powerpc/include/asm/nohash/32/pgtable.h  |  1 -
> >>  arch/powerpc/include/asm/nohash/64/pgalloc.h  |  2 +-
> >>  .../include/asm/nohash/64/pgtable-4k.h        | 32 +++++-----
> >>  arch/powerpc/include/asm/nohash/64/pgtable.h  |  6 +-
> >>  arch/powerpc/include/asm/pgtable.h            |  8 +++
> >>  arch/powerpc/kvm/book3s_64_mmu_radix.c        | 59 ++++++++++++++++---
> >>  arch/powerpc/lib/code-patching.c              |  7 ++-
> >>  arch/powerpc/mm/book3s32/mmu.c                |  2 +-
> >>  arch/powerpc/mm/book3s32/tlb.c                |  4 +-
> >>  arch/powerpc/mm/book3s64/hash_pgtable.c       |  4 +-
> >>  arch/powerpc/mm/book3s64/radix_pgtable.c      | 19 ++++--
> >>  arch/powerpc/mm/book3s64/subpage_prot.c       |  6 +-
> >>  arch/powerpc/mm/hugetlbpage.c                 | 28 +++++----
> >>  arch/powerpc/mm/kasan/kasan_init_32.c         |  8 +--
> >>  arch/powerpc/mm/mem.c                         |  4 +-
> >>  arch/powerpc/mm/nohash/40x.c                  |  4 +-
> >>  arch/powerpc/mm/nohash/book3e_pgtable.c       | 15 +++--
> >>  arch/powerpc/mm/pgtable.c                     | 25 +++++++-
> >>  arch/powerpc/mm/pgtable_32.c                  | 28 +++++----
> >>  arch/powerpc/mm/pgtable_64.c                  | 10 ++--
> >>  arch/powerpc/mm/ptdump/hashpagetable.c        | 20 ++++++-
> >>  arch/powerpc/mm/ptdump/ptdump.c               | 22 ++++++-
> >>  arch/powerpc/xmon/xmon.c                      | 17 +++++-
> >>  28 files changed, 284 insertions(+), 120 deletions(-)
> 

-- 
Sincerely yours,
Mike.
