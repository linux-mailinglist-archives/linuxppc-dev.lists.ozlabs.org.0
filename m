Return-Path: <linuxppc-dev+bounces-8678-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D61A1ABC9D2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 23:37:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1WGv2DjNz2ypW;
	Tue, 20 May 2025 07:36:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747690615;
	cv=none; b=ZywGCSTf5lBk5VkDV/3jOV+sJlc7vGWiO00VoDcr4vPvNKrv6kc7g3HxX2TFQTuQ2Tp4xmFkR3f+on4VKoddcTi5X+oDPeT2FzP9yfOUi+wZocdf3j95VmNbW8IbQXk9h9o+Heeapz0PxtJ3rLwb1CWV1tDSqsLA69reA6DpKVAJf9dDAtPUKx8aZZCAmF33cTKbFORGjP2Z6oO6Vl+bZOHzhoJXM17pgoalqFm3f2UPzZTJJ1tk5+jAcsb6gj8bQrGodWz+n+HA3oinpNO+GWnPsVEAnyRQ/g7Fcy2ywFm2tMLqI52aUFcPVRmcEVQAXBdIvPKU/kA+xgDH8Zbhkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747690615; c=relaxed/relaxed;
	bh=JEWmZRH2ejsBPf3bU2OB/R/AnsbSXUu9J49dVwVEHJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Co0ZWte4IToCqJQJmdQNd8DxVe9RSFnwSQXsFdXv4ee+bSzQuoZCBGCpuq4Hd9mj4B5dLyWmLbqN7m3B/mEjfaKSDVSasq2ubmlv8MLTvqrj5OnB4NODk8QWcg0cm4HEs7zOpDcjsIWW3vhu4VAD0GfkrfS0kCUAG47eRAyEVgJhOXu0Ou880qRsDl02wTdvUzcLtd6xZTZp5qKJJF+E+T7lGSnX1CSY1O1WvaRyJpqLSkG/FnWJqYzyPF4r3fveofvAXUxVEVq5ixUECL8n7Klk6SUXYKQgsQiInYs55upOvxw8OtE3ZbcbDCSuwF+vbqhRGZeJes796rszwbv00A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eo5z15Z2; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eo5z15Z2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1WGt4jZMz2ykX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 07:36:54 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B04D5C55BC;
	Mon, 19 May 2025 21:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC607C4CEE9;
	Mon, 19 May 2025 21:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747690612;
	bh=Rmt2heU6dug23EMo4ln+VZFctJP/Iwk2j1rEAWVVSVs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eo5z15Z2eHGhQkhi/Q7GvMAxBnuxma/8Bjv8ZKt1J52ogJmmgXmpX0WWdutBAyxg5
	 TxWeKm8AVa1HxJjSYQaUbRXgqBVycXmy44sHLl2wVcInLYKSG37obTq2OHc6jg8i9C
	 oKiifw6tz9MrIxqZ4bcDi0h9s3sp9Zm1QgnizO6vO6+8EdGd3NNjm0HT/IsoC3pE9U
	 A0jNHIuM+KXLpiYPiE0Q/N/t0yYcn8J8opxTCkVepcYorqEGEHohnJevYWveGB0nas
	 I6nWrHT0Nz1cTLMTNE8JczR1fLBCahbn9ca69ug8xYgdpMxmK6X8pMkNKA1wXJ3tmd
	 E3K4NFc4eyMSQ==
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
Subject: [PATCH v6 01/16] PCI/DPC: Initialize aer_err_info before using it
Date: Mon, 19 May 2025 16:35:43 -0500
Message-ID: <20250519213603.1257897-2-helgaas@kernel.org>
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

Previously the struct aer_err_info "info" was allocated on the stack
without being initialized, so it contained junk except for the fields we
explicitly set later.

Initialize "info" at declaration so it starts as all zeroes.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pcie/dpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index df42f15c9829..fe7719238456 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -258,7 +258,7 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
 void dpc_process_error(struct pci_dev *pdev)
 {
 	u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
-	struct aer_err_info info;
+	struct aer_err_info info = { 0 };
 
 	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
 	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
-- 
2.43.0


