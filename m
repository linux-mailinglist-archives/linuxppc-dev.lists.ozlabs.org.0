Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D192F2BD11
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 03:57:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45CcRv32RwzDq72
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 11:57:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="fq9dYa7k"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45CcNT0fyhzDqLC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 11:54:49 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 3463D7F8BF;
 Mon, 27 May 2019 20:54:16 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1559008457; bh=tpEsBHAskNTnW0j20OuJzsmsrKEuGoeRDaQ9ZdKXp/w=;
 h=From:To:Cc:Subject:Date:From;
 b=fq9dYa7k3w1qHhjjNrXEPO8ZdlXOywirbS07vJHK1h62LmGCzS6ixZdpGfH3eNp1E
 ggYjWoJKhajFsLBGLNc35lFBGVyulfwQEXNmNddElEY+ZBzae+eAlJZ4atku5H2smB
 QvhZ5EGwQ21IyGssQGMcviHcJ/SGc0vl4Z7ynhEhAhB1pyH0vSC9+UoJF3Z4X/kwOu
 hIjKwZFDPUj++VAgfpjhXvRqknfAfuefv5eV1bD74WaeqGRgikxvyWkR+nMCRJeY6c
 jMP8KSFpYNUVcTvG66I4xPgRQOuQ1sXeYjgwbt8eKBM6PAOF6ZP5P9bxHn8xsEUmMd
 imioSVa6mUW9g==
From: Shawn Anastasio <shawn@anastas.io>
To: linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/3] Allow custom PCI resource alignment on pseries
Date: Mon, 27 May 2019 20:54:09 -0500
Message-Id: <20190528015412.30521-1-shawn@anastas.io>
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
Cc: sbobroff@linux.ibm.com, linux-kernel@vger.kernel.org, rppt@linux.ibm.com,
 xyjxie@linux.vnet.ibm.com, bhelgaas@google.com, paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Changes from v1 to v2:
  - Fix function declaration warnings caught by sparse

Hello all,

This patch set implements support for user-specified PCI resource
alignment on the pseries platform for hotplugged PCI devices.
Currently on pseries, PCI resource alignments specified with the
pci=resource_alignment commandline argument are ignored, since
the firmware is in charge of managing the PCI resources. In the
case of hotplugged devices, though, the kernel is in charge of 
configuring the resources and should obey alignment requirements.

The current behavior of ignoring the alignment for hotplugged devices
results in sub-page BARs landing between page boundaries and
becoming un-mappable from userspace via the VFIO framework.
This issue was observed on a pseries KVM guest with hotplugged
ivshmem devices.
 
With these changes, users can specify an appropriate
pci=resource_alignment argument on boot for devices they wish to use 
with VFIO.

In the future, this could be extended to provide page-aligned
resources by default for hotplugged devices, similar to what is done
on powernv by commit 382746376993 ("powerpc/powernv: Override
pcibios_default_alignment() to force PCI devices to be page aligned").

Feedback is appreciated.

Thanks,
Shawn

Shawn Anastasio (3):
  PCI: Introduce pcibios_ignore_alignment_request
  powerpc/64: Enable pcibios_after_init hook on ppc64
  powerpc/pseries: Allow user-specified PCI resource alignment after
    init

 arch/powerpc/include/asm/machdep.h     |  6 ++++--
 arch/powerpc/kernel/pci-common.c       |  9 +++++++++
 arch/powerpc/kernel/pci_64.c           |  4 ++++
 arch/powerpc/platforms/pseries/setup.c | 22 ++++++++++++++++++++++
 drivers/pci/pci.c                      |  9 +++++++--
 include/linux/pci.h                    |  1 +
 6 files changed, 47 insertions(+), 4 deletions(-)

-- 
2.20.1

