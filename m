Return-Path: <linuxppc-dev+bounces-2281-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3870499E607
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 13:37:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSXC96jkgz3bnL;
	Tue, 15 Oct 2024 22:37:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728992261;
	cv=none; b=VY4NLr+lV0G7dHs5b3ZUCwLMY+p5CuivLb9baN9Qt2bhvNSWUmyJNlQikmbZ9StRVhzP4vv95+60rRVKhB733TlmhlX7wDykgStA94lRTcmxOT/NeNyU+DPCx0+TXHaYU7b+BkEP05BHMk6JHxRrpkpdkOdh1KJNAWoORsMkdy3fwJ1T/AXosndcK80MxmzRE7fZDePkXTZsmIKkDWAau6cbc2xl8xREfm0eLFYnqpkMpeeyDGHghCS/M3LSMXFngEU+Tjnxu1qAo4HqzjWCf2baUHyhLOksPgL/bzcFX6/VruIBEtb175IdRCTsLdPRzV9TBUlBl9NJgQtWJBlptw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728992261; c=relaxed/relaxed;
	bh=nzKkooEEihDyJVJuqXRx5VvoSpX/RR5Bmk9kAI/CNcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BCzqr4zisXfL+lxxsjl8YRZwYsh8i0IipV1MxRbPy+5HKsF60dR5GvEOR64NbPY9OqxK1YkXkp4L+/DzqmlFg8CsIjYv7bByp/1TnaNJcqEBkpbLSmmQdh/Py9umeEEr73oEtWO2n1XAbjb5FrR2sSFqHTT0LFI0CRp/cjOUbr+nm51IypJBiyyCUKFdLn4wGBZa907a3d9FFDzRV5O7bqjNONGUk3SePnhTEyLobHiSb8Ty4vu/v4t6XoXbVpbSwcN3SM2i8LLsztLHexdJ6Pgobzo33d0qKybd/FmjTBXw25WCo7Kxx7KDHsmK2MlC++kmkbC1WghO2Eb8rLIUIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HbeM88be; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HbeM88be;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSXC86jTSz3bkf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 22:37:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 53605A4256B;
	Tue, 15 Oct 2024 11:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855F2C4CECF;
	Tue, 15 Oct 2024 11:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728992257;
	bh=nzKkooEEihDyJVJuqXRx5VvoSpX/RR5Bmk9kAI/CNcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HbeM88beLvexpIibuyARfwJXtbdxo9ki+MlIaadD1gh0a7YVjYtcTdRoEMkoAlF4e
	 f4s7KvHkYTwinGlbPzN4xftfw5YTVc44PcOBAGfyD5v5p3V/xuc07GAi38/ajzMste
	 lLRn5hcLEoGxFfA+bKYQ+HCxOn3t3ZTtcTYNuIF3iQBHbFc/hG4PMLC8CZkXiqsMmG
	 aHw88t8V9rFcpnkoolv/5Eq4fzj5MwWj0igxO5CcSAl/gnWNOpQfabc9yW8MmCu7zo
	 QPGOztI2WwQvoq1Bexuky4J0Oe/Ti2n7x3GnbRyw4SrJN/StBLvUd4yMlXRexkwYwb
	 7duKxT/HAPulg==
Date: Tue, 15 Oct 2024 12:37:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Joey Gouly <joey.gouly@arm.com>
Cc: Will Deacon <will@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, nd@arm.com,
	akpm@linux-foundation.org, aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de,
	catalin.marinas@arm.com, christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mingo@redhat.com,
	mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com, npiggin@gmail.com,
	oliver.upton@linux.dev, shuah@kernel.org, skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com, tglx@linutronix.de, x86@kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 19/30] arm64: add POE signal support
Message-ID: <090857dd-979f-4071-9772-8d0053ff361f@sirena.org.uk>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-20-joey.gouly@arm.com>
 <47e1537f-5b60-4541-aed1-a20e804c137d@arm.com>
 <20241009144301.GA12453@willie-the-truck>
 <20241014171023.GA18295@willie-the-truck>
 <20241015095911.GA3777204@e124191.cambridge.arm.com>
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
	protocol="application/pgp-signature"; boundary="W88ha9UeD6OkiR51"
Content-Disposition: inline
In-Reply-To: <20241015095911.GA3777204@e124191.cambridge.arm.com>
X-Cookie: New customers only.
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--W88ha9UeD6OkiR51
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 15, 2024 at 10:59:11AM +0100, Joey Gouly wrote:
> On Mon, Oct 14, 2024 at 06:10:23PM +0100, Will Deacon wrote:

> > Looking a little more at this, I think we have quite a weird behaviour
> > on arm64 as it stands. It looks like we rely on the signal frame to hold
> > the original POR_EL0 so, if for some reason we fail to allocate space
> > for the POR context, I think we'll return back from the signal with
> > POR_EL0_INIT. That seems bad?

> If we don't allocate space for POR_EL0, I think the program recieves SIGSGEV?

...

> So I think it's "fine"?

Yeah, there's a bunch of other stuff would go badly if we tried to carry
on after failing to allocate a signal frame.

--W88ha9UeD6OkiR51
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcOU/MACgkQJNaLcl1U
h9BfWgf/eSDT7mJTq3m8uQf08GvOUXMDhZbrgXOWwb+FyP6aWAAddUEovPEavEvc
iv7L9TzG/BRu8Dn9feF7LHlXUbcynAzscFgaysXUrafVyKatccR5v1IhGvNyzdeX
sUP+mTNHfLoIh5AQA5WfUJHN47Jq9/O1R1cJ/BgYWKlMgbEAMHFqKknfApuV7K2Y
S6PpBawO6LvT641x+zS1Vcl+Y7jFRkHt89aLWfhetheuo6f8o2Lc1qBHN4f6kqXp
iR7moBoquhONF4SuwZcTIeBXOuRRFTW8GdZNm/iVt6eYJeKf4Vv8aAhun8+Dam1y
crxvSRFOp4cZ2VKI+zWNCKFw+nIBZg==
=o0Ti
-----END PGP SIGNATURE-----

--W88ha9UeD6OkiR51--

