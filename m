Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 307922C65EC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 13:49:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjDwF5KgpzDqJN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 23:49:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjDr54MwZzDrdS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 23:45:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Jkw2E4IH; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CjDr33CVGz9sSf;
 Fri, 27 Nov 2020 23:45:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606481139;
 bh=yy/S0HBzf8IrbUsvJnHhpeKnuLhOtblAzE6jc5wg5K8=;
 h=From:To:Cc:Subject:Date:From;
 b=Jkw2E4IHCORKMaAoixPD3xZOOapz3T2LWZaOocTQvxYRvuWpQfxKb3dESE1UxIBX3
 duViSb0/O/CsX9EcBFVQZ5XaEExDzTb8ik8A4iyWedNBo5hT2/Pta8evU5OVNKvaM4
 hz28M4C4fOh0hP7SGGIaNctdBBDWNWCAVpyB1BCQAE1zesIbkisrvry2pA7zSrfMba
 tw7IKNKuS8IKjp1gmfoaKvH9I3r0m8ppFTkBKB9iyIgiE79XOGT1gN3ClNxicQN47R
 z02n6aasZBCKpCVDIe+Vwd1xM5+MQvoBQQW1LNjtQznWhmTgB/+nx2Q0KGfo28dJr8
 80rdmltVa8naw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.10-4 tag
Date: Fri, 27 Nov 2020 23:45:35 +1100
Message-ID: <877dq7x91s.fsf@mpe.ellerman.id.au>
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
Cc: sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 oss@buserror.net, clg@kaod.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.10.

Note this includes a merge of the powerpc-cve-2020-4788 tag, which you alre=
ady
have, so that I could fix a build break it introduced. That merge should be=
 a
nop from your POV.

cheers


The following changes since commit da631f7fd623b6c180c8d93a93040d1e0d61291f:

  Linux 5.10-rc2 (2020-11-01 14:43:51 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.10-4

for you to fetch changes up to b6b79dd53082db11070b4368d85dd6699ff0b063:

  powerpc/64s: Fix allnoconfig build since uaccess flush (2020-11-23 21:16:=
42 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.10 #4

A regression fix for a boot failure on some 32-bit machines.

A fix for host crashes in the KVM system reset handling.

A fix for a possible oops in the KVM XIVE interrupt handling on Power9.

A fix for host crashes triggerable via the KVM emulated MMIO handling when
running HPT guests.

A couple of small build fixes.

Thanks to:
  Andreas Schwab, C=C3=A9dric Le Goater, Christophe Leroy, Erhard Furtner, =
Greg Kurz,
  Greg Kurz, N=C3=A9meth M=C3=A1rton, Nicholas Piggin, Nick Desaulniers, Se=
rge Belyshev,
  Stephen Rothwell.

- ------------------------------------------------------------------
Christophe Leroy (1):
      powerpc/32s: Use relocation offset when setting early hash table

C=C3=A9dric Le Goater (1):
      KVM: PPC: Book3S HV: XIVE: Fix possible oops when accessing ESB page

Michael Ellerman (2):
      powerpc: Drop -me200 addition to build flags
      Merge tag 'powerpc-cve-2020-4788' into fixes

Nicholas Piggin (2):
      powerpc/64s: Fix KVM system reset handling when CONFIG_PPC_PSERIES=3Dy
      powerpc/64s/exception: KVM Fix for host DSI being taken in HPT guest =
MMU context

Stephen Rothwell (1):
      powerpc/64s: Fix allnoconfig build since uaccess flush


 arch/powerpc/Makefile                          |  1 -
 arch/powerpc/include/asm/book3s/64/kup-radix.h |  2 ++
 arch/powerpc/kernel/exceptions-64s.S           | 13 +++++++------
 arch/powerpc/kernel/head_book3s_32.S           |  3 ++-
 arch/powerpc/kvm/book3s_xive_native.c          |  7 +++++++
 5 files changed, 18 insertions(+), 8 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl/A8B4ACgkQUevqPMjh
pYCUdQ/9HN2ikGl+dT5h3CoAVZoGsyl6/KQm6t+tVjHHxDWcuH/wOmmpvqRET5th
7uGOJrKEPaWDo3KwmM/Q2Srf74Qtb23n4D62Hi4dTBGoVix1930BIrz/VaQq416T
WwvrZIwbOSOvklbERq/ta4YeXN9fHquAX0dgxQEWPgLugoXCJhKndvAoy+l+0ZLa
F3uOFnqt1IKaQA7wM7I+BbgOlP6rF+VhNPMZmUEvNDsVa6HUhv6/R46c7Un4jKyQ
O8hTn/yz/Sc7kB06LoF9PiHlwtZVuDvwIi+6h5W1LcLCWGIBkEhJkNZ1K6Qwiu7H
YIFvCTLovliLSOYIRjRS+s1a0hSjRUdOcrb/VukzRNP/JFpbzKid8gHkVdG8yEN8
HIXT6W9/YOACr+rviuYJAuA+hk4ll8SHdgbFnr7QGLJKdy9SCUHSWrkgoBHXKig5
eV/bRE0H5WauyqPcct1xP781UKf1zmcNiouvDXmRBoAJalRSVFB5HxpN+GKPQxwu
la/lv/eAujuydJYxlgCHu8pNbn/DhPsIPpbNnXLNOYxiWR8LXESkt4I7dxPJQxvr
pkWuR+T1FAXzF6tor+iK8anpmAmXKrWFQNSC2cCnqBdGtORdARztjHhVWgOCQLiR
H0mN8abC+b7h6LVsRsDieZt5u0+o+G69FvNLxaPQymvnDaQtbQI=3D
=3D7BPy
-----END PGP SIGNATURE-----
