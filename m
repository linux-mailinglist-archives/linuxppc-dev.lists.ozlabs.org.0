Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A87D66DBC03
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 17:51:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pv08v3Vgrz3fh7
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Apr 2023 01:51:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bdOfYfYY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bdOfYfYY;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pv06D1VqBz3cdM
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Apr 2023 01:49:24 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7A2536104A;
	Sat,  8 Apr 2023 15:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEAC4C433A0;
	Sat,  8 Apr 2023 15:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680968960;
	bh=mEemWPoO6YjRAd2cq8q5BNfFB0ZK/JR3s3zXfgPYvmc=;
	h=From:To:Cc:Subject:Date:From;
	b=bdOfYfYY9INn70SRx+vhmgRBHeo5fYmf9eOKJ5o3HCW+5e1XlDs984v5PVo9hMC0F
	 htfdzfdsaHOM+TIJn10wlezs6deLA8L3C9S4K1yHQMBYDxAvAlyMVL3oE3Z2WkBCEg
	 1mopiw/FZYtlN2U1eoYuSVyEGLz6/shDKT4bEoxkKbpxSknpdG/4QAwZNADaYLfk+S
	 rvcsiUf4IN/8+JqsDfxYKuDkWajviG6/Ok0AvP/C/Rw60DuWKSg90H8NHyiflqb0ci
	 HpBkDjvReHIte8WKRpx7kQrFZBVyh9EjERaG3z/dX31E6uISNRSHgNg1OSq+E+NvFF
	 k6AK0TD225lqw==
Received: by pali.im (Postfix)
	id C07607B7; Sat,  8 Apr 2023 17:49:17 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 0/8] powerpc/fsl_uli1575: Cleanups
Date: Sat,  8 Apr 2023 17:48:06 +0200
Message-Id: <20230408154814.10400-1-pali@kernel.org>
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

This patch series is prerequisity for another patch series:
"powerpc/85xx: p2020: Create one unified machine description"
https://lore.kernel.org/linuxppc-dev/20230408140122.25293-1-pali@kernel.org/t/#u

Changes in v2:
* Fixed compile error in the first patch when PCI is disabled

Christophe Leroy (1):
  powerpc/fsl_uli1575: Misc cleanup

Pali Rohár (7):
  powerpc/85xx: mpc85xx_ds: Simplify mpc85xx_exclude_device() function
  powerpc/fsl_uli1575: Simplify uli_exclude_device() usage
  powerpc/85xx: mpc85xx_ds: Move uli_init() code into its own driver
    file
  powerpc/mpc85xx: mpc85xx_rdb: Do not automatically select FSL_ULI1575
  powerpc/fsl_uli1575: Allow to disable FSL_ULI1575 support
  powerpc/mpc86xx: mpc86xx_hpcn: Call uli_init() instead of explicit
    ppc_md assignment
  powerpc/fsl_uli1575: Mark uli_exclude_device() as static

 arch/powerpc/include/asm/ppc-pci.h         |  8 +++++
 arch/powerpc/platforms/85xx/Kconfig        |  1 -
 arch/powerpc/platforms/85xx/mpc85xx_ds.c   | 39 ++--------------------
 arch/powerpc/platforms/86xx/mpc86xx_hpcn.c | 20 ++---------
 arch/powerpc/platforms/Kconfig             |  2 +-
 arch/powerpc/platforms/fsl_uli1575.c       | 29 +++++++++++++---
 6 files changed, 38 insertions(+), 61 deletions(-)

-- 
2.20.1

