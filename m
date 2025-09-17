Return-Path: <linuxppc-dev+bounces-12303-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D21B7D90A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 14:30:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRTWK4XFvz3cYx;
	Wed, 17 Sep 2025 16:34:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758090845;
	cv=none; b=AeLlm9/LLNkncjzDIUUgxVAk488wsMUfipVuHm9qi8+mbN4juAGL6bqGRAyQZO1KazVJjSRx9AwmEFzy5+99b85RqpxTl17GPuJeRXd4nlCSsLEZsmIsxyCZUgdGgWxgP0zZJqwMWiOmWZxXuMXGO/Rm9v1TfyXGFD6RpkDh3rG7YbQMCaKchd5CDsv9Gu3fcrQBG3j9jJJuvHmvqeonYk5IwsTZuK3aVTTbZx8zts/yo+7gwerEv5Zf9lzk0yiZTIYgZMl13Q8kgYQyQeQABYYO5HwfDfgzFlz3ZR+33ZwNeLVl2ExbkPgW5zEfy6dPIk1x2nNZ8iBxVb4pGXissA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758090845; c=relaxed/relaxed;
	bh=ig9l9rq/RFKj6WZZ/ptY2bx7snCiOe83lWv6zfwEAe4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lljIQIs9qAwLiHiq9BVUZWmkBSGg6pPUHU78eSSPoaTfVq0Jz6oV/LGsmvzO3lS1XB/yd4WZViBg+3mvM+Zcn1zqTY9Zf29ObFe0jF2+ntYFEZHuRyGjbZ7Y6l8oGmNcLSipnebbl5mi5tMZih8VaTOrt5Yk7gdEDXssQUM/nLz9ENDunO7aNAY2MgG63v0r94vwI4ONCgt605q8XntC6aPum5K5yIm8ED+gsM4T6741MmycjoZfaNEOZLruGZwDDuRumGpssZmiKTd4BK2qgqSjEJVBj9fDUKij3/k1252D6urYlX72rXM11U0JHHmSHFznfEyItNSfcv8tqELqDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=YDDOdCnX; dkim-atps=neutral; spf=pass (client-ip=115.124.30.131; helo=out30-131.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=YDDOdCnX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.131; helo=out30-131.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cRTWH6Mhfz3cYN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Sep 2025 16:34:02 +1000 (AEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1758090835; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=ig9l9rq/RFKj6WZZ/ptY2bx7snCiOe83lWv6zfwEAe4=;
	b=YDDOdCnXu+aFywd1jfFaY2fTzGB3hPM0lxU/lrbP2QCC+tqNvWjez/x4QVWb1xVOe14K6Q+bQt7D+XqOj7xg7hj3zbnrKlwe6Qr9TbdDib8qMGge8c02YzyEdnfGI/4L0I8NywCxCib/7JpuJBMLrfg+zh1dybhSv39YHZTtfkM=
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WoBL8JQ_1758090832 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 17 Sep 2025 14:33:54 +0800
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: bhelgaas@google.com,
	mahesh@linux.ibm.com,
	mani@kernel.org,
	Jonathan.Cameron@huawei.com,
	sathyanarayanan.kuppuswamy@linux.intel.com
Cc: oohall@gmail.com,
	xueshuai@linux.alibaba.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 0/3] PCI/AER: Report fatal errors of RCiEP and EP if link recoverd
Date: Wed, 17 Sep 2025 14:33:49 +0800
Message-Id: <20250917063352.19429-1-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

changes since v4:
- rebase to 6.17-rc6
- pick up Reviewed-by tag for PATCH[2] from Sathyanarayanan
- minor typos in commit log per Manivannan

changes since v3:
- squash patch 1 and 2 into one patch per Sathyanarayanan
- add comments note for dpc_process_error per Sathyanarayanan
- pick up Reviewed-by tag for PATCH[1] from Sathyanarayanan

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

	pcieport 0015:00:00.0: EDR: EDR event received
	pcieport 0015:00:00.0: EDR: Reported EDR dev: 0015:00:00.0
	pcieport 0015:00:00.0: DPC: containment event, status:0x200d, ERR_FATAL received from 0015:01:00.0
	pcieport 0015:00:00.0: AER: broadcast error_detected message
	pcieport 0015:00:00.0: AER: broadcast mmio_enabled message
	pcieport 0015:00:00.0: AER: broadcast resume message
	pcieport 0015:00:00.0: pciehp: Slot(21): Link Down/Up ignored
	pcieport 0015:00:00.0: AER: device recovery successful
	pcieport 0015:00:00.0: EDR: DPC port successfully recovered
	pcieport 0015:00:00.0: EDR: Status for 0015:00:00.0: 0x80

AER status registers are sticky and Write-1-to-clear. If the link recovered
after hot reset, we can still safely access AER status and TLP header of the
error device. In such case, report fatal errors which helps to figure out the
error root case.

After this patch, the logs like:

	pcieport 0015:00:00.0: EDR: EDR event received
	pcieport 0015:00:00.0: EDR: Reported EDR dev: 0015:00:00.0
	pcieport 0015:00:00.0: DPC: containment event, status:0x200d, ERR_FATAL received from 0015:01:00.0
	pcieport 0015:00:00.0: AER: broadcast error_detected message
	vfio-pci 0015:01:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Transaction Layer, (Receiver ID)
	pcieport 0015:00:00.0: pciehp: Slot(21): Link Down/Up ignored
	vfio-pci 0015:01:00.0:   device [144d:a80a] error status/mask=00001000/00400000
	vfio-pci 0015:01:00.0:    [12] TLP                    (First)
	vfio-pci 0015:01:00.0: AER:   TLP Header: 0x4a004010 0x00000040 0x01000000 0xffffffff
	pcieport 0015:00:00.0: AER: broadcast mmio_enabled message
	pcieport 0015:00:00.0: AER: broadcast resume message
	pcieport 0015:00:00.0: AER: device recovery successful
	pcieport 0015:00:00.0: EDR: DPC port successfully recovered
	pcieport 0015:00:00.0: EDR: Status for 0015:00:00.0: 0x80

Shuai Xue (3):
  PCI/DPC: Clarify naming for error port in DPC Handling
  PCI/DPC: Run recovery on device that detected the error
  PCI/AER: Report fatal errors of RCiEP and EP if link recoverd

 drivers/pci/pci.h      |  5 +++--
 drivers/pci/pcie/aer.c | 11 +++++++----
 drivers/pci/pcie/dpc.c | 31 ++++++++++++++++++++++++-------
 drivers/pci/pcie/edr.c | 35 ++++++++++++++++++-----------------
 drivers/pci/pcie/err.c | 11 +++++++++++
 5 files changed, 63 insertions(+), 30 deletions(-)

-- 
2.39.3


