Return-Path: <linuxppc-dev+bounces-7312-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 162DAA6DC52
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Mar 2025 14:59:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZLvmL4CNvz2ydl;
	Tue, 25 Mar 2025 00:58:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742824738;
	cv=none; b=dqhE4LxQbdjvVvL8qAOtHXSR9Lkvr/iygt+k5zp/tVuUrBLoSd7im8HRq3CmnttwFVtBSQRNj+lVpbMdWIp7aysvur7Z/RBFghluZKHXtyyzoJDRM+s0pDsYGofUuvRuuG/yXTf9d71WxAT4LAiMDlnCt0+EN15tmFQ7yZuYGNxLpF16d/4UCo9CMSWV9R+ym3xxQ865lzsaeo11lpQOzT+6ya+0f5GT7qunZb74wBJYkyj3yvzajONXVYxs3xPTx5tyg+DKek7YarOk4KjOL8LpyMe7qfVxrGMrzM/ErAbGsKWsYpHz5G9ucUbUNAmCbtkatC9aeaFYMGkiCTOjAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742824738; c=relaxed/relaxed;
	bh=cWnbJTTuu+Pf7CZCN7DGOiKgkAiAiq+CfbDc8yTL89c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DPnwZSMeW5B59+9rm5Px9bgMQlWqL3+dmy75CF88Z9Rv4BJWKGBwMB24iKZcTx5fqs0OCAuXVxz9qUPSlnqmGSvEoQ+cEv+38fIWzGTTISVfSuUUt/2VKPeTyd8dqLoF+0S7De/TW5/C4dLpIRcZIPxunkTIYALIKJHHIksSEpeX+D8aK9GF5Mc7KdPIUQMjwxSMmG2OBh4Q9qpgMt7beRHPtcoSGqtLhc5WjjSmphpTAxt3lJJvKO32JPdEeXeoIr0DTZ3V2vZhvyPEPnVwoYEY7xV93ybL5wHdAr3JwAQoAkhhVGpaEsdQ421DFQBmreqVJlpDFa9HHIQwswwsXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=srs0=d9jp=wl=linux-m68k.org=gerg@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=srs0=d9jp=wl=linux-m68k.org=gerg@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 508 seconds by postgrey-1.37 at boromir; Tue, 25 Mar 2025 00:58:57 AEDT
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZLvmK0zJgz2y8p
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Mar 2025 00:58:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C950B437A7;
	Mon, 24 Mar 2025 13:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0AE6C4CEDD;
	Mon, 24 Mar 2025 13:50:21 +0000 (UTC)
Message-ID: <9076d00e-c469-4a05-a686-94e3e55c8389@linux-m68k.org>
Date: Mon, 24 Mar 2025 23:50:19 +1000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] m68k/nommu: stop using GENERIC_IOMAP
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Julian Vetter <julian@outer-limits.org>, Bjorn Helgaas
 <bhelgaas@google.com>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
References: <20250315105907.1275012-1-arnd@kernel.org>
 <20250315105907.1275012-7-arnd@kernel.org>
 <64f226e5-7931-40ba-878a-a28688da82fd@linux-m68k.org>
 <4a31c6a8-7c99-4d8f-8248-92e0e52b8db6@app.fastmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <4a31c6a8-7c99-4d8f-8248-92e0e52b8db6@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Arnd,

