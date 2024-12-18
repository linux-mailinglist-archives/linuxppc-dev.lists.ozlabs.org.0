Return-Path: <linuxppc-dev+bounces-4328-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB319F68B1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 15:38:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCxBQ0Sbwz30WM;
	Thu, 19 Dec 2024 01:38:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734532718;
	cv=none; b=XWc4LAeBmycqklvEZfeiAyAN3JZZ9gHhdzFimSiSt41bQHSeekCe6aeGeSroKKOfv616cLQ3vBaVss7axpVHadIHUPw6GnwzGU+81G+pEHZiVCx5lWOrRlyCUl+I5QA36dlVNfROhFNuJkxm21BvSAOKdgFzo7YorCJK08eQQbBoQTkw+aad+uwaUFjU7t5TBSWMF6XwRtGiFv6sKdHlYlKAaNxwcuJQvR0Q2srMKQXUxesKt0Dp6I1CW3sI4PqRjbs3vyfqoMqGa7sxe1n4YgfugScnf5bMDCmgp0tI4UkGyFjgnU1Uofhcxdy22r4omvJAu3KqNzIB5r89hZzXbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734532718; c=relaxed/relaxed;
	bh=MQDDFz7PQ57B4QEhaG4sYrCWen9+M/FyQP1Li6Q5KOc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MbqRkzuJzP+8Klllj2m3WQ5n/El1qugqR8kYsAqGdg4/Py00ZxE7ZCxuF/LGEcGzEcjKJdMu475v+PNZyVrRIZckrHx3kiEIOtAlLaLEcH6U+who2LPC8ND9v/hDPBxScOourZlRJbvonYXLYcqsfWdSGZf0BzsA73EirU+Ziyw8PmTVbj0u276J9yWlpKnk5Szx5JzKmVDIDbbfOp/28GIWciObCKGJtdJfj0niEcmrPKmO6O8NTbg9ySUsfQJJECm/Zbkckr16ahrCRuQWIEHYF532BkS+QWZMwY/B85+XWKHdgFqoBfzaNH/5AmZ9cep2al+aJtl+F5b1eAcJOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ic8fSewo; dkim-atps=neutral; spf=none (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ic8fSewo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCxBN6nZwz30Vm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2024 01:38:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734532717; x=1766068717;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=78Wv8nMlCG60akINHhov8RPvttOjLmyuKns1EZFOA6o=;
  b=ic8fSewoTSCzd8DCQ14H/L/8/zCzFC9e3B+MN/bN65ru5FBoVKqhQym9
   PsArAgyasCbbS2yU8xLBcXWUzZ3ZOpRAT/32MNYsz6OEKzK/BHk7I6fBu
   XQyNQFdk40tamle31WYCDUFxpi0S0267vV1ehalOm4rKAq4pfjL/197D5
   7V7O8icHtLZpFRAesrUHUa3/qJDvIHJUkuIomj7spmv0VkpsXyzdHWAI8
   g1HJg8X3tZomm+8ulW8sEcMDpZHwjO9aagvIqFWQo6ypsE1THHDCid3OL
   Ne/WMJaQyodDxoFQ53Lf3S+IkcZcL9O00Z02MzQUCg3BZ5ep2PtlkZsE/
   Q==;
X-CSE-ConnectionGUID: Ot2D6IKhSH+X6in31eUmvw==
X-CSE-MsgGUID: azjiyeoDQqCn1XzEAqP7yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="22597432"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="22597432"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 06:38:34 -0800
X-CSE-ConnectionGUID: 033KUQ4YTuCSz2+5HwvFdg==
X-CSE-MsgGUID: PkjesBuCRDq5zfXJPGRbIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="102974671"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 06:38:30 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	linux-kernel@vger.kernel.org
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v8 4/7] PCI: Use unsigned int i in pcie_read_tlp_log()
Date: Wed, 18 Dec 2024 16:37:44 +0200
Message-Id: <20241218143747.3159-5-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241218143747.3159-1-ilpo.jarvinen@linux.intel.com>
References: <20241218143747.3159-1-ilpo.jarvinen@linux.intel.com>
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


