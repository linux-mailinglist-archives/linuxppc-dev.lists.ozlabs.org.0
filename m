Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 388A0239DEF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 05:56:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKkZx3p9NzDqT8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 13:56:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKkY4560qzDqL9
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 13:54:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=OiEpZvnd; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BKkY41qyTz9sTY;
 Mon,  3 Aug 2020 13:54:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1596426888;
 bh=LAiTgvb68VilL/OzR3a2adQxCG909Mp3mwzhOiMTDcY=;
 h=Date:From:To:Cc:Subject:From;
 b=OiEpZvndugJLeAiEbfKYhCyiTtwv1XgVHLnX7IVvU9s7sBgV5Y0JxIprfttOe3V6d
 FmVFHIHGn9ulsHLzo+9BnJaNSqlW+r8mVq21Z3ZZaZTQup6rh10mYR3KQsm62AhtHk
 2GSs5ikLioba16hwboO6mgWvr6Jci/9MghWIuKuaVFgocR4VoCOMpyEIu69zMTU4B3
 vtm8+0RNH2nvDERLhNpI+GREkPNEhElqk0I1WFTDyPz36d/uDtW1wW/fcYiL46Kow/
 3Zw4fP08r9DnOrHeeUn/3BJz8vJLtwDu6fcOF+XpJqP/Ydu/FejtIQIWN2rbSvLaKm
 B3tA26PgCqRiA==
Date: Mon, 3 Aug 2020 13:54:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: fix up PPC_FSL_BOOK3E build
Message-ID: <20200803135447.3833067d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qb1sajDCUCJyUavrLB+JKk6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux PowerPC List <linuxppc-dev@lists.ozlabs.org>, Willy Tarreau <w@1wt.eu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/qb1sajDCUCJyUavrLB+JKk6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Commit

  1c9df907da83 ("random: fix circular include dependency on arm64 after add=
ition of percpu.h")

exposed a curcular include dependency:

asm/mmu.h includes asm/percpu.h, which includes asm/paca.h, which
includes asm/mmu.h

So fix it by extracting the small part of asm/mmu.h that needs
asm/percu.h into a new file and including that where necessary.

Cc: Willy Tarreau <w@1wt.eu>
Cc: <stable@kernel.org>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---

I have done powerpc test builds of allmodconfig, ppc64e_defconfig and
corenet64_smp_defconfig.

 arch/powerpc/include/asm/mmu.h              |  5 -----
 arch/powerpc/include/asm/mmu_fsl_e.h        | 10 ++++++++++
 arch/powerpc/kernel/smp.c                   |  1 +
 arch/powerpc/mm/mem.c                       |  1 +
 arch/powerpc/mm/nohash/book3e_hugetlbpage.c |  1 +
 arch/powerpc/mm/nohash/tlb.c                |  1 +
 6 files changed, 14 insertions(+), 5 deletions(-)
 create mode 100644 arch/powerpc/include/asm/mmu_fsl_e.h

diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index f4ac25d4df05..fa602a4cf303 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -134,11 +134,6 @@
=20
 typedef pte_t *pgtable_t;
=20
-#ifdef CONFIG_PPC_FSL_BOOK3E
-#include <asm/percpu.h>
-DECLARE_PER_CPU(int, next_tlbcam_idx);
-#endif
-
 enum {
 	MMU_FTRS_POSSIBLE =3D
 #ifdef CONFIG_PPC_BOOK3S
diff --git a/arch/powerpc/include/asm/mmu_fsl_e.h b/arch/powerpc/include/as=
m/mmu_fsl_e.h
new file mode 100644
index 000000000000..c74a81556ce5
--- /dev/null
+++ b/arch/powerpc/include/asm/mmu_fsl_e.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_POWERPC_MMU_FSL_E_H_
+#define _ASM_POWERPC_MMU_FSL_E_H_
+
+#ifdef CONFIG_PPC_FSL_BOOK3E
+#include <asm/percpu.h>
+DECLARE_PER_CPU(int, next_tlbcam_idx);
+#endif
+
+#endif
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 73199470c265..142b3e7882bf 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -35,6 +35,7 @@
 #include <linux/stackprotector.h>
 #include <linux/pgtable.h>
=20
+#include <asm/mmu_fsl_e.h>
 #include <asm/ptrace.h>
 #include <linux/atomic.h>
 #include <asm/irq.h>
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index c2c11eb8dcfc..7371061b2126 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -37,6 +37,7 @@
 #include <asm/pgalloc.h>
 #include <asm/prom.h>
 #include <asm/io.h>
+#include <asm/mmu_fsl_e.h>
 #include <asm/mmu_context.h>
 #include <asm/mmu.h>
 #include <asm/smp.h>
diff --git a/arch/powerpc/mm/nohash/book3e_hugetlbpage.c b/arch/powerpc/mm/=
nohash/book3e_hugetlbpage.c
index 8b88be91b622..cacda4ee5da5 100644
--- a/arch/powerpc/mm/nohash/book3e_hugetlbpage.c
+++ b/arch/powerpc/mm/nohash/book3e_hugetlbpage.c
@@ -9,6 +9,7 @@
 #include <linux/mm.h>
 #include <linux/hugetlb.h>
=20
+#include <asm/mmu_fsl_e.h>
 #include <asm/mmu.h>
=20
 #ifdef CONFIG_PPC64
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index 696f568253a0..8b3a68ce7fde 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -171,6 +171,7 @@ int extlb_level_exc;
 #endif /* CONFIG_PPC64 */
=20
 #ifdef CONFIG_PPC_FSL_BOOK3E
+#include <asm/mmu_fsl_e.h>
 /* next_tlbcam_idx is used to round-robin tlbcam entry assignment */
 DEFINE_PER_CPU(int, next_tlbcam_idx);
 EXPORT_PER_CPU_SYMBOL(next_tlbcam_idx);
--=20
2.28.0

--=20
Cheers,
Stephen Rothwell

--Sig_/qb1sajDCUCJyUavrLB+JKk6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8niocACgkQAVBC80lX
0Gw7PQf+PXeaZ9zHpHiOaOpIBQWk/etkRsF3X1B61OtlbDRM2nAYgTTXkSg+v5Bf
//9zXf5Cw9bQvFnAmjA7zcZIoA0IiggjcnIYaeY22DFAUlQNoT63LzBSwa4rr4OY
P/z9avoNUIHe0FenL+rXKF1DiYlwnaGe/ggZ4RQrhnvH4YSbodTJK0XNZObY4M1P
rb/++vCinfdZt1GuMqp3DtK7JfBxeuu8n2CWk8RgcoffpYOIf/FOiaqKKX18tpFT
8BneFR5vw1OAyDMqXkFxKbtsI7VD81pos1VPjIKfwoG1s56uTzLpq239CsFA2rvs
oiTJ9KyndrMDt/Wn4OBDu3Ov8vMvyg==
=bjR7
-----END PGP SIGNATURE-----

--Sig_/qb1sajDCUCJyUavrLB+JKk6--
