Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7767AB45
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 16:44:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yfT14YKzzDqV1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 00:44:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yfQp37YrzDqS6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 00:42:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.b="X7i5oqvt"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45yfQn59zQz9s8m;
 Wed, 31 Jul 2019 00:42:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1564497729;
 bh=vUMUX/7k3pQXC5FL4whWy2LS4dQN6qjUSbztGnpKFb8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X7i5oqvtODD3P29rlwibSJ50R+u572IKhvqmA7QGbDw006vmURD+kId8vehoq5Kr6
 qqOAWxv/yVr34hNxYD4p6Jbr8Cm7G4TEKDHHdPPmJuJGROojXIIdPOpNg/SbY5xFtW
 sc/fPQYhH9evC9ZxD7cAy8M0PLy5SwZ/Wz8Gpnj4bckbEglbO1EWdMv3l1lFUmLyVN
 dCaGjTmp+L8nMQHVcNFKVip5S+s01Mf7mMj8Abnlz2PpHbQzq2/0zX0AJqAOqvxFrz
 SIc5V5w/jrMKkdG4zHs3vdhyGJh8n6pNzB6ISxUbyPfN3mx66lLt9vQoJa9mablOGD
 zBphf0rm9oaKw==
Date: Wed, 31 Jul 2019 00:41:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] drivers/macintosh/smu.c: Mark expected switch fall-through
Message-ID: <20190731004153.6c6198fa@canb.auug.org.au>
In-Reply-To: <878ssfzjdk.fsf@concordia.ellerman.id.au>
References: <20190730143704.060a2606@canb.auug.org.au>
 <878ssfzjdk.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pIdlFQu0i8FL/lm6/rYKL9L";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Kees Cook <keescook@chromium.org>,
 Linux kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/pIdlFQu0i8FL/lm6/rYKL9L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Wed, 31 Jul 2019 00:28:55 +1000 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> Why do we think it's an expected fall through? I can't really convince
> myself from the surrounding code that it's definitely intentional.

Its been that way since this code was introduced by commit

  0365ba7fb1fa ("[PATCH] ppc64: SMU driver update & i2c support")

in 2005 ...

--=20
Cheers,
Stephen Rothwell

--Sig_/pIdlFQu0i8FL/lm6/rYKL9L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1AVzEACgkQAVBC80lX
0Gw/rwf+P6QPr+aB8iXvRzPQ1R6e2idCJJup+E7e51Z/Gl59GezLyodDWg3UcALE
lmzirNhyw1ZwnlhfpzcJ5pzHazfn7z/37UuqjUVenq9VWaYiZLRY6XA5ufe3aj6X
Q7xVeJplLON1xKRp+34fPYA3+mYQqNEWhgdsrHzxrSje+aXE3Wac0ArVLPL0ct59
/w/OOidJMAsh3InX2KUK3i83tGUPMyBby56/owxqpJLXFpuFlOpL+vb0ymEawkkL
/gqftyc45jwNC75tOE/17Km8qNqiFSKjQArDgDA3iyjLF1edvr/iNQZBjcRe9WFc
6+5WYM6uIpZVv+og6vpdSzUW3/zvug==
=1jvs
-----END PGP SIGNATURE-----

--Sig_/pIdlFQu0i8FL/lm6/rYKL9L--
