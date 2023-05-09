Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2976FBE16
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 06:00:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFkwD21Vzz3ffj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 14:00:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u87NvmzV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u87NvmzV;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFkqD3VTsz3fKR
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 13:56:24 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CE55164408;
	Tue,  9 May 2023 03:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 218E2C433AA;
	Tue,  9 May 2023 03:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683604582;
	bh=7cXJeGa9L60sslKWQNgFOhVcQcwL/gbLCz39lyzO+II=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u87NvmzV0A3g/UXZvz5+iijNu5IeKf3yYmQQ+7gQjgOKgEb6yDVYY2BGzEajy/F+P
	 yZ3LR/W3yNtk685Zfnnq54AeX4BQC1jYoKbcpAdFcX1cL7D74nOBE1XmhDwud7Vd7V
	 3YtQuQYWbfvm6queGCSp+Zf2vnzvFqOw3uSav5GTae20swrP+HMOZh10antSHrR+my
	 koctGxFj+gzGEhxJmj0qbdJPo1OFG8dxwGVH82rm1ozUjxKvXG3xAxcCsFCu6DQQY2
	 U9nL+fRjhrY+FrzNTV+sDXtui7TS3+t3ueYZBpJgiYPHTrq+h0IFtY6XATydkPSv2T
	 QQSK1BJ/o7ewA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 2/3] powerpc/fsl_uli1575: Allow to disable FSL_ULI1575 support
Date: Mon,  8 May 2023 23:56:10 -0400
Message-Id: <20230509035616.60683-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230509035616.60683-1-sashal@kernel.org>
References: <20230509035616.60683-1-sashal@kernel.org>
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
index 18792a5b003a0..d239667ea72f6 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -269,7 +269,9 @@ config CPM2
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

