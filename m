Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1946DBE2B
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Apr 2023 02:11:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PvCF05cx8z3ffC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Apr 2023 10:11:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gRc3btHe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gRc3btHe;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PvCC86XWnz3fSj
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Apr 2023 10:09:24 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A5AA960A5B;
	Sun,  9 Apr 2023 00:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6098C433D2;
	Sun,  9 Apr 2023 00:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680998961;
	bh=uPss87mCCwB35tkOQ3t+NOXUCwBMcXsp1Fbuq83NneU=;
	h=From:To:Cc:Subject:Date:From;
	b=gRc3btHeaYrh7+RF6rTXHzPPszUasLm0AXTLSiSdEdGJ0mBo7SkEFzMv3mC70pkjY
	 IqPxUoaK8t3MQy3r/9hLJ4iuVgBihQNtMg4W6QLl1dPmY8vGWhRHxlr9mzCPzqyDmj
	 Z9c4ft3zNTr8GGUiCtYkNj9RktJ5EPIV5mxA83b1pnkuGlG+KNRAnvo+2OXm5Oe+6Z
	 iAbPq5vfwqmcDullquNv7nuwyjNC3TYwkG91tO3oc+fr44KrciTiBYmghtx30vgruq
	 4xz5KWtsxPjgMrOtRD9SjghFzJHfeo9VhTSUQfcWnKhsVm5q5bk1Ngc12hYdHUJxQq
	 kBvKThuGh7Xtg==
Received: by pali.im (Postfix)
	id D4D42C31; Sun,  9 Apr 2023 02:09:17 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v3 0/8] powerpc/fsl_uli1575: Cleanups
Date: Sun,  9 Apr 2023 02:08:04 +0200
Message-Id: <20230409000812.18904-1-pali@kernel.org>
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

This patch series contains cleanups for fsl_uli1575 driver.

This patch series is prerequisite for another patch series:
"powerpc/85xx: p2020: Create one unified machine description"
https://lore.kernel.org/linuxppc-dev/20230408140122.25293-1-pali@kernel.org/t/#u

Changes in v3:
* Fixed compile error in the sixth patch when driver was explicitly
  enabled on unsupported platform

Changes in v2:
* Fixed compile error in the first patch when PCI is disabled

Christophe Leroy (1):
  powerpc/fsl_uli1575: Misc cleanup

Pali Rohár (7):
  powerpc/85xx: mpc85xx_ds: Simplify mpc85xx_exclude_device() function
  powerpc/fsl_uli1575: Simplify uli_exclude_device() usage
  powerpc/85xx: mpc85xx_ds: Move uli_init() code into its own driver
    file
  powerpc/85xx: mpc85xx_rdb: Do not automatically select FSL_ULI1575
  powerpc/fsl_uli1575: Allow to disable FSL_ULI1575 support
  powerpc/86xx: mpc86xx_hpcn: Call uli_init() instead of explicit
    ppc_md assignment
  powerpc/fsl_uli1575: Mark uli_exclude_device() as static

 arch/powerpc/include/asm/ppc-pci.h         |  8 +++++
 arch/powerpc/platforms/85xx/Kconfig        |  1 -
 arch/powerpc/platforms/85xx/mpc85xx_ds.c   | 39 ++--------------------
 arch/powerpc/platforms/86xx/mpc86xx_hpcn.c | 20 ++---------
 arch/powerpc/platforms/Kconfig             |  4 ++-
 arch/powerpc/platforms/fsl_uli1575.c       | 29 +++++++++++++---
 6 files changed, 40 insertions(+), 61 deletions(-)

-- 
2.20.1

