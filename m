Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BA290644
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 18:57:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4698dQ0l0yzDrFP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2019 02:57:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="LJT+ElBP"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4698Tt4snpzDq6J
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2019 02:51:14 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 9CD5D42EDE;
 Fri, 16 Aug 2019 16:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1565974270; x=1567788671; bh=DAI3gRiSUwjuoITu07sLg9XHSeUz3NxP+X7
 I4SwWqEw=; b=LJT+ElBPPsS3Tz1AYyCgd29UF/orAeDovDCYJsxp5Hc4jIZDvSp
 QDY+e7yG6OUm6GaeJPPvmgCdTKVF2kp85VA/5xWbG/zWgohuonJI6kJzhvnvQOHh
 Mp3aH/bP5/EoQFEpaEt0YyghOmMMIJaGW84+RU+6pZOm/mb/3kUc3JaY=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eLmb1s1nUXNs; Fri, 16 Aug 2019 19:51:10 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id D7BF5412D2;
 Fri, 16 Aug 2019 19:51:08 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.60) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 16
 Aug 2019 19:51:08 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v5 01/23] PCI: Fix race condition in
 pci_enable/disable_device()
Date: Fri, 16 Aug 2019 19:50:39 +0300
Message-ID: <20190816165101.911-2-s.miroshnichenko@yadro.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190816165101.911-1-s.miroshnichenko@yadro.com>
References: <20190816165101.911-1-s.miroshnichenko@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.15.60]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: Marta Rybczynska <mrybczyn@kalray.eu>,
 Sergey Miroshnichenko <s.miroshnichenko@yadro.com>,
 Srinath Mannam <srinath.mannam@broadcom.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a yet another approach to fix an old [1-2] concurrency issue, when:
 - two or more devices are being hot-added into a bridge which was
   initially empty;
 - a bridge with two or more devices is being hot-added;
 - during boot, if BIOS/bootloader/firmware doesn't pre-enable bridges.

The problem is that a bridge is reported as enabled before the MEM/IO bits
are actually written to the PCI_COMMAND register, so another driver thread
starts memory requests through the not-yet-enabled bridge:

 CPU0                                        CPU1

 pci_enable_device_mem()                     pci_enable_device_mem()
   pci_enable_bridge()                         pci_enable_bridge()
     pci_is_enabled()
       return false;
     atomic_inc_return(enable_cnt)
     Start actual enabling the bridge
     ...                                         pci_is_enabled()
     ...                                           return true;
     ...                                     Start memory requests <-- FAIL
     ...
     Set the PCI_COMMAND_MEMORY bit <-- Must wait for this

Protect the pci_enable/disable_device() and pci_enable_bridge(), which is
similar to the previous solution from commit 40f11adc7cd9 ("PCI: Avoid race
while enabling upstream bridges"), but adding a per-device mutexes and
preventing the dev->enable_cnt from from incrementing early.

CC: Srinath Mannam <srinath.mannam@broadcom.com>
CC: Marta Rybczynska <mrybczyn@kalray.eu>
Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>

[1] https://lore.kernel.org/linux-pci/1501858648-22228-1-git-send-email-srinath.mannam@broadcom.com/T/#u
    [RFC PATCH v3] pci: Concurrency issue during pci enable bridge

[2] https://lore.kernel.org/linux-pci/744877924.5841545.1521630049567.JavaMail.zimbra@kalray.eu/T/#u
    [RFC PATCH] nvme: avoid race-conditions when enabling devices
---
 drivers/pci/pci.c   | 26 ++++++++++++++++++++++----
 drivers/pci/probe.c |  1 +
 include/linux/pci.h |  1 +
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 1b27b5af3d55..e7f8c354e644 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1645,6 +1645,8 @@ static void pci_enable_bridge(struct pci_dev *dev)
 	struct pci_dev *bridge;
 	int retval;
 
+	mutex_lock(&dev->enable_mutex);
+
 	bridge = pci_upstream_bridge(dev);
 	if (bridge)
 		pci_enable_bridge(bridge);
@@ -1652,6 +1654,7 @@ static void pci_enable_bridge(struct pci_dev *dev)
 	if (pci_is_enabled(dev)) {
 		if (!dev->is_busmaster)
 			pci_set_master(dev);
+		mutex_unlock(&dev->enable_mutex);
 		return;
 	}
 
@@ -1660,11 +1663,14 @@ static void pci_enable_bridge(struct pci_dev *dev)
 		pci_err(dev, "Error enabling bridge (%d), continuing\n",
 			retval);
 	pci_set_master(dev);
+	mutex_unlock(&dev->enable_mutex);
 }
 
 static int pci_enable_device_flags(struct pci_dev *dev, unsigned long flags)
 {
 	struct pci_dev *bridge;
+	/* Enable-locking of bridges is performed within the pci_enable_bridge() */
+	bool need_lock = !dev->subordinate;
 	int err;
 	int i, bars = 0;
 
@@ -1680,8 +1686,13 @@ static int pci_enable_device_flags(struct pci_dev *dev, unsigned long flags)
 		dev->current_state = (pmcsr & PCI_PM_CTRL_STATE_MASK);
 	}
 
