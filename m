Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2F19003D8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 14:43:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=O8v4kHDn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vwgq33wkDz3cMQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 22:43:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=O8v4kHDn;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VwgpK2Tpzz30W5
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2024 22:42:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1717764169;
	bh=bqla57tOtU1mgzH0i+KepUx0yjfzWO1zi3pSk2wCH7k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=O8v4kHDnEusUpfTKv+k9ca6+DKUiHrGwKXNLOEj5uQVJnWaRRdXzLXMDqDNJrndoj
	 J4JanOe0eVBq1cm+iF7iDDkGMR/NGrQwNm2N3ZCmN0Kj6X1dCwSNcjWxtKEoqOHW4A
	 jREgJLFAA9rgjPccpjHmRcwgIM5r9GC2CW3aYpl9Py4LXWixl11AiYe7h2cbF8R5ny
	 wMYQhVEF5bZV5JDI7n7Rkg5zmJYIKBw4dph5bKg+DdsT85S58graDqz4dF3GxZxzoL
	 zc3LEhEG40+eUz0kTjrV3F+4yK1Chlt1GwPBU0ZiXNSN2vL4p/jERZzpzt+2W5igEq
	 BWfVHkKqAZtaw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VwgpG42nXz4wc3;
	Fri,  7 Jun 2024 22:42:46 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] powerpc: vdso: fix building with wrong-endian toolchain
In-Reply-To: <20240607061629.530301-1-arnd@kernel.org>
References: <20240607061629.530301-1-arnd@kernel.org>
Date: Fri, 07 Jun 2024 22:42:44 +1000
Message-ID: <87frtoq5yz.fsf@mail.lhotse>
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arnd Bergmann <arnd@kernel.org> writes:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Building powerpc64le kernels with the kernel.org crosstool toolchains
> no longer works as the linker attempts to build a big-endian vdso:
>
> powerpc-linux/lib/gcc/powerpc-linux/12.3.0/../../../../powerpc-linux/bin/ld: arch/powerpc/kernel/vdso/sigtramp32-32.o: compiled for a little endian system and target is big endian
> powerpc-linux/lib/gcc/powerpc-linux/12.3.0/../../../../powerpc-linux/bin/ld: failed to merge target specific data of file arch/powerpc/kernel/vdso/sigtramp32-32.o
>
> Apparently creating the vdso.lds files from the lds.S files fails to
> pass the -mlittle-endian argument here, so the output format gets set
> wrong. Changing the conditional to check for CONFIG_CPU_LITTLE_ENDIAN
> instead still works, as the kernel configuration definitions are visible.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I'm fairly sure this worked in the past, but I did not try to bisect the
> issue.

It still works for me.

I use the korg toolchains every day, and kisskb uses them too.

What commit / defconfig are you seeing the errors with?

Is it just the 12.3.0 toolchain or all of them? I just tested 12.3.0
here and it built OK.

I guess you're building on x86 or arm64? I build on ppc64le, I wonder if
that makes a difference.

The patch is probably OK regardless, but I'd rather understand what the
actual problem is.

cheers

> diff --git a/arch/powerpc/kernel/vdso/vdso32.lds.S b/arch/powerpc/kernel/vdso/vdso32.lds.S
> index 426e1ccc6971..5845ea2d1cba 100644
> --- a/arch/powerpc/kernel/vdso/vdso32.lds.S
> +++ b/arch/powerpc/kernel/vdso/vdso32.lds.S
> @@ -7,7 +7,7 @@
>  #include <asm/page.h>
>  #include <asm-generic/vmlinux.lds.h>
>  
> -#ifdef __LITTLE_ENDIAN__
> +#ifdef CONFIG_CPU_LITTLE_ENDIAN
>  OUTPUT_FORMAT("elf32-powerpcle", "elf32-powerpcle", "elf32-powerpcle")
>  #else
>  OUTPUT_FORMAT("elf32-powerpc", "elf32-powerpc", "elf32-powerpc")
> diff --git a/arch/powerpc/kernel/vdso/vdso64.lds.S b/arch/powerpc/kernel/vdso/vdso64.lds.S
> index bda6c8cdd459..82c418b18cce 100644
> --- a/arch/powerpc/kernel/vdso/vdso64.lds.S
> +++ b/arch/powerpc/kernel/vdso/vdso64.lds.S
> @@ -7,7 +7,7 @@
>  #include <asm/page.h>
>  #include <asm-generic/vmlinux.lds.h>
>  
> -#ifdef __LITTLE_ENDIAN__
> +#ifdef CONFIG_CPU_LITTLE_ENDIAN
>  OUTPUT_FORMAT("elf64-powerpcle", "elf64-powerpcle", "elf64-powerpcle")
>  #else
>  OUTPUT_FORMAT("elf64-powerpc", "elf64-powerpc", "elf64-powerpc")
> -- 
> 2.39.2
