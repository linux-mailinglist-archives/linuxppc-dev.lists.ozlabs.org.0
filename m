Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D42FC66FCC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 15:12:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lYHp6r6KzDqy9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 23:12:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lYD00VYYzDqpg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 23:09:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45lYCz49PFz9s3l;
 Fri, 12 Jul 2019 23:09:19 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: mm: Limit rma_size to 1TB when running without
 HV mode
In-Reply-To: <20190710052018.14628-1-sjitindarsingh@gmail.com>
References: <20190710052018.14628-1-sjitindarsingh@gmail.com>
Date: Fri, 12 Jul 2019 23:09:18 +1000
Message-ID: <87o91ze6wx.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: sjitindarsingh@gmail.com, kvm-ppc@vger.kernel.org,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Suraj Jitindar Singh <sjitindarsingh@gmail.com> writes:
> The virtual real mode addressing (VRMA) mechanism is used when a
> partition is using HPT (Hash Page Table) translation and performs
> real mode accesses (MSR[IR|DR] = 0) in non-hypervisor mode. In this
> mode effective address bits 0:23 are treated as zero (i.e. the access
> is aliased to 0) and the access is performed using an implicit 1TB SLB
> entry.
>
> The size of the RMA (Real Memory Area) is communicated to the guest as
> the size of the first memory region in the device tree. And because of
> the mechanism described above can be expected to not exceed 1TB. In the
> event that the host erroneously represents the RMA as being larger than
> 1TB, guest accesses in real mode to memory addresses above 1TB will be
> aliased down to below 1TB. This means that a memory access performed in
> real mode may differ to one performed in virtual mode for the same memory
> address, which would likely have unintended consequences.
>
> To avoid this outcome have the guest explicitly limit the size of the
> RMA to the current maximum, which is 1TB. This means that even if the
> first memory block is larger than 1TB, only the first 1TB should be
> accessed in real mode.
>
> Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>

I added:

Fixes: c3ab300ea555 ("powerpc: Add POWER9 cputable entry")
Cc: stable@vger.kernel.org # v4.6+


Which is not exactly correct, but probably good enough?

cheers

> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index 28ced26f2a00..4d0e2cce9cd5 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -1901,11 +1901,19 @@ void hash__setup_initial_memory_limit(phys_addr_t first_memblock_base,
>  	 *
>  	 * For guests on platforms before POWER9, we clamp the it limit to 1G
>  	 * to avoid some funky things such as RTAS bugs etc...
> +	 * On POWER9 we limit to 1TB in case the host erroneously told us that
> +	 * the RMA was >1TB. Effective address bits 0:23 are treated as zero
> +	 * (meaning the access is aliased to zero i.e. addr = addr % 1TB)
> +	 * for virtual real mode addressing and so it doesn't make sense to
> +	 * have an area larger than 1TB as it can't be addressed.
>  	 */
>  	if (!early_cpu_has_feature(CPU_FTR_HVMODE)) {
>  		ppc64_rma_size = first_memblock_size;
>  		if (!early_cpu_has_feature(CPU_FTR_ARCH_300))
>  			ppc64_rma_size = min_t(u64, ppc64_rma_size, 0x40000000);
> +		else
> +			ppc64_rma_size = min_t(u64, ppc64_rma_size,
> +					       1UL << SID_SHIFT_1T);
>  
>  		/* Finally limit subsequent allocations */
>  		memblock_set_current_limit(ppc64_rma_size);
> -- 
> 2.13.6
