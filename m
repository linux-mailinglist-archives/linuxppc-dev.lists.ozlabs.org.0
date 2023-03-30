Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC90B6D059D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 15:00:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnNnL462hz3fRK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 00:00:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gvyLOSrV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com; envelope-from=prabhakar.csengg@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gvyLOSrV;
	dkim-atps=neutral
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnNmS4w4Lz3bT7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 23:59:35 +1100 (AEDT)
Received: by mail-io1-xd31.google.com with SMTP id x3so724425iov.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 05:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680181172; x=1682773172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=db58zgLapT4+5eM+e2dEcRQMOxpl02qLJJqJynMawPw=;
        b=gvyLOSrV5NqLHUuxidIYczTpyccsUd898Kt8qAjGZCJm8EQYH5JcTmwLqg57uC0cvB
         j7U0x9dcm2RsX8dLxVGcboGq4Pdvm6cDFGIifVhW5LUG0BZhpnkLq+12fDfUITmPUgDN
         KJqbUWD1A1NNvcxlD8Va+DklQ7yRgA9v4iGNa+yDzNCF8hz/BAHOp1sivo3m/ett+i3j
         AtVwEXoZrtByosb2V89SvT6DgwFv0o1YJU+4lunFRTh6XWRbkQcRhcsLjusSr3Liunwq
         utzWcTAPvMsNoessMz8HZ9Y6dfPH5hnImowquLEBicF67L5RSN3ovwZ4QUhqVrtpFGVk
         CyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680181172; x=1682773172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=db58zgLapT4+5eM+e2dEcRQMOxpl02qLJJqJynMawPw=;
        b=LrWuJRphwpRixFwAP/bGfgu9fr7NcRFJAxgNsrjfuGGHSv98gWUsH9H1u06NyW9PSo
         po0NhfSE/UiBguxj9JKhpejx8PkC9/epWs3LL9k69Syzkvod63YNHtgdafCtja09DU0j
         nnc78iwF/k0U3qR8U1FkTteQzaiS3qQko3S4VvOWHhJnglxKaa3AHdMO7c9cJoAARBmB
         v482490kWa0ndaV2sP4IAe5FTWIdrM22osB6JP7pSBTCLdPaG5Md4DpNHUWGoFJ+ypSS
         AkNXMes9KJmBiTDYM3ubg9lOFoHy1vJLPGpH2CP9QV+UG5NcWylKFEe6x+jMhyYXo7SY
         umHQ==
X-Gm-Message-State: AAQBX9cC7ul1MWuf9OfCu1erBQ24m8Jb3iZQQ99/NPviU2tPm4KFjzkD
	D6g6fioZm6qMBEYLhnrJJkgLkBxRVNHgOyLCp9c=
X-Google-Smtp-Source: AKy350Yt7w4HDnt8ZzJ1OA1g5OCPUWPp6heQMoQ57xTct+y1JPFpMNsPMtx4N97vitPklV5i5ccLJReO6yCW0ia7/Oo=
X-Received: by 2002:a02:95c3:0:b0:3eb:3166:9da4 with SMTP id
 b61-20020a0295c3000000b003eb31669da4mr2710421jai.2.1680181172425; Thu, 30 Mar
 2023 05:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-9-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-9-arnd@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 30 Mar 2023 13:59:06 +0100
Message-ID: <CA+V-a8v--RqxFJYTZ04vVgiA69VJsFWk=r=TvRvokhpAV-famg@mail.gmail.com>
Subject: Re: [PATCH 08/21] riscv: dma-mapping: only invalidate after DMA, not flush
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstr
 ong@linaro.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, linux-oxnas@groups.io, Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 27, 2023 at 1:16=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> No other architecture intentionally writes back dirty cache lines into
> a buffer that a device has just finished writing into. If the cache is
> clean, this has no effect at all, but if a cacheline in the buffer has
> actually been written by the CPU,  there is a drive bug that is likely
> made worse by overwriting that buffer.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/riscv/mm/dma-noncoherent.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoher=
ent.c
> index d919efab6eba..640f4c496d26 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -42,7 +42,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t si=
ze,
>                 break;
>         case DMA_FROM_DEVICE:
>         case DMA_BIDIRECTIONAL:
> -               ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +               ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
>                 break;
>         default:
>                 break;
> --
> 2.39.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
