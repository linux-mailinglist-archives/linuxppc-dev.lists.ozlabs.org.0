Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 501CD896B71
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 12:04:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AWCIU5rT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8gMG0ySqz3bYc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 21:04:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AWCIU5rT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Wed, 03 Apr 2024 21:03:30 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8gLV2Rwxz30dn
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 21:03:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712138611; x=1743674611;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zMcY2t+u5tG57730wu67hVX3WkpcRHiwmVhu+ZGk6bc=;
  b=AWCIU5rTGAzrAqQyzXbqcUkw3mqzBr5wsRfOOnA7TYb3b1jLtvse6UbR
   7VQqZi8GSXq39ocujuFtM93iJzyiPb8U2C7Y4ezfeoJsBgwvChNr2o8vj
   EWJgWByj50dtteqnFkZk/7lWtVoWjiB1Jf6ZE2u3lJUEi47HJzvMRpTCK
   DcbPrShigFO8PbvUybP1i00E0855phUczOs345ZijwkQNzVcqxikI0V+a
   S/iL/TG2ASj71X8BbejpVQ2SxFTRnvIQFEEGEiN10Br1Lf0QXQIhuCUbL
   hkD/iTgdYZ2YlwAMqgZSdqcvhAljuWU6pCMftTibRsjoh6BI+R0XLmDF4
   g==;
X-CSE-ConnectionGUID: RQi0UPNUR6SCNaJdZtZYtw==
X-CSE-MsgGUID: ry0SoN+PSNW26aLCcAF0+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="24815750"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="24815750"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 03:02:21 -0700
X-CSE-ConnectionGUID: HTPohwHPT7OpZR498eG0uw==
X-CSE-MsgGUID: jFkbpWRlQsCVwgNVqJ/cgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="23084724"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.24])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 03:02:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>
Subject: [PATCH v2 0/2] PCI: Consolidate TLP Log reading and printing
Date: Wed,  3 Apr 2024 13:02:04 +0300
Message-Id: <20240403100206.4403-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series has the remaining patches of the AER & DPC TLP Log handling
consolidation.

v2:
- Don't add EXPORT()s
- Don't include igxbe changes
- Don't use pr_cont() as it's incompatible with pci_err() and according
  to Andy Shevchenko should not be used in the first place

Ilpo Järvinen (2):
  PCI: Add TLP Prefix reading into pcie_read_tlp_log()
  PCI: Create helper to print TLP Header and Prefix Log

 drivers/pci/ats.c             |  2 +-
 drivers/pci/pci.c             | 66 +++++++++++++++++++++++++++++++----
 drivers/pci/pcie/aer.c        | 14 +++-----
 drivers/pci/pcie/dpc.c        | 23 +++++++-----
 drivers/pci/probe.c           | 14 +++++---
 include/linux/aer.h           |  7 +++-
 include/linux/pci.h           |  2 +-
 include/uapi/linux/pci_regs.h |  2 ++
 8 files changed, 98 insertions(+), 32 deletions(-)

-- 
2.39.2

