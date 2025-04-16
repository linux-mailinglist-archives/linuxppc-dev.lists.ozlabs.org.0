Return-Path: <linuxppc-dev+bounces-7700-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6EFA908F7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 18:29:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zd61C6gffz3bps;
	Thu, 17 Apr 2025 02:29:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744820959;
	cv=none; b=ADajPfGW6sXEsUx72o6Ccza9aam8XOYPt7VJ9mp+T8yS1CNcFzKtJ1g3DwbHaGFBIdvENNKlljlobzmPnQPfmT3mbMJ+rTfm/lWzZ4u1EepJT0NpM1P1liKMC8ZXaxqNfm4x31xsysq4YfQRPy/YRce7FzNqF4+vM+8gnWMUxKlTzEbt6AwdBqnmR0oufwXdlv5cawutAob7M4Za18yxJAl+VXtUmORGv26dnXap5j7w+YRsxoGVm8afxlUWIHHIFsplj1PDUOBS5CfrDGMbudkmCoysb+TjUetScrf40IczAI9HaViabXn6/SU2pb6iZo5RoePZmzJaKTzOHlYKZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744820959; c=relaxed/relaxed;
	bh=asHp6q6L4IzcB4jq6vSvi6XHqSxeVLz7kCXAyGtI1Gw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jMvxyQc/RF2BI2dN46knDrWJ8WkZ6vmkVVMkKPRv/EhgQck2EN5Mwl1Sbh9r6Cf3fA7hXWqu2C/I+5oAboQYky9oe9CbVOF1eU9bgXmb0JKT3yDpckae3FcFa6ZTNEa9tnHcjxw9znRkeKPoffvT3BdQ176oN3fvT1rLQ1GSRENnb2r1p/24brCUXmKzQJSLWCNVbVjZXo1PbiVhNHcytvqEVf/IHlFVpwjLaULi4uoNzlwgvUnA+nMWbe0TYyDLfPf+5aWZ4S2LyJSJU56W/pEmDREbU9gn1ChGTHwcuW0Mrv4Nv2/iXdIDSLqa3WbyPPqrCnQ98eSHUuLRiMnE4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TVCDUcIF; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+manivannan.sadhasivam.linaro.org@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TVCDUcIF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+manivannan.sadhasivam.linaro.org@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zd6195FbDz30NF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 02:29:17 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5335D4A14E;
	Wed, 16 Apr 2025 16:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 407D9C4CEEC;
	Wed, 16 Apr 2025 16:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744820955;
	bh=8w2ql223nYm+BErM3jbKkWekAvb+1IirdxYYwZl8YAY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TVCDUcIFSljB2uo+bIYkxk8g/qfuweWjFtazSQOYc45nSoMnNTn8sdlpaXA5DPjrz
	 /0PkNb4B0GTXyI0VJTswXJMvCvu7h4I/+NZIXrP1L94tz2t92NJoPGM9XO3PLtR2+x
	 RjlSgcZfN+YtRK2V26yIDks52Edc6OtCaS/NhdpBQOuaHjuGqAlW+uwjMvKLKRBuEh
	 bbVVM3QcSWobvVaGN1U5P44+nzp79kKQ4plrJF+i6areGvOOv+BBGaHAhAw8GGGpwh
	 Ud+jpQmAZyBfHbvUrH+ADcTnuUGTQtCTGAA84W7bZIPAfvsl0Nl5jsmnb4Hpq7rt/b
	 BNl2wdUzX+i3Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A80C369C4;
	Wed, 16 Apr 2025 16:29:15 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Wed, 16 Apr 2025 21:59:03 +0530
Subject: [PATCH v2 1/4] PCI/ERR: Remove misleading TODO regarding kernel
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
Message-Id: <20250416-pcie-reset-slot-v2-1-efe76b278c10@linaro.org>
References: <20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org>
In-Reply-To: <20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=789;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=Aq+BoDTRwjfmiHKRLtODTEbwNFS8yDdFMEIJ4A/Pkz4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBn/9rWO8MISVR64q676Pw7jrTyh1uamjj6mZUmS
 YdabH1Y02GJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZ//a1gAKCRBVnxHm/pHO
 9bWZB/9jx+jNdhWu36G8URNn0X1XjAdW8YyUqH+VMtsKLIuiq09q37tDK/XUpiOURo7qF+/N32t
 qCsA2CmP5dW5v02FZRBbn1GYvjtaKjsr6BxPmk6rqCJ6LpPOJNQybN+taSVyTVDmmXqfsHf1Ieb
 fYa3lSy8KDNHy9gkynnX/6RIBwY29NVZH8tLD8xnTW0mcavswjXHpJaiu8Yljb7sNGDteE2t55t
 p8gZCWK9xdUsjz9vSRfjTHzYqKhMFlzahyrxvV/MEdc8N0rxX6LPT5/PD4VIWBvQK8s3SrUu4pr
 RB5gc0dqu0u5Wu5AhZYlAGbIbcTWNxKJgmK2EWFlSPd6gyU0
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



