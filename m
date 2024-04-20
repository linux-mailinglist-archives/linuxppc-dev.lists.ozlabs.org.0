Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B548AB934
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Apr 2024 05:25:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jb3n1Qnc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VLxj85wfZz3chF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Apr 2024 13:25:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jb3n1Qnc;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VLxhQ4BwRz3cGK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Apr 2024 13:24:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1713583478;
	bh=QSEFJcDkqnsnAMU/Ge1i+z1kKqo7SuN9MsF+v00cPIs=;
	h=From:To:Cc:Subject:Date:From;
	b=jb3n1QncF9hFFcPfMacNi+/OzL6WOoN3nW+lwLJbbm1K9IzVbaDb0Fij33SVwwmo+
	 LrhaJFdWyU+kEfn5D5P6aRCqikn7u5RegbHm8ZvDyUwLUkgt8+YT7iFODZydZz+3w5
	 UNVImiihAdqeIv4M94gHs/awrDzzLquk1C80bAy/+RHzzZ3+ru/7eOHwpQR7mLJbR8
	 QYA3T7dP982ZnUEWqZkIucJ8eyntMD+29wfUOpF4JKkj7Requ2vyHRxJ7uLjkJwAPW
	 dy5+A5WTVrULsZU4SFeeEilzaBZi9d31IGlznOPc86K2/q+RA3xC8P2tY4nKJAiZR/
	 qZkiC9Y36y8TQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VLxhP5P1kz4wcF;
	Sat, 20 Apr 2024 13:24:37 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.9-3 tag
Date: Sat, 20 Apr 2024 13:24:34 +1000
Message-ID: <87jzksaf7x.fsf@mail.lhotse>
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
Cc: nathanl@linux.ibm.com, herbert@gondor.apana.org.au, sbhat@linux.ibm.com, linux-kernel@vger.kernel.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 6.9:

The following changes since commit 39cd87c4eb2b893354f3b850f916353f2658ae6f:

  Linux 6.9-rc2 (2024-03-31 14:32:39 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-6.9-3

for you to fetch changes up to 210cfef579260ed6c3b700e7baeae51a5e183f43:

  selftests/powerpc/papr-vpd: Fix missing variable initialization (2024-04-=
12 14:40:07 +1000)

- ------------------------------------------------------------------
powerpc fixes for 6.9 #3

 - Fix wireguard loading failure on pre-Power10 due to Power10 crypto routi=
nes.

 - Fix papr-vpd selftest failure due to missing variable initialization.

 - Avoid unnecessary get/put in spapr_tce_platform_iommu_attach_dev().

Thanks to: Geetika Moolchandani, Jason Gunthorpe, Michal Such=C3=A1nek, Nat=
han Lynch,
Shivaprasad G Bhat.

- ------------------------------------------------------------------
Michael Ellerman (1):
      powerpc/crypto/chacha-p10: Fix failure on non Power10

Nathan Lynch (1):
      selftests/powerpc/papr-vpd: Fix missing variable initialization

Shivaprasad G Bhat (1):
      powerpc/iommu: Refactor spapr_tce_platform_iommu_attach_dev()


 arch/powerpc/crypto/chacha-p10-glue.c               | 8 +++++++-
 arch/powerpc/kernel/iommu.c                         | 7 +++----
 tools/testing/selftests/powerpc/papr_vpd/papr_vpd.c | 2 +-
 3 files changed, 11 insertions(+), 6 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmYjNHwACgkQUevqPMjh
pYCbuA//VsCCZotHFjCuEMX4hKFE+FS7doJ6HAaj1lysJLVQsXW94pEufcy53hXX
y4DQ06Y2vV/zJTrbYk/3vukeMDcc7ZSE9IKZlnSvZP1GizGF2dQE/AjsqNfJ5iV4
1YcE22fmjoSIL2pbD337r1BHqEwGvcd47Rm0SET6yIxQamTKHLAa7Q9OIindDMaq
Qu/g6LFoa856idDkXRY96xNWRodGzNyhZ3+16F4jsE2pbGiYNbjqyua3ke8leWgI
DInYs9KholNeg285Qbjq6VaXcMjJG6po8N/MDJDxdysVhF+9GTXlyKSN9oURDUtf
IDWpbrF3n7WE3iUllucKWNXBQbfX5yoFlZ7PnOj+Tjm1RcyBZDBhoq05DNcosFY0
Mgbg7hKluxUP7ijSMOOKKYasMrNqJofo+f3S78L3sBDjIW2w/j6+ZP6EQ515t7he
/oac+WfFr6m0rEtQtZuf0TMPWv60odfjkLuGFomcd5qpldXesMfR62rT+RSN3M7m
7kJj4duYpKJJZEdOdj9PzVMqQd/dd5cpeO2b1vJef7G6lHXRaB0tTaDMnvZBNtlL
7etRE5g1ErvOFGnoAzeXcU3GFU2ZO49cpKMjqwubivufNXDwZ7VKJfPjIsb4cfm0
lsquI0A5FhkIDr1G/0wL4VyCisKYCAuYj9NCSf9F9iM+92w+fKo=3D
=3DgaHh
-----END PGP SIGNATURE-----
