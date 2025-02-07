Return-Path: <linuxppc-dev+bounces-5940-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68480A2BF71
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 10:35:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yq82x2hGSz30Tf;
	Fri,  7 Feb 2025 20:35:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=47.90.199.2
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738920921;
	cv=none; b=Mo380NwzG6OO+gR0wz0mg6cULrIFcM2N6DQjgYfsQvMB5hjOGW3F6YOruJhB6JNfWl1ilu1mMMnCQgUcatjTr4jpUNsS8M0RyDSPky2hyskdzUGGxsYkubva1tRDau7MGr8T0Q1DglBc229FTPXdc+zG5QUbAODcrShWTgUD2sXMkBShS242yWpHZ9RIO0VqUQaRPVFXRDS019r1MwdvHRuJuxh2tWgoUFJdW3Yge5Tl+wTEuH4TFZeC5bTyr5g42X5dmIFA9XAuOLJXR6ulfWStXjvmfzYkmsNSgKL5+DolnXssz09ZeB4jAfhfjSCn/01yBCttLZ8hAfomIlAv7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738920921; c=relaxed/relaxed;
	bh=lYqzDEofKcdbh54CmYKGDS4DQjLRikMCY9L55YlF/XA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bb3JEf2/7CbtEtgg7Il/PF1zKrc0pEGq/0+VzGLsKhswernJcaEOSXcX4DqkumDe4s5Pbn0W/1XRwmDP/BPKy1rcUgHaC02eO9OW0CgoImJ9PtR4pLlCrwITV8yzI7n3Gpipl22c9Tz7JmV9DF6b3YsiqHZ5VWRI4Kan4E27xUkkL71S/6QkcreG8excSyumYPzA89LxtaryII9V8700x6QFOk7KP5EkFETe4SYp/034ZMLdHhxYAbcEhKITKohJUpdEWAkHhe708EvwdF28JUQ//6lHQbimD2kLkYmtTOgtM2asK5l9M/t4wVfdp1cyKveo6pqN5T7eishgigH/Xg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=aLj7T9oz; dkim-atps=neutral; spf=pass (client-ip=47.90.199.2; helo=out199-2.us.a.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=aLj7T9oz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=47.90.199.2; helo=out199-2.us.a.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out199-2.us.a.mail.aliyun.com (out199-2.us.a.mail.aliyun.com [47.90.199.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yq82w177Yz30Pp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 20:35:19 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1738920904; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=lYqzDEofKcdbh54CmYKGDS4DQjLRikMCY9L55YlF/XA=;
	b=aLj7T9ozTzAXigIPFBYFPRtHLkXy1OZplDvU09Pb7s17beQpdq2S23MJXT4JumyahrdFFTppxx2Nw39mCvBnh5Il4UeGt4lQeqQfhwhgV11ZqjELHJSxoLkPF23+S+pnDEH8zAJaTNEoyJ5h3OqjmlXTVFcERNzExlGB2d4UBQ4=
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WOyzNDL_1738920902 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 07 Feb 2025 17:35:03 +0800
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	bhelgaas@google.com,
	kbusch@kernel.org,
	sathyanarayanan.kuppuswamy@linux.intel.com
Cc: mahesh@linux.ibm.com,
	oohall@gmail.com,
	xueshuai@linux.alibaba.com,
	Jonathan.Cameron@huawei.com,
	terry.bowman@amd.com
Subject: [PATCH v3 1/4] PCI/DPC: Rename pdev to err_port for dpc_handler
Date: Fri,  7 Feb 2025 17:34:57 +0800
Message-ID: <20250207093500.70885-2-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250207093500.70885-1-xueshuai@linux.alibaba.com>
References: <20250207093500.70885-1-xueshuai@linux.alibaba.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The irq handler is registered for error port which recevie DPC
interrupt. Rename pdev to err_port.

No functional changes.

Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
---
 drivers/pci/pcie/dpc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 242cabd5eeeb..1a54a0b657ae 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -346,21 +346,21 @@ static bool dpc_is_surprise_removal(struct pci_dev *pdev)
 
 static irqreturn_t dpc_handler(int irq, void *context)
 {
-	struct pci_dev *pdev = context;
+	struct pci_dev *err_port = context;
 
 	/*
 	 * According to PCIe r6.0 sec 6.7.6, errors are an expected side effect
 	 * of async removal and should be ignored by software.
 	 */
-	if (dpc_is_surprise_removal(pdev)) {
-		dpc_handle_surprise_removal(pdev);
+	if (dpc_is_surprise_removal(err_port)) {
+		dpc_handle_surprise_removal(err_port);
 		return IRQ_HANDLED;
 	}
 
-	dpc_process_error(pdev);
+	dpc_process_error(err_port);
 
 	/* We configure DPC so it only triggers on ERR_FATAL */
-	pcie_do_recovery(pdev, pci_channel_io_frozen, dpc_reset_link);
+	pcie_do_recovery(err_port, pci_channel_io_frozen, dpc_reset_link);
 
 	return IRQ_HANDLED;
 }
-- 
2.39.3


