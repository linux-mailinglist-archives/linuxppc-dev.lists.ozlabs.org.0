Return-Path: <linuxppc-dev+bounces-7753-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4099A923C1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 19:17:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zdl1S4sT3z3c2R;
	Fri, 18 Apr 2025 03:16:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744910202;
	cv=none; b=cO+phuV0hpcWa4UgZ9K3hYXulw5z7zGuPuVvVKShrCGr6s3/ifXnWOA3yCeZD7MQqNvmhgXksfQB5AJvVf+PIS0PfZzbaoNW8FHi2O/iTsxjMHpy+FCA7wwBo/icNjEdv+fx7s44WRJdXtOVRsVdXcv4A0YIo1x+C5PNHCF4FG8nkR/wqs+zlmnIYWBTWfMiRe3Kl0nfx562k6xOEGN4scuObfap0h0xmIFq9o7I+g22buk3VkZmzyeFBPjx+HuFtcrGKMqNQw47Idzjg58Ed1Z4j100pqX5wpiRsTBQMU80cfs7sJ8Rq0/BySiz9sW6z1za0xZXplLup5FqpNeemg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744910202; c=relaxed/relaxed;
	bh=asHp6q6L4IzcB4jq6vSvi6XHqSxeVLz7kCXAyGtI1Gw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FrBLpCT8JL1FSKOBrOZJLs60B1JbRio4u18dtxAsvf1OkVvpUfB8i+dD8s5DTm6qxmN6bextX+4ZHEYQcEzT65qAn2rjhnSnOfxLtMU1Q5/VLIfuefLnN0ynjLwkFwtH9vgS2SsWiJ6bE41DMUZR9q9/adsZtGF8QZQj1A54AqSdkTwZvdMk809g4+PDmE/AmOxaEBz2pXkz4Dg5IPXg2FHvs+F3HLipE3TTjYsZ0CU8ODid1Ue+VDX2kS/vJ7I1WnK/9kjj6r6TJuhZfGXJVmsBD50MdUgdPnUzdYB/1Qa/nCYMLMT9YJJRd+U+H3PY5qIlpkKsQmf1yEoF/sA8Dg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tHBx1jL3; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+manivannan.sadhasivam.linaro.org@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tHBx1jL3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+manivannan.sadhasivam.linaro.org@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zdl1N23lxz3byh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 03:16:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8793D5C5770;
	Thu, 17 Apr 2025 17:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E925FC4CEEC;
	Thu, 17 Apr 2025 17:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744910197;
	bh=8w2ql223nYm+BErM3jbKkWekAvb+1IirdxYYwZl8YAY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tHBx1jL3rD6vHB7hA2Cz4VzEP2SSkxPqoqowLHlujIJyurg2Pe8WBIg8s16u2hyVI
	 lz/fQ1rs25feLG3dblbMBTrfmYmrmQgEw2JjFCYEW7zbntSICj3hd8SOxe1co0Siez
	 RLIQ062BjjnT+0i1z+1gpAkPAY/nvgAvzG1H2y8tDTq7KE1l1mz6v0DZlEKwmvCvmj
	 o9sCmdVD1KBzuuZwD1396UTC8vmtYXGsxgOJzE6ZP8/QXCxxrhX9Vtv4Y79MU/WX84
	 tGSuC2ZB0oQs8pauXnzHG+8Cl/fFTwGs7KX1rDumde3BvBBmn2A/iQk7BTDnBXJ6wz
	 my7gvHfiIUzRw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D60C4C369CA;
	Thu, 17 Apr 2025 17:16:36 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Thu, 17 Apr 2025 22:46:27 +0530
Subject: [PATCH v3 1/5] PCI/ERR: Remove misleading TODO regarding kernel
 panic
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-pcie-reset-slot-v3-1-59a10811c962@linaro.org>
References: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
In-Reply-To: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
 Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=789;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=Aq+BoDTRwjfmiHKRLtODTEbwNFS8yDdFMEIJ4A/Pkz4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoATduJ1eBKw3zAzVw1gaiAwVqBn+p0sZO476CV
 SaNmLhB8GqJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaAE3bgAKCRBVnxHm/pHO
 9fjaB/9TX7R/0DJbgw0yCzWKPjufexijGfBsQau7wlGK4zShGsIMnEPHAqvaACEB2BJLEVVEjoL
 IS6ObeFRSDy3aoJq4EJ2PPN9Vl4uAnBZTDeX/R4E12ZD57O2lcVJQlT3KU5ZFsFma2afXzFEkjn
 y4796I0mzYPIxPTRPBg3/7zVENOjOe+mEOMYL4h8Yw2ZenICJn7IuBuyzo+AJUpa/1zMtKcj2dS
 UyNT2y6ttaQpk6FExmXSrcshgGaIhfP5Tk2EIsSiJaJEBfrBwswyGrdcjzwL+knS4efzVgChr8+
 E2NR0Bwjl/iIo2Wq+DO/e/cIW/8z/L7fZoLbygsyGSr/EKlD
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

A PCI device is just another peripheral in a system. So failure to
recover it, must not result in a kernel panic. So remove the TODO which
is quite misleading.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/pcie/err.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index 31090770fffcc94e15ba6e89f649c6f84bfdf0d5..de6381c690f5c21f00021cdc7bde8d93a5c7db52 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -271,7 +271,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 
 	pci_uevent_ers(bridge, PCI_ERS_RESULT_DISCONNECT);
 
-	/* TODO: Should kernel panic here? */
 	pci_info(bridge, "device recovery failed\n");
 
 	return status;

-- 
2.43.0



