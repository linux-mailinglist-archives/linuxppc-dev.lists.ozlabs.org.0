Return-Path: <linuxppc-dev+bounces-6336-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 158F6A3B070
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2025 05:47:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YyP4d3YYqz2ynf;
	Wed, 19 Feb 2025 15:46:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739940417;
	cv=none; b=YtWvE5gSeoiURHRLiumzVH+svH6Xnk99fJyNnom3SOqZ7wpoRAp1OI/sUpfZVt0Lx+QU+y1DzeymIbTAAnMeYgb9R5r2qft8QvtAXMhL8kjt7bekplryOah1vy8RqnpVaZ5MY6Y0+dtdRi1n/U7TRQB1JkGt16jRlb9Mu43y8MosRhDQLWnSHN1MLsNDPpwPxdB4+DLa7B6aEEPrWUiTfInbihtqdvLc40QGWS1Fi02GjnOEJ0MSSFV3DGF16xZUi4lJCpfS7YxrMbS4fjzFCxU10hej1RWK1FRYzhLu3TG7zWtaxVFU4RrTDyco7scxZMvFRmp8CcwqkjMgsuJNDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739940417; c=relaxed/relaxed;
	bh=XekwQr8YCb0pbm4CorUNPNZ3w1nUoLOAQbycB5NoNXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EI6t7RsST/zYTT4BVnjOMnxyrh+NBmjT4kjYWN0tVlR0vuRV3ILTepfJShSroLahcKfwQO3EjjXsrAX0YbbSd4jzRQwEa00lYhj9CMeu67olO5ssWHYjawyUQWqzn8T3ax7R4z43nzg4MpMXUNWWNvltKtbIqMZPxwmMUt051eJ3WF5FvU601PKEIQFIFlbbqBtrY1nUkDaE8J+pre0P1JOEQ/27yVyXVhGZLhHLbIA/aMIpwJ7Dlylt+Qt0goPZ9XF2rups4uwXvTEYZTPd0E5Wil0eBFWPA5ECd6xLCNbeGsins80rmQXXXsYCGh34eRUAjlthw5pTAxzHiXXx3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=Vnuyl/CN; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=Vnuyl/CN;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YyP4Z0L0rz2ym2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 15:46:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739940410;
	bh=XekwQr8YCb0pbm4CorUNPNZ3w1nUoLOAQbycB5NoNXc=;
	h=Date:From:To:Cc:Subject:From;
	b=Vnuyl/CNJswHJOlbW3d+MLv/S2qqYR6gssIaWa07/r7rJ82N+XZPdork0di6jgsD4
	 KsAd3SR9LK0pY0+wYM08r3inRJnpww/qw7JwMlR7TKxxr/Pa9e0ncU+CgiHvaxQUI/
	 v9uAiakPCSCHUoTBwf9Y+1QA3kOEED0TlMPqruTloHjmtgyBmq0t+bN0QkPu3kM8oc
	 5wKWXX+62GtrrliyasPQbaPfvQNhWMQwAUyFRGtDKbuFzEJuMm1HCQ6OBo6MalbbXe
	 ej1JU1vGzxKqI8p/j3gC8nxEfEliD9p2A2Lll0BoEQ/rUMoXAuxS6kWLGji3c++8z5
	 aao8/zFXlZisQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YyP4V2fwGz4wyw;
	Wed, 19 Feb 2025 15:46:50 +1100 (AEDT)
Date: Wed, 19 Feb 2025 15:46:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the powerpc tree
Message-ID: <20250219154649.49986660@canb.auug.org.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NtBZPH9F=N4wEx8F/5CNzl.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--Sig_/NtBZPH9F=N4wEx8F/5CNzl.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (htmldocs)
produced this warning:

WARNING: Documentation/ABI/testing/sysfs-class-cxl not found

Introduced by commit

  5731d41af924 ("cxl: Deprecate driver")

The reference is from Documentation/arch/powerpc/cxl.rst

I don't know why this has appeared just now.

--=20
Cheers,
Stephen Rothwell

--Sig_/NtBZPH9F=N4wEx8F/5CNzl.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme1YjkACgkQAVBC80lX
0GzAaAgAmjS6vD5Tf7lCgqVn9U2EBtbI4ZNqLS8aqs6sxgEODJcqe34KW2dqkbn+
vhmzKA0EGk+TUSmKoDMhhYOB5lSEw/ZOJkTMf5jKC2R5vGI5HA5cqMoWU4J8u7be
GQeXslBDusNFHoOo8lah9vHFGeUy8mdSqUpEwg1zf8DOE//VfITPM9jJqlRKg938
bejSBCOKNAMuw9n1gTIGjuR3DU0z0rzGrp5n9UGzl0zQY84w8yntm/6XuAA34nTt
0wSIUbCIxVGYH2/fPUc3nlKuIXoOWOwysl4ZlU5M64WVtpj0hH1TnHavmblLR8Zy
HkpJtwMx1jd0sI3IVS7pOMk1se1Keg==
=+i6K
-----END PGP SIGNATURE-----

--Sig_/NtBZPH9F=N4wEx8F/5CNzl.--

