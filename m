Return-Path: <linuxppc-dev+bounces-1160-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E714970CED
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 07:24:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2FdC098tz2yGs;
	Mon,  9 Sep 2024 15:24:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725859471;
	cv=none; b=RTZteLmsx9AFs4WXzYRvA9aSbwPydldV0wNYzj14S4RCGhc4PBJ7uhIeBvbImOPn9dFhsGcNsO6JTWh7HbFTXrA6W431VHjBH3RW2j/EXFy9SK71HT7CbYE9f3RgT/QfGtrCgeEy2lXxIjNhU9WTxjyWjwpidVoxYK9fLr3rh0+L82s+KWKQNBbeniSAfVGWpKKWQrTLbfJg1mUWnRfFMbkYc+KddGoMqqQNkB2ushGJc4537U2vMawtY2mGDizeJBXCnr/YFiMuEuAhyaNWJ4BHrdMn6dLFrHyOvmLoJaBv2Ylx/UoBkZVkC+Zm73VSi20RNw8KU/ngGh08sD3oWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725859471; c=relaxed/relaxed;
	bh=cCB2L1cnVASHPDdYnubQAwM90zr1eiMtQbm3lIYAbsU=;
	h=DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type; b=YUvPIEoB2CPpiTXQSv8nxSK+1u7TAjB2p7fKJNqKqhkHWhnphGvTGoPw4UJle+9J2n0uMGREoGzGAicfWJ9A36/3HLWz2HOfU8SVVKQtwDHdlwK41rjwI1/i60N1Y6BItyhiPBFDrlC3wzoP1rNSkBWOvh4al3Ig8ppXBJvXvfkDuZnnGq4YvaAjaEZ4+t9JBOEBjUSh1vibzmtncRdnIIhfuc2pmGchpBiazge1g83q3YThYNpzEI41q+bE3oZC4dbUxjbGzk7j8iDCQhgugKQ+bcvbFXE5vOMSU9KLCpHeVratQ9NoCspawA8dZ/LeS7aUHKK0RbDGEP8K9Vg76g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Yhiap7YT; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Yhiap7YT;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2Fd95yFwz2xrM
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Sep 2024 15:24:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725859464;
	bh=cCB2L1cnVASHPDdYnubQAwM90zr1eiMtQbm3lIYAbsU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Yhiap7YT8DMkQCE5NEM6VwqNiNrlpYt9iT43aLwv/I5088EUSl3+e4hU6TuJI07gA
	 YhFr51nQo5X2W6qoR3BhfGoYwnbU4ZVgz0ttNTTPT42FVovr/ICVrYDNCU+nQfqQVM
	 iiojpGsILZ9nMPWx3Ns+HHmw6DM6KnfA0oB9Fm1AojoAVLoKF+xWrZQpG1+blcbQg5
	 UDUyx3LHDHpRVojuudCq07A/oy5aQwunEXU+AZKeQVyBSYbyzpQQON2I/UHm4kU4uG
	 iBckHx8VgsMNhbJ2ZW5JLrNk2YrfWns2x4ERI7sGGxbgzMYsE8acOp/KdyHWdf+hfv
	 1LkaFvkkFbgQg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2Fd34vXgz4wb0;
	Mon,  9 Sep 2024 15:24:23 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nicholas
 Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>, Andrei Vagin <avagin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/vdso: Fix VDSO data access when running in
 a non-root time namespace
In-Reply-To: <ZtsKW3LLfwmz7icC@zx2c4.com>
References: <700dbf296d02e32376329774be35cfbead08041d.1725611321.git.christophe.leroy@csgroup.eu>
 <87r09x3r9v.fsf@mail.lhotse> <ZtsG9Q6vKD9XOsZN@zx2c4.com>
 <ZtsKW3LLfwmz7icC@zx2c4.com>
Date: Mon, 09 Sep 2024 15:24:21 +1000
Message-ID: <87jzfl4cxm.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:
> On Fri, Sep 06, 2024 at 03:43:17PM +0200, Jason A. Donenfeld wrote:
>> On Fri, Sep 06, 2024 at 10:23:08PM +1000, Michael Ellerman wrote:
>> > Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> > > When running in a non-root time namespace, the global VDSO data page
>> > > is replaced by a dedicated namespace data page and the global data
>> > > page is mapped next to it. Detailed explanations can be found at
>> > > commit 660fd04f9317 ("lib/vdso: Prepare for time namespace support").
>> > >
>> > > When it happens, __kernel_get_syscall_map and __kernel_get_tbfreq
>> > > and __kernel_sync_dicache don't work anymore because they read 0
>> > > instead of the data they need.
>> > >
>> > > To address that, clock_mode has to be read. When it is set to
>> > > VDSO_CLOCKMODE_TIMENS, it means it is a dedicated namespace data page
>> > > and the global data is located on the following page.
>> > >
>> > > Add a macro called get_realdatapage which reads clock_mode and add
>> > > PAGE_SIZE to the pointer provided by get_datapage macro when
>> > > clock_mode is equal to VDSO_CLOCKMODE_TIMENS. Use this new macro
>> > > instead of get_datapage macro except for time functions as they handle
>> > > it internally.
>> > >
>> > > Fixes: 74205b3fc2ef ("powerpc/vdso: Add support for time namespaces")
>> > > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> >  
>> > Oops.
>> > 
>> > I guess it should also have:
>> > 
>> >   Cc: stable@vger.kernel.org # v5.13+
>> >   Reported-by: Jason A. Donenfeld <Jason@zx2c4.com>
>> >   Closes: https://lore.kernel.org/all/ZtnYqZI-nrsNslwy@zx2c4.com/
>> > 
>> > Jason how do you want to handle this?
>> > 
>> > I can put patch 1 in a topic branch that we both merge? Then you can
>> > apply patch 2 on top of that merge in your tree.
>> > 
>> > Or we could both apply patch 1 to our trees, it might lead to a conflict
>> > but it wouldn't be anything drastic.
>> 
>> The merge window for 6.12 is pretty soon. Why don't I just take this in
>> my random.git tree (with your ack) as a prereq to the ppc vDSO work.
>> It'll slide in _before_ Christophe's other commits, and then the
>> separate vgetrandom fixup will be squashed in the right place there.
>> 
>> And then it'll hit stable when that's submitted for 6.12. It's an old
>> bug that nobody noticed, and time namespaces are kind of obscure, so I
>> think waiting a week and a half for the merge window to open is probably
>> fine.
>
> So I've just done this (preliminarily, pending Michael's approval), and
> it comes out decently clean and everything works fine.

Sorry, didn't check email over the weekend.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

> The commit
> sequence becomes:
>
> ...
> c206cd11e7f2 selftests: vDSO: ensure vgetrandom works in a time namespace
> ...
> e59cc170924c powerpc/vdso: Fix VDSO data access when running in a non-root time namespace
> 887e7a77dc99 mm: Define VM_DROPPABLE for powerpc/32
> f2ee39ec52c2 powerpc/vdso32: Add crtsavres
> 994148e87080 powerpc/vdso: Refactor CFLAGS for CVDSO build
> c49ec121a6dd powerpc/vdso: Wire up getrandom() vDSO implementation on VDSO32 <-- fixed up
> a8a5e16cde32 powerpc/vdso: Wire up getrandom() vDSO implementation on VDSO64
>
> So I'm happy with this.

Thanks.

cheers

