Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2BBE35FB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 16:52:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zVb21PFPzDqV7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 01:52:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.56.76; helo=6.mo179.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1032 seconds by postgrey-1.36 at bilbo;
 Fri, 25 Oct 2019 01:50:13 AEDT
Received: from 6.mo179.mail-out.ovh.net (6.mo179.mail-out.ovh.net
 [46.105.56.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zVXP6lbRzDqDW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 01:50:09 +1100 (AEDT)
Received: from player789.ha.ovh.net (unknown [10.109.159.90])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 4E2C5146667
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 16:32:53 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player789.ha.ovh.net (Postfix) with ESMTPSA id EF842B51F268;
 Thu, 24 Oct 2019 14:32:45 +0000 (UTC)
Date: Thu, 24 Oct 2019 16:32:44 +0200
From: Greg Kurz <groug@kaod.org>
To: christophe lombard <clombard@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] vfio pci: Add support for OpenCAPI devices
Message-ID: <20191024163244.2e1b3e30@bahia.lan>
In-Reply-To: <20191024132805.30701-1-clombard@linux.vnet.ibm.com>
References: <20191024132805.30701-1-clombard@linux.vnet.ibm.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 13120393092609513778
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrledugdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org, ajd@linux.ibm.com,
 fbarrat@linux.vnet.ibm.com, clg@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

Sorry, I didn't have time to look at your other series yet and
likely the same for this one with the upcoming KVM Forum... :-\
Anyway, for any VFIO related patch, don't forget to Cc the
maintainer, Alex Williamson <alex.williamson@redhat.com> .

Cheers,

--
Greg

On Thu, 24 Oct 2019 15:28:03 +0200
christophe lombard <clombard@linux.vnet.ibm.com> wrote:

> This series adds support for the OpenCAPI devices for vfio pci.
> 
> It builds on top of the existing ocxl driver +
> http://patchwork.ozlabs.org/patch/1177999/
> 
> VFIO is a Linux kernel driver framework used by QEMU to make devices
> directly assignable to virtual machines.
> 
> All OpenCAPI devices on the same PCI slot will all be grouped and
> assigned to the same guest.
> 
> - Assume these are the devices you want to assign
>  0007:00:00.0 Processing accelerators: IBM Device 062b
>  0007:00:00.1 Processing accelerators: IBM Device 062b
> 
> - Two Devices in the group
> $ ls /sys/bus/pci/devices/0007\:00\:00.0/iommu_group/devices/
>  0007:00:00.0  0007:00:00.1
> 
> - Find vendor & device ID
> $ lspci -n -s 0007:00:00
>  0007:00:00.0 1200: 1014:062b
>  0007:00:00.1 1200: 1014:062b
> 
> - Unbind from the current ocxl device driver if already loaded
> $ rmmod ocxl
> 
> - Load vfio-pci if it's not already done.
> $ modprobe vfio-pci
> 
> - Bind to vfio-pci
> $ echo 1014 062b > /sys/bus/pci/drivers/vfio-pci/new_id
> 
>   This will result in a new device node "/dev/vfio/7", which will be
>   use by QEMU to setup the devices for passthrough.
> 
> - Pass to qemu using -device vfio-pci
>   -device vfio-pci,multifunction=on,host=0007:00:00.0,addr=2.0 -device
>   vfio-pci,multifunction=on,host=0007:00:00.1,addr=2.1
> 
> It has been tested in a bare-metal and QEMU environment using the memcpy
> and the AFP AFUs.
> 
> christophe lombard (2):
>   powerpc/powernv: Register IOMMU group for OpenCAPI devices
>   vfio/pci: Introduce OpenCAPI devices support.
> 
>  arch/powerpc/platforms/powernv/ocxl.c     | 164 ++++++++++---
>  arch/powerpc/platforms/powernv/pci-ioda.c |  19 +-
>  arch/powerpc/platforms/powernv/pci.h      |  13 +
>  drivers/vfio/pci/Kconfig                  |   7 +
>  drivers/vfio/pci/Makefile                 |   1 +
>  drivers/vfio/pci/vfio_pci.c               |  19 ++
>  drivers/vfio/pci/vfio_pci_ocxl.c          | 287 ++++++++++++++++++++++
>  drivers/vfio/vfio.c                       |  25 ++
>  include/linux/vfio.h                      |  13 +
>  include/uapi/linux/vfio.h                 |  22 ++
>  10 files changed, 530 insertions(+), 40 deletions(-)
>  create mode 100644 drivers/vfio/pci/vfio_pci_ocxl.c
> 

