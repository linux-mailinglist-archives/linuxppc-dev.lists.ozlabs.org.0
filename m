Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E61F3FA5AD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 14:46:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gxbtv3Qdlz30Qv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 22:46:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NwZyAE2X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=NwZyAE2X; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GxbtB6j63z2xl7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 22:46:09 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gxbt71cB7z9sxS;
 Sat, 28 Aug 2021 22:46:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1630154767;
 bh=Ib/F1AUkPbtr95ajbp8rWSPbdz/DrlSAGa1a1EJ/h+M=;
 h=From:To:Cc:Subject:Date:From;
 b=NwZyAE2XEmm2A8vpYoFnO19QxEBgrN7+eIlX6PY1yNuI0s7Gj62NydjsLEZAKwLCL
 sNnw/aStJ99SaSI4osnSeRJrQqZsgL9mez1hZjGxnWnn2fnrmrGXgsQqkyYaVlTp7Q
 IeHRFrSyk7SfltJx5jWLV4GY4oaLE/lbUaAWaUx5PXiMxhswoQ8vhfT8aoxmJX1XB6
 P52OcDlww+hIQMbf13zP54S0CufzPKkWbR5ttnRmO6RVr0x+HcFCDosizXuwKqP3xR
 eWfpZjA6e6KV37jcfKgM7KDJyAS7hTD/Zk9Yc+lZOvx/DFvP2LK3IMdBSfrUBa+ejB
 Sy1/hVuEuSdZQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.14-7 tag
Date: Sat, 28 Aug 2021 22:46:02 +1000
Message-ID: <874kb9g2k5.fsf@mpe.ellerman.id.au>
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
Cc: lukas.bulwahn@gmail.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull two more powerpc fixes for 5.14:

The following changes since commit 9f7853d7609d59172eecfc5e7ccf503bc1b690bd:

  powerpc/mm: Fix set_memory_*() against concurrent accesses (2021-08-19 09:41:54 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.14-7

for you to fetch changes up to 787c70f2f9990b5a197320152d2fc32cd8a6ad1a:

  powerpc/64s: Fix scv implicit soft-mask table for relocated kernels (2021-08-20 22:35:18 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.14 #7

 - Fix scv implicit soft-mask table for relocated (eg. kdump) kernels.
 - Re-enable ARCH_ENABLE_SPLIT_PMD_PTLOCK, which was disabled due to a typo.

Thanks to: Lukas Bulwahn, Nicholas Piggin, Daniel Axtens.

- ------------------------------------------------------------------
Lukas Bulwahn (1):
      powerpc: Re-enable ARCH_ENABLE_SPLIT_PMD_PTLOCK

Nicholas Piggin (1):
      powerpc/64s: Fix scv implicit soft-mask table for relocated kernels


 arch/powerpc/kernel/exceptions-64s.S   | 7 ++++---
 arch/powerpc/platforms/Kconfig.cputype | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmEqL8QACgkQUevqPMjh
pYDvjQ//dYPmb8eTLrWTRXUy6vLnem+CuJv6gyLEG+7s6T8qZMSA2uvKr4zXAvgF
2QOAoVYWDth6blxjfHc5zqpdERhZHhOq0o2ofuJYGz1J/HAymvIohGFmiIwvOu5n
rPI8NMmsw61W35jJS7dgRr86b3rBwZSzRpDL14g+zQRRzuCqnBdOCA3Ixxn5JQ/F
D1AhyWL61IpVdg0Tz6FRU8s+VKYHh4Yr/CsozkFRMgqZZ2k3zs7aTcluyN8JhEta
BoqejJStrgRt2KOJPr3HXk5fHaoz/9AJn3lSauhnEPFR/Li2ChjkDZPd9KQysHI/
f56HfO/jRx3lY/qhHQ3HeGVJ8rsQrzEILj7KqL0KHwfQoqAhP3E2sut6oqZBFWii
HzfNl0vDrVkjBW7WDV/Y1hlGYaeiGt6DgXwh6wifek6JhMSABwyrd+Uoi9efG7sg
fOUl11VHvBHHQoT+h526urQrdSvgNn+M2iwjElK3LC+tDStNVZTxEiS/KtvpK1vC
I7f7CuwS+z3y4kPs2lwr1t0qQOnmOsvJP82+IDb7Tq4LJRgajyFlGdUEtMrpxZvP
whpFxWrxlQabX6QEr3CGYTGjbiYaGUCfWLkwhwpcftp7QcadjYko7u6nxIyOjI2G
8XG3+CMcPkNB4fSo4Ijt5upaTjhjl4JUGEenLHbyzdcixfj9Z9w=
=yPpX
-----END PGP SIGNATURE-----
