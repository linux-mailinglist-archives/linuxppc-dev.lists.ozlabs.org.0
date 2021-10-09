Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F44427C2D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 18:45:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HRWBx2zqYz304R
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Oct 2021 03:45:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HRWBV3ZsSz2xr5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Oct 2021 03:45:00 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10132"; a="226571983"
X-IronPort-AV: E=Sophos;i="5.85,360,1624345200"; d="scan'208";a="226571983"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2021 09:43:57 -0700
X-IronPort-AV: E=Sophos;i="5.85,360,1624345200"; d="scan'208";a="590861940"
Received: from dwillia2-desk3.jf.intel.com (HELO
 dwillia2-desk3.amr.corp.intel.com) ([10.54.39.25])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2021 09:43:56 -0700
Subject: [PATCH v3 00/10] cxl_pci refactor for reusability
From: Dan Williams <dan.j.williams@intel.com>
To: linux-cxl@vger.kernel.org
Date: Sat, 09 Oct 2021 09:43:56 -0700
Message-ID: <163379783658.692348.16064992154261275220.stgit@dwillia2-desk3.amr.corp.intel.com>
User-Agent: StGit/0.18-3-g996c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Ben Widawsky <ben.widawsky@intel.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 "David E. Box" <david.e.box@linux.intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Kan Liang <kan.liang@linux.intel.com>,
 Ira Weiny <ira.weiny@intel.com>, hch@lst.de,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Changes since v2 [1]:
- Rework some of the changelogs per feedback (Bjorn, and I)
- Move the cxl_register_map refactor earlier in the series to make the
  cxl_setup_pci_regs() refactor easier to read.
- Fix a bug added in v5.14 for handling the error return case
  cxl_pci_map_regblock()
- Split the addition of @base to cxl_register_map to its own patch
- Drop the cxl_pci_dvsec() wrapper (Christoph)
- Drop the SIOV conversion patch given Baolu's feedback about it being
  dead code

[1]: https://lore.kernel.org/r/20210923172647.72738-1-ben.widawsky@intel.com

---
I am helping out with the review feedback on this set while Ben is
focusing on region provisioning. It appears this rework will be suitable
to just carry in cxl/next, no need to make a cross-tree dependency for
"PCI: Add pci_find_dvsec_capability to find designated VSEC" at this
time.

Ben's original cover:

Provide the ability to obtain CXL register blocks as discrete functionality.
This functionality will become useful for other CXL drivers that need access to
CXL register blocks. It is also in line with other additions to core which moves
register mapping functionality.

At the introduction of the CXL driver the only user of CXL MMIO was cxl_pci
(then known as cxl_mem). As the driver has evolved it is clear that cxl_pci will
not be the only entity that needs access to CXL MMIO. This series stops short of
moving the generalized functionality into cxl_core for the sake of getting eyes
on the important foundational bits sooner rather than later. The ultimate plan
is to move much of the code into cxl_core.

Via review of two previous patches [1] & [2] it has been suggested that the bits
which are being used for DVSEC enumeration move into PCI core. As CXL core is
soon going to require these, let's try to get the ball rolling now on making
that happen.

---

[1]: https://lore.kernel.org/linux-pci/20210913190131.xiiszmno46qie7v5@intel.com/
[2]: https://lore.kernel.org/linux-cxl/20210920225638.1729482-1-ben.widawsky@intel.com/
[3]: https://lore.kernel.org/linux-cxl/20210921220459.2437386-1-ben.widawsky@intel.com/

---

Ben Widawsky (8):
      cxl/pci: Convert register block identifiers to an enum
      cxl/pci: Remove dev_dbg for unknown register blocks
      cxl/pci: Remove pci request/release regions
      cxl/pci: Make more use of cxl_register_map
      cxl/pci: Split cxl_pci_setup_regs()
      PCI: Add pci_find_dvsec_capability to find designated VSEC
      cxl/pci: Use pci core's DVSEC functionality
      ocxl: Use pci core's DVSEC functionality

Dan Williams (2):
      cxl/pci: Fix NULL vs ERR_PTR confusion
      cxl/pci: Add @base to cxl_register_map


 arch/powerpc/platforms/powernv/ocxl.c |    3 -
 drivers/cxl/cxl.h                     |    1 
 drivers/cxl/pci.c                     |  157 +++++++++++++--------------------
 drivers/cxl/pci.h                     |   14 ++-
 drivers/misc/ocxl/config.c            |   13 ---
 drivers/pci/pci.c                     |   32 +++++++
 include/linux/pci.h                   |    1 
 7 files changed, 105 insertions(+), 116 deletions(-)

base-commit: ed97afb53365cd03dde266c9644334a558fe5a16
