Return-Path: <linuxppc-dev+bounces-7453-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF29DA7BAB3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Apr 2025 12:26:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZTZXV49mrz30Bd;
	Fri,  4 Apr 2025 21:26:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743754955;
	cv=none; b=A0NCJtYWIddawU6vO8CFKDJPppVEmsPEqYqOHVAF80y1IfJ0MWAu0mmfYjZuwg3LVl5uoGv+QU1O862k+Ajh8Ve2sXbyMhY32b8ZwKaaaFtq3CcTXayKcmang7j3S+rQwhYBehZbS7auZPkDUnavQAUCPvrQHcDpcwGDzpYb8VkU3MK3meEaDclAjho9QwTJMsxuG9zmNFC7ePuL3hj/g4Fl2oHv+PP9ky6WW5QXOmDh0rqB11cjKZh/vnOKWyYEGzIPU4w31+vvIo47BQFt0cso44SoqecpahSy08zoz2J18CRMyWRx2hPAQrf6dX60lDghXfof+Dsr0d9qmx7bhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743754955; c=relaxed/relaxed;
	bh=asHp6q6L4IzcB4jq6vSvi6XHqSxeVLz7kCXAyGtI1Gw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fSnD3Xd5dPtQPNSQIxwnvjZ8VRv+CPdUQhiyND+XouWexYzH2WuliwIN7beony9prHKf4Nqg6wnXsMJUV/p2WrQ9A9jyDmYnIFIYU7WnXqjAbst8gUqfTx5zynYc8rC9hXPwLqAJJSgPS5TefxZ1/McQ0+TnAEM1Qc3kOEXd05DUQ5uwSjxwRn6nkP8pD074eANCStDz8TPKZJRZ7UaoopdAEsIAT8AyGDpFc1z+hlGqICFrG3Ijtei4rHQAdsVNKbQ0CKjilEEXdSZGalgOtHQWiW2xBXKzp6U5wVnoFGxwhqSi5zrHWDbZIKbnV9jm2fX7OAKM+4Yz6KfLTxCWcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eh6XwXgx; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+manivannan.sadhasivam.linaro.org@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eh6XwXgx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+manivannan.sadhasivam.linaro.org@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZTWn60GgDz2yrd
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Apr 2025 19:22:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5BE9F5C671C;
	Fri,  4 Apr 2025 08:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C685C4CEE5;
	Fri,  4 Apr 2025 08:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743754950;
	bh=8w2ql223nYm+BErM3jbKkWekAvb+1IirdxYYwZl8YAY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eh6XwXgx7cKNxUXwPxIho+4bXpBveVNvDDkA/ph0m9rQg/+1K7OCcqv6/X9iigRQc
	 vieRfAHJEMe2AU8Vihyvxmta0SGeEd76KY6KCs0DrQcTa5zL9K00WxNBgThU6nRean
	 9DE0AEbsKsBv42AUFvSvz9Bk98TLEAaMu67vQzEe6hG9vXfN6mwRfWF0yGaryBPzCk
	 PQGwECDoCLhe85EbuulPcYlpkEvcXvarWvkqFk82hRgoE8HvddDY1EA0Jmw3H9FLml
	 3PWvHTLAXCVywGYniP0mgjPqG9JQH/UCrsbUA1fvCmCafxkZ9pAo5n6CFjgwehd1VA
	 tVi7eJWuJqdJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00E9C3601E;
	Fri,  4 Apr 2025 08:22:29 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Fri, 04 Apr 2025 13:52:21 +0530
Subject: [PATCH 1/4] PCI/ERR: Remove misleading TODO regarding kernel panic
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
Message-Id: <20250404-pcie-reset-slot-v1-1-98952918bf90@linaro.org>
References: <20250404-pcie-reset-slot-v1-0-98952918bf90@linaro.org>
In-Reply-To: <20250404-pcie-reset-slot-v1-0-98952918bf90@linaro.org>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>
Cc: dingwei@marvell.com, cassel@kernel.org, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=789;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=Aq+BoDTRwjfmiHKRLtODTEbwNFS8yDdFMEIJ4A/Pkz4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBn75bDaglwkHeKqhE9AYdkObam0SipeGIjgFjTC
 pJd4g4Uk5iJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZ++WwwAKCRBVnxHm/pHO
 9WgUCAChvFjCnq6fJcYlGvuvxyMIhUB0WLffeiqVh6Ay4cY4LA0BJMn0P0zNDsqQ29uI4ys9zW/
 Cb9KhH9McHnBx4bibC2z1FV3VDtUEM40YhgFlSqdB5XHDVDc/1ZQd9Q57zNMevLyG8YmyfPD7gZ
 jSvBlbICm9jNYKuqgVblG45YAaBClN0wTRFGePyZmJbJvm83vnwMWACNI3Ek9cdVf5UVVensIxQ
 A56rmM9gaxYGrXjKY3769BDiCdL9/TV/KqDoTkz7rfOd219Kg9utVeKCKB+l1tpgYHX/vKB7Tf0
 PeQCXiiajJHNhxI9l+fudLfKR/qDu+2NuRZjWCMLMIdm30GF
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



