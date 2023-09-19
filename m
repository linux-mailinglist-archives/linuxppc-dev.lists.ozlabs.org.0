Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E04B17A5F05
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 12:06:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DcXPXZ8R;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rqckz4NpHz3cRX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 20:06:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DcXPXZ8R;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rqck469JWz30fm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 20:05:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1695117942;
	bh=qnEPlg47MH9dE/ib7+sBEVpstd8KaTfTXJ6XGs34D+8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DcXPXZ8RevrVci8TzkhlGkgvXdCrEBGdTI2ecUCjD+lo37dLcg/XalDi/y6ZSG3e0
	 ZfEzOeTrwD4zUqaZkYMLKWxU04OEzjxLQDC3oyiUnT4jIYpx7i/x1SBjc8jkZH5ZuF
	 cVZ1q7BPhuYhUjawCqSBGXNdIqZqKyhCCqVjn9RWYMp8fBWJuxYnqI5RyU+loysU60
	 R60cgwWXRUkFdLL1zXe+Q3zjl8pQpNIoUWLtNqMX4O71AUgnk8VqxHI3hGED+d3Skm
	 CV7dsCNdJcOtIGs720eP25IE4XlnGlkEUMzuUl3lhLv8dYuwFzPI60JiRRP7dHAAfq
	 sHJslzYoFLf2A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rqcjx2f8tz4xNj;
	Tue, 19 Sep 2023 20:05:41 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 2/2] powerpc: Replace GPL 2.0+ README.legal
 boilerplate with SPDX
In-Reply-To: <CAMuHMdW6=wnOjT7qG4tHvc5X4JAJkkHMnVDsQ-dKM6i3FKyWWw@mail.gmail.com>
References: <cover.1695031668.git.geert@linux-m68k.org>
 <d91725ff1ed5d4b6ba42474e2ebfeebe711cba23.1695031668.git.geert@linux-m68k.org>
 <87h6nqlxli.fsf@mail.lhotse>
 <CAMuHMdW6=wnOjT7qG4tHvc5X4JAJkkHMnVDsQ-dKM6i3FKyWWw@mail.gmail.com>
Date: Tue, 19 Sep 2023 20:05:35 +1000
Message-ID: <87o7hytr4g.fsf@mail.lhotse>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Nicholas Piggin <npiggin@gmail.com>, linux-spdx@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org, Greg Ungerer <gerg@linux-m68k.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:
> Hi Michael,
>
> On Tue, Sep 19, 2023 at 4:13=E2=80=AFAM Michael Ellerman <mpe@ellerman.id=
.au> wrote:
>> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>> > Upstream Linux never had a "README.legal" file, but it was present
>> > in early source releases of Linux/m68k.  It contained a simple copyrig=
ht
>> > notice and a link to a version of the "COPYING" file that predated the
>> > addition of the "only valid GPL version is v2" clause.
>> >
>> > Get rid of the references to non-existent files by replacing the
>> > boilerplate with SPDX license identifiers.
>> >
>> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>
>> LGTM.
>>
>> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
>
> Can you please take it through the PPC tree?

Sure thing.

cheers
