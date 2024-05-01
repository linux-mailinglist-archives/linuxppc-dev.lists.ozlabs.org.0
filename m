Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 427E28B8E06
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 18:21:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WKHpb2ew;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VV2Pv6LDHz3cZ9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2024 02:21:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WKHpb2ew;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VV2PB5jw4z3cBG
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2024 02:21:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5E582619A6;
	Wed,  1 May 2024 16:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D4FC072AA;
	Wed,  1 May 2024 16:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714580458;
	bh=+KLk4uQ2wW8PXcdwtau/h24DL899RgJEYXvoHjcirzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WKHpb2ewJPA0fGgOsiNQkMYOMlevveSSWWt5Wu2v2ioIKC0kYX3z26GfYeF3Zz1wm
	 75Lwt1NXBicoH0yK9/eOdetC9KJlw+g3mzFr2szZaFS36AnSuw38f9dJSWc+JAhU54
	 JV9UD3BTCIB/4k9GnCWh5Z8+ceH9HsV4ev2Kh5nL05g2K2AXw5V/JfPuDTeSWPiNXZ
	 ql+lp8iF2GXQ5dXOnIgf8bSyTDfnt0Fl7WslI6OzhGw9py1HDm+KhcNQ4RfSiskbJ9
	 YWSd3y0avaDOlDmOTLGxGgR/Tb/O9vr4R9H1JHLGPL/4I1Wvyw6VtCH2gQT9Uovy/n
	 OwmvNaGLYrMpQ==
Date: Wed, 1 May 2024 09:20:56 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Set _IO_BASE to POISON_POINTER_DELTA not 0 for
 CONFIG_PCI=n
Message-ID: <20240501162056.GA2458112@dev-arch.thelio-3990X>
References: <20240430140440.200871-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430140440.200871-1-mpe@ellerman.id.au>
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
Cc: naresh.kamboju@linaro.org, linuxppc-dev@lists.ozlabs.org, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Wed, May 01, 2024 at 12:04:40AM +1000, Michael Ellerman wrote:
> With -Wextra clang warns about pointer arithmetic using a null pointer.
> When building with CONFIG_PCI=n, that triggers a warning in the IO
> accessors, eg:
> 
>   In file included from linux/arch/powerpc/include/asm/io.h:672:
>   linux/arch/powerpc/include/asm/io-defs.h:23:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      23 | DEF_PCI_AC_RET(inb, u8, (unsigned long port), (port), pio, port)
>         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   ...
>   linux/arch/powerpc/include/asm/io.h:591:53: note: expanded from macro '__do_inb'
>     591 | #define __do_inb(port)          readb((PCI_IO_ADDR)_IO_BASE + port);
>         |                                       ~~~~~~~~~~~~~~~~~~~~~ ^
> 
> That is because when CONFIG_PCI=n, _IO_BASE is defined as 0.
> 
> There is code that builds with calls to IO accessors even when
> CONFIG_PCI=n, but the actual calls are guarded by runtime checks.
> If not those calls would be faulting, because the page at virtual
> address zero is (usually) not mapped into the kernel. As Arnd pointed
> out, it is possible a large port value could cause the address to be
> above mmap_min_addr which would then access userspace, which would be
> a bug.
> 
> To avoid any such issues, and also fix the compiler warning, set the
> _IO_BASE to POISON_POINTER_DELTA. That is a value chosen to point into
> unmapped space between the kernel and userspace, so any access will
> always fault.
> 
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Closes: https://lore.kernel.org/all/CA+G9fYtEh8zmq8k8wE-8RZwW-Qr927RLTn+KqGnq1F=ptaaNsA@mail.gmail.com
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/include/asm/io.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
> index 08c550ed49be..1cd6eb6c8101 100644
> --- a/arch/powerpc/include/asm/io.h
> +++ b/arch/powerpc/include/asm/io.h
> @@ -37,7 +37,7 @@ extern struct pci_dev *isa_bridge_pcidev;
>   * define properly based on the platform
>   */
>  #ifndef CONFIG_PCI
> -#define _IO_BASE	0
> +#define _IO_BASE	POISON_POINTER_DELTA

This works for CONFIG_PPC64 but not CONFIG_PPC32 (so tinyconfig and
allnoconfig like Naresh reported) because CONFIG_ILLEGAL_POINTER_VALUE
is defined as 0 in that case.

  $ grep -P 'CONFIG_(ILLEGAL_POINTER_VALUE|PCI|PPC32)' .config
  CONFIG_PPC32=y
  CONFIG_ILLEGAL_POINTER_VALUE=0

>  #define _ISA_MEM_BASE	0
>  #define PCI_DRAM_OFFSET 0
>  #elif defined(CONFIG_PPC32)
> -- 
> 2.44.0
> 
