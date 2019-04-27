Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 530B3B30A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 09:16:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rj066KJGzDqS0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 17:16:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=laurentiu.tudor@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rhsF5W95zDqWn
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 17:10:40 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A964820005D;
 Sat, 27 Apr 2019 09:10:37 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 99BD7200055;
 Sat, 27 Apr 2019 09:10:37 +0200 (CEST)
Received: from fsr-ub1864-101.ea.freescale.net
 (fsr-ub1864-101.ea.freescale.net [10.171.82.13])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 19B0A205ED;
 Sat, 27 Apr 2019 09:10:37 +0200 (CEST)
From: laurentiu.tudor@nxp.com
To: netdev@vger.kernel.org, madalin.bucur@nxp.com, roy.pledge@nxp.com,
 camelia.groza@nxp.com, leoyang.li@nxp.com
Subject: [PATCH v2 4/9] fsl/fman: add API to get the device behind a fman port
Date: Sat, 27 Apr 2019 10:10:26 +0300
Message-Id: <20190427071031.6563-5-laurentiu.tudor@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190427071031.6563-1-laurentiu.tudor@nxp.com>
References: <20190427071031.6563-1-laurentiu.tudor@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Laurentiu Tudor <laurentiu.tudor@nxp.com>

Add an API that retrieves the 'struct device' that the specified fman
port probed against. The new API will be used in a subsequent iommu
enablement related patch.

Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Acked-by: Madalin Bucur <madalin.bucur@nxp.com>
---
 drivers/net/ethernet/freescale/fman/fman_port.c | 14 ++++++++++++++
 drivers/net/ethernet/freescale/fman/fman_port.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/net/ethernet/freescale/fman/fman_port.c b/drivers/net/ethernet/freescale/fman/fman_port.c
index ee82ee1384eb..bd76c9730692 100644
--- a/drivers/net/ethernet/freescale/fman/fman_port.c
+++ b/drivers/net/ethernet/freescale/fman/fman_port.c
@@ -1728,6 +1728,20 @@ u32 fman_port_get_qman_channel_id(struct fman_port *port)
 }
 EXPORT_SYMBOL(fman_port_get_qman_channel_id);
 
+/**
+ * fman_port_get_device
+ * port:	Pointer to the FMan port device
+ *
+ * Get the 'struct device' associated to the specified FMan port device
+ *
+ * Return: pointer to associated 'struct device'
+ */
+struct device *fman_port_get_device(struct fman_port *port)
+{
+	return port->dev;
+}
+EXPORT_SYMBOL(fman_port_get_device);
+
 int fman_port_get_hash_result_offset(struct fman_port *port, u32 *offset)
 {
 	if (port->buffer_offsets.hash_result_offset == ILLEGAL_BASE)
diff --git a/drivers/net/ethernet/freescale/fman/fman_port.h b/drivers/net/ethernet/freescale/fman/fman_port.h
index 9dbb69f40121..82f12661a46d 100644
--- a/drivers/net/ethernet/freescale/fman/fman_port.h
+++ b/drivers/net/ethernet/freescale/fman/fman_port.h
@@ -157,4 +157,6 @@ int fman_port_get_tstamp(struct fman_port *port, const void *data, u64 *tstamp);
 
 struct fman_port *fman_port_bind(struct device *dev);
 
+struct device *fman_port_get_device(struct fman_port *port);
+
 #endif /* __FMAN_PORT_H */
-- 
2.17.1

