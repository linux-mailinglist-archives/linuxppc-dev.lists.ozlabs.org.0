Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1795513D1B6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 02:50:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ynFV06nczDqSr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 12:50:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ynC85WlwzDqGM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 12:48:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=FOmJL3jA; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 47ynC8494kz9sPW; Thu, 16 Jan 2020 12:48:04 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47ynC8370Rz9sR0; Thu, 16 Jan 2020 12:48:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579139284;
 bh=+YhWDXh5QPyuV7X5QCYQEtp6OOXymylIF8nCCqmxVAk=;
 h=From:To:Cc:Subject:Date:From;
 b=FOmJL3jAwIVy4s4bSTU/qP6konFEudgNn4pUcNdlSH1viNErr/WZ/KHfB99BuK4RI
 6zZAZmO5EvU8B0lo4a/0QfpejcKuJCFela/xZrDVrTY92sugA3SEhWr64k2PSsWXU+
 Ml55feoGmsOmiOKbxw10qUAIspiMnbvFQaJc5GnL6PfzmctE2rorcO6VonlGzNSfpZ
 FkKqdqqjtDE93jhsTT6oRCUe69UTd+5fx6I82tfBKjv/Qe6tJFyVhOKhSPIIOE32Rb
 9JVCs0bXY+DhqRsN4Kvx2wKevO0nc5/vRqoMjl2oRikLu/m1DB7r1gNF6DCORsdEUU
 /zMdjKFwVCf4A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 1/9] powerpc/configs: Drop CONFIG_QLGE which moved to staging
Date: Thu, 16 Jan 2020 11:48:00 +1000
Message-Id: <20200116014808.15756-1-mpe@ellerman.id.au>
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
Cc: joel@jms.id.au, dja@axtens.net
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

