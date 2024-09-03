Return-Path: <linuxppc-dev+bounces-932-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEE196A7E3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 21:57:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyxHN4GjGz2yNn;
	Wed,  4 Sep 2024 05:57:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725393456;
	cv=none; b=M6gvFSecwVXu9AXDkziQneneWrAbEsoLc7luqOutH1yiURN7tbzY+8gCh77isTICkEML5S4inMeC9VBCmkfLv9L7ikMFI3rEbl/O8R7mjXSuv4fYHbSI8KT1/MZwOy3wagNRdInbgjCgVgEY0IvkEvlRjhs4oE5sTQMNjJxPQxbJbrHCLUw68d1Rnci7SaHCcWISQ/kqmLqjrOYBfL/KZNXH19Rn8h41lRqbo9Zgk7xVy3UT/ZC7i3HP7qcENJzJdJzSHLF7l7R4Zkb2YuXwe3qYYaGCmxctnqMRyW2P1yfJoIP3ThDCMNnnS62rzRB9/AzCvCu5KUkBsM/CEL/FpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725393456; c=relaxed/relaxed;
	bh=5q5jFh6a2kXI80w5f6YQw4phvFCzdIPzun18yiuR3uQ=;
	h=DKIM-Signature:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=KEd3uEdRQJ/tRdUetNpWjOFmDGxk5Nzzm4wwPg7Nakhk+6L+ia5qS5waEVhgBapf+sp5W+jcnYzJRmUelSiP98QqNmTzW/QOaxrv1oPJ0klrb2O17Y1hB8WvmthHEHg0Oge0CqyaX2loBfWqG0aJvL8tZ57zAdGaZqIAra75s5Efo3vLvwfjyqZ7Zo5wowlL+eErMebmprfJdtfh3Q6eavp9AE2O0XfWSq8Mt21bJuiNEGfaC1TrI5wTpgQni2irLcgL2G/fKNUAJizL+aKwlsIwIWguCofDZkN8k2NXjhClyUsiIQ8X0008cPE85Fm7VwBThLjv+yriz3RPoOBPPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ibTzt+Zg; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ibTzt+Zg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyxHN1DGWz2xZr
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 05:57:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F174A5C543B;
	Tue,  3 Sep 2024 19:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45C7EC4CEC4;
	Tue,  3 Sep 2024 19:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725393453;
	bh=NTkAihUq8wJ3QQyD2jsoOFW0fG+0732f5lSDZtBgAPI=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=ibTzt+ZgEdTELo0NowH5uGIH2Wtx8O6oChkl1Q28nqiyWxDTqR8tphBxYgCay32pV
	 1hPna6pOCaS45hl+sLTuFw+Pl79mj27SkX+HpLxKECYJlYBG0h7SaAkMmPwDx6njIE
	 2rYYbxd/PvXGm8b5i0aeQaggLGjHy5i+JmHGE7xq/T4LZ5poYfToPT4ar4DwnZ6LFz
	 xUVGuklq6NgdHhkMPsoZgMeus69wEVzDTS4x9rtvNNbP5iGQfDm+My7uvbaZprUrQJ
	 oMpGYNsaV408haO9OPNGCb7dBVZJWkElUMT/UHks93JFjH0pu162EUYzIc/cTsD9Sg
	 qFv2tPt1j4P1g==
Date: Tue, 3 Sep 2024 20:57:20 +0100
From: Mark Brown <broonie@kernel.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Deepak Gupta <debug@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 3/3] mm: Care about shadow stack guard gap when getting
 an unmapped area
Message-ID: <dbaf5653-df46-4e17-bce1-aec7fb168197@sirena.org.uk>
References: <20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org>
 <20240902-mm-generic-shadow-stack-guard-v1-3-9acda38b3dd3@kernel.org>
 <is6ewj3bhtqy3zadj6lbdv6maupx4kmduvhny66ntifkji6hoj@xmhcf5jt4o66>
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
	protocol="application/pgp-signature"; boundary="IPVQox5bvuHO+FID"
Content-Disposition: inline
In-Reply-To: <is6ewj3bhtqy3zadj6lbdv6maupx4kmduvhny66ntifkji6hoj@xmhcf5jt4o66>
X-Cookie: Words must be weighed, not counted.


--IPVQox5bvuHO+FID
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 03, 2024 at 03:41:49PM -0400, Liam R. Howlett wrote:
> * Mark Brown <broonie@kernel.org> [240902 15:09]:

> > +static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
> > +{
> > +	if (vm_flags & VM_SHADOW_STACK)
> > +		return PAGE_SIZE;

> Is PAGE_SIZE is enough?

It's what x86 currently uses so it'll be no worse off if it gets moved
to the generic code (there's a comment in the arch code explaing what's
needed there) and it's enough for arm64, we only do single record
pushes/pops or (optionally) writes to unconstrained addresses.

--IPVQox5bvuHO+FID
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbXah8ACgkQJNaLcl1U
h9C2Awf/e7PKpZHkmToVtr07IL4qcZTgpwJkRcA4S8aF/OKy2aVmo+pW2nNnK5sc
/MpaZW0Ms2eiZxaG4R3y3oBshdiHLdMS1qimFTuewZWtDAJ9lE9Zubq1rr+onqIw
z7QLTklFTJhwJLiv4r822HjfHqW872zY7tA8OQKs18OmYzyGFWnMuKcdZwQWf/Wl
S0krgEkvPgYV5FyIP9SeyBVfAnRbH3u2q0dDWORZ7e3pVwZ+0huL1DYzlgP/Nx4a
EUb0rRhFG8tHp5EwazuvDfdaQyfqtytNRDe6NTrqVdsrqXi7QzkjglFsx44oMBFK
rSdl35QkF7WXDFsXE2sd4O+m2ZbJFQ==
=a8UG
-----END PGP SIGNATURE-----

--IPVQox5bvuHO+FID--

