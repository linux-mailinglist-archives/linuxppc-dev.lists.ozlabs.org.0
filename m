Return-Path: <linuxppc-dev+bounces-9204-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5598AD11B7
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jun 2025 11:44:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bFVX53ky1z301n;
	Sun,  8 Jun 2025 19:44:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749375893;
	cv=none; b=djl/o6Bm6/8TkKTjwRARrqvWZjWkZ+0nB7ro/l2FhfB2g/w9f/C2+yNC0qxjj4CrrxLwzqCNZkRTVgRhmgAbhMUlZp6aEDkMcjFrHDRxE7aKbNYzcsl1VfxZCvdABubjrxQc0rXLfo0TbJm1ytQLrq0ABkd4b7sMuTC5zfF7K/MwqBVvDWKgdLO7iFBps9aiigzug8W2nWTz1/Pmt+8BFaHc5txNHEoVwIYcQ26NCUVfBjsi852xSm8TPx27oIOUzvRW0GRxF0AkDr7BS0xEuoBgyQQSoUu5EPF4TW3R2YIQdXJgJTxtw3NiuNSo5KGRpC7gR/kUpuMyp0kbp5Z2WA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749375893; c=relaxed/relaxed;
	bh=AvQSbwk0OMZgevNebkqyi44TEBQebr6htxrvwpOZR80=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jtBarmYWCCXY56O8dB7Hi5wdS0VXVj0wpdKvbPCYsXSXEasc/PpR+ZCo5GboVo8BbtUYwT4NxGyCW2c3ZQsrL8xdOPVGeucaVK41ka0zfPxmojfVS3z/bTjhALA2WEOWt9de9jszc8ix0gTrA7PX2OEaxx1Rzu6kbXxafYoPYbbY70SUTFuMMeJwMQSeWDIAi3xpyDpJGKrofK5uTwCMyF59/sIIbaBo+uf0px3QOF0DeKdMh+nh6yMR7aqelwaw3rvYGsDYgAZr1DLP3m8C/E44wD7qUTrnLOcz0YlRKClpKQMCtcj09zdanL7sqW9hQU3lXyTcxhEVWjwCcpvTDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=UcGdOxMb; dkim-atps=neutral; spf=pass (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org) smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=UcGdOxMb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bFVX200dwz2yF1
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jun 2025 19:44:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AvQSbwk0OMZgevNebkqyi44TEBQebr6htxrvwpOZR80=; t=1749375890; x=1749980690; 
	b=UcGdOxMby1hZUrbDm+lnX+AQBY1t7zrYgQnyLb7a7CNt7RTcVEIzr/jpNaTCCkT0u4zVChvfP1O
	o8aTeKQiEZ8YK9MUhKYNMGiPCYrkjMK5jajXqfGNsCKOa6xp3+1j3NZ3Ixa5XAx3UGGO0W4MaA607
	1kOjImoorSCtoYPYUisuS/JmGokpeUAVVERH93u+DqQAAZdOSV3Ns7lj6bw9VGoLVaeojHAhko3+k
	N6JGtGHhEgiFK+/gYox7uKv+FSlmkas1+O5EFD2sTAEpnsqCA3PoesjbZfYYA+adnjRqWZz7KVnF7
	bt7D71i8FrOYSqxkrYvpS/PKMxZtV+XayY6A==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uOCZv-00000000rzo-33xN; Sun, 08 Jun 2025 11:44:35 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uOCZv-00000001WdX-1muC; Sun, 08 Jun 2025 11:44:35 +0200
Message-ID: <ea09adb64428a73b84cc0199c3b1efb09b9db23c.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 2/6] sh: remove duplicate ioread/iowrite helpers
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-arch@vger.kernel.org, Arnd
 Bergmann	 <arnd@arndb.de>, Richard Henderson
 <richard.henderson@linaro.org>, Matt Turner	 <mattst88@gmail.com>, Greg
 Ungerer <gerg@linux-m68k.org>, Thomas Bogendoerfer	
 <tsbogend@alpha.franken.de>, "James E.J. Bottomley"	
 <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
 Madhavan Srinivasan	 <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin	 <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker	
 <dalias@libc.org>, Julian Vetter <julian@outer-limits.org>, Bjorn Helgaas	
 <bhelgaas@google.com>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
Date: Sun, 08 Jun 2025 11:44:34 +0200
In-Reply-To: <CAMuHMdXeTWSU64jQt+nybsSBOpBEu_zO0WmE5FK1PnA3YkALUQ@mail.gmail.com>
References: <20250315105907.1275012-1-arnd@kernel.org>
	 <20250315105907.1275012-3-arnd@kernel.org>
	 <6c7770dd1c216410fcff3bf0758a45d5afcb5444.camel@physik.fu-berlin.de>
	 <CAMuHMdXeTWSU64jQt+nybsSBOpBEu_zO0WmE5FK1PnA3YkALUQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
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
Precedence: list
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.150.208
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Geert,

On Sun, 2025-06-08 at 11:39 +0200, Geert Uytterhoeven wrote:
> Hi Adrian,
>=20
> On Sat, 7 Jun 2025 at 14:08, John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
> > On Sat, 2025-03-15 at 11:59 +0100, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >=20
> > > The ioread/iowrite functions on sh only do memory mapped I/O like the
> > > generic verion, and never map onto non-MMIO inb/outb variants, so the=
y
> > > just add complexity. In particular, the use of asm-generic/iomap.h
> > > ties the declaration to the x86 implementation.
> > >=20
> > > Remove the custom versions and use the architecture-independent fallb=
ack
> > > code instead. Some of the calling conventions on sh are different her=
e,
> > > so fix that by adding 'volatile' keywords where required by the gener=
ic
> > > implementation and change the cpg clock driver to no longer depend on
> > > the interesting choice of return types for ioread8/ioread16/ioread32.
> > >=20
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>=20
> > Those are quite a number of changes that I would like to test on real h=
ardware
> > first before merging them into the kernel.
> >=20
> > @Geert: Could you test it on your SH-7751 LANDISK board as well?
>=20
> Already done for a while, as this patch is commit 2494fce26e434071 ("sh:
> remove duplicate ioread/iowrite helpers") in v6.15-rc1 ;-)

Well, there is no Tested-By from either of us, so this isn't optimal.

I wished Arnd could have at least pinged me back regarding this. He knows I=
'm
actively maintaining arch/sh and I would like to properly test and review
such changes.

But I'm not doing this professionally, so I cannot be always there with 100=
%
capacity. Just pushing such changes in without any input from me defeats th=
e
purpose of a maintainer.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

