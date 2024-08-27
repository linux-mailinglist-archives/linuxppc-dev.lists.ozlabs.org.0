Return-Path: <linuxppc-dev+bounces-578-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB569602C2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 09:15:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtJj50lz7z2yZ1;
	Tue, 27 Aug 2024 17:15:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724742921;
	cv=none; b=FBWvSdjB5W3pVChaezI74PADRDJaAOGaYuyaLrwiYXL3dAdrwPY6/wqiRKIAjPPB22/l7bT/I9arCQmy/pL+3n3PfzmEFbVClmYErYIY2ElsVCX24HiNlPZ0+V7Xf3elxD/p9RdwQv+4ZHqVh8Ndnvj/THD6mpAlXZiOugfGRxuEBK7blaGreZatnehLzcTvP1C2Yhs/8Q4eKWOp2d1cptVGgQBaTUvJ9kXBi6deuRk0W5bncSIFTKN/laZi45tKNITQnj3wHk71kTGPULgx07VqeS5lkL4xh+kP9aHolYsjxnXT2FfkZeM559l+NieM//Kw2s7oIcdHsVh9HwS+4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724742921; c=relaxed/relaxed;
	bh=8nSPQsJamaWd7LPmLTr+2JTlH1Cx/OAs4xpRwlVAdnE=;
	h=DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=iZiEP7W6UwAFApRTc1q8Hrak6fO1IMN/TkVxDkI/4AfW6M7pkqDc3KnGtICR5ap8zy2YIvSTrQ6EyzSBT/Itj171X2DZCDblpzoai7zjSPsL8neQkRbUIB37GcqA3hSIwk+k9c3l0sf4Qpo4vop3dcUzzs1U1VUI9jjeMSK91df3e3/PPGiNJ2TZFC7nTv8ET6p7LpaVxMbi9/ni3Ptbvz22SwWsTzNRiQ2sl6NKKhTT8+KYVFQB4JmZfABr8tEMZXQLD0AGh5CHczQdjksYcPTN+lqEDJiIdkyVXNl++A/Z0oN/G35sb0XQCmfU7iEeLWBFY6XwzBXcW/go9OI5wg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XXXqxn8i; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XXXqxn8i;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtJj50bt8z2yY1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 17:15:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724742920;
	bh=8nSPQsJamaWd7LPmLTr+2JTlH1Cx/OAs4xpRwlVAdnE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XXXqxn8iBVpZChuOOiZCSsDd/5f9Ci6MumL+bvFpHlqfMjl8xl2ic/eEjYzntx5HL
	 bZ+31/r/NIawnN9W9leghNP25f+GNOvQpw8vl1LuWIQpLojUHlAzWhw7RF3lShXj3j
	 nPP1fpJzIjULdcZzoLwvTMto1GRRpde5Zc8elLnWuwKuR6H+zcSu4Rf+MX0dVICp6d
	 AcdjolRht9zDhGKPH1laK4LBA0PlB5zHTLo6JcooP82le+OyoIGifjhYIbxJHXrfMj
	 U4QIVetOQ+U99aZ/fVCEAos6LTkFBkSsnTFlMGLzJ6DdLP1ZsRC/rdSJ2dLrn5RT6M
	 mxjPjdYKyZKpw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WtJj464Whz4x2M;
	Tue, 27 Aug 2024 17:15:20 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <45f8fdf298ec3df7573b66d21b03a5cda92e2cb1.1724313510.git.christophe.leroy@csgroup.eu>
References: <45f8fdf298ec3df7573b66d21b03a5cda92e2cb1.1724313510.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc/mm: Fix return type of pgd_val()
Message-Id: <172474289344.32718.3015990756212968494.b4-ty@ellerman.id.au>
Date: Tue, 27 Aug 2024 17:14:53 +1000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Thu, 22 Aug 2024 09:58:42 +0200, Christophe Leroy wrote:
> Commit 6b0e82791bd0 ("powerpc/e500: switch to 64 bits PGD on 85xx
> (32 bits)") switched PGD entries to 64 bits, but pgd_val() returns
> an unsigned long which is 32 bits on PPC32. This is not a problem
> for regular PMD entries because the upper part is always NULL, but
> when PMD entries are leaf they contain 64 bits values, so pgd_val()
> must return an unsigned long long instead of an unsigned long.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/mm: Fix return type of pgd_val()
      https://git.kernel.org/powerpc/c/3b1f7a46977fe2ff9384d08651a6e0d272ae6a60

cheers

