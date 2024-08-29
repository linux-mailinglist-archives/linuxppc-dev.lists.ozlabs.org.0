Return-Path: <linuxppc-dev+bounces-766-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E355964D4F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 19:55:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wvppd0Gdpz2ysb;
	Fri, 30 Aug 2024 03:55:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724954121;
	cv=none; b=Q/BeyAzGVGJvbKT2GMHU/GZSGQwH/2nfiPKCL77o9z49+WuCdi2IeA4OEz7ScM5lDBCNL6n97KideLH4m9pj1iXDDui0knVaDfKLL0ebKXCnoFL/y4L/H+hAk3xMgQSAFEepc9XqNTQ+tjHWtIUewCPlKhEXLLVmcL1833GkMsfTEhRgrchJ9+u4AiGBxOQzO2mDa92xa3+dyChjMEBePdN1TjWerUeqDvL3Xm6cMJWv5eteO3P3kNcpleR3nRefXO/GsS3icOm/JOZIvJuRUlt22UDwLBB/0dM479YdTbW6+nH36rCWUH0cFcUSssJ1wYK3EKtWAMV+KOm6AA2XEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724954121; c=relaxed/relaxed;
	bh=dbFUz2V30YsbTQ04BmT5LNtIvxOZns47LrWo+BZ9zgE=;
	h=Received:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Cookie; b=Zc8wGBOKJZJ+D/+wacz4We7F320PXE4u+jzceSvqIRMxI7JwF3O2yvjfHEU8IB6dHpqEjcOUmaeetlgy1b+BHamvftFtHZTWa0OkjRMm8tSKQ4t8bzhYyv82HNTxfFwdKo90Bh/Vd7zCbny4VpPMluHXksFzUt5F1Hau5ualMYWJ5rb0jbjNwhXh9gPDyb1LFtqw/h7MTIjF8nUE1keSFzbI2yKDPXiyv0lEhhk3BK0Lyv4sA8B1/2W8R4BUXDHvDrgJzBCzq9kHdm/q8lw6lKFL5ZkqVz/QFzMZR6VFKqmBTMNQTVrPucCwN+rQcJO1tuw3kvbXbUsbHM0bcEsjvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p2Pb7Pr9; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p2Pb7Pr9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wvppc5ZGSz2y1b
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 03:55:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 51829A40242;
	Thu, 29 Aug 2024 17:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6830DC4CEC2;
	Thu, 29 Aug 2024 17:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724954115;
	bh=z1cQe5fZ3eIjl/LjO580rRqXvmPg9r6zi9VQ/SQ8gPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p2Pb7Pr9Idi3U+1dSAJy5ZGpjTgQK2XuuocvVWY2B529zQ97Vq4V8vzQJwQXOMTcW
	 gQBJjVRys2e1pQmbBMo9uHpVYFfhiRg2g82986bh9kxyHQZwjtz7pAhW9dY7Z1mDZf
	 E4G2QpyrU10N9vbMIvp6oxvvHr9+Z7L6OFXjpWynLK0rw0YVWMyogEt3CQr3A7DYm4
	 dXg5jdhDQWvAQZaxgmmLVH4iJyy2tlrN5uUjSnLqah7tWxtXXcT9tZ3HE3TqXD/BOj
	 bhRP49xJaAqI6sdcPP3UebPpiOfr7sgNAUUF1R4b0E+6TtsAmsJKBusYZ2JTdZ1aLh
	 9c8JFmE/294uw==
Date: Thu, 29 Aug 2024 18:55:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Joey Gouly <joey.gouly@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, nd@arm.com,
	akpm@linux-foundation.org, aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de,
	catalin.marinas@arm.com, christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mingo@redhat.com,
	mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com, npiggin@gmail.com,
	oliver.upton@linux.dev, shuah@kernel.org, skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com, tglx@linutronix.de, will@kernel.org,
	x86@kernel.org, kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 16/30] arm64: handle PKEY/POE faults
Message-ID: <40600b75-68eb-421a-a122-256bd20afb89@sirena.org.uk>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-17-joey.gouly@arm.com>
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
	protocol="application/pgp-signature"; boundary="YUq+oyo8aHhnCJ3l"
Content-Disposition: inline
In-Reply-To: <20240822151113.1479789-17-joey.gouly@arm.com>
X-Cookie: Go 'way!  You're bothering me!


--YUq+oyo8aHhnCJ3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 22, 2024 at 04:10:59PM +0100, Joey Gouly wrote:

> +static bool fault_from_pkey(unsigned long esr, struct vm_area_struct *vma,
> +			unsigned int mm_flags)
> +{
> +	unsigned long iss2 = ESR_ELx_ISS2(esr);
> +
> +	if (!system_supports_poe())
> +		return false;
> +
> +	if (iss2 & ESR_ELx_Overlay)
> +		return true;

Does this need an is_data_abort() && is_instruction_abort() check?
Overlay doesn't appear to be defined for all exception types and it
wasn't clear enough to me that the callers have done this check.

--YUq+oyo8aHhnCJ3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbQtfoACgkQJNaLcl1U
h9DlUgf/dqGRzK2dLE7+N4y+4LBWAGW7tClTB7FD0kyv5R02H8XfYHXRznQNP3xw
e9h9X7WvrF+tHVvKaRLrgCF1qKwIwIpd/i5py+jWxSVZLIg1Al5vjZp6yGIRTiw5
Gn7Ts60w/kNQNKizo8sr12ekIA8bn+EYGm7YznCxbsQ0Fo6Wx5ZGpcAsIObQVg/J
bGFjL4IKMlaC8ZgP80PJW+sa3iAhlAK0RuDj1/BiVDfsLQHlMmD6M3Mpn4MTDB4A
l60V2J4QW1eLkxWHCaeLE+1vBVHMCYgY4orFoA9WAbVFM0UDnI7EKgS22lGK/kxn
L2I9TP72B0wTkDL1Ft+34Ka8AV+2Sw==
=72Y0
-----END PGP SIGNATURE-----

--YUq+oyo8aHhnCJ3l--

