Return-Path: <linuxppc-dev+bounces-8890-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6528AC17B9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 01:24:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3PW61C8Pz3cFM;
	Fri, 23 May 2025 09:24:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747956242;
	cv=none; b=GP48UqB1HDbAEQHRyxak1Z4JbXn3b5T9+sLm1b+qxFLCC/+S9TSW5EJxlqI5OZwTGp6z4XI0pGYC4W2fn1ePRU9uXKyiEHNAqKsSH9Xm/l7wXv4X/uf/O5Haw2MvsG2JA4JfP9Lo2424+eY4A95YqNoNJ0MIWuxWdzAsRhE1CyuRMsWkGQpszcM0NeactkOPXEl2ZpqxMck3//NArORN/5QaZQnkAaZ+T0mMJ3xzzYhBhK/Wfvy3+F0T2Dw/YLB2SCDJrqcLi2cWSAYcViDh2A4W29I+jHcecj4FJWJoAi1b1TcLCBApdyaPzTg9NXK3p65T/XX7qRrD1xDABDcoZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747956242; c=relaxed/relaxed;
	bh=XKNsLONw1ZdqoUQReADdCBvO2Nrie2bu3mHca02RdPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DTyNBmB4EvRUtPYPTNTlHI2vQDKXGSXaqODZnzbSlvTvNd2Rb8ORHH27n2muSzJwTatyX+QGvf9JsmpmX2Hm7AMwhqcgZt1jBSPxrgKtayFYzz69vaN9hYppexwTiK1GgwDzxbfg606f5u+Qyz8ONPzT0A2iN70puyqkD9cXGVjBgRSBIo+uDFZVelZQqBgl5dR8aaarKZufBwqvwoxFg/Wwr27H3f5dwmAoJRgGdGKm7Lg6sztHtaxuYhj0CMTSugmmWUSphq4Ixixzne6YR11Ph83+x9ezLXWpuDGhLk5PXCF2NtMUyz8ufvhHO2zNW/1Xy3AUt0ODtk7fAS5WWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l3eitsOd; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l3eitsOd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3PW532f0z3cCt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 09:24:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B74D5C6BF2;
	Thu, 22 May 2025 23:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9ECAC4CEE4;
	Thu, 22 May 2025 23:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747956239;
	bh=KEtjoCyDTu7ECBIiCj0AtxIK25UKdSZTkAk180L7y+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l3eitsOdLGHGwymqjY9tVW9GUhxOIOxB7U3icAo39CNUeUP0vhlDmzj2x6E+RWLd7
	 0ZuIKIiOV1F9dxNngo5Om1laLh8/0mJ13kV4xb+QRbvdDliLp2cwZRaGOx2wYk59rt
	 KMfBRcEm7kpcCe8OHZfV37vobwY73IzdCYM54+rhX8zRVQfJr0pi2vhOPSV2MVkWXZ
	 QkneMIB6Zlivo8LhAFmGVCHgJ6FltQhSz2C7Imz8HU/mVBVei6shieWFqlmlge6kqr
	 uQTQEJHXzMWo3Ofa3UD4maXVq6xxt0vCVdfKS4EK8U18hHB9fmzqe+0CqlR31a0+iB
	 7Zht0cgW7HugQ==
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
Subject: [PATCH v8 09/20] PCI/AER: Simplify pci_print_aer()
Date: Thu, 22 May 2025 18:21:15 -0500
Message-ID: <20250522232339.1525671-10-helgaas@kernel.org>
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bjorn Helgaas <bhelgaas@google.com>

Simplify pci_print_aer() by initializing the struct aer_err_info "info"
with a designated initializer list (it was previously initialized with
memset()) and using pci_name().

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Tested-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Link: https://patch.msgid.link/20250520215047.1350603-10-helgaas@kernel.org
---
 drivers/pci/pcie/aer.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 109f5e0ade8a..dc5f4bebd613 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -766,7 +766,10 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
 {
 	int layer, agent, tlp_header_valid = 0;
 	u32 status, mask;
-	struct aer_err_info info;
+	struct aer_err_info info = {
+		.severity = aer_severity,
+		.first_error = PCI_ERR_CAP_FEP(aer->cap_control),
+	};
 
 	if (aer_severity == AER_CORRECTABLE) {
 		status = aer->cor_status;
@@ -777,14 +780,11 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
 		tlp_header_valid = status & AER_LOG_TLP_MASKS;
 	}
 
-	layer = AER_GET_LAYER_ERROR(aer_severity, status);
-	agent = AER_GET_AGENT(aer_severity, status);
-
-	memset(&info, 0, sizeof(info));
-	info.severity = aer_severity;
 	info.status = status;
 	info.mask = mask;
-	info.first_error = PCI_ERR_CAP_FEP(aer->cap_control);
+
+	layer = AER_GET_LAYER_ERROR(aer_severity, status);
+	agent = AER_GET_AGENT(aer_severity, status);
 
 	pci_err(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n", status, mask);
 	__aer_print_error(dev, &info);
@@ -798,7 +798,7 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
 	if (tlp_header_valid)
 		pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));
 
-	trace_aer_event(dev_name(&dev->dev), (status & ~mask),
+	trace_aer_event(pci_name(dev), (status & ~mask),
 			aer_severity, tlp_header_valid, &aer->header_log);
 }
 EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
-- 
2.43.0


