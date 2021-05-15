Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 798C9381BBD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 May 2021 01:36:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FjMGS3xlgz3bV0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 May 2021 09:36:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oIgBD3Bi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=oIgBD3Bi; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FjMG20ZQZz2y6C
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 09:35:36 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FjMFy6pSJz9sW5;
 Sun, 16 May 2021 09:35:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1621121735;
 bh=cB4uQsyeluAvOPHPhJHcqQT2zJO+FjnOdWi3nB1+Kqs=;
 h=From:To:Cc:Subject:Date:From;
 b=oIgBD3BiESfDwLI70prK2WkcPMJXlbHTQHVtr6lO0ypwwz1eTh1Xs8Xy98UXsFLAm
 v9/VaWJXVof8K1iFA9lHOIeDYnOhn3u7o2qdumpu3JaEP7SQq9yaa78si4c6wjArsK
 /9tmwMTNeuhiELupk4d8/zZO8SHU1SVaP+PZXA1LxktZa98EA9PgVhlD3MeGT3t2do
 ZK5rHbRRbaS/SD4YOjCN08zQyA28go74czb0JHw/eCIME8tA35DEbp5YPrjewFI0ta
 41Lwb9GIjMWSPlX5NuKFDFp4KaVvRvyPU26PUH/U2asWRvpQHtuhbMgTirms3l0XtY
 9IwZFQqOD8rew==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.13-3 tag
Date: Sun, 16 May 2021 09:35:30 +1000
Message-ID: <871ra7lge5.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.13:

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.13-3

for you to fetch changes up to c6ac667b07996929835b512de0e9a988977e6abc:

  powerpc/64e/interrupt: Fix nvgprs being clobbered (2021-05-14 17:28:54 +1=
000)

- ------------------------------------------------------------------
powerpc fixes for 5.13 #3

 - Fix a regression in the conversion of the 64-bit BookE interrupt entry t=
o C.

 - Fix KVM hosts running with the hash MMU since the recent KVM gfn changes.

 - Fix a deadlock in our paravirt spinlocks when hcall tracing is enabled.

 - Several fixes for oopses in our runtime code patching for security mitig=
ations.

 - A couple of minor fixes for the recent conversion of 32-bit interrupt en=
try/exit to C.

 - Fix __get_user() causing spurious crashes in sigreturn due to a bad inli=
ne asm
   constraint, spotted with GCC 11.

 - A fix for the way we track IRQ masking state vs NMI interrupts when usin=
g the new scv
   system call entry path.

 - A couple more minor fixes.

Thanks to: C=C3=A9dric Le Goater, Christian Zigotzky, Christophe Leroy, Nav=
een N. Rao, Nicholas
Piggin Paul Menzel, Sean Christopherson.

- ------------------------------------------------------------------
Christophe Leroy (5):
      powerpc/interrupts: Fix kuep_unlock() call
      powerpc/syscall: Calling kuap_save_and_lock() is wrong
      powerpc/uaccess: Fix __get_user() with CONFIG_CC_HAS_ASM_GOTO_OUTPUT
      powerpc/signal: Fix possible build failure with unsafe_copy_fpr_{to/f=
rom}_user
      powerpc/legacy_serial: Fix UBSAN: array-index-out-of-bounds

Michael Ellerman (5):
      KVM: PPC: Book3S HV: Fix kvm_unmap_gfn_range_hv() for Hash MMU
      powerpc/64s: Fix crashes when toggling stf barrier
      powerpc/64s: Fix crashes when toggling entry flush barrier
      powerpc/64s: Fix entry flush patching w/strict RWX & hash
      powerpc/64s: Fix stf mitigation patching w/strict RWX & hash

Nicholas Piggin (6):
      powerpc/pseries: Fix hcall tracing recursion in pv queued spinlocks
      powerpc/pseries: Don't trace hcall tracing wrapper
      powerpc/pseries: use notrace hcall variant for H_CEDE idle
      powerpc/pseries: warn if recursing into the hcall tracing code
      powerpc/64s: Make NMI record implicitly soft-masked code as irqs disa=
bled
      powerpc/64e/interrupt: Fix nvgprs being clobbered


 arch/powerpc/include/asm/hvcall.h         |   3 +
 arch/powerpc/include/asm/interrupt.h      |   9 +-
 arch/powerpc/include/asm/paravirt.h       |  22 +++-
 arch/powerpc/include/asm/plpar_wrappers.h |   6 +-
 arch/powerpc/include/asm/uaccess.h        |   2 +-
 arch/powerpc/kernel/exceptions-64e.S      |  38 ++++---
 arch/powerpc/kernel/interrupt.c           |   4 +-
 arch/powerpc/kernel/legacy_serial.c       |   7 +-
 arch/powerpc/kernel/signal.h              |   4 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c       |   2 +-
 arch/powerpc/lib/feature-fixups.c         | 114 +++++++++++++++-----
 arch/powerpc/platforms/pseries/hvCall.S   |  10 ++
 arch/powerpc/platforms/pseries/lpar.c     |  29 +++--
 13 files changed, 175 insertions(+), 75 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmCgWe8ACgkQUevqPMjh
pYDZqg//RzF68ywTKG51T3JmOjVfvkptpEWZOQ52LCwpMQYvMQc+CSnBjEFoNyuS
bIA0xlg0/1xBXNMtPVgNVk7WgDa/yvahVlX3rIuWt4Uhqv6u6Z1fw7aYaGIDH3b2
akRvSvVWYyv87LlMEtxDOHncH1u8Q6E3YW4JM6eaQwjD2XqqeiTYKXUaZATTmepc
GruEdNK5239LkmxMnyFvxCDDyHb8YyCZORHp/l4U+l005/dkM7ZyzHSA1LMekVSB
LrW5q/KjdQW3EC2WDLijSCcshWujOf2MGvaZkmB/TvPtqxsOf3tLZAeEfaObbUrX
6mqe93CtUk1CRNECkqCxF/sO5wq2SJmKx1XTfVR2CvDDg1ZmisesiRHtYk6Dl2Bw
84+5IKwthgTauib3YKyoqXUpfIL8j8qg3M/9WVI6LG+ujPoSD0whPHdqTymqFfwA
ONDT4cSDvBMAtw63cVnWEDgqdrAwTFAr0i+7loWkKeKJv9mxxfGX7MgiglQobDys
xGAOjLnetsD4+JWJMqqrm0ilAKDb+m4stvU7bo/gpWcs6kvxDt2JCOEbJCoqujzQ
B0Tl9H6cyoxhfEnZ7AKzQrGdFg+zUNQ0w5AWslriE5OZcq6vKlgYyVQFeX7t+6vb
Me/YIEBbhPefVZdDD4KZp49PDw+5DgqVJgvMpsrqaRoorZEHni0=3D
=3DVnK3
-----END PGP SIGNATURE-----
