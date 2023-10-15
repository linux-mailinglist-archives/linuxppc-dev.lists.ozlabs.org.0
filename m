Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BE17C988C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Oct 2023 12:04:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=neT1iSdE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S7bS52W3nz3cB0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Oct 2023 21:04:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=neT1iSdE;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S7bRD3sndz30P3
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Oct 2023 21:03:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697364200;
	bh=Q/bzuX+XRukXINWRk6WjTJ0Dsx+nhlcsHcO34kFVNyE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=neT1iSdEvJEcD8Pn72Ik6GoscWZUJeCY38+sefDfpP/cZ/H9negXKQfnF+Xdp/jrL
	 XzLx3TVEfz6NA4T16Ur8c5kFIPjVBJMT4BGYBdZ+Z3cud75R4KoVY0d3WV5ZZfW7wT
	 J3YtJqEkOGoncq3HX3EfKUCrRmjHyOBGsgyJ+/Fi5ETCR07+WTSkeg6ANyBwonK9yN
	 vRWsxK2S5N9gA0qXYntot79FAtWjCvgzxej+HkNanHkeoGqio0YETIIFqn2h5gBjJk
	 41K7/mZQhAkYeW1JKRgNj4Z83/mYwegZkZiagoWAdHcZag4KANCc+hzSvDxgHI16lZ
	 zYt4YnDHCr9vw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S7bRD1Djwz4wnw;
	Sun, 15 Oct 2023 21:03:20 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <066caa6d9480365da9b8ed83692d7101e10ac5f8.1695657339.git.christophe.leroy@csgroup.eu>
References: <066caa6d9480365da9b8ed83692d7101e10ac5f8.1695657339.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/85xx: Fix math emulation exception
Message-Id: <169736402375.957740.5992745074331848586.b4-ty@ellerman.id.au>
Date: Sun, 15 Oct 2023 21:00:23 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 25 Sep 2023 17:55:51 +0200, Christophe Leroy wrote:
> Booting mpc85xx_defconfig kernel on QEMU leads to:
> 
> Bad trap at PC: fe9bab0, SR: 2d000, vector=800
> awk[82]: unhandled trap (5) at 0 nip fe9bab0 lr fe9e01c code 5 in libc-2.27.so[fe5a000+17a000]
> awk[82]: code: 3aa00000 3a800010 4bffe03c 9421fff0 7ca62b78 38a00000 93c10008 83c10008
> awk[82]: code: 38210010 4bffdec8 9421ffc0 7c0802a6 <fc00048e> d8010008 4815190d 93810030
> Trace/breakpoint trap
> WARNING: no useful console
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/85xx: Fix math emulation exception
      https://git.kernel.org/powerpc/c/8e8a12ecbc86700b5e1a3596ce2b3c43dafad336

cheers
