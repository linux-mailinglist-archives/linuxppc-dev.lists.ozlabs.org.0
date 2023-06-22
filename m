Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0669A73A056
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 14:00:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MfNfXvsZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmzTc6TpDz3bTk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 22:00:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MfNfXvsZ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmzSh6Mq2z2y3H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 21:59:48 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QmzSd5NYGz4x3S;
	Thu, 22 Jun 2023 21:59:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1687435185;
	bh=yN+GmeoETJWiTPlx/fsRtqX7iQul/wMbk1v3RmO7Aa4=;
	h=From:To:Cc:Subject:Date:From;
	b=MfNfXvsZPdGTx3J/MFV3acPM+us+53zhikLlxiG29s7oSlNyIDDp3cV7AR13Bgt2c
	 KzYbgZcuNpWli+byZZsH+PqZtlojeWLlFqLdXYkC5Ra3FIszZ0AZSK49EIojET5DWr
	 aY02RkaMD7xqgvMGJTIxhNrQDqIadEq8O+Tnu5YczVpgS7yZhFZGa37yuNRodKJUjD
	 x39e2JlfV9ajvdodswW8f2Tf3N0DFSPeTOrR/OdHYc1UehVXteBydCiHmVhw/U1Jie
	 VkegI6JlRz3CilJd+S+sbCbmF93ix2GYaVagHBJXOJmBN6htUBxEHMbYnR4EwnqVuk
	 96wzXCRTuQL9A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.4-5 tag
Date: Thu, 22 Jun 2023 21:59:45 +1000
Message-ID: <87wmzvogge.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull one more powerpc fix for 6.4:

The following change since commit 719dfd5925e186e09a2a6f23016936ac436f3d78:

  powerpc/xmon: Use KSYM_NAME_LEN in array size (2023-05-30 16:46:56 +1000)

is available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.4-5

for you to fetch up to dfaed3e1fa7099de8de4e89cbe7eb9c1bca27dfe:

  powerpc/64s/radix: Fix exit lazy tlb mm switch with irqs enabled (2023-06-09 16:35:52 +1000)

- ------------------------------------------------------------------
powerpc fixes for 6.4 #5

 - Disable IRQs when switching mm in exit_lazy_flush_tlb() called from exit_mmap()

Thanks to: Nicholas Piggin, Sachin Sant.

- ------------------------------------------------------------------
Nicholas Piggin (1):
      powerpc/64s/radix: Fix exit lazy tlb mm switch with irqs enabled


 arch/powerpc/mm/book3s64/radix_tlb.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmSUN4YACgkQUevqPMjh
pYAmxBAAm9jgtDQaFG4LxUnSGvhPFFqN2x5/JVAu0oJyXlnr8nJifGLOL27chVtw
20QKMtOA5c1gnb+WLqhojrxDzets9oIdvEoej3VtYKtJHs17fPIvn/l0PDfp63WK
T3oy8qjyOKr1FSRhKXqeFd1kXqT6u4q+ZYlG/C0z82wSFw+tM2mBJa5u8MMzQTE5
Zl1SBL0LCI0KJPdyh+VpTJE68Q2SuDtd4qzNNqg1IPuzrQueXjZMNefpPLGOcuNW
PlvAKsLkZRcJduINI5DqvoGVt7Dmqy35qnqPq256Uq3OrRIzcSCyzxQLVHrhVeRe
a72ndemS+sOZY2ds/F7qtkhZ8jtMCj0CzRWYcmtsAKFmRczBslkdHuF2PVXYldDt
SPbg9MNTaIpp+XwkR2CF1b6QqtSru0kWy4ZDbqa4yaeAeGixFd2QS+3P2H1a3UEQ
M8i0+EhEE2aqvRKtOWP8lZ5k0HceB0MNaeOjYkWs0Fyo4++PiPXs9PytSh/KCYrj
xD1XLQApl3AydQfTC5trmCkZ+3z3WwrBxN/pi+USQinY490DWVC9PPyI4a7Kp74l
G/vaz5wotHSwDjlLa48V6oFH/qvi1tfoHzlhPKZPRiTI8pFWUkDX/92Q1yVhTbL3
cvLvZ0bc3XeHiEuJwMj07pohAT5JHYI1rVPby6QNHC8j9+ukzfQ=
=62oS
-----END PGP SIGNATURE-----
