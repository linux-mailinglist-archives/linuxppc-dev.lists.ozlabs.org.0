Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1829B15F0A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 18:56:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K1K150RGzDqQL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 04:56:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=L7LhNgIG; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JyyY6g8XzDqHv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 03:10:13 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3ECA02468E;
 Fri, 14 Feb 2020 16:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696611;
 bh=ONxDg8UBSF0eZbElzoFn8SmqwlRSm4oFuWTBHP90bZ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L7LhNgIGUJaCufgKXjtk/q4x7Dn2JMm77Bx9bBkD9IWXV6I8X24sTELRau92EQ4c0
 51+KDzeH+uQxEGesWFRUjz6Nm3FADv75xtwULQvuGn+k2ZoEq/bGVW12pUGAmxbA+b
 /23X90yo1v9+HgLL5ob7s+yC3HVIzs79adGqouA8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 394/459] PCI/AER: Initialize aer_fifo
Date: Fri, 14 Feb 2020 11:00:44 -0500
Message-Id: <20200214160149.11681-394-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, Sasha Levin <sashal@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Dongdong Liu <liudongdong3@huawei.com>,
 linux-pci@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Dongdong Liu <liudongdong3@huawei.com>

[ Upstream commit d95f20c4f07020ebc605f3b46af4b6db9eb5fc99 ]

Previously we did not call INIT_KFIFO() for aer_fifo.  This leads to
kfifo_put() sometimes returning 0 (queue full) when in fact it is not.

It is easy to reproduce the problem by using aer-inject:

  $ aer-inject -s :82:00.0 multiple-corr-nonfatal

The content of the multiple-corr-nonfatal file is as below:

  AER
  COR RCVR
  HL 0 1 2 3
  AER
  UNCOR POISON_TLP
  HL 4 5 6 7

Fixes: 27c1ce8bbed7 ("PCI/AER: Use kfifo for tracking events instead of reimplementing it")
Link: https://lore.kernel.org/r/1579767991-103898-1-git-send-email-liudongdong3@huawei.com
Signed-off-by: Dongdong Liu <liudongdong3@huawei.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pci/pcie/aer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index b45bc47d04fe4..271aecfbc3bf3 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1387,6 +1387,7 @@ static int aer_probe(struct pcie_device *dev)
 		return -ENOMEM;
 
 	rpc->rpd = port;
+	INIT_KFIFO(rpc->aer_fifo);
 	set_service_data(dev, rpc);
 
 	status = devm_request_threaded_irq(device, dev->irq, aer_irq, aer_isr,
-- 
2.20.1

