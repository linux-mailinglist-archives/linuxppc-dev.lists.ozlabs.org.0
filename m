Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5987257E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 05:47:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45thBL3V4HzDqFB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 13:47:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tFgf62j6zDqQT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 20:53:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45tFgc4qyyz9s4Y;
 Tue, 23 Jul 2019 20:53:00 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH 1/4] powerpc/64s/radix: Fix memory hotplug section
 page table creation
In-Reply-To: <20190722174700.11483-2-npiggin@gmail.com>
References: <20190722174700.11483-1-npiggin@gmail.com>
 <20190722174700.11483-2-npiggin@gmail.com>
Date: Tue, 23 Jul 2019 20:52:59 +1000
Message-ID: <87tvbd58fo.fsf@concordia.ellerman.id.au>
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
Cc: Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Reza Arbab <arbab@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> create_physical_mapping expects physical addresses, but creating and
> splitting these mappings after boot is supplying virtual (effective)
> addresses. This can be hit by booting with limited memory then probing
> new physical memory sections.
>
> Cc: Reza Arbab <arbab@linux.vnet.ibm.com>
> Fixes: 6cc27341b21a8 ("powerpc/mm: add radix__create_section_mapping()")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

This is not catastrophic because create_physical_mapping() just uses
start/end to construct virtual addresses anyway, and __va(__va(x)) == __va(x) ?

Although we do pass those through as region_start/end which then go to
memblock_alloc_try_nid(). But I guess that doesn't happen after boot,
which is the case you're talking about.

So I think looks good, change log could use a bit more detail though :)

cheers

> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index b4ca9e95e678..c5cc16ab1954 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -902,7 +902,7 @@ int __meminit radix__create_section_mapping(unsigned long start, unsigned long e
>  		return -1;
>  	}
>  
> -	return create_physical_mapping(start, end, nid);
> +	return create_physical_mapping(__pa(start), __pa(end), nid);
>  }
>  
>  int __meminit radix__remove_section_mapping(unsigned long start, unsigned long end)
> -- 
> 2.20.1
