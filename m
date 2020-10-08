Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B35E28724C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 12:13:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6Rqw2TT3zDqVF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 21:13:48 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6RpC3J8XzDqBc
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 21:12:19 +1100 (AEDT)
Received: from gaia (unknown [95.149.105.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE8312145D;
 Thu,  8 Oct 2020 10:12:12 +0000 (UTC)
Date: Thu, 8 Oct 2020 11:12:10 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jann Horn <jannh@google.com>
Subject: Re: [PATCH 1/2] mm/mprotect: Call arch_validate_prot under mmap_lock
 and with length
Message-ID: <20201008101209.GD7661@gaia>
References: <20201007073932.865218-1-jannh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007073932.865218-1-jannh@google.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Khalid Aziz <khalid.aziz@oracle.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Anthony Yznaga <anthony.yznaga@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 07, 2020 at 09:39:31AM +0200, Jann Horn wrote:
> arch_validate_prot() is a hook that can validate whether a given set of
> protection flags is valid in an mprotect() operation. It is given the set
> of protection flags and the address being modified.
> 
> However, the address being modified can currently not actually be used in
> a meaningful way because:
> 
> 1. Only the address is given, but not the length, and the operation can
>    span multiple VMAs. Therefore, the callee can't actually tell which
>    virtual address range, or which VMAs, are being targeted.
> 2. The mmap_lock is not held, meaning that if the callee were to check
>    the VMA at @addr, that VMA would be unrelated to the one the
>    operation is performed on.
> 
> Currently, custom arch_validate_prot() handlers are defined by
> arm64, powerpc and sparc.
> arm64 and powerpc don't care about the address range, they just check the
> flags against CPU support masks.
> sparc's arch_validate_prot() attempts to look at the VMA, but doesn't take
> the mmap_lock.
> 
> Change the function signature to also take a length, and move the
> arch_validate_prot() call in mm/mprotect.c down into the locked region.

For arm64 mte, I noticed the arch_validate_prot() issue with multiple
vmas and addressed this in a different way:

https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?h=for-next/mte&id=c462ac288f2c97e0c1d9ff6a65955317e799f958
https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?h=for-next/mte&id=0042090548740921951f31fc0c20dcdb96638cb0

Both patches queued for 5.10.

Basically, arch_calc_vm_prot_bits() returns a VM_MTE if PROT_MTE has
been requested. The newly introduced arch_validate_flags() will check
the VM_MTE flag against what the system supports and this covers both
mmap() and mprotect(). Note that arch_validate_prot() only handles the
latter and I don't think it's sufficient for SPARC ADI. For arm64 MTE we
definitely wanted mmap() flags to be validated.

In addition, there's a new arch_calc_vm_flag_bits() which allows us to
set a VM_MTE_ALLOWED on a vma if the conditions are right (MAP_ANONYMOUS
or shmem_mmap():

https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?h=for-next/mte&id=b3fbbea4c00220f62e6f7e2514466e6ee81f7f60

-- 
Catalin
