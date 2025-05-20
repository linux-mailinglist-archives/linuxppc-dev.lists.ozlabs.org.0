Return-Path: <linuxppc-dev+bounces-8779-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D8AABE657
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 23:51:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b27Xl10wcz3bpt;
	Wed, 21 May 2025 07:51:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747777863;
	cv=none; b=KDHKGnoT7ZFAWZfvA9mb92pBxgwZAWP11YHgOlCQBq9J7O4VW8jSRYcWZA8aD7ZMj2+2REkZzCqTifH9Wyhsp+5ZW/cXuOHFiVDqKDJvb2OSnYqWmtJF/Ye66fygDkpv996ohKh+KU1iMavYIo2Bc3lwM269eFFo0o9SQQZ+JlqZ2rluRxrSGO1hfs1JfHCOz+4OIjCgGv1IciYPIyoI0pRT6vXToFZENUSSlki6GyRPRjXizD+cZsWIqmGVu+bDD9cN03ihNoha0Kh5Et2eo07/G6+bD4oQtaL9TjyTxXIO2Hv7YLLeKsppy1mOuwN+TX+RbXVNcF3aBc2nyGVzYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747777863; c=relaxed/relaxed;
	bh=wCKMzt06Rzb/6OUWaRQCZ2+enrAjUHtlGAhErBBKFCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d34ni7NRWSX+e8iQo2I79E2p4BZY7BoSJ80FVLqWWc58G+AxHaf35fXQwG8ykgiPX4BL45gMkR5pBJyhWY5E7gSjU3u3tkW+btUus5TIBttl61hMCNOnU3CfX9WsDNTdhsUyL9u2qbfp9UQzIg32cwr5Jwfh1PFeaxhboEo+2qkhhtPpXAb2clBKeKlc4yfus+0vDXNxNXQLkQWxmHzzO48S65BZLHGyQO4LwyaiQYhiMAX47ApEnZZ4DJeENZ/75E1qL3B6Z+BkyPpO3I+vm44k1lfQqH6XnQ6CI4gpATUiGFzQEaowS6D7AaVPpemn254TxbI4+BcUH3SElaYBzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tAgC9mfA; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tAgC9mfA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b27Xk3QYxz3bsK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 07:51:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AB59962A38;
	Tue, 20 May 2025 21:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48675C4CEEF;
	Tue, 20 May 2025 21:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747777860;
	bh=BWAUnCgTWnneKjfd1/r1cYKXjXgMZ6b37PyuTZ5lIYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tAgC9mfAxpktIzcXhdxJvW/QwRet7aKuX903/9PFw93O51KaxMlf+SbOHfjyXmxNB
	 4WFHVTCuDcO89wolGrL0mPJSrF3elaqGzCExeeUnCTvK+RHfZhvUOT/V0q91hD33Qx
	 QDEZl6wAjzz76ZRXRuVyneUK5IY2DNnPAx1kXulPFvvmUMKicpzPo6LUBtvIMf8V7i
	 2psUATWIltbaepe0RVdQ2NdtnoGzhKUlW5Lp1Tef2dSwVnBJ8rACyWf0b6a6WWYfdR
	 vdmIt00TLSz+wIM+pSTpPhGJXdxN5bCtGg1BLfNynFm4w7PYY2mO+YTfr9KEgHsGZX
	 zomuH3otIc6ow==
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
Subject: [PATCH v7 06/17] PCI/AER: Rename aer_print_port_info() to aer_print_source()
Date: Tue, 20 May 2025 16:50:23 -0500
Message-ID: <20250520215047.1350603-7-helgaas@kernel.org>
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

From: Jon Pan-Doh <pandoh@google.com>

Rename aer_print_port_info() to aer_print_source() to be more descriptive.
This logs the Error Source ID logged by a Root Port or Root Complex Event
Collector when it receives an ERR_COR, ERR_NONFATAL, or ERR_FATAL Message.

[bhelgaas: aer_print_rp_info() -> aer_print_source()]
Signed-off-by: Jon Pan-Doh <pandoh@google.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Tested-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/pci/pcie/aer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 65f9277c822c..4f2527d9a365 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -733,8 +733,8 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 			info->severity, info->tlp_header_valid, &info->tlp);
 }
 
-static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info,
-				const char *details)
+static void aer_print_source(struct pci_dev *dev, struct aer_err_info *info,
+			     const char *details)
 {
 	u16 source = info->id;
 
@@ -1277,7 +1277,7 @@ static void aer_isr_one_error_type(struct pci_dev *root,
 	bool found;
 
 	found = find_source_device(root, info);
-	aer_print_port_info(root, info, found ? "" : " (no details found");
+	aer_print_source(root, info, found ? "" : " (no details found");
 	if (found)
 		aer_process_err_devices(info);
 }
-- 
2.43.0


