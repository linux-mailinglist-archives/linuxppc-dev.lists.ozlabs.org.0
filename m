Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AA541C11E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 10:55:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HK9Dy3j2bz3cCY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 18:55:14 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HK9DT3LCqz3c5s
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 18:54:49 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mVVL6-0001jM-6d; Wed, 29 Sep 2021 10:53:20 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mVVL4-0004gO-VW; Wed, 29 Sep 2021 10:53:18 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mVVL3-0000RO-SQ; Wed, 29 Sep 2021 10:53:17 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH v5 10/11] PCI: Replace pci_dev::driver usage by
 pci_dev::dev.driver
Date: Wed, 29 Sep 2021 10:53:05 +0200
Message-Id: <20210929085306.2203850-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210929085306.2203850-1-u.kleine-koenig@pengutronix.de>
References: <20210929085306.2203850-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=/pZgVMb346xYWFyKXoYzQiwqLbFb4Qw5wqFIqjkKa+4=;
 m=FyMqGYUG+9Ut7bWwCBeeUgHOxoK/KbMAjt+cyx+MULA=;
 p=7uJBwDup3eOXFa/jaxic6at398GqkPM+jAglE1o0ido=;
 g=d846534d35b8420e8bfb08112981cf20b1b1fab2
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFUKWMACgkQwfwUeK3K7AmtpggAmyR
 6rO1OqNj4Fquhf8pUeQsYWPCNyaSBg+ipgJHefnapmLAKQVspu/dH/PC55+8isG9gHDw/cc2aZGT8
 XD7Ez6VRDOV8ryX2WGNNU4Hy5D5TzpGmHWt6tWKJzvQ0MGyFHZuHYguOR+PGGyw8BGGQNYCQLqVrJ
 9sdmFeHKuAL0gwF6ePXdUaBNPcRNub3BEpt4IhiDwL57NELfETNaCvcCh1qZR9CtNrrLDG6JtCEXq
 3voBvjuH9ajF8bZvq3Cjf8S5ZJ+/RCab6EtFb3jgLednPhUmO4kvRzYD7Bqoi0yIMCcUKwTAxnVJc
 jbe8dIQIb17LLK3TWwX+zPegpmSeziQ==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Oliver O'Halloran <oohall@gmail.com>,
 Jiri Olsa <jolsa@redhat.com>, Christoph Hellwig <hch@lst.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Mathias Nyman <mathias.nyman@intel.com>, x86@kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Namhyung Kim <namhyung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-perf-users@vger.kernel.org, kernel@pengutronix.de,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

