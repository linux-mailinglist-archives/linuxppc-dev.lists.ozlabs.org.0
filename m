Return-Path: <linuxppc-dev+bounces-1333-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ADC9782AE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 16:37:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4xjH31Cnz2yqB;
	Sat, 14 Sep 2024 00:37:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726238243;
	cv=none; b=FiLwpsyYREmdz9RJPlfdj+N8Rfqbda9iJkvEYM2ifPimAdkDn2og8xC05JFy9QkYsDnfVnGCPQ443nHu7GK59uKxwezIGY4uTpHfOxoDpAKogOQWhg8ufJ4kCjYlGCwWIZUzfDki9BES1AiWdexHG1HmSooe+1RfQ1ylU+Zxw1MAR5TBWKUZQzzLXHJ4aX1fGXHD4Pi9Fxnpu9wYFSokbs+hVjxJaoZYr/fu/pvxB/ACmuX3CJydB8XR3In42J7ba0Ow8JbIPyWmOa9scmy71O+pQ0qhME6e9mXGdkS6LW2ccjKvi/7HLVLsXm06GVsg4S+cVuGWaD+syw4jyHZ6Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726238243; c=relaxed/relaxed;
	bh=CubNJN1Jc6E8nOqNs+evJ61HRcBxcneNbj7CJL1z1oc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mb12LyXZJuEl4k4Va1NzkUzKSZso4Uxj/7cLzaWEnLwhDfACAbxvQPV2dK/u3pfZIrRwpKl6ypFkj5un4fsMjRMveGMYOQYc38aGD+zuMRVt6sVr5diDEqRoYF4rK94nFTRIL1v2+otdgJ3eDd4cZEPmi9A2L59IQiJth+iY1pchdVkwGlCft9vOPdBXb/vMLsHDKdfiiAkP57b7hBtQ1/gI3Fd4rl1Mpab5kNMUxVFzcScZ9ZQz/8U9Ivd5sm7K+PQNQdF17EHwqhnfVoTYD6H8UkK8TJGjxFEdIhj9KIUoW8e13oKJThHQqXBXcy7qX2M83hoksXW08rN5odrpqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NArw+B19; dkim-atps=neutral; spf=none (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NArw+B19;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4xjG6CYVz2yq4
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 00:37:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726238243; x=1757774243;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vrR9lSZtbojiA2EubTfEXC7NUqhoH2bBkEIK7kkkTFA=;
  b=NArw+B1976Y6018c4z+ZC/4HjqGjtLy5eWfjJIIS97TYFwseEDsJZiun
   5GhRkWtOjX/iIrbIIpJu6VKA4Geu7xqo71lo7GzC8qz/g/+XBpdW9Z0Am
   S5TBLLVdtx6PrmRMdDJ55D1xlTEcH4r/DsjGMXQ9pwv0vYroPMv7UQmpB
   tdMcRKw/SKH2zi5EVdjBLNb9p0mMhbVV9gDD+YVeK1NRf4DqEiEt0MraM
   Dh+x0ZljKZ4LjbKc/QI3N6xohNXt+miLT0k+tHTgn8NdMP33hjT+qYlkg
   S7lRpc8Bk17n1zgVgnejn9prn2kSGIJd4/KXLuED82sbLHFhlM8nqPSnt
   Q==;
X-CSE-ConnectionGUID: 8QxJgA3kSBOKc2MjYqDDuA==
X-CSE-MsgGUID: LdQkWstdSAq7oqX9di8V2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="28886524"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="28886524"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 07:37:21 -0700
X-CSE-ConnectionGUID: 4Ad/XL1YSjipkJFyp6pVbg==
X-CSE-MsgGUID: a6/9cR+jSM+V6/nc+ovmxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="68400273"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.154])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 07:37:18 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v6 4/8] PCI: Use unsigned int i in pcie_read_tlp_log()
Date: Fri, 13 Sep 2024 17:36:28 +0300
Message-Id: <20240913143632.5277-5-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240913143632.5277-1-ilpo.jarvinen@linux.intel.com>
References: <20240913143632.5277-1-ilpo.jarvinen@linux.intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
2.39.2


