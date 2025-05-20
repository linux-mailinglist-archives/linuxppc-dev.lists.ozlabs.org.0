Return-Path: <linuxppc-dev+bounces-8780-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A273BABE659
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 23:51:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b27Xm6WLWz3btn;
	Wed, 21 May 2025 07:51:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747777864;
	cv=none; b=nIqDXwlda5mWeYoX5Ci86J6M7EA/aMACBuN2cbqsSxtzM/4QCjVWLXpeu21NrgSDHxN5J7895SOVJGbAtM/Kz0ggIJJLkNHKbhnTgrwzPmOdxE04NuMLEZ9n9LQrGYUBDBWohAexoOybqc4vReg5anbvzyZYmgBn6hGI1QH3dlJkMDHcMtK/3WKmBnjfZb7fTKo8pDjv/v7ZfTqQ9lhukvSv0jV/U9Pk1H3kHeSEd8KWvFkZJ0LPBqb7U66+M24RbEr1PY38bJ1yeKrC/Y1wYg2BOEnkNre69Hc04k4U3ij3WYyLTTs58csmcrrynZhim4qrxWlniWo8wfIgaFY9JA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747777864; c=relaxed/relaxed;
	bh=3VCSgE8O1IIt2bNRgzbhOp/2sZdsrM7FiscMRjY0L34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GRurf+9XLIK0Rkof/otbbdCoB2yOGuXmyN5agc8ADpsyA29SJdDorYfyNWO9xZrTdeq/f480veNDT4p70BSxWGDKlM/ylqWJD4COCFvZiO7qXUcWbzA4HCaL8tfb1zaWjm5bj52wfLE/85+fUVl/hij0Ji7M6q+rTMILxaWoMqsOKhCZiLxuoRLlCG+MoPPT48Aks0YPbvFvmE4LQQY8FH3b1oSFJcbMSF77aBmIn8elpd/CjOL/fJXYtLzHMSxLjtiUYEHgxFQrTAWcdQi0DBX5sjYkf1a+dQ/Z1DUBZ+wV44kh4Vfvv6AdLcpnnh/tWlJeu1jcCmc0qYYfCr7Qzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gesPznDC; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gesPznDC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b27Xm100Mz3btm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 07:51:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5885D62A17;
	Tue, 20 May 2025 21:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A8FC4CEE9;
	Tue, 20 May 2025 21:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747777862;
	bh=dpCtchW1Q/e/Nwy/CkYgrrg4p1BNgxFi9qKubhq9OqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gesPznDCrCcBrIneZgTAr8fgCKMtCBxeXi0no2IvZsLsEBqp4vop3xNCvvq8Sh6Sz
	 fp2YnI6n1P5YVyw0hYAgVKhTMhga8z1MpI1yNVQfBgxeRK5T786ddR1d+DrW1B6opK
	 IyI5wi/j6ZE1pNNnmJmfB0HTL9TFPJLRakLDcGm4jNOd+Ny5aGSgYO/vvDJT2RSdND
	 6lWS/qW0F4Vz7tIurlNEsBKNSqV8JgnCsoctQ12/znukMoVT64q3lE/ZWlLtRN6YRc
	 iX/KP2BdLsvfYCT8lgYzl7PKwCFJDrS7CFUX+q5jQzlWpbERUMMtaOe2hwwCtkVcb9
	 SgQwnrOxJe0iA==
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
Subject: [PATCH v7 07/17] PCI/AER: Move aer_print_source() earlier in file
Date: Tue, 20 May 2025 16:50:24 -0500
Message-ID: <20250520215047.1350603-8-helgaas@kernel.org>
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

Move aer_print_source() earlier in the file so a future change can use it
from aer_print_error(), where it's easier to rate limit it.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Tested-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pcie/aer.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 4f2527d9a365..520c21ed4ba9 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -696,6 +696,18 @@ static void __aer_print_error(struct pci_dev *dev,
 	pci_dev_aer_stats_incr(dev, info);
 }
 
+static void aer_print_source(struct pci_dev *dev, struct aer_err_info *info,
+			     const char *details)
+{
+	u16 source = info->id;
+
+	pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d%s\n",
+		 info->multi_error_valid ? "Multiple " : "",
+		 aer_error_severity_string[info->severity],
+		 pci_domain_nr(dev->bus), PCI_BUS_NUM(source),
+		 PCI_SLOT(source), PCI_FUNC(source), details);
+}
+
 void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 {
 	int layer, agent;
@@ -733,18 +745,6 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 			info->severity, info->tlp_header_valid, &info->tlp);
 }
 
-static void aer_print_source(struct pci_dev *dev, struct aer_err_info *info,
-			     const char *details)
-{
-	u16 source = info->id;
-
-	pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d%s\n",
-		 info->multi_error_valid ? "Multiple " : "",
-		 aer_error_severity_string[info->severity],
-		 pci_domain_nr(dev->bus), PCI_BUS_NUM(source),
-		 PCI_SLOT(source), PCI_FUNC(source), details);
-}
-
 #ifdef CONFIG_ACPI_APEI_PCIEAER
 int cper_severity_to_aer(int cper_severity)
 {
-- 
2.43.0


