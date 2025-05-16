Return-Path: <linuxppc-dev+bounces-8616-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD083ABA19F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 May 2025 19:08:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZzYSV1q65z30Kg;
	Sat, 17 May 2025 03:08:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747415306;
	cv=none; b=I+n1p0s8Bbq+mcdnZDV9RLpGgqEJcpdo4R/zmSfQ4Cl+Eg3hMJS1dnIHV8mwXxgqWepXkYwrVMt8cBKSMHpB1hqO4WUopWybvAJXk53FtRq7N7LxrNM0iCnjMlP05YpSRA4K2MR1690cbrEz23TwWlHMU3t2Oq0NqdLnHlHTbEBZV58vecUdYtW9qHP2Sw0uWfwIZ/nk9147Tzd756TflZO2XIb5MYcVqTa8HRh8RG8Eu5PEhZTJ73ExoxXjHYdjlNpCdFDUZ4D9ooRs7ovcjverTryp6VYzUcYh3K5w0EU1PGWN8g0QrNmjEWXoFluoKsHGiVm10hXrMkXdRMgvng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747415306; c=relaxed/relaxed;
	bh=qYXamXMCEiPr/RpJK9bkK+Cvqo2tYDscATM5TdHK+B4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nvnMRHI8tOXzoGrKoBB2HSFzqjT/2V/Wshho5kLUtqXeUk5hOJM59wDFEDnDh81TyMk/AsGW2xZ8C2/OVU2tNBrV7z2sS4fUNrWSMYQ64RkPoewRJYWFfH3kf9ztd6jaFVMyTeegONBFvZVxNc9P+C+TcoPZC13+VgLXOPU0RK+vqF9W8CdBp1o3Lk+zwcVJJlNwFckngLmwOQy69/KJLMXHnUbX8mhIQjbz/IAqh8hiZs8A0IvftJRLWYyKukhXl74j4fXpAJK5q61b+h6y2HD9cOGJb5sntlgnBJUnimgwzMVMpIjsklovWSZbfjchZhD8Xv2h6CNLOfB48U5QhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mfbsT3ko; dkim-atps=neutral; spf=pass (client-ip=117.135.210.5; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mfbsT3ko;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=117.135.210.5; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZzYSR62R4z307V
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 May 2025 03:08:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=qY
	XamXMCEiPr/RpJK9bkK+Cvqo2tYDscATM5TdHK+B4=; b=mfbsT3koj4pL2eQgt5
	ThcfNFwpvyuWE5VC3SHViLKE4U0YRfhOaDVFJTEdyk4vdwNy7eEKXEknn51Xj5DO
	Yji5EnRnFQBB+vMeyhwdITCrme9CHAvoYPPLw4/CSUSYA4kcGwSVZ/OiU+5W7bW4
	vnoRFXqXCh0YdKNyY1sVovn/U=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDn1+RLbSdo12CoBw--.59952S4;
	Sat, 17 May 2025 00:52:29 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	tglx@linutronix.de,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	mahesh@linux.ibm.com
Cc: oohall@gmail.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Hans Zhang <hans.zhang@cixtech.com>
Subject: [PATCH 2/2] PCI/AER: Use bool for AER disable state tracking
Date: Sat, 17 May 2025 00:52:23 +0800
Message-Id: <20250516165223.125083-3-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250516165223.125083-1-18255117159@163.com>
References: <20250516165223.125083-1-18255117159@163.com>
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
X-CM-TRANSID:_____wDn1+RLbSdo12CoBw--.59952S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr4kCrWDXrW7ZrWfAw1rCrg_yoWfWFg_ur
	yY9a17Gr4Y9rsxur1YkrsxZry0va4qvFWIgF40qa4fCFy2kr15tF9rZr1fAF4DWryfJFyD
	u3ZrAF13CryjkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8aFAJUUUUU==
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDxVPo2gnaDZ9cQAAsr
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Hans Zhang <hans.zhang@cixtech.com>

Change pcie_aer_disable variable to bool and update pci_no_aer()
to set it to true. Improves code readability and aligns with modern
kernel practices.

Signed-off-by: Hans Zhang <hans.zhang@cixtech.com>
---
 drivers/pci/pcie/aer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index a1cf8c7ef628..ade98c5a19b9 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -111,12 +111,12 @@ struct aer_stats {
 					PCI_ERR_ROOT_MULTI_COR_RCV |	\
 					PCI_ERR_ROOT_MULTI_UNCOR_RCV)
 
-static int pcie_aer_disable;
+static bool pcie_aer_disable;
 static pci_ers_result_t aer_root_reset(struct pci_dev *dev);
 
 void pci_no_aer(void)
 {
-	pcie_aer_disable = 1;
+	pcie_aer_disable = true;
 }
 
 bool pci_aer_available(void)
-- 
2.25.1


