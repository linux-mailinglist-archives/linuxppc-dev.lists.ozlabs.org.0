Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CF488AD0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 12:35:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 465JQl43fHzDqRw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 20:35:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 465J645JLnzDqZp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2019 20:20:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 465J635hlcz9sNF; Sat, 10 Aug 2019 20:20:42 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: a26c29a00f20015a30e618caf7c0720a351e1d03
In-Reply-To: <20190516020437.11783-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64s: Make boot look nice(r)
Message-Id: <465J635hlcz9sNF@ozlabs.org>
Date: Sat, 10 Aug 2019 20:20:42 +1000 (AEST)
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-05-16 at 02:04:37 UTC, Nicholas Piggin wrote:
> Radix boot looks like this:
> 
>  -----------------------------------------------------
>  phys_mem_size     = 0x200000000
>  dcache_bsize      = 0x80
>  icache_bsize      = 0x80
>  cpu_features      = 0x0000c06f8f5fb1a7
>    possible        = 0x0000fbffcf5fb1a7
>    always          = 0x00000003800081a1
>  cpu_user_features = 0xdc0065c2 0xaee00000
>  mmu_features      = 0xbc006041
>  firmware_features = 0x0000000010000000
>  hash-mmu: ppc64_pft_size    = 0x0
>  hash-mmu: kernel vmalloc start   = 0xc008000000000000
>  hash-mmu: kernel IO start        = 0xc00a000000000000
>  hash-mmu: kernel vmemmap start   = 0xc00c000000000000
>  -----------------------------------------------------
> 
> Fix:
> 
>  -----------------------------------------------------
>  phys_mem_size     = 0x200000000
>  dcache_bsize      = 0x80
>  icache_bsize      = 0x80
>  cpu_features      = 0x0000c06f8f5fb1a7
>    possible        = 0x0000fbffcf5fb1a7
>    always          = 0x00000003800081a1
>  cpu_user_features = 0xdc0065c2 0xaee00000
>  mmu_features      = 0xbc006041
>  firmware_features = 0x0000000010000000
>  vmalloc start     = 0xc008000000000000
>  IO start          = 0xc00a000000000000
>  vmemmap start     = 0xc00c000000000000
>  -----------------------------------------------------
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/a26c29a00f20015a30e618caf7c0720a351e1d03

cheers
