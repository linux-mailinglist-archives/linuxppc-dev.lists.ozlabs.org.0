Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD736DBB27
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 15:27:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtwyK5CDFz3fbG
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 23:27:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A+Vg5mDB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A+Vg5mDB;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ptwth4DTpz3f8R
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Apr 2023 23:24:12 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B9BE361068;
	Sat,  8 Apr 2023 13:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08AD5C4339C;
	Sat,  8 Apr 2023 13:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680960248;
	bh=EvyNCaXVQHGWXs9rYUpC1SM3FYnQ6ejFf2xaT5h8af0=;
	h=From:To:Cc:Subject:Date:From;
	b=A+Vg5mDBVXJtMmaN03L8GHLaaIyf9y45qHnPHGx+nAozIi3K6Nr91K76kUzAMwQiC
	 AVjwiuBywWyd5nQyu4pI7bWUtucvo+Ajnqf3HvXn2Y2oyASukG+ZIMZO3Ssor2GvwP
	 rUN1zDmTB2GJT4RbdUExVRX/KhDMU1zUIfisGXeo/oNfjzxggS1giHqTGittwuC4yK
	 3tQ6SC9of2j8a7cifzHRPqbLEkg2mRNNBrelCeKNg2XMqbyzFAzlyEECDlmRW+N76v
	 V5HEYUOVhfJcvGQKrhyxQa+I1T2KA7p1ZUU+h5mD94PVlKt5ZdLqXLtDQCBqlSDY0N
	 Wl31TeVKsp9kg==
Received: by pali.im (Postfix)
	id 117B77B7; Sat,  8 Apr 2023 15:24:05 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 0/8] powerpc/fsl_uli1575: Cleanups
Date: Sat,  8 Apr 2023 15:21:43 +0200
Message-Id: <20230408132151.8902-1-pali@kernel.org>
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

