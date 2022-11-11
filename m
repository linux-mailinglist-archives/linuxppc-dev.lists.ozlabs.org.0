Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E78625CA6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:11:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N80xJ0Jdyz3f58
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:11:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=DmQ9IkLm;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=1yDPujhb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=DmQ9IkLm;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=1yDPujhb;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80hQ6DJRz3dvc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:00:06 +1100 (AEDT)
Message-ID: <20221111120501.026511281@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=xhd7tt5iYhuOseDykf3XQcxTHhVcl7xTwFlqd8IrPto=;
	b=DmQ9IkLmiKdLbn4YWyKiu6yv5Mu+/J5pzCDxk4dUJL328B8EJXmr7XiCzfZ0cWgufJVs5V
	TsiEjifWga1s/oNXmXz43ItsGAuFM5/nD+cCElBqCht2QBntwnvAQPPYtdNEPA7EhlQZGB
	u+WlVuKGFNH2nQfb9Zg5E1QsGliZ8icKwECPobCWAi0ePwenyeFv7Whs5yBXRFmZ0FNz80
	+evuCOcPk/9uZzOHKqdS5hL2nhn41/8sJDSBmnH8OC/TZFdkYohndFGnzHXU2r4ZP2IOqR
	IrtUA24HuXX3qhEAu8v8nQ5FAgY7rFsc/vVck77BNtOlJ4CT6nuhgAy5M54mHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=xhd7tt5iYhuOseDykf3XQcxTHhVcl7xTwFlqd8IrPto=;
	b=1yDPujhbELGZVjXIkh+KOi77aJIIbepWxtaRFHvr3ChKKnJexoCyIC/rVlRX+4Bd+JwM9w
	FVbM33Uj6J+iPcBg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 00/39] genirq, PCI/MSI: Support for per device MSI and PCI/IMS
 - Part 1 cleanups
Date: Fri, 11 Nov 2022 14:54:13 +0100 (CET)
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
Cc: linux-pci@vger.kernel.org, Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Jason Gunthorpe <jgg@mellanox.com>, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, "Ahmed S. Darwish" <darwi@linutronix.de>, Jon Mason <jdmason@kudzu.us>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marc Zyngier <maz@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

This is a three part series which provides support for per device MSI
interrupt domains. This solves conceptual problems of the current PCI/MSI
design which are in the way of providing support for PCI/MSI[-X] and
the upcoming PCI/IMS mechanism on the same device.

IMS (Interrupt Message Store] is a new specification which allows device
manufactures to provide implementaton defined storage for MSI messages
contrary to the uniform and specification defined storage mechanisms for
PCI/MSI and PCI/MSI-X. IMS not only allows to overcome the size limitions
of the MSI-X table, but also gives the device manufacturer the freedom to
store the message in arbitrary places, even in host memory which is shared
with the device.

There have been several attempts to glue this into the current MSI code,
but after lengthy discussions in various threads:

  https://lore.kernel.org/all/20211126230957.239391799@linutronix.de
  https://lore.kernel.org/all/MWHPR11MB188603D0D809C1079F5817DC8C099@MWHPR11MB1886.namprd11.prod.outlook.com
  https://lore.kernel.org/all/160408357912.912050.17005584526266191420.stgit@djiang5-desk3.ch.intel.com

it turned out that there is a fundamental design problem in the current
PCI/MSI-X implementation. This needs some historical background.

When PCI/MSI[-X] support was added around 2003 interrupt management was
completely different from what we have today in the actively developed
architectures. Interrupt management was completely architecture specific
and while there were attempts to create common infrastructure the
commonalities were rudimental and just providing shared data structures and
interfaces so that drivers could be written in an architecture agnostic
way.

The initial PCI/MSI[-X] support obviously plugged into this model which
resulted in some basic shared infrastructure in the PCI core code for
setting up MSI descriptors, which are a pure software construct for holding
data relevant for a particular MSI interrupt, but the actual association to
Linux interrupts was completely architecture specific. This model is still
supported today to keep museum architectures and notorious stranglers
alive.

In 2013 Intel tried to add support for hotplugable IO/APICs to the kernel
which was creating yet another architecture specific mechanism and resulted
in an unholy mess on top of the existing horrors of x86 interrupt handling.
The x86 interrupt management code was already an uncomprehensible maze of
indirections between the CPU vector management, interrupt remapping and the
actual IO/APIC and PCI/MSI[-X] implementation.

At roughly the same time ARM struggled with the ever growing SoC specific
extensions which were glued on top of the architected GIC interrupt
controller.

