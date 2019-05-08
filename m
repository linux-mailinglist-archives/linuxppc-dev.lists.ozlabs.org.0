Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C78171F7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 08:58:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zS4N68BDzDqGb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 16:58:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="R/A4leu+"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zS1s4xnfzDqJN
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 16:56:33 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id B61BD7F8E3;
 Tue,  7 May 2019 21:41:54 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1557283315; bh=8orPcionj8a/WeLlzN3wptup1VKMYBcY/b1HFvVLX70=;
 h=From:To:Cc:Subject:Date:From;
 b=R/A4leu+vRiMikAXWpu2C3HR+BO71GEB3XYAfcpJL13bKaCUPPVme7jVnJ+oIvzNT
 +vZubFMxFfG8NQUPtxCfQ0Z69O4GZF1hRrRYt/eChu+6j2eLd8WW/LuSth5tH21G9K
 MZn4JO0HY4D8hwbzd5VilOqD4PlH/dhxBGy80Ou9PnBXBwuinfhLnwjn0/fjOy9Z/K
 3wwDFvU8SLN6hY+o4raWQ2UD4ckCulln+4Km+9JP6KWpH7kXOE7yRD4y14NprSeBcl
 5HTWijc6K2lJXBz6/oEKMAC6faLONzxwrad1cf+TrqqaBL7uTt64xYyO493Jcse7eR
 vJyEO14DZsbIg==
From: Shawn Anastasio <shawn@anastas.io>
To: bhelgaas@google.com
Subject: [PATCH 0/3] Allow custom PCI resource alignment on pseries
Date: Tue,  7 May 2019 21:41:48 -0500
Message-Id: <20190508024151.5690-1-shawn@anastas.io>
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
Cc: sbobroff@linux.ibm.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, rppt@linux.ibm.com, xyjxie@linux.vnet.ibm.com,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

(Resent to include relevant mailing lists - sorry about that!)

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
 5 files changed, 46 insertions(+), 4 deletions(-)

-- 
2.20.1

