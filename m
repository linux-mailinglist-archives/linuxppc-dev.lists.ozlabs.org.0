Return-Path: <linuxppc-dev+bounces-1139-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 008A996FE54
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2024 01:11:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0sRt69CBz2ydR;
	Sat,  7 Sep 2024 09:11:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725664298;
	cv=none; b=Zdo8YLr97Zjix+s1arYqY/teFAjJjOw840JFFk6L46Qix4Nc87Zg5S1e0nrAigdPiKr2ttChueusrF3yhSFHnoTS/uNMQd6RP2ySXCfbQZgv4hd5MbVK6mcUhGRo8Bx0guM9afHxQKaUG/FNEfXh15Ipu8PfFDcjgMPoYAB4VCamZgDDDR0GITVHaf8LL+Zd3UWrp9BxiNTZ+9iL40ySyKxwMUjPQFqvVAdoUua9UFGwVQubytybJjSCmf1hDBe1CKfgYwbXmJRpsLyOfx3uCWvQ132um9W4Nhl4CTnprOuZBP/PerrZtwBMNI/TqHCXX5tDytwGe+J3S80XjW4c/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725664298; c=relaxed/relaxed;
	bh=HEF6t61oQcZPeWEFUYghSOz/WmQUigaLAqj5lwawg9Y=;
	h=DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type; b=j3QAVcCjhATvWA/J+0/b+OvFk6zgo37sHUgJsQ/2XDIiuFLY5L4u25pSmRUkAEwNwTM/LSnnDRAdZN5SNjD/m02ua9RgI5rrkdD8whPJ7y3aOTdqgoc+iUH5HgiL64ovAc22SCHJM7dC6cDSwalNjdrHIuW90ZWhYpD90dxlaEcBuaIb4CbqFZete+nUjwHtagvARFTXYu8uPB7pzRLow9KL2BztH5fmgqeId8HZdqcha1uwJASQcV6MBXzhMeb0XWD+54vVZgMM5P2oBpTlC2M1iEp+/gRRQ5qFWMfbCUqmTqK5qQAbPWG5UYNOwQ6kfJVqq7CnIV0SUwoxlDOq/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Po55viVX; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Po55viVX;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0sRr6KBPz2yVB
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2024 09:11:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725664291;
	bh=HEF6t61oQcZPeWEFUYghSOz/WmQUigaLAqj5lwawg9Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Po55viVX1hlmgK10Q8yQDjvyM2VHZheLwnbXdnxlKNaW/54rsQJsaCNwJQjO1AX3P
	 WEwGP9gXr6Mfpng9r8/4K1F1BnVNo9dfXHUA+gYiQ7R7rTPT+iQjCXRLVrMH+0aeLE
	 bO1pQ5VJFH0MgjafH2HAS3Di72fu1PWEmnJsNNY5UIGArOnZ5mAnIvp1GJXMUf59Bz
	 9Lu2PD2+1F0krDeVAnsFPjuYYyI8+gfs36WPUNvpBU2NuV4bmvgB3cFQLCWPlCdw+k
	 st3B1BfRpe0lW6TEOmBQkZ4b2+83p43dY5KEczwDl/JI0OPfw3hADpcvERmJb2j9EA
	 8VMdqgg5LnAEw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0sRl3CtQz4wj1;
	Sat,  7 Sep 2024 09:11:31 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, nysal@linux.ibm.com
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.11-3 tag
In-Reply-To: <CAHk-=wj6L6Qb10jVk+eHH2D3oHFathTc2nnZRpKKbqKuO3Rkow@mail.gmail.com>
References: <87ttet3rz9.fsf@mail.lhotse>
 <CAHk-=wj6L6Qb10jVk+eHH2D3oHFathTc2nnZRpKKbqKuO3Rkow@mail.gmail.com>
Date: Sat, 07 Sep 2024 09:11:30 +1000
Message-ID: <87o7504btp.fsf@mail.lhotse>
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

Linus Torvalds <torvalds@linux-foundation.org> writes:
> On Fri, 6 Sept 2024 at 05:08, Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Please pull some more powerpc fixes for 6.11:
>>
>>   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.11-3
>
> Hmm. New pgp key? Please don't take me by surprise like this.

Yes, sorry. I switched to it a few weeks back but this is the first pull
request I've sent since.

> The key looks fine, I see the signature by Stephen Rothwell, but I get
> worried when I suddenly see a new signature with no notice and then
> have to go looking around for it.

It's also signed by my old key.

I posted it to the keys repo:
  https://lore.kernel.org/keys/87o75pp2bt.fsf@mail.lhotse/

But yeah I still should have mentioned it in the pull request.

cheers

