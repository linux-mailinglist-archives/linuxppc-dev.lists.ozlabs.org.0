Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E93010D588
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 13:15:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47PYNj1zZdzDr7l
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 23:15:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47PYKH40C3zDrB9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 23:12:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.b="cYj5mokh"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47PYKG1PHqz9sPv;
 Fri, 29 Nov 2019 23:12:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1575029522;
 bh=w+aopI9O2Dzyfr0nxTm4hkaf4KVgkKPxak3kfRPZys8=;
 h=Date:From:To:Cc:Subject:From;
 b=cYj5mokhYkP4R+179q5yrXtqQUIGGo4pRYLnC9cWnueUsZgZUsu2x27XdG6/ZnlxR
 iNjFw+pZIox0UepZkK6mqRF9WJCe8CcbfendITWlSzeKq2Jm10qMOYz2HJqLHKjEVp
 n6Mxu1E14o3O0+Uem1Dv7XRH/0hRglzQcaddNqWI7KhUjw6VNyVtzP2tImbLeEC62j
 Qj/QZBaa0synVMWPDUV3ebplJK/SjLGErOU7XoZpAwfpMRB71SYnZsojtB7D2KG2Og
 EeGhrUbjDwOtl/wif+wTJVm23UiqC0mLsIWGzPsDO8M4wDk7dU4P1lmc+SwyvjwRnj
 V/XeGvd8XmVog==
Date: Fri, 29 Nov 2019 23:12:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: Fixes tag needs some work in the powerpc tree
Message-ID: <20191129231200.1f5ae2a9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z+WSB/13xWh+vsrbuuRskKy";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/z+WSB/13xWh+vsrbuuRskKy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  6f090192f822 ("x86/efi: remove unused variables")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/z+WSB/13xWh+vsrbuuRskKy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3hCxAACgkQAVBC80lX
0GxWpgf+M6hymsP96u6qxbCtaZhvWUaYrAF3CMJ0/eO5oU1+NHGDpkHCLb2wIy21
JHI94c6IYFklCeAB37hbLItrVVfQWiv62/6g5rxi12IoJkgqjw/6M5w7uBjukDIT
wjYp8SRHPtE2I4qbRWcu4hVv1GWh8fFoNTtQIuQXkJ5LOKKCYYl8RDNMSHVg5tUF
ECoP6CCSpfUzado8teE+N7Lri7h1YMxz9YHf86FEAuDwJK7VHxVDFAYlCDlK0Lxs
8YPz/fFOIB+OmhvkjOd0VxXGFrTCbu3W9RMpdNyvQ3b3yzm2wLHeFdnkwgjNIo43
o76HRB62p7LTHhA4ksSvF7q/+of/VA==
=R+J/
-----END PGP SIGNATURE-----

--Sig_/z+WSB/13xWh+vsrbuuRskKy--
