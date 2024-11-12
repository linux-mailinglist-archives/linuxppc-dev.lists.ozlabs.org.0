Return-Path: <linuxppc-dev+bounces-3121-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 208399C599C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 14:54:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnnwN5Y4Mz2yWr;
	Wed, 13 Nov 2024 00:54:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.99
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731419684;
	cv=none; b=l0Yd/N9yi8GipXGzatDzokXEZtuGH/YhuduEL0qjQ9tw8K4hCAFSQfRwaC2vBdHBk7f7/mK9Z9ucMtXaHNzRNSRWYeiwXaszdtCPI7+nGbR92nnQVvztEoW4IDR2zvU5PfwuNrAubyyhy6mePMrr7Yt3V/fcgfR+0Mt2nh5djqJkokXgsCitlEVfvpDbBkI1ATBT4SiddBcHrSjxQCE6Vx8QLrD6zUCk0kOZ33e11bPUUPbuDDKOgMLQ7jQ+i+lGZsQrhRfYV90AQmQ0gfC65CiB0NZYFK0bp2ERdsZO7yRPvctW2ZGCZZbpDweijnCc4BvqmF3Z+udE6T1u7cqLJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731419684; c=relaxed/relaxed;
	bh=J0yoky5hVi3m0oetpcrW8t6Yucb2Ph3LMUU2z7W3hCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TKPA7vqAYlX4BQkrfiZNihF8Zi2OshV3Kb0X5FqLu7W1kLGPVaMiYAmoqr6enK/MPtHX1Tl79AAQLflh1DggwCkd8N2fHK/hyryJxxp4+v3NW9pNBykZNaAGZxgW8+aODNagMeNU+0vsujiKoui4OSrXNWmWp7/X5mjiPkLju1mno5G1oxvl7SyDK9IgRRxlfkMIBnnw+6MLj1UVOogofISfBBGhYRNAjGPDJMGVE9XbzeBXzgDFoXZ2xUjucVRhKHHAwwi8sx9neW+B59KWFaQkYyMRJwNDsciSKIqMaj7eZgaJgKxr0lmcs1hAlfUHpLcxOryZ5GGCquhGr0W7Lw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=wituilJI; dkim-atps=neutral; spf=pass (client-ip=115.124.30.99; helo=out30-99.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=wituilJI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.99; helo=out30-99.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XnnwL3sQFz2xy6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 00:54:38 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1731419673; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=J0yoky5hVi3m0oetpcrW8t6Yucb2Ph3LMUU2z7W3hCI=;
	b=wituilJIvWGKmxSWbC7EcPUvbMwAoNkgHKD56iGXnu8GarX23StXX3HQ2+FpTuoJOIlpDRvu+sEJhU0+KoFo/uMm8F+joLmJiDW3P9dlBHvJBIH4+p0uCWBTJPuJpbEtqJXYUsH6nk7oeeeE3NmuiHV2japOCpxUzL7M0sxX60g=
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WJHmH-E_1731419670 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 12 Nov 2024 21:54:31 +0800
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	bhelgaas@google.com,
	kbusch@kernel.org
Cc: mahesh@linux.ibm.com,
	oohall@gmail.com,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	xueshuai@linux.alibaba.com
Subject: [PATCH v2 0/2] PCI/AER: Report fatal errors of RCiEP and EP if link recoverd
Date: Tue, 12 Nov 2024 21:54:17 +0800
Message-ID: <20241112135419.59491-1-xueshuai@linux.alibaba.com>
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

- Patch 1/2 identifies the error device by SOURCE ID register
- Patch 2/3 reports the AER status if link recoverd.

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

Shuai Xue (2):
  PCI/DPC: Run recovery on device that detected the error
  PCI/AER: Report fatal errors of RCiEP and EP if link recoverd

 drivers/pci/pci.h      |  5 +++--
 drivers/pci/pcie/aer.c | 11 +++++++----
 drivers/pci/pcie/dpc.c | 32 +++++++++++++++++++++++++-------
 drivers/pci/pcie/edr.c | 35 ++++++++++++++++++-----------------
 drivers/pci/pcie/err.c |  9 +++++++++
 5 files changed, 62 insertions(+), 30 deletions(-)

-- 
2.39.3


