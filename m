Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3394F21BFBD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jul 2020 00:22:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B3SFz6PF0zDrPR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jul 2020 08:22:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=refactormyself@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=E/WvXIbd; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B3SCf71r5zDrMH
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jul 2020 08:20:14 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id z13so7340569wrw.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 15:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=sQSNR/BugIoJc6hRmCvyOY2T/BtHesGbyrXiTgar9dI=;
 b=E/WvXIbdBLzBijEIrHjy3ROSLzxYB5kRcgXlTWV5s6nTjk0sIxLxLV8dtFIH5vEf/H
 U3eWv/xfzqF2tIQrGPbwIRR+9fsr3gC+Af8kb4EapkgW9zT1y/O6QsdJtedCfC+yuMe/
 KhighYvpRyQnvVu4JLLuQojc1o28CCTGSLa/Vc7qo5GY/zFYL/85uWjW98zmkPmndBES
 mAL7VvNIpEqvxJ1y9qrWHkQw7gdl6GJkw3mcT+pmgsizutcBpX00cH6+jfPFxCmME6bi
 I2ZMDOM7hADKIDhEsG+aR5z3LW8kLVbqkzK9d8Ey3Xa9e5RkgEjZbSXxXl+6egvtEr7E
 enFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=sQSNR/BugIoJc6hRmCvyOY2T/BtHesGbyrXiTgar9dI=;
 b=NCITp/iWShxd7ZeM7DVRWEegZ9bhudfRvujh7vgp45uI8rV6D/weA0u8ZG5kVGf8I/
 KIlyUMJUH/O7C61PVzXdcvZ/gibTGirMExpWRm+5beWGNCRkTWQS4ZG62xKJyeFnO0aT
 7YvmlYtybJ70l98vPVVXWHCav3dM0amtHB0rbRZbOK9nVZraki6ER+Ze6vzhoyUdn+C8
 EAB+Z78Eph0UjFQ/ybsjvMf8dQRlazzylNR4tc8MSNh4ySZJqRxCieykzA7AkU1CnUx7
 u8WeiotywS4cJrApANnFbcLyruhHagQwsnFgYGYVQ1X7FrKrZ1HvPcUYf1sH+wSiCbjU
 H9jw==
X-Gm-Message-State: AOAM533ofzvCy3pLz0a8FbeAdriWq9hNEkEilsLPyaWaEKRJTh2wITr6
 F7cZDCmecxh9UNHarlHgcj4=
X-Google-Smtp-Source: ABdhPJzS+uPpTiLsWNHg6xiOAW9CUTiS8ft4sXtfvWRv8joGH8d+W+t6FJyQoDufDDsZv9lKN31XXA==
X-Received: by 2002:adf:ef4d:: with SMTP id c13mr67998573wrp.315.1594419608520; 
 Fri, 10 Jul 2020 15:20:08 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id l18sm12170281wrm.52.2020.07.10.15.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 15:20:07 -0700 (PDT)
From: Saheed Olayemi Bolarinwa <refactormyself@gmail.com>
To: helgaas@kernel.org
Subject: [PATCH 0/14 v3] PCI: Remove '*val = 0' from pcie_capability_read_*()
Date: Fri, 10 Jul 2020 23:20:12 +0200
Message-Id: <20200710212026.27136-1-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org, linux-pci@vger.kernel.org,
 QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, netdev@vger.kernel.org,
 Oliver O'Halloran <oohall@gmail.com>, Stanislaw Gruszka <stf_xl@wp.pl>,
 linux-acpi@vger.kernel.org, linux-rdma@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, Len Brown <lenb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, skhan@linuxfoundation.org, bjorn@helgaas.com,
 Kalle Valo <kvalo@codeaurora.org>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Sam Bobroff <sbobroff@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Lukas Wunner <lukas@wunner.de>,
 Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>

v3 CHANGES:
- Split previous PATCH 6/13 into two : PATCH 6/14 and PATCH 7/14
- Fix commit message of PATCH 5/14
- Update Patch numbering and Commit messages
- Add 'Acked by Greg KH' to PATCH 2/14
- Add PATCH version

v2 CHANGES:
- Fix missing comma, causing the email cc error
- Fix typos and numbering errors in commit messages
- Add commit message to 13/13
- Add two more patches: PATCH 3/13 and PATCH 4/13

MERGING:
Patch 7/14 depends on Patch 6/14. However Patch 6/14 has no dependency.
Please, merge PATCH 7/14 only after Patch 6/14.
Patch 14/14 depend on all preceeding patchs. Except for Patch 6/14 and
Patch 7/14, all other patches are independent of one another. Hence,
please merge Patch 14/14 only after other patches in this series have
been merged.


