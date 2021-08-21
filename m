Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F9C3F3CC5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Aug 2021 01:54:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gsb206Zg9z3cXd
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Aug 2021 09:54:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nu0XqUSS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=nu0XqUSS; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gsb1J0p3Sz30J0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Aug 2021 09:53:22 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gsb1F315Vz9sW5;
 Sun, 22 Aug 2021 09:53:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629590002;
 bh=Onr5AVHEjS7M8Si0SK8p4+KxnU55CdgeVthymwBaJDw=;
 h=From:To:Cc:Subject:Date:From;
 b=nu0XqUSSYyTuXZDETTjfzNFz+D7FURiP19Gmfd13EsjceY2owDp7IH+JUisr1qNqn
 hQyHf469VuduqJ3WByutUUDFiVvfhkKntgFLqd996g4+ZEbvVWaUEhBwNl54/lvgDw
 2RX45lcEY4nTb0tsvEOl3q1XvJi6P9tIKStlsQofSqxCWn8AqCm/SDTTjboWJYpYfk
 TqC5DQqWPjJosmzZ0bqb6+5jWW4nJoBkykLQK6tVT3TJLdGgETSw6CxzKze12q98nO
 kRnpvjVfV57C6061XtSjC/MHdvdFNRz53FBymGyo/k/ft4tPpFktKGAJMM3XW+xuno
 DqgGHz/d1rgfw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.14-6 tag
Date: Sun, 22 Aug 2021 09:53:18 +1000
Message-ID: <87mtpacq35.fsf@mpe.ellerman.id.au>
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
Cc: nathan@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.14:

The following changes since commit cbc06f051c524dcfe52ef0d1f30647828e226d30:

  powerpc/xive: Do not skip CPU-less nodes when creating the IPIs (2021-08-=
12 22:31:41 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.14-6

for you to fetch changes up to 9f7853d7609d59172eecfc5e7ccf503bc1b690bd:

  powerpc/mm: Fix set_memory_*() against concurrent accesses (2021-08-19 09=
:41:54 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.14 #6

 - Fix random crashes on some 32-bit CPUs by adding isync() after locking/u=
nlocking KUEP
 - Fix intermittent crashes when loading modules with strict module RWX
 - Fix a section mismatch introduce by a previous fix.

Thanks to: Christophe Leroy, Fabiano Rosas, Laurent Vivier, Murilo Opsfelde=
r Ara=C3=BAjo,
Nathan Chancellor, Stan Johnson.

- ------------------------------------------------------------------
Christophe Leroy (1):
      powerpc/32s: Fix random crashes by adding isync() after locking/unloc=
king KUEP

Michael Ellerman (1):
      powerpc/mm: Fix set_memory_*() against concurrent accesses

Nathan Chancellor (1):
      powerpc/xive: Do not mark xive_request_ipi() as __init


 arch/powerpc/include/asm/book3s/32/kup.h | 20 +++++++++++++++++
 arch/powerpc/mm/pageattr.c               | 23 +++++++++-----------
 arch/powerpc/sysdev/xive/common.c        |  2 +-
 3 files changed, 31 insertions(+), 14 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmEhkccACgkQUevqPMjh
pYC9Lg/+IUShkBlGUMxvOiz81E/PllRoYsj7ljHyzACZ1ofwa2u2ffSX06E8Ymqh
GDtzSx13q6i9zInxZ4Fg8Ml7wh1oWxRu/wDOSoOS+Td2JtjhJxB0YKOxnpdr2FaS
7wMQpQOZVQfbskr8RouuU0mvUYhrdkxQJT8Q9E5xOUl8jTuzmYsctdr5JHzUVWHF
FrOrKDVs7thwwUlZ5vA9woCUC4CxktqR5WX89KJLd8zuwuH2nNVVq7fLVm2jC7vU
VVww1XydwSPD77r8CCqd599Sx/yGF38xKPwJ9eVqQktceQnSCI32xSfhSTz/HfMm
CVMTkfbqP1Mwo0dGWnZXfJICB9pUlOImT5+dwBFGzOnEent13ZJGcVivKZj8KhHu
wT6AOSpMpS7+I3VfPwgv97YZT9Obea4Ntap1hBKCxgPg7Szb3MRvdpR+Rw77DaYW
YAJL3gugzhWtL4xZ6gkYWlya9boS1cuOa7tVHncrouQ1XYT0ac49BwTnA85x/orV
rlgaNg4SETnqhXWYhQOW+3K1iltgWnYHiD777y+m1jupFZv87t9F/2mjgqj/MqIV
YIrpXfY0XLu092958taOvcjYhjjFjIuQVaXHhSLhTH3s8A6zcbULwqJCqjNPvSOx
b7+ad8XFLLFjNqcF6MDcp63WK5zUf21ev0iNRfkXoMaat3cnn/8=3D
=3DQn2l
-----END PGP SIGNATURE-----
