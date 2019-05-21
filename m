Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F9D24E31
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 13:41:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457Ykc5rbmzDqMT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 21:41:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457YhZ3901zDqMt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 21:39:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 457YhZ0t26z9s9T; Tue, 21 May 2019 21:39:42 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 457YhY6vFMz9sB8; Tue, 21 May 2019 21:39:41 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: c179976cf4cbd2e65f29741d5bc07ccf8747a532
X-Patchwork-Hint: ignore
In-Reply-To: <20190517132958.22299-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/mm/hash: Fix get_region_id() for invalid
 addresses
Message-Id: <457YhY6vFMz9sB8@ozlabs.org>
Date: Tue, 21 May 2019 21:39:41 +1000 (AEST)
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
Cc: aneesh.kumar@linux.vnet.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-05-17 at 13:29:58 UTC, Michael Ellerman wrote:
> From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
> 
> Accesses by userspace to random addresses outside the user or kernel
> address range will generate an SLB fault. When we handle that fault we
> classify the effective address into several classes, eg. user, kernel
> linear, kernel virtual etc.
> 
> For addresses that are completely outside of any valid range, we
> should not insert an SLB entry at all, and instead immediately an
> exception.
> 
> In the past this was handled in two ways. Firstly we would check the
> top nibble of the address (using REGION_ID(ea)) and that would tell us
> if the address was user (0), kernel linear (c), kernel virtual (d), or
> vmemmap (f). If the address didn't match any of these it was invalid.
> 
> Then for each type of address we would do a secondary check. For the
> user region we check against H_PGTABLE_RANGE, for kernel linear we
> would mask the top nibble of the address and then check the address
> against MAX_PHYSMEM_BITS.
> 
> As part of commit 0034d395f89d ("powerpc/mm/hash64: Map all the kernel
> regions in the same 0xc range") we replaced REGION_ID() with
> get_region_id() and changed the masking of the top nibble to only mask
> the top two bits, which introduced a bug.
> 
> Addresses less than (4 << 60) are still handled correctly, they are
> either less than (1 << 60) in which case they are subject to the
> H_PGTABLE_RANGE check, or they are correctly checked against
> MAX_PHYSMEM_BITS.
> 
> However addresses from (4 << 60) to ((0xc << 60) - 1), are incorrectly
> treated as kernel linear addresses in get_region_id(). Then the top
> two bits are cleared by EA_MASK in slb_allocate_kernel() and the
> address is checked against MAX_PHYSMEM_BITS, which it passes due to
> the masking. The end result is we incorrectly insert SLB entries for
> those addresses.
> 
> That is not actually catastrophic, having inserted the SLB entry we
> will then go on to take a page fault for the address and at that point
> we detect the problem and report it as a bad fault.
> 
> Still we should not be inserting those entries, or treating them as
> kernel linear addresses in the first place. So fix get_region_id() to
> detect addresses in that range and return an invalid region id, which
> we cause use to not insert an SLB entry and directly report an
> exception.
> 
> Fixes: 0034d395f89d ("powerpc/mm/hash64: Map all the kernel regions in the same 0xc range")
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> [mpe: Drop change to EA_MASK for now, rewrite change log]
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Applied to powerpc fixes.

https://git.kernel.org/powerpc/c/c179976cf4cbd2e65f29741d5bc07ccf

cheers
