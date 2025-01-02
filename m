Return-Path: <linuxppc-dev+bounces-4586-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0779FFE72
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 19:34:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPFgT2sjvz30VK;
	Fri,  3 Jan 2025 05:32:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735842756;
	cv=none; b=PH6bX5pgS7SJ2nx09f3yoNt3qdcwRczTpvLz+P6qj+sOFuTf2BdqwoVkEcDJf1G7ox3UadVk47HQfhugqvSHZiv2CgdNYPMQp1xIlCrIjy0DZhYXMUVXnwLqfpjfxxwvc6Tlh5TK97N+n6bywaGTH2H6CoiqdBye+wkGmrB+swqBw/ukjVSTSunbFw3aSh8Y5wkOG4PY+a8aOhLng1U4nXW/q7ywV46Xy98/ZP89YSDPxwjhIh5V5Z+fR2ws+cYT8a/SPuWr56CyzsLuwY9cFAEeayoBLaiG7MT3ErLzos4l9+uTgEZuoQBm/mwiIwgIJQBNdOq/Xr39KJWDb6hrXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735842756; c=relaxed/relaxed;
	bh=mv2xzK30g0LLz+KGclWVo+nW2vRFS1e7vRTTR4ggUx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cctspSMpa7tY4QEz+zm3cCqmtcc271+87cS1jygfVL0Qa/jlRiTRCGT0gRj+vhzGG9j8IztVC8QdbfqhxlQ9LbsqPleVjoSxGe5Z87rYZrD3F+jvZ5i4Qe+kfWb3dvXpPEinMdcpnSKY1a3WktY4GPcqIZKcEpXRjtNOz0mfeGSYi/inhGLGKlbbKh/2eNpUlSwnsMbZ4KPPrjJfgRZR6+swCjz9OYOf5KIe370empnqZE6ECto+jIuIwzFR7/9gRdwWcsgaF7z2DnSrOaQwXplyH1NEC8EDfTfcF2tXGXGOESPp3SnJsk176mYy1DB2O885sPrAWl1Yc6lEM7mvJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u9oZ6yRk; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u9oZ6yRk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPFgM3J0Wz30ML
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 05:32:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 49CDC5C6091;
	Thu,  2 Jan 2025 18:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3AB3C4AF66;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=+ozPR72TGelRi1qjo+eMYUhMsBvV12qPvfKdkXm1MbU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=u9oZ6yRkiN/HoOP1oRjfV/PSXDNkJZOcBs8A0kgjV9KSGN31tFE1Uds3sBLbkyTZe
	 qPlUgM73YMLb/icycEhaw6QiW7aFPEq8onNYjGAe+MwqcNb3lZyXdixSr/7ZNTdNPU
	 I764mdN4RHHnzZXoVK7bCD1H53uu1rTHr0tI3TAErz0D1fVINxYFzhcgdj/C9p6kaO
	 bRDE2ynFHTk8mMb4+ybNTBUNLB3PGFXFwLGrTuPy3VNpKKgYecqUugi7r68CtuIrO2
	 Sr0g1bpryw16t28IzNKE/UQluJSra1khl0qpa/OQWBXCAFxK37O3B4wkxbucT1IAeL
	 FXUtT0FnCQO6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4CDE77199;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:58 +0100
Subject: [PATCH 17/19] powerpc: Regenerate mpc83xx_defconfig
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250102-mpc83xx-v1-17-86f78ba2a7af@posteo.net>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
In-Reply-To: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=2583;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=1rOiPx/IBiS+KFXwbtSf4liVE3lSlERERzYFgaFB5Pk=;
 b=EHF5ZT2XyhVoAK1/ZHS7HRAw+6QSTlpL1V5+eKAfHyxBFSrN3ZC3ueMcFRSU32p1zNVTF1N8r
 njn7Caw18RADtKpP5TBRZDaoRoT2+3hjH6qkxhOkbbUL4dNPcX8Cdu7
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-2.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,UPPERCASE_50_75 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

Run `make mpc83xx_defconfig` and `make savedefconfig`. This reduces the
size of subsequent patches that enable/disable functionality.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/configs/mpc83xx_defconfig | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/configs/mpc83xx_defconfig b/arch/powerpc/configs/mpc83xx_defconfig
index 4af5e3e8c5a7f44f5e97b8fb4cdf691686f8967b..525a4f6ae1ff7b51e365668b430fa46ce4938f19 100644
--- a/arch/powerpc/configs/mpc83xx_defconfig
+++ b/arch/powerpc/configs/mpc83xx_defconfig
@@ -2,10 +2,6 @@ CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_PARTITION_ADVANCED=y
 # CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_PPC_83xx=y
@@ -17,7 +13,9 @@ CONFIG_MPC837x_RDB=y
 CONFIG_ASP834x=y
 CONFIG_QE_GPIO=y
 CONFIG_MATH_EMULATION=y
-CONFIG_PCI=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_PARTITION_ADVANCED=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -31,6 +29,7 @@ CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 CONFIG_INET_ESP=y
 # CONFIG_IPV6 is not set
+CONFIG_PCI=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FW_LOADER is not set
@@ -38,7 +37,6 @@ CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
 CONFIG_MTD_CFI_AMDSTD=y
-CONFIG_MTD_PHYSMAP_OF=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_FSL_ELBC=y
 CONFIG_BLK_DEV_LOOP=y
@@ -46,6 +44,7 @@ CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=32768
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_SG=y
+# CONFIG_BLK_DEV_BSG is not set
 CONFIG_ATA=y
 CONFIG_SATA_FSL=y
 CONFIG_SATA_SIL=y
@@ -56,7 +55,6 @@ CONFIG_DAVICOM_PHY=y
 CONFIG_ICPLUS_PHY=y
 CONFIG_MARVELL_PHY=y
 CONFIG_VITESSE_PHY=y
-CONFIG_INPUT_FF_MEMLESS=m
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
@@ -68,14 +66,12 @@ CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MPC=y
 CONFIG_WATCHDOG=y
 CONFIG_HID_A4TECH=y
-CONFIG_HID_APPLE=y
 CONFIG_HID_BELKIN=y
 CONFIG_HID_CHERRY=y
 CONFIG_HID_CHICONY=y
 CONFIG_HID_CYPRESS=y
 CONFIG_HID_EZKEY=y
 CONFIG_HID_GYRATION=y
-CONFIG_HID_LOGITECH=y
 CONFIG_HID_MICROSOFT=y
 CONFIG_HID_MONTEREY=y
 CONFIG_HID_PANTHERLORD=y
@@ -97,8 +93,6 @@ CONFIG_TMPFS=y
 CONFIG_NFS_FS=y
 CONFIG_NFS_V4=y
 CONFIG_ROOT_NFS=y
-CONFIG_CRC_T10DIF=y
-CONFIG_CRYPTO_ECB=m
 CONFIG_CRYPTO_PCBC=m
-CONFIG_CRYPTO_SHA512=y
 CONFIG_CRYPTO_DEV_TALITOS=y
+CONFIG_CRC_T10DIF=y

-- 
2.45.2



