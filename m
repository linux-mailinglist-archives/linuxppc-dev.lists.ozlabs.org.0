Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D012359C2E3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 17:34:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBGcN5ZsSz3cFK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 01:34:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ouIW1BYa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ouIW1BYa;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBGbn5jNmz3bq5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Aug 2022 01:33:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 470E96114C;
	Mon, 22 Aug 2022 15:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA02EC43470;
	Mon, 22 Aug 2022 15:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661182419;
	bh=L+xylg2Ga9OgepjcsWkpAAwkZaOwU0VdxyIlnOTzoP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ouIW1BYa0TIGv3Bm6vn3QC9pMFbE1oMr/c9uk71Rv5zPHKUnr1YQfDzYxH1Ln79ez
	 GxNdHDxBheoFb+j/l0QdnN/SjDf6p+fIiQIwTCIXF1U4Q0g6LEx2BcxFbfHmG4dWnt
	 kw+xF9MDswN2XT1xew9ctStO5YzlCUnmzMzpYX/m5serD0eBCVHOuxb8urUr3VmZZe
	 v0/QPB6TixrIGyeNZZdAOx4dAban0IQdEQzDpBtEm/97Wp8VKJ5o5+RqwrnKkkL8So
	 TZ+94BoGITKV28Pq7V4IofHuV2a3un2vt3b6HiA2aV2MIKIZmFYTsn+lHBWIxJRPtf
	 73A2gZAQ3hx0g==
Received: by pali.im (Postfix)
	id 1590597B; Mon, 22 Aug 2022 17:33:36 +0200 (CEST)
Date: Mon, 22 Aug 2022 17:33:35 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Add support for early debugging via Serial
 16550 console
Message-ID: <20220822153335.v5gc26jfbbqyj3et@pali>
References: <20220819211254.22192-1-pali@kernel.org>
 <b23ecdd1-fe34-f0f7-be7f-da8624096447@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b23ecdd1-fe34-f0f7-be7f-da8624096447@csgroup.eu>
User-Agent: NeoMutt/20180716
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
Cc: Nick Child <nick.child@ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday 22 August 2022 14:25:57 Christophe Leroy wrote:
> Le 19/08/2022 à 23:12, Pali Rohár a écrit :
> > Currently powerpc early debugging contains lot of platform specific
> > options, but does not support standard UART / serial 16550 console.
> > 
> > Later legacy_serial.c code supports registering UART as early debug console
> > from device tree but it is not early during booting, but rather later after
> > machine description code finishes.
> > 
> > So for real early debugging via UART is current code unsuitable.
> > 
> > Add support for new early debugging option CONFIG_PPC_EARLY_DEBUG_16550
> > which enable Serial 16550 console on address defined by new option
> > CONFIG_PPC_EARLY_DEBUG_16550_PHYSADDR and by stride by option
> > CONFIG_PPC_EARLY_DEBUG_16550_STRIDE.
> > 
> > With this change it is possible to debug powerpc machine descriptor code.
> > For example this early debugging code can print on serial console also
> > "No suitable machine description found" error which is done before
> > legacy_serial.c code.
> > 
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> > ---
> > Tested on P2020 board. It allowed me do debug and implement this patch series:
> > https://lore.kernel.org/linuxppc-dev/20220819191557.28116-1-pali@kernel.org/
> 
> Build failure if I select it on mpc885_ads_defconfig :
> 
>    LD      vmlinux.o
>    MODPOST vmlinux.symvers
>    MODINFO modules.builtin.modinfo
>    GEN     modules.builtin
>    CC      .vmlinux.export.o
>    LD      .tmp_vmlinux.kallsyms1
> powerpc64-linux-ld: arch/powerpc/kernel/udbg.o: in function 
> `udbg_early_init':
> /home/chleroy/linux-powerpc/arch/powerpc/kernel/udbg.c:71: undefined 
> reference to `udbg_init_debug_16550'
> 
> 
> 
> > ---
> >   arch/powerpc/Kconfig.debug       | 14 ++++++++++++++
> >   arch/powerpc/include/asm/udbg.h  |  1 +
> >   arch/powerpc/kernel/udbg.c       |  2 ++
> >   arch/powerpc/kernel/udbg_16550.c | 33 ++++++++++++++++++++++++++++++++
> >   4 files changed, 50 insertions(+)
> > 
> > diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
> > index 9f363c143d86..a4e7d90a45d2 100644
> > --- a/arch/powerpc/Kconfig.debug
> > +++ b/arch/powerpc/Kconfig.debug
> > @@ -276,6 +276,11 @@ config PPC_EARLY_DEBUG_OPAL_HVSI
> >   	  Select this to enable early debugging for the PowerNV platform
> >   	  using an "hvsi" console
> >   
> > +config PPC_EARLY_DEBUG_16550
> > +	bool "Serial 16550"
> > +	help
> > +	  Select this to enable early debugging via Serial 16550 console
> > +
> 
> Putting it before EARLY_DEBUG_MEMCONS means that configs that were 
> previously selectiong EARLY_DEBUG_MEMCONS will now select 
> EARLY_DEBUG_16550 instead.
> 
> Add a dependency to PPC_UDBG_16550 to avoid the build failure I mentionned ?

Yea, there is really missing dependency. I will fix it.

