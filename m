Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DB43DEB7D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 13:01:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfBkh72Plz3dDX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 21:01:16 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gf9S46hzJz306C
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Aug 2021 20:03:30 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mArFM-0002yH-C3; Tue, 03 Aug 2021 12:02:04 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mArFB-0006F1-AC; Tue, 03 Aug 2021 12:01:53 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mArFB-0002le-6C; Tue, 03 Aug 2021 12:01:53 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 0/6] PCI: Drop duplicated tracking of a pci_dev's bound
 driver
Date: Tue,  3 Aug 2021 12:01:44 +0200
Message-Id: <20210803100150.1543597-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
X-Mailman-Approved-At: Tue, 03 Aug 2021 21:00:13 +1000
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
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Jiri Olsa <jolsa@redhat.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-perf-users@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org,
 Ido Schimmel <idosch@nvidia.com>, x86@kernel.org, qat-linux@intel.com,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, linux-wireless@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>,
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
 Frederic Barrat <fbarrat@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

changes since v1 (https://lore.kernel.org/linux-pci/20210729203740.1377045-1-u.kleine-koenig@pengutronix.de):

- New patch to simplify drivers/pci/xen-pcifront.c, spotted and
  suggested by Boris Ostrovsky
- Fix a possible NULL pointer dereference I introduced in xen-pcifront.c
- A few whitespace improvements
- Add a commit log to patch #6 (formerly #5)

I also expanded the audience for patches #4 and #6 to allow affected
people to actually see the changes to their drivers.

Interdiff can be found below.

The idea is still the same: After a few cleanups (#1 - #3) a new macro
is introduced abstracting access to struct pci_dev->driver. All users
are then converted to use this and in the last patch the macro is
changed to make use of struct pci_dev::dev->driver to get rid of the
duplicated tracking.

Best regards
Uwe

Uwe Kleine-König (6):
  PCI: Simplify pci_device_remove()
  PCI: Drop useless check from pci_device_probe()
  xen/pci: Drop some checks that are always true
  PCI: Provide wrapper to access a pci_dev's bound driver
  PCI: Adapt all code locations to not use struct pci_dev::driver
    directly
  PCI: Drop duplicated tracking of a pci_dev's bound driver

 arch/powerpc/include/asm/ppc-pci.h            |  3 +-
 arch/powerpc/kernel/eeh_driver.c              | 12 ++--
 arch/x86/events/intel/uncore.c                |  2 +-
 arch/x86/kernel/probe_roms.c                  |  2 +-
 drivers/bcma/host_pci.c                       |  6 +-
 drivers/crypto/hisilicon/qm.c                 |  2 +-
 drivers/crypto/qat/qat_common/adf_aer.c       |  2 +-
 drivers/message/fusion/mptbase.c              |  4 +-
 drivers/misc/cxl/guest.c                      | 21 +++----
 drivers/misc/cxl/pci.c                        | 25 ++++----
 .../ethernet/hisilicon/hns3/hns3_ethtool.c    |  2 +-
 .../ethernet/marvell/prestera/prestera_pci.c  |  2 +-
 drivers/net/ethernet/mellanox/mlxsw/pci.c     |  2 +-
 .../ethernet/netronome/nfp/nfp_net_ethtool.c  |  2 +-
 drivers/pci/iov.c                             | 23 ++++---
 drivers/pci/pci-driver.c                      | 48 +++++++--------
 drivers/pci/pci.c                             | 10 ++--
 drivers/pci/pcie/err.c                        | 35 ++++++-----
 drivers/pci/xen-pcifront.c                    | 60 ++++++++-----------
 drivers/ssb/pcihost_wrapper.c                 |  7 ++-
 drivers/usb/host/xhci-pci.c                   |  3 +-
 include/linux/pci.h                           |  2 +-
 22 files changed, 145 insertions(+), 130 deletions(-)

Range-diff against v1:
1:  7d97605df363 = 1:  8ba6e9faa18c PCI: Simplify pci_device_remove()
2:  aec84c688d0f = 2:  d8a7dc52091f PCI: Drop useless check from pci_device_probe()
-:  ------------ > 3:  f4b78aa41776 xen/pci: Drop some checks that are always true
3:  e6f933f532c9 = 4:  50f3daa64170 PCI: Provide wrapper to access a pci_dev's bound driver
4:  d678a2924143 ! 5:  21cbd3f180a1 PCI: Adapt all code locations to not use struct pci_dev::driver directly
    @@ drivers/message/fusion/mptbase.c: mpt_device_driver_register(struct mpt_pci_driv
     -		id = ioc->pcidev->driver ?
     -		    ioc->pcidev->driver->id_table : NULL;
     +		struct pci_driver *pdrv = pci_driver_of_dev(ioc->pcidev);
    -+		id = pdrv ?  pdrv->id_table : NULL;
    ++		id = pdrv ? pdrv->id_table : NULL;
      		if (dd_cbfunc->probe)
      			dd_cbfunc->probe(ioc->pcidev, id);
      	 }
    @@ drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c: static void hns3_get_drvinfo
      	}
      
     -	strncpy(drvinfo->driver, h->pdev->driver->name,
    --		sizeof(drvinfo->driver));
    -+	strncpy(drvinfo->driver, pci_driver_of_dev(h->pdev)->name, sizeof(drvinfo->driver));
    ++	strncpy(drvinfo->driver, pci_driver_of_dev(h->pdev)->name,
    + 		sizeof(drvinfo->driver));
      	drvinfo->driver[sizeof(drvinfo->driver) - 1] = '\0';
      
    - 	strncpy(drvinfo->bus_info, pci_name(h->pdev),
     
      ## drivers/net/ethernet/marvell/prestera/prestera_pci.c ##
     @@ drivers/net/ethernet/marvell/prestera/prestera_pci.c: static int prestera_fw_load(struct prestera_fw *fw)
    @@ drivers/pci/xen-pcifront.c: static pci_ers_result_t pcifront_common_process(int
      
      	pcidev = pci_get_domain_bus_and_slot(domain, bus, devfn);
     -	if (!pcidev || !pcidev->driver) {
    -+	pdrv = pci_driver_of_dev(pcidev);
    -+	if (!pcidev || !pdrv) {
    ++	if (!pcidev || !(pdrv = pci_driver_of_dev(pcidev))) {
      		dev_err(&pdev->xdev->dev, "device or AER driver is NULL\n");
      		pci_dev_put(pcidev);
      		return result;
      	}
     -	pdrv = pcidev->driver;
      
    - 	if (pdrv) {
    - 		if (pdrv->err_handler && pdrv->err_handler->error_detected) {
    + 	if (pdrv->err_handler && pdrv->err_handler->error_detected) {
    + 		pci_dbg(pcidev, "trying to call AER service\n");
     
      ## drivers/ssb/pcihost_wrapper.c ##
     @@ drivers/ssb/pcihost_wrapper.c: static int ssb_pcihost_probe(struct pci_dev *dev,
    @@ drivers/ssb/pcihost_wrapper.c: static int ssb_pcihost_probe(struct pci_dev *dev,
      	name = dev_name(&dev->dev);
     -	if (dev->driver && dev->driver->name)
     -		name = dev->driver->name;
    -+	
    ++
     +	pdrv = pci_driver_of_dev(dev);
     +	if (pdrv && pdrv->name)
     +		name = pdrv->name;
5:  8c70ffd24380 ! 6:  02e6da6e5919 PCI: Drop duplicated tracking of a pci_dev's bound driver
    @@ Metadata
      ## Commit message ##
         PCI: Drop duplicated tracking of a pci_dev's bound driver
     
    +    Currently it's tracked twice which driver is bound to a given pci
    +    device. Now that all users of the pci specific one (struct
    +    pci_dev::driver) are updated to use an access macro
    +    (pci_driver_of_dev()), change the macro to use the information from the
    +    driver core and remove the driver member from struct pci_dev.
    +
         Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
     
      ## drivers/pci/pci-driver.c ##

base-commit: 2734d6c1b1a089fb593ef6a23d4b70903526fe0c
-- 
2.30.2

