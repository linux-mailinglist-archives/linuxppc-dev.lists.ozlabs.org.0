Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB196CA61C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 15:38:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlYn137khz3fCn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 00:38:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hzOh/7d/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hzOh/7d/;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlYm64LZ2z3c6H
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 00:37:58 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 53ADD6124D
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 13:37:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC62C4339B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 13:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679924275;
	bh=sKw5GnPYWTx1tEo+IYG63yzmzH5uUSkHi5W70RXeiXE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hzOh/7d/QC2xwAXBFj3mdc+TI5iRkfS/NQ+dbaC5S24cyEjTk/5p8+6ufOc4+gK6l
	 O5kp/Q8LogUo5u0zC7EgUkPN7x6kzZ2TL8FBhUKGSy8pPA6VZZ0d2Ofe46eqMAE/It
	 FrJ6h9/7aoDme+eZGg1dlAtz36qBpkZmLsHcl+5l0JTuPpiYjXFqoCtvn2utCl3SXU
	 3yRKsESiJ0f0C4vpT0NnLi2uGU4dLdZOmEy8obhbP/gBGnYJ80u37QA0bS6+DMZeKf
	 y8d0ah43wp+9qCquwoXfebbagslzqO0c658dgzcdeMqWc5wUgHUPV4JbPmroc1x5Xu
	 YSwUG8YgQBfhw==
Received: by mail-lf1-f50.google.com with SMTP id q16so11475547lfe.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 06:37:55 -0700 (PDT)
X-Gm-Message-State: AAQBX9eGeqGd3A40EGCg+NYDfcXb3DqOVNt7Uy68vujcVou/sHwVj5QI
	Kf5D5AKBJ/jWDByBhD7LNc1mK2VhnExXIittPTs=
X-Google-Smtp-Source: AKy350aPL1uQ3r2MblLdeWPWx+R7rA3ZaUJTGPp0hWqhXUlS0wDj97jvk8gg6F5BBuMMpzVJHH5p6CMaiE85EcR30Es=
X-Received: by 2002:a17:906:4746:b0:8ab:b606:9728 with SMTP id
 j6-20020a170906474600b008abb6069728mr5893837ejs.5.1679924253534; Mon, 27 Mar
 2023 06:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-11-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-11-arnd@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 27 Mar 2023 21:37:22 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT73KBZ01N2fr8z6=9XWFKo4D7cGKOtZLZeXN9NrscCXg@mail.gmail.com>
Message-ID: <CAJF2gTT73KBZ01N2fr8z6=9XWFKo4D7cGKOtZLZeXN9NrscCXg@mail.gmail.com>
Subject: Re: [PATCH 10/21] csky: dma-mapping: skip invalidating before DMA
 from device
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Michal Simek
  <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, linux-oxnas@groups.io, Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 27, 2023 at 8:15=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> csky is the only architecture that does a full flush for the
> dma_sync_*_for_device(..., DMA_FROM_DEVICE) operation. The requirement
> is only make sure there are no dirty cache lines for the buffer,
> which can be either done through an invalidate operation (as on most
> architectures including arm32, mips and arc), or a writeback (as on
> arm64 and riscv). The cache also has to be invalidated eventually but
> csky already does that after the transfer.
>
> Use a 'clean' operation here for consistency with arm64 and riscv.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/csky/mm/dma-mapping.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/csky/mm/dma-mapping.c b/arch/csky/mm/dma-mapping.c
> index 82447029feb4..c90f912e2822 100644
> --- a/arch/csky/mm/dma-mapping.c
> +++ b/arch/csky/mm/dma-mapping.c
> @@ -60,11 +60,9 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_=
t size,
>  {
>         switch (dir) {
>         case DMA_TO_DEVICE:
> -               cache_op(paddr, size, dma_wb_range);
> -               break;
>         case DMA_FROM_DEVICE:
>         case DMA_BIDIRECTIONAL:
> -               cache_op(paddr, size, dma_wbinv_range);
> +               cache_op(paddr, size, dma_wb_range);
Reviewed-by: Guo Ren <guoren@kernel.org>


>                 break;
>         default:
>                 BUG();
> --
> 2.39.2
>


--=20
Best Regards
 Guo Ren
