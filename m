Return-Path: <linuxppc-dev+bounces-8888-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE25AC17B5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 01:24:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3PW23Q34z3c6q;
	Fri, 23 May 2025 09:23:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747956238;
	cv=none; b=FzOiyQy/kn8/Q8MR0m0a9KPhkyKH16rqMWBR5hIlK1zWSPqwa21ejIH0sXDjRqy6Sqp0JTBQWL7yXakVIsfq794tUBfQ4UpxQ9OESY2GBb1D350ZEeExCgzE2H3QTNnfHA2u2Fv9P1DZB1TyGjJPYN8Uz/DV7mppoeb8yDX4o5g/yDn55uy8stAHepZPtO8Vn7HEp8K7fpfapRiRgSYdgVX/o3rVu5MBjqWAEeGrx/dGvjN4NJW7pH4dnt4tu5BZ0UIaD+Ztwvwl/VD38UHZhKpSmpz6YPNDeIsJWy1arPIrf3ZXi/hVie4fuQ27GQcgiN1o5oDSaOl0AIsPC/L+jA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747956238; c=relaxed/relaxed;
	bh=Sj2cEHtaDzqETcxxtqKidVLg+2FuJWYLTtVkrtnrPBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cy/ttFCteCweoa0CEKp4m5+YyNuPTVALscJ4o8ZGgSO2wwyqD9L+yqIJ/znjV2JfQFOoPDIbvfSvMQc+JdQRcOzOQR2MmxvGpgLjgy3lcrQnZdHFe2epJmjV9fG2itDAxBY1TBiWu5JSbrnOUUKGkWFhkDCix7lA3dWUlMdp1JG1mGMQH80Ys4Rn6bX1Cayeu7l7XdPTvlDKRPr+CgMDxnE9sFw58uGaQJ45PSIeegVzjk1gsiCEbA2SaB2dFFPB19KYyXurNqOXOACKzgss8H3zf4+NXK3LI/y7VlJsPAopDWRizA1IYqNao/1QB0sgCWULrWP7lfhqFjmZxWcOOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AJiY9s6O; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AJiY9s6O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3PW150cnz3cCt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 09:23:57 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 292084A896;
	Thu, 22 May 2025 23:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC70DC4CEE4;
	Thu, 22 May 2025 23:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747956236;
	bh=0WV3S2hggEo8UB79jSOkfPluYQMTTXi8KwtvSdvTY18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AJiY9s6OH7qIicXuS2Ll0QHIyK6j/AWpefUUSdt4LQ8yVlNr6r7iGmcfjJspy//UT
	 jgaj7B41td+8JM3OWqEiS6RXnYRM3z3RUfzS0psqsia66YER2qk0nNDZ5OvejnXPUD
	 IetaDWdOi8KHzJujxUQIjzh5a48tnUttgj3L3a/A4a1eG0609Tp7G1fM1frR+kT3Rs
	 TH6SOIdq6VWqnjbkOJc4abab2sCHcYURXPg0goPTRyEEXrJ3CIkCB+Txy0aTFkKAMh
	 KG+4EYdIPQkdKIWsvoNC5oqxexQCSZDyG0/AlE+V/1OVG6XW0Ie8/vrovK6d8w+H2R
	 KH0Sm/rRbQHcQ==
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
Subject: [PATCH v8 07/20] PCI/AER: Move aer_print_source() earlier in file
Date: Thu, 22 May 2025 18:21:13 -0500
Message-ID: <20250522232339.1525671-8-helgaas@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522232339.1525671-1-helgaas@kernel.org>
References: <20250522232339.1525671-1-helgaas@kernel.org>
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
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Link: https://patch.msgid.link/20250520215047.1350603-8-helgaas@kernel.org
---
 drivers/pci/pcie/aer.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 8b23ef90345b..c0481550363b 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -696,6 +696,19 @@ static void __aer_print_error(struct pci_dev *dev,
 	pci_dev_aer_stats_incr(dev, info);
 }
 
+static void aer_print_source(struct pci_dev *dev, struct aer_err_info *info,
+			     bool found)
+{
+	u16 source = info->id;
+
+	pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d%s\n",
+		 info->multi_error_valid ? "Multiple " : "",
+		 aer_error_severity_string[info->severity],
+		 pci_domain_nr(dev->bus), PCI_BUS_NUM(source),
+		 PCI_SLOT(source), PCI_FUNC(source),
+		 found ? "" : " (no details found");
+}
+
 void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 {
 	int layer, agent;
@@ -733,19 +746,6 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 			info->severity, info->tlp_header_valid, &info->tlp);
 }
 
-static void aer_print_source(struct pci_dev *dev, struct aer_err_info *info,
-			     bool found)
-{
-	u16 source = info->id;
-
-	pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d%s\n",
-		 info->multi_error_valid ? "Multiple " : "",
-		 aer_error_severity_string[info->severity],
-		 pci_domain_nr(dev->bus), PCI_BUS_NUM(source),
-		 PCI_SLOT(source), PCI_FUNC(source),
-		 found ? "" : " (no details found");
-}
-
 #ifdef CONFIG_ACPI_APEI_PCIEAER
 int cper_severity_to_aer(int cper_severity)
 {
-- 
2.43.0


