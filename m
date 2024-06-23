Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8F191374C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2024 04:08:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MucHfsGs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W6Dyd5z3Pz3cWV
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2024 12:08:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MucHfsGs;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W6Dxw4v2rz3c1L
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2024 12:07:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1719108451;
	bh=wjZLuNgx9By6ZqOtH117HEBJ1w7wnHQvmaXPVGYIMZc=;
	h=From:To:Cc:Subject:Date:From;
	b=MucHfsGsSlsy8pXHPmu849QMMmGwTUwAx0FD9y5+oYzCL5dRetg2UnjJkaT6LQep3
	 Z/fn3rR/oYPHhZ93WSFHzFx6EqMHlfYCluG0DuLME0o4ahRsQFwxL+CkQ+dqLQ+thc
	 Eiw6gU8ZZWjEQEtFmIcMhDIk3T3x1HIHTnr7QmYlK36swNcKf7isqo6cPXQGX/au10
	 5A86YS75PYtPmmJ3Ciopdfn3/6DYLyAHV4DaRCAdB8/jqoyiaCtVdFCX0oLfPQ6+U4
	 ZbMJ7tDNTLwoCtxNLB+pljkgL15xOCnVZY6pSAqtnBjFJRMzkClCH59vkqf7LuSQXB
	 o8alUAztcfQNQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W6Dxt3cBSz4wbh;
	Sun, 23 Jun 2024 12:07:30 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.10-3 tag
Date: Sun, 23 Jun 2024 12:07:28 +1000
Message-ID: <87sex4csyn.fsf@mail.lhotse>
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
Cc: nathanl@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 6.10:

The following changes since commit c3f38fa61af77b49866b006939479069cd451173:

  Linux 6.10-rc2 (2024-06-02 15:44:56 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.10-3

for you to fetch changes up to a986fa57fd81a1430e00b3c6cf8a325d6f894a63:

  KVM: PPC: Book3S HV: Prevent UAF in kvm_spapr_tce_attach_iommu_group() (2024-06-16 10:20:11 +1000)

- ------------------------------------------------------------------
powerpc fixes for 6.10 #3

 - Prevent use-after-free in 64-bit KVM VFIO

 - Add generated Power8 crypto asm to .gitignore

Thanks to: Al Viro, Nathan Lynch.

- ------------------------------------------------------------------
Michael Ellerman (1):
      KVM: PPC: Book3S HV: Prevent UAF in kvm_spapr_tce_attach_iommu_group()

Nathan Lynch (1):
      powerpc/crypto: Add generated P8 asm to .gitignore


 arch/powerpc/crypto/.gitignore   |  2 ++
 arch/powerpc/kvm/book3s_64_vio.c | 18 +++++++++++++-----
 2 files changed, 15 insertions(+), 5 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmZ3gucACgkQUevqPMjh
pYC25xAAsSnTIzbZpHdg3Bdb0vqdgzQimS9TbXGm5Qnea6rZawXYcSEoLuUABWZY
ZkNDoezJoL9nks7JGO1lbTICUNFKleFSlBLye4WgRn7NQBlgFP2GYiH1hXJIlE0C
qNyqY8k9uhJQor6CYt4eygskVwjpdX6oeIcHcUNWQy7/p1jID48DFS7QHib0WWm+
wwuiPhdqBwlbJCQUO0zBmDgg8rAhPmeGSR1iHWJxk69CIcEOoXK8sxv1ZTKuE0YN
clOKeAPrlZ3dz2jDojcMUzckFxg9J/Wlozk+m4LVl4XVj5hV7TqBpT4BVJNoMk1i
qWV00bVg7sEWXQ9CGR71NKpdeE4pIeiN4EAEkW+nSmlJ0x9htadNychode+9cakb
E0U/fb/rB6T32UJsEUAFF2Dq8dG5wWXHPqn0rHh9v63tPvnteUisSFM9DN7Be9a4
UziItFANSmt3AK0uvBMgoYk8HM2USLb4WvigWdqtW9j6AGmO5NYPl1PgrLCDkFBA
Feevx5TAIs6GeGKrzbE5s9QHMAwtVhsN1g8lJgbCPZJfh9wcynIyrPI4K/Vu5J9A
tpNbRXGsfk/MCsNF6kgm+pAoseavXUwjsSNteFwq7eMSqZUgeG5a1hx/36b5mHdW
+YANpMmzS3Ae2HscZ6E8xTGxzfmmWmr6SczN0i0lBCR5cjUo7Cw=
=oWyE
-----END PGP SIGNATURE-----
