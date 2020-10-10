Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E50C728A022
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Oct 2020 13:12:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C7j2B29djzDqwF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Oct 2020 22:12:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=cmarinas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=arm.com
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C7hzp29xdzDqv8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Oct 2020 22:09:58 +1100 (AEDT)
Received: from gaia (unknown [95.149.105.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E49B22227;
 Sat, 10 Oct 2020 11:09:52 +0000 (UTC)
Date: Sat, 10 Oct 2020 12:09:50 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Khalid Aziz <khalid.aziz@oracle.com>
Subject: Re: [PATCH 1/2] mm/mprotect: Call arch_validate_prot under mmap_lock
 and with length
Message-ID: <20201010110949.GA32545@gaia>
References: <20201007073932.865218-1-jannh@google.com>
 <d5332a7b-c300-6d28-18b9-4b7d4110ef86@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5332a7b-c300-6d28-18b9-4b7d4110ef86@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Jann Horn <jannh@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Anthony Yznaga <anthony.yznaga@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Khalid,

On Wed, Oct 07, 2020 at 02:14:09PM -0600, Khalid Aziz wrote:
> On 10/7/20 1:39 AM, Jann Horn wrote:
> > arch_validate_prot() is a hook that can validate whether a given set of
> > protection flags is valid in an mprotect() operation. It is given the set
> > of protection flags and the address being modified.
> > 
> > However, the address being modified can currently not actually be used in
> > a meaningful way because:
> > 
> > 1. Only the address is given, but not the length, and the operation can
> >    span multiple VMAs. Therefore, the callee can't actually tell which
> >    virtual address range, or which VMAs, are being targeted.
> > 2. The mmap_lock is not held, meaning that if the callee were to check
> >    the VMA at @addr, that VMA would be unrelated to the one the
> >    operation is performed on.
> > 
> > Currently, custom arch_validate_prot() handlers are defined by
> > arm64, powerpc and sparc.
> > arm64 and powerpc don't care about the address range, they just check the
> > flags against CPU support masks.
> > sparc's arch_validate_prot() attempts to look at the VMA, but doesn't take
> > the mmap_lock.
> > 
> > Change the function signature to also take a length, and move the
> > arch_validate_prot() call in mm/mprotect.c down into the locked region.
[...]
> As Chris pointed out, the call to arch_validate_prot() from do_mmap2()
> is made without holding mmap_lock. Lock is not acquired until
> vm_mmap_pgoff(). This variance is uncomfortable but I am more
> uncomfortable forcing all implementations of validate_prot to require
> mmap_lock be held when non-sparc implementations do not have such need
> yet. Since do_mmap2() is in powerpc specific code, for now this patch
> solves a current problem.

I still think sparc should avoid walking the vmas in
arch_validate_prot(). The core code already has the vmas, though not
when calling arch_validate_prot(). That's one of the reasons I added
arch_validate_flags() with the MTE patches. For sparc, this could be
(untested, just copied the arch_validate_prot() code):

static inline bool arch_validate_flags(unsigned long vm_flags)
{
	if (!(vm_flags & VM_SPARC_ADI))
		return true;

	if (!adi_capable())
		return false;

	/* ADI can not be enabled on PFN mapped pages */
	if (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
		return false;

	/*
	 * Mergeable pages can become unmergeable if ADI is enabled on
	 * them even if they have identical data on them. This can be
	 * because ADI enabled pages with identical data may still not
	 * have identical ADI tags on them. Disallow ADI on mergeable
	 * pages.
	 */
	if (vma->vm_flags & VM_MERGEABLE)
		return false;

	return true;
}

> That leaves open the question of should
> generic mmap call arch_validate_prot and return EINVAL for invalid
> combination of protection bits, but that is better addressed in a
> separate patch.

The above would cover mmap() as well.

The current sparc_validate_prot() relies on finding the vma for the
corresponding address. However, if you call this early in the mmap()
path, there's no such vma. It is only created later in mmap_region()
which no longer has the original PROT_* flags (all converted to VM_*
flags).

Calling arch_validate_flags() on mmap() has a small side-effect on the
user ABI: if the CPU is not adi_capable(), PROT_ADI is currently ignored
on mmap() but rejected by sparc_validate_prot(). Powerpc already does
this already and I think it should be fine for arm64 (it needs checking
though as we have another flag, PROT_BTI, hopefully dynamic loaders
don't pass this flag unconditionally).

However, as I said above, it doesn't solve the mmap() PROT_ADI checking
for sparc since there's no vma yet. I'd strongly recommend the
arch_validate_flags() approach and reverting the "start" parameter added
to arch_validate_prot() if you go for the flags route.

Thanks.

-- 
Catalin
