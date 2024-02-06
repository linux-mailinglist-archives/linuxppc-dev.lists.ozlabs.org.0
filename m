Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 511E384B722
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 14:59:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jII0KCep;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTlGv1bTmz3cH2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 00:59:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jII0KCep;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Wed, 07 Feb 2024 00:58:39 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTlG70mTmz2yq4
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Feb 2024 00:58:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707227919; x=1738763919;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+6R/x2mXrJ2mSjnMfGMWqrnVr3TA5VqeovMhAdWHed8=;
  b=jII0KCepP1q7wQBP4nJSyrW+7QvkKP9ZuYa2rZ7ibpWNHS4EhJT36tbc
   jLg82I9VCxhuFUXFh6RbX0exFkLUl6T/hKEQDW9hdXJicKTVAWRAWg4Z1
   PRM7DLp+9dquuTuhdQFh1U17AZb3q+XNGUBG5jg98kxVLVc3gFmfsMyPe
   KQHdTXHfB64NnCH0LkEOdrWND6+H8kDujh3OCwxN6DOXSvxTxjrKLc6bo
   gM8FWgVqzFeaaQjMGt9koBrCu3sUfvDVZRdtc4Pq7h4EOVwXbFDoWiIq+
   e8FEow5da5/olOU5KUp0jcAoaNBqSCJZeyU+XqIn7OiqApBZoe2P7Z99T
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="905143"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="905143"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 05:57:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="1309627"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.36.139])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 05:57:25 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	intel-wired-lan@lists.osuosl.org,
	Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: [PATCH 0/4] PCI: Consolidate TLP Log reading and printing
Date: Tue,  6 Feb 2024 15:57:13 +0200
Message-Id: <20240206135717.8565-1-ilpo.jarvinen@linux.intel.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>, linux-efi@vger.kernel.org, Tony Luck <tony.luck@intel.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Borislav Petkov <bp@alien8.de>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Jakub Kicinski <kuba@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>, linux-edac@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series consolidates AER & DPC TLP Log handling code. Helpers are
added for reading and printing the TLP Log and the format is made to
include E-E Prefixes in both cases (previously only one DPC RP PIO
displayed the E-E Prefixes).

I'd appreciate if people familiar with ixgbe could check the error
handling conversion within the driver is correct.

Ilpo Järvinen (4):
  PCI/AER: Cleanup register variable
  PCI: Generalize TLP Header Log reading
  PCI: Add TLP Prefix reading into pcie_read_tlp_log()
  PCI: Create helper to print TLP Header and Prefix Log

 drivers/firmware/efi/cper.c                   |  4 +-
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c | 39 +++------
 drivers/pci/ats.c                             |  2 +-
 drivers/pci/pci.c                             | 79 +++++++++++++++++++
 drivers/pci/pci.h                             |  2 +-
 drivers/pci/pcie/aer.c                        | 28 ++-----
 drivers/pci/pcie/dpc.c                        | 31 ++++----
 drivers/pci/probe.c                           | 14 ++--
 include/linux/aer.h                           | 16 ++--
 include/linux/pci.h                           |  2 +-
 include/ras/ras_event.h                       | 10 +--
 include/uapi/linux/pci_regs.h                 |  2 +
 12 files changed, 145 insertions(+), 84 deletions(-)

-- 
2.39.2

