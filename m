Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 520FB2C7BEE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 00:10:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CkkcV4LMdzDrQH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 10:10:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.67; helo=mail-wr1-f67.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.com
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CkkY32SSxzDrBk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 10:07:50 +1100 (AEDT)
Received: by mail-wr1-f67.google.com with SMTP id r3so13093103wrt.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 15:07:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dIsjLfFDP99Dz5MgIeEC3kYmopeb//2rrPq0h43VXLw=;
 b=LPR6rXw8T4euSrSRX6QkfC+jDoOOa8Ni65u6VW9kJ8/R6+8Qd8zRKNcjbKb6fICYyV
 K1Q9eTPErFE2lLzW6hfeEI3cPhBu3ljGxUG2fNcck3wegXatCaxrKrzer/yNjfax6H42
 WAViN1/R6u656Xb13iqY0JlmuZNg9RvQ1zicFbGvcZFOZ1tGXTHRdaCXpEZk3g1Ozdgv
 PwUKnIRZD1xYuZMKThbkLtX34w5vbWNy7EdfjmGBkFAWV0CT4xbFQDRzrcFGzUnaOktZ
 oFv3VL7hzRlpPJpADe8FzIG1YVABlZ9fansmULgFiiiawybvpp28Qciyl5qeSCFMlu8C
 h4NQ==
X-Gm-Message-State: AOAM531g4habhu8L/rpGUXvP3BirmeAuWJDSnfv7KXmkiBbKLA9Bxw5z
 uN/ZBBmnOYTW66OUfR23atM=
X-Google-Smtp-Source: ABdhPJz/dkK+2g8rJ248iKa8tTMH3iMxLDK3ZiUyWbXRCDA7ANZkmFRz+HppIcBOB0AKWrROKjqraw==
X-Received: by 2002:a5d:4892:: with SMTP id g18mr18707990wrq.365.1606691266382; 
 Sun, 29 Nov 2020 15:07:46 -0800 (PST)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id d2sm24831005wrn.43.2020.11.29.15.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 15:07:45 -0800 (PST)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v6 0/5] PCI: Unify ECAM constants in native PCI Express drivers
Date: Sun, 29 Nov 2020 23:07:38 +0000
Message-Id: <20201129230743.3006978-1-kw@linux.com>
X-Mailer: git-send-email 2.29.2
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
Cc: Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>,
 Paul Mackerras <paulus@samba.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Toan Le <toan@os.amperecomputing.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-rockchip@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 Jonathan Derrick <jonathan.derrick@intel.com>, linux-pci@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>,
 linux-rpi-kernel@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Zhou Wang <wangzhou1@hisilicon.com>, Robert Richter <rrichter@marvell.com>,
 linuxppc-dev@lists.ozlabs.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Unify ECAM-related constants into a single set of standard constants
defining memory address shift values for the byte-level address that can
be used when accessing the PCI Express Configuration Space, and then
move native PCI Express controller drivers to use newly introduced
definitions retiring any driver-specific ones.

The ECAM ("Enhanced Configuration Access Mechanism") is defined by the
PCI Express specification (see PCI Express Base Specification, Revision
5.0, Version 1.0, Section 7.2.2, p. 676), thus most hardware should
implement it the same way.

Most of the native PCI Express controller drivers define their ECAM-related
constants, many of these could be shared, or use open-coded values when
setting the ".bus_shift" field of the "struct pci_ecam_ops".

All of the newly added constants should remove ambiguity and reduce the
number of open-coded values, and also correlate more strongly with the
descriptions in the aforementioned specification (see Table 7-1
"Enhanced Configuration Address Mapping", p. 677).

Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Krzysztof Wilczyński <kw@linux.com>

