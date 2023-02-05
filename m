Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA5468B0D4
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 17:01:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8vJJ1ZZtz3fQn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 03:01:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=2001:4190:8020::34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=<UNKNOWN>)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8vDw56Plz3c9C
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Feb 2023 02:58:08 +1100 (AEDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 106B792009C; Sun,  5 Feb 2023 16:48:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 0478292009B;
	Sun,  5 Feb 2023 15:48:54 +0000 (GMT)
Date: Sun, 5 Feb 2023 15:48:54 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Bjorn Helgaas <bhelgaas@google.com>, 
    Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
    Christophe Leroy <christophe.leroy@csgroup.eu>, 
    Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
    "David S. Miller" <davem@davemloft.net>, 
    Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
    Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v6 0/7] pci: Work around ASMedia ASM2824 PCIe link training
 failures
Message-ID: <alpine.DEB.2.21.2302022022230.45310@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, David Abdurachmanov <david.abdurachmanov@gmail.com>, linux-rdma@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Lukas Wunner <lukas@wunner.de>, linux-pci@vger.kernel.org, Stefan Roese <sr@denx.de>, Jim Wilson <wilson@tuliptree.org>, netdev@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

 This is v6 of the change to work around a PCIe link training phenomenon 
where a pair of devices both capable of operating at a link speed above 
2.5GT/s seems unable to negotiate the link speed and continues training 
indefinitely with the Link Training bit switching on and off repeatedly 
and the data link layer never reaching the active state.

 Following Bjorn's suggestion from the previous iteration:
<https://lore.kernel.org/lkml/20221109050418.GA529724@bhelgaas/> I have 
moved the workaround into the PCI core.  I have kept the part specific to 
ASMedia (to lift the speed restriction after a successful retrain) within, 
although I find it a good candidate for a standalone quirk.  It seems to 
me we'd have to add additional classes of fixups however to move this part 
to drivers/pci/quirks.c, which I think would be an overkill.  So I've only 
made it explicitly guarded by CONFIG_PCI_QUIRKS; I can see there's prior 
art with this approach.

 In the course of the update I have realised that commit 6b2f1351af56 
("PCI: Wait for device to become ready after secondary bus reset") makes 
no sense and was about to figure out what to do here about it, but then 
found Lukas's recent patch series addressing this issue (thanks, Lukas, 
you made my life easier!), so I have rebased my patch set on top of 
Lukas's:
<https://lore.kernel.org/all/da77c92796b99ec568bd070cbe4725074a117038.1673769517.git.lukas@wunner.de/>.

 This has resulted in mild ugliness in that `pcie_downstream_link_retrain' 
may be called from `pci_bridge_wait_for_secondary_bus' twice, first time 
via `pcie_wait_for_link_delay' and second time via `pci_dev_wait'.  This 
second call to `pcie_downstream_link_retrain' will do nothing, because for 
`link_active_reporting' devices `pcie_wait_for_link_delay' will have 
ensured the link has gone up or the second call won't have been reached.

 I have also decided to move the initialisation of `link_active_reporting' 
earlier on, so as to have a single way to check for the feature.  This has 
brought an extra patch and its 3 clean-up dependencies into the series.

 This was originally observed in a configuration featuring a downstream 
port of the ASMedia ASM2824 Gen 3 switch wired to the upstream port of the 
Pericom PI7C9X2G304 Gen 2 switch.  However in the course of review I have 
come to the conclusion that similarly to the earlier similar change to 
U-Boot it is indeed expected to be safe to apply this workaround to any 
downstream port that has failed link negotiation provided that:

1. the port is capable of reporting the data link layer link active 
   status (because unlike U-Boot we cannot busy-loop continuously polling 
   the link training bit),

and:

2. we don't attempt to lift the 2.5GT/s speed restriction, imposed as the
   basis of the workaround, for devices not explicitly known to continue 
   working in that case.

It is expected to be safe because the workaround is applied to a failed 
link, that is one that does not (at the time this code is executed) work 
anyway, so trying to bring it up cannot make the situation worse.

 This has been verified with a SiFive HiFive unmatched board, with and 
without CONFIG_PCI_QUIRKS enabled, booting with or without the workaround 
activated in U-Boot, which covered both the link retraining part of the 
quirk and the lifting of speed restriction already imposed by U-Boot.

 I have also issued resets via sysfs to see how this change behaves.  For 
the problematic link this required a hack to remove a `dev->subordinate' 
check from `pci_parent_bus_reset', which in turn triggered the workaround 
as expected and brought the link up (but otherwise clobbered downstream 
devices as one would inevitably expect).

 I have no way to verify these patches with power management or hot-plug 
events, but owing to Lukas's effort they get into the same infrastructure, 
so I expect the workaround to do its job as expected.  I note that there 
is an extra call to `pcie_wait_for_link' from `pciehp_check_link_status', 
but I expect it to work too.  For `link_active_reporting' devices it will 
call `pcie_downstream_link_retrain' and for`!link_active_reporting' ones 
we have no means to do anything anyway.

 The 3 extra clean-ups were only compile-tested (with PowerPC and x86-64 
configurations, as appropriate), because I have no suitable hardware 
available.

 Please see individual change descriptions for further details.

 Let me know if this is going in the right direction.

  Maciej
