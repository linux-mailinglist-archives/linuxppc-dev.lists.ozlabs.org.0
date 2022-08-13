Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D0B591D25
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Aug 2022 01:28:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M4xYV2GtTz3bvZ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Aug 2022 09:28:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nreNZxcW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M4xXs2ZlCz2xGR
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Aug 2022 09:27:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nreNZxcW;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M4xXr5zhKz4x7X;
	Sun, 14 Aug 2022 09:27:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1660433261;
	bh=3bMlnbRQz38t2Byc7ysO1exjnYukUjyd4Vns0CgnFpo=;
	h=From:To:Cc:Subject:Date:From;
	b=nreNZxcW1pAzZmg9kAm6s+7+A3xMa6q+RTayh70SgYI8/Abjn96KSfP7DH0xOyHuU
	 U0G7CVaYSr3ODkxQqcbcd9r63N9hS2eGhOgtBQo/q/EZ5Fz+3E77ux4hICUNCvPHKm
	 1dXx6Drc9wFdC6tbF9VgKsRDQq81e4HJgvcw7r46TLlAOqeLzbO3YTWsPCqPqqsgBi
	 /Q0IWsu9khhbcH2uMwoXbnSUl4Z7x011SwzYep8uTt3FiueMbnaa/5+dvKF7y+a2wQ
	 qUr9g9Xuq7OWz0vTBuFpLGtGZoUNaONfvkM5PeRc5eQnfswWVrQpcYxJEnsgWneYhZ
	 m58KufsLdMVqQ==
From: mpe@ellerman.id.au
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.0-2 tag
Date: Sun, 14 Aug 2022 09:27:37 +1000
Message-ID: <87czd3d8ra.fsf@mpe.ellerman.id.au>
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
Cc: ndesaulniers@google.com, linux-kernel@vger.kernel.org, naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some powerpc fixes for 6.0:

The following changes since commit cae4199f9319f42534ee2e2e4aadf183b9bb7f73:

  Merge tag 'powerpc-6.0-1' of git://git.kernel.org/pub/scm/linux/kernel/gi=
t/powerpc/linux (2022-08-06 16:38:17 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-6.0-2

for you to fetch changes up to 83ee9f23763a432a4077bf20624ee35de87bce99:

  powerpc/kexec: Fix build failure from uninitialised variable (2022-08-10 =
15:55:20 +1000)

- ------------------------------------------------------------------
powerpc fixes for 6.0 #2

 - Ensure we never emit lwarx with EH=3D1 on 32-bit, because some 32-bit CP=
Us trap on it
   rather than ignoring it as they should.

 - Fix ftrace when building with clang, which was broken by some refactorin=
g.

 - A couple of other minor fixes.

Thanks to: Christophe Leroy, Naveen N. Rao, Nick Desaulniers, Ondrej Mosnac=
ek, Pali Roh=C3=A1r,
Russell Currey Segher Boessenkool.

- ------------------------------------------------------------------
Christophe Leroy (4):
      powerpc: Fix eh field when calling lwarx on PPC32
      powerpc: Don't hide eh field of lwarx behind a macro
      powerpc: Make eh value more explicit when using lwarx
      powerpc/ppc-opcode: Fix PPC_RAW_TW()

Naveen N. Rao (1):
      powerpc64/ftrace: Fix ftrace for clang builds

Russell Currey (1):
      powerpc/kexec: Fix build failure from uninitialised variable


 arch/powerpc/include/asm/atomic.h          |  5 +++--
 arch/powerpc/include/asm/bitops.h          |  4 ++--
 arch/powerpc/include/asm/ppc-opcode.h      | 13 ++-----------
 arch/powerpc/include/asm/simple_spinlock.h | 15 +++++++++------
 arch/powerpc/kernel/trace/ftrace.c         |  8 ++++----
 arch/powerpc/kexec/file_load_64.c          | 10 +++++-----
 6 files changed, 25 insertions(+), 30 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmL4MxcACgkQUevqPMjh
pYAbQg//Y2KdKueTxPGMVN2/jCSDU6QEcCfZzmGWuCSQgdC1ufsf4hc8Maao0wOa
nX2FzVF5F23MJM0oOtgdmC0p4QADSsR6OP3E0sST2snXBQf+FQPtIp4kjzCYP1zi
x9paoBV1cBS54DI8bpdzp5FRLqmxxQ4PKM7iru6VYOC9EOZuwvg71W/+s90racdW
J9Igz6yleFp2YsJYUWZNTNk7qJ9J5dhTRNrEK0MyOAmrcwXhQAq4QU6WqV3upUMa
i4w8yqIi4e+dkRk1YjuZUVyqi7HgUE27gzH2yZT2w1SNMjodydv5P2ghgRP75s7y
V4l/iuqfeWtw8tfEHzl+0rw3twhe1Y54ay4uFSfUOI2m9u6dJjjnXDJUai/vyytX
CT4cRow8HP5eIULuj5jFrgPjkH1sBRUBdXVwZrDTOrynKXiEC5nbNTE5LTjbvYzj
snzMRM8jEZpG/t1wA5tmGgMson37260qo/aqX9wIIEc0LhhJZdvMr7RD6pnX1D6I
88mI/zxmitJU9bENQyenAOZn7Y6ybXBv8tEvHBr/xq0jKL0O7MKsdim4fUUZa7p/
yAUwnMb88fbg10M5xWybbDJ2Ej4x+KD4pbWVN80qvApG6z85hbeRZVqx8JX0qS78
TZMIWs4qPNwH/P8SM0Ez+/5kXxzkN6S0UXs99ViCxtYEIskWv4g=3D
=3DnY/A
-----END PGP SIGNATURE-----
