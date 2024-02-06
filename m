Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE27D84B72C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 15:00:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iTXl2rhM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTlHj5cPGz3cS5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 01:00:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iTXl2rhM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTlG94G7Vz2yq4
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Feb 2024 00:58:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707227922; x=1738763922;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ra907z3zlnnpibGxKFs9lZMq1UE08Wke5uzxQlZ+qJU=;
  b=iTXl2rhMHeYYDNr0i+GessCe+r7zZbMRSDr35ReYy9gkDQewZ16qLxqp
   VeWJpdu/wrf3huLMHU42koXdzYlzjVI0YgDnGDR24KHVOJSSbrlfiQCpE
   eDnwOLQzvQqQQI/dk5DssylKf0VDcWO7t/9+JTLk8cPO9kQ5yCmhE6ViW
   H311FWCEr65ULp8PyuS5fMKbMhl8C88CDoIDbuxoX06Dj4MBROABsLjBw
   GN2Nvc3xyxbICZxL8nvuG9kx/FrOHO4CAsXZa5HBYyH1ZhiMpzRd8guJ9
   eOS1R/N5sfnquoIIuU+TqsUb5Szsee2RW6lTW8Hli2JZ7AzRBoRD7fYWD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="905190"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="905190"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 05:57:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="1008739"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.36.139])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 05:57:34 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	intel-wired-lan@lists.osuosl.org,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] PCI/AER: Cleanup register variable
Date: Tue,  6 Feb 2024 15:57:14 +0200
Message-Id: <20240206135717.8565-2-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240206135717.8565-1-ilpo.jarvinen@linux.intel.com>
References: <20240206135717.8565-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-efi@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Ard Biesheuvel <ardb@kernel.org>, linux-edac@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use u32 for PCIe Capability register variable and name it aercc
(Advanced Error Capabilities and Control register, PCIe r6.1 sec
7.8.4.7) instead of temp.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pcie/aer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 05fc30bb5134..e31e6a9a7773 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1210,7 +1210,7 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
 {
 	int type = pci_pcie_type(dev);
 	int aer = dev->aer_cap;
-	int temp;
+	u32 aercc;
 
 	/* Must reset in this function */
 	info->status = 0;
@@ -1241,8 +1241,8 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
 			return 0;
 
 		/* Get First Error Pointer */
-		pci_read_config_dword(dev, aer + PCI_ERR_CAP, &temp);
-		info->first_error = PCI_ERR_CAP_FEP(temp);
+		pci_read_config_dword(dev, aer + PCI_ERR_CAP, &aercc);
+		info->first_error = PCI_ERR_CAP_FEP(aercc);
 
 		if (info->status & AER_LOG_TLP_MASKS) {
 			info->tlp_header_valid = 1;
-- 
2.39.2

