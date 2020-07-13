Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FA821DA34
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 17:36:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B576d1SGlzDqWG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 01:36:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=refactormyself@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hlFk02nn; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B54815J6MzDqR0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 23:22:40 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id dg28so13669399edb.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 06:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=TEh/JkkBeDq0BmwWDLkY2ALcEwIhER9cNUR1loI6e78=;
 b=hlFk02nnRr+rQKvpcmIRPBcv9Vppks3wU3BsbHQlS35RNRr0Lm2YUw7/utWjHu70OH
 fu21BCriHQitKJ9VJJ9HkQBoc0oNiPianJ9DfryJ5s4iB77Gi9+P+wSDFA8dw7sDMdjN
 CRk+C/cn77UZdk8p4eMVCYK2N1kZ9NOWbvXAMsA8NoetiFgB4PjRem+NJr8k6FdLryN7
 KSXqy55pf7Mo7GW41Rrh43kHUodvpJcq7yyqbdwHNICmnMteEU7rrwF/z8u+pZc3nMOJ
 t5bRIsTEDAnzpyq0Z/t5ptBct6erL48Bl/rPmxQHyXzHf8lqWgUjMDOqwGt/I2ULZZSO
 jYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TEh/JkkBeDq0BmwWDLkY2ALcEwIhER9cNUR1loI6e78=;
 b=AxjHD5yI5lRAqBmsFY7iCbdlFSd5WbhyoE+6VlBpNR/LxhQnn9ZkbCug56v8bfrUez
 HEvqQg1I6hfBW/UE1GD3FOIq+Qc6B0RK7KrU7U4eCAA3pBDZXNmM5pcE4FqqVw8z22fE
 QJ+/FlK43bJAarMQZZ4NukeLIhb5TyQAt3LdR3J0w14/Ja7Q0+8M19+UKTT5m+sHCf+c
 zqfR1NGmQDb/0Zu1T5889+wbO0fi+gSVdt0LfoYFv8hCpuixOF3YJhhPwwdFsVDQE59w
 KWUaLaLjkwhreOQciKLoNGxJilEJlLd23vopCMJA2VBA4loP5K8JeWqtUR/VR0XARbmW
 xakA==
X-Gm-Message-State: AOAM532EcXLibIpgepqnYGkzd6SObBhfx36J2a+hdj+FSlI/N+3cImGZ
 hIdzIc7sSuVDmVtOYlpKYq4=
X-Google-Smtp-Source: ABdhPJw69dKLZM419xxp02IeffDX2nQ+F52A+jh3cXUOZ7YUfQhM+G+xXauU5Oq4EhNqFD1PfU4cXQ==
X-Received: by 2002:a50:fb93:: with SMTP id e19mr83849853edq.106.1594646556147; 
 Mon, 13 Jul 2020 06:22:36 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:22:35 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Subject: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
Date: Mon, 13 Jul 2020 14:22:12 +0200
Message-Id: <20200713122247.10985-1-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
X-Mailman-Approved-At: Tue, 14 Jul 2020 01:32:14 +1000
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
Cc: Rich Felker <dalias@libc.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-sh@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-nvme@lists.infradead.org,
 Yicong Yang <yangyicong@hisilicon.com>, Keith Busch <kbusch@kernel.org>,
 netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-i2c@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 sparclinux@vger.kernel.org, rfi@lists.rocketboards.org,
 Toan Le <toan@os.amperecomputing.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-scsi@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-atm-general@lists.sourceforge.net, Russell King <linux@armlinux.org.uk>,
 Realtek linux nic maintainers <nic_swsd@realtek.com>,
 Christoph Hellwig <hch@lst.de>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Chas Williams <3chas3@gmail.com>, xen-devel@lists.xenproject.org,
 Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Kevin Hilman <khilman@baylibre.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Ray Jui <rjui@broadcom.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Yue Wang <yue.wang@Amlogic.com>, Jens Axboe <axboe@fb.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-m68k@lists.linux-m68k.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Michael Buesch <m@bues.ch>,
 skhan@linuxfoundation.org, bjorn@helgaas.com,
 linux-amlogic@lists.infradead.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 Juergen Gross <jgross@suse.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Scott Branden <sbranden@broadcom.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Brian King <brking@us.ibm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-alpha@vger.kernel.org,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



