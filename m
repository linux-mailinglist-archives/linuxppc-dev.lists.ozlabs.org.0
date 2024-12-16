Return-Path: <linuxppc-dev+bounces-4201-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBE49F3568
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 17:10:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBlKN05JTz2ypP;
	Tue, 17 Dec 2024 03:10:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734365431;
	cv=none; b=kwhUMjAXfUgGbl0pBO2o5gQQFgrpl6r9iXtrsLUGFjN+cQJaiy5sCOa0zP9EJalN+gwYtcW/Vq806s/RI1Ze/RWCLjf/5p6tSOP7hPwWlqrfwfFN/TaaobRThqu09Gm2XxQBdw9B+RRLq6A011PzKXPFHsvfG3nm9rZw44mMAfW7aPyCvBBWnusgw4xWcSI0ZtVsfSdOofI5A4neBXATiCesaaSIZ/gCgipQ8BR6T4LE9fHxYCFEpvZqR+ZXOikjEQRA0U0jpJkoFnlh4s7zTr6Pyrx/aYN/cRWiNkESm7Kop+NEDTuXRDf0Wb3+is6ekFcxpD8gIPvwxW8oSPjZsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734365431; c=relaxed/relaxed;
	bh=l8Ee+2AFDqOpS9U6dfMCFjpWH35M9tHtSeEg7JCqlsU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kZnGfm1wiBhAp4EjHU7OvNHv5DqF7WzuLU5C3Xt65mBpbWOtSZSsai/7Hu9RXxxNuCnWqZjKmb1jF6BJ829COEYuY2vCLi//485jUzCm4OC/t4KrtG1YvjT1yc38ZA31r9ZZK+WaqmlAI5mtlW5qtD4IiE0B2UA96fJ6X+C6ykYnndwYZPM1oSao1Df2MdOeSHJ4cMG7l28LSU1WfBhDvKFbZ7qNFTlNuxbSOoRcriESJN5ja6e1nfyEcBf0xALtL0Gl419D+i84xXv6jVo9S6NG3CR2qQxy1waU4UFhCoNfjOd49hJoj9jhKYHt7wMYPownhRZvq1G5K4h1cMCNfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PVgXmYcE; dkim-atps=neutral; spf=none (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PVgXmYcE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBlKM0TrJz302D
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 03:10:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734365432; x=1765901432;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M8Snydld+G3bzzI1y2e+peBZwEHDa69ZjkPqObx7NeE=;
  b=PVgXmYcE4L9+MwuhVtnQ0xojAvNXzU9IiPsuE31hCceHafqUAhyWjmuJ
   yJPAlpxCUkWxSJabAPN+XSQW/0DKt5C2L2nNoNZmCjVwVZp/suFHXLhUf
   Ey4xcDsDFJLvcpQS9ngOhIWnKeQUybxF+rORjnZgxc9BsqHfdf6wAYv33
   DnaGfsYhQG3QqFT+BLmngwYBTzydkxBtQx/9ScF/SpxciOSWTqclEc6/3
   TkTH1xYEor7NuE0CH3ySq9TtAY9TtbnBl00lz+H2Pgvs7mYIblinsFyUj
   jr2EPepygY5hK2qpTsDiapr5S7Aum5wvtJFtBCwko+JKf1k/Y/zPXnnxM
   w==;
X-CSE-ConnectionGUID: oC13XL5hTYi3Fqf2TvgdGg==
X-CSE-MsgGUID: VBx8L5HMTxOjci+/CT+iUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34904200"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="34904200"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 08:10:30 -0800
X-CSE-ConnectionGUID: Q2+nlaXYSGGEBgO8/PGPZQ==
X-CSE-MsgGUID: d3bwhLe9RBuIaEBQXi8GsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="97120727"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.29])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 08:10:26 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 1/4] PCI: shpchp: Remove logging from module init/exit functions
Date: Mon, 16 Dec 2024 18:10:09 +0200
Message-Id: <20241216161012.1774-2-ilpo.jarvinen@linux.intel.com>
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

The logging in shpchp module init/exit functions is not very useful.
Remove it.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/hotplug/shpchp_core.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/pci/hotplug/shpchp_core.c b/drivers/pci/hotplug/shpchp_core.c
index a92e28b72908..a10ce7be7f51 100644
--- a/drivers/pci/hotplug/shpchp_core.c
+++ b/drivers/pci/hotplug/shpchp_core.c
@@ -324,20 +324,12 @@ static struct pci_driver shpc_driver = {
 
 static int __init shpcd_init(void)
 {
-	int retval;
-
-	retval = pci_register_driver(&shpc_driver);
-	dbg("%s: pci_register_driver = %d\n", __func__, retval);
-	info(DRIVER_DESC " version: " DRIVER_VERSION "\n");
-
-	return retval;
+	return pci_register_driver(&shpc_driver);
 }
 
 static void __exit shpcd_cleanup(void)
 {
-	dbg("unload_shpchpd()\n");
 	pci_unregister_driver(&shpc_driver);
-	info(DRIVER_DESC " version: " DRIVER_VERSION " unloaded\n");
 }
 
 module_init(shpcd_init);
-- 
2.39.5


