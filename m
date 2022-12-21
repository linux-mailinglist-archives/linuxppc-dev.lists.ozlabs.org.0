Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD9B6537C6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Dec 2022 21:49:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NcltX1cc6z3c6F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Dec 2022 07:49:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ugzfuQ/F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ugzfuQ/F;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NclsZ4zJ5z3bNy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Dec 2022 07:48:50 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0351260CA0;
	Wed, 21 Dec 2022 20:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB2A8C433D2;
	Wed, 21 Dec 2022 20:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671655726;
	bh=V20cak5a7oCUhu/ElPJQDWDEPcrzF+kUY7ml3BOPRAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ugzfuQ/F8El0jwSlwYMle/yRAjDhWVugkamPioI3pUY+8UDkXBGc1PHBwn8DGQkiv
	 IGRQdriSNr3uGD9Ra03+7w75b6rRHNUSxRCD1N3Womaolj2G7ePA+z2/+YI6XaA038
	 dsaLm+ie15QOiyOS3pJe8Jg3FR4zF+ya0zTgHOiD7MuP0XLvhw89RIC75wVV9pWdbf
	 jRRXfZYGifZfd+IMnojvmz5kzGVG4J9guOfY4ep/o/vKfNfIRKcUFpeIobehqrSXp1
	 svckhF3Mu4pRx6vuFsEYboC9GspJv7a9W5o3/1sVPpOlDoGHkl8XOjHvwTBloaMKtP
	 ijFjIzlG7t9wg==
Date: Wed, 21 Dec 2022 12:48:44 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v12 0/6] implement getrandom() in vDSO
Message-ID: <Y6NxLCyk6XVJu2iM@sol.localdomain>
References: <20221212185347.1286824-1-Jason@zx2c4.com>
 <86cfa465-2485-ff24-16f5-9014e25a0e98@csgroup.eu>
 <Y6IXWltScF2CI1v3@gmail.com>
 <Y6MXbTAHBSR5WBrU@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y6MXbTAHBSR5WBrU@zx2c4.com>
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
Cc: Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, Carlos O'Donell <carlos@redhat.com>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "patches@lists.linux.dev" <patches@lists.linux.dev>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 21, 2022 at 03:25:49PM +0100, Jason A. Donenfeld wrote:
> On Tue, Dec 20, 2022 at 08:13:14PM +0000, Eric Biggers wrote:
> > On Tue, Dec 20, 2022 at 05:17:52PM +0000, Christophe Leroy wrote:
> > > Hi Jason,
> > > 
> > > Le 12/12/2022 à 19:53, Jason A. Donenfeld a écrit :
> > > > Changes v11->v12:
> > > > ----------------
> > > > - In order to avoid mlock()ing pages, and the related rlimit and fork
> > > >    inheritance issues there, Introduce VM_DROPPABLE to prevent swapping
> > > >    while meeting the cache-like requirements of vDSO getrandom().
> > > > 
> > > >    This has some tenticles in mm/ and arch/x86/ code, so I've marked the
> > > >    two patches for that as still RFC, while the rest of the series is not
> > > >    RFC.
> > > > 
> > > > - Mandate that opaque state blobs don't straddle page boundaries, so
> > > >    that VM_DROPPABLE can work on page-level granularity rather than
> > > >    allocation-level granularity.
> > > > 
> > > > - Add compiler barriers to vDSO getrandom() to prevent theoretical
> > > >    reordering potential.
> > > > 
> > > > - Initialize the trials loop counter in the chacha test.
> > > 
> > > I would have liked to give it a try on powerpc, but the series 
> > > conflicts. I tried both on v6.1 and on linus/master from now:
> > > 
> > 
> > Same here, I can't figure out how to apply this series.
> 
> Rebased v13 posted: https://lore.kernel.org/all/20221221142327.126451-1-Jason@zx2c4.com/
> 

Thanks, it is always good to give the *actual* base commit though, preferably
with the --base option to git format-patch.  "Latest random.git master branch"
changes over time.

- Eric
