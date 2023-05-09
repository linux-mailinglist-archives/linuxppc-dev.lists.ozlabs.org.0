Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A526FBE00
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 05:58:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFksH0w5qz3fPb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 13:58:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M6aP7TwO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M6aP7TwO;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFkpP6Z1Qz3fMX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 13:55:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 147ED6314E;
	Tue,  9 May 2023 03:55:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B69C433D2;
	Tue,  9 May 2023 03:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683604539;
	bh=BWaUpw5uHM6kKYPpC35BJ+4DJ7Geniu2LmeOM5AGg/I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M6aP7TwOR+5L0656BzklrpkPqeZlBubRKIkaeBcbXIzJ4a9XIGd7bEi8Km6eTz/MM
	 xup8tvx5C0mOribYflO5elUNiHzVEGnzLGcO5JpTDo4tlEYaW0A3PkjUXaenaK2yBd
	 Ek1YRkNSiWc9i+vW9WmcOTVeVQIkMPdnZEQBQtwYgZcc85NwVFfhCg5RxMMg+jwaoV
	 4Pnd2vbtSoafsOhmDY2J82vSc9290QP7kQV03YshjDpUjWggcRtF2BLvnCdjZqvp4H
	 mDtyu6GLaAFLhrc0hLaDAfaV58ezptcOAhrUEiRHrh4CWG8IZt00hgiGqNoFzW20wU
	 6iBIAdoRlJTww==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 4/5] powerpc/fsl_uli1575: Allow to disable FSL_ULI1575 support
Date: Mon,  8 May 2023 23:55:28 -0400
Message-Id: <20230509035533.60269-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230509035533.60269-1-sashal@kernel.org>
References: <20230509035533.60269-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, arnd@arndb.de, linus.walleij@linaro.org, linuxppc-dev@lists.ozlabs.org, andriy.shevchenko@linux.intel.com, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Pali Rohár <pali@kernel.org>

[ Upstream commit 22fdf79171e8509db54599fd2c05ef0022ee83f5 ]

ULI1575 PCIe south bridge exists only on some Freescale boards. Allow to
disable CONFIG_FSL_ULI1575 symbol when it is not explicitly selected and
only implied. This is achieved by marking symbol as visible by providing
short description. Also adds dependency for this symbol to prevent enabling
it on platforms on which driver does not compile.

Signed-off-by: Pali Rohár <pali@kernel.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://msgid.link/20230409000812.18904-7-pali@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index d41dad227de84..608ac0290e3aa 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -261,7 +261,9 @@ config CPM2
 	  on it (826x, 827x, 8560).
 
 config FSL_ULI1575
-	bool
+	bool "ULI1575 PCIe south bridge support"
+	depends on FSL_SOC_BOOKE || PPC_86xx
+	select FSL_PCI
 	select GENERIC_ISA_DMA
 	help
 	  Supports for the ULI1575 PCIe south bridge that exists on some
-- 
2.39.2

