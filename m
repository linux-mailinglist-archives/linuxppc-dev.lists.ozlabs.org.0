Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5AC4A06A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 14:11:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Sn4K5tpZzDqNJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 22:11:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Sn0K6RPfzDqQr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 22:08:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45Sn0K2sfJz9s3C;
 Tue, 18 Jun 2019 22:08:01 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/mm: Ensure Huge-page memory is free before
 allocation
In-Reply-To: <20190618044609.19997-1-vaibhav@linux.ibm.com>
References: <20190618044609.19997-1-vaibhav@linux.ibm.com>
Date: Tue, 18 Jun 2019 22:07:54 +1000
Message-ID: <87v9x3p04l.fsf@concordia.ellerman.id.au>
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
Cc: Hari Bathini <hbathini@linux.vnet.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.vnet.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vaibhav Jain <vaibhav@linux.ibm.com> writes:
> We recently discovered an bug where physical memory meant for
> allocation of Huge-pages was inadvertently allocated by another component
> during early boot.

Can you give me some more detail on what that was? You're seemingly the
only person who's ever hit this :)

> The behavior of memblock_reserve() where it wont
> indicate whether an existing reserved block overlaps with the
> requested reservation only makes such bugs hard to investigate.
>
> Hence this patch proposes adding a memblock reservation check in
> htab_dt_scan_hugepage_blocks() just before call to memblock_reserve()
> to ensure that the physical memory thats being reserved for is not
> already reserved by someone else. In case this happens we panic the
> the kernel to ensure that user of this huge-page doesn't accidentally
> stomp on memory allocated to someone else.

Do we really need to panic? Can't we just leave the block alone and not
register it as huge page memory? With a big warning obviously.

cheers

> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index 28ced26f2a00..a05be3adb8c9 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -516,6 +516,11 @@ static int __init htab_dt_scan_hugepage_blocks(unsigned long node,
>  	printk(KERN_INFO "Huge page(16GB) memory: "
>  			"addr = 0x%lX size = 0x%lX pages = %d\n",
>  			phys_addr, block_size, expected_pages);
> +
> +	/* Ensure no one else has reserved memory for huge pages before */
> +	BUG_ON(memblock_is_region_reserved(phys_addr,
> +					   block_size * expected_pages));
> +
>  	if (phys_addr + block_size * expected_pages <= memblock_end_of_DRAM()) {
>  		memblock_reserve(phys_addr, block_size * expected_pages);
>  		pseries_add_gpage(phys_addr, block_size, expected_pages);
> -- 
> 2.21.0
