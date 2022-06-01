Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D44B9539E95
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 09:41:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCh0V0mCFz3blC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 17:41:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j4c1tZLc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+0e8eff662a988215b893+6856+infradead.org+hch@bombadil.srs.infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j4c1tZLc;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCgzp5mBNz2yh9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 17:40:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=bSZC4FSJofuI+VV+ZJCRH6usaWL11Vlq3/ZzErlcnB4=; b=j4c1tZLc3QRl+M2NWB2i3JY0tZ
	L3damVHL7zlt6MRdnzb/+CF0VDbwjW4IDjWrYLqmw6L74rZt2VZ4DcVMTr62UcRnW6ZY4Km6YymjX
	G3RaD5SWNgPYoGwLYnL8aoyupFugP2br5FpbImVOkzCVmIubwkGjGm+WQNMG6A7c350FBmDTHYdTd
	QdJJ6qPNB1PTzvmp75dfEmGce2NDt30IqKX86j/1aLvuk6g8j7oPd2B6oUlezAsd5Cd4UFFnXWMQU
	kYNdsjI4VCkzspD7X7srymSzFBGjdBb+TS5a6WVKLQ7JadH40zZ9mTYCtvLyZOv/1ZokKbeqY7Paa
	pN3ia4tg==;
Received: from [2001:4bb8:185:a81e:471a:4927:bd2e:6050] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwIxu-00EQJW-JI; Wed, 01 Jun 2022 07:40:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: ruscur@russell.cc,
	oohall@gmail.com,
	bhelgaas@google.com
Subject: [PATCH] PCI/ERR: handle disconnected devices in report_error_detected
Date: Wed,  1 Jun 2022 09:40:24 +0200
Message-Id: <20220601074024.3481035-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: kbusch@kernel.org, linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a device is already unplugged by pciehp by the time that the AER
handler is invoked, the PCIe device will lready be in the
pci_channel_io_perm_failure state.  In that case we should simply
return PCI_ERS_RESULT_DISCONNECT instead of trying to do a state
transition that will fail.

Also untangle the state transition failure from the lack of methods to
improve the debugging output in case it will happen ever again.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/pci/pcie/err.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index 0c5a143025af4..59c90d04a609a 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -55,10 +55,14 @@ static int report_error_detected(struct pci_dev *dev,
 
 	device_lock(&dev->dev);
 	pdrv = dev->driver;
-	if (!pci_dev_set_io_state(dev, state) ||
-		!pdrv ||
-		!pdrv->err_handler ||
-		!pdrv->err_handler->error_detected) {
+	if (pci_dev_is_disconnected(dev)) {
+		vote = PCI_ERS_RESULT_DISCONNECT;
+	} else if (!pci_dev_set_io_state(dev, state)) {
+		pci_info(dev, "can't recover (state transition %u -> %u invalid)\n",
+			dev->error_state, state);
+		vote = PCI_ERS_RESULT_NONE;
+	} else if (!pdrv || !pdrv->err_handler ||
+		   !pdrv->err_handler->error_detected) {
 		/*
 		 * If any device in the subtree does not have an error_detected
 		 * callback, PCI_ERS_RESULT_NO_AER_DRIVER prevents subsequent
-- 
2.30.2

