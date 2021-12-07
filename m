Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E56DA46BC08
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 13:59:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7gNh6HWBz307C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 23:59:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VEDcZh3B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7gN13sDTz2yYS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Dec 2021 23:58:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=VEDcZh3B; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J7gN03tZ6z4xYy;
 Tue,  7 Dec 2021 23:58:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1638881920;
 bh=4kfHsIG8KSm5Wld+v0jrm4WSh/PzSIY1wGyaRwzZY+s=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=VEDcZh3BkrDzHhNMoF//9rjHguGdjMysaLjzMP0k9bajcm4sKxcTHpckkUM5JRqAG
 9YBgtOCieXDqGgs55UCOQ0A663YFv2gjrJURW2I/QwUnTFT0nua4J9YBvLsoO4dwyh
 HXBL64naivdFBd4QcyOlqxST8aDq1Z+FeH17h0k5w/0Wyyar/cL6DB+G62Pyy33ug7
 5PD9b+3mulUf9gSHCKcRIXBStAQvsrxHUZ/bSuw/jKVV1TOQakxMoab1H4Ap+n7OoQ
 uSyXmAo1znX5JbOTKEYBMKFp+jcU9yQbyqDRja4hqWWPAS2EP/uyL2Gxn7KPLbiL+0
 Fgzdn6ROa8s1g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6 17/18] powerpc/64s: Move hash MMU support code under
 CONFIG_PPC_64S_HASH_MMU
In-Reply-To: <20211201144153.2456614-18-npiggin@gmail.com>
References: <20211201144153.2456614-1-npiggin@gmail.com>
 <20211201144153.2456614-18-npiggin@gmail.com>
Date: Tue, 07 Dec 2021 23:58:37 +1100
Message-ID: <87fsr4o9ky.fsf@mpe.ellerman.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
> index 015d7d972d16..c480d21a146c 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
> @@ -239,8 +251,9 @@ static inline void setup_initial_memory_limit(phys_addr_t first_memblock_base,
>  	 * know which translations we will pick. Hence go with hash
>  	 * restrictions.
>  	 */
> -	return hash__setup_initial_memory_limit(first_memblock_base,
> -					   first_memblock_size);
> +	if (!radix_enabled())
> +		hash__setup_initial_memory_limit(first_memblock_base,
> +						 first_memblock_size);
>  }

This needs to use early_radix_enabled(), it's called before jump label
patching.

With the jump label feature check debugging on you get a warning:

  Booting Linux via __start() @ 0x0000000000400000 ...
  [    0.000000][    T0] Warning! mmu_has_feature() used prior to jump label init!
  [    0.000000][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted 5.16.0-rc2-00167-ga2397104dbef #149
  [    0.000000][    T0] Call Trace:
  [    0.000000][    T0] [c000000002843e20] [c000000000894d40] dump_stack_lvl+0x74/0xa8 (unreliable)
  [    0.000000][    T0] [c000000002843e60] [c000000002009a28] early_init_devtree+0x164/0x554
  [    0.000000][    T0] [c000000002843f10] [c00000000200b3d4] early_setup+0xc8/0x280
  [    0.000000][    T0] [c000000002843f90] [000000000000d368] 0xd368


Or otherwise a really obscure crash :D

cheers
