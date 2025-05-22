Return-Path: <linuxppc-dev+bounces-8886-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1620CAC17B2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 01:24:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3PW00lSKz3c97;
	Fri, 23 May 2025 09:23:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747956236;
	cv=none; b=QfNoidjng5jqvO8K1Xn4LB+9BjdTNDPoaiysl78dud1FCUr4Rkeoi41wnZ1cOXCgFkmSAQNIAyxZ7TVUk1faHdRjoeQfzeWQ7iTex+TuC+vgXroe9M8dChId7u8tiFuMTgbSbbkR4GdeTLS2EgX3fa0ywazr8zeq4lz4crwyR0JTgycE0V1e7R3MfMax53cSjVCGsVAXYCsqG8FSQFt9v4VtK/jaZxpU3ou1ng84w6sZj8c8nW4HpV/6JRmzMtH9f13dMhPjxLRKs0lBORKfmPcAppESfmG2duwVzgwcvpTovf0JJYIq45z2h4EmancU+zJbzvrM49pIKvnJRSauxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747956236; c=relaxed/relaxed;
	bh=MqfDbPqCLTUj3DQjotpBmNk205K1hpkcPx1CIZZEhf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BmZdXAWsUffDIdXDk6nVj6Hulv50FtSrSh5B8EIIpF0dz+w9rnRgB7/biVNJwvI86MR2sNH9GPHVfKy7NPAUA5jZciEXwHeGaTt8yM/ro/XCPtYFUT3mdcQHEz8sRdZzRmVvWap/exH6Y9BzScvcwwwuQTWYCNvPRmcaN58qkwjsmu8Xpet7ToZZq1ttw9E1WKjJrk09jkG95REJ0w6R7CqIr2JOb+4J+/XrXTemuUScLvnp8HNIkmzTkUbuOp0qQVeuf6o4v9bxdvhe56/7uCpAAUhNwmqPd1zt7LNedr9Xr/742CYm6pMeu4zsnDDB8+YL/iNvm/BXgdzdgc6ALA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FtQWdQBR; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FtQWdQBR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3PVz2Kw0z3c6q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 09:23:55 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 525D1A4F6D2;
	Thu, 22 May 2025 23:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE8FC4CEEB;
	Thu, 22 May 2025 23:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747956233;
	bh=FL/KoyjRpNb5esqwvcFXhgF2SuWjbLGgWfm72WGlhjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FtQWdQBREu/7Qb1dXiqg7Cha3wrc7XLxQ/sWKAxs0q2yKPJKwOMqPoqRkeGWeshfH
	 zbuCA7wVgg0NZdpw6RaTSM5aRYXU0AC7SLwwIW+CYNVbsamO7CHlhcnFutU+vqj9IU
	 Q4JrWGpUbDuiVxiBCBMZ60D9lbJ1UWARQE8Nm9GyvVnSlldHFNonRTjYUzs8rp0vPq
	 X2jVFs8YOZd185Z+lfYM5Wd5tWHIB+jpsWUebXTlfPCuGRnl9x+mxZjjULhE/pNcb8
	 +uO8iIlxWyOFnuIIDb2uw394lVt84jA4xFeS4KMRAB4S/VvKkOB+ScirlU5tNI/1Uz
	 rtlk4rkED5DuQ==
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
Subject: [PATCH v8 05/20] PCI/AER: Extract bus/dev/fn in aer_print_port_info() with PCI_BUS_NUM(), etc
Date: Thu, 22 May 2025 18:21:11 -0500
Message-ID: <20250522232339.1525671-6-helgaas@kernel.org>
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
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bjorn Helgaas <bhelgaas@google.com>

Use PCI_BUS_NUM(), PCI_SLOT(), PCI_FUNC() to extract the bus number,
device, and function number directly from the Error Source ID.  There's no
need to shift and mask it explicitly.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Tested-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Link: https://patch.msgid.link/20250520215047.1350603-6-helgaas@kernel.org
---
 drivers/pci/pcie/aer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index fe6d323306a0..18005615d376 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -736,14 +736,14 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info,
 				bool found)
 {
-	u8 bus = info->id >> 8;
-	u8 devfn = info->id & 0xff;
+	u16 source = info->id;
 
 	pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d%s\n",
 		 info->multi_error_valid ? "Multiple " : "",
 		 aer_error_severity_string[info->severity],
-		 pci_domain_nr(dev->bus), bus, PCI_SLOT(devfn),
-		 PCI_FUNC(devfn), found ? "" : " (no details found");
+		 pci_domain_nr(dev->bus), PCI_BUS_NUM(source),
+		 PCI_SLOT(source), PCI_FUNC(source),
+		 found ? "" : " (no details found");
 }
 
 #ifdef CONFIG_ACPI_APEI_PCIEAER
-- 
2.43.0


