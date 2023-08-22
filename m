Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A50783997
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 07:57:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i4U9wZJz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVJWx17zLz3c2B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 15:57:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i4U9wZJz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=dlemoal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVJW14XQ8z2yVd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 15:56:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 99D7860AFF;
	Tue, 22 Aug 2023 05:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF0BC433C8;
	Tue, 22 Aug 2023 05:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692683767;
	bh=9um55Zj5RL+HKm7sDYvky+ZFM9uVlT2G4kmh91T3oQk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i4U9wZJzMB/JAaVGMUuwP8/xefH2Qsh14Xu32Xc/qVZSzGa4W6W3VIIOD6/v7Xh9Q
	 k18VkvEHim3SO3tNgXRvBblBzeHsL87eELXVl0EFzY0tsPjs811q9rfXFnsj0lLTQF
	 EpSoXGxzXLDJWts1fI4IRWcROzjHP5G0AT0qxuEpgYP+SXJ2yRth8TU23/w9KY3J6f
	 EluPrQ6jZirhSO+0JgVTf6rSYqMW+FR+pbNaNhMUovRm87mowMfEhVJUUff6ttYjdN
	 DWsbeQYoA+y9d0IeLN7eLGKZEWZbHrOHUi96dM2CviwCqt7RLb3FLDwwTsj9BwMrPz
	 Cnb9nNjBOJIVA==
Message-ID: <ae07d064-85ea-3074-0a32-867e5bbf6e7a@kernel.org>
Date: Tue, 22 Aug 2023 14:56:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/9] ARM: Remove <asm/ide.h>
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Russell King <linux@armlinux.org.uk>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Christoph Hellwig <hch@lst.de>,
 Jens Axboe <axboe@kernel.dk>
References: <cover.1692288018.git.geert@linux-m68k.org>
 <e53f0f8da1607856028d941e7ac8646aa2abc555.1692288018.git.geert@linux-m68k.org>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <e53f0f8da1607856028d941e7ac8646aa2abc555.1692288018.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arch@vger.kernel.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/18/23 01:07, Geert Uytterhoeven wrote:
> As of commit b7fb14d3ac63117e ("ide: remove the legacy ide driver") in
> v5.14, there are no more generic users of <asm/ide.h>.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Looks good to me. All patches are reviewed or acked, except this one.
Can I get an ack from arm folks ?

> ---
>  arch/arm/include/asm/ide.h | 24 ------------------------
>  1 file changed, 24 deletions(-)
>  delete mode 100644 arch/arm/include/asm/ide.h
> 
> diff --git a/arch/arm/include/asm/ide.h b/arch/arm/include/asm/ide.h
> deleted file mode 100644
> index a81e0b0d6747aa2f..0000000000000000
> --- a/arch/arm/include/asm/ide.h
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - *  arch/arm/include/asm/ide.h
> - *
> - *  Copyright (C) 1994-1996  Linus Torvalds & authors
> - */
> -
> -/*
> - *  This file contains the ARM architecture specific IDE code.
> - */
> -
> -#ifndef __ASMARM_IDE_H
> -#define __ASMARM_IDE_H
> -
> -#ifdef __KERNEL__
> -
> -#define __ide_mm_insw(port,addr,len)	readsw(port,addr,len)
> -#define __ide_mm_insl(port,addr,len)	readsl(port,addr,len)
> -#define __ide_mm_outsw(port,addr,len)	writesw(port,addr,len)
> -#define __ide_mm_outsl(port,addr,len)	writesl(port,addr,len)
> -
> -#endif /* __KERNEL__ */
> -
> -#endif /* __ASMARM_IDE_H */

-- 
Damien Le Moal
Western Digital Research

