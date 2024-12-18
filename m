Return-Path: <linuxppc-dev+bounces-4293-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2709F63F7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 11:55:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCrF50Mfzz2xxw;
	Wed, 18 Dec 2024 21:55:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734519337;
	cv=none; b=NFkQlKiWpDQ2vXBXDGlH65bzxFfYsTRSG6em7/5h8x/nLBr1XJ0wuO+N6GOY+g29M/cXF3SBjHxS5YVqt4Dhnt2b/Wa3OUYY8YTfIKWWsr6kqcCfiiI71JW/B0WI0GT82iPnJA8iKjd5bJB1EDONWvYgY0ubZewAxto4828wm3vyw3ANqzO3/A8Jw/zM8e7ewY23jYmfg2O9k0SFuxOL0/Q27M4qD4njIEQ+DdPaWLplnSnle5JL+uTCEeqx3WFpPnuRZwlyt7zvXMwdrSia0BOfKbmpsrZxIonBwH/P2d9SZIR8AUR8Fnqf8fI5QuiYK8krEN/a/j9VwaMWpaaz6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734519337; c=relaxed/relaxed;
	bh=dWgE8qGbT6xOfnjYuP8DQidbO79eRCwwFYzF4MiDNq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vv56ypgBBMK72JZdVrmVXEXwL0YLE7SbChZKQvD+9BLW85X9aMA18K51qfiL2g6rPOKbhatsTLwK0gvB8XdPWy86NQy7I4aKc5CIzpGxzmzgrsrT9drSULhXcwfjDdd5eMcab5J1MONc28Js/WebUqsSp7gON0A5qn3rqg7yi7M1BXtIu3XnFeJS1+xc6EZnEI2x6WWzOKigQvddFO3Bi2mbL4yIsm6xfFrtmDNA5+tFeaQBd/uqB38gDpCRFM7DysfQPm7hEvOQtDSfxuFq82OsTzxpdgRbX9MqLsF2EUmqnCAenseXaadF54/bR4B+c5wcWI7swhdGuTTNP6fsOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VQo6CDdZ; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VQo6CDdZ;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCrF31bSyz2yP8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 21:55:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1734519328;
	bh=dWgE8qGbT6xOfnjYuP8DQidbO79eRCwwFYzF4MiDNq4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VQo6CDdZUc0rk9jVVb5GKn8TnlZUV9/d96sBZaxbFbUkYsWZxVQMBUfuRf07dj3T3
	 bQQGnbDyOeN9D+VR3z6Pb6tEnFz3md1+z4Cd3w9pklj+cTLZvrtNT+cCpKeuuooFJB
	 9+Xx8g9tgR2cnuoeh0GkXXl8vxR8DbkkXntuvqr+mPGJ5Miu7LzDJj0R0DoGujAueA
	 Az4aJiAfXsS+Uan3FMTnjxPayly4TkVx+om2w/bYsbQxrKLbAGnn830FoFDcjV4qKa
	 xsFHk+1+f4SIpiLG54d8xG+5FL4NtHM6is3IIoAWam56LPZJUMF0G0quQ2WAKIB/WO
	 V93pVbUoy3toQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YCrDw33dKz4xf7;
	Wed, 18 Dec 2024 21:55:28 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <arnd@arndb.de>,
	<jk@ozlabs.org>,
	<segher@kernel.crashing.org>
Subject: [PATCH v2 04/25] powerpc: Remove IBM_CELL_BLADE & SPIDER_NET references
Date: Wed, 18 Dec 2024 21:54:52 +1100
Message-ID: <20241218105523.416573-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218105523.416573-1-mpe@ellerman.id.au>
References: <20241218105523.416573-1-mpe@ellerman.id.au>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The symbols are no longer selectable so remove references to them.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
v2: Unchanged.

 arch/powerpc/boot/Makefile           | 2 --
 arch/powerpc/configs/cell_defconfig  | 2 --
 arch/powerpc/configs/ppc64_defconfig | 2 --
 3 files changed, 6 deletions(-)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 1ff6ad4f6cd2..184d0680e661 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -173,7 +173,6 @@ src-plat-$(CONFIG_PPC_PS3) += ps3-head.S ps3-hvcall.S ps3.c
 src-plat-$(CONFIG_EPAPR_BOOT) += epapr.c epapr-wrapper.c
 src-plat-$(CONFIG_PPC_PSERIES) += pseries-head.S
 src-plat-$(CONFIG_PPC_POWERNV) += pseries-head.S
-src-plat-$(CONFIG_PPC_IBM_CELL_BLADE) += pseries-head.S
 src-plat-$(CONFIG_MVME7100) += motload-head.S mvme7100.c
 
 src-plat-$(CONFIG_PPC_MICROWATT) += fixed-head.S microwatt.c
@@ -276,7 +275,6 @@ quiet_cmd_wrap	= WRAP    $@
 
 image-$(CONFIG_PPC_PSERIES)		+= zImage.pseries
 image-$(CONFIG_PPC_POWERNV)		+= zImage.pseries
-image-$(CONFIG_PPC_IBM_CELL_BLADE)	+= zImage.pseries
 image-$(CONFIG_PPC_PS3)			+= dtbImage.ps3
 image-$(CONFIG_PPC_CHRP)		+= zImage.chrp
 image-$(CONFIG_PPC_EFIKA)		+= zImage.chrp
diff --git a/arch/powerpc/configs/cell_defconfig b/arch/powerpc/configs/cell_defconfig
index 53f43a34e1a9..0a01908ec63a 100644
--- a/arch/powerpc/configs/cell_defconfig
+++ b/arch/powerpc/configs/cell_defconfig
@@ -25,7 +25,6 @@ CONFIG_PS3_DISK=y
 CONFIG_PS3_ROM=m
 CONFIG_PS3_FLASH=m
 CONFIG_PS3_LPM=m
-CONFIG_PPC_IBM_CELL_BLADE=y
 CONFIG_RTAS_FLASH=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_GOV_POWERSAVE=y
@@ -133,7 +132,6 @@ CONFIG_SKGE=m
 CONFIG_SKY2=m
 CONFIG_GELIC_NET=m
 CONFIG_GELIC_WIRELESS=y
-CONFIG_SPIDER_NET=y
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO_I8042 is not set
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index f39c0d000c43..f71f569c536a 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -51,7 +51,6 @@ CONFIG_PS3_DISK=m
 CONFIG_PS3_ROM=m
 CONFIG_PS3_FLASH=m
 CONFIG_PS3_LPM=m
-CONFIG_PPC_IBM_CELL_BLADE=y
 CONFIG_RTAS_FLASH=m
 CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
 CONFIG_CPU_FREQ_GOV_POWERSAVE=y
@@ -228,7 +227,6 @@ CONFIG_NETXEN_NIC=m
 CONFIG_SUNGEM=y
 CONFIG_GELIC_NET=m
 CONFIG_GELIC_WIRELESS=y
-CONFIG_SPIDER_NET=m
 CONFIG_BROADCOM_PHY=m
 CONFIG_MARVELL_PHY=y
 CONFIG_PPP=m
-- 
2.47.1


