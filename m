Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5C43DB006
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jul 2021 01:47:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GbRzQ5dLqz3cPv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jul 2021 09:47:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de;
 receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GbMnt722Fz2xg5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jul 2021 06:39:13 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m9Cmx-0000F8-Gi; Thu, 29 Jul 2021 22:37:55 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m9Cml-0003d6-RY; Thu, 29 Jul 2021 22:37:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m9Cml-0004Ht-Nr; Thu, 29 Jul 2021 22:37:43 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v1 0/5] PCI: Drop duplicated tracking of a pci_dev's bound
 driver
Date: Thu, 29 Jul 2021 22:37:35 +0200
Message-Id: <20210729203740.1377045-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
X-Mailman-Approved-At: Fri, 30 Jul 2021 09:47:29 +1000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-pci@vger.kernel.org,
 Alexander Duyck <alexanderduyck@fb.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>, oss-drivers@corigine.com,
 Oliver O'Halloran <oohall@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Jiri Olsa <jolsa@redhat.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-perf-users@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org,
 Ido Schimmel <idosch@nvidia.com>, x86@kernel.org, qat-linux@intel.com,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-wireless@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Yisen Zhuang <yisen.zhuang@huawei.com>, Fiona Trahe <fiona.trahe@intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Simon Horman <simon.horman@corigine.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Michael Buesch <m@bues.ch>, Jiri Pirko <jiri@nvidia.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@intel.com>, Juergen Gross <jgross@suse.com>,
 Salil Mehta <salil.mehta@huawei.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>, xen-devel@lists.xenproject.org,
 Vadym Kochan <vkochan@marvell.com>, MPT-FusionLinux.pdl@broadcom.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Wojciech Ziemba <wojciech.ziemba@intel.com>, linux-kernel@vger.kernel.org,
 Taras Chornyi <tchornyi@marvell.com>, Zhou Wang <wangzhou1@hisilicon.com>,
 linux-crypto@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

struct pci_dev tracks the bound pci driver twice. This series is about
removing this duplication.

The first two patches are just cleanups. The third patch introduces a
wrapper that abstracts access to struct pci_dev->driver. In the next
patch (hopefully) all users are converted to use the new wrapper and
finally the fifth patch removes the duplication.

Note this series is only build tested (allmodconfig on several
architectures).

I'm open to restructure this series if this simplifies things. E.g. the
use of the new wrapper in drivers/pci could be squashed into the patch
introducing the wrapper. Patch 4 could be split by maintainer tree or
squashed into patch 3 completely.

Best regards
Uwe

Uwe Kleine-König (5):
  PCI: Simplify pci_device_remove()
  PCI: Drop useless check from pci_device_probe()
  PCI: Provide wrapper to access a pci_dev's bound driver
  PCI: Adapt all code locations to not use struct pci_dev::driver
    directly
  PCI: Drop duplicated tracking of a pci_dev's bound driver

 arch/powerpc/include/asm/ppc-pci.h            |  3 +-
 arch/powerpc/kernel/eeh_driver.c              | 12 +++--
 arch/x86/events/intel/uncore.c                |  2 +-
 arch/x86/kernel/probe_roms.c                  |  2 +-
 drivers/bcma/host_pci.c                       |  6 ++-
 drivers/crypto/hisilicon/qm.c                 |  2 +-
 drivers/crypto/qat/qat_common/adf_aer.c       |  2 +-
 drivers/message/fusion/mptbase.c              |  4 +-
 drivers/misc/cxl/guest.c                      | 21 ++++----
 drivers/misc/cxl/pci.c                        | 25 ++++++----
 .../ethernet/hisilicon/hns3/hns3_ethtool.c    |  3 +-
 .../ethernet/marvell/prestera/prestera_pci.c  |  2 +-
 drivers/net/ethernet/mellanox/mlxsw/pci.c     |  2 +-
 .../ethernet/netronome/nfp/nfp_net_ethtool.c  |  2 +-
 drivers/pci/iov.c                             | 23 +++++----
 drivers/pci/pci-driver.c                      | 48 +++++++++----------
 drivers/pci/pci.c                             | 10 ++--
 drivers/pci/pcie/err.c                        | 35 +++++++-------
 drivers/pci/xen-pcifront.c                    |  4 +-
 drivers/ssb/pcihost_wrapper.c                 |  7 ++-
 drivers/usb/host/xhci-pci.c                   |  3 +-
 include/linux/pci.h                           |  2 +-
 22 files changed, 121 insertions(+), 99 deletions(-)


base-commit: 2734d6c1b1a089fb593ef6a23d4b70903526fe0c
-- 
2.30.2