This resulted in a fundamental redesign of interrupt management and
provided the today prevailing concept of hierarchical interrupt
domains. This allows to disentangle the interactions between x86 vector
domain and interrupt remapping and also allowed ARM to handle the zoo of
SoC specific interrupt components in a sane way.

The concept of hierarchical interrupt domains aims to encapsulate the
functionality of particual IP blocks which are involved in interrupt
delivery so that they become extensible and pluggable. The X86
encapsulation looks like this:

                                         |--- device 1
     [Vector]---[Remapping]---[PCI/MSI]--|...
                                         |--- device N

where the remapping domain is an optional component and in case that it is
not available the PCI/MSI[-X] domains have the vector domain as their
parent. This reduced the required interaction between the domains pretty
much to the initialization phase where it is obviously required to
establish the proper parent relation ship in the components of the
hierarchy.

While in most cases the model is strictly representing the chain of IP
blocks and abstracting them so they can be plugged together to form a
hierarchy, the design stopped short on PCI/MSI[-X]. Looking at the hardware
it's clear that the actual PCI/MSI[-X] interrupt controller is not a global
entity, but strict a per PCI device entity.

Here we took a short cut on the hierarchical model and went for the easy
solution of providing "global" PCI/MSI domains which was possible because
the PCI/MSI[-X] handling is uniform accross the devices. This also allowed
to keep the existing PCI/MSI[-X] infrastructure mostly unchanged which in
turn made it simple to keep the existing architecture specific management
alive.

A similar problem was created in the ARM world with support for IP block
specific message storage. Instead of going all the way to stack a IP block
specific domain on top of the generic MSI domain this ended in a construct
which provides a "global" platform MSI domain which allows overriding the
irq_write_msi_msg() callback per allocation.

In course of the lengthy discussions we identified other abuse of the MSI
infrastructure in wireless drivers, NTB etc. where support for
implementation specific message storage was just mindlessly glued into the
existing infrastructure. Some of this just works by chance on particular
platforms but will fail in hard to diagnose ways when the driver is used
on platforms where the underlying MSI interrupt management code does not
expect the creative abuse.

Another shortcoming of todays PCI/MSI-X support is the inability to
allocate or free individual vectors after the initial enablement of
MSI-X. This results in an works by chance implementation of VFIO (PCI
passthrough) where interrupts on the host side are not set up upfront to
avoid resource exhaustion. They are expanded at runtime when the guest
actually tries to use them. The way how this is implemented is that the
host disables MSI-X and the enables it with a larger number of vectors
again. That works by chance because most device drivers set up all
interrupts before the device actually will utilize them. But that's not
universally true because some drivers allocate a large enough number of
vectors but do not utilize them until it's actually required,
e.g. acceleration support. But at that point other interrupts of the device
might be in active use and the MSI-X disable/enable dance can just result
in losing interrupts and therefore hard to diagnose subtle problems.

Last but not least the "global" PCI/MSI-X domain approach prevents to
utilize PCI/MSI[-X] and PCI/IMS on the same device due to the fact that IMS
is not longer providing a uniform storage and configuration model.

The solution to this is to implement the missing step and switch from
global MSI domains to per device MSI domains. The resulting hierarchy then
looks like this:

                              |--- [PCI/MSI] device 1
     [Vector]---[Remapping]---|...
                              |--- [PCI/MSI] device N

which in turn allows provide support for multiple domains per device:

                              |--- [PCI/MSI] device 1
                              |--- [PCI/IMS] device 1
     [Vector]---[Remapping]---|...
                              |--- [PCI/MSI] device N
                              |--- [PCI/IMS] device N

To achieve this and to provide solutions for the other identified issues,
e.g. VFIO, this needs a major overhaul of the affected infrastructure.

The 90+ patches series is split into three parts for submission:

  1) General cleanups of the core infrastructure and the PCI/MSI code

  2) Preparatory changes for per device (multiple) MSI domain support
     including a complete replacement of the MSI core interfaces
     switching from a domain pointer based to a domain ID based model
     and providing support for proper range based allocation/free

  3) The actual implementation for per device domains, the conversion of
     the PCI/MSI-X infrastructure, dynamic allocation/free for MSI-X,
     initial support for PCI/IMS and enablement for X86. Plus a demo
     IMS driver for IDXD.

The three parts are available from git:

   git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git devmsi-v1-part1
   git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git devmsi-v1-part2
   git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git devmsi-v1-part3

To complete the picture we went all the way and converted ARM64 including
the platform-MSI horrors over to the new model. It's barely tested in a VM
(at least the PCI/MSI-X) part can be validated that way. For the rest this
just compiles and we can't do much more as we lack hardware. The reason why
this conversion was done is to ensure that the design, the underlying data
structures and the resulting interfaces are correct and can handle the
requirements of ARM64. The result looks pretty good and while the initial
support does not cover some of the oddball issues of the ARM64 zoo, it
turned out that the extra functionality required is just extending the
provided infrastructure but does not require any design changes. This is
also available from git for the adventurous, but be warned that it might
eat your harddisk, confuse your cat and make your kids miss the bus:

   git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git devmsi-v1-arm

