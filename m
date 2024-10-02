Return-Path: <linuxppc-dev+bounces-1734-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FA398DE3A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2024 17:02:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJdM33dGsz2yR5;
	Thu,  3 Oct 2024 01:02:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727881326;
	cv=none; b=ChHg+JXVM/nXLEzFqmzKtYgtweJm7VoR0BH7Jq6JhRYUd+BJk46EcQH20AiBrKjhqnVqEVPBBZhe79GSwUfXSJjeHDqd03TPvyNdT+WTru70Gbkr7ftGiuufcjXVe5aRuh30i1lXcePkRdghw/qKT9J+sHUOJDUMUvfHyOLxMyEdcDNvbxNXRYsXVYivA8+xuxw7f02/ylLn4LgG2w09+lX3QjQpo7Mc9b3iInSg5JVnkotEJlNTCJlJip0XA5vxuvaQCUGYfCXaEdJTlGDUIIIBv8jC2b+5DaTuToIuF0ULqGsnG6D/1iCxUYe8UVPkN439jMgm0oLFj78g8i/+mA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727881326; c=relaxed/relaxed;
	bh=zTt9TS57bBm1l7LQiiCDKRjlEdSZZZ3DNQMytk52ARU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hHRvsVBCAttHLFj8d023lDuh72UkxSK9l0QR8D9ISR47OIclpJOOmdUZ1QqyJMb3v9j+pNHlroPFGQMYaLrvYCzGcfaX85Pf/UKH5S6Y+NXSNoETXnmnyf+5EVUjtsYAgf6mSn+t/d3Uwk3qFYU3/WxbP3LZX9Y9EFQsnmCRU6//Fr8jmrfPiZfuK3q5BZdOKdgwUdpKlDorEZvsPsHrx5DjMKSSXpjQFZANRqRQGh45quQpeCyKpeevo751vSn+XHw5sm8w8uHHkL8KXZo4osA40Xa+46ojoTi1jT0pTOPn4qxJsGVXOPiFpkvt2C1hVa+Im8uPGHMn3p17qBerag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ftkGpiO2; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=66EOsvZj; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ftkGpiO2;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=66EOsvZj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 19061 seconds by postgrey-1.37 at boromir; Thu, 03 Oct 2024 01:02:06 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJdM21KCrz2yNc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2024 01:02:06 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1727881320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zTt9TS57bBm1l7LQiiCDKRjlEdSZZZ3DNQMytk52ARU=;
	b=ftkGpiO2tQC3XBHrw0qujIV1hNeH8PfnQMQ9VwuLCIjxOCO4+RIEAn9I80jccRGLuUfOSk
	qXDh4sI7V1MWbCrSHSvJfBEk8auCJI7R8ToxkbfDQSDW3bm1jTqVibdG24MrR1GkrAzUv7
	Nglg5c6UKJD0HkpjdmTN43ERgM4RzKphWDH/FzS7rAkB6mBTwRcgr3It2HD85k6P6AksaL
	TKjMavUpYwVbOYdL7WX09DxO+A6FMPf31BDuSzqfaSYwbj/UxUygslhbSgNLXtVjaN8iVG
	f8x+SSD8udWBVY6NiUPl5wAkEiUQIWiCAFA2kEwDfY+0UziV4DdNXPHQvjrFJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1727881320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zTt9TS57bBm1l7LQiiCDKRjlEdSZZZ3DNQMytk52ARU=;
	b=66EOsvZjXy/H8TUUFSCmjovMyk1OBLtQIimAE8qOVHy7xmFexHyu16tDAVzVdvfGB0RUNK
	FPjKICAnWvLC8OCQ==
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Frederic Weisbecker
 <frederic@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Anna-Maria
 Behnsen <anna-maria@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>, "Rafael
 J. Wysocki" <rafael@kernel.org>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>,
 damon@lists.linux.dev, linux-mm@kvack.org, SeongJae Park <sj@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, Heiner Kallweit
 <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, Andy
 Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Dwaipayan
 Ray <dwaipayanray1@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, netdev@vger.kernel.org,
 linux-sound@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Nathan
 Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Mauro
 Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 00/15] timers: Cleanup delay/sleep related mess
In-Reply-To: <c794b4a6-468d-4552-a6d6-8185f49339d3@wanadoo.fr>
References: <20240911-devel-anna-maria-b4-timers-flseep-v2-0-b0d3f33ccfe0@linutronix.de>
 <c794b4a6-468d-4552-a6d6-8185f49339d3@wanadoo.fr>
Date: Wed, 02 Oct 2024 17:02:00 +0200
Message-ID: <87ttduwntj.ffs@tglx>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Sep 16 2024 at 22:20, Christophe JAILLET wrote:
> Le 11/09/2024 =C3=A0 07:13, Anna-Maria Behnsen a =C3=A9crit=C2=A0:
>
> not directly related to your serie, but some time ago I sent a patch to=20
> micro-optimize Optimize usleep_range(). (See [1])
>
> The idea is that the 2 parameters of usleep_range() are usually=20
> constants and some code reordering could easily let the compiler compute=
=20
> a few things at compilation time.
>
> There was consensus on the value of the change (see [2]), but as you are=
=20
> touching things here, maybe it makes sense now to save a few cycles at=20
> runtime and a few bytes of code?

For the price of yet another ugly interface and pushing the
multiplication into the non-constant call sites.

Seriously usleep() is not a hotpath operation and the multiplication is
not even measurable except in micro benchmarks.

Thanks,

        tglx

