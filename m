Return-Path: <linuxppc-dev+bounces-8889-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B99AC17B7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 01:24:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3PW36c5Mz3cDy;
	Fri, 23 May 2025 09:23:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747956239;
	cv=none; b=DCipgBML5QKUPnWf1/coERaSbcmuIqtv3VSgnnNVsJr2gpl2RPnKnaFscUiWx4Km0E9g5ewT6JuLBtSBNN8PZvjPmoASaGCtEhscCpfvTTEWn0H3rBSjsNMZBaVktSxIZVUe75GzWDSmtcrvIcsMDQU8HKWpgmZfBDnGg9t/gZRGN+695yhrCExJEmRxT+UEWG2gTTAXM4auXwdBcG/F7C+TOO0quAg1fTS/IuAy+3Zq59ubHXLqBFp9W8lZbXkgKPprkrEJ5k6RcvgMM0emeaKM/xkizOQlEiz42ctPmhKm4DFtOeR2cgmGm/QV3NrIcTuSjqsc1cUrNvxYpcKPgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747956239; c=relaxed/relaxed;
	bh=DOSuFgipF2S0dYT9cRMmixDaiNAHeuTDi8V5Mp5tphI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kIaSDvpbrXdsUiIcDo80jXZkLTYrhHDUjvo3Y67rUphXkS6UoWhopf7VVb8mHjtOkreSHi2Znj2p83sGM1COrL2Y516qWJZewz+vrQuOd3GHlJuwnVmbZWK08WqyMdJNncVeF22zDueoAN0SO3UWWIBF5LWNbDg1MzEBLyU4RALjGy+aJ5SCY4Uk58RxTzZ9MLq6q7PO+GOt5GdMsqnDLdx2OLm86zmL5WS0GFeCZhKp2A5cwFvkbDjwR3N24j/rqrnOIqrdt4E7XCpW68K1Vd3DvbsOyhrnjC8w3dZfpsTsbhJ5/H26278HjNaacJ3gqvnis6BBicQ3E6RLzUGu0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kucjZAEC; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kucjZAEC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3PW31Mnnz3cCt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 09:23:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC1834A890;
	Thu, 22 May 2025 23:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56AAFC4CEEF;
	Thu, 22 May 2025 23:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747956237;
	bh=wyPNuoCqqAp7UpTmuisvayUbc0/MzFt2Tiz1dgzkV9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kucjZAECQrkhTD+lksVfoYIPUKGQJ/SpFSdfEx/nkTvXcxN9RJ8mEL/Wtdf9gMYFg
	 2n0N2qdzJsHrZkD0p0JJNyhz2ONMjLp8EVn8GhCpTCGTheFvOovtvJ2m7zoF7JKH0c
	 N8B7St/PTI1Y5r4nJz2y9H0yeckcv1bkqUWwnyhqjZN/Egx8/sdv/78swOAjN0S+Ed
	 mCvs9bhARNYLuCRfRWu1ASLv1Rr+l420SLDYtTvBiTSzfxbk9tGGjw1N562bCdFZj7
	 fpFilhBxxu4PByNRQMACjKVpuNiAVInH8FCLJY2SvnuFKxaqAjWff8QYnH8pdU0sWg
	 y18zlLbVMms+g==
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
Subject: [PATCH v8 08/20] PCI/AER: Initialize aer_err_info before using it
Date: Thu, 22 May 2025 18:21:14 -0500
Message-ID: <20250522232339.1525671-9-helgaas@kernel.org>
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

Previously the struct aer_err_info "e_info" was allocated on the stack
without being initialized, so it contained junk except for the fields we
explicitly set later.

Initialize "e_info" at declaration with a designated initializer list,
which initializes the other members to zero.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Tested-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Link: https://patch.msgid.link/20250520215047.1350603-9-helgaas@kernel.org
---
 drivers/pci/pcie/aer.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index c0481550363b..109f5e0ade8a 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1290,9 +1290,9 @@ static void aer_isr_one_error_type(struct pci_dev *root,
  * @e_src: pointer to an error source
  */
 static void aer_isr_one_error(struct pci_dev *root,
-		struct aer_err_source *e_src)
+			      struct aer_err_source *e_src)
 {
-	struct aer_err_info e_info;
+	u32 status = e_src->status;
 
 	pci_rootport_aer_stats_incr(root, e_src);
 
@@ -1300,30 +1300,25 @@ static void aer_isr_one_error(struct pci_dev *root,
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
 
 		aer_isr_one_error_type(root, &e_info);
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
 
 		aer_isr_one_error_type(root, &e_info);
 	}
-- 
2.43.0


