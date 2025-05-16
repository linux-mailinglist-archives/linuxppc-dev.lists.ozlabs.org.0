Return-Path: <linuxppc-dev+bounces-8613-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A609EABA150
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 May 2025 18:56:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZzYBV2ZPCz30D3;
	Sat, 17 May 2025 02:56:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747414578;
	cv=none; b=naFtfvWLkXPMi62LaaSJYnaWsTVBRFhq0/3qaZ2ZIrRifqu+8gNBMKDp4ImVzkVDLwl+dSeftfiISk9cgdTUb2I+7EGp78KyWeZDIIZ7v2a7jvBm7W3sVIp23MQHF0/T8pUNasYYcEyUE/ihNN+lpB2EymYK7/W1/8mrpWdHmpnUXvJ3aZo2e8KrFVwylqj1t3sBPiiYOGFoCzALypCLd/ZfRPRlq41r/KgDJIsTiItBDNdDeEUSVzkIV7gfmBRM6xELOucSuSMaWKkx1bWPfYIG2fy3LIYeQQcfVdpEG5X4SBseCGBm9DCMrVlZHCFQT/B8nwM5L3uZBinTiGR7TA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747414578; c=relaxed/relaxed;
	bh=vQp5KgHSKW4HOO20NVV22SdGkoXvOWWW2pqTNEBzMz4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GaPUvEF3CIQi2gJuleVkXEAOzrq0QAbqQ62z3SbDOXkkzlVWCM8tlKQEUV+g6RvSY8u+w+uNEqNgxVbMrTHsAeQ0mkYOONueSsXAdVunLl7zo+NlUmVqJEDIfsN7cpYn/2nFmYfLL1sbJf4EQ9Xsd7yhxEhs7V1AI6Y3qL+UE3cUrz/0T/XHvpoMF1vY0q+0eDD3Z71/8ijvscN5Fu0tJg72iVhjU5yh2MHhiW6zHqer+lfSFjP9mRiQSrECfp8VcEOZVWKfA/3UjyVbZwj856kP2BH5X9FqNWJ7ueiy+F11UBHpVevcADbuhvMVRRlPbR9RWdvfFCB6L8L43ON+Tg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=a/G4I8ha; dkim-atps=neutral; spf=pass (client-ip=117.135.210.2; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=a/G4I8ha;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=117.135.210.2; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZzYBT1GC7z2yMt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 May 2025 02:56:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=vQ
	p5KgHSKW4HOO20NVV22SdGkoXvOWWW2pqTNEBzMz4=; b=a/G4I8haOIBbu5bErr
	ytWKeslCzg1XBtmlCDeCdQApTp8/o1owb5PyXTB22syPUtD590ZCq6xX+BS+YauY
	5rWnBKx7FMsVqr7L1rZj/hacpmg3kvLb0BhzIuCoX6rAaTnO+R7ieCt+Xnwjz4vl
	FavdEP3hHECs5wRHEfcPTc7KY=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wB3lOX6bSdoVElgBw--.64634S2;
	Sat, 17 May 2025 00:55:22 +0800 (CST)
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
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 0/4] pci: implement "pci=aer_panic"
Date: Sat, 17 May 2025 00:55:14 +0800
Message-Id: <20250516165518.125495-1-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:_____wB3lOX6bSdoVElgBw--.64634S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFWUuF4kGF1xuF48ur1UAwb_yoW5ZF1DpF
	WrKws0krn5GFySyFn3CayxWryYy3Z3J345GFykWw18X3ZxKFyUJ34SyFW5tFZIgrW09w45
	Xr4vqrWUWw4DGFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRvoGdUUUUU=
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWx1Po2gnaWRvYwAAsk
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The following series introduces a new kernel command-line option aer_panic
to enhance error handling for PCIe Advanced Error Reporting (AER) in
mission-critical environments. This feature ensures deterministic recover
from fatal PCIe errors by triggering a controlled kernel panic when device
recovery fails, avoiding indefinite system hangs.

Problem Statement
In systems where unresolved PCIe errors (e.g., bus hangs) occur,
traditional error recovery mechanisms may leave the system unresponsive
indefinitely. This is unacceptable for high-availability environment
requiring prompt recovery via reboot.

Solution
The aer_panic option forces a kernel panic on unrecoverable AER errors.
This bypasses prolonged recovery attempts and ensures immediate reboot.

Patch Summary:
Documentation Update: Adds aer_panic to kernel-parameters.txt, explaining
its purpose and usage.

Command-Line Handling: Implements pci=aer_panic parsing and state
management in PCI core.

State Exposure: Introduces pci_aer_panic_enabled() to check if the panic
mode is active.

Panic Trigger: Modifies recovery logic to panic the system when recovery
fails and aer_panic is enabled.

Impact
Controlled Recovery: Reduces downtime by replacing hangs with immediate
reboots.

Optional: Enabled via pci=aer_panic; no default behavior change.

Dependency: Requires CONFIG_PCIEAER.

For example, in mobile phones and tablets, when there is a problem with
the PCIe link and it cannot be restored, it is expected to provide an
alternative method to make the system panic without waiting for the
battery power to be completely exhausted before restarting the system.

---
For example, the sm8250 and sm8350 of qcom will panic and restart the
system when they are linked down.

https://github.com/DOITfit/xiaomi_kernel_sm8250/blob/d42aa408e8cef14f4ec006554fac67ef80b86d0d/drivers/pci/controller/pci-msm.c#L5440

https://github.com/OnePlusOSS/android_kernel_oneplus_sm8350/blob/13ca08fdf0979fdd61d5e8991661874bb2d19150/drivers/net/wireless/cnss2/pci.c#L950


Since the design schemes of each SOC manufacturer are different, the AXI
and other buses connected by PCIe do not have a design to prevent hanging.
Once a FATAL error occurs in the PCIe link and cannot be restored, the
system needs to be restarted.


Dear Mani,

I wonder if you know how other SoCs of qcom handle FATAL errors that occur
in PCIe link.
---

Hans Zhang (4):
  pci: implement "pci=aer_panic"
  PCI/AER: Introduce aer_panic kernel command-line option
  PCI/AER: Expose AER panic state via pci_aer_panic_enabled()
  PCI/AER: Trigger kernel panic on recovery failure if aer_panic is set

 .../admin-guide/kernel-parameters.txt          |  7 +++++++
 drivers/pci/pci.c                              |  2 ++
 drivers/pci/pci.h                              |  4 ++++
 drivers/pci/pcie/aer.c                         | 18 ++++++++++++++++++
 drivers/pci/pcie/err.c                         |  8 ++++++--
 5 files changed, 37 insertions(+), 2 deletions(-)


base-commit: fee3e843b309444f48157e2188efa6818bae85cf
prerequisite-patch-id: 299f33d3618e246cd7c04de10e591ace2d0116e6
prerequisite-patch-id: 482ad0609459a7654a4100cdc9f9aa4b671be50b
-- 
2.25.1


