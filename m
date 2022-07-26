Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FE9580993
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 04:40:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsLkK5fS6z3c4K
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 12:40:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=M5UeYee0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsLjm0Wsdz30Qc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 12:40:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=M5UeYee0;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LsLjk21fwz4x1b;
	Tue, 26 Jul 2022 12:40:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1658803210;
	bh=ffPbgwsAiF6f9gP1BoTJ3ZTtIV+bTqNsS3kxf/UFcWw=;
	h=Date:From:To:Cc:Subject:From;
	b=M5UeYee0MWczs8lgpT3Vk8LfoKOOdhOcWp6UMYFbcCHdDxjYwJuBvcYY7ed9S0tZ9
	 uUo9byHDPa62dNhC93lFDoyTs8dCZVSJrbchzbZuVIXCI+KmUyD/5prLb1b+tJque8
	 bfnN2U3tLw/TkMLXl0jj/BOUSFfWEZFhS/Rtx9+QY4dgY26vRvmFbK/FToemLmYdcD
	 ph5qIE4EIcllZ0v/HsCyMGLSlaAgH0GOUAT4U/ZzVHkijhlxKL9IeQ9ptYJYHiyQ4I
	 l4AjEiHokyFc29HLXc82HEyxjZHnJSf+ywDJIhpLFTEm6M+AbOnSbWnfACC2ZC9iVa
	 Y/oQxuobiDNOQ==
Date: Tue, 26 Jul 2022 12:39:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>
Subject: linux-next: manual merge of the amdgpu tree with the powerpc-fixes
 tree
Message-ID: <20220726123949.357cece8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HalYUGpJ3pAUkov+3DQMFHZ";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/HalYUGpJ3pAUkov+3DQMFHZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/display/Kconfig

between commits:

  c653c591789b ("drm/amdgpu: Re-enable DCN for 64-bit powerpc")

from the powerpc-fixes tree and commit:

  3876a8b5e241 ("drm/amd/display: Enable building new display engine with K=
COV enabled")

from the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/display/Kconfig
index ec6771e87e73,96cbc87f7b6b..000000000000
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@@ -6,7 -6,7 +6,7 @@@ config DRM_AMD_D
  	bool "AMD DC - Enable new display engine"
  	default y
  	select SND_HDA_COMPONENT if SND_HDA_CORE
- 	select DRM_AMD_DC_DCN if (X86 || PPC_LONG_DOUBLE_128) && !(KCOV_INSTRUME=
NT_ALL && KCOV_ENABLE_COMPARISONS)
 -	select DRM_AMD_DC_DCN if (X86 || PPC64)
++	select DRM_AMD_DC_DCN if (X86 || PPC_LONG_DOUBLE_128)
  	help
  	  Choose this option if you want to use the new display engine
  	  support for AMDGPU. This adds required support for Vega and


--Sig_/HalYUGpJ3pAUkov+3DQMFHZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmLfU/YACgkQAVBC80lX
0GyLLQgAhhY4KdYihV9xUmSYc/ELpAv5uV8zN7OIe0g2DoQbTzfpCKKUcI8iiQrj
fDF6NO515TQ4f8MdbypFQMsykzX6brlHni/5YNwNZqBzKNafWQ9lCjQsylgn/MZA
FfqMKH8yxyI10AHNxNIfizy+zAtyMQZbdu9WjAVYSTflnGZYJfmOp5NYrEGoO94r
gqoi3Wa5XUbiTjTI/X4sDFqfjUOmRfoVk3L+lvs94ZSD4Yk3fpfdvuT2YllhPj7C
dZBN53KlnlSVw+yMs94aWB2ldwtMzWy8cLYKTBoRqJdZAF8T/g2A2URXaRDvCIJa
E7mkyFtHESBJEsIUosQf720WjSq+3A==
=Pv19
-----END PGP SIGNATURE-----

--Sig_/HalYUGpJ3pAUkov+3DQMFHZ--
