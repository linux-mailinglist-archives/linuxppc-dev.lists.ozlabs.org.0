Return-Path: <linuxppc-dev+bounces-4261-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 796E99F4CDB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 14:55:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCJGV3Nz4z30VM;
	Wed, 18 Dec 2024 00:54:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734443698;
	cv=none; b=frloFuoHv7MRjobZ3tcDWaGRSbiseHywHrVrCtNxzVJ5U/Zi1MMTBCTg7xwG6xo85Kh6hxTViTNsUCD16RbWI/4g6rC2pp18JO2U9CBktPtDr7AvN7/XcR61Jz9g9ZP3Ik8NiLncAEPPa+KmV1k2ZpOvOegaxjZzTHver0FmGWJXc4D3PuGd62NGfCk2QI6nNqrI5zBovnNBLoyRaP6wUbgk6gfj/MdcT++6ggPXes4iCGMI5+6x0Wy7MhTy7CR0tQzlaabxy9hlMpbqe2t66u7tXbOYJjSe3j0xD/Odyp79pmHBZFytnFfa/HimjDx1SQ43GxLw+lR2R7ywMYFMRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734443698; c=relaxed/relaxed;
	bh=MQDDFz7PQ57B4QEhaG4sYrCWen9+M/FyQP1Li6Q5KOc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=neYZioqkyXO4G6Kykc5U6JjaDyTU0khqBrMyWC9R4GOiY9Rec5E6N5Qw6+nyDg7XUaqmkqO0gjAWqwFv6OoirnS0qx6ObU7cGKr7DQJqqI4bJ9vbgKUI47qywj3MmVWOBxx+1ihkrR9MFqNlAdYMJ6SDWNIZDucsfpKUPxyWo2G2Wl4qZGcKEGs8D24/me7LEgxS9DmnSMl7orGen8OPCuxy/wa3EoB7onZ+6fATlhG4rZlUTUIjoUFBKi0PPlOJ+xjSF0byOIbPQev/CZHLXbqKF9JBKCuAimeYYmK85w1mQFtlys+orVRxomOlgtMmxJrqnNyiEIIazDw5SEMydA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R2RIoiUo; dkim-atps=neutral; spf=none (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R2RIoiUo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCJGT2M2Tz2xdq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 00:54:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734443698; x=1765979698;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=78Wv8nMlCG60akINHhov8RPvttOjLmyuKns1EZFOA6o=;
  b=R2RIoiUo1VJcfp6e3XGIn3jF//SbZwfJwr+fnNIA01zbe+g79ILLn9ez
   qrHKp4oq4Ud/zYgmX9e58tdKdfxndfphdyxrmRn/lviiVIfC8dxfQCTZc
   nLAQmn4yxC5tXoHL2d6NOB4dh366Rt+Ra6g18R4CZsmpgij3G3dkOCwM/
   06Ya1Zi9kvfqOftjDZFcsvN8eQJOya2IFB5IyFMpb7TOazk1HgRvtn175
   6MbbaOLbnEPibOuPE8n4HD5aT4OvvFBwTnxTiW33GkFaEFzIGDbIwUsI0
   elP6Pi9LdY+jU3lvgfrCiJMXd3ciyZ3GfuE1muMn4RN0zhSombP3KQVfk
   Q==;
X-CSE-ConnectionGUID: ncKkfr3qSOOpOfM3S0SR/Q==
X-CSE-MsgGUID: T0v4cPGmRuO27iopWw6uDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34907197"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="34907197"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 05:54:55 -0800
X-CSE-ConnectionGUID: 8CCMSOeyTHyAtmhp1Io8pA==
X-CSE-MsgGUID: XwD4+LjuTLygjhr7Skm2xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="97435519"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.192])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 05:54:51 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-kernel@vger.kernel.org
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v7 4/8] PCI: Use unsigned int i in pcie_read_tlp_log()
Date: Tue, 17 Dec 2024 15:53:54 +0200
Message-Id: <20241217135358.9345-5-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241217135358.9345-1-ilpo.jarvinen@linux.intel.com>
References: <20241217135358.9345-1-ilpo.jarvinen@linux.intel.com>
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
2.39.5


