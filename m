Return-Path: <linuxppc-dev+bounces-8778-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9667ABE656
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 23:51:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b27Xk1my7z3brl;
	Wed, 21 May 2025 07:51:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747777862;
	cv=none; b=DA2FXPS9QxWkAiKaOA8OtNhfs5r/bUifSvoYbe3asMbcxZqj6AKLaMuW+m52Nn0sw4qyk6ydFLY7nyFS+ms8LYmj3FEDjvfseVS+HPmPALYM34oYC8LkY0gGQYLvsuZQrPM+NNdCM+IBXWcgtGzZuOZ7nkBvZ6M9SFZP6eR5VUgY+LXpMjKioDyk616aNTFV1oDRo+LBqGKBevyrEhM7mmFQmC4GhO7O5Rbu2br8duO+JbYpcj615A2l9d+ZrepAccYF9cKhp66N4UX752BxHNtG9klaqzRfEHux/UcmQ7mhdynugdpQHmen8sm1GqWg5VMIUPinPc/k0VSA8gVjeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747777862; c=relaxed/relaxed;
	bh=0DAD8lPFVTjBNU8VWhBoQ4GiyDvDPsET0Ch6+wt/R7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yrb11IbOhzX6URuu7yex+z4C9BkZkyzdc5YaryqCH2dCeHIZmW9Zd7A64+PdXptHCliFMXgTrSn6Q6qiGR6ibpYHVDsYJ/BjZXwOKnxzUwps17kpNtrc/wB6DYJgK1znqMyRu4tIsx75HS4G1+TzhY8F5vJlCeSDRZmGEgdsaNyug/aFYmQ+Ee2BJ1uVYRTMXazpELZRn9EQ47PAGugD9OKYnXpdutrQf3+DELC7g4Fy4SsTgHsoYxUEFcCOzJplo6KfR48+BkFC4tFROj1bVAd7gJxJ0nC3m37cCjPdf+I8n//ZGQQ9vf0VLB0Q055Rg8lNsv79Hbk7fzKvXZPxng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xw5/D6ub; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xw5/D6ub;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b27Xj4bNjz3bpt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 07:51:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 22C40A4EF17;
	Tue, 20 May 2025 21:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE572C4CEF2;
	Tue, 20 May 2025 21:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747777858;
	bh=DfCE1z+DZHtbk6T5lqYp3+U9vJDn8yI4U9HPklSWhmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xw5/D6ubNIrqLaHAs3MzfRNJY/HxA+EwVKOI8pbDQesm4RQ8k6c17u4gvZ4rYCpQv
	 vIRLpB9gMZFdKQ2+WaB6MR/xqcM3TQBHhFWurdmhHInLLr3g1R7C1SV6A7PsfZSc/h
	 TzufTNioQ06Nc09IzkKNYsLVeyvYsFpXl+KYeU494IMes4Uzd3xvfitPmDIrWDUjvx
	 hbieTgPM16HHrMwpnB7rVVfn7rIFfJ2r7SxsH6Rl/G4j/qzKyvS0Nxm/91DaMv1OQ+
	 apALITivu1K9218E+y67GsDszYZz/IRijjjPHO3hP4qEijAWcWHvrc9jHTcgN4fHpi
	 XMrV3DVjx58SQ==
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
Subject: [PATCH v7 05/17] PCI/AER: Extract bus/dev/fn in aer_print_port_info() with PCI_BUS_NUM(), etc
Date: Tue, 20 May 2025 16:50:22 -0500
Message-ID: <20250520215047.1350603-6-helgaas@kernel.org>
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

Use PCI_BUS_NUM(), PCI_SLOT(), PCI_FUNC() to extract the bus number,
device, and function number directly from the Error Source ID.  There's no
need to shift and mask it explicitly.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Tested-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pcie/aer.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 488a6408c7a8..65f9277c822c 100644
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


