Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15511143633
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 05:33:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481wdT6pPZzDqQK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 15:33:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481wYq2k7MzDqWv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 15:30:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=KL851bmz; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 481wYq0F5Dz9sNF; Tue, 21 Jan 2020 15:30:07 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 481wYp62Ssz9sNx; Tue, 21 Jan 2020 15:30:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579581006;
 bh=ENnj4bvc0MeAr9h+R8Qmo+PwjRP9iUnkwftG1t9ZBNM=;
 h=From:To:Cc:Subject:Date:From;
 b=KL851bmzsRUo6nBqzwNIU93O50fAaDOLAPzYRfdkMYOpOsphT+sxNeDC4r1TR1sAH
 w6rmEItz5K4xjXE2eXSDSbRRU/wktSWcsW7BWHHycEKSYHG6RqbCneJrspSZAbwF3J
 zPMUoPzD/2OsXRSh0MbWNtM8SXVPjDXOREHEqDijbvk4z8FMS+SffvW/vA3v/Uq5Kx
 8t7omkC5q4pjBWQGSA7B+DynZZSJ+oUGfYSrEXiQI6q83M+hUEQyPMxsVvPwwCTfky
 iGSJaCdvrtk6Mn+6Wzp4v4ncaKpqPpnXyIlYBImncZP1vpBPr+JmSRZ7TbwIySbr5P
 ap4Wjy8+Yn38w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 01/10] powerpc/configs: Drop CONFIG_QLGE which moved to
 staging
Date: Tue, 21 Jan 2020 15:29:51 +1100
Message-Id: <20200121043000.16212-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
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
Cc: oohall@gmail.com, joel@jms.id.au, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The QLGE driver moved to staging in commit 955315b0dc8c ("qlge: Move
drivers/net/ethernet/qlogic/qlge/ to drivers/staging/qlge/"), meaning
our defconfigs that enable it have no effect as we don't enable
CONFIG_STAGING.

It sounds like the device is obsolete, so drop the driver.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/powernv_defconfig | 1 -
 arch/powerpc/configs/ppc64_defconfig   | 1 -
 arch/powerpc/configs/ppc6xx_defconfig  | 1 -
 arch/powerpc/configs/pseries_defconfig | 1 -
 arch/powerpc/configs/skiroot_defconfig | 1 -
 5 files changed, 5 deletions(-)

v2: No change.

diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
index 32841456a573..71749377d164 100644
--- a/arch/powerpc/configs/powernv_defconfig
+++ b/arch/powerpc/configs/powernv_defconfig
@@ -181,7 +181,6 @@ CONFIG_MLX5_FPGA=y
 CONFIG_MLX5_CORE_EN=y
 CONFIG_MLX5_CORE_IPOIB=y
 CONFIG_MYRI10GE=m
-CONFIG_QLGE=m
 CONFIG_NETXEN_NIC=m
 CONFIG_USB_NET_DRIVERS=m
 # CONFIG_WLAN is not set
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index b250e6f5a7ca..7e68cb222c7b 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -189,7 +189,6 @@ CONFIG_MLX4_EN=m
 CONFIG_MYRI10GE=m
 CONFIG_S2IO=m
 CONFIG_PASEMI_MAC=y
-CONFIG_QLGE=m
 CONFIG_NETXEN_NIC=m
 CONFIG_SUNGEM=y
 CONFIG_GELIC_NET=m
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 7e28919041cf..3e2f44f38ac5 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -507,7 +507,6 @@ CONFIG_FORCEDETH=m
 CONFIG_HAMACHI=m
 CONFIG_YELLOWFIN=m
 CONFIG_QLA3XXX=m
-CONFIG_QLGE=m
 CONFIG_NETXEN_NIC=m
 CONFIG_8139CP=m
 CONFIG_8139TOO=m
diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/configs/pseries_defconfig
index 26126b4d4de3..6b68109e248f 100644
--- a/arch/powerpc/configs/pseries_defconfig
+++ b/arch/powerpc/configs/pseries_defconfig
@@ -169,7 +169,6 @@ CONFIG_IXGBE=m
 CONFIG_I40E=m
 CONFIG_MLX4_EN=m
 CONFIG_MYRI10GE=m
-CONFIG_QLGE=m
 CONFIG_NETXEN_NIC=m
 CONFIG_PPP=m
 CONFIG_PPP_BSDCOMP=m
diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index 069f67f12731..7ff1ff1ddc28 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -171,7 +171,6 @@ CONFIG_MYRI10GE=m
 # CONFIG_NET_VENDOR_NVIDIA is not set
 # CONFIG_NET_VENDOR_OKI is not set
 # CONFIG_NET_VENDOR_PACKET_ENGINES is not set
-CONFIG_QLGE=m
 CONFIG_NETXEN_NIC=m
 CONFIG_QED=m
 CONFIG_QEDE=m
-- 
2.21.1

