Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A84F670C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Nov 2019 04:18:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 479fN46YyJzF3GL
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Nov 2019 14:18:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="IgFSrB+y"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 479dbG316nzF3xn
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Nov 2019 13:42:50 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EA54F21848;
 Sun, 10 Nov 2019 02:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573353767;
 bh=8GO4XkRygHmVTWKvH9SbwPX3T6ChRn2RDaOvhj0FWc0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IgFSrB+yh4W0GvXVRhb3f2yzSKXf7Yt61ofrKRC57OCrhkQjoOUwrIjaebs5nekhC
 fdsQsXOkTlQ4W2eBU2yastYGtG0osWFlJuWYDxquWZR9450hKxaWqWVwRD67Cq8/gD
 d88eo51RF2n3Q/b/ZP6Sw4korhj7n9pfpdxO1U7E=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 079/191] PCI/AER: Take reference on error devices
Date: Sat,  9 Nov 2019 21:38:21 -0500
Message-Id: <20191110024013.29782-79-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191110024013.29782-1-sashal@kernel.org>
References: <20191110024013.29782-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, linux-pci@vger.kernel.org,
 Sinan Kaya <okaya@kernel.org>, Keith Busch <keith.busch@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Keith Busch <keith.busch@intel.com>

[ Upstream commit 60271ab044a53edb9dcbe76bebea2221c4ff04d9 ]

Error handling may be running in parallel with a hot removal.  Reference
count the device during AER handling so the device can not be freed while
AER wants to reference it.

Signed-off-by: Keith Busch <keith.busch@intel.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Sinan Kaya <okaya@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pci/pcie/aer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 637d638f73da5..ffbbd759683c5 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -866,7 +866,7 @@ void cper_print_aer(struct pci_dev *dev, int aer_severity,
 static int add_error_device(struct aer_err_info *e_info, struct pci_dev *dev)
 {
 	if (e_info->error_dev_num < AER_MAX_MULTI_ERR_DEVICES) {
-		e_info->dev[e_info->error_dev_num] = dev;
+		e_info->dev[e_info->error_dev_num] = pci_dev_get(dev);
 		e_info->error_dev_num++;
 		return 0;
 	}
@@ -1013,6 +1013,7 @@ static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
 		pcie_do_nonfatal_recovery(dev);
 	else if (info->severity == AER_FATAL)
 		pcie_do_fatal_recovery(dev, PCIE_PORT_SERVICE_AER);
+	pci_dev_put(dev);
 }
 
 #ifdef CONFIG_ACPI_APEI_PCIEAER
-- 
2.20.1

