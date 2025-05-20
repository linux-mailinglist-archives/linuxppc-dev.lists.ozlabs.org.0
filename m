Return-Path: <linuxppc-dev+bounces-8782-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D084ABE65D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 23:51:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b27Xq6sJ9z3bxp;
	Wed, 21 May 2025 07:51:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747777867;
	cv=none; b=M+nZH/HOYQHtM+0FC42EHI8yDjKLdthO1V3cXiKPr6MlGoLiXZKUR5w4xsOvzakykvNpdx0waRRzH++4ulPKK3t5yRje9s/RZ4tvwQfUS8+7KX08dbemCV88PnNUfe8gWZ1YcG20VQRk7gF6EcD3y5smWMQMBrVZpb+xPu3ErfwQc6Dx8aw6yJaZftWl0fLCLvFeJrlVQKXUnkolb9URCqWs5FOQaDz9JTp+Axz7F7ugSuFxJkP585441GltG0Pyb717G0SvOfeUkWihR9ov2EsbslnOj3/3S76J1xwXu4zXgGK5Sup5Ix7Sh/IQWyjTjCHZZUUI2Nu0tgIN/vJTCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747777867; c=relaxed/relaxed;
	bh=DzgQqLHSXVKyoOcOY5lJgvaCCVbfpmr0aJZSpsdEsLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bFG8clnp/SCnNY00eCPHkNBzXR8mGQ1CPvmV7JN03VKaTrQzPRxl/amyJJ9dMHzRIFB3NbIubpZ8RyN1X/gbN+ydGBUOZqiDjkHt/t/3usfayLPRhmcVPvrVwyI7Ucs/tL4D52kkLJksTlXvU98lefj+euFk+JewN/EUoQ24CDP8wT/AqcyALkhLoB5NT/6OQkCKrftDR12YfaoHs9j8QX8htqM+tSaZ8u/TZkAbxcCf5nTP1KOYi7WnunMIh5DbdZplw0Kw7aSircLOhA8lEW+tasHMH2KVzAex3Y1Kvz7LC3m6VQrnpYacT7OkueiDqMRqn48eaQm2XqfV37ZQ1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZwW4ys92; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZwW4ys92;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b27Xq2Cksz3btm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 07:51:07 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8117A629D4;
	Tue, 20 May 2025 21:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0002EC4CEE9;
	Tue, 20 May 2025 21:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747777865;
	bh=5VjMn9MemK5CuWA+VSMlLX2voDa67B9awgcs/wm3zGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZwW4ys92nvOL57+VhbA9Ug2/N5KtMZdnGxt51qHKcwGXmt0ALtu7Hx9Ca2ECRSBWz
	 31dvnw48UEEoFOuPjGt2ZViCO0P7oDZADTcD5eR9U18DkHsfuPofKYu3oM0Vp5T8Up
	 /FfrhislQUyCjrJXe0vPDRH9+N1QrtK61XFgqUYvH9Qq+LbGyBl/vYUSEPB0zJ8Cn8
	 7WbeB4IzbVv6/JV38S8BJG1ScKgu5maJZqrTsRBuMTfTM8Wg3uspSvCDQk56kYeiYi
	 +JTrEtiN3XodVOlyH4Mu6y5ct+MaMO68/Q2cKmekjDMScz+qit2mv5PpQJ8Wx75jMk
	 DSSJXTxQfTj3Q==
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
Subject: [PATCH v7 09/17] PCI/AER: Simplify pci_print_aer()
Date: Tue, 20 May 2025 16:50:26 -0500
Message-ID: <20250520215047.1350603-10-helgaas@kernel.org>
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

Simplify pci_print_aer() by initializing the struct aer_err_info "info"
with a designated initializer list (it was previously initialized with
memset()) and using pci_name().

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Tested-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pcie/aer.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index e6693f910a23..d845079429f0 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -765,7 +765,10 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
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
@@ -776,14 +779,11 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
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
@@ -797,7 +797,7 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
 	if (tlp_header_valid)
 		pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));
 
-	trace_aer_event(dev_name(&dev->dev), (status & ~mask),
+	trace_aer_event(pci_name(dev), (status & ~mask),
 			aer_severity, tlp_header_valid, &aer->header_log);
 }
 EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
-- 
2.43.0


