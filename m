Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBB7577BF4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 08:55:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmXmR00d3z2xKm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 16:55:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256 header.s=DKIM header.b=W+WzCvv0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iram.es (client-ip=130.206.19.169; helo=mx02.puc.rediris.es; envelope-from=paubert@iram.es; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256 header.s=DKIM header.b=W+WzCvv0;
	dkim-atps=neutral
X-Greylist: delayed 429 seconds by postgrey-1.36 at boromir; Mon, 18 Jul 2022 16:55:16 AEST
Received: from mx02.puc.rediris.es (outbound1sev.lav.puc.rediris.es [130.206.19.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmXlm1fpYz3bYs
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 16:55:15 +1000 (AEST)
Received: from mta-out02.sim.rediris.es (mta-out02.sim.rediris.es [130.206.24.44])
	by mx02.puc.rediris.es  with ESMTP id 26I6l6DX004035-26I6l6DZ004035
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 18 Jul 2022 08:47:07 +0200
Received: from mta-out02.sim.rediris.es (localhost.localdomain [127.0.0.1])
	by mta-out02.sim.rediris.es (Postfix) with ESMTPS id E2B90C0F386;
	Mon, 18 Jul 2022 08:47:04 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta-out02.sim.rediris.es (Postfix) with ESMTP id 9D9D7C17E64;
	Mon, 18 Jul 2022 08:47:03 +0200 (CEST)
X-Amavis-Modified: Mail body modified (using disclaimer) -
	mta-out02.sim.rediris.es
Received: from mta-out02.sim.rediris.es ([127.0.0.1])
	by localhost (mta-out02.sim.rediris.es [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 9qTGP4eSaCwO; Mon, 18 Jul 2022 08:47:03 +0200 (CEST)
Received: from lt-gp.iram.es (haproxy02.sim.rediris.es [130.206.24.70])
	by mta-out02.sim.rediris.es (Postfix) with ESMTPA id 625F7C0F386;
	Mon, 18 Jul 2022 08:46:57 +0200 (CEST)
Date: Mon, 18 Jul 2022 08:46:52 +0200
From: Gabriel Paubert <paubert@iram.es>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] random: handle archrandom in plural words
Message-ID: <YtUB3Iola9R0OwN6@lt-gp.iram.es>
References: <YtP1+MJ1tNdJA60l@zx2c4.com>
 <20220717200356.75060-1-Jason@zx2c4.com>
 <87a697dj9s.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a697dj9s.fsf@mpe.ellerman.id.au>
X-FE-Policy-ID: 23:8:4:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=iram.es; s=DKIM; c=relaxed/relaxed;
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type;
 bh=Wg38rCj2x4YYjxQL6BVoKGWVRrD69jESiDVvF8U5xmg=;
 b=W+WzCvv0eeULltUer/AJgfAyg3adRlOqeJJCwsrUFP/G/1bkoAxquvG21QbEnxEpYRVTkoFuvkrF
	pFNh8TEZdk4pCeDgow0o89jeSjCXtkmJXgaFKDx1itCdOomjBrRbgIeQKUrq8tmiKY1Z5NkfmwGQ
	155G1h9LL3VMAGWQLv70SdVbh1DkWNIn1mUnMGUmaWmypGQt5UH6NJoiEwPM3hbYPxWOIVkKFHUf
	E5xXAs1ZvUL2DL1A1D19oeXmI5r8n7qPsXGAh86o8d4DDP7UwdPlWaVPIoson7YntX3H6FrX2DAa
	27+DFutwLm3R/a3QqGl8Dt0uQsGYqS+KPGbBow==
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
Cc: linux-s390@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <hca@linux.ibm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Harald Freudenberger <freude@linux.ibm.com>, "H . Peter Anvin" <hpa@zytor.com>, Johannes Berg <johannes@sipsolutions.net>, Borislav Petkov <bp@suse.de>, linuxppc-dev@lists.ozlabs.org, Alexander Gordeev <agordeev@linux.ibm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 18, 2022 at 04:31:11PM +1000, Michael Ellerman wrote:
> "Jason A. Donenfeld" <Jason@zx2c4.com> writes:
> > The archrandom interface was originally designed for x86, which supplies
> > RDRAND/RDSEED for receiving random words into registers, resulting in
> > one function to generate an int and another to generate a long. However,
> > other architectures don't follow this.
> >
> > On arm64, the SMCCC TRNG interface can return between 1 and 3 words. On
> > s390, the CPACF TRNG interface can return between 1 and 32 words for the
> > same cost as for one word. On UML, the os_getrandom() interface can return
> > arbitrary amounts.
> >
> > So change the api signature to take a "words" parameter designating the
> > maximum number of words requested, and then return the number of words
> > generated.
> 
> On powerpc a word is 32-bits and a doubleword is 64-bits (at least
> according to the ISA). I think that's also true on other 64-bit
> architectures.

IIRC, this is (or was) not the case on Alpha, where word was defined as
16 bits. All assembly mnemonics had w for 16 bits, l for 32 bits, and q
for 64 bits.

Blame the PDP-11...

	Gabriel

> 
> You could avoid any confusion by defining the API in terms of "longs"
> rather than "words".
> 
> But that's just a comment, see what others think.
> 
> >  arch/powerpc/include/asm/archrandom.h |  30 ++------
> >  arch/powerpc/kvm/book3s_hv.c          |   2 +-
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> 
> cheers
 

