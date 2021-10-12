Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0A5429E59
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 09:11:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HT6Jw6MGlz2ywf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 18:11:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rRwZvaVE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HT6JF0wqMz2xtC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 18:10:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=rRwZvaVE; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HT6JC4hV3z4xbT;
 Tue, 12 Oct 2021 18:10:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1634022636;
 bh=ZYvG5vqpEVtFsi2i8PDCJ+ItpwALv0k7O1f+80SFrLE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=rRwZvaVEkjdhrKAOp6diupDVvQZ7hXvLlOSoI+G2mukZWZFsN0eEU06RIDbHspKjs
 ohYnOZrJlr3f6adzvVRf8A4tSsKLfC7WVT/S7692qI01dvIlmOy8Dysfr86uJgy9Gt
 djKTiV2y9Pj8qtTeJQAPPX3dNSFSCXxSuoBvSda0cjjclcohiQ6lYRdKfh2nEuxdj/
 hrjop70jfHtkPQpQ/vA9zlLreU6hcaGPNRsmwihNYJW1h5pp66jzfp+84nEMubWGpB
 TjuTt7dqbGcp56zjRh3S7ZLFQax2txG9i3NYKxN9PVox4BrvUZQ0Tme/n+o+5ZJi6O
 ijoJZj4FLkcXw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Andrew
 Morton <akpm@linux-foundation.org>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 01/10] powerpc: Move 'struct ppc64_opd_entry' back
 into asm/elf.h
In-Reply-To: <8ff3ec195d695033b652e9971fba2dc5528f7151.1633964380.git.christophe.leroy@csgroup.eu>
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
 <8ff3ec195d695033b652e9971fba2dc5528f7151.1633964380.git.christophe.leroy@csgroup.eu>
Date: Tue, 12 Oct 2021 18:10:32 +1100
Message-ID: <878ryy7m6v.fsf@mpe.ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> 'struct ppc64_opd_entry' doesn't belong to uapi/asm/elf.h

Agree, but ...

> It was initially in module_64.c and commit 2d291e902791 ("Fix compile
> failure with non modular builds") moved it into asm/elf.h
>
> But it was by mistake added outside of __KERNEL__ section,
> therefore commit c3617f72036c ("UAPI: (Scripted) Disintegrate
> arch/powerpc/include/asm") moved it to uapi/asm/elf.h

... it's been visible to userspace since the first commit moved it, ~13
years ago in 2008, v2.6.27.

> Move it back into asm/elf.h, this brings it back in line with
> IA64 and PARISC architectures.

Removing it from the uapi header risks breaking userspace, I doubt
anything uses it, but who knows.

Given how long it's been there I think it's a bit risky to remove it :/

> diff --git a/arch/powerpc/include/asm/elf.h b/arch/powerpc/include/asm/elf.h
> index b8425e3cfd81..64b523848cd7 100644
> --- a/arch/powerpc/include/asm/elf.h
> +++ b/arch/powerpc/include/asm/elf.h
> @@ -176,4 +176,11 @@ do {									\
>  /* Relocate the kernel image to @final_address */
>  void relocate(unsigned long final_address);
>  
> +/* There's actually a third entry here, but it's unused */
> +struct ppc64_opd_entry
> +{
> +	unsigned long funcaddr;
> +	unsigned long r2;
> +};
> +
>  #endif /* _ASM_POWERPC_ELF_H */
> diff --git a/arch/powerpc/include/uapi/asm/elf.h b/arch/powerpc/include/uapi/asm/elf.h
> index 860c59291bfc..308857123a08 100644
> --- a/arch/powerpc/include/uapi/asm/elf.h
> +++ b/arch/powerpc/include/uapi/asm/elf.h
> @@ -289,12 +289,4 @@ typedef elf_fpreg_t elf_vsrreghalf_t32[ELF_NVSRHALFREG];
>  /* Keep this the last entry.  */
>  #define R_PPC64_NUM		253
>  
> -/* There's actually a third entry here, but it's unused */
> -struct ppc64_opd_entry
> -{
> -	unsigned long funcaddr;
> -	unsigned long r2;
> -};

Rather than removing it we can make it uapi only with:

#ifndef __KERNEL__
/* There's actually a third entry here, but it's unused */
struct ppc64_opd_entry
{
	unsigned long funcaddr;
	unsigned long r2;
};
#endif


And then we can do whatever we want with the kernel internal version.

cheers
