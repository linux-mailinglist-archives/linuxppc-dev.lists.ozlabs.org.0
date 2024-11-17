Return-Path: <linuxppc-dev+bounces-3364-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC8C9D038B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:25:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xrqhq4lvzz2yVj;
	Sun, 17 Nov 2024 23:25:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846315;
	cv=none; b=PqoPfAFjRO8d1OCyfZY9Z4jMW/iRSOGcmAjZ45faejjQTh34SbBYGK3Uka8CBW2Yc/mLu5Yi117vfh33H5o/dDePSx8c1v46CK5KDsqQJOT9lC4se2vCKOKk6WFdh8cDmxFWOvXGjQyLZY3VAEiwDS+Ox1Wrlk4I/v/7HtKlIq131Ur0HJsxj3Kvhk0wAdloKhuHgEPWDnaDwT9myV68UtWBj8QNgfO6EBdxK4/cZ+zykuhAoMuk/nOqxnpvIQcJJk26QanMh/G/Fq0hf97cGx8O7Qyx1OwDSPumf2aEEIAHXyLMnmwbQguX1ZI7WAxVxHIh9I1uwdYIGRq7aoBQeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846315; c=relaxed/relaxed;
	bh=TmUOvtaFFm8Lbs0BhgX9Y+/uxpOUMqksFC8Pa5BY3qc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Et1e5Hctqypv9072sH6DEmAyulPKv30T/b7DaZvIHLa88k5eQflfiw/I4+v8vIyg0FhSKLHBfrfKG95GZRQpmguh1r3BAd1e442RUss/lSiZWn4OJvHVr+H+etm2C2CYeg1MyZJFdur2o18spUgP18tyxcgi5tDrVu6w85Jh+mKA9iGE49YWFUMHqQWoYjGjyxonq9CPwtYoNtdUckd5+g/Mc1qjAtJsO9Rcf64xxWJX+TFdsT1ZD5Q/vEO8KkT3WNnrtlj9SLvb4iKXgya3mGoFxpVHpxUQYGS3tIg6OHr65QYsuNs+ip7o7StTIEv5KBukeY1PL7x43Ibw3Alq5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ItOFpm/3; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ItOFpm/3;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xrqhq1Ndnz305D
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846312;
	bh=TmUOvtaFFm8Lbs0BhgX9Y+/uxpOUMqksFC8Pa5BY3qc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ItOFpm/3/JldnYcAZfmLdfr71Cbw+i/dawDyU1w6cHL6LkTBmhHpJbx9CeJ2JsxBR
	 EWA/JllPiZRSVkIEm3cG2u1LnG5c7CDwyNu4uQQEEEaz/AyCKcrCT2mLIq+pBjgg6I
	 8TTtzT903nFRqtiuYYMZ/0drbtTiXdlEfjbjDZTV9XPZg8PrZu3y/VyzBroVz3KfS+
	 3lchmFQDLNrhXmf+GLYfrf3byMnSUnU6hOk3XViem2xDmB/741UtW82ZWPUFLNMTT7
	 Ql3JsRH/w4KGpdp4ZT/5qJ59nzO7uKaWJYMHgY8cjafU8N7M2hZAdbmigIjbU94JR1
	 fMcG5mCYZD3oQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqhl6ZF4z4xdx;
	Sun, 17 Nov 2024 23:25:11 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Geoff Levand <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <31fe9435056fcfbf82c3a01693be278d5ce4ad0f.1730899557.git.geert+renesas@glider.be>
References: <31fe9435056fcfbf82c3a01693be278d5ce4ad0f.1730899557.git.geert+renesas@glider.be>
Subject: Re: [PATCH] powerpc/ps3: Mark ps3_setup_uhc_device() __init
Message-Id: <173184539745.890800.2900457894457834398.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 23:09:57 +1100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 06 Nov 2024 14:26:25 +0100, Geert Uytterhoeven wrote:
> ps3_setup_uhc_device() is only called from ps3_setup_ehci_device() and
> ps3_setup_ohci_device(), which are both marked __init.  Hence replace
> the former's __ref marker by __init.
> 
> Note that before commit bd721ea73e1f9655 ("treewide: replace obsolete
> _refok by __ref"), the function was marked __init_refok, which probably
> should have been __init in the first place.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/ps3: Mark ps3_setup_uhc_device() __init
      https://git.kernel.org/powerpc/c/da6ffe855b5a05f29222e3d4ffa4b549413e33a4

cheers

