Return-Path: <linuxppc-dev+bounces-927-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CE796A656
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 20:20:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wyv764KLnz2yLP;
	Wed,  4 Sep 2024 04:20:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725387618;
	cv=none; b=YcKDtj4nkSh+4zBE7ZQ/AIyN+l9vlVydWKR9S/f9R3OIw2w0WsuPwTKVNDp2S/bQxTAIW1S96GMpE4PBXxevdS4AfBZn+4+lM4XIgu00PYrK2ZZ/HA3kySXFTylHefMrxGg5FyuK0JCyYWAKWp9oh9Kz4hsuoyIeY++NfV9v60kpymLeAbknyCHfkG5ixRpTwLA4bI6+CkCpF/7vrFeed+j2jkVg0HjtJrkr3AXmHT4tyJlFeX2UU/XQRgSIf4KFLOwDcwYT3MdJYSD5hZtN0OlQSWUSV7nPQUD6Yu4uItDq/tSZu24h/edw9knGUveO8qClWY7RciZfPFKiuZ0p4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725387618; c=relaxed/relaxed;
	bh=3M41hDuZ2hOv4A0wqx1B4EpRjBwVCpmQ+MYvSeDr0Yw=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=K2fl78C/QF1J369+jwAIKdrXAdVBdBUDGgM3/SolpFJ9bD2wN3HZ9aHZejoXmUGQ+jm5GD0gr0oRj36YylM8Ln0ErDPCv3SEg3qgrKsiqhb21xwIyxpkcWj6cnSE9WTRFggCAXWg9D2t8UT5VnrwtdI2si2DLD7N1cMRamggEgUv07VbGvwHCzd67OX2/7ZKmxHtz+wHZjZ5thm5FEKNCYnNYtoWYXYYPx8bVp2XMStL3qyms7u+OIvNV1KAvhyEUyydgp1ZzvkBtdsl4w5xl3+tAhHSWBtIHJb878k2D0rwhXl7c1tXMbIZGxWSa0q6U6jeMOz+Fu5krseGcxDJ2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ciUdQG6T; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ciUdQG6T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wyv756Qflz2xdT
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 04:20:17 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BDADF5C59E4;
	Tue,  3 Sep 2024 18:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05262C4CEC5;
	Tue,  3 Sep 2024 18:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725387614;
	bh=3M41hDuZ2hOv4A0wqx1B4EpRjBwVCpmQ+MYvSeDr0Yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ciUdQG6Ttgi9yvvZQGiq8UopO75eB7vVzLKBng7HwibzPFRnXBalgGP0DHJOhsgYw
	 3uk4X//pO6AWblx6uj2/rrtcfZi8xJ+KLRhTGUIMHNMXYzXGdpl88AE1LNLYhQLrSP
	 DF8KUTdzVN5U6fM8gZroVggjf3verSxfxLuJNEjmcXfbWXBE0OFnt2KZ4iEV5Vhk9j
	 JeNKEHjQ3QpE+rmpaiNn2XI0qgA0oJV7QO0sGId48qZnT0wsdO40PdufRSPzAvFgKn
	 YqlXDkAF0Dp4f65YVZerwA+zsLHpTSAMy3EtYLEl14MtxYmN71YQsS6p8hzMMNF/7p
	 L/5KsXBbyQ2oQ==
Date: Tue, 3 Sep 2024 19:20:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
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
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
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
Message-ID: <3ff7a6dc-a21a-4a53-b3d5-cc8b0b5333fb@sirena.org.uk>
References: <20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org>
 <20240902-mm-generic-shadow-stack-guard-v1-3-9acda38b3dd3@kernel.org>
 <6d91ca85-def3-422c-8fb2-76337136257d@lucifer.local>
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
	protocol="application/pgp-signature"; boundary="o37zrp9IxB4WCgx3"
Content-Disposition: inline
In-Reply-To: <6d91ca85-def3-422c-8fb2-76337136257d@lucifer.local>
X-Cookie: Words must be weighed, not counted.


--o37zrp9IxB4WCgx3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 03, 2024 at 06:49:46PM +0100, Lorenzo Stoakes wrote:
> On Mon, Sep 02, 2024 at 08:08:15PM GMT, Mark Brown wrote:

> > On x86 there is a custom arch_get_unmapped_area() which was updated by the
> > above commit to cover this case by specifying a start_gap for allocations
> > with VM_SHADOW_STACK. Both arm64 and RISC-V have equivalent features and
> > use the generic implementation of arch_get_unmapped_area() so let's make
> > the equivalent change there so they also don't get shadow stack pages
> > placed without guard pages.

> Don't you need to unwind that change in x86 now you're doing it in generic code?

No, x86 had a preexisting custom implementation for some other reason
(hence the "updated by the above commit" part above) - the shadow stack
support would most likely have been added in the core in the first place
were it not for that.

--o37zrp9IxB4WCgx3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbXU1EACgkQJNaLcl1U
h9D6cgf/XDZdPu9OMFQe6TQgFZfL0q5O9mqkm+BWBPaJVUsfz+b1eJX8MY/X94i7
isw0bRIKXl4Rdgglf/Mjack/jKZI2dA1nVQtiA0++/6tT814x3Y/iykb6tAbghmy
uinhNXZQlV9/DYrMjNAbBcGeFlMlKmRBSrZEuoHwLuaOsQ3CfzCxB7zqsWtaxrBk
Ct7Jtsia48hr6Df5deBgMHgDTE6xyu7fxb9fDqVippx4fBJzXvjimEBvAG8OWp/z
77YIEDqfJ+JuDQvg3E5YL5EW1xarV++hvLacqfnaffNQFwngWwUWM8TyY7p5C4VK
LKP++oAShrv2wbyvnGgxkpomt/Eb5g==
=xc/U
-----END PGP SIGNATURE-----

--o37zrp9IxB4WCgx3--

