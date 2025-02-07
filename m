Return-Path: <linuxppc-dev+bounces-5936-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC88A2BF67
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 10:35:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yq82j52ytz30T0;
	Fri,  7 Feb 2025 20:35:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.113
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738920909;
	cv=none; b=jKxPaysakH51Yrk7HlfBlHkva16stuGlhNFgT/knL8lU6QcvvXpwqWHZ7Jd2sOYHVCXVFYTpCN5mxdTQYXq28KgvHGtfBUo5jTdEp5QM9bVGdCwaD6sT42WihJ6FU417JK5xhJ8JXy2TWfkl4tLJFxmZdLb2y6siSFUVm72kxGOl6vRK28Qe+mBFN81sBqKxiVCGmNGcChEMclUQai5acobqbShfAMSvhaxnRlO8DCqHkYfTpZDS1mtlW6h+R84vp94Ec3oUTdA8K/Nx4eKwfrFDPrHeC5MzJ+L+tYL9XTzRqQYNv8ERjXeFRqJIHqRcjjU4R7Pek1eXZf5p6KI/ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738920909; c=relaxed/relaxed;
	bh=nsVyOK7lf4dncZjmNZ83lvgaF7otJZXfXf1rIy5TN2k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QA6peq+EVeWAImJFZxPyQbZ9uElJFz19f0WmzL4u3QYSeDeHMsutYCjar8YTM+bXaZRiXFNc+DrqdE0hihrHod/COsaFFa+0oY9xLhijFiqttzzzQlNkGt7MhmHF+A+It1IuHhVYe+m+IMUde1Pg5M7oAGFNgEah235tWr5idikWZGIANZ2DCZW2yiE/fhaSS6owXZ0HoNmukeu81H+YFzvWIW56rKsR17+JTA4xkOhycpa+lVWxgOC75Q9FS/wK+bq51uHe6Y/T9bWeKPmb1FYlXG+m6SUe1HexXwTEPdfyBGEL01NEu/xbVfqHba4bfVazfhzi92gLiB3uToMN4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=xN6X0AaD; dkim-atps=neutral; spf=pass (client-ip=115.124.30.113; helo=out30-113.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=xN6X0AaD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.113; helo=out30-113.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yq82g6TGkz301v
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 20:35:06 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1738920903; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=nsVyOK7lf4dncZjmNZ83lvgaF7otJZXfXf1rIy5TN2k=;
	b=xN6X0AaDFM134nZqlPaxRnASZZMaC2hMpMH3uXDA0G+P44VstETa8W97PIBU6co8ewkSCzzzsBvGlD9lL9Gdwlmfa5Aux+++wJzebNNarpEVmX2nBQWFMj/c5ZGCxINbD4E12MxxAWSSKQ30ylK2Zmu0FJ7PtW6Ysywk+YsFSzA=
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WOyzNCd_1738920901 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 07 Feb 2025 17:35:02 +0800
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
Subject: [PATCH v3 0/4] PCI/AER: Report fatal errors of RCiEP and EP if link recoverd
Date: Fri,  7 Feb 2025 17:34:56 +0800
Message-ID: <20250207093500.70885-1-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.44.0
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
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

changes since v2:
- moving the "err_port" rename to a separate patch per Sathyanarayanan
- rewrite comments of dpc_process_error per Sathyanarayanan
- remove NULL initialization for err_dev per Sathyanarayanan

changes since v1:
- rewrite commit log per Bjorn
- refactor aer_get_device_error_info to reduce duplication per Keith
- fix to avoid reporting fatal errors twice for root and downstream ports per Keith

The AER driver has historically avoided reading the configuration space of an
endpoint or RCiEP that reported a fatal error, considering the link to that
device unreliable. Consequently, when a fatal error occurs, the AER and DPC
drivers do not report specific error types, resulting in logs like:

   pcieport 0000:30:03.0: EDR: EDR event received
   pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
   pcieport 0000:30:03.0: DPC: ERR_FATAL detected
   pcieport 0000:30:03.0: AER: broadcast error_detected message
   nvme nvme0: frozen state error detected, reset controller
   nvme 0000:34:00.0: ready 0ms after DPC
   pcieport 0000:30:03.0: AER: broadcast slot_reset message

AER status registers are sticky and Write-1-to-clear. If the link recovered
after hot reset, we can still safely access AER status of the error device.
In such case, report fatal errors which helps to figure out the error root
case.

After this patch set, the logs like:

   pcieport 0000:30:03.0: EDR: EDR event received
   pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
   pcieport 0000:30:03.0: DPC: ERR_FATAL detected
   pcieport 0000:30:03.0: AER: broadcast error_detected message
   nvme nvme0: frozen state error detected, reset controller
   pcieport 0000:30:03.0: waiting 100 ms for downstream link, after activation
   nvme 0000:34:00.0: ready 0ms after DPC
   nvme 0000:34:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Data Link Layer, (Receiver ID)
   nvme 0000:34:00.0:   device [144d:a804] error status/mask=00000010/00504000
   nvme 0000:34:00.0:    [ 4] DLP                    (First)
   pcieport 0000:30:03.0: AER: broadcast slot_reset message 

Shuai Xue (4):
  PCI/DPC: Rename pdev to err_port for dpc_handler
  PCI/EDR: Rename edev to err_port for edr_handle_event
  PCI/DPC: Run recovery on device that detected the error
  PCI/AER: Report fatal errors of RCiEP and EP if link recoverd

 drivers/pci/pci.h      |  5 +++--
 drivers/pci/pcie/aer.c | 11 +++++++----
 drivers/pci/pcie/dpc.c | 31 ++++++++++++++++++++++++-------
 drivers/pci/pcie/edr.c | 35 ++++++++++++++++++-----------------
 drivers/pci/pcie/err.c |  9 +++++++++
 5 files changed, 61 insertions(+), 30 deletions(-)

-- 
2.39.3


