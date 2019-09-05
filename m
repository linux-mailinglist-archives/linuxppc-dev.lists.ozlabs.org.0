Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2AAAABD1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 21:16:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PVlr1Jh0zDqDV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 05:16:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="hzr4Wy1f"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PVjL3XQBzDqs1
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2019 05:13:58 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 4C99D7F933;
 Thu,  5 Sep 2019 14:13:55 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1567710836; bh=pStf8QitHKtVk+JbUuAJMaaI3Anph/8j3/5AIldlk/4=;
 h=From:To:Cc:Subject:Date:From;
 b=hzr4Wy1fotVM803whVZsLqBQAQcXKXnEMQMdCWaFK4BTPDZ5yFAALkqd5Dr0YXXAi
 t8JNJIwFOl3dpR2+jwBVSydz+qa0tNj/WZdVb/4UfCZBg9V0XgwMxB82bm/ixlN6GN
 T53TCrRJVDLz5S50SGT20MQCTxrnhDro7I/vvtbVf6J6B0EGYVBPo5mqQUToasnSKF
 E/NZ9ikPeTl6GNbunAVH9nTGiz4aeA5SmCM02Vb0ezuINo6eijMVaiFmXXpl3KA43m
 oGnBN6U16BlXJI/IvtEz9lVZ63PfCRhtuws2XiOz5YLTUsBPw9clECuc4KVLJnfat2
 qYxFyrotT4czg==
From: Shawn Anastasio <shawn@anastas.io>
To: linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/1] Fix IOMMU setup for hotplugged devices on pseries
Date: Thu,  5 Sep 2019 14:13:42 -0500
Message-Id: <20190905191343.2919-1-shawn@anastas.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: sbobroff@linux.ibm.com, aik@ozlabs.ru, lukas@wunner.de, oohall@gmail.com,
 bhelgaas@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Changes from v2:
  - Remove pcibios_fixup_dev()
  - Remove pcibios_setup_bus_device() call in pcibios_fixup_bus() since
all device setup will now be handled in pcibios_bus_add_device()

On pseries QEMU guests, IOMMU setup for hotplugged PCI devices is currently
broken for all but the first device on a given bus. The culprit is an ordering
issue in the pseries hotplug path (via pci_rescan_bus()) which results in IOMMU
group assigment occuring before device registration in sysfs. This triggers
the following check in arch/powerpc/kernel/iommu.c:

/*
 * The sysfs entries should be populated before
 * binding IOMMU group. If sysfs entries isn't
 * ready, we simply bail.
 */
if (!device_is_registered(dev))
	return -ENOENT;

This fails for hotplugged devices since the pcibios_add_device() call in the
pseries hotplug path (in pci_device_add()) occurs before device_add().
Since the IOMMU groups are set up in pcibios_add_device(), this means that a
sysfs entry will not yet be present and it will fail.

There is a special case that allows the first hotplugged device on a bus to
succeed, though. The powerpc pcibios_add_device() implementation will skip
initializing the device if bus setup is not yet complete.
Later, the pci core will call pcibios_fixup_bus() which will perform setup
for the first (and only) device on the bus and since it has already been
registered in sysfs, the IOMMU setup will succeed.

The current solution is to move all device setup to pcibios_bus_add_device()
which will occur after all devices have been registered.

Shawn Anastasio (1):
  powerpc/pci: Fix pcibios_setup_device() ordering

 arch/powerpc/kernel/pci-common.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

-- 
2.20.1

