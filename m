Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D82480DCA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Dec 2021 23:46:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JNqQc2Bz2z2yqC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Dec 2021 09:46:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=F3ek6iwW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JNqPx19Hpz2ymk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Dec 2021 09:45:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=F3ek6iwW; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JNqPq3Hplz4xgY;
 Wed, 29 Dec 2021 09:45:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1640731552;
 bh=qljWZbGI1apBrOJgjHe30U4ij1VSVO919oknE97+iHQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=F3ek6iwWIBiBhsWe3OP0jJps5GD6L/20yTHI/laLt8I/rf28G/oNlmGekUPpPdZ7b
 6n7My31upouYpmhUha3XH4uD1jXAUirYKKROigV5cOaJ5UDW6d0YNp0/vj3GKBFo+5
 blWmm2QF2qlPQbgb/yRvISQ5fxcup4hztkOnchqJyDA9QQqrWhSdcfw5BxWrLetH3R
 e/MgyNxVMRuYKkVvTGtXhMPuwLEE6RynP7tLN2uQgPGwLpZdda4fOFv4F4nc3F1Z6a
 2+E58iycqZZLi/c71z0OCCU/S01jdY/BA5uzNhC+ZRcmpG7S7fmM94KZG1uePk/3Uv
 ggNN6h07PNuUw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v2] powerpc/32s: Fix kasan_init_region() for KASAN
In-Reply-To: <90826d123e3e28b840f284412b150a1e13ed62fb.1638799954.git.christophe.leroy@csgroup.eu>
References: <90826d123e3e28b840f284412b150a1e13ed62fb.1638799954.git.christophe.leroy@csgroup.eu>
Date: Wed, 29 Dec 2021 09:45:51 +1100
Message-ID: <87pmpg1h7k.fsf@mpe.ellerman.id.au>
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
Cc: Maxime Bizon <mbizon@freebox.fr>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> It has been reported some configuration where the kernel doesn't
> boot with KASAN enabled.
>
> This is due to wrong BAT allocation for the KASAN area:
>
> 	---[ Data Block Address Translation ]---
> 	0: 0xc0000000-0xcfffffff 0x00000000       256M Kernel rw      m
> 	1: 0xd0000000-0xdfffffff 0x10000000       256M Kernel rw      m
> 	2: 0xe0000000-0xefffffff 0x20000000       256M Kernel rw      m
> 	3: 0xf8000000-0xf9ffffff 0x2a000000        32M Kernel rw      m
> 	4: 0xfa000000-0xfdffffff 0x2c000000        64M Kernel rw      m
>
> A BAT must have both virtual and physical addresses alignment matching
> the size of the BAT. This is not the case for BAT 4 above.
>
> Fix kasan_init_region() by using block_size() function that is in
> book3s32/mmu.c. To be able to reuse it here, make it non static and
> change its name to bat_block_size() in order to avoid name conflict
> with block_size() defined in <linux/blkdev.h>
>
> Also reuse find_free_bat() to avoid an error message from setbat()
> when no BAT is available.
>
> And allocate memory outside of linear memory mapping to avoid
> wasting that precious space.
>
> With this change we get correct alignment for BATs and KASAN shadow
> memory is allocated outside the linear memory space.
>
> 	---[ Data Block Address Translation ]---
> 	0: 0xc0000000-0xcfffffff 0x00000000       256M Kernel rw
> 	1: 0xd0000000-0xdfffffff 0x10000000       256M Kernel rw
> 	2: 0xe0000000-0xefffffff 0x20000000       256M Kernel rw
> 	3: 0xf8000000-0xfbffffff 0x7c000000        64M Kernel rw
> 	4: 0xfc000000-0xfdffffff 0x7a000000        32M Kernel rw
>
> Reported-by: Maxime Bizon <mbizon@freebox.fr>
> Fixes: 7974c4732642 ("powerpc/32s: Implement dedicated kasan_init_region()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2:
> - Allocate kasan shadow memory outside precious kernel linear memory
> - Properly zeroise kasan shadow memory
> ---
>  arch/powerpc/include/asm/book3s/32/mmu-hash.h |  2 +
>  arch/powerpc/mm/book3s32/mmu.c                | 10 ++--
>  arch/powerpc/mm/kasan/book3s_32.c             | 58 ++++++++++---------
>  3 files changed, 38 insertions(+), 32 deletions(-)

Sorry this now conflicts with other changes in next. Can you rebase it please?

cheers
