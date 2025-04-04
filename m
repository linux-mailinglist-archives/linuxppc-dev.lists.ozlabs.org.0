Return-Path: <linuxppc-dev+bounces-7451-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7C4A7BAAC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Apr 2025 12:25:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZTZWD37yFz2yhY;
	Fri,  4 Apr 2025 21:25:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743754954;
	cv=none; b=HeVD0JqH1GKcj/wKdlHVstqhmwsz89pMRXvZsgMlgpEmcz1zfzRtgCMeAzrepG1lEt9IY01bRhMxPD+aLNgr/bXYflF/F8bYe364oisMvnq3kWPgujePpyYl+llJPJrlxpd+vmHx4c81qTw1uJpN7RVm58S/qu5Pihg64EKbK+s1L031bOW2xtjcFKhM50eB9JGuw96N8UQmEVd6GUeTJJCX8dod9OZly6Nsq7GiMBYN7+POrQSVuPbXOfd9vnGvMGuUZpVWFV+pHY2vo6Q+UsdmSKnjaMJFkSpdjsFajDyhUyjRDmUVUkKWeZqfFJInB+hYBrSjKMF5WeqTHAlHoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743754954; c=relaxed/relaxed;
	bh=oqYdFQnBlLqqGhoj/9e+/WNBIGj4fvv/bp+or0XXthU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WXa4CfxM1ZoMlct53rMsnT7kSkfljdRwAdaXRxMA916aV5y/tJf/9u0YUXe0BQ6sbFlELwKR5rFEryn2aAPHCGzgoBlYMoztrMiSfm+bTOnEcF7ljV5bervDzv1CKs7wX1fK+i8RZ3lER3YUox8gIh05yrYIK6EcKYS5xzOkCIUQTVAQ2dKAf0e0GIQJmgBNwlKfL9cTxF3GJztG+6RBvAaCNlS+568cduB7dCZXMxRCxZEnhig5kQmCrwXUMtqWKNBsJXghQKxOK202Fl9dy4qyv/2pCN6pViAaFQVtUTpIKnbM5DJYmMw0jMNMaF56BuXPJs6+x+JGP1vN8gZv4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AwqP+8n+; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+manivannan.sadhasivam.linaro.org@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AwqP+8n+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+manivannan.sadhasivam.linaro.org@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZTWn50zc0z2yhb
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Apr 2025 19:22:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AE9C45C673B;
	Fri,  4 Apr 2025 08:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BF84C4CEE9;
	Fri,  4 Apr 2025 08:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743754950;
	bh=ua1AiLFy13t+lITso/yoUhh+okg9epvqJ/2iV5gE6Wk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AwqP+8n+2VR6cDMkt+4EkFfYl9lZqigOxSqs0YnfEWjK/qOVrTnkFcKzI+0I1+m8p
	 68KHfT8inDWq7PyaIpyh/WBxLhvxX4xCMkMDuFglf4Ai5OyQKj4OXHhWjkaxSaGIDq
	 F6FR/cCspb9kuWHeGbwFb0dJI0x7TWkWqKqNO4gokQFpYHJyraWV00tfV7gR+fBcXP
	 l1a5SzKRndJwQjq2KjgtKBUsCmiduXzdRS3TkJRLwF87BH+zfwzQmeMa/sGmx/N/xK
	 07KrAm2rrCFvPpicQCjZmGS2t2BEaNmEXU/0YKz+6lePKpv1dnU1XdEEl71Hpf3vxl
	 wasL5j6dTRhRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E111C369A1;
	Fri,  4 Apr 2025 08:22:30 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Fri, 04 Apr 2025 13:52:22 +0530
Subject: [PATCH 2/4] PCI/ERR: Add support for resetting the slot in a
 platforms specific way
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
Message-Id: <20250404-pcie-reset-slot-v1-2-98952918bf90@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2254;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=J1pulK/QhUxJluY/dbX4w+yX5yzsNUDKLf1Z3h6Znak=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBn75bDRHEqWRk4266lWr88ralCgC34yIDiJDcQy
 8j9qOiUwGWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZ++WwwAKCRBVnxHm/pHO
 9Rq8B/9yjNScPcrhP4xoodQVe2UhQ06wX8j3FIiW/HCvPsWMdhDIXtFqRnnQJemw74T7Px8Rnpi
 c+ZVMPISLnO/A687KVnD3VDdzk9QBaViKfRPnVzVmTbudjSJWyHiR9EyLaAxH+hG26BSoSnbP1w
 aouo/8LRfXNRQlMdCh1CR7h6303yWBHTisq6wRfHyG/1lbuHN04IqZ7aflwaISj7dloF9c3uP7w
 o23Vh7HOHfwPK7JkrXyuY/H7xqBi77K63hN77hyDimtJiJhhR3sXumd5x0u+k2Z/YXwTuNXXnL1
 LEQ8T/VGLFZZ1a7uOZqhnslwXXjmxwachAAHMA+U3CJdFmjZ
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

When the PCI error handling requires resetting the slot, reset it using the
host bridge specific 'reset_slot' callback if available before calling the
'slot_reset' callback of the PCI drivers.

The 'reset_slot' callback is responsible for resetting the given slot
referenced by the 'pci_dev' pointer in a platform specific way and bring it
back to the working state if possible. If any error occurs during the slot
reset operation, relevant errno should be returned.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/pcie/err.c | 15 ++++++++++-----
 include/linux/pci.h    |  1 +
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index de6381c690f5c21f00021cdc7bde8d93a5c7db52..77ce9354532afee209f658175b86e625bba8a5ee 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -234,11 +234,16 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	}
 
 	if (status == PCI_ERS_RESULT_NEED_RESET) {
-		/*
-		 * TODO: Should call platform-specific
-		 * functions to reset slot before calling
-		 * drivers' slot_reset callbacks?
-		 */
+		if (host->reset_slot) {
+			ret = host->reset_slot(host, bridge);
+			if (ret) {
+				pci_err(bridge, "failed to reset slot: %d\n",
+					ret);
+				status = PCI_ERS_RESULT_DISCONNECT;
+				goto failed;
+			}
+		}
+
 		status = PCI_ERS_RESULT_RECOVERED;
 		pci_dbg(bridge, "broadcast slot_reset message\n");
 		pci_walk_bridge(bridge, report_slot_reset, &status);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 0e8e3fd77e96713054388bdc82f439e51023c1bf..8d7d2a49b76cf64b4218b179cec495e0d69ddf6f 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -599,6 +599,7 @@ struct pci_host_bridge {
 	void (*release_fn)(struct pci_host_bridge *);
 	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
 	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
+	int (*reset_slot)(struct pci_host_bridge *bridge, struct pci_dev *dev);
 	void		*release_data;
 	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
 	unsigned int	no_ext_tags:1;		/* No Extended Tags */

-- 
2.43.0



