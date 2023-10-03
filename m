Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9597B698C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 14:54:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pi4oZk0o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0Hpn3BT7z3vYF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 23:54:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pi4oZk0o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.31; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0HnB0CF7z30Ng
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Oct 2023 23:53:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696337614; x=1727873614;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ColEi8Bgy84f92KFXrjvKWg7/PjGY+5N1fWbadVJ1hM=;
  b=Pi4oZk0oSIhpi5dy7GcWxXQi9pwlqpyougVPZaeI2eTrcBAo6ZwUIDpu
   P0+kBKYTo/LFg7dP+jrNc4FJxBDIWVVG0KM53NwZmmL5U71l+Wo0Lpvkt
   3IWNpA08/KgxHqQxHDd71duE/gCJWy2tQtk4cMSrwHAUxdNJkNHQaCjP3
   byNdFFlkdA0RJbJeWLx7d79p3WMniPHg3ZJ5bur0Inwqk1AFqGMU//jeT
   hQG7NJO5T+WyGGLP23KjtMytgPlGCMeswtQ6RYbErBHg0tQVWaPT0oSkV
   I5/1R3u2UQSxyC6l87j03NwUsSknqZ1IgEYrekSxBtiWyuqq+Z1zn0cvT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="447022381"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="447022381"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:53:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="998006040"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="998006040"
Received: from bmihaile-mobl1.ger.corp.intel.com (HELO localhost) ([10.251.222.64])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:53:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	bcm-kernel-feedback-list@broadcom.com,
	jonathan.derrick@linux.dev,
	kw@linux.com,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-renesas-soc@vger.kernel.org,
	lpieralisi@kernel.org,
	marek.vasut+renesas@gmail.com,
	minghuan.Lian@nxp.com,
	mingkai.hu@nxp.com,
	m.karthikeyan@mobiveil.co.in,
	nirmal.patel@linux.intel.com,
	rjui@broadcom.com,
	robh@kernel.org,
	roy.zang@nxp.com,
	sbranden@broadcom.com,
	yoshihiro.shimoda.uh@renesas.com,
	Zhiqiang.Hou@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] PCI: vmd: Correct PCI Header Type Register's MFD bit check
Date: Tue,  3 Oct 2023 15:52:58 +0300
Message-Id: <20231003125300.5541-2-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231003125300.5541-1-ilpo.jarvinen@linux.intel.com>
References: <20231003125300.5541-1-ilpo.jarvinen@linux.intel.com>
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

vmd_domain_reset() attempts to find whether the device may contain
multiple functions by checking 0x80 (Multi-Function Device), however,
the hdr_type variable has already been masked with PCI_HEADER_TYPE_MASK
so the check can never true.

To fix the issue, don't mask the read with PCI_HEADER_TYPE_MASK.

Fixes: 6aab5622296b ("PCI: vmd: Clean up domain before enumeration")
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: Nirmal Patel <nirmal.patel@linux.intel.com>
---
 drivers/pci/controller/vmd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
index e718a816d481..d5b97a6aae56 100644
--- a/drivers/pci/controller/vmd.c
+++ b/drivers/pci/controller/vmd.c
@@ -525,8 +525,7 @@ static void vmd_domain_reset(struct vmd_dev *vmd)
 			base = vmd->cfgbar + PCIE_ECAM_OFFSET(bus,
 						PCI_DEVFN(dev, 0), 0);
 
-			hdr_type = readb(base + PCI_HEADER_TYPE) &
-					 PCI_HEADER_TYPE_MASK;
+			hdr_type = readb(base + PCI_HEADER_TYPE);
 
 			functions = (hdr_type & 0x80) ? 8 : 1;
 			for (fn = 0; fn < functions; fn++) {
-- 
2.30.2

