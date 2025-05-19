Return-Path: <linuxppc-dev+bounces-8683-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED54DABC9DD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 23:37:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1WH440ygz2yrl;
	Tue, 20 May 2025 07:37:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747690624;
	cv=none; b=NABxd789ggXJxQ3/OsObuBnP8wyiO4l847w2cp3ZR9wxRk/3uozv67cfPJ7RowwfUz9XtKcK3gP11fj5lIzU/EnNIe3Kdih1NSSIrckWjkQKo/zJKXkoqF6GnlKOBPw0jSGHE24TC1/Tw1ALi8yXQgN9d6DIy2Eg73hBTKAU2eceGl1hwp6fdFr3gV829zjn7yZzXCsSNhQghxJ/++/bK6Jer0sIZQLOw2Cf4LaaLqCgsRx8Qgd1T9sHiQtgx2fXz5owd5HlEC+f5RByw3WJuMrFRZOEl3rtWTiwoFM69W0/HkPgHqesSJVC8M6/At+agvz0fl+jsmJl5xNcNVvWOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747690624; c=relaxed/relaxed;
	bh=5lm9ZZTflSZbYGWWqhEPewyt1seKHcsvilbTye/rA64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dlyeu3HWymQfagbJybTFtTqLorajiLKzmz7dYlSoPMB3iw0nR35a+AaCE/Kbg4UxaPKIvORz0i98ShHT7YWu/Up2xcJo+yIYCSOu7xJb7LNJPkcLjHTB+DDdXUPDyPHNEbyUQOkg0+HdcRsVDosIDulgrdphZ4JRnlW5cA73qDtnM88B6WgiVy+lz3Mdfwn6137Ebep0oqfmja6Mmd6Oj7NQP5WK0gPnSePWp9vk5F9cXPu/c5DUQHpheCA8MOfaRMSaR9K2pPJTHsLA1q1bzLXdlK1ADbILkkPBDl9AW+oJHW06O5RtWrynoT8Pd3BcCNnzJ4TaEbtV2Ig4GVSkgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BRYz141r; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BRYz141r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1WH246SJz2yrF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 07:37:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8C263A48C07;
	Mon, 19 May 2025 21:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F22E1C4CEE9;
	Mon, 19 May 2025 21:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747690620;
	bh=TvyG8I4ePW9JSyZ32FkDAV75N1u5mKKeii8+CFDAmM8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BRYz141rcAmN3WnJ1iiASwcwkipbTGnqlUFiu0+OteHSQtfwWqorpAy9NdMdyxMu+
	 zM/I+hwR/vSjp1/t0mPFWecVrukY4qFmwHLFVImobHKKpogPT0eOlSvHno5FNtteJi
	 sNdmlIHpk5BDl+BtaLXTolIsyFbyT8ErsEvonrQglO7FQ1JTZ9cx8WImHvro0R93e6
	 v7JnAy+n7R6El4ZzGydO1Gh+OAAtkRBlPzyoqshRRNs16AgpRZjea/kVyvwq8ZSssQ
	 Dy+Y3Jk0Rf6lp3Q2QWsf4fEPoo5sxMpteiyLAIQE0JqTpWnkuv0929L2+mZIO4SlSm
	 saTJunZO1nb/w==
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
Subject: [PATCH v6 06/16] PCI/AER: Move aer_print_source() earlier in file
Date: Mon, 19 May 2025 16:35:48 -0500
Message-ID: <20250519213603.1257897-7-helgaas@kernel.org>
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

Move aer_print_source() earlier in the file so a future change can use it
from aer_print_error(), where it's easier to rate limit it.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pcie/aer.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index eb42d50b2def..95a4cab1d517 100644
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


