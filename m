Return-Path: <linuxppc-dev+bounces-5247-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CB3A10D15
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 18:09:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXbFz2SRrz3bTn;
	Wed, 15 Jan 2025 04:09:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736874567;
	cv=none; b=giAft3omyqvLNg257m4nyo+emXz6nFVjY55Q+RMIEehai4eThKFH/u6d4bpIAjvpcilUid6MPPjhJf569IuuI+f/SttDNiA0BjjeIzu19FPMMhlNXjGOqrHYCngMNE8YJ6e7MfTzzzhhwi9P24Vy6HQ7YjV+e1wBxAzXleTYzL7I5gkfrlciO1HkzjDlK9euC01rSC0eJboDbe6mSXLF/XKonoTXRn4VHeEBqWxt+Sap4vrGfydl2us8Gr7HTAI5/kHGaL6PMYNGjE5AnnvZHXO6cpZNRWhzxXpvv/Xym2HI/ReZAfuRP++yPRVeNJPqytQaNBFNiOEKHDVe+G5K6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736874567; c=relaxed/relaxed;
	bh=h0BxPt5Qn5FrfiQPdZPbMf1aGn/UmVCbPMPe7ktykcc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RTdEKIOpVeSL9JPdV3KaCbmb2I1AZa23Fq5H9IrE2dGv+ElEc0Bb0dJufO6oYpphHiPEZC0pMjc9Mfu6pLFWFBazNr3ZJizEIYpROxVq6PSprP0tCh5u4lL12jQl3uHQCLFnKOksMOM2zF9Pwszq6yvSsFfo3WUHwcBYw4H1cfiRmfMwFgaIutfWKD9KtTdl814yGN1wMC5QbraS+rcI2hhxGEwDTe/ADz3Q833s6wegIXtLPyINhPSLpVTlYvfimYGGpL03X2z4zl8uhwkWC3aMPWmjHeyVrzhlaSBB5zo+fxclLUAG/MmzxUVbT0UlWzDZh/7r9qeqLITSsOgDRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Toqhnntf; dkim-atps=neutral; spf=none (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Toqhnntf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXbFy0kPyz3bVk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 04:09:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736874566; x=1768410566;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6nwa3NGbffsTRbHevkLt925x5jm89WW4PLEOPQskQ3I=;
  b=ToqhnntfwStR7uFcm1kHoVKiArV8mJN7Q/lYGbNQc9POphkQ3f4iIgBb
   KUrKbaxu0ctwy3/nONFWsvYYSQEw3cJK9Dk1604j/0bcts6m3lbf5KMBv
   TOzGtkZnxCvx4FIDTSp1Po78Qj5TwDbX2mMpqeUsV2LebEEOhP8MRyNbu
   BOhSdQwsF7j69oqYAZy1w+QZlXnFSXjDEEdjFSn4AnqGlMlu0Gb6vx8C+
   alu3qeeyJxV62V/PpAA0SFzj6gp9mAzr2eghQPztQ9mUZBYOM58a/fRMG
   Nj9655wLwOnAljO6hlsQST57HLeOnrcSPpQt4Ybiu//jlgXdM29HQlsOK
   g==;
X-CSE-ConnectionGUID: 0XFMdi02QNy5EguB8F4tLA==
X-CSE-MsgGUID: 3EZ9oMbSTuKE2lVF7HLw8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="36465811"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="36465811"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 09:09:25 -0800
X-CSE-ConnectionGUID: UJDbSimEQ7q9jjfFJbOcGQ==
X-CSE-MsgGUID: 9cVt7dmNRKuaUES2ArUSNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="105452783"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 09:09:23 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v9 4/8] PCI: Make pcie_read_tlp_log() signature same
Date: Tue, 14 Jan 2025 19:08:36 +0200
Message-Id: <20250114170840.1633-5-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250114170840.1633-1-ilpo.jarvinen@linux.intel.com>
References: <20250114170840.1633-1-ilpo.jarvinen@linux.intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

pcie_read_tlp_log()'s prototype and function signature diverged due to
changes made while applying.

Make the parameters of pcie_read_tlp_log() named identically.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/pci/pcie/tlp.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
index 4cc76bd1867a..f0cfe7e39078 100644
--- a/drivers/pci/pcie/tlp.c
+++ b/drivers/pci/pcie/tlp.c
@@ -15,22 +15,21 @@
  * pcie_read_tlp_log - read TLP Header Log
  * @dev: PCIe device
  * @where: PCI Config offset of TLP Header Log
- * @tlp_log: TLP Log structure to fill
+ * @log: TLP Log structure to fill
  *
- * Fill @tlp_log from TLP Header Log registers, e.g., AER or DPC.
+ * Fill @log from TLP Header Log registers, e.g., AER or DPC.
  *
  * Return: 0 on success and filled TLP Log structure, <0 on error.
  */
 int pcie_read_tlp_log(struct pci_dev *dev, int where,
-		      struct pcie_tlp_log *tlp_log)
+		      struct pcie_tlp_log *log)
 {
 	int i, ret;
 
-	memset(tlp_log, 0, sizeof(*tlp_log));
+	memset(log, 0, sizeof(*log));
 
 	for (i = 0; i < PCIE_STD_NUM_TLP_HEADERLOG; i++) {
-		ret = pci_read_config_dword(dev, where + i * 4,
-					    &tlp_log->dw[i]);
+		ret = pci_read_config_dword(dev, where + i * 4, &log->dw[i]);
 		if (ret)
 			return pcibios_err_to_errno(ret);
 	}
-- 
2.39.5