-	if (atomic_inc_return(&dev->enable_cnt) > 1)
+	if (need_lock)
+		mutex_lock(&dev->enable_mutex);
+	if (pci_is_enabled(dev)) {
+		if (need_lock)
+			mutex_unlock(&dev->enable_mutex);
 		return 0;		/* already enabled */
+	}
 
 	bridge = pci_upstream_bridge(dev);
 	if (bridge)
@@ -1696,8 +1707,10 @@ static int pci_enable_device_flags(struct pci_dev *dev, unsigned long flags)
 			bars |= (1 << i);
 
 	err = do_pci_enable_device(dev, bars);
-	if (err < 0)
-		atomic_dec(&dev->enable_cnt);
+	if (err >= 0)
+		atomic_inc(&dev->enable_cnt);
+	if (need_lock)
+		mutex_unlock(&dev->enable_mutex);
 	return err;
 }
 
@@ -1941,15 +1954,20 @@ void pci_disable_device(struct pci_dev *dev)
 	if (dr)
 		dr->enabled = 0;
 
+	mutex_lock(&dev->enable_mutex);
 	dev_WARN_ONCE(&dev->dev, atomic_read(&dev->enable_cnt) <= 0,
 		      "disabling already-disabled device");
 
-	if (atomic_dec_return(&dev->enable_cnt) != 0)
+	if (atomic_dec_return(&dev->enable_cnt) != 0) {
+		mutex_unlock(&dev->enable_mutex);
 		return;
+	}
 
 	do_pci_disable_device(dev);
 
 	dev->is_busmaster = 0;
+
+	mutex_unlock(&dev->enable_mutex);
 }
 EXPORT_SYMBOL(pci_disable_device);
 
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index a3c7338fad86..2e58ece820e8 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2427,6 +2427,7 @@ struct pci_dev *pci_alloc_dev(struct pci_bus *bus)
 	INIT_LIST_HEAD(&dev->bus_list);
 	dev->dev.type = &pci_dev_type;
 	dev->bus = pci_bus_get(bus);
+	mutex_init(&dev->enable_mutex);
 
 	return dev;
 }
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 9e700d9f9f28..d3a72159722d 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -425,6 +425,7 @@ struct pci_dev {
 	unsigned int	no_vf_scan:1;		/* Don't scan for VFs after IOV enablement */
 	pci_dev_flags_t dev_flags;
 	atomic_t	enable_cnt;	/* pci_enable_device has been called */
+	struct mutex	enable_mutex;
 
 	u32		saved_config_space[16]; /* Config space saved at suspend time */
 	struct hlist_head saved_cap_space;
-- 
2.21.0

