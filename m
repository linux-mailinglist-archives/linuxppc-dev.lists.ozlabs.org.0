Return-Path: <linuxppc-dev+bounces-8684-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67668ABC9E0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 23:37:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1WH51m3Vz2ytT;
	Tue, 20 May 2025 07:37:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747690625;
	cv=none; b=SkAtB6o3BHc4+ssTTew26lItkZZZRwKwGOGIFW9ze19ELMakwPoTidxf4roYOrmtQumuAZWXsEPnqy60ISanR9cI2AOQTMb0JemgGjLOOAAUVtiilxDbclnFuituJZVMCs35MEe/7Tbf79gqf95zL86UCKWWpi+hyi5LU9hd8ScmDd9rND0pNtpKYu3dATJTO0k+aBPH5ghsTWgn52WeidYvl6xbw2tFEG3VbhemUdAXVt/29yh+mcMFm8ZmZ49nGDZ5KoQTQNc/m0EBsZ2QMHWaphiTRkFgS7xMl17PnCWdZ1QqEHRozTAOu9ygCfDd5q3yEo6fDVEWrFd3O7c7PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747690625; c=relaxed/relaxed;
	bh=oHFW8QS1JevFYMB7u6lKzpv68Sf+D1WNwnyD5Lk9NW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=At5er82Sw8tQFhku7vv2d3/HJKXFk49qUQilZl4yUmX8cF0kJKWT1vB1Bu6JNDOJxLUCVh/23A/OtuG+AqCI6+PrVcuAfwbEHnecTLsDQP0tK8vC9MlgYi7iiwk5d7u1Rn7ocEnhBTNCWYPn0eyI1Qlemo0lf7RuwHxwf1uiT67SDgg5V3dGN4GAeof+768zUq8p1xpVguBN+JGbXjVIdVAT4jP8dmvx0C7ryB1jQGfxrfjW7OyngRrzULmNon0YB6E3YuwD9Nul3tqOHny4m1IzmuntqLxO5fiGRjqucgQRZbf3l4+/+2TUyYuYebhCwpOHdHEgSav/K9tu9TiXrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OrPiLiDm; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OrPiLiDm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1WH40h9Nz2yrg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 07:37:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 09D1A5C55F2;
	Mon, 19 May 2025 21:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9314CC4CEE4;
	Mon, 19 May 2025 21:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747690621;
	bh=gCT9zdwjoP3FNraWNBiZ8smNlAkNybhV2cLRnGajjKs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OrPiLiDmpSu1WJ9nom0wJOy2FCbHU+YnPGTo/5Xn6QMvGmqMH8IfwtPy5yvmyNVEd
	 R2sM5OyxvvFe/Tz5dljMdsncNBsacd4eve4DtjhvqOxObvbe6v1+w+2uBC2aNhYknY
	 AqgX5PLViSDcmjXnohR9JM7/CWiFGkyEmtr8xZgGfvnd/P8JdZ5F6RGGMkEZfq5qrV
	 ageQzsUsWVRZPMzrux9eMn6Wyl24eHibuYpvNOTzST9Y0U4EQar52V35DI8Y+CH/Uz
	 boXmkSdE1ntQmUs+cVICZ98h/5zuHrkFPcQyedXSevJR8P65fVOiYgvpSWD1RnxTXk
	 mkaTa3l2mKbnA==
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
Subject: [PATCH v6 07/16] PCI/AER: Initialize aer_err_info before using it
Date: Mon, 19 May 2025 16:35:49 -0500
Message-ID: <20250519213603.1257897-8-helgaas@kernel.org>
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

Previously the struct aer_err_info "e_info" was allocated on the stack
without being initialized, so it contained junk except for the fields we
explicitly set later.

Initialize "e_info" at declaration with a designated initializer list,
which initializes the other members to zero.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pcie/aer.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 95a4cab1d517..40f003eca1c5 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1281,7 +1281,7 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
 		struct aer_err_source *e_src)
 {
 	struct pci_dev *pdev = rpc->rpd;
-	struct aer_err_info e_info;
+	u32 status = e_src->status;
 
 	pci_rootport_aer_stats_incr(pdev, e_src);
 
@@ -1289,14 +1289,13 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
 	 * There is a possibility that both correctable error and
 	 * uncorrectable error being logged. Report correctable error first.
 	 */
-	if (e_src->status & PCI_ERR_ROOT_COR_RCV) {
-		e_info.id = ERR_COR_ID(e_src->id);
-		e_info.severity = AER_CORRECTABLE;
-
-		if (e_src->status & PCI_ERR_ROOT_MULTI_COR_RCV)
-			e_info.multi_error_valid = 1;
-		else
-			e_info.multi_error_valid = 0;
+	if (status & PCI_ERR_ROOT_COR_RCV) {
+		int multi = status & PCI_ERR_ROOT_MULTI_COR_RCV;
+		struct aer_err_info e_info = {
+			.id = ERR_COR_ID(e_src->id),
+			.severity = AER_CORRECTABLE,
+			.multi_error_valid = multi ? 1 : 0,
+		};
 
 		if (find_source_device(pdev, &e_info)) {
 			aer_print_source(pdev, &e_info, "");
@@ -1304,18 +1303,14 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
 		}
 	}
 
-	if (e_src->status & PCI_ERR_ROOT_UNCOR_RCV) {
-		e_info.id = ERR_UNCOR_ID(e_src->id);
-
-		if (e_src->status & PCI_ERR_ROOT_FATAL_RCV)
-			e_info.severity = AER_FATAL;
-		else
-			e_info.severity = AER_NONFATAL;
-
-		if (e_src->status & PCI_ERR_ROOT_MULTI_UNCOR_RCV)
-			e_info.multi_error_valid = 1;
-		else
-			e_info.multi_error_valid = 0;
+	if (status & PCI_ERR_ROOT_UNCOR_RCV) {
+		int fatal = status & PCI_ERR_ROOT_FATAL_RCV;
+		int multi = status & PCI_ERR_ROOT_MULTI_UNCOR_RCV;
+		struct aer_err_info e_info = {
+			.id = ERR_UNCOR_ID(e_src->id),
+			.severity = fatal ? AER_FATAL : AER_NONFATAL,
+			.multi_error_valid = multi ? 1 : 0,
+		};
 
 		if (find_source_device(pdev, &e_info)) {
 			aer_print_source(pdev, &e_info, "");
-- 
2.43.0


