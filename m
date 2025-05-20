Return-Path: <linuxppc-dev+bounces-8774-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C10ABE64D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 23:51:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b27Xc3HXbz3bkG;
	Wed, 21 May 2025 07:50:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747777856;
	cv=none; b=YvE200EpXtezorhi3XWO59Ads477bUuorc8+SbEprgdKaHOcCOxmvIomqL16o69QOkbUR3SPucD+sC4c1B1guoQZlJk29AlYrko336PSLsUgt50pLp1NusZ//r8IHgwCTP/MBEe33gUW30FxuxvXdVFXk16y1eQLfiM7rnocYnpgz6UeaFngc6/7JyfjAnmyRJYI0jA4zYfaRK9f6r5aqIqxzCn+pIL+0IJ4CWRWU+cFK0uoFGlrC+RPnv/qm4t23RfiaZmUJ2E5P2CNbA2ecFZZKi9wpxCq7zMXp+fVKVCf2wbwdXsZdScJl7XtjFyGAYazbcGIFOBsUMq52klN5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747777856; c=relaxed/relaxed;
	bh=K1c6T5/OKjq4yFx8IqOIkXtSQoBeFE9wWfBgujkmFVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EiWkcczX7c6+UQEqKv/A7sZz7+mxTFrnnN32mnavnbDH7fL53aW0FQdIb8f/mMRI9w2rp0j8+TqcJvFjkvuaocURZEt6Y4zWQkx8r3qAtA7t5ixvg4r67xNu95eZ5pIXCDzYYSF70Otnt+Y0vAqQsiOHwyRymJX4OZhpuIm0a7MN5eogDHX6/ufOQ+Pi0aytu0kiCLTJZ+GAWFbzUCgi/2kQApLX4I3bpRICA2kVYwOrTvT+1vLMTjQN4GfYFaGbxpt/G7ukuNG5P+juAnAwlMDI9ce0mTwGlmAXfM1Ey7XWikE7BZi0HjWOMbbkdugYpmayO+HGr+aVdxbBf+OhRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hlHUMTGL; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hlHUMTGL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b27Xb3hPnz305P
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 07:50:55 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CEE40629F2;
	Tue, 20 May 2025 21:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB0DC4CEF0;
	Tue, 20 May 2025 21:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747777852;
	bh=IPMbbOcFFDi3G9kSOU1LeCM9xJi4UaBswiex0tdbMIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hlHUMTGLWmpM22fL61Vds0cpKCxjl3zGYlayGT6PKSn/Rpexo1WJs5gFt9PABLjUl
	 d6B+v/zhU9oufqMfBlQhry88S71PfAKH7ErQmQ7WH8GaahjHUJX7PJbK4MmbaZdggP
	 Lt9Pfxeev2ikn6wrWWuQxTOjDL1v9wUaGy++wa4V+pR03m+gug9Jw9J3fKYl5DJdnT
	 Z26N/+lRxCNGS7rkSInhz4T78PjFX+jSb2NbkhiI//4vKvoJUW8vQOKEZLGAi29qXC
	 an7FAU6tyOU+udoBYSMj87RtxRu8qbVvrnX4rmyTZ/wUpHTyVRD/S87bF7lZp00vFy
	 EAbwhMLV908zw==
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
Subject: [PATCH v7 01/17] PCI/DPC: Initialize aer_err_info before using it
Date: Tue, 20 May 2025 16:50:18 -0500
Message-ID: <20250520215047.1350603-2-helgaas@kernel.org>
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

Previously the struct aer_err_info "info" was allocated on the stack
without being initialized, so it contained junk except for the fields we
explicitly set later.

Initialize "info" at declaration so it starts as all zeros.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Tested-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/pci/pcie/dpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index df42f15c9829..3daaf61c79c9 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -258,7 +258,7 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
 void dpc_process_error(struct pci_dev *pdev)
 {
 	u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
-	struct aer_err_info info;
+	struct aer_err_info info = {};
 
 	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
 	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
-- 
2.43.0