This goal of these series is to move the definition of *all* PCIBIOS* from
include/linux/pci.h to arch/x86 and limit their use within there.
All other tree specific definition will be left for intact. Maybe they can
be renamed.

PCIBIOS* is an x86 concept as defined by the PCI spec. The returned error
codes of PCIBIOS* are positive values and this introduces some complexities
which other archs need not incur.

PLAN:

1.   [PATCH v0 1-36] Replace all PCIBIOS_SUCCESSFUL with 0

2a.  Audit all functions returning PCIBIOS_* error values directly or
     indirectly and prevent possible bug coming in (2b)

2b.  Make all functions returning PCIBIOS_* error values call 
     pcibios_err_to_errno(). *This will change their behaviour, for good.*

3.   Clone a pcibios_err_to_errno() into arch/x86/pci/pcbios.c as _v2.
     This handles the positive error codes directly and will not use any
     PCIBIOS* definitions. So calls to it have no outside dependence.

4.   Make all x86 codes that needs to convert to -E* values call the 
     cloned version - pcibios_err_to_errno_v2()

5.   Assign PCIBIOS_* errors values directly to generic -E* errors

6.   Refactor pcibios_err_to_errno() and mark it deprecated

7.   Replace all calls to pcibios_err_to_errno() with the proper -E* value
     or 0.

8.   Remove all PCIBIOS* definitions in include/linux/pci.h and 
     pcibios_err_to_errno() too.

9.   Redefine all PCIBIOS* definitions with original values inside 
     arch/x86/pci/pcbios.c

10.  Redefine pcibios_err_to_errno() inside arch/x86/pci/pcbios.c

11.  Replace pcibios_err_to_errno_v2() calls with pcibios_err_to_errno()

12.  Remove pcibios_err_to_errno_v2()

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Suggested-by: Yicong Yang <yangyicong@hisilicon.com>
Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>


