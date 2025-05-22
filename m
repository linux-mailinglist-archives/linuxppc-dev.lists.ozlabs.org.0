Return-Path: <linuxppc-dev+bounces-8898-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A44DAC17C8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 01:25:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3PWK74Hcz3cFN;
	Fri, 23 May 2025 09:24:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747956253;
	cv=none; b=OnJKsQRId6JqbFxGEsz+Mrq6ZPFNJny79rbPz5bEJzAnRGXGla7buuDa9t4jPucwseuAvY240jz9P8GRg2YlM+6Vt3+QOr+giMoLit/eNWnjJBUaC9FwKfjw6etU9RbGmqyCs+x3NF5fJUMLRRT89O3EeDN9Lw0hn21NaS/0Ouq5pKeiCcKXSDmK9ka3vF9hcL9m9r6fomG2Nt9Zww8XBWb9LGgxVvADsdKmL6B2tid1KYYInszkLnB+kekatpIgqjcl/L3+MvIkhgVqMd7MuiFrVBZtTMYYeHhBLNG7p/a6peYSZFCXewAAJTM7icmeXdoG243K3GFH5T88pJe9KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747956253; c=relaxed/relaxed;
	bh=0S4oSXizR+7vHLJEAWDz8F2LRr2JOlC2c5Jvo+BeG1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DAQHDcVt4Ba0JB3th4Bl5V4m3mZXLDuKa1eq9SwpB2PVY4qO5udmU8zB47OdAeG7dCntZhfw84fbnev+ivFLwzO9tGC3zZAzaufPPrbDY4z6w4i8Qq18RYpTudGZiFT9O4g5iSwXD8clkvtuwg8uNnY2VCb+HHjV2PAR2OUIfKzF6wwcHEhQb/C3qlz7u4RZ85pUaC4TTiJRL9qzUo+uIabQkX0b7EwU0o9l8N0nkf1zC3vF9BFQfH/MAyYABEC/7zBZEySUE3wSEQTvqM6qUX79RjTq7uN+2aXsFKdlh3A+HYft1HpvFsCAP/cX4kWh7PUBmqCKZSfoR3oIMY/C3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oCs04wGp; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oCs04wGp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3PWK37r8z3c6f
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 09:24:13 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 917E8A4F6E4;
	Thu, 22 May 2025 23:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09553C4CEE4;
	Thu, 22 May 2025 23:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747956251;
	bh=0NnXHK03v0YhVssp0Pj/KjB4v+bprwz3b10dhjyQmks=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oCs04wGpWOkY3jtNO+fB+6ZsGXB/XioC0of+kqL1hxl8syhgRhYiMaqQmnZtniwyd
	 moJfS0aQcI/FyGIct1THzFTNDwonDpCp6joPzbUlVCGn0NRZ1/IE9IH4bfdsLwbgDX
	 BerGyHGHspOeiMJ7VNsXFyOmqzV4Nmln/+byARXaXzCbwSXCVChkVBPgGVs57z89Nv
	 062m2+/cb+z91zaRErZecBCXRxrrvmJ7+EQrEELGP/Yu3ZWmJWe5MqziZBRyfuFRlf
	 npDwKQRkwVoeLvvCoDKFhXurR3RFG0ybw0K9/5n3mMC/uRyZrJQTE9ff7PTwHOiM/N
	 h7RnK/ushzdDg==
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
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v8 17/20] PCI/AER: Simplify add_error_device()
Date: Thu, 22 May 2025 18:21:23 -0500
Message-ID: <20250522232339.1525671-18-helgaas@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bjorn Helgaas <bhelgaas@google.com>

Return -ENOSPC error early so the usual path through add_error_device() is
the straightline code.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pcie/aer.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 237741e66d28..24f0f5c55256 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -816,12 +816,15 @@ EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
  */
 static int add_error_device(struct aer_err_info *e_info, struct pci_dev *dev)
 {
-	if (e_info->error_dev_num < AER_MAX_MULTI_ERR_DEVICES) {
-		e_info->dev[e_info->error_dev_num] = pci_dev_get(dev);
-		e_info->error_dev_num++;
-		return 0;
-	}
-	return -ENOSPC;
+	int i = e_info->error_dev_num;
+
+	if (i >= AER_MAX_MULTI_ERR_DEVICES)
+		return -ENOSPC;
+
+	e_info->dev[i] = pci_dev_get(dev);
+	e_info->error_dev_num++;
+
+	return 0;
 }
 
 /**
-- 
2.43.0


