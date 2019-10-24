Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF03FE3AC2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 20:16:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zb6873ndzDqby
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 05:16:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="eG207hBf"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zYj81XbfzDqVq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 04:13:00 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id F03F6437F6;
 Thu, 24 Oct 2019 17:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1571937175; x=1573751576; bh=BvsEhzhdlSaFHugg08Hbv0nvpwWr5AVr2aa
 4bqlxehk=; b=eG207hBfekp7gIVP9tYX87mJmnN20Wm0vkPCRBxt1glvBS11Ef7
 ubY8GIY5QMUMG1rkl5/CZi+kgPZPLZ7aR83CFYrv5w1L8rgVE18h5WjSrC47J4rN
 XKQ383EPrB5beTrDQ/06vBUMP6kNVmRJQKPyLD/TaEanvVhn/LJcVSYk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l66uyQuYIjNe; Thu, 24 Oct 2019 20:12:55 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id D5A2443E10;
 Thu, 24 Oct 2019 20:12:44 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.136) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 24
 Oct 2019 20:12:44 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v6 27/30] nvme-pci: Handle movable BARs
Date: Thu, 24 Oct 2019 20:12:25 +0300
Message-ID: <20191024171228.877974-28-s.miroshnichenko@yadro.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024171228.877974-1-s.miroshnichenko@yadro.com>
References: <20191024171228.877974-1-s.miroshnichenko@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.15.136]
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
Cc: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-nvme@lists.infradead.org, linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hotplugged devices can affect the existing ones by moving their BARs. The
PCI subsystem will inform the NVME driver about this by invoking the
.rescan_prepare() and .rescan_done() hooks, so the BARs can by re-mapped.

Tested under the "randrw" mode of the fio tool. Before the hotplugging:

  % sudo cat /proc/iomem
  ...
                3fe800000000-3fe8007fffff : PCI Bus 0020:0b
                  3fe800000000-3fe8007fffff : PCI Bus 0020:18
                    3fe800000000-3fe8000fffff : 0020:18:00.0
                      3fe800000000-3fe8000fffff : nvme
                    3fe800100000-3fe80017ffff : 0020:18:00.0
  ...

, then another NVME drive was hot-added, so BARs of the 0020:18:00.0 are
moved:

  % sudo cat /proc/iomem
    ...
                3fe800000000-3fe800ffffff : PCI Bus 0020:0b
                  3fe800000000-3fe8007fffff : PCI Bus 0020:10
                    3fe800000000-3fe800003fff : 0020:10:00.0
                      3fe800000000-3fe800003fff : nvme
                    3fe800010000-3fe80001ffff : 0020:10:00.0
                  3fe800800000-3fe800ffffff : PCI Bus 0020:18
                    3fe800800000-3fe8008fffff : 0020:18:00.0
                      3fe800800000-3fe8008fffff : nvme
                    3fe800900000-3fe80097ffff : 0020:18:00.0
    ...

During the rescanning, both READ and WRITE speeds drop to zero for a while
due to driver's pause, then restore.

Also tested with an NVME as a system drive.

Cc: linux-nvme@lists.infradead.org
Cc: Christoph Hellwig <hch@lst.de>
Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
---
 drivers/nvme/host/pci.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 869f462e6b6e..5f162ea5a5f1 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -1650,7 +1650,7 @@ static int nvme_remap_bar(struct nvme_dev *dev, unsigned long size)
 {
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
-	if (size <= dev->bar_mapped_size)
+	if (dev->bar && size <= dev->bar_mapped_size)
 		return 0;
 	if (size > pci_resource_len(pdev, 0))
 		return -ENOMEM;
@@ -3059,6 +3059,23 @@ static void nvme_error_resume(struct pci_dev *pdev)
 	flush_work(&dev->ctrl.reset_work);
 }
 
+static void nvme_rescan_prepare(struct pci_dev *pdev)
+{
+	struct nvme_dev *dev = pci_get_drvdata(pdev);
+
+	nvme_dev_disable(dev, false);
+	nvme_dev_unmap(dev);
+	dev->bar = NULL;
+}
+
+static void nvme_rescan_done(struct pci_dev *pdev)
+{
+	struct nvme_dev *dev = pci_get_drvdata(pdev);
+
+	nvme_dev_map(dev);
+	nvme_reset_ctrl_sync(&dev->ctrl);
+}
+
 static const struct pci_error_handlers nvme_err_handler = {
 	.error_detected	= nvme_error_detected,
 	.slot_reset	= nvme_slot_reset,
@@ -3135,6 +3152,8 @@ static struct pci_driver nvme_driver = {
 #endif
 	.sriov_configure = pci_sriov_configure_simple,
 	.err_handler	= &nvme_err_handler,
+	.rescan_prepare	= nvme_rescan_prepare,
+	.rescan_done	= nvme_rescan_done,
 };
 
 static int __init nvme_init(void)
-- 
2.23.0

