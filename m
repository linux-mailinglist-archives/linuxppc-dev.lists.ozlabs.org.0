Return-Path: <linuxppc-dev+bounces-3178-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 138F49C8B0E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 13:51:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq0QM6809z2xwc;
	Thu, 14 Nov 2024 23:51:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731588683;
	cv=none; b=D10ifj5P9GyaC0BkpOgX2i8w8ATxIrRi3W097U6+9qB6/Dycm5EVTkWGRVJP+2GJiHTCQ3F2IPiiqnQrtyz1Cd2XZ5cdPcnpBfxRM8YMX5As32Arl+6TCO8ENL4JWY8d6DrL9VUG8uFbiWHWMSTNGhcJ+yrUbtSOS7MLRN+ertlEtCD0o6PEudNkT6u/9SDx2dz41JROTt8s2SvDgRCVrTNZOL8SzNs985xyONv481h4LIR4VWKuwTd5y/ai6eluGYDzvzpus+a2LoplGSX0jD+mLllPuUbjEFoba4bSzwtDTc+rKDFEz3uVONO04MfpJ7v0zEO/bIaHgKaJkBwngQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731588683; c=relaxed/relaxed;
	bh=gveH/N0CtNog4hbJfsCvGaseWeD5OKc400GxRS3aWWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aZWG6UV8yGKsiu2yjat4Q6HlbMY85DPXZ7nAEyOOCaxDBg4hA4Fxn809ZXRGkl3g6I8+gLKIoNW/3lL82/6HEA9sRSm/eDqF0wiZvY9w3cuUnotsffOYBqWTTCnHzFFdl9LMPiAN6InPrlO+98nS5pAPRWwS3MW4iT8iP+20n9IJ6ZwyqQU8YWtWUcMJlpluZQm6DMfNVPp3WHCEPE9jIctNG8QkkjBs+fUJj+3iHsBI0oSC+aszOXDrdTprYjIzFl3OqkzNyWqf8JUBNILxTb0KmU+MPt4Jn8b+EdqqtOQ28Ckrn3o4W8SaiRHEI6LpZckfN8o3k5DEd3joNO/CgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dUK53AGH; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dUK53AGH;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq0QK4TYnz2yvk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 23:51:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731588678;
	bh=gveH/N0CtNog4hbJfsCvGaseWeD5OKc400GxRS3aWWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dUK53AGH5uwIYS3zKAbZ6GFD2+1MikhI7blqulRSZdSKnSyotAcgaWkQSuRoJkCFB
	 gBI+Uv9P5e1dv/lsXyJfDaKLf5kPkmPigxDG2cF/fzmS26k2BSyKNuG7zPyx+0ZPC4
	 EsO2+7AZKjOKDt65exOR4jI1BCa8HAi5/NROaipSejv5aMLjKC1NlzMz2DZBzJ8ajc
	 4+XixCKiJnmqE8qw9vSG9y2Mgmoog2jXZRthPOuxponbfxtX2X/nA9ZhFxCotj6Fyo
	 Dxw8D9TY3lOO+H7Pphn60I5EkEFGZxxX76El8tZezXPYXbbDzceI4h4ODzyKtJOi/0
	 smxjZyZv7UkSA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xq0QG4qWNz4x8C;
	Thu, 14 Nov 2024 23:51:18 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kernel@vger.kernel.org>,
	<jk@ozlabs.org>,
	<arnd@arndb.de>,
	<geoff@infradead.org>
Subject: [RFC PATCH 04/20] powerpc: Remove IBM_CELL_BLADE & SPIDER_NET references
Date: Thu, 14 Nov 2024 23:50:53 +1100
Message-ID: <20241114125111.599093-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114125111.599093-1-mpe@ellerman.id.au>
References: <20241114125111.599093-1-mpe@ellerman.id.au>
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
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The symbols are no longer selectable so remove references to them.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
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
2.47.0


