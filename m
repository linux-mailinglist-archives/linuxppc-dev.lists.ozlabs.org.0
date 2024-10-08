Return-Path: <linuxppc-dev+bounces-1858-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC4F995930
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 23:18:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNTQx2yngz2xpp;
	Wed,  9 Oct 2024 08:18:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.227.221.253
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728403778;
	cv=none; b=jYM47IqvYaPJKnVEPmVBgdBtkN78HHU2h9O3GqyBUQMIMApRoJbeZMq5y/SzGIotBNRhsvN0u794UXhlkxT6DGGuj1uK1+Db73nN4uKA6uUHUiSlFwepjCKdZgz4wSrOdM0ecavk1nC3yYdpDZzx6fGQTrPlNzI1y38ioD5c3ckGPAHGghzCmH/hBKjcMceopDjywdxCLnV4xG1K7H0DNSHNqvfrOjv48rhFpibpN45RfHIS2pPZXGfG5x94aZI2F6/vNAor4SUr7CT0rfKbfj6n7TUZrANR43Oa11oU9sv167gYzMKiDhMEQ3XaHcAihZnsO8FJRh35JNRX4B3cLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728403778; c=relaxed/relaxed;
	bh=oJizpp9aoOY0AopSPxylxEhhCtx+WlqEdtLodFwISho=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SPPQ4S+0+f9dfMANLrgcSQMZudm5XFreS3WM+Cp0UK0NuDD8kdDs8wE9yvU8ePtgnygs6N4zTQjB3410pYeoV0AD024vCBMbma0LOXZkVzgV4sP40y7PPyJzS7n7js4NeNmwn8orCApQNCPMnVBiYsjE5irzyGLUFaNK8r5HZghTYZZ8mp7Npy/R84ODpD2XxWGgMce5SeQEhdd5lhVXk03ZymRcMvKUupcxlCL7S8XZyMMEqxFS2xSCnca11L0HTpC5zykObeLQP7mMs7fnLVc8smhDy6m2ft6FPj1mp+Q86JqNN49QyxPG/IFHwYOH7y4rgz1t8qnp2Rg3wpeRAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=keithp.com; dkim=pass (2048-bit key; unprotected) header.d=keithp.com header.i=@keithp.com header.a=rsa-sha256 header.s=mail header.b=Zk9bYakH; dkim=pass (2048-bit key) header.d=keithp.com header.i=@keithp.com header.a=rsa-sha256 header.s=mail header.b=NSOj9hJX; dkim-atps=neutral; spf=pass (client-ip=63.227.221.253; helo=elaine.keithp.com; envelope-from=keithp@keithp.com; receiver=lists.ozlabs.org) smtp.mailfrom=keithp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=keithp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=keithp.com header.i=@keithp.com header.a=rsa-sha256 header.s=mail header.b=Zk9bYakH;
	dkim=pass (2048-bit key) header.d=keithp.com header.i=@keithp.com header.a=rsa-sha256 header.s=mail header.b=NSOj9hJX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=keithp.com (client-ip=63.227.221.253; helo=elaine.keithp.com; envelope-from=keithp@keithp.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 66 seconds by postgrey-1.37 at boromir; Wed, 09 Oct 2024 03:09:35 AEDT
Received: from elaine.keithp.com (home.keithp.com [63.227.221.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNLZ74R75z2yVb
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 03:09:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1728403773; bh=oJizpp9aoOY0AopSPxylxEhhCtx+WlqEdtLodFwISho=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Zk9bYakHOUzQevZrYXCQdXBwTsIS5nq41acB4bsphbLmhLTYSyaXRBvQ/wpXNYCMW
	 A4nw5snc1cJpmvG0auJZ6pG+nVepA5tXPZ3CByJmkGh8ahJijudq74dm9/dXu/ZAtu
	 jS97S/U+Wt2wTgIcjazn7BBCX78Ttw3TwmzP9vQSKjGQxXA7Wyyz6ratkbZ2kkTsCL
	 5lhcSp2JtVVoD4fImTWHru0z5JDA4ySGqvLMVfvoeEK2ZSBnGmx6pBHyod9mHMx10k
	 tzHI2AIfQmnsd/Ux0AyvWZltpgUxRarkJJoRgGtg3/3RHqPKddNAabFm9s84YPXyr2
	 pVN26WltMk8pA==
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id BAA4C3F2275A;
	Tue,  8 Oct 2024 09:09:33 -0700 (PDT)
X-Virus-Scanned: Debian amavis at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavis, port 10024) with LMTP
 id yKexJ_RQZQJk; Tue,  8 Oct 2024 09:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1728403772; bh=oJizpp9aoOY0AopSPxylxEhhCtx+WlqEdtLodFwISho=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NSOj9hJXUKpWGlxGQaDVv+uH0SmT6MyLkQDbBdfEy45nmCLfbAK0DnTb+FjcOEn21
	 z7cf99MaJkoNan2k6IIo5Cz8tCZiqLQk5lUHiQJMK0P/8V6ejiXS5hFMSV5VR4eF+F
	 1+0xUuXi5+q9HxIyB4WLMrepJ9r/btzY9Evmp210t16mlL4EpdH9NhLfO69ItzbRna
	 RROQKFKpbcnePP3tJVKTsK/SSGox+9EexFPuq5+F0cA6ObQ+jl2L9rxyFt9HjkL6DD
	 9otdZSXaMLfpqcjtejPGdhcBbKpUUWom27rLVGDHsoeMduuTDPREVNYGf9VtWOGyeS
	 gmyQCOangUMhw==
Received: from keithp.com (koto.keithp.com [192.168.11.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id A4A193F208E2;
	Tue,  8 Oct 2024 09:09:32 -0700 (PDT)
Received: by keithp.com (Postfix, from userid 1000)
	id 6643A1E60239; Tue, 08 Oct 2024 18:09:32 +0200 (CEST)
From: Keith Packard <keithp@keithp.com>
To: Nathan Chancellor <nathan@kernel.org>, Michael Ellerman
 <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org,
 llvm@lists.linux.dev, patches@lists.linux.dev, Nathan Chancellor
 <nathan@kernel.org>
Subject: Re: [PATCH 0/3] powerpc: Prepare for clang's per-task stack
 protector support
In-Reply-To: <20241007-powerpc-fix-stackprotector-test-clang-v1-0-08c15b2694e4@kernel.org>
References: <20241007-powerpc-fix-stackprotector-test-clang-v1-0-08c15b2694e4@kernel.org>
Date: Tue, 08 Oct 2024 09:09:32 -0700
Message-ID: <87ldyyvao3.fsf@keithp.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


> This series prepares the powerpc Kconfig and Kbuild files for clang's
> per-task stack protector support.

Reviewed-by: Keith Packard <keithp@keithp.com>
Tested-by: Keith Packard <keithp@keithp.com>

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAmcFWTwACgkQ2yIaaQAA
ABGMCQ/+P5eh4p/7FKNEwLPB1NvaEIPPnwmj0iF7AGh45nKXbtvCVPYuBTXTs+/z
xhYj8zmizQJLgfEjuhJVBLE2DHGQ/hw6ajS/zUPOkwwwmtT81e5sV0OsrxwWqH1E
LPA+jbNyqETz/Khznu5ev2gT5q70AvPigFpufd1CcLZHT/BQjkGKm0WmIrH3DbCH
bsH8fJb1wwmudUQO7XLv/X/znlyFp14wmb3wpVAWooeCzm8dYPoIY139TYbr35HF
+UFQ5HtoA6CsuZOOspjuUSc3GvcDRPEbs1bO3WX3RZVBiBesZsFNiel2Rg33Xlw/
VsGOKkxAotpZbJA6nYA+O42aizykgL4k29/AHaXGVfDONx7SPLzfHSAE1YFEbqRZ
g3M0OxVOJFRF0vo4Pw9YVs9lgxwdu6tWSYMVbF5UMROxSX1CDU8hOzgbQhJ1XaV1
ckJaJNu6E1+1d9dzHydbrgYPZsvAfeeKLjyVaqTroYHfOM4u8ObKNbzpafVFZ9Sw
GTgOS8k5iwOdQT3Pxp9NXimVmqzcRJqs3VnODz9kuYjhGHHO5gU9dm49J1u0HXVV
9xuP2wxAjiP9ue9DWs9hW52k4bYj0o2ssrl3oG8LWQvssuZSxo0jXd7Blmm0ygqJ
FAqH2qOYU8C/Fi/n5iQdPgmSu23BCfS3rnq0cQzit2QjXAiWXKA=
=7U2U
-----END PGP SIGNATURE-----
--=-=-=--

