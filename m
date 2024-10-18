Return-Path: <linuxppc-dev+bounces-2413-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D0E9A4651
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 20:57:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVYqR2vWrz3c1w;
	Sat, 19 Oct 2024 05:57:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729277859;
	cv=none; b=dQ4RNOl+fJTg3i7G54AtIk+54sG/twLdUMgOrEOdiNiYRxS6ixfivFtIHGj3j2xKX96qxvk6hHm5cPeAKXhoPUNVzO6kaGFrAyYnF+LZmMEElvYFJf/zTLMU4IqPoS9LTeU07wPw4AAgHhcZKTPNeQGqX/e8+7YAAI8UCg+clURF6tcL8bv2UzSe3EnNseCLXR0Y1x8Prl0pg3OoTYJVfooGkIiVE13NWz6K8wn8RNG1g6nW/bp5dEb7cSg8FRm5O4QYNJ1wmvZDEc+Er1PJqs1xiX3t9HRqNHkfNcSuRDXcEJZGYtcAIjmHimrSAXGxjek42qwOohyrY5vTVmi75w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729277859; c=relaxed/relaxed;
	bh=itkQr6sVEG+us5vyb5jwpQiVqIBiB8rMLrG2VHUprOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JuTSSLS5bxZodS3jf51oMVETz3w4W+yZPDh/A24vL2Y9BfyQDtdFNUCbd04efk0sl98E7lm0Rw+cI38nxvpObUYz22cgtVrmR3nBA+jb3+FgDTPQ9AcZiVNn2zh9aKPqDD5JoT3Jpp2oSsM5hilK/3iu0RczM4UbKbhV1exEEfSDcAVRw2eGqjGc+VeWxbAbh4Ww4E2lvY9WjRckzF8CcgNxrG2VjP0ElRQuHvEz8HzK0APbmqXbMdJkq08mNXHx+Y3qUQ4lqloV0qeVpeazOSAS8Ad4A4OQR5EVbaaash7YgY0UTd6ZBKkevVFj68qY0aOEHej7NplVzGwChVrb2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d8p/V7BV; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d8p/V7BV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVYqQ1mN0z3c1g
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 05:57:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9E88D5C4D68;
	Fri, 18 Oct 2024 18:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E839C4CED4;
	Fri, 18 Oct 2024 18:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729277854;
	bh=USwZBd/rmQ4xGvXvT/P1fJ09lLr7kVzbXZdNBQ3+LQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d8p/V7BV9R5bv/BfDflLo5c3tZfdN++v+8FDLdPwvRIUNhpVdCKrwfx3ZhzYIBBoL
	 0ysAxmqq6VxKdnMDowczfEE4iLFgRsjBQ2sg7WpucVGrtlDKJF0dDwHAJstYJYOyrU
	 DwG9HYrZlXnxXvd17vXwqMU5sBdF4IuvNJKEFJq2BTtGPe2hPSji38r6iqSmctgecG
	 gekuuMP9GT54JXpLCT/hfZ0YED63bGLsxe+SCoelsauWdYjywYupTIiojk1hK7yABg
	 pvsG3iqbQ42lBLN/swfRU9WaiT3IwJcXkruF3m/hBbMZWz6fGlPM68cvZL0eb7Q52Y
	 exWIiOd0e8KhA==
Date: Fri, 18 Oct 2024 19:57:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	Len Brown <len.brown@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev,
	linux-mm@kvack.org, SeongJae Park <sj@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	netdev@vger.kernel.org, linux-sound@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: (subset) [PATCH v3 00/16] timers: Cleanup delay/sleep related
 mess
Message-ID: <104a3bf5-97ee-4c48-832f-df6c6e219576@sirena.org.uk>
References: <172892295715.1548.770734377772758528.b4-ty@kernel.org>
 <877ca5al86.fsf@somnus>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0RRAV7MzKbX8/czK"
Content-Disposition: inline
In-Reply-To: <877ca5al86.fsf@somnus>
X-Cookie: What is the sound of one hand clapping?
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--0RRAV7MzKbX8/czK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 18, 2024 at 10:06:33AM +0200, Anna-Maria Behnsen wrote:

> Would it be ok for you, if the patch is routed through tip tree? kernel
> test robot triggers a warning for htmldoc that there is a reference to
> the no longer existing file 'timer-howto.rst':

>   https://lore.kernel.org/r/202410161059.a0f6IBwj-lkp@intel.com

It should be fine, worst case we just get a duplicate patch which
doesn't super matter.

--0RRAV7MzKbX8/czK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcSr5QACgkQJNaLcl1U
h9C6LAf/Qbwvy9NL2Gez+H9VVFae3GlPM9asUcMBaxp+uO7dhCUt0jnpy4Rf+uhV
aRnDHjTLb+zTbBwpy96DsJWJPVsRkJobSsCa/FwibRcFeIheFZBo0REddV9DuMst
/au9J4kG1E1c34bFhrulonNSkF8ebaVYLPfMH69+35eENFwXmFho5dT5usAsr/oP
vDK6Dll8oW1XdvTqbw3CPv8TCPLze4UN799DWoWtS96MCxKR7lNOI0X01GsSUMl5
GrYacHh5QPJICOAGcu7hqSds9wsAGz3zMSAQ9lrX+bZAOiCoDk0KcyIKLF3Pg7de
RcnbwA6aEI+sETc/tSshLKzUVeX5FQ==
=Qqcc
-----END PGP SIGNATURE-----

--0RRAV7MzKbX8/czK--

