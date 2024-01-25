Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA8983C018
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 12:04:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gLB3G4Ic;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLHz83vhDz3cWQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 22:04:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gLB3G4Ic;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=qingshun.wang@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 70 seconds by postgrey-1.37 at boromir; Thu, 25 Jan 2024 17:29:51 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TL9sq2rK5z2x9T
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 17:29:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706164191; x=1737700191;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pvMMZU0mlB2eFcvOm/oK0NtOQG6HPvn9mMao1fi7Zqc=;
  b=gLB3G4IcvHYUOihnYYcWPFwmfPmp6iMpPXBx3Y5VIYpJLn+bo+jNUTBi
   QKuOj4tQIdJV2ohbruJLpg3D1uQxMNBvQlwcvJbU4IgHsQ5CDyeOyO503
   KSO/9766Kdket9X4YxXMHYTWGr/p6XekC/GhgHhDtcnQuz4nqRapRnjB8
   7RoEfYjfg67MSmiobRCuSDrXB0Y29U0hNxuYNJPQqP27wepvdCPox3bR9
   CnPfDW5hSL+baGVnvOuoGxz8auWib/KOjlxJbm3mYw1du6VbwEGBChkgf
   c/ujvVFL04NjbL/j3L6obgT1Uvc612sEXFvyH+hrDNAa3ICnu9K7S3t2d
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="9456727"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9456727"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 22:28:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2122533"
Received: from linchen5-mobl.ccr.corp.intel.com (HELO localhost) ([10.254.209.209])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 22:28:27 -0800
From: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
To: linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v2 0/4] PCI/AER: Handle Advisory Non-Fatal properly
Date: Thu, 25 Jan 2024 14:27:58 +0800
Message-ID: <20240125062802.50819-1-qingshun.wang@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 25 Jan 2024 22:03:28 +1100
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Alison Schofield <alison.schofield@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, erwin.tsaur@intel.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, chao.p.peng@linux.intel.com, Ira Weiny <ira.weiny@intel.com>, Davidlohr Bueso <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>, Bjorn Helgaas <helgaas@kernel.org>, Len Brown <lenb@kernel.org>, Robert Richter <rrichter@amd.com>, Borislav Petkov <bp@alien8.de>, "Wang, Qingshun" <qingshun.wang@linux.intel.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>, feiting.wanyan@intel.com, Adam Preble <adam.c.preble@intel.com>, Mahesh J Sa
 lgaonkar <mahesh@linux.ibm.com>, Li Yang <leoyang.li@nxp.com>, Lukas Wunner <lukas@wunner.de>, James Morse <james.morse@arm.com>, qingshun.wang@intel.com, Shiju Jose <shiju.jose@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

According to PCIe Base Specification Revision 6.1, Sections 6.2.3.4
and 6.2.4.3, certain uncorrectable errors will signal ERR_COR instead
of ERR_NONFATAL, logged as Advisory Non-Fatal Error, and set bits in
both Correctable Error Status register and Uncorrectable Error Status
register. Currently, when handling AER events the kernel will only look
at CE status or UE status, but never both. In the Advisory
Non-Fatal Error case, bits set in the UE status register will not be
reported and cleared until the next Fatal/Non-Fatal error arrives.

For instance, previously, when the kernel receives an ANFE with Poisoned
TLP in OS native AER mode, only the status of CE will be reported and
cleared:

  AER: Corrected error received: 0000:b7:02.0
  PCIe Bus Error: severity=Corrected, type=Transaction Layer, (Receiver ID)
    device [8086:0db0] error status/mask=00002000/00000000
     [13] NonFatalErr           

If the kernel receives a Malformed TLP after that, two UE will be
reported, which is unexpected. The Malformed TLP Header was lost since
the previous ANFE gated the TLP header logs:

  PCIe Bus Error: severity=Uncorrected (Fatal), type=Transaction Layer, (Receiver ID)
    device [8086:0db0] error status/mask=00041000/00180020
     [12] TLP                    (First)
     [18] MalfTLP       

To handle this case properly, add additional fields in aer_err_info to
track both CE and UE status/mask, UE severity, and Device Status.
Use this information to determine the status bits that need to be cleared.

Now, in the previous scenario, both CE status and related UE status will
be reported and cleared after ANFE:

  AER: Corrected error received: 0000:b7:02.0
  PCIe Bus Error: severity=Corrected, type=Transaction Layer, (Receiver ID)
    device [8086:0db0] error status/mask=00002000/00000000
     [13] NonFatalErr           
    Uncorrectable errors that may cause Advisory Non-Fatal:
     [18] TLP

Additionally, add more data to aer_event tracepoint, which would help
to better understand ANFE and other errors for external observation.

Note:
checkpatch.pl will produce following errors and warnings on PATCH 4:

  ERROR: space prohibited after that open parenthesis '('
  #103: FILE: include/ras/ras_event.h:319:
  +		__field(	u16,		link_status	)

  ...similar errors omitted...

  WARNING: quoted string split across lines
  #126: FILE: include/ras/ras_event.h:342:
  +	TP_printk("%s PCIe Bus Error: severity=%s, %s, TLP Header=%s, "
  +		 "Correctable Error Status=0x%08x, "

  ...similar warnings omitted...

For readability reasons, these errors and warnings are not fixed,
following the code style of existing examples in the kernel source tree.

Change log:
v2:
  - Reference to the latest PCIe Specification in both commit messages
    and comments, as suggested by Bjorn Helgaas.
  - Describe the reason for storing additional information in
    aer_err_info in the commit message of PATCH 1, as suggested by Bjorn
    Helgaas.
  - Add more details of behavior changes in the commit message of PATCH
    2, as suggested by Bjorn Helgaas.

v1: https://lore.kernel.org/linux-pci/20240111073227.31488-1-qingshun.wang@linux.intel.com/

Wang, Qingshun (4):
  PCI/AER: Store more information in aer_err_info
  PCI/AER: Handle Advisory Non-Fatal properly
  PCI/AER: Fetch information for FTrace
  RAS: Trace more information in aer_event

 drivers/acpi/apei/ghes.c      |  16 ++-
 drivers/cxl/core/pci.c        |  15 ++-
 drivers/pci/pci.h             |  12 ++-
 drivers/pci/pcie/aer.c        | 191 +++++++++++++++++++++++++++-------
 include/linux/aer.h           |   6 +-
 include/linux/pci.h           |  27 +++++
 include/ras/ras_event.h       |  48 ++++++++-
 include/uapi/linux/pci_regs.h |   1 +
 8 files changed, 269 insertions(+), 47 deletions(-)


base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
-- 
2.42.0

