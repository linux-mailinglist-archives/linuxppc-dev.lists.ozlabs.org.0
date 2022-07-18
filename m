Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B49F3577B02
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 08:31:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmXDj4p51z3cdN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 16:31:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rhhdlO5y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmXD62bVYz3bYs
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 16:31:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rhhdlO5y;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LmXD32nd5z4xXF;
	Mon, 18 Jul 2022 16:31:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1658125878;
	bh=k/N2K3A9Z5dV/oTr9hSFt64T6vlj0t235fSbwzPjkEA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rhhdlO5yl1t520u8BwcWmo9I5ryGffVzXJ8RE1EukbGFkVthHUiVLAjQDW9mzbv/g
	 OWnQlMsP8NiwLcTMDx/u2JG1Y845X4k4XCnsJBoiWa8UdmP575Nw0RWGtzsUbxe3Jo
	 bjBoqD+2lq0gKxXSMd0ODRCH8GSL8M6V7sL4NgfhjmUAkga44TSCl7UfnulRjDEHIo
	 FCaFHm+TySK1rfoT4o+dES2ZEbTrcYCPeHtbeg4lIr9pHGtIWMcl595MciqG3LLg/f
	 VdNtecuoOERxk91eMns13YSoniRlSGOaiEJZ8DZNFdGSbyIrboLkLaefUXVezPcmCK
	 4YiA9QdovohVg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2] random: handle archrandom in plural words
In-Reply-To: <20220717200356.75060-1-Jason@zx2c4.com>
References: <YtP1+MJ1tNdJA60l@zx2c4.com>
 <20220717200356.75060-1-Jason@zx2c4.com>
Date: Mon, 18 Jul 2022 16:31:11 +1000
Message-ID: <87a697dj9s.fsf@mpe.ellerman.id.au>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Johannes Berg <johannes@sipsolutions.net>, Harald Freudenberger <freude@linux.ibm.com>, "H . Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Borislav Petkov <bp@suse.de>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:
> The archrandom interface was originally designed for x86, which supplies
> RDRAND/RDSEED for receiving random words into registers, resulting in
> one function to generate an int and another to generate a long. However,
> other architectures don't follow this.
>
> On arm64, the SMCCC TRNG interface can return between 1 and 3 words. On
> s390, the CPACF TRNG interface can return between 1 and 32 words for the
> same cost as for one word. On UML, the os_getrandom() interface can return
> arbitrary amounts.
>
> So change the api signature to take a "words" parameter designating the
> maximum number of words requested, and then return the number of words
> generated.

On powerpc a word is 32-bits and a doubleword is 64-bits (at least
according to the ISA). I think that's also true on other 64-bit
architectures.

You could avoid any confusion by defining the API in terms of "longs"
rather than "words".

But that's just a comment, see what others think.

>  arch/powerpc/include/asm/archrandom.h |  30 ++------
>  arch/powerpc/kvm/book3s_hv.c          |   2 +-

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