PATCH 6/14:
Make the function set status to "Power On" by default and only set to
Set "Power Off" only if pcie_capability_read_word() is successful and
(slot_ctrl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_OFF. 

PATCH 1/14 to 13/14:
Check the return value of pcie_capability_read_*() to ensure success or
confirm failure. While maintaining these functions, this ensures that the
changes in PATCH 14/14 does not introduce any bug. 

PATCH 14/14:
There are several reasons why a PCI capability read may fail whether the
device is present or not. If this happens, pcie_capability_read_*() will
return -EINVAL/PCIBIOS_BAD_REGISTER_NUMBER or PCIBIOS_DEVICE_NOT_FOUND
and *val is set to 0.

This behaviour if further ensured by this code inside
pcie_capability_read_*()

 ret = pci_read_config_dword(dev, pci_pcie_cap(dev) + pos, val);
 /*
  * Reset *val to 0 if pci_read_config_dword() fails, it may
  * have been written as 0xFFFFFFFF if hardware error happens
  * during pci_read_config_dword().
  */
 if (ret)
	 *val = 0;
 return ret;

a) Since all pci_generic_config_read() does is read a register value,
it may return success after reading a ~0 which *may* have been fabricated
by the PCI host bridge due to a read timeout. Hence pci_read_config_*() 
will return success with a fabricated ~0 in *val, indicating a problem.
In this case, the assumed behaviour of  pcie_capability_read_*() will be
wrong. To avoid error slipping through, more checks are necessary.

b) pci_read_config_*() will return PCIBIOS_DEVICE_NOT_FOUND only if 
dev->error_state = pci_channel_io_perm_failure (i.e. 
pci_dev_is_disconnected()) or if pci_generic_config_read() can't find the
device. In both cases *val is initially set to ~0 but as shown in the code
above pcie_capability_read_*() resets it back to 0. Even with this effort,
drivers still have to perform validation checks more so if 0 is a valid
value.

Most drivers only consider the case (b) and in some cases, there is the 
expectation that on timeout *val has a fabricated value of ~0, which *may*
not always be true as explained in (a).

In any case, checks need to be done to validate the value read and maybe
confirm which error has occurred. It is better left to the drivers to do.

Check the return value of pcie_capability_read_dword() to ensure success
and avoid bug as a result of Patch 14/14.
Remove the reset of *val to 0 when pci_read_config_*() fails.


Bolarinwa Olayemi Saheed (14):
  IB/hfi1: Check the return value of pcie_capability_read_*()
  misc: rtsx: Check the return value of pcie_capability_read_*()
  ath9k: Check the return value of pcie_capability_read_*()
  iwlegacy: Check the return value of pcie_capability_read_*()
  PCI: pciehp: Check the return value of pcie_capability_read_*()
  PCI: pciehp: Make "Power On" the default 
  PCI: pciehp: Check the return value of pcie_capability_read_*()
  PCI/ACPI: Check the return value of pcie_capability_read_*()
  PCI: pciehp: Check the return value of pcie_capability_read_*()
  PCI: Check the return value of pcie_capability_read_*()
  PCI/PM: Check return value of pcie_capability_read_*()
  PCI/AER: Check the return value of pcie_capability_read_*()
  PCI/ASPM: Check the return value of pcie_capability_read_*()
  PCI: Remove '*val = 0' from pcie_capability_read_*()

 drivers/net/wireless/ath/ath9k/pci.c         | 5 +++--
 drivers/net/wireless/intel/iwlegacy/common.c | 4 ++--
 drivers/infiniband/hw/hfi1/aspm.c | 7 ++++---
 drivers/misc/cardreader/rts5227.c | 5 +++--
 drivers/misc/cardreader/rts5249.c | 5 +++--
 drivers/misc/cardreader/rts5260.c | 5 +++--
 drivers/misc/cardreader/rts5261.c | 5 +++--
 drivers/pci/pcie/aer.c  |  5 +++--
 drivers/pci/pcie/aspm.c | 33 +++++++++++++++++----------------
 drivers/pci/hotplug/pciehp_hpc.c | 47 ++++++++++++++++----------------
 drivers/pci/pci-acpi.c           | 10 ++++---
 drivers/pci/probe.c              | 29 ++++++++++++--------
 drivers/pci/access.c | 14 --------------
 13 files changed, 87 insertions(+), 87 deletions(-)

-- 
2.18.2

