Return-Path: <linuxppc-dev+bounces-6235-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4379EA379D8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 03:42:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yx6Pz5wkJz300B;
	Mon, 17 Feb 2025 13:42:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739760151;
	cv=none; b=L7TqNOku+cjW0qUq3YV/qGtO+ezPVROgN+dRkmA7/0YCtfzjqas5a6ob7LV4y5YMxfgMSQ/MskfbT9LrM1D880sNw6D8hph1LEofHybjVbDsqTuPzrmK5FNfxrnY2bNSUKsx81DBYx9uuFfnk1rRq+sWSKOj5GfuiKRGUb+032T9dxSky7MDVYgkcz8PLE6TISDnb+0oyVKJB63lY3dK3a/oE5NYsjseHWwKFlkcmrTCHF9mofYYHKzBR0y65znLfRDRl6dmYFVCc+0ZevuxdlNVLk9hlalrajo+moKHE0X5+cctG7Z22yLxMjo4QYZhQ3/fcy+XlfnBxCGJs/mlgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739760151; c=relaxed/relaxed;
	bh=IWnXk2v+MvIdKRnunCl5x6oEXE/uiljBcFUSPpVL73o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h8o1TGvwmhDSxg1RRH50wLayLQ39cc5yBNrgbwu2Kn9oZ2Umrvca/5nMs1AyL6JjgvMYy5MzRXKLj/HGUI9D7eO4JPa4DJtR/qI7gyzjOsCTAHCVXd5+8UPevNip9/UG5TS+E9sVlMBauNWLMthDmEvez0vWoCTQ1d3lqpht9a5Tc/fC4h4vleUe50dA3rMAxsB2rd+dSiEepD/bImE3L3kfFiHE+mQwHNP61oogKQ1GyNJ80s6k69xz2VnBF+u+iShus31JxOqjnzuh4Jw83UFYFYMeWnTs2py2z2/JevD0aDqrtUou0aX7KZpt2Ev2uyowlDTDkbfNLHTu6Lwqbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=tW5TSZ1r; dkim-atps=neutral; spf=pass (client-ip=115.124.30.132; helo=out30-132.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=tW5TSZ1r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.132; helo=out30-132.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yx6Px6Qghz2yxP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 13:42:28 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739760144; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=IWnXk2v+MvIdKRnunCl5x6oEXE/uiljBcFUSPpVL73o=;
	b=tW5TSZ1rKRMwyhaA2BmhQZpN0BVs8Txl+U83PIhMn0dFWBl/A0HYd+hTfxynbTwqNGWHiGm2kXPAf8NpLUvPD33AHHCnXJDi3ZP5mchn7ZMYqh9hbKdz1FVp6NvuTn8RQBBoQVBHYEshoUnxLnkILZ77SZ3msBJ1DkwbY4C9gnw=
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WPYBR1G_1739760140 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 17 Feb 2025 10:42:22 +0800
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
	tianruidong@linux.alibaba.com
Subject: [PATCH v4 0/3] PCI/AER: Report fatal errors of RCiEP and EP if link recoverd
Date: Mon, 17 Feb 2025 10:42:15 +0800
Message-ID: <20250217024218.1681-1-xueshuai@linux.alibaba.com>
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

changes since v3:
- squash patch 1 and 2 into one patch per Sathyanarayanan
- add comments note for dpc_process_error per Sathyanarayanan
- pick up Reviewed-by tag from Sathyanarayanan

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

Shuai Xue (3):
  PCI/DPC: Clarify naming for error port in DPC Handling
  PCI/DPC: Run recovery on device that detected the error
  PCI/AER: Report fatal errors of RCiEP and EP if link recoverd

 drivers/pci/pci.h      |  5 +++--
 drivers/pci/pcie/aer.c | 11 +++++++----
 drivers/pci/pcie/dpc.c | 34 +++++++++++++++++++++++++++-------
 drivers/pci/pcie/edr.c | 35 ++++++++++++++++++-----------------
 drivers/pci/pcie/err.c |  9 +++++++++
 5 files changed, 64 insertions(+), 30 deletions(-)

-- 
2.39.3


