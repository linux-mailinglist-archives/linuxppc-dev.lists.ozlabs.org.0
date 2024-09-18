Return-Path: <linuxppc-dev+bounces-1426-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E9097B6D2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2024 04:33:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X7jPp5nq0z2yDM;
	Wed, 18 Sep 2024 12:33:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726626814;
	cv=none; b=YgH9oa6FQkQSFUxRYml0GvPsTdkUxEJ6lg++YixdM8b6Vj5owCP/VNSMG7C1VSuE913Sb5CpU7QcXvvtl1pUfIUvK6rOImF9XvqfNuphO5+bOqSbtQwoLRdGkALuEQr7XUU/aOre6knX4pzHddeTIzjJrhkVgvYcHe21VGdcoTAcITpbdQprHkmqHRVUYXR4NA933fmlfINO8BvbZqTurFtQLIQNHhPYJHHAUKjJQRFyKiVjY62vCkb0aUUPpJ7P6GTtgivFUFoKFSUhrrbqoIp6/UZX3vaoqnU/Nn8Q4pq/lTkXPIsujqW9JT4wG10n5ehkZv58ZebFoaST0P40ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726626814; c=relaxed/relaxed;
	bh=nTH4cSKPkyYveYR5hN8FWjwVaXptyW8BZiIACU0AG/Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EkMjQxOmOak4puZRpWDZ1XSZGfGmSZ6JiIoON18/I96rmNGdN/ZLNahi961mxAxdDdoscW1kDy1S5+MeodiXaYea1i6FJlXWVaFJTe5kc+Ss3Az5YNAqv1uLaVmCd0KiCuRq5xqT1os8B8nw3BJoRdg65Le26kJz2RY8N5lAjRiy3bs019t3ZLEFs5xmXyDJfLuwGjAmLYoTfGUuRY0MuxBnPQ8piaCfmmIEtX2XUjG2WZLut197mDk492X/H6/45uOhb5eu9F2PIXHf3xDHLWhCi2eKmTvWy95rnpMLgiqodazpRHKPbdDvh4+x/dFkrsTjdIFuwsvASYY+AQ7GKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IZVfUi4q; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IZVfUi4q;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X7jPn2D7lz2xYl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2024 12:33:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726626811;
	bh=nTH4cSKPkyYveYR5hN8FWjwVaXptyW8BZiIACU0AG/Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IZVfUi4qsnAdIKkAtZcG2JdzpmXjE6seVDSNsIrrxavUQl0TMF/PfePlH9Ghc+k25
	 /kbSEW8+RswLDcA4DUdT7T17RW/knaMT4gdH62IOkLtBbivOm+VowCGgsqcaZjehEm
	 XWfVp5Un8fMU3Is5LrnaOGsvUBGusq7vdChOtsM9UawIVSMuIWbYnPhRjHTe3EehrA
	 U0Mxs+GzhpdcJ/sslUd9TfsTcI+CtF+wgWIJflTMCiytBTji8WFgWCSbJJTN7ell+b
	 Uqv8YOONEtyCu66R0ETwREElfA2T2bBc+SQbPmfk72FhxfASHZX1scthO+ZH/F4L9/
	 Y+sm8drVOroXA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X7jPl1HxQz4wcL;
	Wed, 18 Sep 2024 12:33:30 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Peter Bergner
 <bergner@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH] powerpc/vdso: Should VDSO64 functions be flagged as
 functions like VDSO32 ?
