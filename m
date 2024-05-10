Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A63E78C21B1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 12:09:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V9OxM05E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VbPkP1qP7z3cXV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 20:09:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V9OxM05E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VbPht48W5z30Tx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 20:08:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715335695; x=1746871695;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vrR9lSZtbojiA2EubTfEXC7NUqhoH2bBkEIK7kkkTFA=;
  b=V9OxM05E6jDOm8w9MwOh7r582KUZzILVuz87YUkwNFdrh6vgR465h9qo
   K290PHqE7kxoZXev1pHrKZIhcGxnJe0WhYEe3gaUaXNyX3LJQ6at2W0fR
   bhB/l8PUUK1Vk2zLHJQ03y3aYDu3rQ56lwcI/sqXLtXAv8/FqXCAQG5S3
   IDxfVrCBqV1FxW0FSgGHiOStKnA4FWuQU2VLw7tZKe1wnSR15wKiJavZm
   npc1zIGJT/u4/S6+qZcHtoPsQp7k1SmMu+CAOXJE9KImfBsup+fpJDXwX
   X9nvGO5plJ5Kc3HA28j/fRDOuk6/N0nYhFuVbjBtlan4dKHYaISbeyGOw
   g==;
X-CSE-ConnectionGUID: nYQKqxS8RVCviWC8bT7AjA==
X-CSE-MsgGUID: XW1lThixQ8mU6K+9ttHoUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="36687483"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="36687483"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 03:08:14 -0700
X-CSE-ConnectionGUID: LCOPFPlFQIG/MpZZyDUn+A==
X-CSE-MsgGUID: gs9lu6idT8WLMHgAx9nHtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="29571419"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.85])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 03:08:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/7] PCI: Use unsigned int i in pcie_read_tlp_log()
Date: Fri, 10 May 2024 13:07:27 +0300
Message-Id: <20240510100730.18805-5-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240510100730.18805-1-ilpo.jarvinen@linux.intel.com>
References: <20240510100730.18805-1-ilpo.jarvinen@linux.intel.com>
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
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Loop variable i counting from 0 upwards does not need to be signed so
make it unsigned int.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pcie/tlp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
index 2bf15749cd31..65ac7b5d8a87 100644
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
2.39.2

