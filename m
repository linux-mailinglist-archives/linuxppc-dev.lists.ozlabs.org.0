Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD63E7805E9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 08:40:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Y0iReFoY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRsgj5kkzz3cMH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 16:40:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Y0iReFoY;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRsdx3WfCz2ysB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 16:38:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692340724;
	bh=hlt2WR9VKRQdnR39jECZXVVWv2cQfPKmwJiDfWtBxo4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Y0iReFoYSlL0+BxRV/n3nIxMdr6AyjmsO0dXwn9j+x+KduX7OhC0wklzd198xTaee
	 9XcmQrl8GmmaMLE9O6icF7RHt6SPWQGb8Alc9TWqL1TXJ9u7InrnjGNGIsGQntC4Ew
	 DUbEKBPT8AhYv5vfCcDGZaWz6sznFTeVHvju8DMx4amt8ewj1PY9jfDaqMYXPeO3CZ
	 3f9CJKC/oH2D5/c7THyB6sR31THVNRSMvVKePdhVMhqU6jpQ32j9WShQOrvLYjKZde
	 ym6SvEJqJ/fj1aBuf2tNjZtZ8kmblI8YJQqXJu5uNfXDIZcvJQhE2wqAaktwzCRup8
	 SokeUBqcMPITA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RRsdp689Wz4wy8;
	Fri, 18 Aug 2023 16:38:38 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Russell King
 <linux@armlinux.org.uk>, "James E . J . Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, "David S . Miller" <davem@davemloft.net>,
 Arnd Bergmann <arnd@arndb.de>, Sergey Shtylyov <s.shtylyov@omp.ru>, Damien
 Le Moal <dlemoal@kernel.org>, Christoph Hellwig <hch@lst.de>, Jens Axboe
 <axboe@kernel.dk>
Subject: Re: [PATCH 3/9] powerpc: Remove <asm/ide.h>
In-Reply-To: <eb79960c5f9f72013b3b2f6d19461e5d8134fcc2.1692288018.git.geert@linux-m68k.org>
References: <cover.1692288018.git.geert@linux-m68k.org>
 <eb79960c5f9f72013b3b2f6d19461e5d8134fcc2.1692288018.git.geert@linux-m68k.org>
Date: Fri, 18 Aug 2023 16:38:36 +1000
Message-ID: <87bkf4x3bn.fsf@mail.lhotse>
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
Cc: linux-arch@vger.kernel.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:
> As of commit b7fb14d3ac63117e ("ide: remove the legacy ide driver") in
> v5.14, there are no more generic users of <asm/ide.h>.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/powerpc/include/asm/ide.h | 18 ------------------
>  1 file changed, 18 deletions(-)
>  delete mode 100644 arch/powerpc/include/asm/ide.h

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