Bolarinwa Olayemi Saheed (35):
  Change PCIBIOS_SUCCESSFUL to 0
  Change PCIBIOS_SUCCESSFUL to 0
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks
  Change PCIBIOS_SUCCESSFUL to 0
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks
  Change PCIBIOS_SUCCESSFUL to 0
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks
  Fix Style ERROR: assignment in if condition
  Change PCIBIOS_SUCCESSFUL to 0
  Change PCIBIOS_SUCCESSFUL to 0
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks
  Change PCIBIOS_SUCCESSFUL to 0
  Change PCIBIOS_SUCCESSFUL to 0
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks

 arch/alpha/kernel/core_apecs.c                |  4 +--
 arch/alpha/kernel/core_cia.c                  |  4 +--
 arch/alpha/kernel/core_irongate.c             |  4 +--
 arch/alpha/kernel/core_lca.c                  |  4 +--
 arch/alpha/kernel/core_marvel.c               |  4 +--
 arch/alpha/kernel/core_mcpcia.c               |  4 +--
 arch/alpha/kernel/core_polaris.c              |  4 +--
 arch/alpha/kernel/core_t2.c                   |  4 +--
 arch/alpha/kernel/core_titan.c                |  4 +--
 arch/alpha/kernel/core_tsunami.c              |  4 +--
 arch/alpha/kernel/core_wildfire.c             |  4 +--
 arch/alpha/kernel/sys_miata.c                 |  2 +-
 arch/arm/common/it8152.c                      |  4 +--
 arch/arm/mach-cns3xxx/pcie.c                  |  2 +-
 arch/arm/mach-footbridge/dc21285.c            |  4 +--
 arch/arm/mach-iop32x/pci.c                    |  6 ++--
 arch/arm/mach-ixp4xx/common-pci.c             |  8 ++---
 arch/arm/mach-orion5x/pci.c                   |  4 +--
 arch/arm/plat-orion/pcie.c                    |  8 ++---
 arch/m68k/coldfire/pci.c                      |  8 ++---
 arch/microblaze/pci/indirect_pci.c            |  4 +--
 arch/mips/pci/fixup-ath79.c                   |  2 +-
 arch/mips/pci/ops-bcm63xx.c                   | 14 ++++----
 arch/mips/pci/ops-bonito64.c                  |  4 +--
 arch/mips/pci/ops-gt64xxx_pci0.c              |  4 +--
 arch/mips/pci/ops-lantiq.c                    |  4 +--
 arch/mips/pci/ops-loongson2.c                 |  4 +--
 arch/mips/pci/ops-mace.c                      |  4 +--
 arch/mips/pci/ops-msc.c                       |  4 +--
 arch/mips/pci/ops-rc32434.c                   |  6 ++--
 arch/mips/pci/ops-sni.c                       |  4 +--
 arch/mips/pci/ops-tx3927.c                    |  2 +-
 arch/mips/pci/ops-tx4927.c                    |  2 +-
 arch/mips/pci/ops-vr41xx.c                    |  4 +--
 arch/mips/pci/pci-alchemy.c                   |  6 ++--
 arch/mips/pci/pci-ar2315.c                    |  5 ++-
 arch/mips/pci/pci-ar71xx.c                    |  4 +--
 arch/mips/pci/pci-ar724x.c                    |  6 ++--
 arch/mips/pci/pci-bcm1480.c                   |  4 +--
 arch/mips/pci/pci-bcm1480ht.c                 |  4 +--
 arch/mips/pci/pci-mt7620.c                    |  4 +--
 arch/mips/pci/pci-octeon.c                    | 12 +++----
 arch/mips/pci/pci-rt2880.c                    |  4 +--
 arch/mips/pci/pci-rt3883.c                    |  4 +--
 arch/mips/pci/pci-sb1250.c                    |  4 +--
 arch/mips/pci/pci-virtio-guest.c              |  4 +--
 arch/mips/pci/pci-xlp.c                       |  4 +--
 arch/mips/pci/pci-xlr.c                       |  4 +--
 arch/mips/pci/pci-xtalk-bridge.c              | 14 ++++----
 arch/mips/pci/pcie-octeon.c                   |  4 +--
 arch/mips/txx9/generic/pci.c                  |  5 ++-
 arch/powerpc/kernel/rtas_pci.c                |  4 +--
 arch/powerpc/platforms/4xx/pci.c              |  4 +--
 arch/powerpc/platforms/52xx/efika.c           |  4 +--
 arch/powerpc/platforms/52xx/mpc52xx_pci.c     |  4 +--
 arch/powerpc/platforms/82xx/pq2.c             |  2 +-
 arch/powerpc/platforms/85xx/mpc85xx_cds.c     |  2 +-
 arch/powerpc/platforms/85xx/mpc85xx_ds.c      |  2 +-
 arch/powerpc/platforms/86xx/mpc86xx_hpcn.c    |  2 +-
 arch/powerpc/platforms/chrp/pci.c             |  8 ++---
 arch/powerpc/platforms/embedded6xx/holly.c    |  2 +-
 .../platforms/embedded6xx/mpc7448_hpc2.c      |  2 +-
 arch/powerpc/platforms/fsl_uli1575.c          |  2 +-
 arch/powerpc/platforms/maple/pci.c            | 18 +++++-----
 arch/powerpc/platforms/pasemi/pci.c           |  6 ++--
 arch/powerpc/platforms/powermac/pci.c         |  8 ++---
 arch/powerpc/platforms/powernv/eeh-powernv.c  |  4 +--
 arch/powerpc/platforms/powernv/pci.c          |  4 +--
 arch/powerpc/platforms/pseries/eeh_pseries.c  |  4 +--
 arch/powerpc/sysdev/fsl_pci.c                 |  2 +-
 arch/powerpc/sysdev/indirect_pci.c            |  4 +--
 arch/powerpc/sysdev/tsi108_pci.c              |  4 +--
 arch/sh/drivers/pci/common.c                  |  3 +-
 arch/sh/drivers/pci/ops-dreamcast.c           |  4 +--
 arch/sh/drivers/pci/ops-sh4.c                 |  4 +--
 arch/sh/drivers/pci/ops-sh7786.c              |  8 ++---
 arch/sh/drivers/pci/pci.c                     |  2 +-
 arch/sparc/kernel/pci_common.c                | 28 +++++++--------
 arch/unicore32/kernel/pci.c                   |  4 +--
 drivers/atm/iphase.c                          | 20 ++++++-----
 drivers/atm/lanai.c                           |  8 ++---
 drivers/bcma/driver_pci_host.c                |  4 +--
 drivers/hwmon/sis5595.c                       | 13 +++----
 drivers/hwmon/via686a.c                       | 13 +++----
 drivers/hwmon/vt8231.c                        | 13 +++----
 drivers/i2c/busses/i2c-ali15x3.c              |  5 ++-
 drivers/i2c/busses/i2c-nforce2.c              |  3 +-
 drivers/i2c/busses/i2c-sis5595.c              | 15 +++-----
 drivers/misc/cxl/vphb.c                       |  4 +--
 drivers/net/ethernet/realtek/r8169_main.c     |  2 +-
 drivers/nvme/host/pci.c                       |  2 +-
 drivers/pci/access.c                          | 14 ++++----
 drivers/pci/controller/dwc/pci-meson.c        |  4 +--
 .../pci/controller/dwc/pcie-designware-host.c |  2 +-
 drivers/pci/controller/dwc/pcie-designware.c  |  4 +--
 drivers/pci/controller/dwc/pcie-hisi.c        |  4 +--
 drivers/pci/controller/dwc/pcie-tegra194.c    |  4 +--
 .../pci/controller/mobiveil/pcie-mobiveil.c   |  4 +--
 drivers/pci/controller/pci-aardvark.c         |  4 +--
 drivers/pci/controller/pci-ftpci100.c         |  4 +--
 drivers/pci/controller/pci-hyperv.c           |  8 ++---
 drivers/pci/controller/pci-mvebu.c            |  4 +--
 drivers/pci/controller/pci-thunder-ecam.c     | 36 +++++++++----------
 drivers/pci/controller/pci-thunder-pem.c      |  4 +--
 drivers/pci/controller/pci-xgene.c            |  5 ++-
 drivers/pci/controller/pcie-altera.c          | 16 ++++-----
 drivers/pci/controller/pcie-iproc.c           | 10 +++---
 drivers/pci/controller/pcie-mediatek.c        |  4 +--
 drivers/pci/controller/pcie-rcar-host.c       |  8 ++---
 drivers/pci/controller/pcie-rockchip-host.c   | 10 +++---
 drivers/pci/pci-bridge-emul.c                 | 14 ++++----
 drivers/pci/pci.c                             |  8 ++---
 drivers/pci/pcie/bw_notification.c            |  4 +--
 drivers/pci/probe.c                           |  4 +--
 drivers/pci/quirks.c                          |  4 +--
 drivers/pci/syscall.c                         |  8 ++---
 drivers/pci/xen-pcifront.c                    |  2 +-
 drivers/scsi/ipr.c                            | 16 ++++-----
 drivers/scsi/pmcraid.c                        |  6 ++--
 drivers/ssb/driver_gige.c                     |  4 +--
 drivers/ssb/driver_pcicore.c                  |  4 +--
 drivers/xen/xen-pciback/conf_space.c          |  2 +-
 122 files changed, 347 insertions(+), 369 deletions(-)

-- 
2.18.2

