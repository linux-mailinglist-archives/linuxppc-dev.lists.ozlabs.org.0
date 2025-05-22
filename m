Return-Path: <linuxppc-dev+bounces-8887-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC97AC17B4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 01:24:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3PW12MWrz3cBZ;
	Fri, 23 May 2025 09:23:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747956237;
	cv=none; b=LtmVFOyaX40/s6MkMx+6vNIMHXl0Zz7uFZDATEV6becU6pksW3sSyBLhdvyCwVgJEPAA+X6qlwf0bXC1+Xqw0cUzp7BHRibxJSWQQrTH+SdQa+rUOPIt5EsPXZpC+lP24frta8h7DYE2ZzCtY7HinxJgEdsyCl9bhZ+AOSMdfD3feh48JebZEBhJBkFOu45tAkgFfKMvI4GRJs086Jnw0Q+kYVPxRw9mppNTpta4/FvpB6c47IYDllFPP0O6yauudjHFKLf7oeurFK6V7pOgAkAQ1ZRNmD+fcxYhMvLHriPwB/gJgc4pNKhnx/b/rCGtr+/gtTbdlnw6hEHRRZYFRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747956237; c=relaxed/relaxed;
	bh=5YZsgaCfyWk+hbKxwu8hYbcklIyPFxeyirHo+n+B/FA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hsd9IgWZ08+V9t3CtPLBUHiutY8MGVOFojhLwMAJp3hqf3J+wTcGDEA7e524dGV8NYWDtLM9mWUlUTItecvd8BxucELFwMXH9m+knL9bWxnOLlaC+63Z9HHDFdXIY8pr45mnEtZ+JlEBywG2rWDLNfYdgFfVSStEHROuySHVDX6ygf7MIuJIervRi98dQq1YR+xt0azP/CCm17qaMk2F2R4PrcIeTI8iUlhBxpUwRibF0y3Wir/1N2YkTnSHXomzOVMv50SaqbGqy4mLni9omhPzlkOjXQSMtD50QJt8okTFPfTSDCq5ufM1MeuwyON3biL1ArvK4RhKhS1xG8C/1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EiKpbKUk; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EiKpbKUk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3PW043nNz3c6q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 09:23:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C545562A57;
	Thu, 22 May 2025 23:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 456AFC4CEE4;
	Thu, 22 May 2025 23:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747956234;
	bh=72ogOQFoNYoErezHSM2HOyMq9JkgXUt0lHiiW5Jloq8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EiKpbKUkclRjRz6bmLk3KaL3qYb3DXBNwgqeHb05bYhyZi36g31fUcepMNALoORCQ
	 NG+nX7xT+hGufOLJHE4+aUt4eP42VPsWhrLptBPfdaK9R5XMLRqWRzMZFs+JMyUPA9
	 /jA+yXfvAFGNgEGMwi+OajpL4W4RJDwIlBXhdDfNRkbKwy5oW2P33VWjHvud+V85is
	 nwNcoG2DoHOCqoWotJcrmNAivZbX3elzq5LuuhlVwYVckkLcDewqvptgge24zky1Wp
	 /Lx6KOaAyDzteuVBF/tltKh/vi97LB8CIXeo62UfYS3cAzPgfC2LdDQsLzCaoqvcoy
	 4NLLES9EFUNBg==
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
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v8 06/20] PCI/AER: Rename aer_print_port_info() to aer_print_source()
Date: Thu, 22 May 2025 18:21:12 -0500
Message-ID: <20250522232339.1525671-7-helgaas@kernel.org>
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

From: Jon Pan-Doh <pandoh@google.com>

Rename aer_print_port_info() to aer_print_source() to be more descriptive.
This logs the Error Source ID logged by a Root Port or Root Complex Event
Collector when it receives an ERR_COR, ERR_NONFATAL, or ERR_FATAL Message.

[bhelgaas: aer_print_rp_info() -> aer_print_source()]

Signed-off-by: Jon Pan-Doh <pandoh@google.com>
Tested-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Link: https://patch.msgid.link/20250520215047.1350603-7-helgaas@kernel.org
---
 drivers/pci/pcie/aer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 18005615d376..8b23ef90345b 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -733,8 +733,8 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 			info->severity, info->tlp_header_valid, &info->tlp);
 }
 
-static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info,
-				bool found)
+static void aer_print_source(struct pci_dev *dev, struct aer_err_info *info,
+			     bool found)
 {
 	u16 source = info->id;
 
@@ -1278,7 +1278,7 @@ static void aer_isr_one_error_type(struct pci_dev *root,
 	bool found;
 
 	found = find_source_device(root, info);
-	aer_print_port_info(root, info, found);
+	aer_print_source(root, info, found);
 	if (found)
 		aer_process_err_devices(info);
 }
-- 
2.43.0


