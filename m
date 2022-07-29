Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A9E58502F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 14:50:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvS6p6tfTz3bZ2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 22:50:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=g+tzZJCr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvS695thPz2xGr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 22:50:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=g+tzZJCr;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvS6444zqz4x1Y;
	Fri, 29 Jul 2022 22:50:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1659099006;
	bh=jH8FOkQtc7a69LUCXQygt56sOWkaGy2H4//CbkzhyLw=;
	h=From:To:Cc:Subject:Date:From;
	b=g+tzZJCrv0mIUH38qwNSU5FZ/edFL1UFhMqyeazbBLDH9R6LXe2eAZlt/aaFf6GQq
	 pugEZ+/QAUP9whdzWJeocp7suicQH+XVFAvtHDYzTfbovHxJzoCOnPLgOdbqhZjLLP
	 Iabcx7UVvJR8XCs2nuBWFPPxcd7vuFEuQ97fjBi3zi7FkQjVfUknR02Rdxajt++VMv
	 oAJOqtxEcBAE9hq4GSZsG43AEp20z+phPk/gCVCWb4JedYz7hU2jxwTL+f4zq9qqXO
	 eAMKTP5DP0p7s8eDJuAsDlNo4t0L6UD+4CDk7OzQ2uAIMDhyWRMIX4dbpEnB9exq0j
	 VgkE3x/CvsedA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.19-6 tag
Date: Fri, 29 Jul 2022 22:49:59 +1000
Message-ID: <87mtcsaxs8.fsf@mpe.ellerman.id.au>
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
Cc: alexander.deucher@amd.com, dan@danny.cz, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull two more powerpc fixes for 5.19.

Notably the re-enablement of the new amdgpu display engine, which was previ=
ously causing
build errors.

Restricting it to compilers using 128-bit long double seems to have fixed t=
he build
failures people were seeing, while still allowing it to build with distribu=
tion compilers.

It's survived several days in linux-next. There was one report of a new bui=
ld failure, but
that was a genuine failure that has already been fixed:

  https://lore.kernel.org/amd-gfx/20220728203347.2019728-1-Rodrigo.Siqueira=
@amd.com/

cheers


The following changes since commit ff6992735ade75aae3e35d16b17da1008d753d28:

  Linux 5.19-rc7 (2022-07-17 13:30:22 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.19-6

for you to fetch changes up to c653c591789b3acfa4bf6ae45d5af4f330e50a91:

  drm/amdgpu: Re-enable DCN for 64-bit powerpc (2022-07-26 08:25:38 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.19 #6

 - Re-enable the new amdgpu display engine for powerpc, as long as the comp=
iler is
   correctly configured.

 - Disable stack variable initialisation in prom_init to fix GCC 12 allmodc=
onfig.

Thanks to: Dan Hor=C3=A1k, Sudip Mukherjee.

- ------------------------------------------------------------------
Michael Ellerman (3):
      powerpc/64s: Disable stack variable initialisation for prom_init
      Merge tag 'v5.19-rc7' into fixes
      drm/amdgpu: Re-enable DCN for 64-bit powerpc


 arch/powerpc/Kconfig                | 4 ++++
 arch/powerpc/kernel/Makefile        | 1 +
 drivers/gpu/drm/amd/display/Kconfig | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmLj1tkACgkQUevqPMjh
pYCa4BAAjoZx05wxNVch2/p50TejvE1RNN63wQr3FZTsixn4I0fNM2uVwoZ/v3uy
EosAcNlJCqD3ZkseCYSVZABN9i41NGAiWkZOaOBA8Gk99PXJz0+sg4RrqE2ikoyT
n0EqcvtyvciBEp/vt1Hrn+MvkVoPdilwRJHCVKSPfiQg7n/kSnRJ1gmhjap8Tjy2
8riyHE2526WCl1cZsP+9us8JsTIpiFfjbLCOPv4wq/D6jqzEE5Aewu8euPhaNuXk
w6F5dUQ9pxAxMue2edpGVmIUTaPU+zwr9gxVQbd4nIVXl2A2HeAySuVgzWW3DdwR
zw4GbviQdHQVac7BiSGWLlpXg0jzXUFbWRZj3QWz9L90WlxNDdSO90gcTMjzkqj/
G3SpfTuNMphdMldwJ+TNS1g3LYJtBC5iV9Cuhq125uW3lMnZZ1BBaeIJTnemr3dY
qK4lxYTUT/UwdH+9qgIa6KZ+guGyu8UIe1GxUcHBlozvP7OoDijsSEChAQ1mNw41
zQUPcnCCTZ0ZlDG9kHF4FmXvrOQy682AajKapPwxUiOPKRDzc8QHMK6igLY3sdA5
lOdQlClTHCSa1yx5U+f3PSaS/eDkfThSFtJSOQvdIGz7fpeLuV8bWSJR+JYErLBT
uVZj0Pej4Ah4IaG1hMfJshq7+arghhULQqqbKMj4BqhwvP0i/rA=3D
=3D7HNO
-----END PGP SIGNATURE-----
