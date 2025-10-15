Return-Path: <linuxppc-dev+bounces-12872-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D15BDC2C7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 04:42:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmb2s2Z5sz2yFJ;
	Wed, 15 Oct 2025 13:42:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760496133;
	cv=none; b=hHQCaKOViJfdyT4NaYg1CkGCHTurnZ0Y5XXry0oq369klyFvixnPMoQJZ2AMyxowUD7PgqVDuQPw1HnucpPCQWXcVfnkKFetO8OEwTfUkEPm2I6uwiIeh/X17SRtg3HEWc8W7PExd8dbLtT1Fo7R3+ogKP4/dawwUruq1dMU1NgtvAqpQGy6YJiqUuxyPkWL6VZMtuDOlpXQJsia2AGcvYTHz/wZwvDT/JaRnY9sM0ZYMojteC9/MjDwoYirL8LHZ4zsX2eFpWc3Z1ZTC7ORc4W28eFNJ0w4VWNgO0QKU73PiWUWMJ5Yl7777CDSopUbijh7WWlBk9BhSADWfYYOhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760496133; c=relaxed/relaxed;
	bh=zebhL7qvvzWTRlhLZGSq5g9aY1gfkbEgG5c4GvbYqVw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UMRtAZCGcir/JHnazRgvxtPSLlsQp+j7VUxXhN7h3KE5xe/mWEzOuo5mrsErJx36tGPpCJJJI0n6sTYNcSHRZloZHGeGuqVmMeayWv9YgvALct/QWAV6nBTPp1oAa4sP2GooSMU6ta/k/SBtb4rjKL9dOk58yQEEyLMnb6Xl+ms/o08uZ3XYpxrwT7yCW9m7MPut86BnRYi8uN7yKOWQEv6kEBcPmYf0KpRJrsBOXEFPNAyJww+IgLQ9mBriN2EvSPFfAMpgmUZ/+EUDc3pQn2aQE2do96ZhGZqb0U8EG4D1HXHRWqy7a7qSkRsdOZa5zd2gnSO6gMYVqo89+SIuxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=oUnlB/15; dkim-atps=neutral; spf=pass (client-ip=115.124.30.131; helo=out30-131.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=oUnlB/15;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.131; helo=out30-131.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmb2n2XKZz3cZM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 13:42:07 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1760496123; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=zebhL7qvvzWTRlhLZGSq5g9aY1gfkbEgG5c4GvbYqVw=;
	b=oUnlB/15435Jerrjzj4semz3R3k99esBtDuMm7bPwtsY0kTiUnT+p+lE79wJ42HertU743CU6k5mwN3Kn0wP9rXUYDg6Phi0d+Yo5of2DFkA8gnEf9akdmh0BLfZrq5cDjxM5XGocPMaQzhq2WI1gr9+Bsa91ArKWR1QL/ij8kQ=
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WqEYD3-_1760496119 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 15 Oct 2025 10:42:01 +0800
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
	terry.bowman@amd.com,
	tianruidong@linux.alibaba.com,
	lukas@wunner.de
Subject: [PATCH v6 0/5] PCI/AER: Report fatal errors of RCiEP and EP if link recoverd
Date: Wed, 15 Oct 2025 10:41:54 +0800
Message-Id: <20251015024159.56414-1-xueshuai@linux.alibaba.com>
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

changes since v5:
- rebase to 6.18-rc1
- add separate patches to clear device fatal status per Kuppuswamy

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

Shuai Xue (5):
  PCI/DPC: Clarify naming for error port in DPC Handling
  PCI/DPC: Run recovery on device that detected the error
  PCI/AER: Report fatal errors of RCiEP and EP if link recoverd
  PCI/ERR: Use pcie_aer_is_native() to check for native AER control
  PCI/AER: Clear both AER fatal and non-fatal status

 drivers/pci/pci.h      |  6 ++++--
 drivers/pci/pcie/aer.c | 18 +++++++++++-------
 drivers/pci/pcie/dpc.c | 31 ++++++++++++++++++++++++-------
 drivers/pci/pcie/edr.c | 35 ++++++++++++++++++-----------------
 drivers/pci/pcie/err.c | 16 +++++++++++++---
 5 files changed, 70 insertions(+), 36 deletions(-)

-- 
2.39.3


