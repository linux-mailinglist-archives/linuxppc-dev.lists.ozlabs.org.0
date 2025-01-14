Return-Path: <linuxppc-dev+bounces-5248-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C29DA10D17
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 18:09:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXbG91qYzz3bWy;
	Wed, 15 Jan 2025 04:09:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736874577;
	cv=none; b=bsVYTiFDmN0A6AfxaPHGHqlmAZ15OVkNH7VTn5K4lhQ6Z0GNfVTfiimQaAZ4x5GrFcnuPP/qeIJTDO7PB/SI9qyz0VZyMwDgyhKbJcwhFxdC4sgkHXyhE1y5eIDUvLqiXW721vBxbmN51Z7fMiByRyWZQ7b7+GbIc8X6B6yjE8n9mV66jGiBZrUA6E21jy4jj7JL9cmYlWGkdnFVcYP5tFh63MwL8r4eK81/uJQJNUusi9c+bP273WizgLgJAtAERIzgSaMkY0mlFpgiPeCEIADxKZfXE/YuucsbPIjPgq+xLOkovxDmRoJ41VbYVdcJsbPfky9Iv9gW59U3VscZ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736874577; c=relaxed/relaxed;
	bh=/OCWKFfAQRMnswCJNDK7A5nlWNNAaJRXJhiZTbrL0yA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iZ+0mFurd9yUu5jIs3t3pMIznj3HtxTidJPu6B3wW3vGaOmtkLCDZQaUy5pUs+xys0srN96DxyIrXI2wwWfpNxr0S9oSuuat1WC1PD5R+WL+tvKJdUJrqxV/6zL+r4L1CAMDNndO3cVb7ZhyrW1v9jlf13Auw44QNH8x4Rq4hU7zDGP1E1UIz+Qu3YsN3vtSLjO9TpPZuRBCF1VYwjMpvPSmnr7kFg7g3o21YbJJB+h92BFIxQQ03hIeXzoAHMCPG5dQHM+5Wv2tYcXJzLiA97ShAfuMBN5d2il33NJaJxNZcyGAWkbyDGT3ggi3Nwibmg7tWTLuoH1IUb5iGx5EMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PyD+Exh5; dkim-atps=neutral; spf=none (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PyD+Exh5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXbG80BPKz3bWq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 04:09:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736874576; x=1768410576;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9L+iZAVFCEGiNvBJzVf+Cu0qerXaRfJ3Hc7GFO41lLQ=;
  b=PyD+Exh5LJ4UmC4ScJVHL1dnrUHqV1/9xudK4JUCnGq4uEULonZtA246
   2w2nGmetvoFBhibNtTmNgwXyELIvuoNjW64M9gr2EG3aLZWnam+cKBVCh
   1drCrYDTt3ce9hnUnfmmWZzfzfo72c9CMv/AEdNjcHVPohHni+49F2FLZ
   xhPSWylQIT5JbJFzRurDgJYtx5TRX6e3gSmYIqJOUz+xZBk+VfWGR5+ZB
   OehH4cUEYTS4tjJm4Wf7OwM184QwmkSkzQV2Itocb8Ck8zkce3uD+Bgwj
   GXH2pUVOSrrl+zC0v4svjRez5WTH2trrq8NIduh0tRmCGqSgaP7XnY8aC
   A==;
X-CSE-ConnectionGUID: ivJOAvh1Q5y8LfqdT/6cGg==
X-CSE-MsgGUID: 4aOOJcCmQBKDNDwe3HcDXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="36465835"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="36465835"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 09:09:34 -0800
X-CSE-ConnectionGUID: hLYWA7Q8RcKZJfdbYv9hIg==
X-CSE-MsgGUID: Fkc4ijeuQ26OJ9iOgQ0xVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="105452792"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 09:09:31 -0800
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
Subject: [PATCH v9 5/8] PCI: Use unsigned int i in pcie_read_tlp_log()
Date: Tue, 14 Jan 2025 19:08:37 +0200
Message-Id: <20250114170840.1633-6-ilpo.jarvinen@linux.intel.com>
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

Loop variable i counting from 0 upwards does not need to be signed so
make it unsigned int.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/pci/pcie/tlp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
index f0cfe7e39078..d7ad99f466b9 100644
--- a/drivers/pci/pcie/tlp.c
+++ b/drivers/pci/pcie/tlp.c
@@ -24,7 +24,8 @@
 int pcie_read_tlp_log(struct pci_dev *dev, int where,
 		      struct pcie_tlp_log *log)
 {
-	int i, ret;
+	unsigned int i;
+	int ret;
 
 	memset(log, 0, sizeof(*log));
 
-- 
2.39.5


