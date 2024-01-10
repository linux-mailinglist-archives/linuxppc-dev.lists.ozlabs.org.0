Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BAF829BB9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jan 2024 14:49:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V1jPPPfb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T98L91ZTJz3bsP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jan 2024 00:49:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V1jPPPfb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T98Jw2ZSSz3bsQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jan 2024 00:48:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 2A253B81D6A;
	Wed, 10 Jan 2024 13:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14496C433C7;
	Wed, 10 Jan 2024 13:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704894507;
	bh=Mpj9MmpWsZ0QXa3z+JG9y8iO9570kyRUme6G8UyY3ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1jPPPfbtZjWicjR/pXvV3fvfEd+WTpUYKesK1ver/unl0yUXsY4TkjQIutQjBRsP
	 rP/Oz0q/0h14UEjOgFaxFG624+eWlJ/AO+ivv3TYC1sZnL+hL4/+Alo/46tP000hXg
	 zplNZ64lLrfkj8J9hOzdzzP2smKm7MeEZ/IYISeNp94tvvX509RdtM1WHeyhjMm5jx
	 6PVp6J9lR2f0adpYnosG4kNDW+C6yKAzSmFoUpH39oONuTUSb402zXo2PYbzqdDyDw
	 8BKfIvBQaR2VfeSzJy9k28uur98lcaUtFQRjhOYk1Xziu9Q+q1jecwOjEuD67FrH9y
	 AnuUlci6GEj1Q==
Date: Wed, 10 Jan 2024 13:48:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 2/3] arch and include: Update LLVM Phabricator links
Message-ID: <20240110-apostle-trident-533d4c2c9c97@spud>
References: <20240109-update-llvm-links-v1-0-eb09b59db071@kernel.org>
 <20240109-update-llvm-links-v1-2-eb09b59db071@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p6SYI+U6gP5vpK1M"
Content-Disposition: inline
In-Reply-To: <20240109-update-llvm-links-v1-2-eb09b59db071@kernel.org>
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
Cc: linux-efi@vger.kernel.org, kvm@vger.kernel.org, llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kasan-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-media@vger.kernel.org, linux-pm@vger.kernel.org, bridge@lists.linux.dev, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, patches@lists.linux.dev, linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--p6SYI+U6gP5vpK1M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 09, 2024 at 03:16:30PM -0700, Nathan Chancellor wrote:
> reviews.llvm.org was LLVM's Phabricator instances for code review. It
> has been abandoned in favor of GitHub pull requests. While the majority
> of links in the kernel sources still work because of the work Fangrui
> has done turning the dynamic Phabricator instance into a static archive,
> there are some issues with that work, so preemptively convert all the
> links in the kernel sources to point to the commit on GitHub.
>=20
> Most of the commits have the corresponding differential review link in
> the commit message itself so there should not be any loss of fidelity in
> the relevant information.
>=20
> Link: https://discourse.llvm.org/t/update-on-github-pull-requests/71540/1=
72
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---

>  arch/riscv/Kconfig              | 2 +-
>  arch/riscv/include/asm/ftrace.h | 2 +-

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--p6SYI+U6gP5vpK1M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZ6gJAAKCRB4tDGHoIJi
0mIlAQCj5ZP6QEhEswWYjX38obn/p3pF8mt+Ve+vlBnVEhAW8QD8ClRvKxDiajR5
Zp8ES/FLDyH/QJ5QjGuYLP5PATLeFAY=
=SqXc
-----END PGP SIGNATURE-----

--p6SYI+U6gP5vpK1M--
