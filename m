Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1672A2620
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 20:36:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KBBy1GkgzDqvx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 04:36:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="YgnO7mN3"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46K9nk6JNczDrqZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 04:17:46 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D50922339E;
 Thu, 29 Aug 2019 18:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567102663;
 bh=gVurG7BIl7P94A8jKlwa4onRdMssNry3RH32zz0KsOU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YgnO7mN3d9Cx3RLLpu3uMmnJG6n2lHXQOuwwkyicvR5AuxmWdbvHB9ahGiz8dkF3i
 kfu/vjwXrISCOo6UGmYSOXGQ4wNTMwtYXIZdRNfaBKCmuWMSsYPyX+IQ/jpBDnIQfi
 0eETscgv0bsuaxvsPLSF6d42L76rLnDTh4hZuHsc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 04/16] ibmveth: Convert multicast list size for
 little-endian system
Date: Thu, 29 Aug 2019 14:17:22 -0400
Message-Id: <20190829181736.9040-4-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190829181736.9040-1-sashal@kernel.org>
References: <20190829181736.9040-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>,
 Jakub Kicinski <jakub.kicinski@netronome.com>, netdev@vger.kernel.org,
 Thomas Falcon <tlfalcon@linux.ibm.com>, Hangbin Liu <liuhangbin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Thomas Falcon <tlfalcon@linux.ibm.com>

[ Upstream commit 66cf4710b23ab2adda11155684a2c8826f4fe732 ]

The ibm,mac-address-filters property defines the maximum number of
addresses the hypervisor's multicast filter list can support. It is
encoded as a big-endian integer in the OF device tree, but the virtual
ethernet driver does not convert it for use by little-endian systems.
As a result, the driver is not behaving as it should on affected systems
when a large number of multicast addresses are assigned to the device.

Reported-by: Hangbin Liu <liuhangbin@gmail.com>
Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>
Signed-off-by: Jakub Kicinski <jakub.kicinski@netronome.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/ibm/ibmveth.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
index 955f658f3b65f..de9897c8e9331 100644
--- a/drivers/net/ethernet/ibm/ibmveth.c
+++ b/drivers/net/ethernet/ibm/ibmveth.c
@@ -1557,7 +1557,7 @@ static int ibmveth_probe(struct vio_dev *dev, const struct vio_device_id *id)
 	struct net_device *netdev;
 	struct ibmveth_adapter *adapter;
 	unsigned char *mac_addr_p;
-	unsigned int *mcastFilterSize_p;
+	__be32 *mcastFilterSize_p;
 	long ret;
 	unsigned long ret_attr;
 
@@ -1579,8 +1579,9 @@ static int ibmveth_probe(struct vio_dev *dev, const struct vio_device_id *id)
 		return -EINVAL;
 	}
 
-	mcastFilterSize_p = (unsigned int *)vio_get_attribute(dev,
-						VETH_MCAST_FILTER_SIZE, NULL);
+	mcastFilterSize_p = (__be32 *)vio_get_attribute(dev,
+							VETH_MCAST_FILTER_SIZE,
+							NULL);
 	if (!mcastFilterSize_p) {
 		dev_err(&dev->dev, "Can't find VETH_MCAST_FILTER_SIZE "
 			"attribute\n");
@@ -1597,7 +1598,7 @@ static int ibmveth_probe(struct vio_dev *dev, const struct vio_device_id *id)
 
 	adapter->vdev = dev;
 	adapter->netdev = netdev;
-	adapter->mcastFilterSize = *mcastFilterSize_p;
+	adapter->mcastFilterSize = be32_to_cpu(*mcastFilterSize_p);
 	adapter->pool_config = 0;
 
 	netif_napi_add(netdev, &adapter->napi, ibmveth_poll, 16);
-- 
2.20.1

