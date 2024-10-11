Return-Path: <linuxppc-dev+bounces-2109-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E2799A19D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 12:39:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ36J1h1Vz3bwf;
	Fri, 11 Oct 2024 21:39:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728643192;
	cv=none; b=H3zxTKtoRJTdpwxoSaXmOLpgK93l7AsCWoHap/3AtVlwJXpgmUwAR2cdgi1K1u1hWJkvHUt55gpVqtadMk0VMheKKwfYoZiSeyMjbl9rRDgQaZ58gcJnSG5b1Rn+DXToQ08wVYypIJ+pDIY6OMUx7D3QZc2VuEXJFQVeZzhfqXETheTsEjX+TQFJl5gvzGjVk/lAGsnojALG47ImcGg1jmtS+pRufcZV5UpvkdWkbk6oWK68DmVQ/gSh20HKEpe+GzmBnR5OM4iQubHUPxCTcRze+mXvvicED4ZvroQ06UO4h26fh3n70TEKrvMldrlNYQmfwnwFH5VcE1O+Zx7w8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728643192; c=relaxed/relaxed;
	bh=jULBzTk3CDTvnIp8S8qdm9jX+CRuhYTgoOkcmDLNJPQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HZmzr/M849gkTAabTbvkXsRd9DwU8N50ikCPZHbZbZE7tCm84VX1zGhHMF+5ZJr9bXgyTnINXFYdwbuH+RG4WHwaQGKm7MeHbTJAI2FCz5owqbKCd/L8MLhQw8fihqRKGFOk4bHWnmqha0xQM6BTL/YN/ixlmI3/hCRPyzzxfxQFLZHQ1Q48yrJXzgvhRYKfot0MuSu+n90DgBSS32ZbcCoGwhLzxMqHZZEtzGwQIJm5vzVy5uFgAvITTFyBVhZwQM1ThSxNTkM2jpf0DLRJAl+pZUVXL7qELqLAsZVVvl/JPBD4aU/MhTNpokyfvqT3dic7XzVlGbMLtyetstVOyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nu/iZllj; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nu/iZllj;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ36H4DCxz3bw9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 21:39:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1728643190;
	bh=jULBzTk3CDTvnIp8S8qdm9jX+CRuhYTgoOkcmDLNJPQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nu/iZlljRycou9HLfh9m7/sPKwDLX3kiMGcdLI1LggQZTACImAY7NBSyXcLzCCcSl
	 vMT+Q/Pj/kB88F4l+dxva22ZvFXCT+9z5ccEpMbH0fn7MBSmO5KUjbMsxA3jjiwzi5
	 t2BAEfxADz+htlc7ThCgf+H63xnXxS0fLZ504qJcuCQERXzYZxTj7gbs+7oC+nopnJ
	 bwUdsfDV7RHkXzxV53mjEiRjUTFcZr1ZxwUK5f0eTU0cbxOo5VIjxBV8/95r3hFsbx
	 oT1yuQ3ZpoBCGNTDPtbDyF+UtvKUB+F16VXK7yGKeVjY/HKVhy+QBoz0kcNUj3gmqM
	 Oy9c6YAsr5S6Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XQ36G3fjkz4xN6;
	Fri, 11 Oct 2024 21:39:50 +1100 (AEDT)
From: Michael Ellerman <michael@ellerman.id.au>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] powerpc/vdso: Implement __arch_get_vdso_rng_data()
In-Reply-To: <ZwQMPmfG5zDGz1Wr@zx2c4.com>
References: <0557d3ec898c1d0ea2fc59fa8757618e524c5d94.1727858295.git.christophe.leroy@csgroup.eu>
 <a1a9bd0df508f1b5c04684b7366940577dfc6262.1727858295.git.christophe.leroy@csgroup.eu>
 <Zv7HcuhVH1uM9BNI@zx2c4.com>
 <EF78F2DB-7219-407B-9017-990462128B13@ellerman.id.au>
 <Zv_1tqMf-RIXapBD@zx2c4.com> <ZwQMPmfG5zDGz1Wr@zx2c4.com>
Date: Fri, 11 Oct 2024 21:39:50 +1100
Message-ID: <87ttdi6hzd.fsf@mail.lhotse>
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
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:
> On Fri, Oct 04, 2024 at 04:03:34PM +0200, Jason A. Donenfeld wrote:
>> On Fri, Oct 04, 2024 at 08:52:40PM +1000, Michael Ellerman wrote:
>> > 
>> > 
>> > On October 4, 2024 2:33:54 AM GMT+10:00, "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>> > >Hey Christophe, Michael,
>> > >
>> > >This series actually looks pretty okay to me. I realize ThomasW is
>> > >working on more generic cleanups that might obliterate the need for
>> > >this, and that may or may not wind up in 6.13. But, I was thinking, this
>> > >seems like a good correct thing to do, and to do it now for 6.12, maybe
>> > >as a fix through the powerpc tree. Then ThomasW can base his work atop
>> > >this, which might wind up including the nice lr optimizations you've
>> > >made. And then also if ThomasW's work doesn't land or gets reverted or
>> > >whatever, at least we'll have this in tree for 6.12.
>> > >
>> > >Michael - what do you think of that? Worth taking these two patches into
>> > >your fixes?
>> > 
>> > I agree the series looks good. But they're not fixes by my reading, so I'd be inclined to put them in next for v6.13?
>> 
>> They're "close enough" to fixes. The get_realdatapage stuff is super
>> wonky and weird and it's quite good Christophe has gotten rid of it.
>> Returning NULL from the generic accesor function never really sat right
>> and looks buggy even if it does work. But more to the point, given the
>> other scheduled churn for 6.13, it's going to be a tree-clashing
>> nightmare to get this in later. And this Sunday is rc2 only, so why not.
>
> Bumping to top of the box.

Ack. It was too late for rc2, and I'm naturally cautious, so I decided
these would go into next.

We can handle any merge conflicts with a topic branch.

cheers

