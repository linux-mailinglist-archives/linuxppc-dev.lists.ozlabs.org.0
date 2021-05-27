Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C18F7393512
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 19:43:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrZtZ63Jmz3068
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 03:43:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=cmarinas@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrZtB2gRJz2yjY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 03:43:30 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B02F6610A0;
 Thu, 27 May 2021 17:43:23 +0000 (UTC)
Date: Thu, 27 May 2021 18:43:21 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH] mm: generalize ZONE_[DMA|DMA32]
Message-ID: <20210527174321.GI8661@arm.com>
References: <20210527143047.123611-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527143047.123611-1-wangkefeng.wang@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-s390@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-ia64@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Will Deacon <will@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-mips@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 27, 2021 at 10:30:47PM +0800, Kefeng Wang wrote:
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
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
