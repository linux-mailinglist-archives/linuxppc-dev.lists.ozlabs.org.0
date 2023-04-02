Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A856D35E0
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Apr 2023 08:53:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pq4V64vRrz3cjW
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Apr 2023 16:53:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pqQ8UGR2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=vgupta@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pqQ8UGR2;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pq4TB5Gycz3c6X
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Apr 2023 16:52:14 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D26E960F78;
	Sun,  2 Apr 2023 06:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172F1C433EF;
	Sun,  2 Apr 2023 06:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680418330;
	bh=a/EFMMyTJLmdvL39oZFGsprYDxcAb3c4B++/AP48aI8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pqQ8UGR2W/sRFjxT8DARJF1gEKMVmWBdp+qDC9PGt0i4TRAg0xAwoG7YQQxAtDcdi
	 4Pb253Uxof3u9uF71S5Xrs095QXIy4AdVj3153ZRySY7w6oib4sTzQ8CqAmyQSRayG
	 2EAT/e6m3unLAUSKk8zn/YhBr3R6k1eBeKiApm9beA6GV7oD5h7f9NbOa+/z/XcUUq
	 Wo1iHf9vVkeyRvdktceSDmuJx7kOOEGZtUZ6DOOxmfVTUgf0Rrb6I9FB+HQBZqNZ1B
	 jIzLWCQM2V8D9tYxUPIRptyXw28M0O5YuIe+Fd2OoUguwXFRn6X5yntmmRZtkvx66T
	 3696IoVFPDlHA==
Message-ID: <2b298e8c-e6fc-a973-9f42-b6a88e92838a@kernel.org>
Date: Sun, 2 Apr 2023 12:22:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 13/21] arc: dma-mapping: skip invalidating before
 bidirectional DMA
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-14-arnd@kernel.org>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20230327121317.4081816-14-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Max Filippov <jcmvbkbc@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Shahab Vahedi <Shahab.Vahedi@synopsys.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Neil Armstr
 ong <neil.armstrong@linaro.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, linux-oxnas@groups.io, Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CC Shahab

On 3/27/23 17:43, Arnd Bergmann wrote:
> From: Arnd Bergmann<arnd@arndb.de>
>
> Some architectures that need to invalidate buffers after bidirectional
> DMA because of speculative prefetching only do a simpler writeback
> before that DMA, while architectures that don't need to do the second
> invalidate tend to have a combined writeback+invalidate before the
> DMA.
>
> arc is one of the architectures that does both, which seems unnecessary.
>
> Change it to behave like arm/arm64/xtensa instead, and use just a
> writeback before the DMA when we do the invalidate afterwards.
>
> Signed-off-by: Arnd Bergmann<arnd@arndb.de>

Reviewed-by: Vineet Gupta <vgupta@kernel.org>

Shahab can you give this a spin on hsdk - run glibc testsuite over ssh 
and make sure nothing strange happens.

Thx,
-Vineet
