Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 210C2857089
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 23:28:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UJ9izmTw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbV8407yYz3dng
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 09:28:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UJ9izmTw;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbV7J1nBmz3cCb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 09:27:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1708036056;
	bh=Ugmf0DOzi7gU8tUP1o5hRFZp90hdWFYWXs/hHXfK8i0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UJ9izmTwqMZ4pONiAyMBzFXgOa0ianY3gaqYhAdiDSuLLyFUHp+9TjptmIHKfFLc5
	 WRQrikLGZHAby0OpF0ul7q59xm27pcG2AceIcX6w/BghjFZYCxmz2RkFdOkz2KSNo3
	 KQEyI58AKUfFUUTejr0b1/aj+1D+uU1q7SCxp+J8fJfmEAq66iTR2IcRTWD0U2tuzH
	 BFIuD/I8CifW5KSEaA+Q8Ys85bwi2GESYJ3HtW2DO8obwi/dtdoKPrRjuE+FFZ/RKx
	 Qni5lwAu3qd/i65jg3GTWclhGGnq6CodSjO6erHvcxWJ96i7TVksUMucQC1NXN/Nk4
	 natSa+/x2Fo8A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TbV7D1J8Vz4wcK;
	Fri, 16 Feb 2024 09:27:35 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 0/7] macintosh: Convert to platform remove callback
 returning void
In-Reply-To: <mdq5k6lq54c5t5yffjotkovrvzfh4uvt4qt4n6rwddmo26neqr@au5s5u3mkoet>
References: <cover.1704900449.git.u.kleine-koenig@pengutronix.de>
 <mdq5k6lq54c5t5yffjotkovrvzfh4uvt4qt4n6rwddmo26neqr@au5s5u3mkoet>
Date: Fri, 16 Feb 2024 09:27:33 +1100
Message-ID: <87zfw15pnu.fsf@mail.lhotse>
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
Cc: Rob Herring <robh@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:
> Hello,
>
> On Wed, Jan 10, 2024 at 04:42:47PM +0100, Uwe Kleine-K=C3=B6nig wrote:
>> Hello,
>>=20
>> this series converts all drivers below drivers/macintosh to use
>> .remove_new(). See commit 5c5a7680e67b ("platform: Provide a remove
>> callback that returns no value") for an extended explanation and the
>> eventual goal. The TL;DR; is to make it harder for driver authors to
>> leak resources without noticing.
>>=20
>> This is merge window material. All patches are pairwise independent of
>> each other so they can be applied individually. There isn't a maintainer
>> for drivers/macintosh, I'm still sending this as a series in the hope
>> Michael feels repsonsible and applies it completely.
>
> this didn't happen yet. Michael, is this still on your radar?

Yes, just behind as always. Thanks for the reminder.

cheers
