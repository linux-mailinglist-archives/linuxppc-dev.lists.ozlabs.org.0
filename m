Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BEE309FFB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 02:27:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTVfz18BRzDrQR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 12:27:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTVcL6FmtzDrR3
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Feb 2021 12:25:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=cIc4gIQv; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4DTVcK44gGz9t2b; Mon,  1 Feb 2021 12:25:05 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DTVcK2TB9z9t1Q; Mon,  1 Feb 2021 12:25:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1612142705;
 bh=PCO2w4aIauaxp6DLHardPS8+O9QHuutYiXOVRz3249o=;
 h=From:To:Cc:Subject:Date:From;
 b=cIc4gIQvWwESyVzaNpfl64fvxPRhK1bmV4/x0dqJnK6WUc+1oCfMTywg7zm/8FEIg
 XKn645WfsNHEf8EZv5CrYx3cdIdoNEPNhWlLofv+gt+rP5zt+JxaJbCA8R4xRSvKi+
 T68sh1v9xjes9anKRu4NZr3PSrAzxOCt1cBB2QqzFPm/92MbU8741jFvO3KVhUFOD0
 6kMRGRfKaP9iNQudGKhkkMCU8HQAEWxCu2Yt5na8ILgzCk3/S892WCYLsgIygt5boW
 iXm/tX66Ij2mGIuXToMOFNURN5XiNHZT8hSJ3URQMn649/kVUSVCz7l84BW7/WeuFP
 I4QXw/gDBx7hg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/akebono: Fix unmet dependency errors
Date: Mon,  1 Feb 2021 12:25:03 +1100
Message-Id: <20210201012503.940145-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: f.fainelli@gmail.com, rdunlap@infradead.org, yury.norov@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The AKEBONO config has various selects under it, including some with
user-selectable dependencies, which means those dependencies can be
disabled. This leads to warnings from Kconfig.

This can be seen with eg:

  $ make allnoconfig
  $ ./scripts/config --file build~/.config -k -e CONFIG_44x -k -e CONFIG_PPC_47x -e CONFIG_AKEBONO
  $ make olddefconfig

  WARNING: unmet direct dependencies detected for ATA
    Depends on [n]: HAS_IOMEM [=y] && BLOCK [=n]
    Selected by [y]:
    - AKEBONO [=y] && PPC_47x [=y]

  WARNING: unmet direct dependencies detected for NETDEVICES
    Depends on [n]: NET [=n]
    Selected by [y]:
    - AKEBONO [=y] && PPC_47x [=y]

  WARNING: unmet direct dependencies detected for ETHERNET
    Depends on [n]: NETDEVICES [=y] && NET [=n]
    Selected by [y]:
    - AKEBONO [=y] && PPC_47x [=y]

  WARNING: unmet direct dependencies detected for MMC_SDHCI
    Depends on [n]: MMC [=n] && HAS_DMA [=y]
    Selected by [y]:
    - AKEBONO [=y] && PPC_47x [=y]

  WARNING: unmet direct dependencies detected for MMC_SDHCI_PLTFM
    Depends on [n]: MMC [=n] && MMC_SDHCI [=y]
    Selected by [y]:
    - AKEBONO [=y] && PPC_47x [=y]

The problem is that AKEBONO is using select to enable things that are
not true dependencies, but rather things you probably want enabled in
an AKEBONO kernel. That is what a defconfig is for.

So drop those selects and instead move those symbols into the
defconfig. This fixes all the kconfig warnings, and the result of make
44x/akebono_defconfig is the same before and after the patch.

Reported-by: Yury Norov <yury.norov@gmail.com>
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/44x/akebono_defconfig | 5 +++++
 arch/powerpc/platforms/44x/Kconfig         | 7 -------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/configs/44x/akebono_defconfig b/arch/powerpc/configs/44x/akebono_defconfig
index 3894ba8f8ffc..ae9b7beefdd6 100644
--- a/arch/powerpc/configs/44x/akebono_defconfig
+++ b/arch/powerpc/configs/44x/akebono_defconfig
@@ -21,6 +21,7 @@ CONFIG_IRQ_ALL_CPUS=y
 # CONFIG_COMPACTION is not set
 # CONFIG_SUSPEND is not set
 CONFIG_NET=y
+CONFIG_NETDEVICES=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
@@ -41,7 +42,9 @@ CONFIG_BLK_DEV_RAM_SIZE=35000
 # CONFIG_SCSI_PROC_FS is not set
 CONFIG_BLK_DEV_SD=y
 # CONFIG_SCSI_LOWLEVEL is not set
+CONFIG_ATA=y
 # CONFIG_SATA_PMP is not set
+CONFIG_SATA_AHCI_PLATFORM=y
 # CONFIG_ATA_SFF is not set
 # CONFIG_NET_VENDOR_3COM is not set
 # CONFIG_NET_VENDOR_ADAPTEC is not set
@@ -98,6 +101,8 @@ CONFIG_USB_OHCI_HCD=y
 # CONFIG_USB_OHCI_HCD_PCI is not set
 CONFIG_USB_STORAGE=y
 CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_M41T80=y
 CONFIG_EXT2_FS=y
diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platforms/44x/Kconfig
index 78ac6d67a935..7d41e9264510 100644
--- a/arch/powerpc/platforms/44x/Kconfig
+++ b/arch/powerpc/platforms/44x/Kconfig
@@ -206,17 +206,10 @@ config AKEBONO
 	select PPC4xx_HSTA_MSI
 	select I2C
 	select I2C_IBM_IIC
-	select NETDEVICES
-	select ETHERNET
-	select NET_VENDOR_IBM
 	select IBM_EMAC_EMAC4 if IBM_EMAC
 	select USB if USB_SUPPORT
 	select USB_OHCI_HCD_PLATFORM if USB_OHCI_HCD
 	select USB_EHCI_HCD_PLATFORM if USB_EHCI_HCD
-	select MMC_SDHCI
-	select MMC_SDHCI_PLTFM
-	select ATA
-	select SATA_AHCI_PLATFORM
 	help
 	  This option enables support for the IBM Akebono (476gtr) evaluation board
 
-- 
2.25.1

