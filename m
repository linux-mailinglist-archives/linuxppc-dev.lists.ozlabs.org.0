Return-Path: <linuxppc-dev+bounces-8686-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A1BABC9E6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 23:38:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1WH72qg7z2yys;
	Tue, 20 May 2025 07:37:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747690627;
	cv=none; b=UcvQGI4aD9KBkHBoseQRIA5cfyese1n9Ea1JLUnJcTaACgC9zb+hDrlJTp2TiyOHyB7+qY4UmMEJP9AbMrfWigsY/vIG+99oW/IJ90vs/k/rGSSSCMNbzToae2wtgfATtkmvBZANYUKenzgLlvU9JBzZLjlq110wWNsm7EUSjFH1gqjjx5muQz/QTXtyIoYkVQ2USZ/zUQg5InZb9E03YY/bjIhxa0/eADzbjmDhAHyyM33ClZEPvGD3ernkxffjw5tsh0MF5UNb6CQnK3dWiyktcA19MwlwefDdiwKMcYsdlJ5k6WbtSa9hIAQqMTur6StaQpJWlizWgP/nRVZ32A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747690627; c=relaxed/relaxed;
	bh=E3zwnmpg7+IxdnAWtf/EtwXROZMEf2wpnKa2zuND/TY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XNipTIR3/W9py7WXBRnjn1H1IEug8A8wAtoDx79taqdiW4Q3yddBTl/DNTZ1lCJB6Cfhk3jVlD6SQIC8qCmT+BSL+TxE9RfHvOByV9Fm0YtYXtmFa8Fys9zE2uCWIaOWQXze5UCoSt612zCkF9UEJjON+UEF/kNrc5BCU/Gy04Yp+CHiz1lQLfrznv84PEiH2VqSpcj9SargKulIljxXyU50jCPE4fTZaJ+mK/x8gteXn383DnnRu3vIAbP4iR+edDNZTCieDQ/TmrWBoJd2mbiohBq55riN75QqOaM0vmcHIKDHxOC3rvIwdZAHbnb6U0FYoMtX8PeQuVoUP+782w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FanzLzd/; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FanzLzd/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1WH64FRWz2yqg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 07:37:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1370C4A9E4;
	Mon, 19 May 2025 21:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C125CC4CEE4;
	Mon, 19 May 2025 21:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747690624;
	bh=8K5sDprPkS4frD6Ujl8cJhUCTK82u2aJfFFj51dk78M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FanzLzd/XC+i2vgwSpoMtnfHCvFE+ndlzC5zS1V9xrvW3pvtPwg76YudFotYWcrYP
	 /0VZyV4Tc/h9XKxBYf6IV8Iis5rD3sBS8sazMTTzYFGYs2eSf0dQWTionBZWQYmJbc
	 mPGaauRPG+HkczhJPGbN866GWbGq/V3bSGpy3YEYEwWHyORMWnyUegPZp4vVHmO0Oz
	 I58sZ0UjIv9txf8aVRTL7g3qN7VqbMU/jkBx/2pj6tyNhSBMGMjHUtzcPfmcv9RE7M
	 bFYMb0xGqPOneMpdqAqdhzPaFMzT/1bqaTQfMGUlT9uSqPlaESsJaHJRGWc+pcj4I4
	 fDXmBtKn8IxDQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Cc: Jon Pan-Doh <pandoh@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
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
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v6 09/16] PCI/AER: Update statistics early in logging
Date: Mon, 19 May 2025 16:35:51 -0500
Message-ID: <20250519213603.1257897-10-helgaas@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250519213603.1257897-1-helgaas@kernel.org>
References: <20250519213603.1257897-1-helgaas@kernel.org>
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
---
 drivers/pci/pcie/aer.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 73d618354f6a..eb80c382187d 100644
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