struct pci_dev::driver contains (apart from a constant offset) the same
data as struct pci_dev::dev->driver. Replace all remaining users of the
former pointer by the latter to allow removing the former.

Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/powerpc/kernel/eeh_driver.c | 10 ++++-----
 arch/x86/events/intel/uncore.c   |  2 +-
 arch/x86/kernel/probe_roms.c     |  2 +-
 drivers/misc/cxl/guest.c         | 24 ++++++++++++---------
 drivers/misc/cxl/pci.c           | 30 ++++++++++++++++----------
 drivers/pci/iov.c                | 25 ++++++++++++++--------
 drivers/pci/pci-driver.c         | 25 +++++++++++-----------
 drivers/pci/pci.c                |  4 ++--
 drivers/pci/pcie/err.c           | 36 ++++++++++++++++++--------------
 drivers/pci/xen-pcifront.c       |  4 ++--
 drivers/usb/host/xhci-pci.c      |  2 +-
 11 files changed, 93 insertions(+), 71 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 3eff6a4888e7..350dab18e137 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -104,13 +104,13 @@ static bool eeh_edev_actionable(struct eeh_dev *edev)
  */
 static inline struct pci_driver *eeh_pcid_get(struct pci_dev *pdev)
 {
-	if (!pdev || !pdev->driver)
+	if (!pdev || !pdev->dev.driver)
 		return NULL;
 
-	if (!try_module_get(pdev->driver->driver.owner))
+	if (!try_module_get(pdev->dev.driver->owner))
 		return NULL;
 
-	return pdev->driver;
+	return to_pci_driver(pdev->dev.driver);
 }
 
 /**
@@ -122,10 +122,10 @@ static inline struct pci_driver *eeh_pcid_get(struct pci_dev *pdev)
  */
 static inline void eeh_pcid_put(struct pci_dev *pdev)
 {
-	if (!pdev || !pdev->driver)
+	if (!pdev || !pdev->dev.driver)
 		return;
 
-	module_put(pdev->driver->driver.owner);
+	module_put(pdev->dev.driver->owner);
 }
 
 /**
diff --git a/arch/x86/events/intel/uncore.c b/arch/x86/events/intel/uncore.c
index c72e368dd164..f1ba6ab2e97e 100644
--- a/arch/x86/events/intel/uncore.c
+++ b/arch/x86/events/intel/uncore.c
@@ -1187,7 +1187,7 @@ static int uncore_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id
 	 * PCI slot and func to indicate the uncore box.
 	 */
 	if (id->driver_data & ~0xffff) {
-		struct pci_driver *pci_drv = pdev->driver;
+		struct pci_driver *pci_drv = to_pci_driver(pdev->dev.driver);
 
 		pmu = uncore_pci_find_dev_pmu(pdev, pci_drv->id_table);
 		if (pmu == NULL)
diff --git a/arch/x86/kernel/probe_roms.c b/arch/x86/kernel/probe_roms.c
index 9e1def3744f2..36e84d904260 100644
--- a/arch/x86/kernel/probe_roms.c
+++ b/arch/x86/kernel/probe_roms.c
@@ -80,7 +80,7 @@ static struct resource video_rom_resource = {
  */
 static bool match_id(struct pci_dev *pdev, unsigned short vendor, unsigned short device)
 {
-	struct pci_driver *drv = pdev->driver;
+	struct pci_driver *drv = to_pci_driver(pdev->dev.driver);
 	const struct pci_device_id *id;
 
 	if (pdev->vendor == vendor && pdev->device == device)
diff --git a/drivers/misc/cxl/guest.c b/drivers/misc/cxl/guest.c
index 186308f1f8eb..d997c9c3ebb5 100644
--- a/drivers/misc/cxl/guest.c
+++ b/drivers/misc/cxl/guest.c
@@ -25,28 +25,32 @@ static void pci_error_handlers(struct cxl_afu *afu,
 		return;
 
 	list_for_each_entry(afu_dev, &afu->phb->bus->devices, bus_list) {
-		if (!afu_dev->driver)
+		struct pci_driver *afu_drv;
+
+		if (!afu_dev->dev.driver)
 			continue;
 
+		afu_drv = to_pci_driver(afu_dev->dev.driver);
+
 		switch (bus_error_event) {
 		case CXL_ERROR_DETECTED_EVENT:
 			afu_dev->error_state = state;
 
-			if (afu_dev->driver->err_handler &&
-			    afu_dev->driver->err_handler->error_detected)
-				afu_dev->driver->err_handler->error_detected(afu_dev, state);
+			if (afu_drv->err_handler &&
+			    afu_drv->err_handler->error_detected)
+				afu_drv->err_handler->error_detected(afu_dev, state);
 		break;
 		case CXL_SLOT_RESET_EVENT:
 			afu_dev->error_state = state;
 
-			if (afu_dev->driver->err_handler &&
-			    afu_dev->driver->err_handler->slot_reset)
-				afu_dev->driver->err_handler->slot_reset(afu_dev);
+			if (afu_drv->err_handler &&
+			    afu_drv->err_handler->slot_reset)
+				afu_drv->err_handler->slot_reset(afu_dev);
 		break;
 		case CXL_RESUME_EVENT:
-			if (afu_dev->driver->err_handler &&
-			    afu_dev->driver->err_handler->resume)
-				afu_dev->driver->err_handler->resume(afu_dev);
+			if (afu_drv->err_handler &&
+			    afu_drv->err_handler->resume)
+				afu_drv->err_handler->resume(afu_dev);
 		break;
 		}
 	}
diff --git a/drivers/misc/cxl/pci.c b/drivers/misc/cxl/pci.c
index 2ba899f5659f..7e7545d01e27 100644
--- a/drivers/misc/cxl/pci.c
+++ b/drivers/misc/cxl/pci.c
@@ -1805,14 +1805,16 @@ static pci_ers_result_t cxl_vphb_error_detected(struct cxl_afu *afu,
 		return result;
 
 	list_for_each_entry(afu_dev, &afu->phb->bus->devices, bus_list) {
-		if (!afu_dev->driver)
+		struct pci_driver *afu_drv;
+		if (!afu_dev->dev.driver)
 			continue;
 
+		afu_drv = to_pci_driver(afu_dev->dev.driver);
+
 		afu_dev->error_state = state;
 
-		if (afu_dev->driver->err_handler)
-			afu_result = afu_dev->driver->err_handler->error_detected(afu_dev,
-										  state);
+		if (afu_drv->err_handler)
+			afu_result = afu_drv->err_handler->error_detected(afu_dev, state);
 		/* Disconnect trumps all, NONE trumps NEED_RESET */
 		if (afu_result == PCI_ERS_RESULT_DISCONNECT)
 			result = PCI_ERS_RESULT_DISCONNECT;
@@ -2003,6 +2005,8 @@ static pci_ers_result_t cxl_pci_slot_reset(struct pci_dev *pdev)
 			continue;
 
 		list_for_each_entry(afu_dev, &afu->phb->bus->devices, bus_list) {
+			struct pci_driver *afu_drv;
+
 			/* Reset the device context.
 			 * TODO: make this less disruptive
 			 */
@@ -2028,12 +2032,14 @@ static pci_ers_result_t cxl_pci_slot_reset(struct pci_dev *pdev)
 			 * shouldn't start new work until we call
 			 * their resume function.
 			 */
-			if (!afu_dev->driver)
+			if (!afu_dev->dev.driver)
 				continue;
 
-			if (afu_dev->driver->err_handler &&
-			    afu_dev->driver->err_handler->slot_reset)
-				afu_result = afu_dev->driver->err_handler->slot_reset(afu_dev);
+			afu_drv = to_pci_driver(afu_dev->dev.driver);
+
+			if (afu_drv->err_handler &&
+			    afu_drv->err_handler->slot_reset)
+				afu_result = afu_drv->err_handler->slot_reset(afu_dev);
 
 			if (afu_result == PCI_ERS_RESULT_DISCONNECT)
 				result = PCI_ERS_RESULT_DISCONNECT;
@@ -2074,9 +2080,11 @@ static void cxl_pci_resume(struct pci_dev *pdev)
 			continue;
 
 		list_for_each_entry(afu_dev, &afu->phb->bus->devices, bus_list) {
-			if (afu_dev->driver && afu_dev->driver->err_handler &&
-			    afu_dev->driver->err_handler->resume)
-				afu_dev->driver->err_handler->resume(afu_dev);
+			struct pci_driver *afu_drv;
+			if (afu_dev->dev.driver &&
+			    (afu_drv = to_pci_driver(afu_dev->dev.driver))->err_handler &&
+			    afu_drv->err_handler->resume)
+				afu_drv->err_handler->resume(afu_dev);
 		}
 	}
 	spin_unlock(&adapter->afu_list_lock);
diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index dafdc652fcd0..f94660927544 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -164,13 +164,15 @@ static ssize_t sriov_vf_total_msix_show(struct device *dev,
 					char *buf)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
+	struct pci_driver *pdrv;
 	u32 vf_total_msix = 0;
 
 	device_lock(dev);
-	if (!pdev->driver || !pdev->driver->sriov_get_vf_total_msix)
+	pdrv = to_pci_driver(dev->driver);
+	if (!pdrv || !pdrv->sriov_get_vf_total_msix)
 		goto unlock;
 
-	vf_total_msix = pdev->driver->sriov_get_vf_total_msix(pdev);
+	vf_total_msix = pdrv->sriov_get_vf_total_msix(pdev);
 unlock:
 	device_unlock(dev);
 	return sysfs_emit(buf, "%u\n", vf_total_msix);
@@ -183,6 +185,7 @@ static ssize_t sriov_vf_msix_count_store(struct device *dev,
 {
 	struct pci_dev *vf_dev = to_pci_dev(dev);
 	struct pci_dev *pdev = pci_physfn(vf_dev);
+	struct pci_driver *pdrv;
 	int val, ret;
 
 	ret = kstrtoint(buf, 0, &val);
@@ -193,13 +196,14 @@ static ssize_t sriov_vf_msix_count_store(struct device *dev,
 		return -EINVAL;
 
 	device_lock(&pdev->dev);
-	if (!pdev->driver || !pdev->driver->sriov_set_msix_vec_count) {
+	pdrv = to_pci_driver(pdev->dev.driver);
+	if (!pdrv || !pdrv->sriov_set_msix_vec_count) {
 		ret = -EOPNOTSUPP;
 		goto err_pdev;
 	}
 
 	device_lock(&vf_dev->dev);
-	if (vf_dev->driver) {
+	if (vf_dev->dev.driver) {
 		/*
 		 * A driver is already attached to this VF and has configured
 		 * itself based on the current MSI-X vector count. Changing
@@ -209,7 +213,7 @@ static ssize_t sriov_vf_msix_count_store(struct device *dev,
 		goto err_dev;
 	}
 
-	ret = pdev->driver->sriov_set_msix_vec_count(vf_dev, val);
+	ret = pdrv->sriov_set_msix_vec_count(vf_dev, val);
 
 err_dev:
 	device_unlock(&vf_dev->dev);
@@ -376,6 +380,7 @@ static ssize_t sriov_numvfs_store(struct device *dev,
 				  const char *buf, size_t count)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
+	struct pci_driver *pdrv;
 	int ret;
 	u16 num_vfs;
 
@@ -392,14 +397,16 @@ static ssize_t sriov_numvfs_store(struct device *dev,
 		goto exit;
 
 	/* is PF driver loaded */
-	if (!pdev->driver) {
+	if (!pdev->dev.driver) {
 		pci_info(pdev, "no driver bound to device; cannot configure SR-IOV\n");
 		ret = -ENOENT;
 		goto exit;
 	}
 
+	pdrv = to_pci_driver(pdev->dev.driver);
+
 	/* is PF driver loaded w/callback */
-	if (!pdev->driver->sriov_configure) {
+	if (!pdrv->sriov_configure) {
 		pci_info(pdev, "driver does not support SR-IOV configuration via sysfs\n");
 		ret = -ENOENT;
 		goto exit;
@@ -407,7 +414,7 @@ static ssize_t sriov_numvfs_store(struct device *dev,
 
 	if (num_vfs == 0) {
 		/* disable VFs */
-		ret = pdev->driver->sriov_configure(pdev, 0);
+		ret = pdrv->sriov_configure(pdev, 0);
 		goto exit;
 	}
 
@@ -419,7 +426,7 @@ static ssize_t sriov_numvfs_store(struct device *dev,
 		goto exit;
 	}
 
-	ret = pdev->driver->sriov_configure(pdev, num_vfs);
+	ret = pdrv->sriov_configure(pdev, num_vfs);
 	if (ret < 0)
 		goto exit;
 
diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index 50449ec622a3..4d20022b8631 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -457,7 +457,7 @@ static int pci_device_probe(struct device *dev)
 static void pci_device_remove(struct device *dev)
 {
 	struct pci_dev *pci_dev = to_pci_dev(dev);
-	struct pci_driver *drv = pci_dev->driver;
+	struct pci_driver *drv = to_pci_driver(pci_dev->dev.driver);
 
 	if (drv->remove) {
 		pm_runtime_get_sync(dev);
@@ -493,7 +493,7 @@ static void pci_device_remove(struct device *dev)
 static void pci_device_shutdown(struct device *dev)
 {
 	struct pci_dev *pci_dev = to_pci_dev(dev);
-	struct pci_driver *drv = pci_dev->driver;
+	struct pci_driver *drv = to_pci_driver(pci_dev->dev.driver);
 
 	pm_runtime_resume(dev);
 
@@ -589,7 +589,7 @@ static int pci_pm_reenable_device(struct pci_dev *pci_dev)
 static int pci_legacy_suspend(struct device *dev, pm_message_t state)
 {
 	struct pci_dev *pci_dev = to_pci_dev(dev);
-	struct pci_driver *drv = pci_dev->driver;
+	struct pci_driver *drv = to_pci_driver(dev->driver);
 
 	if (drv && drv->suspend) {
 		pci_power_t prev = pci_dev->current_state;
@@ -630,7 +630,7 @@ static int pci_legacy_suspend_late(struct device *dev, pm_message_t state)
 static int pci_legacy_resume(struct device *dev)
 {
 	struct pci_dev *pci_dev = to_pci_dev(dev);
-	struct pci_driver *drv = pci_dev->driver;
+	struct pci_driver *drv = to_pci_driver(pci_dev->dev.driver);
 
 	pci_fixup_device(pci_fixup_resume, pci_dev);
 
@@ -649,7 +649,7 @@ static void pci_pm_default_suspend(struct pci_dev *pci_dev)
 
 static bool pci_has_legacy_pm_support(struct pci_dev *pci_dev)
 {
-	struct pci_driver *drv = pci_dev->driver;
+	struct pci_driver *drv = to_pci_driver(pci_dev->dev.driver);
 	bool ret = drv && (drv->suspend || drv->resume);
 
 	/*
@@ -1242,11 +1242,11 @@ static int pci_pm_runtime_suspend(struct device *dev)
 	int error;
 
 	/*
-	 * If pci_dev->driver is not set (unbound), we leave the device in D0,
+	 * If pci_dev->dev.driver is not set (unbound), we leave the device in D0,
 	 * but it may go to D3cold when the bridge above it runtime suspends.
 	 * Save its config space in case that happens.
 	 */
-	if (!pci_dev->driver) {
+	if (!pci_dev->dev.driver) {
 		pci_save_state(pci_dev);
 		return 0;
 	}
@@ -1303,7 +1303,7 @@ static int pci_pm_runtime_resume(struct device *dev)
 	 */
 	pci_restore_standard_config(pci_dev);
 
-	if (!pci_dev->driver)
+	if (!dev->driver)
 		return 0;
 
 	pci_fixup_device(pci_fixup_resume_early, pci_dev);
@@ -1322,14 +1322,13 @@ static int pci_pm_runtime_resume(struct device *dev)
 
 static int pci_pm_runtime_idle(struct device *dev)
 {
-	struct pci_dev *pci_dev = to_pci_dev(dev);
 	const struct dev_pm_ops *pm = dev->driver ? dev->driver->pm : NULL;
 
 	/*
-	 * If pci_dev->driver is not set (unbound), the device should
+	 * If dev->driver is not set (unbound), the device should
 	 * always remain in D0 regardless of the runtime PM status
 	 */
-	if (!pci_dev->driver)
+	if (!dev->driver)
 		return 0;
 
 	if (!pm)
@@ -1436,8 +1435,8 @@ static struct pci_driver pci_compat_driver = {
  */
 struct pci_driver *pci_dev_driver(const struct pci_dev *dev)
 {
-	if (dev->driver)
-		return dev->driver;
+	if (dev->dev.driver)
+		return to_pci_driver(dev->dev.driver);
 	else {
 		int i;
 		for (i = 0; i <= PCI_ROM_RESOURCE; i++)
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index ce2ab62b64cf..ccecf740de59 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -5089,7 +5089,7 @@ EXPORT_SYMBOL_GPL(pci_dev_unlock);
 static void pci_dev_save_and_disable(struct pci_dev *dev)
 {
 	const struct pci_error_handlers *err_handler =
-			dev->driver ? dev->driver->err_handler : NULL;
+			dev->dev.driver ? to_pci_driver(dev->dev.driver)->err_handler : NULL;
 
 	/*
 	 * dev->driver->err_handler->reset_prepare() is protected against
@@ -5120,7 +5120,7 @@ static void pci_dev_save_and_disable(struct pci_dev *dev)
 static void pci_dev_restore(struct pci_dev *dev)
 {
 	const struct pci_error_handlers *err_handler =
-			dev->driver ? dev->driver->err_handler : NULL;
+			dev->dev.driver ? to_pci_driver(dev->dev.driver)->err_handler : NULL;
 
 	pci_restore_state(dev);
 
diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index b576aa890c76..b314b54f7821 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -49,14 +49,15 @@ static int report_error_detected(struct pci_dev *dev,
 				 pci_channel_state_t state,
 				 enum pci_ers_result *result)
 {
+	struct pci_driver *pdrv;
 	pci_ers_result_t vote;
 	const struct pci_error_handlers *err_handler;
 
 	device_lock(&dev->dev);
 	if (!pci_dev_set_io_state(dev, state) ||
-		!dev->driver ||
-		!dev->driver->err_handler ||
-		!dev->driver->err_handler->error_detected) {
+		!dev->dev.driver ||
+		!(pdrv = to_pci_driver(dev->dev.driver))->err_handler ||
+		!pdrv->err_handler->error_detected) {
 		/*
 		 * If any device in the subtree does not have an error_detected
 		 * callback, PCI_ERS_RESULT_NO_AER_DRIVER prevents subsequent
@@ -70,7 +71,7 @@ static int report_error_detected(struct pci_dev *dev,
 			vote = PCI_ERS_RESULT_NONE;
 		}
 	} else {
-		err_handler = dev->driver->err_handler;
+		err_handler = pdrv->err_handler;
 		vote = err_handler->error_detected(dev, state);
 	}
 	pci_uevent_ers(dev, vote);
@@ -92,15 +93,16 @@ static int report_normal_detected(struct pci_dev *dev, void *data)
 static int report_mmio_enabled(struct pci_dev *dev, void *data)
 {
 	pci_ers_result_t vote, *result = data;
+	struct pci_driver *pdrv;
 	const struct pci_error_handlers *err_handler;
 
 	device_lock(&dev->dev);
-	if (!dev->driver ||
-		!dev->driver->err_handler ||
-		!dev->driver->err_handler->mmio_enabled)
+	if (!dev->dev.driver ||
+		!(pdrv = to_pci_driver(dev->dev.driver))->err_handler ||
+		!pdrv->err_handler->mmio_enabled)
 		goto out;
 
-	err_handler = dev->driver->err_handler;
+	err_handler = pdrv->err_handler;
 	vote = err_handler->mmio_enabled(dev);
 	*result = merge_result(*result, vote);
 out:
@@ -112,14 +114,15 @@ static int report_slot_reset(struct pci_dev *dev, void *data)
 {
 	pci_ers_result_t vote, *result = data;
 	const struct pci_error_handlers *err_handler;
+	struct pci_driver *pdrv;
 
 	device_lock(&dev->dev);
-	if (!dev->driver ||
-		!dev->driver->err_handler ||
-		!dev->driver->err_handler->slot_reset)
+	if (!dev->dev.driver ||
+		!(pdrv = to_pci_driver(dev->dev.driver))->err_handler ||
+		!pdrv->err_handler->slot_reset)
 		goto out;
 
-	err_handler = dev->driver->err_handler;
+	err_handler = pdrv->err_handler;
 	vote = err_handler->slot_reset(dev);
 	*result = merge_result(*result, vote);
 out:
@@ -130,15 +133,16 @@ static int report_slot_reset(struct pci_dev *dev, void *data)
 static int report_resume(struct pci_dev *dev, void *data)
 {
 	const struct pci_error_handlers *err_handler;
+	struct pci_driver *pdrv;
 
 	device_lock(&dev->dev);
 	if (!pci_dev_set_io_state(dev, pci_channel_io_normal) ||
-		!dev->driver ||
-		!dev->driver->err_handler ||
-		!dev->driver->err_handler->resume)
+		!dev->dev.driver ||
+		!(pdrv = to_pci_driver(dev->dev.driver))->err_handler ||
+		!pdrv->err_handler->resume)
 		goto out;
 
-	err_handler = dev->driver->err_handler;
+	err_handler = pdrv->err_handler;
 	err_handler->resume(dev);
 out:
 	pci_uevent_ers(dev, PCI_ERS_RESULT_RECOVERED);
diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
index f2d7f70a7a10..73831fb87a1e 100644
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -601,12 +601,12 @@ static pci_ers_result_t pcifront_common_process(int cmd,
 	result = PCI_ERS_RESULT_NONE;
 
 	pcidev = pci_get_domain_bus_and_slot(domain, bus, devfn);
-	if (!pcidev || !pcidev->driver) {
+	if (!pcidev || !pcidev->dev.driver) {
 		dev_err(&pdev->xdev->dev, "device or AER driver is NULL\n");
 		pci_dev_put(pcidev);
 		return result;
 	}
-	pdrv = pcidev->driver;
+	pdrv = to_pci_driver(pcidev->dev.driver);
 
 	if (pdrv->err_handler && pdrv->err_handler->error_detected) {
 		pci_dbg(pcidev, "trying to call AER service\n");
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 2c9f25ca8edd..2f4729f4f1e0 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -103,7 +103,7 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	struct xhci_driver_data         *driver_data;
 	const struct pci_device_id      *id;
 
-	id = pci_match_id(pdev->driver->id_table, pdev);
+	id = pci_match_id(to_pci_driver(pdev->dev.driver)->id_table, pdev);
 
 	if (id && id->driver_data) {
 		driver_data = (struct xhci_driver_data *)id->driver_data;
-- 
2.30.2

