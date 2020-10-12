Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A2028BEFA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 19:24:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C95BY1SkzzDqMp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 04:24:05 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C958g3GJqzDqgF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 04:22:27 +1100 (AEDT)
Received: from gaia (unknown [95.149.105.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 733BF20674;
 Mon, 12 Oct 2020 17:22:21 +0000 (UTC)
Date: Mon, 12 Oct 2020 18:22:18 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Khalid Aziz <khalid.aziz@oracle.com>
Subject: Re: [PATCH 1/2] mm/mprotect: Call arch_validate_prot under mmap_lock
 and with length
Message-ID: <20201012172218.GE6493@gaia>
References: <20201007073932.865218-1-jannh@google.com>
 <d5332a7b-c300-6d28-18b9-4b7d4110ef86@oracle.com>
 <20201010110949.GA32545@gaia>
 <af207cf8-3049-85eb-349d-5fed6b9be49c@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af207cf8-3049-85eb-349d-5fed6b9be49c@oracle.com>
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

On Mon, Oct 12, 2020 at 11:03:33AM -0600, Khalid Aziz wrote:
> On 10/10/20 5:09 AM, Catalin Marinas wrote:
> > On Wed, Oct 07, 2020 at 02:14:09PM -0600, Khalid Aziz wrote:
> >> On 10/7/20 1:39 AM, Jann Horn wrote:
> >>> arch_validate_prot() is a hook that can validate whether a given set of
> >>> protection flags is valid in an mprotect() operation. It is given the set
> >>> of protection flags and the address being modified.
> >>>
> >>> However, the address being modified can currently not actually be used in
> >>> a meaningful way because:
> >>>
> >>> 1. Only the address is given, but not the length, and the operation can
> >>>    span multiple VMAs. Therefore, the callee can't actually tell which
> >>>    virtual address range, or which VMAs, are being targeted.
> >>> 2. The mmap_lock is not held, meaning that if the callee were to check
> >>>    the VMA at @addr, that VMA would be unrelated to the one the
> >>>    operation is performed on.
> >>>
> >>> Currently, custom arch_validate_prot() handlers are defined by
> >>> arm64, powerpc and sparc.
> >>> arm64 and powerpc don't care about the address range, they just check the
> >>> flags against CPU support masks.
> >>> sparc's arch_validate_prot() attempts to look at the VMA, but doesn't take
> >>> the mmap_lock.
> >>>
> >>> Change the function signature to also take a length, and move the
> >>> arch_validate_prot() call in mm/mprotect.c down into the locked region.
> > [...]
> >> As Chris pointed out, the call to arch_validate_prot() from do_mmap2()
> >> is made without holding mmap_lock. Lock is not acquired until
> >> vm_mmap_pgoff(). This variance is uncomfortable but I am more
> >> uncomfortable forcing all implementations of validate_prot to require
> >> mmap_lock be held when non-sparc implementations do not have such need
> >> yet. Since do_mmap2() is in powerpc specific code, for now this patch
> >> solves a current problem.
> > 
> > I still think sparc should avoid walking the vmas in
> > arch_validate_prot(). The core code already has the vmas, though not
> > when calling arch_validate_prot(). That's one of the reasons I added
> > arch_validate_flags() with the MTE patches. For sparc, this could be
> > (untested, just copied the arch_validate_prot() code):
> 
> I am little uncomfortable with the idea of validating protection bits
> inside the VMA walk loop in do_mprotect_pkey(). When ADI is being
> enabled across multiple VMAs and arch_validate_flags() fails on a VMA
> later, do_mprotect_pkey() will bail out with error leaving ADI enabled
> on earlier VMAs. This will apply to protection bits other than ADI as
> well of course. This becomes a partial failure of mprotect() call. I
> think it should be all or nothing with mprotect() - when one calls
> mprotect() from userspace, either the entire address range passed in
> gets its protection bits updated or none of it does. That requires
> validating protection bits upfront or undoing what earlier iterations of
> VMA walk loop might have done.

I thought the same initially but mprotect() already does this with the
VM_MAY* flag checking. If you ask it for an mprotect() that crosses
multiple vmas and one of them fails, it doesn't roll back the changes to
the prior ones. I considered that a similar approach is fine for MTE
(it's most likely a user error).

-- 
Catalin
