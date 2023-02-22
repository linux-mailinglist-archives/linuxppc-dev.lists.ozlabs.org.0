Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EB469F6E1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 15:44:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMJnV1Vvhz3cL0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 01:43:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMJmv2MGQz3bg9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 01:43:26 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4PMJmm2xx9z9sTJ;
	Wed, 22 Feb 2023 15:43:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GphnDMSDW3Tm; Wed, 22 Feb 2023 15:43:20 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4PMJmm1mVPz9sTB;
	Wed, 22 Feb 2023 15:43:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2A7518B77A;
	Wed, 22 Feb 2023 15:43:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id CY_htPdRPpsO; Wed, 22 Feb 2023 15:43:20 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0A42D8B763;
	Wed, 22 Feb 2023 15:43:20 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 31MEhF2H1187084
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 15:43:15 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 31MEhE0K1187079;
	Wed, 22 Feb 2023 15:43:14 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v4 00/17] powerpc/85xx: p2020: Create one unified machine description
Date: Wed, 22 Feb 2023 15:42:47 +0100
Message-Id: <cover.1677076552.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677076979; l=3285; s=20211009; h=from:subject:message-id; bh=XK4An0UB53ZfJXVUMfXIQDYbefMWv9of+TL/WgVvMAw=; b=wLZTkK4nsp5e3PiiYmF+azbYcVPE/YE5NciwONKRasgKQO5ZC9jQ054NMxL01E8THTI0j0F3MV4z 2U3MfsP6Bnt5k9gGazHVb8xlV/2SquR7EJ95TTuaoIrTXXK3ldge
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
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

This patch series unifies all P2020 boards and machine descriptions into
one generic unified P2020 machine description. With this generic machine
description, kernel can boot on any P2020-based board with correct DTS
file.

Tested on CZ.NIC Turris 1.1 board with has Freescale P2020 processor.
Kernel during booting correctly detects P2020 and prints:
[    0.000000] Using Freescale P2020 machine description

Changes in v4:
* Added several preparatory cleanup patchs
* Minimised churn by not duplicating helpers at the first place
* Split main patch in two
* Dropped patchs 1 and 2
* Untested beyond basic build test

Changes in v3:
* Use 'if (IS_ENABLED(CONFIG_PPC_I8259))' instead of '#ifdef CONFIG_PPC_I8259'
* Simplify p2020_probe()
* Patches generated by -M and -C git options

Link to v2: https://lore.kernel.org/linuxppc-dev/20221224211425.14983-1-pali@kernel.org/

Changes in v2:
* Added patch "p2020: Move i8259 code into own function" (separated from the next one)
* Renamed CONFIG_P2020 to CONFIG_PPC_P2020
* Fixed descriptions

Link to v1: https://lore.kernel.org/linuxppc-dev/20220819191557.28116-1-pali@kernel.org/

Christophe Leroy (9):
  powerpc/fsl_uli1575: Misc cleanup
  powerpc/85xx: Rename setup_arch and pic_init on p1023
  powerpc/85xx: Remove DBG() macro
  powerpc/85xx: Remove #ifdefs CONFIG_PCI in mpc85xx_ds
  powerpc/85xx: mpc85xx_{ds/rdb} compact the call to mpic_alloc()
  powerpc/85xx: mpc85xx_{ds/rdb} replace BUG_ON() by WARN_ON()
  powerpc/85xx: mpc85xx_{ds/rdb} replace prink by pr_xxx macro
  powerpc/85xx: Remove #ifdefs CONFIG_PPC_I8259 in mpc85xx_ds
  powerpc/85xx: Remove #ifdef CONFIG_QUICC_ENGINE in mpc85xx_rdb

Pali Rohár (8):
  powerpc/85xx: p2020: Move all P2020 DS machine descriptions to p2020.c
  powerpc/85xx: p2020: Move all P2020 RDB machine descriptions to
    p2020.c
  powerpc/85xx: p2020: Move i8259 code into own function
  powerpc/85xx: mpc85xx_ds: Move PCI code into own file
  powerpc/85xx: p2020: Unify .setup_arch and .init_IRQ callbacks
  powerpc/85xx: p2020: Define just one machine description
  powerpc/85xx: p2020: Enable boards by new config option
    CONFIG_PPC_P2020
  powerpc: dts: turris1x.dts: Remove "fsl,P2020RDB-PC" compatible string

 arch/powerpc/boot/dts/turris1x.dts         |   2 +-
 arch/powerpc/include/asm/ppc-pci.h         |   2 +
 arch/powerpc/platforms/85xx/Kconfig        |  22 +++-
 arch/powerpc/platforms/85xx/Makefile       |   5 +-
 arch/powerpc/platforms/85xx/mpc85xx.h      |  12 ++
 arch/powerpc/platforms/85xx/mpc85xx_8259.c |  78 ++++++++++++
 arch/powerpc/platforms/85xx/mpc85xx_ds.c   | 133 ++-------------------
 arch/powerpc/platforms/85xx/mpc85xx_mds.c  |   7 --
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c  |  79 ++----------
 arch/powerpc/platforms/85xx/mpc85xx_uli.c  |  64 ++++++++++
 arch/powerpc/platforms/85xx/p1023_rdb.c    |   8 +-
 arch/powerpc/platforms/85xx/p2020.c        |  95 +++++++++++++++
 arch/powerpc/platforms/fsl_uli1575.c       |   6 +-
 13 files changed, 301 insertions(+), 212 deletions(-)
 create mode 100644 arch/powerpc/platforms/85xx/mpc85xx_8259.c
 create mode 100644 arch/powerpc/platforms/85xx/mpc85xx_uli.c
 create mode 100644 arch/powerpc/platforms/85xx/p2020.c

-- 
2.39.1

