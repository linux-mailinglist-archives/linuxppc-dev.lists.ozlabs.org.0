Return-Path: <linuxppc-dev+bounces-2414-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D469A4656
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 20:58:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVYrJ4g2rz3c2C;
	Sat, 19 Oct 2024 05:58:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729277904;
	cv=none; b=edKQY0YcOgNMah9R0l85QFhwj3YuQ5aIzLtWh+wmOA7bPwR1I8UYnHP002soSf6+819Sp94LkN/SdfPFPhBzvbiunQTlwyjtF/Twc4qrxZLP+RZuhb5I6ODBGPVIBsuXcr2KVMkEvMrcQdDxrqXiIl0Hf1JE7p9mv0W3wgQHg9jdhzHnEtQYDiPmrU05ksBe5dMNNJSHywrkwlx23Bx4EZy51tAG7eJSGk3ng3wqcpGFJAnraQotAYCfkrEiZbjcvntrYsYmIQr5S1JYzdTNUjkP3cQFJUeXX97m34kT+uhmfXvTGVo+piR1+4pdukDbOBPEaCtesfxY62t1VERLFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729277904; c=relaxed/relaxed;
	bh=CYqC2h4NLHyR+o/7MNIAz+vw9QnRHlBDOZXnP3K4b04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5h82ZWdp9VKzjq3UWwjgq9CbG1W2AKhhVA1j6ll8fBmGm5mQI7Ijt341paKiE011anvH74Q2oGRWj6Ij6l2k9u8v5hJXAapSJWA+5hH++g69T1XZY97g98Q8inCxVOjZrAnipg4gPdCch/faEPiYy1tcazecmk0/iFdLO8QMREZ1tRl4oeLNTd/+d5BOmfd30NuUbZ7QuOMlqmifUWySdy33SflvRRunRoSi1G1TiWLcG5EW7WjQLMmiWXC1Zqkt9Plotl4eIGL2dxn0+CXCBPRRvl4gtqZ46W3Tt83gY0kWaTQi4jPpya4diDNF0K/BY8ZOU/VGFmigGoinbb3zA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eLMksYF2; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eLMksYF2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVYrH61LKz3c1g
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 05:58:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B68B5C53A2;
	Fri, 18 Oct 2024 18:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212B1C4CEC3;
	Fri, 18 Oct 2024 18:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729277901;
	bh=uNlY1sb7BVVXCcsMVu8Ynjn1FGT7oBovqYRNZBeSUEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eLMksYF2A44sAVvXMLLc1QTO05aMjS+OBbVmUBAl+DMijULjAXZurx2DG/2ulaJIR
	 JoRrmGIMHs433yhhly72II6CWLzqRAVpX7aKU1mtpg6T0fpj7F2CGdBFMTHC73KR0M
	 8F7jBP38fFa63M2huQVX1hUtG6EE6PmoyBn8r99Au5V51HZQG1wKGt+XBJra9oGAv2
	 SEVoy+pa4Wl38FEIXcpvG6eG7DIbtbR/zHF0Hi6hn5WADwn4Sigjjt6iAGl732xv2+
	 HCewKfZmlZHMdZYDLFUn/NN8FFYPEobIhZ6ZTRSLzI73wByX7vcPT488drJ+4JFOBO
	 GIYxXYQDKHcTw==
Date: Fri, 18 Oct 2024 19:58:12 +0100
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
Message-ID: <8e079f25-658e-4671-9b3e-c3e46f36405b@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="P8JRaMzcXswSHEtS"
Content-Disposition: inline
In-Reply-To: <877ca5al86.fsf@somnus>
X-Cookie: What is the sound of one hand clapping?
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--P8JRaMzcXswSHEtS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 18, 2024 at 10:06:33AM +0200, Anna-Maria Behnsen wrote:

> Would it be ok for you, if the patch is routed through tip tree? kernel
> test robot triggers a warning for htmldoc that there is a reference to
> the no longer existing file 'timer-howto.rst':

>   https://lore.kernel.org/r/202410161059.a0f6IBwj-lkp@intel.com

Oh, and for that:

Reviewed-by: Mark Brown <broonie@kernel.org>

--P8JRaMzcXswSHEtS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcSr8MACgkQJNaLcl1U
h9DpWgf/c8OCSZtN0/AmetsDqa/zvYT//zsqcY10Jl3YSsQgCEAIwkc0GWEdl0Bv
mAY3s/r8vi5dSXK1YARWoSlvYA0h0R7ysi9oKy/2HyZ4fo6uVT/S95tSH90rL8UD
IUtMu6N43Pak52+2hhGl4glVX5yDjXT4+8rMZjL8G9F07fXblzftyGP2G/HfkuJS
FJ36afHCl/AMmoe1TkGpHHOaOXVbPlukUtX6ZQFepWJjUiv/4YgoFxH8SVoyqP8W
ROEq86SWvagekQ5nzr8Jgn2DaWiFSN/e520uN6Qz8kELdR+fV/NquTsUmszeaZ+z
tnB/CGQgVUWV17Pn7WAs3w+eDCRuVQ==
=RPH6
-----END PGP SIGNATURE-----

--P8JRaMzcXswSHEtS--

