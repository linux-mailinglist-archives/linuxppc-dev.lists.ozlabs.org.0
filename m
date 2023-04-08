Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 004EA6DBB70
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 16:04:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtxnZ6Hjrz3fXw
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Apr 2023 00:04:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pO/pIvD2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pO/pIvD2;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ptxkt6DH2z3f3t
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Apr 2023 00:02:30 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B4B0460F57;
	Sat,  8 Apr 2023 14:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05325C433D2;
	Sat,  8 Apr 2023 14:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680962548;
	bh=NusFkGGWy7tIEkNWULQ6KBnE8wGN/lVCtwr0E9TzwQg=;
	h=From:To:Cc:Subject:Date:From;
	b=pO/pIvD2PjueXcAu2so/kjWoFvOlM5xiFp8zr3VFHPLpltcX9OBx6J2UF2ds5zytp
	 VGv1Suoz542kqv9dBdu5X0C3E782Bf/1AdmkxLG6HU7jO/9ouYJV7PxtVw+u7WRrU4
	 7D4fMbwS9Fm8i0wf1emUw+YSdBuv7nHxRRRiSAPWwu84BeQCX3p0C4oTMGsG3pB7gz
	 yZ28di557tAyV8SYe8e8pneb9ljOtQuyx8m2ePhmZnbKE2U87z4bDvlEXhBm9DZqYZ
	 goT6anqZyWlak2+LYC3D+jrOyZIDJBKl98PfA7SPmdSLl16LjOBCbLD2Nto+ZTOvHa
	 JqkET6L+RqSTw==
Received: by pali.im (Postfix)
	id 795FC7B7; Sat,  8 Apr 2023 16:02:25 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v5 00/13] powerpc/85xx: p2020: Create one unified machine description
Date: Sat,  8 Apr 2023 16:01:09 +0200
Message-Id: <20230408140122.25293-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Tested on CZ.NIC Turris 1.1 board which has Freescale P2020 processor.
Kernel during booting correctly detects P2020 and prints:
[    0.000000] Hardware name: Turris 1.1 e500v2 0x80211051 Freescale P2020

This patch series depends on another patch series "powerpc/fsl_uli1575: Cleanups":
https://lore.kernel.org/linuxppc-dev/20230408132151.8902-1-pali@kernel.org/t/#u
(it was split from this one in v5)

Changes in v5:
* Split fsl_uli1575 patches to separate patch series as this one started to be too big.
* Fix commit messages
* Reduce includes
* Rebase on top of powerpc/next (b0bbe5a2915201e3231e788d716d39dc54493b03)
* Test all patches again on CZ.NIC Turris 1.1 board with P2020 processor

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

Christophe Leroy (6):
  powerpc/85xx: Remove DBG() macro
  powerpc/85xx: mpc85xx_{ds/rdb} compact the call to mpic_alloc()
  powerpc/85xx: mpc85xx_{ds/rdb} replace BUG_ON() by WARN_ON()
  powerpc/85xx: mpc85xx_{ds/rdb} replace prink by pr_xxx macro
  powerpc/85xx: Remove #ifdefs CONFIG_PPC_I8259 in mpc85xx_ds
  powerpc/85xx: Remove #ifdef CONFIG_QUICC_ENGINE in mpc85xx_rdb

Pali Rohár (7):
  powerpc/85xx: p2020: Move all P2020 DS machine descriptions to p2020.c
  powerpc/85xx: p2020: Move all P2020 RDB machine descriptions to
    p2020.c
  powerpc/85xx: mpc85xx_ds: Move i8259 code into own file
  powerpc/85xx: p2020: Unify .setup_arch and .init_IRQ callbacks
  powerpc/85xx: p2020: Define just one machine description
  powerpc/85xx: p2020: Enable boards by new config option
    CONFIG_PPC_P2020
  powerpc: dts: turris1x.dts: Remove "fsl,P2020RDB-PC" compatible string

 arch/powerpc/boot/dts/turris1x.dts         |  2 +-
 arch/powerpc/platforms/85xx/Kconfig        | 22 +++++-
 arch/powerpc/platforms/85xx/Makefile       |  4 +-
 arch/powerpc/platforms/85xx/mpc85xx.h      |  6 ++
 arch/powerpc/platforms/85xx/mpc85xx_8259.c | 63 ++++++++++++++++
 arch/powerpc/platforms/85xx/mpc85xx_ds.c   | 87 +++-------------------
 arch/powerpc/platforms/85xx/mpc85xx_mds.c  |  7 --
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c  | 63 +++-------------
 arch/powerpc/platforms/85xx/p2020.c        | 81 ++++++++++++++++++++
 9 files changed, 191 insertions(+), 144 deletions(-)
 create mode 100644 arch/powerpc/platforms/85xx/mpc85xx_8259.c
 create mode 100644 arch/powerpc/platforms/85xx/p2020.c

-- 
2.20.1

