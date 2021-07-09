Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0054C3C252E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jul 2021 15:46:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLvZP73C4z3bhr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jul 2021 23:46:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eFI2/HTM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=eFI2/HTM; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLvYv4Bv4z300S
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jul 2021 23:45:38 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GLvYj5HR6z9sRK;
 Fri,  9 Jul 2021 23:45:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1625838331;
 bh=ejUtdF/2hGYw4idlr/u6O8mO52fAWHn0jUF1i9LZSbA=;
 h=From:To:Cc:Subject:Date:From;
 b=eFI2/HTMFs+jPEzpmoSoRo+bNKMNb+0vs92A8mnaN1apYCqxYaiOymvhjdEQemap1
 sRP0UvBG5AFpBZ2Sr9BP5LSfvag+V60wuZizZNrzVXX++bccPO4DAvSO39ZXM6SC1q
 farwBifG9CPUbmUrmbuRPYlJWFNJ1lc2tCpdG7F+sZjx1nrq9aHDlAB+hKJ6i6qgOF
 0mz42Oet5TKm3DpssHcRbJ4N+ojcokGMtI3GXTP71RaGrC9F8Btw+m+llOISY3x/1u
 vXUc4WFJr+wfOsomU+0DaSnPAZTpeHyFSQsm49LukWHAsXMpsdsSL3uTNuKEI+Af/2
 IujoLiJyuibqQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.14-2 tag
Date: Fri, 09 Jul 2021 23:45:27 +1000
Message-ID: <87czrrob2g.fsf@mpe.ellerman.id.au>
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
Cc: daniel@iogearbox.net, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 ast@kernel.org, clg@kaod.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, valentin.schneider@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc fixes for 5.14:

The following changes since commit 019b3fd94ba73d3ac615f0537440b81f129821f6:

  Merge tag 'powerpc-5.14-1' of git://git.kernel.org/pub/scm/linux/kernel/g=
it/powerpc/linux (2021-07-02 12:54:34 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.14-2

for you to fetch changes up to 2c669ef6979c370f98d4b876e54f19613c81e075:

  powerpc/preempt: Don't touch the idle task's preempt_count during hotplug=
 (2021-07-08 23:38:10 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.14 #2

Fix crashes on 64-bit Book3E due to use of Book3S only mtmsrd instruction.

Fix "scheduling while atomic" warnings at boot due to preempt count underfl=
ow.

Two commits fixing our handling of BPF atomic instructions.

Fix error handling in xive when allocating an IPI.

Fix lockup on kernel exec fault on 603.

Thanks to: Bharata B Rao, C=C3=A9dric Le Goater, Christian Zigotzky, Christ=
ophe Leroy, Guenter
Roeck, Jiri Olsa, Naveen N. Rao, Nicholas Piggin, Valentin Schneider.

- ------------------------------------------------------------------
Christophe Leroy (1):
      powerpc/mm: Fix lockup on kernel exec fault

C=C3=A9dric Le Goater (1):
      powerpc/xive: Fix error handling when allocating an IPI

Naveen N. Rao (2):
      powerpc/bpf: Fix detecting BPF atomic instructions
      powerpc/bpf: Reject atomic ops in ppc32 JIT

Nicholas Piggin (1):
      powerpc/64e: Fix system call illegal mtmsrd instruction

Valentin Schneider (1):
      powerpc/preempt: Don't touch the idle task's preempt_count during hot=
plug


 arch/powerpc/kernel/interrupt_64.S   |  6 +++++-
 arch/powerpc/mm/fault.c              |  4 +---
 arch/powerpc/net/bpf_jit_comp32.c    | 14 +++++++++++---
 arch/powerpc/net/bpf_jit_comp64.c    |  4 ++--
 arch/powerpc/platforms/cell/smp.c    |  3 ---
 arch/powerpc/platforms/pseries/smp.c |  3 ---
 arch/powerpc/sysdev/xive/common.c    |  7 +++----
 7 files changed, 22 insertions(+), 19 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmDoUOkACgkQUevqPMjh
pYAiow/+OBasOP8AoO9oOxnxQ9UAoy7XMuE9xCXXUAWFZyzI7tspIPxYHF635cZ8
riWkafTUKUrD6evOtQxfhq91CVUG2yUfdeHBLFgb3Azy/iGLDxNCbVq6TbgJClsi
+qFHxjGg+DzY8rFKg3UhX8+hgvO+NGVkv54qQmtyYgSEK7nLU+UJtaVPdlmmen/8
LTTvIjvcZvEKFeJvKqojVDicAB7VUjE3w9Ct3VM4P5rc9kTVie1AdJMjb7PHGPp/
ub043o24RM7lXKv0gG5UM57SugfEbadfhk7OKj41oFeDhGS67kEofay7fNOtPuJP
8IXybH1gxQ84dhNPAX+mL+FuJ9LHq14RWW9bc3nc2PvuQEDJeg04PWYusH5BQb17
Iey3z1ixQ5b6sZkZLULGmMVLc1xQhJLuMDAythUpDKu7AReHagtEclxzeNNXiz1o
MWl/13oSCiYe8xQrvRv3eN8kcv+Nuju7r45PmEJgl0pAireZVW3gL2zS4WCjvfgX
CNwUk+Pd0IGwRE/i3FxtkDdK4Xrn2tcmO4j0H+EB65tYfwrmVHjt4S5vIpx2PCPh
K2YLESzoMHqak5M0agu+MFItzIyt2kCqAwS2c6z1RnJF4PpSOeFrT2YHRGqwxKji
5xvL0+yf5HfYGzfCMURiLmMkQYmZw62kqU6ozA8KHFKQWipMN3g=3D
=3D6KM9
-----END PGP SIGNATURE-----
