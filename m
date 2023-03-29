Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E996CF5AF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 23:52:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pn0fD4spHz3cMb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 08:52:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=jrtc27.com header.i=@jrtc27.com header.a=rsa-sha256 header.s=gmail.jrtc27.user header.b=X0RSiXgH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=jrtc27.com (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=jrtc27@jrtc27.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=jrtc27.com header.i=@jrtc27.com header.a=rsa-sha256 header.s=gmail.jrtc27.user header.b=X0RSiXgH;
	dkim-atps=neutral
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pn0dK6vtMz3cD2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 08:52:03 +1100 (AEDT)
Received: by mail-wm1-x330.google.com with SMTP id l37so9746206wms.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 14:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1680126716;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mR/Zj1PB00aaXey9QznQEyL9cgsnbEviFfaDBojU/PA=;
        b=X0RSiXgHE7YkzJiBvPfuECvjvZh/j9OCTlp5vS9G1kUZuHyE1mJThY46uxE8TkBE8F
         26YKvU03kRSEEbihp0nG/r6HBhciobPuGf3L9XG5lP7LIGmFx1xuZOCywjcKmPOmTu8N
         GYJA3eb2b0Q6VlUVpDCKV/9pvTj9LkixTX22pUdw50wCneJbfivXkkSI84dON9P5F9zR
         aPsg4Jeh3iGHabX4d9hb5dRKHYvbcqGCgHjWCSflhUWkYsO9R2cu9K7Yx5HZpgAK9C+P
         FR/T+Ct46EkosCoWvECTXbDfM4FfGO3jzQMNS58kzGepVwnhUrHOmPZqrc1qrzv6vlJT
         efvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680126716;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mR/Zj1PB00aaXey9QznQEyL9cgsnbEviFfaDBojU/PA=;
        b=gXecn+GYhdbmtjwRI2nxRcH6r9uyj+cx1AXWNU9mwJNPg3vk/gIrI3/NJPXuWLpVIC
         s5U44Rl/Drh/kzmtsZcct9VSA8vFnCcdIPm8qRAgX022uyBMtnFocf8fz0MZrxVaZ6nk
         I55Mj1gkIySQ+D/n6MsodkVNAbo/45NId4GnouYVQd5F9OjYXgNf+u5wd0JjUglW8Jnc
         Zz7al8SF73WweuA9/qL3Qq7dKt4ahKIm8CxmzuHDm3LRtg8wbiQRJ509++pRPrg9un2N
         RBQi7uFr/RbJKfx2aM260mllgL8Z49AO9/v5ccRy/7FSUqtiMMHedVYFACI5SPPbjh4m
         AX5g==
X-Gm-Message-State: AO0yUKV5cxL4GlafVk4n2fGFAbCmEz+YLBGX4cY8sOIs26kckqlZsutb
	mIsxRzBH+LGQHbGAOZwnvG4WoQ==
X-Google-Smtp-Source: AK7set8QoMq1gGRgzzGqEiUi0STo43D8VYRH41LQHDT7NbD/gZR3RJOV/DBadJ5PrJGjWGmEaVtwcg==
X-Received: by 2002:a7b:c413:0:b0:3ee:4531:8448 with SMTP id k19-20020a7bc413000000b003ee45318448mr17263952wmi.39.1680126716518;
        Wed, 29 Mar 2023 14:51:56 -0700 (PDT)
Received: from smtpclient.apple (global-5-144.n-2.net.cam.ac.uk. [131.111.5.144])
        by smtp.gmail.com with ESMTPSA id a18-20020a1cf012000000b003ed4f6c6234sm3437896wmb.23.2023.03.29.14.51.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Mar 2023 14:51:55 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 08/21] riscv: dma-mapping: only invalidate after DMA, not
 flush
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20230327121317.4081816-9-arnd@kernel.org>
Date: Wed, 29 Mar 2023 22:51:54 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <837F1B2F-7090-4F9F-A894-594ACF6A8DB2@jrtc27.com>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-9-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Neil Armstrong 
 <neil.armstrong@linaro.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, linux-oxnas@groups.io, Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27 Mar 2023, at 13:13, Arnd Bergmann <arnd@kernel.org> wrote:
>=20
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> No other architecture intentionally writes back dirty cache lines into
> a buffer that a device has just finished writing into. If the cache is
> clean, this has no effect at all, but if a cacheline in the buffer has
> actually been written by the CPU,  there is a drive bug that is likely
> made worse by overwriting that buffer.

FYI [1] proposed this same change a while ago but its justification was
flawed (which was my objection at the time, not the diff itself).

Jess

[1] =
https://lore.kernel.org/all/20220818165105.99746-1-s.miroshnichenko@yadro.=
com

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> arch/riscv/mm/dma-noncoherent.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/mm/dma-noncoherent.c =
b/arch/riscv/mm/dma-noncoherent.c
> index d919efab6eba..640f4c496d26 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -42,7 +42,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t =
size,
> 		break;
> 	case DMA_FROM_DEVICE:
> 	case DMA_BIDIRECTIONAL:
> -		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +		ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
> 		break;
> 	default:
> 		break;
> --=20
> 2.39.2
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

