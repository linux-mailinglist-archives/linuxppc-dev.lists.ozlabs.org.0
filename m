Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E098E7F6F2E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 10:11:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VpsGIyDl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sc8PN5lFrz3dTM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 20:11:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VpsGIyDl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Fri, 24 Nov 2023 20:11:03 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sc8NR4fhqz2xQ8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 20:11:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700817064; x=1732353064;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dtKj/F4zR1OSHuWZtC50tt8Q6NyZniZKExIQR3zPCac=;
  b=VpsGIyDlk7GH8iW16K+6uro3hMkpr/k+SDMBRgrKa81uADEjp8OiIvW8
   StLflq/kXt5CPnyJ0sUlJ/aXc3KMcRQKuTGcPMBX/5s6dHF9ATLYLhjA5
   L6BeCTvwGmOg9nLhUC/VH5xhYecYg9ITtyN3jlAtukSGSrFG7oOPswrrT
   aG4VEdYGPlpAioF7+qlJBs4jEbjIYbB6lbY2SrYEWAHOglJ+7DqoZ1vSG
   IU9V4vEOjujzqPAxJsh4uIevlOE/oVlUUXqYpeJJDsoNktSQ/4hkVWspJ
   GA+E0Zw1CespdglJPkgx1pM6TjA2SDg7qClwZWl166hJd4TjTk/f/kNrJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="11066446"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="11066446"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 01:09:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="885220552"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="885220552"
Received: from mvlasov-mobl1.ger.corp.intel.com (HELO localhost) ([10.251.220.89])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 01:09:35 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] powerpc/fsl-pci: Use PCI_HEADER_TYPE_MASK instead of literal
Date: Fri, 24 Nov 2023 11:09:14 +0200
Message-Id: <20231124090919.23687-2-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231124090919.23687-1-ilpo.jarvinen@linux.intel.com>
References: <20231124090919.23687-1-ilpo.jarvinen@linux.intel.com>
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
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace 0x7f literals with PCI_HEADER_TYPE_MASK.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 arch/powerpc/sysdev/fsl_pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
index 3868483fbe29..ef7707ea0db7 100644
--- a/arch/powerpc/sysdev/fsl_pci.c
+++ b/arch/powerpc/sysdev/fsl_pci.c
@@ -54,7 +54,7 @@ static void quirk_fsl_pcie_early(struct pci_dev *dev)
 
 	/* if we aren't in host mode don't bother */
 	pci_read_config_byte(dev, PCI_HEADER_TYPE, &hdr_type);
-	if ((hdr_type & 0x7f) != PCI_HEADER_TYPE_BRIDGE)
+	if ((hdr_type & PCI_HEADER_TYPE_MASK) != PCI_HEADER_TYPE_BRIDGE)
 		return;
 
 	dev->class = PCI_CLASS_BRIDGE_PCI_NORMAL;
@@ -581,7 +581,7 @@ static int fsl_add_bridge(struct platform_device *pdev, int is_primary)
 		hose->ops = &fsl_indirect_pcie_ops;
 		/* For PCIE read HEADER_TYPE to identify controller mode */
 		early_read_config_byte(hose, 0, 0, PCI_HEADER_TYPE, &hdr_type);
-		if ((hdr_type & 0x7f) != PCI_HEADER_TYPE_BRIDGE)
+		if ((hdr_type & PCI_HEADER_TYPE_MASK) != PCI_HEADER_TYPE_BRIDGE)
 			goto no_bridge;
 
 	} else {
-- 
2.30.2

