Return-Path: <linuxppc-dev+bounces-8783-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D24ABE65E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 23:52:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b27Xs2c1Xz3blT;
	Wed, 21 May 2025 07:51:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747777869;
	cv=none; b=aYixCUgv+EO3/+FvHA/e+5u3jCoCz9y9N/DErrkok6bwu6Q8wkvrHQdpRrUSnX/nGKGkJCg3BZXZjNdaxmvIWz1xhAN0ImTvBlFZ6ObhpDx/mQUYxxriKc81DRQL1GtcWJkcbcPMqKvzDSU+sX4JJDEXWlqE7R3sJ8WXN8jvGZjnYfKdYiFnxVmrXsF4EvScX/uWudL7gu1YPD+FQinS5vv1RzHCI2bitA7N6X571BaPf9oNAeOMwqWmVL/Mu3EpCI1tS4fjFi1vAr2IQGzr1NrPYy/jJovuK02Gl12j5wscTVkNFC5x2+ElIxXQx419JIaNQa/boTo8GaWnWbkrzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747777869; c=relaxed/relaxed;
	bh=7CCp+tpdrBGjCTMR84aE4bDxHIH3+3fjoePTXzMrRso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jIdW7ZHHAVOlHkTS4NtTiwXq3Is0jVhdn4QQt5t2+FLHnCcfeyR3PFY6RxfCrAT994UJTgpvt8eFKb6OOEgaE0hjVyPeMcljrGATBPrLBPYcG+qYo+0CeVynTdD/7xCGJWS/bU5HZpMHk+k4XwaeA51YBmzuMq7+4YYH7Dqj44NgayX+isujF38hjFLSujmPyl5r/4t+wsrTm1UFYdqrgurm7QcO8t7fbIMvqsl+HN6Ua8wkCvJEKvwyLq/2LyMJ5408FU3t0uaMGqyFe2XyJOrg4hDK6d19DExxf6xvayQSxweIfN766BRzQZfG3ZbQ51BVxTzAczhVY2zL3Ja3rw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HyEhJSY0; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HyEhJSY0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b27Xr4fY9z3btm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 07:51:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 16B77445B1;
	Tue, 20 May 2025 21:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B238EC4CEE9;
	Tue, 20 May 2025 21:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747777866;
	bh=OOpX0Eg0xkIb+V+AKY0PKBBN/jYunTVRptXbJ0VZdns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HyEhJSY0zIRGJAMZHDRY7JOmJDz0+9IhNkyUXJTzelepSDQy/xSTIP2zPwq6OKHja
	 YNFu5zur9GBODeFpdXlF8Xi1z3AmsO3U895tjuIJl9PIFkH/9fiLJOgfcLwk8ei6EQ
	 N5bV4PwOvZYLCu5yDQO8s/GwkwnojPh4gN8eWiwGLZkrnE9uxrWNeeAy5Hs+VHHUKE
	 oOldXBJz7HZljfBm+chsQFpxbb19yWUm4yVrf9XSDBwnZPKHt/0fZNqYCDkNBrDsNe
	 m1FO5LOiFHmTxcR+MiFu1Cc2szW3TkANcQHNAAoUncfmpuC5if9xK7buwwnHMIuGOK
	 m2JPgiZKhH17w==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Cc: Jon Pan-Doh <pandoh@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Weinan Liu <wnliu@google.com>,
	Martin Petersen <martin.petersen@oracle.com>,
	Ben Fuller <ben.fuller@oracle.com>,
	Drew Walton <drewwalton@microsoft.com>,
	Anil Agrawal <anilagrawal@meta.com>,
	Tony Luck <tony.luck@intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sargun Dhillon <sargun@meta.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	Keith Busch <kbusch@kernel.org>,
	Robert Richter <rrichter@amd.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: [PATCH v7 10/17] PCI/AER: Update statistics early in logging
Date: Tue, 20 May 2025 16:50:27 -0500
Message-ID: <20250520215047.1350603-11-helgaas@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520215047.1350603-1-helgaas@kernel.org>
References: <20250520215047.1350603-1-helgaas@kernel.org>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bjorn Helgaas <bhelgaas@google.com>

There are two AER logging entry points:

  - aer_print_error() is used by DPC (dpc_process_error()) and native AER
    handling (aer_process_err_devices()).

  - pci_print_aer() is used by GHES (aer_recover_work_func()) and CXL
    (cxl_handle_rdport_errors())

Both use __aer_print_error() to print the AER error bits.  Previously
__aer_print_error() also incremented the AER statistics via
pci_dev_aer_stats_incr().

Call pci_dev_aer_stats_incr() early in the entry points instead of in
__aer_print_error() so we update the statistics even if the actual printing
of error bits is rate limited by a future change.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Tested-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/pci/pcie/aer.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index d845079429f0..53b7559564a9 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -693,7 +693,6 @@ static void __aer_print_error(struct pci_dev *dev,
 		aer_printk(level, dev, "   [%2d] %-22s%s\n", i, errmsg,
 				info->first_error == i ? " (First)" : "");
 	}
-	pci_dev_aer_stats_incr(dev, info);
 }
 
 static void aer_print_source(struct pci_dev *dev, struct aer_err_info *info,
@@ -714,6 +713,8 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 	int id = pci_dev_id(dev);
 	const char *level;
 
+	pci_dev_aer_stats_incr(dev, info);
+
 	if (!info->status) {
 		pci_err(dev, "PCIe Bus Error: severity=%s, type=Inaccessible, (Unregistered Agent ID)\n",
 			aer_error_severity_string[info->severity]);
@@ -782,6 +783,8 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
 	info.status = status;
 	info.mask = mask;
 
+	pci_dev_aer_stats_incr(dev, &info);
+
 	layer = AER_GET_LAYER_ERROR(aer_severity, status);
 	agent = AER_GET_AGENT(aer_severity, status);
 
-- 
2.43.0


