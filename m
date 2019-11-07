Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFAEF287D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 08:55:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477wgf2rJMzF1tp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 18:55:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477wd72pz0zF15Q
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 18:53:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.b="l5EM9iXC"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 477ttV3Hh4zB3tP;
 Thu,  7 Nov 2019 17:34:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1573108500;
 bh=8QWFC8ATOW/EWg2Fx4XSxd/+I6wxAZCxEEB8iiH/Ywo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l5EM9iXCztIvbZInfj1ruXyv6YaYOKS3Ef5x5s+/TphU4cBRKtqq+6aNQgGvgkGZR
 7nfbzNySMTkA6jJftTOwd7SmXLtFsum33xOsHfu678QnYkL5hzuBaNx+qYZKqy+GG4
 BnrmvPa6HCOqYavtI0Rpo5NEhMA7K/2RwHhOKpDqbysn0s7e5B0cxRRDcCVwpwD5Qj
 wjnJUB930g+Z89iEqjr10awoXsZsRiV9eQgHCPCu1RsyXF7srI03RWgHBr9E7TMzVK
 KWPIf4bYo0KxNlOFVMBCVXIg8uQOqmOEHCAvA0SG5soPbvZWU+i2HozMyKmcy7maTf
 wPA0Su1RnUitw==
Date: Thu, 7 Nov 2019 17:34:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Please add powerpc topic/kasan-bitops branch to linux-next
Message-ID: <20191107173451.6be74953@canb.auug.org.au>
In-Reply-To: <87r22k5nrz.fsf@mpe.ellerman.id.au>
References: <87r22k5nrz.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QLj.mRHKb6JGbFGyiT8jLoU";
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org, kasan-dev@googlegroups.com,
 linux-next@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/QLj.mRHKb6JGbFGyiT8jLoU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Thu, 07 Nov 2019 15:11:12 +1100 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> Can you please add the topic/kasan-bitops tree of the powerpc repository
> to linux-next.
>=20
> powerpc         git     git://git.kernel.org/pub/scm/linux/kernel/git/pow=
erpc/linux.git#topic/kasan-bitops
>=20
> See:
>   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?=
h=3Dtopic/kasan-bitops
>=20
> This will be a (hopefully) short lived branch to carry some cross
> architecture KASAN related patches for v5.5.

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/QLj.mRHKb6JGbFGyiT8jLoU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3DuwsACgkQAVBC80lX
0Gx+nQf+Kb9/DdUAxGd+w9sWu1q0Z+Hiq9qD8vwzOM0/tFtNdMhWLOJRM0idUy9Q
NHHN0yi54olE5bolHbOqmXXITBE+Dy7RyRUchaPSMkUgAAI8n+iteHy4/ZakmJr+
6lYeGHjGzM9+9q5eYl6yD7hj6cAAyI4wBUu0fMYBcuWix/xOImWZAe/6iGRhgRLf
UAzDGUbnyqpox0S0v10SJjbTkGXyuvaxzs27pGUBZbRODNPbZYEX7hpo5TnQxzBq
ZMkJaRdxAKi0szigouKz9d75XPKNmc4zz5tY9gCShmBlE6bjJHzVF0ntNGrge78W
mMgfvcvatGMcL/fbSn8nu3+vqMnFpg==
=XNA5
-----END PGP SIGNATURE-----

--Sig_/QLj.mRHKb6JGbFGyiT8jLoU--
