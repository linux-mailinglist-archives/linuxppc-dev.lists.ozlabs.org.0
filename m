Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4965B37FC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 14:37:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPFqZ2cMxz3f4c
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 22:36:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lLZb37gr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPFpx2nPhz3bc5
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 22:36:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lLZb37gr;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MPFpx1t4lz4xPB;
	Fri,  9 Sep 2022 22:36:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1662726985;
	bh=gqLCwR5ksB6FpQbRsYpoI0uGdVoPaLEJOth1SfGfWTE=;
	h=From:To:Cc:Subject:Date:From;
	b=lLZb37grJKR53+9dXWgmx38xqP922SwaXuHpe3ojjUJ6/QEioKQJKV2C+n80NezhW
	 7qA3IgA6RYnCc8Ki7lT9PnGuz3sxIIh7uBQrsHznMAxVoQ9+JKBgdZYQ4JI2kteW2k
	 P5hdEWc+8KVxMcqGol4DNpdrPooMSAdxXzK6UGcQLWPZIUPk8a7Zn+jEMVjZRRfTBW
	 c5XTs0fZRyXWJ1g9t2EGDgFNoNPWd73wzxn6K1jmXCMJqWK/F1/Bhg9thORBlgxiif
	 vfhPKgH3OV5Z6Yf7W5tYMpIq8B3w+CRGVqstDKskHHewDUs57EDyIpz9yLM4fCDWT7
	 6MExmOiTg1D9Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.0-5 tag
Date: Fri, 09 Sep 2022 22:36:24 +1000
Message-ID: <87mtb8encn.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull another powerpc fix for 6.0:

The following changes since commit 6cf07810e9ef8535d60160d13bf0fd05f2af38e7:

  powerpc/papr_scm: Ensure rc is always initialized in papr_scm_pmu_registe=
r() (2022-09-02 18:55:11 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-6.0-5

for you to fetch changes up to a66de5283e16602b74658289360505ceeb308c90:

  powerpc/pseries: Fix plpks crash on non-pseries (2022-09-08 10:45:57 +100=
0)

- ------------------------------------------------------------------
powerpc fixes for 6.0 #5

 - Fix crashes on bare metal due to the new plkps driver trying to probe an=
d call the
   hypervisor on non-pseries machines.

Thanks to: Nathan Chancellor, Dan Hor=C3=A1k.

- ------------------------------------------------------------------
Michael Ellerman (1):
      powerpc/pseries: Fix plpks crash on non-pseries


 arch/powerpc/platforms/pseries/plpks.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmMbMlsACgkQUevqPMjh
pYDiuQ//YmIsWEcmoHw68cNBVxousox6fuzlAtAjUKPXuIk5ftZqEJV65CoPfp9/
MzQnW+BeLJ1ubMnkHxO5/ZNSly7t428EdvmO3fApOmrwbiUSTBhZKd4i7tmlgpoG
qH9PtCekYjm9MHTBg1ksEvZiozQccw0QrXyNoZiaLSsw7nxRUvS2yDQlITHaiA8m
a1HopFZiriouQDlVcm/0ubGCxhOEzB6HtTpiNsT0jrULN/w08Ffjc8auMLycfIJR
53XlfEP3ICd3+LzK0GYlp+IkPkPdJ0ZgWx+bpcq9ZvptYA0S0dW/tDKq4oqguKOu
jk/WwU4ohbmamR/qWIdd+dwcMwQqaoW10Xa0uxthLSsS2d3x1gMU1rSjjQca4Xkq
Bbm3hxWhTZwyYBQEhLPVlUoEzGCLY6JvXwnObypeTNcbGs8l548OIbnXaKT3FEps
pvjLpzwI8hSljXSovXa1hY1h/ywZnFrSTb0KGtDhZ13zuv0Strhr2UJCndmPadFJ
K48aQiDPQmcqXEwCgyEp5TmZhK7hZJlAFAJse/GvLdJTSuHUrszqoqG3pu4GQCWH
Pryw1sMuyWqv/PgTYuoi1PJGn4BA4igCxqISuFnfsUZV+R9r1my+jzIcVkYkfXCm
LOSE1azP2JS8bq9zQKfHYnuldM5As7dz6aNETouSOXqvQtpXMIA=3D
=3D4YFO
-----END PGP SIGNATURE-----