> >   config PPC_EARLY_DEBUG_MEMCONS
> >   	bool "In memory console"
> >   	help
> > @@ -355,6 +360,15 @@ config PPC_EARLY_DEBUG_CPM_ADDR
> >   	  platform probing is done, all platforms selected must
> >   	  share the same address.
> >   
> > +config PPC_EARLY_DEBUG_16550_PHYSADDR
> > +	hex "Early debug Serial 16550 physical address"
> > +	depends on PPC_EARLY_DEBUG_16550
> 
> A default value is necessary here to avoid prompts during defconfig builds.
> 
> > +
> > +config PPC_EARLY_DEBUG_16550_STRIDE
> > +	int "Early debug Serial 16550 stride"
> > +	depends on PPC_EARLY_DEBUG_16550
> > +	default 1
> > +
> >   config FAIL_IOMMU
> >   	bool "Fault-injection capability for IOMMU"
> >   	depends on FAULT_INJECTION
> > diff --git a/arch/powerpc/include/asm/udbg.h b/arch/powerpc/include/asm/udbg.h
> > index b4aa0d88ce2c..20b5a37ab772 100644
> > --- a/arch/powerpc/include/asm/udbg.h
> > +++ b/arch/powerpc/include/asm/udbg.h
> > @@ -53,6 +53,7 @@ extern void __init udbg_init_ehv_bc(void);
> >   extern void __init udbg_init_ps3gelic(void);
> >   extern void __init udbg_init_debug_opal_raw(void);
> >   extern void __init udbg_init_debug_opal_hvsi(void);
> > +extern void __init udbg_init_debug_16550(void);
> 
> 'extern' keywork is pointless and deprecated for function prototypes, 
> please don't add new ones.

I used extern keyword to follow existing coding style.

> Checkpatch reports:
> 
> CHECK: extern prototypes should be avoided in .h files
> #77: FILE: arch/powerpc/include/asm/udbg.h:56:
> +extern void __init udbg_init_debug_16550(void);
> 
> 
> >   
> >   #endif /* __KERNEL__ */
> >   #endif /* _ASM_POWERPC_UDBG_H */
> > diff --git a/arch/powerpc/kernel/udbg.c b/arch/powerpc/kernel/udbg.c
> > index b1544b2f6321..92b3fc258d11 100644
> > --- a/arch/powerpc/kernel/udbg.c
> > +++ b/arch/powerpc/kernel/udbg.c
> > @@ -67,6 +67,8 @@ void __init udbg_early_init(void)
> >   	udbg_init_debug_opal_raw();
> >   #elif defined(CONFIG_PPC_EARLY_DEBUG_OPAL_HVSI)
> >   	udbg_init_debug_opal_hvsi();
> > +#elif defined(CONFIG_PPC_EARLY_DEBUG_16550)
> > +	udbg_init_debug_16550();
> >   #endif
> >   
> >   #ifdef CONFIG_PPC_EARLY_DEBUG
> > diff --git a/arch/powerpc/kernel/udbg_16550.c b/arch/powerpc/kernel/udbg_16550.c
> > index d3942de254c6..46f2d831d7c9 100644
> > --- a/arch/powerpc/kernel/udbg_16550.c
> > +++ b/arch/powerpc/kernel/udbg_16550.c
> > @@ -8,6 +8,7 @@
> >   #include <asm/udbg.h>
> >   #include <asm/io.h>
> >   #include <asm/reg_a2.h>
> > +#include <asm/early_ioremap.h>
> >   
> >   extern u8 real_readb(volatile u8 __iomem  *addr);
> >   extern void real_writeb(u8 data, volatile u8 __iomem *addr);
> > @@ -335,3 +336,35 @@ void __init udbg_init_debug_microwatt(void)
> >   }
> >   
> >   #endif /* CONFIG_PPC_EARLY_DEBUG_MICROWATT */
> > +
> > +#ifdef CONFIG_PPC_EARLY_DEBUG_16550
> > +
> > +static void __iomem *udbg_uart_early_addr;
> > +
> > +void __init udbg_init_debug_16550(void)
> > +{
> > +	udbg_uart_early_addr = early_ioremap(CONFIG_PPC_EARLY_DEBUG_16550_PHYSADDR, 0x1000);
> > +	udbg_uart_init_mmio(udbg_uart_early_addr, CONFIG_PPC_EARLY_DEBUG_16550_STRIDE);
> > +}
> > +
> > +static int __init udbg_init_debug_16550_ioremap(void)
> > +{
> > +	void __iomem *addr;
> > +
> > +	if (!udbg_uart_early_addr)
> > +		return 0;
> > +
> > +	addr = ioremap(CONFIG_PPC_EARLY_DEBUG_16550_PHYSADDR, 0x1000);
> > +	if (WARN_ON(!addr))
> > +		return -ENOMEM;
> > +
> > +	udbg_uart_init_mmio(addr, CONFIG_PPC_EARLY_DEBUG_16550_STRIDE);
> > +	early_iounmap(udbg_uart_early_addr, 0x1000);
> > +	udbg_uart_early_addr = NULL;
> > +
> > +	return 0;
> > +}
> > +
> > +early_initcall(udbg_init_debug_16550_ioremap);
> > +
> > +#endif /* CONFIG_PPC_EARLY_DEBUG_16550 */