In-Reply-To: <6fa86f3de610ffc180ae0f5dbd511453e7473b36.1726208058.git.christophe.leroy@csgroup.eu>
References: <6fa86f3de610ffc180ae0f5dbd511453e7473b36.1726208058.git.christophe.leroy@csgroup.eu>
Date: Wed, 18 Sep 2024 12:33:27 +1000
Message-ID: <875xqtr8qw.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> On powerpc64 as shown below by readelf, vDSO functions symbols have
> type NOTYPE.
>
> $ powerpc64-linux-gnu-readelf -a arch/powerpc/kernel/vdso/vdso64.so.dbg
> ELF Header:
>   Magic:   7f 45 4c 46 02 02 01 00 00 00 00 00 00 00 00 00
>   Class:                             ELF64
>   Data:                              2's complement, big endian
>   Version:                           1 (current)
>   OS/ABI:                            UNIX - System V
>   ABI Version:                       0
>   Type:                              DYN (Shared object file)
>   Machine:                           PowerPC64
>   Version:                           0x1
> ...
>
> Symbol table '.dynsym' contains 12 entries:
>    Num:    Value          Size Type    Bind   Vis      Ndx Name
> ...
>      1: 0000000000000524    84 NOTYPE  GLOBAL DEFAULT    8 __[...]@@LINUX_2.6.15
> ...
>      4: 0000000000000000     0 OBJECT  GLOBAL DEFAULT  ABS LINUX_2.6.15
>      5: 00000000000006c0    48 NOTYPE  GLOBAL DEFAULT    8 __[...]@@LINUX_2.6.15
>
> Symbol table '.symtab' contains 56 entries:
>    Num:    Value          Size Type    Bind   Vis      Ndx Name
> ...
>     45: 0000000000000000     0 OBJECT  GLOBAL DEFAULT  ABS LINUX_2.6.15
>     46: 00000000000006c0    48 NOTYPE  GLOBAL DEFAULT    8 __kernel_getcpu
>     47: 0000000000000524    84 NOTYPE  GLOBAL DEFAULT    8 __kernel_clock_getres
>
> To overcome that, commit ba83b3239e65 ("selftests: vDSO: fix vDSO
> symbols lookup for powerpc64") was proposed to make selftests also
> look for NOTYPE symbols, but is it the correct fix ?
>
> VDSO32 functions are flagged as functions, why not VDSO64 functions ?
> Is it because VDSO functions are not traditional C functions using
> the standard API ?

Yes. There's some explanation in the original commit:

    Note that the symbols exposed by the vDSO aren't "normal" function symbols, apps
    can't be expected to link against them directly, the vDSO's are both seen
    as if they were linked at 0 and the symbols just contain offsets to the
    various functions.  This is done on purpose to avoid a relocation step
    (ppc64 functions normally have descriptors with abs addresses in them).
    When glibc uses those functions, it's expected to use it's own trampolines
    that know how to reach them.

From https://github.com/mpe/linux-fullhistory/commit/5f2dd691b62da9d9cc54b938f8b29c22c93cb805

The descriptors it's talking about are the OPD function descriptors used
on ABI v1 (big endian).

> But it is exactly the same for VDSO32 functions, allthough they are
> flagged as functions.
 
It's not quite the same because of the function descriptors.

On ppc64/ABIv1 a function pointer for "F" points to an opd, which then
points to ".F" which has the actual text. It's the ".F" symbol that has
type "function".

> So lets flag them as functions and revert the selftest change.
>
> What's your opinion on that ?

I think it's fine on ppc64le, I worry slightly that it risks breaking
glibc or something else on big endian.

It is more correct for the text symbol to have type function, even if
there's no function descriptor for it.

glibc has a special case already for handling the VDSO symbols which
creates a fake opd pointing at the kernel symbol. So changing the VDSO
symbol type to function shouldn't affect that AFAICS.

I think the only cause of breakage would be if something is explicitly
looking for NOTYPE symbols, which seems unlikely, but you never know.

So I think we could attempt to take this change for v6.13, giving it
lots of time to get some test coverage in next before going to mainline.

cheers



> It predates git kernel history and both VDSO32 and VDSO64 were brough by
> arch/ppc64/ with that difference already.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> commit ba83b3239e65 is in random git tree at the moment : https://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git/commit/?id=ba83b3239e657469709d15dcea5f9b65bf9dbf34
> On the list at : https://lore.kernel.org/lkml/fc1a0862516b1e11b336d409f2cb8aab10a97337.1725020674.git.christophe.leroy@csgroup.eu/T/#u
> ---
>  arch/powerpc/include/asm/vdso.h           | 1 +
>  tools/testing/selftests/vDSO/parse_vdso.c | 3 +--
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/vdso.h b/arch/powerpc/include/asm/vdso.h
> index 7650b6ce14c8..8d972bc98b55 100644
> --- a/arch/powerpc/include/asm/vdso.h
> +++ b/arch/powerpc/include/asm/vdso.h
> @@ -25,6 +25,7 @@ int vdso_getcpu_init(void);
>  #ifdef __VDSO64__
>  #define V_FUNCTION_BEGIN(name)		\
>  	.globl name;			\
> +	.type name,@function; 		\
>  	name:				\
>  
>  #define V_FUNCTION_END(name)		\
> diff --git a/tools/testing/selftests/vDSO/parse_vdso.c b/tools/testing/selftests/vDSO/parse_vdso.c
> index d9ccc5acac18..4ae417372e9e 100644
> --- a/tools/testing/selftests/vDSO/parse_vdso.c
> +++ b/tools/testing/selftests/vDSO/parse_vdso.c
> @@ -216,8 +216,7 @@ void *vdso_sym(const char *version, const char *name)
>  		ELF(Sym) *sym = &vdso_info.symtab[chain];
>  
>  		/* Check for a defined global or weak function w/ right name. */
> -		if (ELF64_ST_TYPE(sym->st_info) != STT_FUNC &&
> -		    ELF64_ST_TYPE(sym->st_info) != STT_NOTYPE)
> +		if (ELF64_ST_TYPE(sym->st_info) != STT_FUNC)
>  			continue;
>  		if (ELF64_ST_BIND(sym->st_info) != STB_GLOBAL &&
>  		    ELF64_ST_BIND(sym->st_info) != STB_WEAK)
> -- 
> 2.44.0

