Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93638396BAD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 04:56:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvGym6Y5zz2ymR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 12:56:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mgyJJS7M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=mgyJJS7M; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvGyL2YyYz2yXX
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jun 2021 12:56:25 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FvGy61k79z9sWF;
 Tue,  1 Jun 2021 12:56:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1622516184;
 bh=iY7MeF5kJVTgb76PGSIe64N6mVxLFvLQ+P911N0MgIM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=mgyJJS7Mpwj0xHxjTQUJCbxWXBqEpx7u6kJmlJrory1kepRlcJMq86u8b7CRC0TBx
 2eKAPApa1yyT+8Bx3Nq7xXqq+U0aoxEZ+zVk8LZNufbS19MjY54JklUeikWPo3saVu
 rZYPlntAMlPhhFnF6Z4PsS/40mD9BayKN5dAP0deDvSFY91SZJGkqyvQLfTKpVKAj7
 nHaMrjkuyFLjQPzypNJGHxewO6DV/mxxi6HJjuKa/Hbn4YkWBejjdidjhax1ODsJHB
 2xtaQQzhaLoYsK439xsAx0/uvUVbRJkkNCZEwtolQgis+ZjvEfMSx7TFq4rv4vlYtC
 mKEDQ5CYN2DQw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kefeng Wang <wangkefeng.wang@huawei.com>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: Re: [PATCH v2] mm: generalize ZONE_[DMA|DMA32]
In-Reply-To: <20210528074557.17768-1-wangkefeng.wang@huawei.com>
References: <20210527143047.123611-1-wangkefeng.wang@huawei.com>
 <20210528074557.17768-1-wangkefeng.wang@huawei.com>
Date: Tue, 01 Jun 2021 12:56:10 +1000
Message-ID: <87k0negunp.fsf@mpe.ellerman.id.au>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, linux-ia64@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kefeng Wang <wangkefeng.wang@huawei.com> writes:
> ZONE_[DMA|DMA32] configs have duplicate definitions on platforms
> that subscribe them. Instead, just make them generic options which
> can be selected on applicable platforms.
>
> Also only x86/arm64 architectures could enable both ZONE_DMA and
> ZONE_DMA32 if EXPERT, add ARCH_HAS_ZONE_DMA_SET to make dma zone
> configurable and visible on the two architectures.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Russell King <linux@armlinux.org.uk>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com> # for arm64
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # for m68k
> Acked-by: Mike Rapoport <rppt@linux.ibm.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
> v2:
> -i386 can't enable ZONE_DMA32, fix it.
> -make ZONE_DMA default y on X86 as before.
> -collect ACKs
>
>  arch/alpha/Kconfig                     |  5 +----
>  arch/arm/Kconfig                       |  3 ---
>  arch/arm64/Kconfig                     |  9 +--------
>  arch/ia64/Kconfig                      |  4 +---
>  arch/m68k/Kconfig                      |  5 +----
>  arch/microblaze/Kconfig                |  4 +---
>  arch/mips/Kconfig                      |  7 -------
>  arch/powerpc/Kconfig                   |  4 ----
>  arch/powerpc/platforms/Kconfig.cputype |  1 +

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
