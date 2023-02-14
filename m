Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EC6695780
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 04:32:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PG6Gc5WW1z3cJg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 14:32:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=oUR/jiYu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PG6Fh19XFz3bgk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 14:31:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=oUR/jiYu;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PG6Fg37lcz4x5V;
	Tue, 14 Feb 2023 14:31:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1676345511;
	bh=Bfgx8xUHxfhLQ0qS9KkOxVzt4NQCDeV4YkZ6medyiX8=;
	h=Date:From:To:Cc:Subject:From;
	b=oUR/jiYuNfxc5YhytS6fPgt5nVZIGrGauTkAEK0wrdIWA26ORvmIQAMCr+CEMEhhw
	 RnK3+jOw19fZKS0s62gnRUSM2l3fBJ3ll70OeWrBbrNoDqoujA0Yl2LTRBfw3qm/xM
	 QERIjhTx/BLC61Df01c0u4Fx6jMPl3H6aFh6Ifkyjou/0hTsf3A0PCH1qoYc2JRaVg
	 T+tvBJFjltSE3Ci+hTf/j/FxDDAm9eO1nRRaUR32jkQ3UumnVlj3EpWJefinZT9UtR
	 4to3q4Jvb4DmvKgPN0IsFU6ltp3TQ/aMyUEjv9Jy2Ysi+pPMquJMpk4hrF+Ge+Tjxy
	 munDc/u0QzyZw==
Date: Tue, 14 Feb 2023 14:31:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: qemu boot log difference today
Message-ID: <20230214143150.7c7fdd05@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F4uhqVyv5ZP1XVIfUuW3fIK";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/F4uhqVyv5ZP1XVIfUuW3fIK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's qemu boot log shows 256k extra in reserved memory:

- Memory: 2046080K/2097152K available (14720K kernel code, 2944K rwdata, 18=
048K rodata, 5184K init, 1431K bss, 51072K reserved, 0K cma-reserved)
+ Memory: 2045824K/2097152K available (14720K kernel code, 2944K rwdata, 18=
048K rodata, 5184K init, 1439K bss, 51328K reserved, 0K cma-reserved)

I don't know what has caused this.

--=20
Cheers,
Stephen Rothwell

--Sig_/F4uhqVyv5ZP1XVIfUuW3fIK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmPrAKYACgkQAVBC80lX
0GxnpQf+MAoK/LgFvfGt+1XO7leXU/c20y0bYK2QgHtBNKQFbccFTelduZBPVX/e
NbwZSBxyhZtiHJ7zFVu4EXuGbihCWvu/UylKKDxKAMGNgy6W3hCnjH9vEo1r14Yk
D+Mlqv42tLg36biJ/Lx6mVDsxh2Y+zZAKEwyK4a+yhVKCTfZ3iz7hw0vXlA6S6Ry
xf76njpf+Nu96SNgEzqDT1Ta4H6vq5khumj4V4hDyrMGnf4bKb0LoTxDTuFQxUgi
ctBb3747AzE8+lGEgNFpeUgLnsgJzXM7EPQMPvnima8DkD8ME+804ktvl/K3Tgfd
OmB0TvXBNeDqyLLydaOmlRBzlAz2Rw==
=Bdie
-----END PGP SIGNATURE-----

--Sig_/F4uhqVyv5ZP1XVIfUuW3fIK--