--- 
Changed in v6:
  Converted single patch into a series.
  Dropped changes related to PPC 4xx platform.
  Refactored pci_ecam_map_bus() so that bus, device function and offset
  are correctly masked, limiting offset to 4K as per the PCI Express
  Specification.  After the refactor this function will now use sensible
  defaults allowing for removal of the ".bus_shit" initialiser from all
  the users of the "ecam_ops" structure who do not use a non-standard
  ECAM bus shit values.

Changed in v5:
  Removed unused constant "PCIE_ECAM_DEV_SHIFT".
  Refactored ppc4xx_pciex_get_config_base() so that the "offset"
  parameter can be passed to so that the PCIE_ECAM_OFFSET() macro
  can be used.
  Used the ALIGN_DOWN() macro where 32 bit alignment is required
  instead using the 0xffc mask.
  Added CFG_ADDR_CFG_TYPE_1 macro to pci/controller/pcie-iproc.c to
  denote that this is a configuration type 1 address and access type.
  Refactored boundary check in pci/controller/vmd.c as used by the
  vmd_cfg_addr() function following addition of the PCIE_ECAM_OFFSET()
  macro.
  Changed the "bus->number" to simply pass the "bus" argument in the
  PCIE_ECAM_OFFSET() macro.

Changed in v4:
  Removed constants related to "CAM".
  Added more platforms and devices that can use new ECAM macros and
  constants.
  Removed unused ".bus_shift" initialisers from pci-xgene.c as
  xgene_pcie_map_bus() did not use these.

Changes in v3:
  Updated commit message wording.
  Updated regarding custom ECAM bus shift values and concerning PCI base
  configuration space access for Type 1 access.
  Refactored rockchip_pcie_rd_other_conf() and rockchip_pcie_wr_other_conf()
  and removed the "busdev" variable.
  Removed surplus "relbus" variable from nwl_pcie_map_bus() and
  xilinx_pcie_map_bus().
  Renamed the PCIE_ECAM_ADDR() macro to PCIE_ECAM_OFFSET().

Changes in v2:
  Use PCIE_ECAM_ADDR macro when computing ECAM address offset, but drop
  PCI_SLOT and PCI_FUNC macros from the PCIE_ECAM_ADDR macro in favour
  of using a single value for the device/function.

Krzysztof Wilczyński (5):
  PCI: Unify ECAM constants in native PCI Express drivers
  PCI: thunder-pem: Add constant for custom ".bus_shit" initialiser
  PCI: iproc: Convert to use the new ECAM constants
  PCI: vmd: Update type of the __iomem pointers
  PCI: xgene: Removed unused ".bus_shift" initialisers from pci-xgene.c

 drivers/pci/controller/dwc/pcie-al.c        | 12 ++------
 drivers/pci/controller/dwc/pcie-hisi.c      |  2 --
 drivers/pci/controller/pci-aardvark.c       | 13 ++-------
 drivers/pci/controller/pci-host-generic.c   |  1 -
 drivers/pci/controller/pci-thunder-ecam.c   |  1 -
 drivers/pci/controller/pci-thunder-pem.c    | 13 +++++++--
 drivers/pci/controller/pci-xgene.c          |  2 --
 drivers/pci/controller/pcie-brcmstb.c       | 16 ++---------
 drivers/pci/controller/pcie-iproc.c         | 31 ++++++---------------
 drivers/pci/controller/pcie-rockchip-host.c | 27 +++++++++---------
 drivers/pci/controller/pcie-rockchip.h      |  8 +-----
 drivers/pci/controller/pcie-tango.c         |  1 -
 drivers/pci/controller/pcie-xilinx-nwl.c    |  9 ++----
 drivers/pci/controller/pcie-xilinx.c        | 11 ++------
 drivers/pci/controller/vmd.c                | 19 ++++++-------
 drivers/pci/ecam.c                          | 23 ++++++++++-----
 include/linux/pci-ecam.h                    | 27 ++++++++++++++++++
 17 files changed, 96 insertions(+), 120 deletions(-)

-- 
2.29.2

