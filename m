Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7CB7D20A3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Oct 2023 03:40:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=sE38i2iP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SCgxg5jS0z3dDM
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Oct 2023 12:40:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=sE38i2iP;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SCgwm16r3z3bVS
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Oct 2023 12:39:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697938771;
	bh=Psot0sdGkipAd8UEd4Nh9M2s7l+Ap8Y7hXYBVAtW2kY=;
	h=From:To:Cc:Subject:Date:From;
	b=sE38i2iPvuvIBh1+MR4K8MS0Xyr+Ap7Hd/b6oUiLkfHfq3EeX458+lickxLhJsAFV
	 Z2rSZadvx05sNq8xPrIF2XUfajRvvAwQ2Dk7Bm0lw5wYsEMgLkM9HGZlWYeWK9o71L
	 IaeL/7wmSrYnLp45Bjui4F0g5v7N7cosUIv+pB0V7kzgugFBRprseoc3Vhuk/yXAhO
	 eXjZKyRlQZesEXzh/qcM18iH+MikhiV13LOenw4kVS5q3xz/b9N/3Gq2ub5S+XBA1O
	 528xc9w8ZFYOxk+2/8QMDK/Ys0uhZr8l5u5PyCFaRG31HP+geGFIHvdDT7IOCKXoSw
	 hqkLQca8j0WMA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SCgwg2b4Pz4wdF;
	Sun, 22 Oct 2023 12:39:31 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.6-5 tag
Date: Sun, 22 Oct 2023 12:39:26 +1100
Message-ID: <87y1fv4er5.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 6.6:

The following changes since commit f0eee815babed70a749d2496a7678be5b45b4c14:

  powerpc/47x: Fix 47x syscall return crash (2023-10-11 09:31:26 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.6-5

for you to fetch changes up to f9bc9bbe8afdf83412728f0b464979a72a3b9ec2:

  powerpc/qspinlock: Fix stale propagated yield_cpu (2023-10-18 21:07:21 +1100)

- ------------------------------------------------------------------
powerpc fixes for 6.6 #5

 - Fix stale propagated yield_cpu in qspinlocks leading to lockups.

 - Fix broken hugepages on some configs due to ARCH_FORCE_MAX_ORDER.

 - Fix a spurious warning when copros are in use at exit time.

Thanks to: Nicholas Piggin, Christophe Leroy, Nysal Jan K.A Sachin Sant,
Shrikanth Hegde.

- ------------------------------------------------------------------
Michael Ellerman (2):
      powerpc/mm: Allow ARCH_FORCE_MAX_ORDER up to 12
      powerpc/64s/radix: Don't warn on copros in radix__tlb_flush()

Nicholas Piggin (1):
      powerpc/qspinlock: Fix stale propagated yield_cpu


 arch/powerpc/Kconfig                 | 2 +-
 arch/powerpc/lib/qspinlock.c         | 3 +++
 arch/powerpc/mm/book3s64/radix_tlb.c | 9 +--------
 3 files changed, 5 insertions(+), 9 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmU0fBgACgkQUevqPMjh
pYCoUQ/+Jg66lC4D2tIcGFX7gHmWkHgx5uqchuTNB4GtI4W55eJaN/ZMdhUiJ5Gg
DsTjWlXnRY+sYBgXJw/ptZHoclYyN3SAEn/M+Zq1XYJNTjpg6TjNZpuuIzCgUYUd
AnNz54v8fCoHH7Yfc4T774gUq3c9WKQlQLF9dwkD67lQDfwwaMERLKpuXz/NKfrQ
+kvRplC0PkW0N0GY9w8PlYbd04MtjpOHucfQtaRAV2m/hRl0TPoHtteTwzcwieJC
pUuycjCIjy/PRJtUHOuHCFUq7hPshOAEg0R/cJ4/uJfOAjAlR7aPFhj9S6EhmALN
IURp3KgeUqri1e5ZSJ+ue5y3+/9fO/WD9FAeOgZJwY2HS4rEqIPgMc/H8oPKINUQ
BUmjfYmpYgMsnOK3/70Yt8CVmDDn6bmAs3cdDa12udYP+TZevdxskIAOUgW/bRWe
xHvf+JRAtCiqAKFsHhuO/sib1TtQGBNVJKydrJ+S8cUJf0IF5f0R+ns+piG1lc7+
05qvANSNpKgnvVSrXnS5Op9CfR6a6l9h1CJzJlCSJMp9a7yZ/6rDQQ8jt1sxVSdG
23xwUbQguveb6nf+UZQ2RPfdpTZTaxD2rHN6uAyCOqrNpu/ac4HaeGGCqHJdq8g2
S0sk1fi5bUKbcBepJuT4HMJTPLpJLnYlvjlzCKS/oEUc9d+cDf8=
=xp3d
-----END PGP SIGNATURE-----
