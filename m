Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9E9427C2F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 18:46:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HRWD53cjvz3cH5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Oct 2021 03:46:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HRWCC6jVLz2yKT
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Oct 2021 03:45:43 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10132"; a="287555359"
X-IronPort-AV: E=Sophos;i="5.85,360,1624345200"; d="scan'208";a="287555359"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2021 09:44:51 -0700
X-IronPort-AV: E=Sophos;i="5.85,360,1624345200"; d="scan'208";a="546557593"
Received: from dwillia2-desk3.jf.intel.com (HELO
 dwillia2-desk3.amr.corp.intel.com) ([10.54.39.25])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2021 09:44:51 -0700
Subject: [PATCH v3 10/10] ocxl: Use pci core's DVSEC functionality
From: Dan Williams <dan.j.williams@intel.com>
To: linux-cxl@vger.kernel.org
Date: Sat, 09 Oct 2021 09:44:50 -0700
Message-ID: <163379789065.692348.7117946955275586530.stgit@dwillia2-desk3.amr.corp.intel.com>
In-Reply-To: <163379783658.692348.16064992154261275220.stgit@dwillia2-desk3.amr.corp.intel.com>
References: <163379783658.692348.16064992154261275220.stgit@dwillia2-desk3.amr.corp.intel.com>
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
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ben Widawsky <ben.widawsky@intel.com>

Reduce maintenance burden of DVSEC query implementation by using the
centralized PCI core implementation.

There are two obvious places to simply drop in the new core
implementation. There remains find_dvsec_from_pos() which would benefit
from using a core implementation. As that change is less trivial it is
reserved for later.

Cc: linuxppc-dev@lists.ozlabs.org
Cc: Andrew Donnellan <ajd@linux.ibm.com>
Acked-by: Frederic Barrat <fbarrat@linux.ibm.com> (v1)
Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 arch/powerpc/platforms/powernv/ocxl.c |    3 ++-
 drivers/misc/ocxl/config.c            |   13 +------------
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/ocxl.c b/arch/powerpc/platforms/powernv/ocxl.c
index 9105efcf242a..28b009b46464 100644
--- a/arch/powerpc/platforms/powernv/ocxl.c
+++ b/arch/powerpc/platforms/powernv/ocxl.c
@@ -107,7 +107,8 @@ static int get_max_afu_index(struct pci_dev *dev, int *afu_idx)
 	int pos;
 	u32 val;
 
-	pos = find_dvsec_from_pos(dev, OCXL_DVSEC_FUNC_ID, 0);
+	pos = pci_find_dvsec_capability(dev, PCI_VENDOR_ID_IBM,
+					OCXL_DVSEC_FUNC_ID);
 	if (!pos)
 		return -ESRCH;
 
diff --git a/drivers/misc/ocxl/config.c b/drivers/misc/ocxl/config.c
index a68738f38252..e401a51596b9 100644
--- a/drivers/misc/ocxl/config.c
+++ b/drivers/misc/ocxl/config.c
@@ -33,18 +33,7 @@
 
 static int find_dvsec(struct pci_dev *dev, int dvsec_id)
 {
-	int vsec = 0;
-	u16 vendor, id;
-
-	while ((vsec = pci_find_next_ext_capability(dev, vsec,
-						    OCXL_EXT_CAP_ID_DVSEC))) {
-		pci_read_config_word(dev, vsec + OCXL_DVSEC_VENDOR_OFFSET,
-				&vendor);
-		pci_read_config_word(dev, vsec + OCXL_DVSEC_ID_OFFSET, &id);
-		if (vendor == PCI_VENDOR_ID_IBM && id == dvsec_id)
-			return vsec;
-	}
-	return 0;
+	return pci_find_dvsec_capability(dev, PCI_VENDOR_ID_IBM, dvsec_id);
 }
 
 static int find_dvsec_afu_ctrl(struct pci_dev *dev, u8 afu_idx)

