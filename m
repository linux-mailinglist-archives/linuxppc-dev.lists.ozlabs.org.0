Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B09B281EB4A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 02:28:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=izQIcLTJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0DYh3QdJz30gL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 12:28:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=izQIcLTJ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0DXv2yQMz2xLW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 12:27:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1703640478;
	bh=QIxNC+UtPZ9fdWVyvlFAtQ7i7Fdd0rTd3T0h2bbYOoU=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=izQIcLTJSrLGWpFUsxHH/GbznQU5adp6cySwFrEdUqnvAMjZpkOBbGj9K11f5q49J
	 EwwtKQX1XPfo89rIuRbgyE3riPnMtWEMYee0lFyn1q1ygY60kuaHF1bTtnMirJNyyT
	 viyahfSEgGge7xavr1zgowclEw+23w+8rJi2bGTj3jGrnfiJOv6W8gq9eiMuYc4Ujd
	 CR2RKqMYih0f8uPXx/vAbdqYcTtvPNh9WkiTRishzbYw3Gsm8qG9NOcW9lCqhqJS7o
	 GV8A7GnEi6BlmQsTgbHcz7OeVQydCLs042VUkhvYUJOky/vYpgXrc2PLS3Uv027SOF
	 qExLsQpJ/DiyQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T0DXt3sdWz4xGC;
	Wed, 27 Dec 2023 12:27:58 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Geoff Levand <geoff@infradead.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/ps3_defconfig: Disable PPC64_BIG_ENDIAN_ELF_ABI_V2
In-Reply-To: <df906ac1-5f17-44b9-b0bb-7cd292a0df65@infradead.org>
References: <df906ac1-5f17-44b9-b0bb-7cd292a0df65@infradead.org>
Date: Wed, 27 Dec 2023 12:27:58 +1100
Message-ID: <87zfxwjuxt.fsf@mail.lhotse>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Geoff Levand <geoff@infradead.org> writes:
> Commit 8c5fa3b5c4df3d071dab42b04b971df370d99354 (powerpc/64: Make ELFv2 the
> default for big-endian builds), merged in Linux-6.5-rc1 changes the calling ABI
> in a way that is incompatible with the current code for the PS3's LV1 hypervisor
> calls.

I'll take this for now.

But medium term we would like to switch to only using ELFv2, so it would
be good if we can work out what the actual problem is.

> This change just adds the line '# CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2 is not set'
> to the ps3_defconfig file so that the PPC64_ELF_ABI_V1 is used.
>
> Fixes run time errors like these:
>
> 	BUG: Kernel NULL pointer dereference at 0x00000000
> 	Faulting instruction address: 0xc000000000047cf0
> 	Oops: Kernel access of bad area, sig: 11 [#1]
>
> 	Call Trace:
> 	[c0000000023039e0] [c00000000100ebfc] ps3_create_spu+0xc4/0x2b0 (unreliable)
> 	[c000000002303ab0] [c00000000100d4c4] create_spu+0xcc/0x3c4
> 	[c000000002303b40] [c00000000100eae4] ps3_enumerate_spus+0xa4/0xf8

That can't be the first hvcall we've done, there's one in
ps3_setup_arch(). So I guess only some hcalls are failing?

cheers
