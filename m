Return-Path: <linuxppc-dev+bounces-8776-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F2DABE652
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 23:51:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b27Xg14mFz3bpd;
	Wed, 21 May 2025 07:50:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747777859;
	cv=none; b=g1+aO90qAHSuNaNZq+Gsg3CTI8pRUbG3JAiNrhpI6yBhs09esjVEuLRGYCWFdzQG9lCE/IvsV039RmAW9a3EcfO1/zWzAsgVXXPBtYPSIELDkDWophSjezZwcpvDuQE1EHt4/c/rfH+yo5yYxY0voST/MgzjM4nhihxviNmxp2sdQV/i485QcobmKiJYClw5DHwRgmirfzyP/9M1wqD12V4XOO7OGpcg8Z/TO46D10hOJzyyzACienZ0ZK+/hqVl/ThJ87h5or2wlL2LBfUzUv+PLE53D0KA42GP7szaOkLZNPEQDZFJ4JEqATLjNbgihFmEjmftF7Od4rjVfzMP4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747777859; c=relaxed/relaxed;
	bh=l4XLElgObVI5Ww5wjxhMTpWDM++oG9eLr5zSpeZ2GIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BSal51E0feF1RTGoeHsAKD6iGO8fJWKBqhGxlcCEpmtRE9PMC15yi5x9M7s5Wnu1YqBIxwK0+vv4lELOYJ6GIeKaOeG99g/ou5Hwj7SlP8Z+/ZRpwftrxZG5OSkjXta9fZ5GziO2A8Ttqmj6ux7l0lN+dYycxr55hoYjATVW2UYjNi6rstIfP2yVWc9P5lHnqAY9nKcmVNWJZcGI/WQjDTkNKq8IxAUfZ18XJsWs4KsSynQQW/VCrpKDypsV7f47daNCaBFIEdxiUe5HNMWJOVUmEyFtUUd6+QkmpyixOGKpUjPmLjPgelmGIZbrCrCMuRN/8DsbIKA/TofUAOxQLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NuctOaY8; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NuctOaY8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b27Xf2LqVz3blb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 07:50:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0F195A4EF0F;
	Tue, 20 May 2025 21:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C0EC4CEEF;
	Tue, 20 May 2025 21:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747777855;
	bh=bOmto9wLMARVaw1TnEPc56nZV6A8tSFt4Yy4a/LNgTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NuctOaY8bndBicWsciYCCKzNXMgTJ5UEMrJl16YOrn9MvPRP9QPyZESvPPiXCQSPq
	 54rgbRzkMQHc2+x1ozcAYB/Z+qSiXdo5MjoqHJzDVzRznHpH59jfB47G3niFxVgI+d
	 kyAC1a0hYGtNasbof07CG9vadAWF7JfqXYfspgydFnMV8MVxTJxD2EhgtYkn6Ob++/
	 WkZILGsDwtAZdHMJNSBQNpq6dUuQCUkbMluJMOvR7h+hJdxIf3VcAl6+1/AFu+tiAY
	 MA3upti9b6h90Q0KTSRwuW5JluOYd4FEGMClyEe7XkAb7xODbgqnKk1k41lb1i2+KQ
	 XNE7SWd0ULo1w==
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
Subject: [PATCH v7 03/17] PCI/AER: Factor COR/UNCOR error handling out from aer_isr_one_error()
Date: Tue, 20 May 2025 16:50:20 -0500
Message-ID: <20250520215047.1350603-4-helgaas@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bjorn Helgaas <bhelgaas@google.com>

aer_isr_one_error() duplicates the Error Source ID logging and AER error
processing for Correctable Errors and Uncorrectable Errors.  Factor out the
duplicated code to aer_isr_one_error_type().

aer_isr_one_error() doesn't need the struct aer_rpc pointer, so pass it the
Root Port or RCEC pci_dev pointer instead.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
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