This is not going to be posted as its work in progress. It's provided for
reference and for Marc to play with.

We did look into NTB and other places like VFIO, but did not come around to
actually convert them over partly because of lack of time, but also because
the code is simply incomprehensible.

We tested the creation of a secondary MSI domain with a mockup driver, but
again due to lack of hardware there is no way to validate any functionality.

The dynamic allocation/free of MSI-X interrupts post MSI-X enable was
tested by hacking up a device driver and allocating only one interrupt at
MSI-X enable time and then allocate the rest with the new interfaces. Also
the dynamic free was tested that way.

Note, that dynamic allocation of MSI-X interrupt requires opt-in of the
underlying MSI parent domain. It is neither supported on the legacy
architecture specific MSI mechanism, which is still in use on ia64, sparc,
PPC and a few subarchitectures of MIPS.

The reason why this cannot be supported unconditionally is that due to the
history of PCI/MSI support in the kernel there are many implementations
which expect that MSI[-X] enable is a one off operation which allocates and
associates all required interrupts right at that point. Even architectures
which utilize hierarchical irq domains have such assumptions which are in
some cases even enforced through the underlying hypervisor/firmware.

IMS is opt-in too and it requires that the architecture/platform has been
converted to the per device MSI model and the underlying interrupt domains
have the necessary support in place, which might never happen for ia64 and
some parts of MIPS, SPARC, PPC and S390.

That means driver writers have to be careful about the limitiations of
this. For dynamic MSI-X allocation/free there is a query interface. For IMS
domains that's momentarily just the domain creation failing with an error
code. If necessary for driver conveniance then implementing a query
interface is trivial enough.

Enough of history and theory. Here comes part 1:

This is just a cleanup and a reorganisation of the PCI/MSI code which
became quite an unreadable mess over time. There is no intentional
functional change in this series.

It's just a separate step to make the subsequent changes in the
infrastructure easier both to implement and to review.

Thanks,

	tglx
----
 Documentation/PCI/msi-howto.rst         |   10 
 arch/powerpc/platforms/pseries/msi.c    |    7 
 arch/um/drivers/Kconfig                 |    1 
 arch/um/include/asm/pci.h               |    2 
 arch/x86/Kconfig                        |    1 
 arch/x86/include/asm/irqdomain.h        |    4 
 arch/x86/include/asm/pci.h              |    4 
 arch/x86/kernel/apic/msi.c              |   11 
 arch/x86/kernel/apic/vector.c           |    4 
 drivers/base/Makefile                   |    2 
 drivers/base/platform-msi.c             |    2 
 drivers/bus/fsl-mc/Kconfig              |    2 
 drivers/dma/Kconfig                     |    2 
 drivers/dma/qcom/hidma.c                |    8 
 drivers/iommu/Kconfig                   |    2 
 drivers/iommu/amd/iommu.c               |   10 
 drivers/iommu/intel/irq_remapping.c     |   10 
 drivers/irqchip/Kconfig                 |    6 
 drivers/mailbox/Kconfig                 |    2 
 drivers/pci/Kconfig                     |    7 
 drivers/pci/controller/Kconfig          |   30 -
 drivers/pci/controller/dwc/Kconfig      |   48 -
 drivers/pci/controller/mobiveil/Kconfig |    6 
 drivers/pci/controller/pci-hyperv.c     |   15 
 drivers/pci/msi/Makefile                |    3 
 drivers/pci/msi/api.c                   |  336 +++++++++++
 drivers/pci/msi/irqdomain.c             |   91 +--
 drivers/pci/msi/msi.c                   |  949 +++++++++++---------------------
 drivers/pci/msi/msi.h                   |  110 +++
 drivers/pci/probe.c                     |    2 
 drivers/perf/Kconfig                    |    2 
 drivers/soc/ti/Kconfig                  |    2 
 include/asm-generic/msi.h               |    4 
 include/linux/device.h                  |    8 
 include/linux/gpio/driver.h             |    2 
 include/linux/irqdomain.h               |   31 -
 include/linux/irqdomain_defs.h          |   26 
 include/linux/msi.h                     |   85 +-
 include/linux/pci.h                     |   17 
 kernel/irq/Kconfig                      |    7 
 kernel/irq/msi.c                        |   60 --
 41 files changed, 992 insertions(+), 939 deletions(-)
