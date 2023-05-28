Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C298713750
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 May 2023 02:14:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QTK0p02G9z3fGW
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 May 2023 10:14:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=g/tVwxWr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QTJzx3vMSz3btQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 May 2023 10:14:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=g/tVwxWr;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QTJzv5N3vz4wj7;
	Sun, 28 May 2023 10:14:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1685232844;
	bh=O5Lcm2reSWPalZScyJICd3W6ceQhK6iPfkPTWnMgY/g=;
	h=From:To:Cc:Subject:Date:From;
	b=g/tVwxWrAszoaqu0+H/rMRemIZlkx5YWWG2jclbFAJXxW9gHb0RYk9B7ti7WOWWrh
	 OKNrcBxD6zoBkobvcNMjwCPuNOYSAeVtCrpDT9adyiNyFsNkkIkSvkywPyHM9uxhr5
	 ojdzcLWS/78c9P5nJdUlQJbDq/rxPlaO2sgjNgjCIFaj8P9xiHb/7YzR9SzOnWXZYg
	 nvcQTlx3MFMTrH8nntRXhO+xOGIXZomDXZQPXKXHQYs7E6d7fK1H6leMV7XA7c9P54
	 PmtReVCTCuZl9DRVlij72CDD634laJn7j9OqeA/cNRjOcpM3QbDUnzYOmjIznjF+0e
	 MmoIBmKFIqz+w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.4-3 tag
Date: Sun, 28 May 2023 10:14:01 +1000
Message-ID: <87a5xptira.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull another powerpc fix for 6.4:

The following changes since commit 1f7aacc5eb9ed2cc17be7a90da5cd559effb9d59:

  powerpc/iommu: Incorrect DDW Table is referenced for SR-IOV device (2023-05-17 00:54:55 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.4-3

for you to fetch changes up to 358e526a1648cdd773ba169da5867874ae2408e3:

  powerpc/mm: Reinstate ARCH_FORCE_MAX_ORDER ranges (2023-05-21 11:40:34 +1000)

- ------------------------------------------------------------------
powerpc fixes for 6.4 #3

 - Reinstate ARCH_FORCE_MAX_ORDER ranges to fix various breakage.

- ------------------------------------------------------------------
Michael Ellerman (1):
      powerpc/mm: Reinstate ARCH_FORCE_MAX_ORDER ranges


 arch/powerpc/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmRynH4ACgkQUevqPMjh
pYBJiQ/+JDl1NKXbyU5d7uJZbI2k5u3Pq14o6+E9IyOzN1Ez5IEsUcruKmYpPBV4
Pn5iG/wBlcYKxK5zq0SF0zs7Q+ouXGZUR0ykY0vabcD/0s+AKIPlZAzKfaHwAB6j
phpLCldv4luZxXK5ukf1jLddwl4Dj5cKKZAuL9KQf3qQLfhmZJLh/HCnf22ydDW+
qAoj1pVFWEjQN+DkCR0dvryD2DsXXixCFNCTKy1OcQbLJCiDnmbzzxhTGDl7O5UE
VjqCJQE8lomc0EStD+9w6O/FXpeIlVsIM72IPxRWMsoR4vSyQ/TRPqVA7OxybLy3
CJcBWkk+nhNze/5+8uNQcvy/q2FJDE7DvibZc5WtH+rXid8+qq1EaVhfaeQ/z2Va
WjzbXT8OVJVi8H2o2bY0Yb2Mx+jZIIkpSaLdRez3Q0w5dK/AryzYT3c/vx7LHKkI
PK74+R/2wZiKZCipY4J3XBLRFV5tR5VA0qW2ls5yvu+D6kiSfHTKj6S0KJ9jZTIc
ieqbEhzdvnD+GAN8QZDmtl6b7SUyC/QXFgBVvj87kl++zAyRxFE1Oe6LpbelXWdg
eRGGyhdnWt0TUC8jLmlhaGvDpXwaViqIVG0abhH/Ma6EUAmxs2z8mCE+3CIAGWoR
WwGQV63NXw2zMHac5VkBGVCGatCYRIsC7ivYa60Pe6LcidbT+hs=
=LSac
-----END PGP SIGNATURE-----
