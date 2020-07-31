Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5A023453A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 14:05:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJ5ZP0dnpzDqMG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 22:05:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=refactormyself@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IV77SFHd; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJ5W421DdzDqdq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 22:02:22 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id kq25so18214861ejb.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 05:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ZPoeO3tTC7ewTWnbFijLfWrL4pIpzl5ZB76dv/p6S+8=;
 b=IV77SFHdlJClAFDI4KSZtVJdC2DAtGrxQmIzbw7GOFGworBySBIYMfm9Yv26Y/SKyP
 rJ/5xlxCVrVFPq8kGTy8sYSnl8lJJRNSCrGsHmSuT/Q/6f6ZNhMo+IUMump4oyHXnbT4
 zdg6GnXC6I2EnnmIO+QWUt/QBdgUQDiMTBzZ1MF6LcHzPH6p6WiuMJRqgKLwdVXr0w6T
 A41vxNL3Pbxy7zwarGyvn0JkT7Sx1d9otfI42XD75uRhNvxzHSotK52Z7UcRx/7L0KoB
 ev5oiKfqKrPihVeHMlZvAQD8DrotfvZAdy9sCn3f87cYflYMriFMzeKWHMdJMTvHmefD
 7wSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZPoeO3tTC7ewTWnbFijLfWrL4pIpzl5ZB76dv/p6S+8=;
 b=aXXQJeoFZ8NxDpcGBZ3V9GtL9nqKbY0QrIKjX4+J4r60mUrcKNnlPeeORbztJ0WJGp
 pesDJU9febn9BMC5U7cTKmoJBAl+reFLnENmL9QqACjclOIK7kfeXcXmAo+82Cud3ohm
 uN6qjsFUdrW8gLIVoA1p9Eg7BOyib9V1hGPD2G0mDfCWy4vkIwVIHCSKck4ouZLtXuxX
 zSWQlXmJmCctEDBCzGiCr5j75w+p1QuaQwE1rlhIo8eoBi7MXZH+/UqoUpWXZNI0xrN7
 esZHvJJfpnpbBM0D//ebslcpSsyE7kIMrbD9BHXpWFrokI4I0HVqt0Sxuhubp9LznRBj
 a3eQ==
X-Gm-Message-State: AOAM530Ehwkhdh7qwUIiWE8TDF8SJiTLOsu+YLEJRgIFPtcQObcbOTPz
 XSA+wR6vFCX3qTqZv72ZtNE=
X-Google-Smtp-Source: ABdhPJzjoTcnAvyDzlAqwJiXlviIPrdknthesuHRXw6Drk1Mxsa9h9E21KaWBpHYtCNmp+wuQyAJqg==
X-Received: by 2002:a17:906:d7b1:: with SMTP id
 pk17mr3684852ejb.554.1596196936900; 
 Fri, 31 Jul 2020 05:02:16 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id j5sm9091734ejk.87.2020.07.31.05.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 05:02:16 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>,
 Jakub Kicinski <kuba@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Len Brown <lenb@kernel.org>, Russell Currey <ruscur@russell.cc>,
 Sam Bobroff <sbobroff@linux.ibm.com>,
 "Oliver O'Halloran" <oohall@gmail.com>
Subject: [PATCH v4 00/12] PCI: Remove '*val = 0' from pcie_capability_read_*()
Date: Fri, 31 Jul 2020 13:02:28 +0200
Message-Id: <20200731110240.98326-1-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-rdma@vger.kernel.org,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>, skhan@linuxfoundation.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 QCA ath9k Development <ath9k-devel@qca.qualcomm.com>,
 linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 bjorn@helgaas.com, linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

v4 CHANGES:
- Drop uses of pcie_capability_read_*() return value. This related to
  [1] which is pointing towards making the accessors return void.
- Remove patches found to be unnecessary
- Reword some commit messages

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
- Patch 6/12 depends on Patch 5/12. However Patch 5/12 has no dependency.
  Please, merge PATCH 6/12 only after Patch 5/12.
- Patch 12/12 depends on all preceding patches. Please merge Patch 12/12
  only after other patches in this series have been merged.
- All other patches have no dependencies besides those mentioned above and
  can be merge individually.

PATCH 5/12:
Set the default case in the switch-statement to set status
to "Power On".

PATCH 1/12 to 11/12:
Use the value read by pcie_capability_read_*() to determine success or
failure. This is done by checking if it is ~0, while maintaining the
functions' behaviour. This ensures that the changes in PATCH 12/12 does
not introduce any bug.

PATCH 12/12:
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

[1] https://lore.kernel.org/linux-pci/20200714234625.GA428442@bjorn-Precision-5520/


Saheed O. Bolarinwa (12):
  IB/hfi1: Check if pcie_capability_read_*() reads ~0
  misc: rtsx: Check if pcie_capability_read_*() reads ~0
  ath9k: Check if pcie_capability_read_*() reads ~0
  iwlegacy: Check if pcie_capability_read_*() reads ~0
  PCI: pciehp: Set "Power On" as the default get_power_status
  PCI: pciehp: Check if pcie_capability_read_*() reads ~0
  PCI/ACPI: Check if pcie_capability_read_*() reads ~0
  PCI: Check if pcie_capability_read_*() reads ~0
  PCI/PM: Check if pcie_capability_read_*() reads ~0
  PCI/AER: Check if pcie_capability_read_*() reads ~0
  PCI/ASPM: Check if pcie_capability_read_*() reads ~0
  PCI: Remove '*val = 0' from pcie_capability_read_*()

 drivers/infiniband/hw/hfi1/aspm.c            |  6 ++--
 drivers/misc/cardreader/rts5227.c            |  2 +-
 drivers/misc/cardreader/rts5249.c            |  2 +-
 drivers/misc/cardreader/rts5260.c            |  2 +-
 drivers/misc/cardreader/rts5261.c            |  2 +-
 drivers/net/wireless/ath/ath9k/pci.c         |  3 +-
 drivers/net/wireless/intel/iwlegacy/common.c |  2 +-
 drivers/pci/access.c                         | 14 --------
 drivers/pci/hotplug/pciehp_hpc.c             | 13 +++++---
 drivers/pci/pci-acpi.c                       |  4 +--
 drivers/pci/pci.c                            | 34 ++++++++++++++------
 drivers/pci/pcie/aer.c                       |  2 +-
 drivers/pci/pcie/aspm.c                      | 10 +++---
 drivers/pci/probe.c                          | 12 +++----
 14 files changed, 56 insertions(+), 52 deletions(-)

-- 
2.18.4

