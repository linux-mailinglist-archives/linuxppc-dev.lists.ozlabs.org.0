Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B45FD4C2BE4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 13:39:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4CCx0SJ7z3cDN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 23:39:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Z7jT6vn3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4CCH0hw4z2xDY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 23:39:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Z7jT6vn3; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K4CCD07MVz4xdl;
 Thu, 24 Feb 2022 23:39:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1645706360;
 bh=8EGa3eVWgTEde2gYL1wkBviDfIH/E8ovFgLPoK3d+ZA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Z7jT6vn3oi7dj7yRyZFUSJ33xHIOjzEkBxgWvQED7rbUeElVkn5TZSjvGL1xgTjTU
 03oa7LTrNlJnR5xoPnkT2cPYIWZpWl+0VkAnpTkpKUzASb9zNA+jtrRcjMyLU+9KZh
 QoeXdMDJ//OWfvhkt8lZwRbVAbA6nh5BeatTk1bKLM1SQdJNQzkH+sgatR9dJx1wOu
 iwe7fQ9bU3sa9rcDzhO6w27FgQDYgyKwNMg6TEh0pL9qBhm1hNdJ6EEjzpzFBMlosz
 8ybLHAXvgTLwGIQZ05zC+27evp33N91vl97MnWqYxfKWVV+3agjufpv1hUNGqdNlTL
 Xx1LzKpeo8xoQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH 2/3] powerpc: fix build errors
In-Reply-To: <20220223135820.2252470-2-anders.roxell@linaro.org>
References: <20220223135820.2252470-1-anders.roxell@linaro.org>
 <20220223135820.2252470-2-anders.roxell@linaro.org>
Date: Thu, 24 Feb 2022 23:39:16 +1100
Message-ID: <871qzsphfv.fsf@mpe.ellerman.id.au>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Anders,

Thanks for these, just a few comments below ...

Anders Roxell <anders.roxell@linaro.org> writes:
> Building tinyconfig with gcc (Debian 11.2.0-16) and assembler (Debian
> 2.37.90.20220207) the following build error shows up:
>
>  {standard input}: Assembler messages:
>  {standard input}:1190: Error: unrecognized opcode: `stbcix'
>  {standard input}:1433: Error: unrecognized opcode: `lwzcix'
>  {standard input}:1453: Error: unrecognized opcode: `stbcix'
>  {standard input}:1460: Error: unrecognized opcode: `stwcix'
>  {standard input}:1596: Error: unrecognized opcode: `stbcix'
>  ...
>
> Rework to add assembler directives [1] around the instruction. Going
> through the them one by one shows that the changes should be safe.  Like
> __get_user_atomic_128_aligned() is only called in p9_hmi_special_emu(),
> which according to the name is specific to power9.  And __raw_rm_read*()
> are only called in things that are powernv or book3s_hv specific.
>
> [1] https://sourceware.org/binutils/docs/as/PowerPC_002dPseudo.html#PowerPC_002dPseudo
>
> Cc: <stable@vger.kernel.org>
> Co-developed-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  arch/powerpc/include/asm/io.h        | 46 +++++++++++++++++++++++-----
>  arch/powerpc/include/asm/uaccess.h   |  3 ++
>  arch/powerpc/platforms/powernv/rng.c |  6 +++-
>  3 files changed, 46 insertions(+), 9 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
> index beba4979bff9..5ff6dec489f8 100644
> --- a/arch/powerpc/include/asm/io.h
> +++ b/arch/powerpc/include/asm/io.h
> @@ -359,25 +359,37 @@ static inline void __raw_writeq_be(unsigned long v, volatile void __iomem *addr)
>   */
>  static inline void __raw_rm_writeb(u8 val, volatile void __iomem *paddr)
>  {
> -	__asm__ __volatile__("stbcix %0,0,%1"
> +	__asm__ __volatile__(".machine \"push\"\n"
> +			     ".machine \"power6\"\n"
> +			     "stbcix %0,0,%1\n"
> +			     ".machine \"pop\"\n"
>  		: : "r" (val), "r" (paddr) : "memory");

As Segher said it'd be cleaner without the embedded quotes.

> @@ -441,7 +465,10 @@ static inline unsigned int name(unsigned int port)	\
>  	unsigned int x;					\
>  	__asm__ __volatile__(				\
>  		"sync\n"				\
> +		".machine \"push\"\n"			\
> +		".machine \"power6\"\n"			\
>  		"0:"	op "	%0,0,%1\n"		\
> +		".machine \"pop\"\n"			\
>  		"1:	twi	0,%0,0\n"		\
>  		"2:	isync\n"			\
>  		"3:	nop\n"				\
> @@ -465,7 +492,10 @@ static inline void name(unsigned int val, unsigned int port) \
>  {							\
>  	__asm__ __volatile__(				\
>  		"sync\n"				\
> +		".machine \"push\"\n"			\
> +		".machine \"power6\"\n"			\
>  		"0:" op " %0,0,%1\n"			\
> +		".machine \"pop\"\n"			\
>  		"1:	sync\n"				\
>  		"2:\n"					\
>  		EX_TABLE(0b, 2b)			\

It's not visible from the diff, but the above two are __do_in_asm and
__do_out_asm and are inside an ifdef CONFIG_PPC32.

AFAICS they're only used for:

__do_in_asm(_rec_inb, "lbzx")
__do_in_asm(_rec_inw, "lhbrx")
__do_in_asm(_rec_inl, "lwbrx")
__do_out_asm(_rec_outb, "stbx")
__do_out_asm(_rec_outw, "sthbrx")
__do_out_asm(_rec_outl, "stwbrx")

Which are all old instructions, so I don't think we need the machine
power6 for those two macros?

> diff --git a/arch/powerpc/platforms/powernv/rng.c b/arch/powerpc/platforms/powernv/rng.c
> index b4386714494a..5bf30ef6d928 100644
> --- a/arch/powerpc/platforms/powernv/rng.c
> +++ b/arch/powerpc/platforms/powernv/rng.c
> @@ -43,7 +43,11 @@ static unsigned long rng_whiten(struct powernv_rng *rng, unsigned long val)
>  	unsigned long parity;
>  
>  	/* Calculate the parity of the value */
> -	asm ("popcntd %0,%1" : "=r" (parity) : "r" (val));
> +	asm (".machine \"push\"\n"
> +	     ".machine \"power7\"\n"
> +	     "popcntd %0,%1\n"
> +	     ".machine \"pop\"\n"
> +	     : "=r" (parity) : "r" (val));

This was actually present in an older CPU, but it doesn't really matter,
this is fine.

cheers