On 24/3/25 18:02, Arnd Bergmann wrote:
> On Mon, Mar 24, 2025, at 02:33, Greg Ungerer wrote:
>> Hi Arnd,
>>
>> On 15/3/25 20:59, Arnd Bergmann wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> There is no need to go through the GENERIC_IOMAP wrapper for PIO on
>>> nommu platforms, since these always come from PCI I/O space that is
>>> itself memory mapped.
>>>
>>> Instead, the generic ioport_map() can just return the MMIO location
>>> of the ports directly by applying the PCI_IO_PA offset, while
>>> ioread32/iowrite32 trivially turn into readl/writel as they do
>>> on most other architectures.
>>>
>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>
>> With this applied this fails to build for me:
>>
>>     UPD     include/generated/utsversion.h
>>     CC      init/version-timestamp.o
>>     LD      vmlinux
>> m68k-linux-uclibc-ld: drivers/pci/quirks.o: in function
>> `quirk_switchtec_ntb_dma_alias':
>> quirks.c:(.text+0x23e4): undefined reference to `pci_iomap'
>> m68k-linux-uclibc-ld: quirks.c:(.text+0x24fe): undefined reference to
>> `pci_iounmap'
>> m68k-linux-uclibc-ld: drivers/pci/quirks.o: in function
>> `disable_igfx_irq':
>> quirks.c:(.text+0x32f4): undefined reference to `pci_iomap'
>> m68k-linux-uclibc-ld: quirks.c:(.text+0x3348): undefined reference to
>> `pci_iounmap'
> 
> Thanks for the report, I was able to reproduce the problem now
> and applied the fixup below. I had tested m5475evb_defconfig earlier,
> and that built cleanly with PCI enabled, but I had missed how
> that still used GENERIC_IOMAP because it has CONFIG_MMU enabled.
> 
> Does this fixup work for you?

Yes, this looks good, works for me.
Feel free to add this if you like:

Acked-by: Greg Ungerer <gerg@linux-m68k.org>


> On a related note, I'm curious about how the MCF54xx chips are
> used in practice, as I see that they are the only coldfire chips
> with PCI and they all have an MMU. Are there actual users of these
> chips that have PCI but choose not to use the MMU?

No, I think everyone with these uses them with MMU enabled.

It is probably more of an historical curiosity to use them with
the MMU disabled. That supported pre-dated mainline kernels having
full ColdFire MMU support by a good few years.

Regards
Greg



>        Arnd
> 
> 8<-----
>  From a36995e2a64711556c6773797367d165828f6705 Mon Sep 17 00:00:00 2001
> From: Arnd Bergmann <arnd@arndb.de>
> Date: Mon, 24 Mar 2025 07:53:47 +0100
> Subject: [PATCH] m68k: coldfire: select PCI_IOMAP for PCI
> 
> After I dropped CONFIG_GENERIC_IOMAP, some PCI drivers started failing
> to link when CONFIG_MMU is disabled:
> 
> ERROR: modpost: "pci_iounmap" [drivers/video/fbdev/i740fb.ko] undefined!
> ERROR: modpost: "pci_iounmap" [drivers/video/fbdev/vt8623fb.ko] undefined!
> ERROR: modpost: "pci_iomap_wc" [drivers/video/fbdev/vt8623fb.ko] undefined!
> ERROR: modpost: "pci_iomap" [drivers/video/fbdev/vt8623fb.ko] undefined!
> ERROR: modpost: "pci_iounmap" [drivers/video/fbdev/s3fb.ko] undefined!
> ...
> 
> It turns out that there were two mistakes in my patch: on !MMU I forgot
> to enable CONFIG_GENERIC_PCI_IOMAP, and for Coldfire with MMU enabled,
> teh GENERIC_IOMAP was left in place but incorrectly configured.
> 
> Fixes: 9d48cc07d0d7 ("m68k/nommu: stop using GENERIC_IOMAP")
> Reported-by: Greg Ungerer <gerg@linux-m68k.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index b50c275fa94d..eb5bb6d36899 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -18,12 +18,13 @@ config M68K
>   	select DMA_DIRECT_REMAP if M68K_NONCOHERENT_DMA && !COLDFIRE
>   	select GENERIC_ATOMIC64
>   	select GENERIC_CPU_DEVICES
> -	select GENERIC_IOMAP if HAS_IOPORT && MMU
> +	select GENERIC_IOMAP if HAS_IOPORT && MMU && !COLDFIRE
>   	select GENERIC_IRQ_SHOW
>   	select GENERIC_LIB_ASHLDI3
>   	select GENERIC_LIB_ASHRDI3
>   	select GENERIC_LIB_LSHRDI3
>   	select GENERIC_LIB_MULDI3
> +	select GENERIC_PCI_IOMAP if PCI
>   	select HAS_IOPORT if PCI || ISA || ATARI_ROM_ISA
>   	select HAVE_ARCH_LIBGCC_H
>   	select HAVE_ARCH_SECCOMP


