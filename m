Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 937C55EA0DC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 12:42:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbfTh4p8bz3c5w
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 20:42:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dYviKgQe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbfT50XFzz2xZ4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 20:42:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dYviKgQe;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MbfT156Rjz4xH5;
	Mon, 26 Sep 2022 20:41:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664188918;
	bh=HEZDX+hdmRlnC2dInj5wRFncKIFIv8zPT5vq6JPI16A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dYviKgQeC4a6K5nLk1Dv/VPO7kO6Ovmv762fsLquZbh3oMyW8e7qk702YBsbgN5qE
	 PVbdL1P0+kg6Bh9IzEemQH/382L9UuPQ9BidydMU8HR3oPEx7XoCmIDycRreWTAqa7
	 USdX9ohZ8DcdKHh5F6OpVUMaNOvuflL3F7TP+essB5wEl5qVR4FPEGukHEW3GJPEdZ
	 MeHuO/kz5SJayA+e18msw3Alk7VqCar6joboLex+d3R9lmFBE8lkOE++laCQaoecFx
	 hD599rgI+AfnyTF0Zdm6mIEUL30jz3aEuapDPVSnBQp2qc5oRu//AM7mNs/wEU+oQs
	 9I6Orm0RPT/QQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Is PPC 44x PIKA Warp board still relevant?
In-Reply-To: <ed43b0d6-d6d4-73d2-b4ab-637f6d2e310e@csgroup.eu>
References: <Yy/hv2fOLzdWOuvT@google.com>
 <ed43b0d6-d6d4-73d2-b4ab-637f6d2e310e@csgroup.eu>
Date: Mon, 26 Sep 2022 20:41:53 +1000
Message-ID: <87o7v2zaby.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ssx@qnx.com" <ssx@qnx.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Hi Dmitry
>
> Le 25/09/2022 =C3=A0 07:06, Dmitry Torokhov a =C3=A9crit=C2=A0:
>> Hi Michael, Nick,
>>=20
>> I was wondering if PIKA Warp board still relevant. The reason for my
>> question is that I am interested in dropping legacy gpio APIs,
>> especially OF-specific ones, in favor of newer gpiod APIs, and
>> arch/powerpc/platforms/44x/warp.c is one of few users of it.
>
> As far as I can see, that board is still being sold, see
>
> https://www.voipon.co.uk/pika-warp-asterisk-appliance-p-932.html

On the other hand it looks like PIKA technologies went bankrupt earlier
this year.

>> The code in question is supposed to turn off green led and flash red led
>> in case of overheating, and is doing so by directly accessing GPIOs
>> owned by led-gpio driver without requesting/allocating them. This is not
>> really supported with gpiod API, and is not a good practice in general.
>
> As far as I can see, it was ported to led-gpio by
>
> ba703e1a7a0b powerpc/4xx: Have Warp take advantage of GPIO LEDs=20
> default-state =3D keep
> 805e324b7fbd powerpc: Update Warp to use leds-gpio driver
>
>> Before I spend much time trying to implement a replacement without
>> access to the hardware, I wonder if this board is in use at all, and if
>> it is how important is the feature of flashing red led on critical
>> temperature shutdown?
>
> Don't know who can tell it ?

I would be surprised if anyone is still running upstream kernels on it.

I can't find any sign of any activity on the mailing list related to it
since it was initially merged.

> Maybe let's perform a more standard implementation is see if anybody=20
> screams ?

How much work is it to convert it?

Flashing a LED when the machine dies is nice, but not exactly critical,
hopefully the machine *isn't* dying that often :)

cheers
