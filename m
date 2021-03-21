Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEA73430F4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Mar 2021 06:16:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F35Sy2NzTz30CL
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Mar 2021 16:16:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hLs9Zd46;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=hLs9Zd46; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F35SY03yWz2xdQ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Mar 2021 16:15:55 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F35SK57g1z9sSC;
 Sun, 21 Mar 2021 16:15:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1616303747;
 bh=NuaqmDeUEq7U+V+o2OVKAvJoermIek4/PIHuFD5u7/M=;
 h=From:To:Cc:Subject:Date:From;
 b=hLs9Zd46xThlMGvFCxClRd+w5xtFqAbGKjF3KtZzNaSgW2omzEP0bTWxPqDkhP9/p
 SoDcsRAhc0MaMuLz72Qhrz9rR6x09ZAT1XHjhZLNaavGzgJlTtbGsbirtoWuf6Bbkf
 fn8gafnk5qQ9JHuCSdpPeUp20koQJGcPzj2O1dXBeSaU9LWH1RxT1mzLWdBaxkAZeJ
 IWmpwQQyDH1gG7dbpk4wu3qz561WQ7PrZKW+aIK7FpdaLMRY3wznnF2ROnIRHBRzGb
 sixgdsyQgqw1/Dd5t+y2oTqIo3E7p6deBaZAmspEIo4Xrum9vPnkAsZoC/4ETZO+zk
 m4pbh66yxo5Dw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.12-4 tag
Date: Sun, 21 Mar 2021 16:15:35 +1100
Message-ID: <875z1lhytk.fsf@mpe.ellerman.id.au>
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
Cc: tyreld@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.12:

The following changes since commit 0b736881c8f1a6cd912f7a9162b9e097b28c1c30:

  powerpc/traps: unrecoverable_exception() is not an interrupt handler (2021-03-12 11:02:12 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.12-4

for you to fetch changes up to cc7a0bb058b85ea03db87169c60c7cfdd5d34678:

  PCI: rpadlpar: Fix potential drc_name corruption in store functions (2021-03-17 13:48:07 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.12 #4

Fix a possible stack corruption and subsequent DLPAR failure in the rpadlpar_io
PCI hotplug driver.

Two build fixes for uncommon configurations.

Thanks to Christophe Leroy, Tyrel Datwyler.

- ------------------------------------------------------------------
Christophe Leroy (2):
      powerpc/vdso32: Add missing _restgpr_31_x to fix build failure
      powerpc: Force inlining of cpu_has_feature() to avoid build failure

Tyrel Datwyler (1):
      PCI: rpadlpar: Fix potential drc_name corruption in store functions


 arch/powerpc/include/asm/cpu_has_feature.h |  4 ++--
 arch/powerpc/kernel/vdso32/gettimeofday.S  | 11 +++++++++++
 drivers/pci/hotplug/rpadlpar_sysfs.c       | 14 ++++++--------
 3 files changed, 19 insertions(+), 10 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmBW1cQACgkQUevqPMjh
pYAhog/+KVrIL4frKx1m7bmM+FJ83heS20+F7i5yQWRovR2FdgYwwbIrtxNUKzRU
sNShwQbt9H6GVEGc12kusH5M+t6wGrHrYQ47kdkD6qhDTPfQzKXsoi5eWbgMkQnx
Hd3njqjzfGFEicmfp8l+1WmoWeYpL2MLR7E/KTtS/MYMq5Gsz2lZSMEsmXlAY5Cs
5lT8dBHdH0AX9krRJk9BzKrRqB0qjrK60/sg9oLJQ4sixeWaa+dSORnJq26jYV+n
MPyaNCWF3EUrs7BNyxfZOeFwAZ0FzRSBZrgIt6MNPreT/FaL6lo2McHHyQ9Ls5Qb
yPUmioNKLhXdtcU6AZ0+QOlQvyiGJ7xb3UTAbFFq8TifYHVS0v9srBkgfcvFHycc
yjDtdeTk18WB6NSDC8zVSc+Ut5q7WZa6RLKubiCPgd5DqDkpAKcYcTQSZZUgTb6Q
IyT7bwCBqW6Z5bNTsHhSZ+Ub06L6RLTQ1IfD4GXtqe16F1eeFlMOPCP2YzGUB6s9
IB7GQilliVtRZaFCGwYyVdZCHftHVdK5k7DV+3aImzPRYOKpL4YWwrBnDoqkccYs
Mhbw2YtO7oXSZ2yXGrsu/WF56QCDf6PFO5r28dvNFEi6qZWbfLEQQLZmv/0efFtC
Je1VKXKXCfuLD2VH02F8URZpzbg90dC8YRsTUpgSLCHgiGjEOcE=
=zfoH
-----END PGP SIGNATURE-----
