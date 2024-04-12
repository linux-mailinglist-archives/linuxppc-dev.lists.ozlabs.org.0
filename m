Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A318A2FA2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 15:37:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R3BA0ZZB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VGHgG6Fkwz3vXY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 23:37:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R3BA0ZZB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VGHfX255hz3cgg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 23:36:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712929012; x=1744465012;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UA1sS56M2vTYHjdAbQdVD560pz+AgXlcwN7dZXpHgAk=;
  b=R3BA0ZZBoLgSnrWOeNvnhgLdRcH9pXcSCDLnX56ImEmNR86n5NYxeWWq
   hr56BI+bFi9f2gMBHmQE1LV3S/eVGYeeFxNhZjsWJ53eSmDIIu5qIq1fv
   Bt594rHCTjE8W4fru+NLWboOjpasDoXGtsL4faCAz0vr0dwk+fJ7CInpY
   qobNkxrHfBJkyPuVAyfJ8cX3Il2GB+vZ5bfFeWKU8N+RA+rgz9YTWlRZn
   yHacv2b9QXs/PxLRpVBUqMdwUk0exhKdbmBZy8yfbkdqds9eiCFyR/8oh
   TndYTneTfySS77HcvMtID68sp+n+6ZhbQZliru9uWjQiuiwz6QU/Lk6KU
   g==;
X-CSE-ConnectionGUID: Kk7EcBXKSqGdsx584+JuUQ==
X-CSE-MsgGUID: 8HCk5p59Q5SWSI8+lehh3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="25897872"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="25897872"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 06:36:46 -0700
X-CSE-ConnectionGUID: ZBZQ50teQMiKo5vgjat3hQ==
X-CSE-MsgGUID: 9eukN5+eSm6g0F6L2hBfoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="58662876"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.32])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 06:36:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v3 0/2] PCI: Consolidate TLP Log reading and printing
Date: Fri, 12 Apr 2024 16:36:33 +0300
Message-Id: <20240412133635.3831-1-ilpo.jarvinen@linux.intel.com>
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

v3:
- Small rewording in a commit message

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

