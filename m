Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA421F5D4D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 22:41:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hzS0024mzDqkp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 06:41:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.96.102; helo=10.mo1.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 7801 seconds by postgrey-1.36 at bilbo;
 Thu, 11 Jun 2020 06:39:43 AEST
Received: from 10.mo1.mail-out.ovh.net (10.mo1.mail-out.ovh.net
 [178.32.96.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hzPW4CjnzDqXW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 06:39:40 +1000 (AEST)
Received: from player770.ha.ovh.net (unknown [10.110.171.238])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 6F7561C9B4A
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 20:10:47 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id A84EF1354809F;
 Wed, 10 Jun 2020 18:10:43 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0021237021f-a9c9-4fe4-9f61-9e47efb287b5,91A17D08FEC2D827093C484F3AC0D39512A9663F)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH 2/3] powerpc/pci: unmap legacy INTx interrupts of
 passthrough IO adapters
To: Oliver O'Halloran <oohall@gmail.com>
References: <20200429075122.1216388-1-clg@kaod.org>
 <20200429075122.1216388-3-clg@kaod.org>
 <CAOSf1CHZ4+vEHotKzPDu2czVDBBM_oerxcCRS5QOFxsMbSknKQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f5060dbc-e110-29cb-28b6-d1345b02fd67@kaod.org>
Date: Wed, 10 Jun 2020 20:10:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAOSf1CHZ4+vEHotKzPDu2czVDBBM_oerxcCRS5QOFxsMbSknKQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 2460654249076296637
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudehiedguddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeffvddtudegieefudeugffhjefgieegieegleettdehgfeiieevueeihfegfefgnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejtddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/27/20 2:57 AM, Oliver O'Halloran wrote:
> On Wed, Apr 29, 2020 at 5:51 PM Cédric Le Goater <clg@kaod.org> wrote:
>>
>> When a passthrough IO adapter is removed from a pseries machine using
>> hash MMU and the XIVE interrupt mode, the POWER hypervisor, pHyp,
>> expects the guest OS to have cleared all page table entries related to
>> the adapter. If some are still present, the RTAS call which isolates
>> the PCI slot returns error 9001 "valid outstanding translations" and
>> the removal of the IO adapter fails.
>>
>> INTx interrupt numbers need special care because Linux maps the
>> interrupts automatically in the Linux interrupt number space if they
>> are presented in the device tree node describing the IO adapter. These
>> interrupts are not un-mapped automatically and in case of an hot-plug
>> adapter, the PCI hot-plug layer needs to handle the cleanup to make
>> sure that all the page table entries of the XIVE ESB pages are
>> cleared.
>>
>> Cc: "Oliver O'Halloran" <oohall@gmail.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  arch/powerpc/kernel/pci-hotplug.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/powerpc/kernel/pci-hotplug.c b/arch/powerpc/kernel/pci-hotplug.c
>> index bf83f76563a3..9e9c6befd7ea 100644
>> --- a/arch/powerpc/kernel/pci-hotplug.c
>> +++ b/arch/powerpc/kernel/pci-hotplug.c
>> @@ -57,6 +57,8 @@ void pcibios_release_device(struct pci_dev *dev)
>>         struct pci_controller *phb = pci_bus_to_host(dev->bus);
>>         struct pci_dn *pdn = pci_get_pdn(dev);
>>
>> +       irq_dispose_mapping(dev->irq);
> 
> What does the original mapping? Powerpc arch code or the PCI core?
> Tearing down the mapping in pcibios_release_device() seems a bit fishy
> to me since the PCI core has already torn down the device state at
> that point. If the release is delayed it's possible that another
> pci_dev has mapped the IRQ before we get here, but maybe that's ok.

How's that below ? INTx mappings are cleared only when the PHB is removed.
It applies to all platforms but we could limit the removal to PHB hotplug
on pseries. 

C.


From 10794159567552355f87e86e24002641c54e7ab5 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Date: Wed, 10 Jun 2020 19:55:24 +0200
Subject: [PATCH] powerpc/pci: unmap legacy INTx interrupts of passthrough IO
 adapters
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When a passthrough IO adapter is removed from a pseries machine using
hash MMU and the XIVE interrupt mode, the POWER hypervisor, pHyp,
expects the guest OS to have cleared all page table entries related to
the adapter. If some are still present, the RTAS call which isolates
the PCI slot returns error 9001 "valid outstanding translations" and
the removal of the IO adapter fails.

INTx interrupt numbers need special care because Linux maps the
interrupts automatically in the Linux interrupt number space. These
interrupts are not un-mapped automatically and in case of an hot-plug
adapter, the PCI hot-plug layer needs to handle the cleanup to make
sure that all the page table entries of the ESB pages are cleared.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/pci-bridge.h |  4 +++
 arch/powerpc/kernel/pci-common.c      | 47 +++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
index b92e81b256e5..9960dd249079 100644
--- a/arch/powerpc/include/asm/pci-bridge.h
+++ b/arch/powerpc/include/asm/pci-bridge.h
@@ -48,6 +48,8 @@ struct pci_controller_ops {
 
 /*
  * Structure of a PCI controller (host bridge)
+ *
+ * @intx: legacy INTx mappings
  */
 struct pci_controller {
 	struct pci_bus *bus;
@@ -127,6 +129,8 @@ struct pci_controller {
 
 	void *private_data;
 	struct npu *npu;
+
+	unsigned int intx[PCI_NUM_INTX];
 };
 
 /* These are used for config access before all the PCI probing
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index be108616a721..795a9b49e0d6 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -353,6 +353,48 @@ struct pci_controller *pci_find_controller_for_domain(int domain_nr)
 	return NULL;
 }
 
+static void pci_intx_register(struct pci_dev *pdev, int virq)
+{
+	struct pci_controller *phb = pci_bus_to_host(pdev->bus);
+	int i;
+
+	for (i = 0; i < PCI_NUM_INTX; i++) {
+		/*
+		 * Look for an empty or an equivalent slot, IRQs can be
+		 * shared
+		 */
+		if (phb->intx[i] == virq || !phb->intx[i]) {
+			phb->intx[i] = virq;
+			break;
+		}
+	}
+
+	if (i == PCI_NUM_INTX)
+		pr_err("PCI:%s INTx all mapped\n", pci_name(pdev));
+}
+
+/*
+ * Clearing the mapped INTx interrupts will also clear the underlying
+ * mappings of the ESB pages of the interrupts when under XIVE. It is
+ * a requirement of PowerVM to clear all memory mappings before
+ * removing a PHB.
+ */
+static void pci_intx_dispose(struct pci_controller *phb)
+{
+	int i;
+
+	for (i = 0; i < PCI_NUM_INTX; i++)
+		irq_dispose_mapping(phb->intx[i]);
+}
+
+void pcibios_remove_bus(struct pci_bus *bus)
+{
+	pr_debug("PCI: Clearing PHB %04x:%02x...\n",
+		 pci_domain_nr(bus), bus->number);
+	pci_intx_dispose(pci_bus_to_host(bus));
+}
+EXPORT_SYMBOL_GPL(pcibios_remove_bus);
+
 /*
  * Reads the interrupt pin to determine if interrupt is use by card.
  * If the interrupt is used, then gets the interrupt line from the
@@ -401,6 +443,11 @@ static int pci_read_irq_line(struct pci_dev *pci_dev)
 
 	pci_dev->irq = virq;
 
+	/*
+	 * Record all INTx mappings to clear them if the PHB is
+	 * dynamically removed.
+	 */
+	pci_intx_register(pci_dev, virq);
 	return 0;
 }
 
-- 
2.25.4

