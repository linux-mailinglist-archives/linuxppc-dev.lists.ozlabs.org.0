Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B39013D4E18
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Jul 2021 16:21:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GXlbk50bNz30jZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 00:21:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XbHFzeNW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=XbHFzeNW; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GXlbH0bgbz2xtv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 00:20:58 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GXlb91sN0z9sRN;
 Mon, 26 Jul 2021 00:20:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1627222853;
 bh=/PIHXybKA6vJ63al5SGR6/W9BDRk0RJD3OrmXJ+7964=;
 h=From:To:Cc:Subject:Date:From;
 b=XbHFzeNWI7M52tk7Nb/6iy3e31x3yZDF7hgJ6BeyKMAm59i5OT/B+7eK89iOpGE78
 uVHJebHDTR3smUxmmm4JGmjJO4lBpX1lexgI7RA/ytvPkv+JlaYJ0vrick0SGDCE17
 A1MaJzWF9F0vf9W/X/E8Mca5/sncC1v/jAZE2KFuMQ3L+bzaGEL3XIF8CxtvHXnNNO
 thWptjD450lV4hSd6CvcSLWUhLSJS8nja2erZ7jvmX7fqFgERj0ogvEUrQRW1dKG4y
 b2uasQsteLaEmS4rYz7zAJscLl01WwVm25vjFSDi/b5QASY0VGBVvIj5XDDespbqn0
 2n4U+Sar1TPRw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.14-3 tag
Date: Mon, 26 Jul 2021 00:20:47 +1000
Message-ID: <87lf5u1nls.fsf@mpe.ellerman.id.au>
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
Cc: mikey@neuling.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.14:

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.14-3

for you to fetch changes up to d9c57d3ed52a92536f5fa59dc5ccdd58b4875076:

  KVM: PPC: Book3S HV Nested: Sanitise H_ENTER_NESTED TM state (2021-07-23 16:19:38 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.14 #3

 - Fix guest to host memory corruption in H_RTAS due to missing nargs check.

 - Fix guest triggerable host crashes due to bad handling of nested guest TM state.

 - Fix possible crashes due to incorrect reference counting in kvm_arch_vcpu_ioctl().

 - Two commits fixing some regressions in KVM transactional memory handling introduced by
   the recent rework of the KVM code.

Thanks to: Nicholas Piggin, Alexey Kardashevskiy, Michael Neuling.

- ------------------------------------------------------------------
Nicholas Piggin (5):
      KVM: PPC: Book3S HV P9: Fix guest TM support
      KVM: PPC: Book3S: Fix CONFIG_TRANSACTIONAL_MEM=n crash
      KVM: PPC: Fix kvm_arch_vcpu_ioctl vcpu_load leak
      KVM: PPC: Book3S: Fix H_RTAS rets buffer overflow
      KVM: PPC: Book3S HV Nested: Sanitise H_ENTER_NESTED TM state


 arch/powerpc/kvm/book3s_hv.c          |  2 ++
 arch/powerpc/kvm/book3s_hv_nested.c   | 20 ++++++++++++++++
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 25 +++++++++++++++++---
 arch/powerpc/kvm/book3s_rtas.c        | 25 +++++++++++++++++---
 arch/powerpc/kvm/powerpc.c            |  4 ++--
 5 files changed, 68 insertions(+), 8 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmD9bJEACgkQUevqPMjh
pYCFLBAAoD0a0fLmoh/LZBvvzD1LNDfoMcxtTF1mVPjv5zfLIDvj+M3+UsMHKBCV
ajDYuz0nd3TBPPBxMBXmQG4r5eYgilgkQ968uXIpQu2wkyAWIFu4hxKzUapLdddy
CN1TuSU9mWjviMsacjCU4zlEgmWpj7TtH+gBmhRKrQlAUMszmXlb5giRS+P6oAyN
OI+3ODlMkj+2CNwhQy7uaPrM13FnarUV0pliItAez4ka+1oWtlkKjXG8DG4k5TZf
7E/7qvxy7yOVXcULBeISJmLfBFttv3nUEAUjtxaA28d7YPZOUgfanSQUVhHl9nv5
KMJlOPAxEjZCF0j6TIEYgqC+DP0eBGDnvvfmGsxoTkYfMI5ykGYxsIEnTUBMZW4+
xi3OMx3cIlGhP0/3e1JFA9O4/zDzM7HxdONW/Wd9xDpLkjucNLZqvE5yP3ct/ATG
W4JmimhXIPFtnNrN0pgfyiU3l9Vodw/UD25AVYAQuamQ9kRtoPh0PtTarttVlw3o
JvZibyMwlds96n78PLThhpyC/SG030RO4oJAQBUpxt5PdAzyRTo4lCy10GQYN/kp
EG7rS7eizU38C379LJT7tkQzrfCgI1aJJ3PsoxggeT78AdybKogN3fHANHbFgOdn
k/SUo/6BF3lVO7C/SFdvPLuldltuYqjddDu24MHXHvtzhJ/pzQo=
=R0jy
-----END PGP SIGNATURE-----
