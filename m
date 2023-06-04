Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B567213E4
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Jun 2023 02:34:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QYd5h17rXz3f7F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Jun 2023 10:34:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qdrVHzFH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QYd4q37qzz3bkM
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Jun 2023 10:33:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qdrVHzFH;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QYd4m3Tl9z4x3x;
	Sun,  4 Jun 2023 10:33:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1685838792;
	bh=HlEyZhE+LrdUOZTCV04b2fMeKrsIesj187fO09UzUIU=;
	h=From:To:Cc:Subject:Date:From;
	b=qdrVHzFHHkmCWaBGYXaFZALpDl71Ul/+uEYHsJoBvsLf5Voq/G5qpvVS5uMZ74ZUe
	 QeCAdykR4oSeykmCPAsmDKN1aC3cWaW7mQdzTNVf1smELK3eAx/WIT1wkIZiNQ1H2w
	 sloHkLmPm6iew9bbckurez6gINYBPmbmbItCyeXsOOclB+RvEo6sAscqA3Wm2E/pyP
	 OevPSmBbiXoH0CYgH/+G7EUJHcIjpwpotdabVZOWvpVlcB3fk79EV0seYADJPXAh6U
	 WF6UtIkmIqgB4lZCNL7lC5XQYEXm+SaogJtNiwIVpmmAYTOLW6GBHUWKqqWCPmvuR6
	 wgHQh/T3Om33Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.4-4 tag
Date: Sun, 04 Jun 2023 10:33:12 +1000
Message-ID: <87cz2cgj7b.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: maninder1.s@samsung.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, gbatra@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 6.4:

The following changes since commit 358e526a1648cdd773ba169da5867874ae2408e3:

  powerpc/mm: Reinstate ARCH_FORCE_MAX_ORDER ranges (2023-05-21 11:40:34 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.4-4

for you to fetch changes up to 719dfd5925e186e09a2a6f23016936ac436f3d78:

  powerpc/xmon: Use KSYM_NAME_LEN in array size (2023-05-30 16:46:56 +1000)

- ------------------------------------------------------------------
powerpc fixes for 6.4 #4

 - Fix link errors in new aes-gcm-p10 code when built-in with other drivers.

 - Limit number of TCEs passed to H_STUFF_TCE hcall as per spec.

 - Use KSYM_NAME_LEN in xmon array size to avoid possible OOB write.

Thanks to: Gaurav Batra, Maninder Singh Vishal Chourasia.

- ------------------------------------------------------------------
Gaurav Batra (1):
      powerpc/iommu: Limit number of TCEs to 512 for H_STUFF_TCE hcall

Maninder Singh (1):
      powerpc/xmon: Use KSYM_NAME_LEN in array size

Michael Ellerman (1):
      powerpc/crypto: Fix aes-gcm-p10 link errors


 arch/powerpc/crypto/Makefile                            | 10 +++++-----
 arch/powerpc/crypto/aes-gcm-p10-glue.c                  | 18 +++++++++---------
 arch/powerpc/crypto/{aesp8-ppc.pl => aesp10-ppc.pl}     |  2 +-
 arch/powerpc/crypto/{ghashp8-ppc.pl => ghashp10-ppc.pl} | 12 ++++++------
 arch/powerpc/platforms/pseries/iommu.c                  | 13 +++++++++++--
 arch/powerpc/xmon/xmon.c                                |  2 +-
 6 files changed, 33 insertions(+), 24 deletions(-)
 rename arch/powerpc/crypto/{aesp8-ppc.pl => aesp10-ppc.pl} (99%)
 rename arch/powerpc/crypto/{ghashp8-ppc.pl => ghashp10-ppc.pl} (97%)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmR724kACgkQUevqPMjh
pYA43BAAndyoXJ2q+lOdn/tTHA0QUjefB8YON2/9OC/lkX//TWJfInpiZ3GI5DMn
nx44N+zRdYMSjMKGw4NxOiFRoHguXb9Wns/9HEeLz2UpOS5nrxVPJRZsgGDQvzIx
UN8pkOuAQF9nAHUD+ZRp2R61jxlxFrp2V3RvHsRTHyBUUVLcAdjk07GKTm5Z0hYx
eLDka1FjAXUnd/6S4YJAsMpPKdHLxJOsz95mkT5eZJ6Mq67+HeYtd06Kcd6vgMaP
gW91Z93THyKhiEIcSQSJhwngud3UyJfMj+6TIycSHC/21CE9yMHrmt+mjgprJpdd
eLKLIC+I0Gj8rk0NW1AzLveXWoV0tN0rhs+pLA9/l4CbJUlHLq49IG451wksCnWM
Esh3fmHgKQYn8MxNeYUC7h7NNCUWlVLXK4qzSB13ZNBdGVIEwMl5q0cXajXY6g7b
jXwxNLDbuXoyFaZCHdfXkmyMKrxDLVG2kTzLdZ5y5nwmh2OgMu101CqgJyJP34ig
Svu6IZmZepod/A3u4peNKMGHsMRCVI4TYdI3ItbnMV+SDLSLXDQhVvARZNe5PChb
1bSfnFeDG0ib+WLZX85ZlQCsfzoNMRwZYMMOWlreMBKzypVALGFHVADEK+/v1c3w
3bXw58YdrcsjNa5rI0BgucOpQLEzp0VMhB06LIzI0j5yFOjrPy0=
=DY5l
-----END PGP SIGNATURE-----
