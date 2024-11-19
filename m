Return-Path: <linuxppc-dev+bounces-3429-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7300A9D1ECF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2024 04:26:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsqfC15rlz2yGY;
	Tue, 19 Nov 2024 14:26:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731986787;
	cv=none; b=lB0VVCdF8RYyFUHTNV/PFOty1YYebzGtjqU+3rpO75YkwzSYlEjl2mcHY+giYp5oPKPHFnHWsSYdlzn5WXedVOkGD7BoLFebBOVf/UTsISW0sJSIalQ1ZVvowcYBv+zd7WF+1SIiimOKAuIbufiOunEoY3l/4yRHA1Z5IFBUEg4lSPz9/5R0I9KW9ZMzuLHO3xN/N8Y82GC3uQtpr9Kn1DtL54Tx2cbFyIe2WDVZ4ZF/a6SWezYRE8JDmbuWT1RnCjBhNroNNO+ODinEFWciy+C2WLkV6wHgZ81twJ+KC3GO4YZcCxovZkkJ7vc1EqAXm+Js4H9V5P4xZHPOp4+HvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731986787; c=relaxed/relaxed;
	bh=BXuxAoEzRYb2W+q6kELsZbpr1GUjRm1uGV4br+FTP7w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bPbq/fN3uBIo46TrC/Jf1g+8bzdQupOamRXMScAosv7UqRIXKRIntjJVIIbxcnKGLDJ+e3KBiNwb726Npcexk27na1mJl68YyZjLGM8HUDv3OebOU/37RMXLGfoXIKP+ZXvbICCunwCTi6nXHeDKs0mP8QOdsCpXbdFfgPW9jD0DKOJMO4ucWzlAn+2AhCvCvIG7As2+r30rgPGVXPsDuMSAcOJ6aTH+4nrNpEiMd9wEkROZFB42Yn1fanW/jCgdx54VCgmkw2imEr1r9GU8Cs+Z6FLalmNugjL1fhFZrN36UaWgfRie+Y/rl4DJkNIeVpL5rlAbGU7JzQcJlI1v8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UpYG0Y2Q; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UpYG0Y2Q;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xsqf81KW6z2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2024 14:26:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731986781;
	bh=BXuxAoEzRYb2W+q6kELsZbpr1GUjRm1uGV4br+FTP7w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UpYG0Y2Q+xU1kzReEfRx5MofeOR1o4vGyM25YhdBiR8Lx+EOPjCfbaIcrhb9cf4g6
	 Lf7vWEatg5c/G6GcLWxPnChn/fQuLFD/epwcaIJXZXje6PFHsmWOAP7qbpBsuAmlDf
	 paNMrRffnYqhjMsL1yRj8HybfEbp7G/uP1EUuftUl0fOkpxvUejVxEI4ajmdehXAre
	 5oqJ73c6b/1hqwIeJudU582guetJkS7F5eJ8DpSyZZdJ19RuVmp0dhrWeGFhQ26V04
	 J2tyqPzjX8JVra6yiAWuOy13WrX2HjFp1xjNsiAXYx6W82XizaQ2rV/EEj+z/m5uBj
	 BejTgqLfCxIDQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xsqf40ZX5z4xfX;
	Tue, 19 Nov 2024 14:26:19 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Michael Ellerman <patch-notifications@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/vdso: Remove unused clockmode asm offsets
In-Reply-To: <20241118075902-8b0cf2ea-d772-4c05-9b5d-14aba194e649@linutronix.de>
References: <20241113-vdso-powerpc-asm-offsets-v1-1-3f7e589f090d@linutronix.de>
 <173184539749.890800.8297350541963703609.b4-ty@ellerman.id.au>
 <20241118075902-8b0cf2ea-d772-4c05-9b5d-14aba194e649@linutronix.de>
Date: Tue, 19 Nov 2024 14:26:22 +1100
Message-ID: <877c8zj44h.fsf@mpe.ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de> writes:
> Hi Michael,
>
> On Sun, Nov 17, 2024 at 11:09:57PM +1100, Michael Ellerman wrote:
>> On Wed, 13 Nov 2024 09:06:58 +0100, Thomas Wei=C3=9Fschuh wrote:
>> > These offsets are not used anymore, delete them.
>> >=20
>> >=20
>>=20
>> Applied to powerpc/next.
>>=20
>> [1/1] powerpc/vdso: Remove unused clockmode asm offsets
>>       https://git.kernel.org/powerpc/c/d7a82238cb8c77d4ed8cc97cd556c5f3e=
64bc749
>
> Thanks!
>
> Is there any chance to get this merged as part of topic/vdso?
=20
I could apply it there, but I don't think it will be necessary, because
topic/vdso will be empty vs mainline as soon as I send my pull request
for v6.13.

> My vdso rework patches for the 6.14 cycle rely on these removals.

Assuming you rebase that series onto v6.13-rc1 or later, this commit
will be included in that base.

But let me know if I'm misunderstanding something.

cheers

