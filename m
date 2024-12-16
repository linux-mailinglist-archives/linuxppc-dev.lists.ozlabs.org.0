Return-Path: <linuxppc-dev+bounces-4202-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DF89F3569
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 17:10:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBlKX6b0Bz3057;
	Tue, 17 Dec 2024 03:10:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734365440;
	cv=none; b=oYrw+3qbYdwIt2Id4wI2Sq3xXWQx+QpoTOgHApcX2nIdSGuRETZYcl2prWF+dpnGGAh7b+k56TVLN00zhVzZjfsExR246Xx7+uUSG6/ZdC8FEBXNp7kyw1su98aVtnB/4yMfg5on/uGRTNzAH/jlkFOdI+Selvhl0vwPo7QCzAR0mkn93vtEBzi4qg9CU9Bffc67Hoi5kPmN1C4y7wyDQi20jOCgnrXtMZE2g2iY2LFlZE2ojeERc+oGYXumbyJjrz/wP9j+YbsyYua/60BGCrSeFD7O6gSZFq5AvSpSffqxQlZ7byfRBC5td86cON9Zg36gTIx/Bib3u8OwbNNDmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734365440; c=relaxed/relaxed;
	bh=FAkcC8EhehdNwZ+cxR1j0mTSbJ12I6kP3DVoYOmPmOY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jJ4O6aiVJ30ajXXSm2zLEYlHspG631imoW/YMcpi6u+NWVpHZESeCuX15XjBG+wxEeebn16xMAJObEijQ7EOHGdNqcLqtnCLijYknbkyDVqjCVTbCBJ7G5itU9r9qRwzWTaH3Xwk4YXRdtDTRvjMHyqRK71A2VLtUZbdfSI4oBtsRShUZh8z0suluGDt760W5V1Ui9ed2rD3Mnnxe4Xv42ArJX8BNWen4N/6xBLcwTjUyHhdwwZfitf1Z7nHpv0WPwHcPbFSjS+6uZsrhzkRRzvEn4yKLsgzseFVRiNsn6Vh6ZO1Jk5ZUORcS15A+YDbFOHE49ptXIIZUQOZCF6l4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VjPZvBvZ; dkim-atps=neutral; spf=none (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VjPZvBvZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBlKW5RQWz302D
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 03:10:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734365440; x=1765901440;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3hz0/nYgnvrHJgscQWPwOkskKUx41Z8jhLGgWfFgNb4=;
  b=VjPZvBvZSLjfORvdDTQA3Ww8+g4cH7eR/MjTMz8YsHKyOR7swKt8jUqB
   5mWSLNeSUfXGBDL7OxPYJ931JCCV8qg5RM0qrKUucLdVGjTBjdnqZpglE
   wduwcfmB/Q0D1gRj42IBq8TLuXEe+r7dCfSMN+cr4gdjuGi7YmfZMfUaX
   ybmaBOXeeWmfFgSdGO1/aRSWOUT8R+YfIz1yZkH0B3lLKz4ku3dI7FHjP
   LBQHLhsbInmZaBdTInKgRYzM3c2paxnQ5G119fhjd0GjQx4zkXLjL31Bn
   9t5tlEsJkFXqVZIPYMtYlISNJQvxzMzNO/zuuaA4Y42crrT8EvelalGb3
   Q==;
X-CSE-ConnectionGUID: A38/CYpgTRmvXsTJjrblaA==
X-CSE-MsgGUID: paK7ay46RfaXAYMBg2L6Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45761343"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45761343"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 08:10:37 -0800
X-CSE-ConnectionGUID: lowAW4FST+qbUd2YLKLfkw==
X-CSE-MsgGUID: C/7acEIVTPeZUtgaoDRAVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="97015500"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.29])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 08:10:34 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 2/4] PCI: shpchp: Change dbg() -> ctrl_dbg()
Date: Mon, 16 Dec 2024 18:10:10 +0200
Message-Id: <20241216161012.1774-3-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241216161012.1774-1-ilpo.jarvinen@linux.intel.com>
References: <20241216161012.1774-1-ilpo.jarvinen@linux.intel.com>
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

Convert the last user of dbg() to use ctrl_dbg().

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/hotplug/shpchp_hpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/hotplug/shpchp_hpc.c b/drivers/pci/hotplug/shpchp_hpc.c
index 012b9e3fe5b0..bfbec7c1a6b1 100644
--- a/drivers/pci/hotplug/shpchp_hpc.c
+++ b/drivers/pci/hotplug/shpchp_hpc.c
@@ -675,7 +675,7 @@ static int shpc_get_cur_bus_speed(struct controller *ctrl)
 
  out:
 	bus->cur_bus_speed = bus_speed;
-	dbg("Current bus speed = %d\n", bus_speed);
+	ctrl_dbg(ctrl, "Current bus speed = %d\n", bus_speed);
 	return retval;
 }
 
-- 
2.39.5


