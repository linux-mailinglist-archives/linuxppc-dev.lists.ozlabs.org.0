Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8516AAEBD
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 10:24:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PTx9G2mW4z3cK8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 20:24:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PMrnpTMq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PTx8H4sZtz3bZv
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Mar 2023 20:23:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PMrnpTMq;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PTx8C0bydz4whh;
	Sun,  5 Mar 2023 20:23:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1678008188;
	bh=S5kZ8U1DxT09+WsN0usbweAzpxoqM+gTUtw71NO2hZY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PMrnpTMqfTNGy77Ve6cpOJPLTpaG1BSaXb77FTMa2BJ7XfCX3GSTu7WOIep1pbFWu
	 DzFuO74vj7b8pC8U/g772fxSec0GaN4NmEJANjSqxvvz74mD0I6Oq68qv6GQvTT0mn
	 NlRVdwUxd7vXNEUHzehDiM5/6Oi2HsiQz3s28QNQLyi0Rk/aZ2X7VIciMCyDUOFCmR
	 naembNI4QBOdZoRFPwCEuYfe8G1CFWpXyAIC7yMlhwqQ2SAN7MysEvFN8k56wuhQFc
	 LK6vvmPRnikQ/9vpIL+CL3NaW3y7w/tmqBbdzHqcfS6UqC1CqbZD+P83AOqT1MhLSn
	 0h03Q/guV/yjA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arch/*/io.h: remove ioremap_uc in some
 architectures
In-Reply-To: <20230303102817.212148-3-bhe@redhat.com>
References: <20230303102817.212148-1-bhe@redhat.com>
 <20230303102817.212148-3-bhe@redhat.com>
Date: Sun, 05 Mar 2023 20:23:05 +1100
Message-ID: <87sfej1rie.fsf@mpe.ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, Baoquan He <bhe@redhat.com>, arnd@arndb.de, linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, hch@infradead.org, linux-mm@kvack.org, mcgrof@kernel.org, geert@linux-m68k.org, linux-parisc@vger.kernel.org, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Baoquan He <bhe@redhat.com> writes:
> ioremap_uc() is only meaningful on old x86-32 systems with the PAT
> extension, and on ia64 with its slightly unconventional ioremap()
> behavior, everywhere else this is the same as ioremap() anyway.
>
> Here, remove the ioremap_uc() definition in architecutures other
> than x86 and ia64. These architectures all have asm-generic/io.h
> included and will have the default ioremap_uc() definition which
> returns NULL.
>
> Note: This changes the existing behaviour and could break code
> calling ioremap_uc(). If any ARCH meets this breakage and really
> needs a specific ioremap_uc() for its own usage, one ioremap_uc()
> can be added in the ARCH.

I see one use in:

drivers/video/fbdev/aty/atyfb_base.c:        par->ati_regbase = ioremap_uc(info->fix.mmio_start, 0x1000);


Which isn't obviously x86/ia64 specific.

I'm pretty sure some powermacs (powerpc) use that driver.

Maybe that exact code path is only reachable on x86/ia64? But if so
please explain why.

Otherwise it looks like this series could break that driver on powerpc
at least.

cheers
