Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2B84405A8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 01:06:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgyjG2BBNz3cGG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 10:06:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=sCy+c1GA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgyhZ5SW5z2y0C
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Oct 2021 10:05:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=sCy+c1GA; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HgyhW5mcyz4xYy;
 Sat, 30 Oct 2021 10:05:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1635548748;
 bh=H3cNjv6S5SciLLsrPMuk8KteiaFhIW5t5HuD1Q1taKM=;
 h=From:To:Cc:Subject:Date:From;
 b=sCy+c1GA60HRLWDpa6tUPXmA2gNBmLdlBXBilnDNlW1u6bNmiWBm7S5C+pscj4nqY
 pT5xYF/Q6aMmUUpuHUsBzeB5aKuYPUZsasCiwTP+r5aqWzFbsKJ+eJIpLiEWkrwYsz
 7N6u8aXibcaNkdNQRYndCdypYYo48CpNscDCtQK7QWnkX1DeIkOVI9OOMWcAFlwlPX
 jD1YFUf4Y3GPfdE+qcsJdx6MtEtkmxeBQrxhd7EOXf43kAnhr7STeSr0mZmWsufaRY
 wp3FX5W+GJtPyNgmugrYK6+dOnvzCw99l5by722iqpcmQ/Pd0lx99Iv/o5l7SQBxmi
 XV1iXL3vyDw/Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.15-6 tag
Date: Sat, 30 Oct 2021 10:05:46 +1100
Message-ID: <87pmrn8m9h.fsf@mpe.ellerman.id.au>
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull the final set of powerpc fixes for 5.15:

The following changes since commit 787252a10d9422f3058df9a4821f389e5326c440:

  powerpc/smp: do not decrement idle task preempt count in CPU offline (2021-10-20 21:38:01 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.15-6

for you to fetch changes up to d853adc7adf601d7d6823afe3ed396065a3e08d1:

  powerpc/pseries/iommu: Create huge DMA window if no MMIO32 is present (2021-10-25 11:41:15 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.15 #6

Three commits fixing some issues introduced with the recent IOMMU changes we merged.

Thanks to: Alexey Kardashevskiy

- ------------------------------------------------------------------
Alexey Kardashevskiy (3):
      powerpc/pseries/iommu: Use correct vfree for it_map
      powerpc/pseries/iommu: Check if the default window in use before removing it
      powerpc/pseries/iommu: Create huge DMA window if no MMIO32 is present


 arch/powerpc/platforms/pseries/iommu.c | 27 ++++++++++----------
 1 file changed, 14 insertions(+), 13 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmF8fhoACgkQUevqPMjh
pYAoaRAAps3wmmCXKdVbFvqKTFzcRFiWoFa0r2c6SykG7hvo6y1r3avF5PhXU5ry
OshoMcw+ZPFeH/Jc7VB/i7a9nQZSlf1k3Z9SaM+WVOgqFUhbE6OjC1r2VfRgo2lY
8QFmlLesNNx5dg+NXcunFD7Z7ydQopCR9QprlpWq2ZAxcIf9z7PP/SNlfxzCMo0d
0zYBfchkHAsg4C3/c6CjIr6lmbuPvlX3YoSyiOb9MBuAZB+fA6jNxqsW8GWbLYOA
XNCFQ+1vqv5cwrjlo1nKCLQjYi/9MnF7/SLPeIHA/MYQBF7iuAeOCDo2ldgzKtAO
uwSDrNiuGBya2QMU6ulnbHlropmg4NdtCp9i0jcztbDWRZl+dmJ88LqI5jE43JOF
pgaf25jTw80yCrwxBFxfGwAesQPAxWMAV5SmqilArNu8ctCThRVeyYxIeFXpoZBA
Gl54/3VX6lXGF0Myf1gHdu5Qqkj6W/PlOwmr/WcQLRthHhIaVnW/Y0VlWqQ1FA3e
SsPf5XfP5VsqTXSos+t8FR9kpFaxOOC8C3Qo6bTbGYdd/dNx37AqXAK9B7vlgm3I
ufLg5t6bx9DWLx8i+tNOqG7owY4PfwnBDgxLl9dsP41srWPdgP81/IsHnevSYis8
QrSBgPE3+elkr2V8tRR9Eco3bYwPQDBSdMqTksfnkMJ+t1jinz0=
=l0Ac
-----END PGP SIGNATURE-----
