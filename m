Return-Path: <linuxppc-dev+bounces-8884-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2998AC17AE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 01:24:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3PVx3gHKz3c71;
	Fri, 23 May 2025 09:23:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747956233;
	cv=none; b=YAUkpnb4El9xAj81y9BS1LoenVjXQ+GVDugPEgmG4bL39QPX7MEGJHjnPL1cczXhKg10BZkN8A0K8XpCnfjdnFEYrb8L7qmh/5HeU/V31gU/AbxS30UB/pyyO4Z7NRuq+w5QZfOwRc4BxEw6Z0VP76CsWJV0bL3LrhTm4XNKcXQS63XicUuLpLzef8f4UPnvsKlTCDSWO5ZobNerawn6oQT6to5M6DKp7SwU/yJcfO/upB9OTFFBOid3E99kGcH0PAIAH38gr2vfqfweSSmr4tY4lhtspAJwhAfrW4NgcfBxmFFeRZ8TZv8zK9H57gDpJosC7a/Ml0lfSC7S4oFsLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747956233; c=relaxed/relaxed;
	bh=udBRbtRxBBZIy1fayT7YWK6z58aVkSc/p0t0124/zwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GysvCtctIPS2376tgLqwOH/gTjK9W1aKPF0gL0q/aANa2Ly6sOpGXmC3FMgR83jS1str0wFJp2Lsssa9rzCBLIG0MX9g49C/8vUODaKzp3aOoOjkcnjiuo8JDZpae5S2kJKWkJJvDtSvduUgzLZL8asRqEggrue42zDYtCui66jxzR27rULSf3Bcd9Mqd7fgSorf8s5a5g6vJ+jMbnPOeBPeSEJfOILEgWX1Vi1AqpOlwvLewv0LmV/gc/D0OkN/cculMhNO62tf3R+YpNM0MuaWOYY3H7ixttfHgcYB0eIVrUPMGK7+qYlq43qh0aoiV4TT9SgTCVnNL2uvE+0ejw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K/HVPUDe; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K/HVPUDe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3PVw5Rjkz2yr4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 09:23:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 13F484A89A;
	Thu, 22 May 2025 23:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35D9C4CEF3;
	Thu, 22 May 2025 23:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747956229;
	bh=LcIUWhj5nNnSPZAL+zgkVI9JEnmmZCD3KzStQFp7sr0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K/HVPUDe7VbeiPhmHszDIct1InFeR0HSHX3Mkvyockt4/bAnfiPMojUOiqEGyAlbz
	 HHBkoy4f+KcU+Xk1UHRECQH443b9MYF78R0xzsuNIRES+iI8ciL8pA0qvIC6APqgIU
	 bjZOzO3ViaHTMM4Z1vMaXVl3Xtt7+d+JPUwQ4/zTeZ5EqBpWOmtWLA6MTLwtXofn+p
	 QsYWS9kqaV3XtvR9XGsIU5W5TnMybqVftBasWTWqu/l+BqLDqLH5+S0TI0CzK9DmNp
	 weOFJvD0Xp1EY8OA7bZg0znqQYQqkzYZOkYE5dZSttSf1xwQN6RJeyyykor+K6YucJ
	 wcfwJ4z32AAfQ==
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
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v8 03/20] PCI/AER: Factor COR/UNCOR error handling out from aer_isr_one_error()
Date: Thu, 22 May 2025 18:21:09 -0500
Message-ID: <20250522232339.1525671-4-helgaas@kernel.org>
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

aer_isr_one_error() duplicates the Error Source ID logging and AER error
processing for Correctable Errors and Uncorrectable Errors.  Factor out the
duplicated code to aer_isr_one_error_type().

aer_isr_one_error() doesn't need the struct aer_rpc pointer, so pass it the
Root Port or RCEC pci_dev pointer instead.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Link: https://patch.msgid.link/20250520215047.1350603-4-helgaas@kernel.org
---
 drivers/pci/pcie/aer.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index a1cf8c7ef628..568229288ca3 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1273,17 +1273,32 @@ static inline void aer_process_err_devices(struct aer_err_info *e_info)
 }
 
 /**
- * aer_isr_one_error - consume an error detected by Root Port
- * @rpc: pointer to the Root Port which holds an error
+ * aer_isr_one_error_type - consume a Correctable or Uncorrectable Error
+ *			    detected by Root Port or RCEC
+ * @root: pointer to Root Port or RCEC that signaled AER interrupt
+ * @info: pointer to AER error info
+ */
+static void aer_isr_one_error_type(struct pci_dev *root,
+				   struct aer_err_info *info)
+{
+	aer_print_port_info(root, info);
+
+	if (find_source_device(root, info))
+		aer_process_err_devices(info);
+}
+
+/**
+ * aer_isr_one_error - consume error(s) signaled by an AER interrupt from
+ *		       Root Port or RCEC
+ * @root: pointer to Root Port or RCEC that signaled AER interrupt
  * @e_src: pointer to an error source
  */
-static void aer_isr_one_error(struct aer_rpc *rpc,
+static void aer_isr_one_error(struct pci_dev *root,
 		struct aer_err_source *e_src)
 {
-	struct pci_dev *pdev = rpc->rpd;
 	struct aer_err_info e_info;
 
-	pci_rootport_aer_stats_incr(pdev, e_src);
+	pci_rootport_aer_stats_incr(root, e_src);
 
 	/*
 	 * There is a possibility that both correctable error and
@@ -1297,10 +1312,8 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
 			e_info.multi_error_valid = 1;
 		else
 			e_info.multi_error_valid = 0;
-		aer_print_port_info(pdev, &e_info);
 
-		if (find_source_device(pdev, &e_info))
-			aer_process_err_devices(&e_info);
+		aer_isr_one_error_type(root, &e_info);
 	}
 
 	if (e_src->status & PCI_ERR_ROOT_UNCOR_RCV) {
@@ -1316,10 +1329,7 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
 		else
 			e_info.multi_error_valid = 0;
 
-		aer_print_port_info(pdev, &e_info);
-
-		if (find_source_device(pdev, &e_info))
-			aer_process_err_devices(&e_info);
+		aer_isr_one_error_type(root, &e_info);
 	}
 }
 
@@ -1340,7 +1350,7 @@ static irqreturn_t aer_isr(int irq, void *context)
 		return IRQ_NONE;
 
 	while (kfifo_get(&rpc->aer_fifo, &e_src))
-		aer_isr_one_error(rpc, &e_src);
+		aer_isr_one_error(rpc->rpd, &e_src);
 	return IRQ_HANDLED;
 }
 
-- 
2.43.0


