Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE306F7C84
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 07:48:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCKVP0TSzz3fHM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 15:48:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z26bR3GD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z26bR3GD;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCKTT1s6Qz2ynx
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 15:47:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8812563B26
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 05:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC51C433EF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 05:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683265657;
	bh=TmEJ43a9wRyU79Q4Z9WHv4VZR6aLeCdSzDRMZZtHgkE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Z26bR3GD7NZekm8D2fY3Likq3Z+WzMYLxGNnfeJCb+QwNkNe2TrCsNu2VFfZjShat
	 waIgr8ZT+ardQLvN1NlwZYzH5cZxJYxowJsqGOWno8Rl9LGCyRjXrN4kUrT0wSjKA3
	 va31vYv4BfxRUWA0U1ACB0SZxiczkJ6ChjLmeQmgK6um5tf4OdsSdlBmir+dXjr7Ib
	 eodQwnLUWN7khfewboLikhJjzXtjqnFi+oOdZSrfft8Feutqpt4nrnNIFe7eshzIjL
	 2R7E0+HCH9g3/5K1V+VPwNnTCBGdmrwdimg1OJKzf3tZSMKqnn1Z4uKwCieN6lGWZq
	 wQHAZd8sjvaLg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4efeea05936so1511232e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 May 2023 22:47:36 -0700 (PDT)
X-Gm-Message-State: AC+VfDxt+wgDWCmE7cppHOkQvSI9kWC8P2KLsWBNrPQ5gwn2Ug2NojZ8
	iMT2rWMBs+80YNOv8liP2ajS9cLH7iLlrzzYV0c=
X-Google-Smtp-Source: ACHHUZ7vjZvoO17O2+xGcjw8YRQwo0MSgi9BtdhaWD+v+3nmuTyY0RrEyW2wbSK+lqJd6C9lcTXOXjjLYHG3jJse7RE=
X-Received: by 2002:a17:907:1c07:b0:960:ddba:e5c7 with SMTP id
 nc7-20020a1709071c0700b00960ddbae5c7mr139047ejc.40.1683265634680; Thu, 04 May
 2023 22:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-10-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-10-arnd@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 5 May 2023 13:47:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT2VCVMJs1NvgK66uD+BhObjM2WNxf2RY7wTZsho4sjVA@mail.gmail.com>
Message-ID: <CAJF2gTT2VCVMJs1NvgK66uD+BhObjM2WNxf2RY7wTZsho4sjVA@mail.gmail.com>
Subject: Re: [PATCH 09/21] riscv: dma-mapping: skip invalidation before
 bidirectional DMA
To: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Brian Cain <bcain@quicinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franke
 n.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, linux-oxnas@groups.io, Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 27, 2023 at 8:15=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> For a DMA_BIDIRECTIONAL transfer, the caches have to be cleaned
> first to let the device see data written by the CPU, and invalidated
> after the transfer to let the CPU see data written by the device.
>
> riscv also invalidates the caches before the transfer, which does
> not appear to serve any purpose.
Yes, we can't guarantee the CPU pre-load cache lines randomly during
dma working.

But I've two purposes to keep invalidates before dma transfer:
 - We clearly tell the CPU these cache lines are invalid. The caching
algorithm would use these invalid slots first instead of replacing
valid ones.
 - Invalidating is very cheap. Actually, flush and clean have the same
performance in our machine.

So, how about:

diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoheren=
t.c
index d919efab6eba..2c52fbc15064 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -22,8 +22,6 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t s=
ize,
                ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
                break;
        case DMA_FROM_DEVICE:
-               ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
-               break;
        case DMA_BIDIRECTIONAL:
                ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
                break;
@@ -42,7 +40,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size=
,
                break;
        case DMA_FROM_DEVICE:
        case DMA_BIDIRECTIONAL:
                /* I'm not sure all drivers have guaranteed cacheline
alignment. If not, this inval would cause problems */
-               ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
+               ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
                break;
        default:
                break;

>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/riscv/mm/dma-noncoherent.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoher=
ent.c
> index 640f4c496d26..69c80b2155a1 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -25,7 +25,7 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t=
 size,
>                 ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
>                 break;
>         case DMA_BIDIRECTIONAL:
> -               ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +               ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
>                 break;
>         default:
>                 break;
> --
> 2.39.2
>


--=20
Best Regards
 Guo Ren
