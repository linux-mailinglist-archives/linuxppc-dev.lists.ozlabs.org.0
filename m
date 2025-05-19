Return-Path: <linuxppc-dev+bounces-8681-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 950E8ABC9D9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 23:37:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1WGz31JYz2ykX;
	Tue, 20 May 2025 07:36:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747690619;
	cv=none; b=kT2UnF9htwk3Gyo9KI5rYO8jnzkd7S2HAALGduhoEpGwU6n/+z602kAazve2zm++meTZgHFGgRNoaXdEzeRHWxeQW8zRrdv2zc6lXex0E8GGGw+QFESjy/wDIwwV2cAb5ldnRu0FnklGQlUIZjrrd0G+dbCBcgt+TtKeEwB6iJ+X2FhyhXGPgHKQebDyzjLlMiEwzDK6ObEg8BKTJml+2PvPKWQ7/e2T1HLhbM3e7OjAeKNFbfwPOgk1hGommX2YxnQJsjPqeWwV2h5i1g5BARUv0+7Nr8+cSFVRpZ5I9nrhMEKPhqo8jqUDAvKBH73hm6Bga1Wj2QapYN8LWJeDaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747690619; c=relaxed/relaxed;
	bh=orspJc/yjXfqOnlpaTdhGYTpIPYJj08ty7Ou0rbL5eM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kWRpj040FvE0Irzno44zng2D1KsipenJuTMWRGKiV+vtIDc9Em2t8CPqGipIKJqq5gqRG4mfa5Hp3QYOx7iCznQ6zK/ivdIbFwf7oqxXLCm4iRUqt6i9XWhES04AbuRqTgGjIS9j0N6VksyIP6KpRdYxpaVBXUATrOCP0luJHG5ZsUVQi3LRsKQXJPJ16N4n0lM3rdx64tIzNkrHWi6If+HYuJdYjCOdQJ3dzpDTLjMJpfx9vxRyZONnbWOlesoP13fjpcMIq1cxMuiLtS9iFotIfykdrXgN5p95Mu0+t4sfJFDpkEEJqnW03U8DBqTIld0Tv6O8gkCZpHMl+OAHNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fTnNXU7m; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fTnNXU7m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1WGz02kQz2yrF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 07:36:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 29AB75C55FA;
	Mon, 19 May 2025 21:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89EDC4CEE9;
	Mon, 19 May 2025 21:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747690617;
	bh=DulaQY6ernJiaxTu28SIKrpHEXWBgTCvlzTG5LfrQA8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fTnNXU7mDGJfOvaHgjsFPzu8rMdbjnqqbs3rxFyPOEwKP0a0NVn/WQGfFoLpoaFuX
	 mhxT3R0NBa56lgjvAbcvsq//vRcK6G9graqeXgjuYxFSWBvxXudsIsAqJWIQu8IX+X
	 6oHceZioe/o6WKpQfxeAABaqf/SLA/Al66RL3xIcdqt8upxheGG4LcqQ3pCWLXQVbu
	 dSsrmd9PfaK9Qx/7IcxZS92u1EJs4xIdqWRel3KzpneHQ1fJyE0SfeVMqR0pZ0ueNO
	 nCFCW+aAdEVa4LALIq++CLJ5VpXwggu9t01J7hh/xGVRMNgBbcFTsBybWXNs2NveUR
	 +p3/Y77CJOL8w==
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
Subject: [PATCH v6 04/16] PCI/AER: Extract bus/dev/fn in aer_print_port_info() with PCI_BUS_NUM(), etc
Date: Mon, 19 May 2025 16:35:46 -0500
Message-ID: <20250519213603.1257897-5-helgaas@kernel.org>
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bjorn Helgaas <bhelgaas@google.com>

Use PCI_BUS_NUM(), PCI_SLOT(), PCI_FUNC() to extract the bus number,
device, and function number directly from the Error Source ID.  There's no
need to shift and mask it explicitly.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pcie/aer.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index b8494ccd935b..dc8a50e0a2b7 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -736,14 +736,13 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info,
 				const char *details)
 {
-	u8 bus = info->id >> 8;
-	u8 devfn = info->id & 0xff;
+	u16 source = info->id;
 
 	pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d%s\n",
 		 info->multi_error_valid ? "Multiple " : "",
 		 aer_error_severity_string[info->severity],
-		 pci_domain_nr(dev->bus), bus, PCI_SLOT(devfn),
-		 PCI_FUNC(devfn), details);
+		 pci_domain_nr(dev->bus), PCI_BUS_NUM(source),
+		 PCI_SLOT(source), PCI_FUNC(source), details);
 }
 
 #ifdef CONFIG_ACPI_APEI_PCIEAER
-- 
2.43.0


