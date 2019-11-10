Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAA9F670D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Nov 2019 04:21:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 479fRm1jRFzF6P9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Nov 2019 14:21:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="u6I/M2HC"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 479dbG5HMDzF3y0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Nov 2019 13:42:50 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B5DF21655;
 Sun, 10 Nov 2019 02:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573353769;
 bh=AaJ/mLERXI2BGShxQaRJWcyC7zaq2lLv8vFC69G+pfw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u6I/M2HCzhECfnvb54W8gn3qSm8JtGPXKY2Ma6XPbmHaau5ndejYWVvgv1V1oH3tF
 JoAal4m1aw5OqsHvva/pP5UsbAlkOF2kILwTZeVrYjpiq57wJpW2QlcgpAVQft3ytU
 ZoIPx9xZtFq7t0oxOykdD2RzLTOkEuHUdVIZbgdc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 080/191] PCI/AER: Don't read upstream ports below
 fatal errors
Date: Sat,  9 Nov 2019 21:38:22 -0500
Message-Id: <20191110024013.29782-80-sashal@kernel.org>
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

[ Upstream commit 9d938ea53b265ed6df6cdd1715d971f0235fdbfc ]

The AER driver has never read the config space of an endpoint that reported
a fatal error because the link to that device is considered unreliable.

An ERR_FATAL from an upstream port almost certainly indicates an error on
its upstream link, so we can't expect to reliably read its config space for
the same reason.

Signed-off-by: Keith Busch <keith.busch@intel.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Sinan Kaya <okaya@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pci/pcie/aer.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index ffbbd759683c5..5c3ea7254c6ae 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1116,8 +1116,9 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
 			&info->mask);
 		if (!(info->status & ~info->mask))
 			return 0;
-	} else if (dev->hdr_type == PCI_HEADER_TYPE_BRIDGE ||
-		info->severity == AER_NONFATAL) {
+	} else if (pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT ||
+	           pci_pcie_type(dev) == PCI_EXP_TYPE_DOWNSTREAM ||
+		   info->severity == AER_NONFATAL) {
 
 		/* Link is still healthy for IO reads */
 		pci_read_config_dword(dev, pos + PCI_ERR_UNCOR_STATUS,
-- 
2.20.1

