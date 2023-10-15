Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A277C988E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Oct 2023 12:05:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rBCIV0Qe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S7bTy6rrdz3vfT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Oct 2023 21:05:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rBCIV0Qe;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S7bRD6jNGz30P0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Oct 2023 21:03:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697364200;
	bh=kOWLjiDpvHE5NpXC9jG7b3FrojOzk472gOHlXk+Q33c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rBCIV0QeEgpaqeHWTRKOjcXQAoTKonEC1zu+hDBOH9+1Lc2hYuPynU4INIFqkiA/9
	 iPUXL+F/5yeB7Nao50xfT0Ax3C08fkIRGM1bMX+GvTCE6/4Nk7MVZkcRLQwLlS6Tmm
	 PcnTnaMG8KdcCWiCvQz1bljKwiDjGWj1FieYG/R+TOLyOetUuIeFj4ueNa+RMQIc4Y
	 O9I/8i8gSeqqe71JXX0ORfLeL2g34YiGh648nVWMI1y9iZf4G/knP52TDSkFDI0Int
	 zXbIUyjxqv2dObj9CC6WDcLmZFRhqEGLmjn+HgkXuh9P5bQ5heu5lEDp5YcQzBRoLV
	 ied1zNMhSWtbw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S7bRD5hCvz4wnx;
	Sun, 15 Oct 2023 21:03:20 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1695659959.git.christophe.leroy@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
Subject: Re: (subset) [PATCH v2 00/37] Implement execute-only protection on powerpc
Message-Id: <169736402375.957740.6017054245951697068.b4-ty@ellerman.id.au>
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

On Mon, 25 Sep 2023 20:31:14 +0200, Christophe Leroy wrote:
> This series reworks _PAGE_FLAGS on all platforms in order
> to implement execute-only protection on all powerpc.
> 
> For all targets except 40x and 604 it will be a real execute-only
> protection as the hardware and/or software allows a distinct protection.
> 
> For 40x and 604 that's a poor's man execute-only protection in the
> way that once the page is in the TLB it can be executed. But it's
> better than nothing and allows to have a similar implementation for
> all sorts of powerpc.
> 
> [...]

Patches 1 and 2 applied to powerpc/fixes.

[01/37] powerpc/8xx: Fix pte_access_permitted() for PAGE_NONE
        https://git.kernel.org/powerpc/c/5d9cea8a552ee122e21fbd5a3c5d4eb85f648e06
[02/37] powerpc/64e: Fix wrong test in __ptep_test_and_clear_young()
        https://git.kernel.org/powerpc/c/5ea0bbaa32e8f54e9a57cfee4a3b8769b80be0d2

cheers
