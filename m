Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FE05685F2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 12:43:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdGP35HZ1z3c5D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 20:43:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nh8cmyXU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nh8cmyXU;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdGNW3Vxqz3bjX
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 20:43:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0FB0761E4A;
	Wed,  6 Jul 2022 10:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 452CDC3411C;
	Wed,  6 Jul 2022 10:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657104200;
	bh=ZJU7+A8sh/C/YCWpWSHDj402O/F82gQIyYiqc8Vq+qE=;
	h=From:To:Cc:Subject:Date:From;
	b=nh8cmyXUfOvYI6WT/AqaEO7/btmBNWEvYeHfvCxNxPIErrpWyhHpKR+fhDtiBlvfa
	 kT8ArZVV+1VD/6vlI01haiBNIlM+IlQtrAb/N+NaUp7z93wJLoENFaSD3my3yn0tS4
	 wMDuaZjjAlgQ5ROrTtALTzAF0Up4SJbomsO3rV4MVqdNQyCAOWd1wD1FYRlvNbTvUw
	 ydBkCWCUX67FXFmcmfwJ/lcrXbeEDhV9s7IxPHyhwMhgdb0IGACmK27xw9oNsNdbMV
	 If7giLMUEZpHlF1AReLsG27w2cYIcAr+1bDlGCJD8k46sn0/tXu5mq3V0+KBw4JBbJ
	 KJyiIeWlt7FYQ==
Received: by pali.im (Postfix)
	id 41DC57BA; Wed,  6 Jul 2022 12:43:17 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Nick Child <nick.child@ibm.com>,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH 0/5] powerpc/pci: Cleanup unused code and enable 256 PCI buses
Date: Wed,  6 Jul 2022 12:43:03 +0200
Message-Id: <20220706104308.5390-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series cleanup unused code by eliminating it at compile time
and then enable usage of all 256 PCI buses per every PCI domain as
currently PCI bus numbers have to be unique across all PCI domains.
So first bus number of each PCI domain would be zero and not the bus
number of the previous domain plus one. As such bus assignment changes
BDF address of every PCI device on multi-domain system, this new
"feature" is configurable by config option to prevent regressions.

Tested on Freescale P2020 board. Before this patch lspci reports:

8000:00:00.0 PCI bridge: Freescale Semiconductor Inc P2020E (rev 21)
8000:01:00.0 USB controller: Texas Instruments TUSB73x0 SuperSpeed USB 3.0 xHCI Host Controller (rev 02)
9000:02:00.0 PCI bridge: Freescale Semiconductor Inc P2020E (rev 21)
9000:03:00.0 Network controller: Qualcomm Atheros AR93xx Wireless Network Adapter (rev 01)
a000:04:00.0 PCI bridge: Freescale Semiconductor Inc P2020E (rev 21)
a000:05:00.0 Network controller: Qualcomm Atheros QCA986x/988x 802.11ac Wireless Network Adapter

With these patches and enabled config option it reports:

8000:00:00.0 PCI bridge: Freescale Semiconductor Inc P2020E (rev 21)
8000:01:00.0 USB controller: Texas Instruments TUSB73x0 SuperSpeed USB 3.0 xHCI Host Controller (rev 02)
9000:00:00.0 PCI bridge: Freescale Semiconductor Inc P2020E (rev 21)
9000:01:00.0 Network controller: Qualcomm Atheros AR93xx Wireless Network Adapter (rev 01)
a000:00:00.0 PCI bridge: Freescale Semiconductor Inc P2020E (rev 21)
a000:01:00.0 Network controller: Qualcomm Atheros QCA986x/988x 802.11ac Wireless Network Adapter

Now every PCIe Root Port is on bus zero and theoretically with enough
multiport PCIe switches connected to every PCIe Root Port, it should be
possible to have 256 PCI buses on every PCIe controller (as each is in
own PCI domain) and therefore connect more PCIe cards as without these
patches.

Pali Rohár (5):
  powerpc/pci: Hide pci_device_from_OF_node() for non-powermac code
  powerpc/pci: Make pcibios_make_OF_bus_map() static
  powerpc/pci: Hide pci_create_OF_bus_map() for non-chrp code
  powerpc/pci: Disable filling pci-OF-bus-map for non-chrp/powermac
  powerpc/pci: Add config option for using all 256 PCI buses

 arch/powerpc/Kconfig                  | 11 +++++++++++
 arch/powerpc/include/asm/pci-bridge.h |  4 ++++
 arch/powerpc/kernel/pci_32.c          | 27 +++++++++++++++++++++------
 arch/powerpc/kernel/pci_64.c          |  2 ++
 4 files changed, 38 insertions(+), 6 deletions(-)

-- 
2.20.1

