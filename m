Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C48417B406A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Sep 2023 15:12:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EPBsmtVe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RySLb4bT5z3cjp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Sep 2023 23:12:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EPBsmtVe;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RySKh4Gd8z3cGY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Sep 2023 23:11:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1696079511;
	bh=JlLHDIrwoEqeeY+xa3WB3jmigoRfwNeCnr/KLMh86hs=;
	h=From:To:Cc:Subject:Date:From;
	b=EPBsmtVebPJlKFZm2m2N91Nf1h8Ig8NB/xLT8wpqeECV85d5r1IM/jU/lKalC23Ai
	 wgw/hFRUedYyggejR6xcsnqWBHoA7WOIqzlfBTnvjURaXQPAdcOAO4jj+vgrCcfkHl
	 Ri+fzq2p5pm2tPz/k+1QODdEGCU/uu4VVKZErnOb+TQpg4bsQuTbYeRPIc4+sEf2yA
	 5wnyRK5AxCCc9HZ7KJSJmOhYAugzzpIg1QQbnXNbE5Zp/+0ZmtzDbvSt/aDZ9Z6cUb
	 Kp9q2P+c8pMQE5mT44PNNH8blrSFEFa907ZIPcfxCtGYFJFak+XTaXhgIJwaNSQ5Ny
	 4uJ+9hgnVXtKg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RySKf4K8Gz4x5J;
	Sat, 30 Sep 2023 23:11:50 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.6-3 tag
Date: Sat, 30 Sep 2023 23:11:46 +1000
Message-ID: <87bkdjolf1.fsf@mail.lhotse>
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

Please pull some more powerpc fixes for 6.6:

The following changes since commit c3f4309693758b13fbb34b3741c2e2801ad28769:

  powerpc/dexcr: Move HASHCHK trap handler (2023-09-18 12:23:48 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.6-3

for you to fetch changes up to 58b33e78a31782ffe25d404d5eba9a45fe636e27:

  selftests/powerpc: Fix emit_tests to work with run_kselftest.sh (2023-09-22 20:29:48 +1000)

- ------------------------------------------------------------------
powerpc fixes for 6.6 #3

 - Fix arch_stack_walk_reliable(), used by live patching.

 - Fix powerpc selftests to work with run_kselftest.sh

Thanks to: Joe Lawrence, Petr Mladek.

- ------------------------------------------------------------------
Michael Ellerman (2):
      powerpc/stacktrace: Fix arch_stack_walk_reliable()
      selftests/powerpc: Fix emit_tests to work with run_kselftest.sh


 arch/powerpc/kernel/stacktrace.c             | 27 ++++----------------
 tools/testing/selftests/powerpc/Makefile     |  7 +++--
 tools/testing/selftests/powerpc/pmu/Makefile | 11 ++++----
 3 files changed, 14 insertions(+), 31 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmUYHX8ACgkQUevqPMjh
pYBvDBAAoCipzzNry+rTrf2bc9dOyCCyRsUhTsujXye+rGuxKMEiTalds8+t6F68
8LOJ1X2sFeGk25R5VSqjxbFqxRAyfcTMttnOJs5QTBomZAa4EWyQT/+JRAnj1sS3
XspFNjFpgENQ3qyDtRBCXBGZ55EGv45yXTrXmOS7mvHvrMEQyU2H4XZPyvuBf3kz
5/uz0rb+aZsYvq1Hq5PGX+3dWSa4VYeB9FYOwZeGTe9ycpwvw1nvYJ7sBTS+MBkh
oISlPrq0cUGFP/4cr0DBlekyyIrdgs6wHArX7uTflR0P6M59AQeArwzqDWwHMzY0
DdbpH4104YKkv9bE2nfywgvGveKkBIAiCd8aEG0yH/cc8emrAabbvgWem+TrN1Yf
ELehUuEjL442T3m5QpDJUxgrFeF9INFnuztYupgZuQIhEQxqmg1tXXcsLqAlgnL2
uU++CS7SfYKiLtGNxmxGtQB+zYA8qQZ8z+9mzDm7qNmjfm9Zfye1WKYIOJRpJP1N
wt/MYJVbOCI5ZXqIAdOHGZDFu7KkcSpGiRt7634epGgY5JHGQnmXIJq0g0Tir4uE
lrHCJOwrStUfbaKKEB0K9tvbS+Q/l3N3LBYVJFkyYU9lCzjT83OPE9BS5mY2LxZg
86PmrwTP/9DPWh5i/u6Fj+CAIt3SpD57Jmdtxnn7gGVPd2nGEbQ=
=uC7L
-----END PGP SIGNATURE-----
