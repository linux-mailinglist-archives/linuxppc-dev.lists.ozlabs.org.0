Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC70146B3C9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 08:22:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7Wvh5HqFz3c6D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 18:22:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.45.231; helo=8.mo548.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 8.mo548.mail-out.ovh.net (8.mo548.mail-out.ovh.net
 [46.105.45.231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7WvF2KHmz2xB0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Dec 2021 18:21:44 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.240])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id C4A4B209B3;
 Tue,  7 Dec 2021 07:21:35 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 7 Dec
 2021 08:21:34 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004880801b5-1b74-45de-8484-6c3316d6c777,
 EDCC1E77E28A65BD51DFCD2B92BF934EEA10E5FB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8d1e9d2b-fbe9-2e15-6df6-03028902791a@kaod.org>
Date: Tue, 7 Dec 2021 08:21:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [patch V2 01/23] powerpc/4xx: Remove MSI support which never
 worked
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
References: <20211206210147.872865823@linutronix.de>
 <20211206210223.872249537@linutronix.de>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211206210223.872249537@linutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b516111a-777e-4242-b371-8efd2fe3d9aa
X-Ovh-Tracer-Id: 828380858499042085
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeeggddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohephhgtrgeslhhinhhugidrihgsmhdrtghomh
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
Cc: linux-hyperv@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Ashok Raj <ashok.raj@intel.com>, Marc Zygnier <maz@kernel.org>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
 Kevin Tian <kevin.tian@intel.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kalle Valo <kvalo@codeaurora.org>, Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Thomas,

On 12/6/21 23:27, Thomas Gleixner wrote:
> This code is broken since day one. ppc4xx_setup_msi_irqs() has the
> following gems:
> 
>   1) The handling of the result of msi_bitmap_alloc_hwirqs() is completely
>      broken:
>      
>      When the result is greater than or equal 0 (bitmap allocation
>      successful) then the loop terminates and the function returns 0
>      (success) despite not having installed an interrupt.
> 
>      When the result is less than 0 (bitmap allocation fails), it prints an
>      error message and continues to "work" with that error code which would
>      eventually end up in the MSI message data.
> 
>   2) On every invocation the file global pp4xx_msi::msi_virqs bitmap is
>      allocated thereby leaking the previous one.
> 
> IOW, this has never worked and for more than 10 years nobody cared. Remove
> the gunk.
> 
> Fixes: 3fb7933850fa ("powerpc/4xx: Adding PCIe MSI support")

Shouldn't we remove all of it ? including the updates in the device trees
and the Kconfig changes under :

arch/powerpc/platforms/44x/Kconfig:	select PPC4xx_MSI
arch/powerpc/platforms/44x/Kconfig:	select PPC4xx_MSI
arch/powerpc/platforms/44x/Kconfig:	select PPC4xx_MSI
arch/powerpc/platforms/44x/Kconfig:	select PPC4xx_MSI
arch/powerpc/platforms/40x/Kconfig:	select PPC4xx_MSI

Thanks,

C.



> Fixes: 247540b03bfc ("powerpc/44x: Fix PCI MSI support for Maui APM821xx SoC and Bluestone board")
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>   arch/powerpc/platforms/4xx/Makefile |    1
>   arch/powerpc/platforms/4xx/msi.c    |  281 ------------------------------------
>   arch/powerpc/sysdev/Kconfig         |    6
>   3 files changed, 288 deletions(-)
> 
> --- a/arch/powerpc/platforms/4xx/Makefile
> +++ b/arch/powerpc/platforms/4xx/Makefile
> @@ -3,6 +3,5 @@ obj-y				+= uic.o machine_check.o
>   obj-$(CONFIG_4xx_SOC)		+= soc.o
>   obj-$(CONFIG_PCI)		+= pci.o
>   obj-$(CONFIG_PPC4xx_HSTA_MSI)	+= hsta_msi.o
> -obj-$(CONFIG_PPC4xx_MSI)	+= msi.o
>   obj-$(CONFIG_PPC4xx_CPM)	+= cpm.o
>   obj-$(CONFIG_PPC4xx_GPIO)	+= gpio.o
> --- a/arch/powerpc/platforms/4xx/msi.c
> +++ /dev/null
> @@ -1,281 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - * Adding PCI-E MSI support for PPC4XX SoCs.
> - *
> - * Copyright (c) 2010, Applied Micro Circuits Corporation
> - * Authors:	Tirumala R Marri <tmarri@apm.com>
> - *		Feng Kan <fkan@apm.com>
> - */
> -
> -#include <linux/irq.h>
> -#include <linux/pci.h>
> -#include <linux/msi.h>
> -#include <linux/of_platform.h>
> -#include <linux/interrupt.h>
> -#include <linux/export.h>
> -#include <linux/kernel.h>
> -#include <asm/prom.h>
> -#include <asm/hw_irq.h>
> -#include <asm/ppc-pci.h>
> -#include <asm/dcr.h>
> -#include <asm/dcr-regs.h>
> -#include <asm/msi_bitmap.h>
> -
> -#define PEIH_TERMADH	0x00
> -#define PEIH_TERMADL	0x08
> -#define PEIH_MSIED	0x10
> -#define PEIH_MSIMK	0x18
> -#define PEIH_MSIASS	0x20
> -#define PEIH_FLUSH0	0x30
> -#define PEIH_FLUSH1	0x38
> -#define PEIH_CNTRST	0x48
> -
> -static int msi_irqs;
> -
> -struct ppc4xx_msi {
> -	u32 msi_addr_lo;
> -	u32 msi_addr_hi;
> -	void __iomem *msi_regs;
> -	int *msi_virqs;
> -	struct msi_bitmap bitmap;
> -	struct device_node *msi_dev;
> -};
> -
> -static struct ppc4xx_msi ppc4xx_msi;
> -
> -static int ppc4xx_msi_init_allocator(struct platform_device *dev,
> -		struct ppc4xx_msi *msi_data)
> -{
> -	int err;
> -
> -	err = msi_bitmap_alloc(&msi_data->bitmap, msi_irqs,
> -			      dev->dev.of_node);
> -	if (err)
> -		return err;
> -
> -	err = msi_bitmap_reserve_dt_hwirqs(&msi_data->bitmap);
> -	if (err < 0) {
> -		msi_bitmap_free(&msi_data->bitmap);
> -		return err;
> -	}
> -
> -	return 0;
> -}
> -
> -static int ppc4xx_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
> -{
> -	int int_no = -ENOMEM;
> -	unsigned int virq;
> -	struct msi_msg msg;
> -	struct msi_desc *entry;
> -	struct ppc4xx_msi *msi_data = &ppc4xx_msi;
> -
> -	dev_dbg(&dev->dev, "PCIE-MSI:%s called. vec %x type %d\n",
> -		__func__, nvec, type);
> -	if (type == PCI_CAP_ID_MSIX)
> -		pr_debug("ppc4xx msi: MSI-X untested, trying anyway.\n");
> -
> -	msi_data->msi_virqs = kmalloc_array(msi_irqs, sizeof(int), GFP_KERNEL);
> -	if (!msi_data->msi_virqs)
> -		return -ENOMEM;
> -
> -	for_each_pci_msi_entry(entry, dev) {
> -		int_no = msi_bitmap_alloc_hwirqs(&msi_data->bitmap, 1);
> -		if (int_no >= 0)
> -			break;
> -		if (int_no < 0) {
> -			pr_debug("%s: fail allocating msi interrupt\n",
> -					__func__);
> -		}
> -		virq = irq_of_parse_and_map(msi_data->msi_dev, int_no);
> -		if (!virq) {
> -			dev_err(&dev->dev, "%s: fail mapping irq\n", __func__);
> -			msi_bitmap_free_hwirqs(&msi_data->bitmap, int_no, 1);
> -			return -ENOSPC;
> -		}
> -		dev_dbg(&dev->dev, "%s: virq = %d\n", __func__, virq);
> -
> -		/* Setup msi address space */
> -		msg.address_hi = msi_data->msi_addr_hi;
> -		msg.address_lo = msi_data->msi_addr_lo;
> -
> -		irq_set_msi_desc(virq, entry);
> -		msg.data = int_no;
> -		pci_write_msi_msg(virq, &msg);
> -	}
> -	return 0;
> -}
> -
> -void ppc4xx_teardown_msi_irqs(struct pci_dev *dev)
> -{
> -	struct msi_desc *entry;
> -	struct ppc4xx_msi *msi_data = &ppc4xx_msi;
> -	irq_hw_number_t hwirq;
> -
> -	dev_dbg(&dev->dev, "PCIE-MSI: tearing down msi irqs\n");
> -
> -	for_each_pci_msi_entry(entry, dev) {
> -		if (!entry->irq)
> -			continue;
> -		hwirq = virq_to_hw(entry->irq);
> -		irq_set_msi_desc(entry->irq, NULL);
> -		irq_dispose_mapping(entry->irq);
> -		msi_bitmap_free_hwirqs(&msi_data->bitmap, hwirq, 1);
> -	}
> -}
> -
> -static int ppc4xx_setup_pcieh_hw(struct platform_device *dev,
> -				 struct resource res, struct ppc4xx_msi *msi)
> -{
> -	const u32 *msi_data;
> -	const u32 *msi_mask;
> -	const u32 *sdr_addr;
> -	dma_addr_t msi_phys;
> -	void *msi_virt;
> -	int err;
> -
> -	sdr_addr = of_get_property(dev->dev.of_node, "sdr-base", NULL);
> -	if (!sdr_addr)
> -		return -EINVAL;
> -
> -	msi_data = of_get_property(dev->dev.of_node, "msi-data", NULL);
> -	if (!msi_data)
> -		return -EINVAL;
> -
> -	msi_mask = of_get_property(dev->dev.of_node, "msi-mask", NULL);
> -	if (!msi_mask)
> -		return -EINVAL;
> -
> -	msi->msi_dev = of_find_node_by_name(NULL, "ppc4xx-msi");
> -	if (!msi->msi_dev)
> -		return -ENODEV;
> -
> -	msi->msi_regs = of_iomap(msi->msi_dev, 0);
> -	if (!msi->msi_regs) {
> -		dev_err(&dev->dev, "of_iomap failed\n");
> -		err = -ENOMEM;
> -		goto node_put;
> -	}
> -	dev_dbg(&dev->dev, "PCIE-MSI: msi register mapped 0x%x 0x%x\n",
> -		(u32) (msi->msi_regs + PEIH_TERMADH), (u32) (msi->msi_regs));
> -
> -	msi_virt = dma_alloc_coherent(&dev->dev, 64, &msi_phys, GFP_KERNEL);
> -	if (!msi_virt) {
> -		err = -ENOMEM;
> -		goto iounmap;
> -	}
> -	msi->msi_addr_hi = upper_32_bits(msi_phys);
> -	msi->msi_addr_lo = lower_32_bits(msi_phys & 0xffffffff);
> -	dev_dbg(&dev->dev, "PCIE-MSI: msi address high 0x%x, low 0x%x\n",
> -		msi->msi_addr_hi, msi->msi_addr_lo);
> -
> -	mtdcri(SDR0, *sdr_addr, upper_32_bits(res.start));	/*HIGH addr */
> -	mtdcri(SDR0, *sdr_addr + 1, lower_32_bits(res.start));	/* Low addr */
> -
> -	/* Progam the Interrupt handler Termination addr registers */
> -	out_be32(msi->msi_regs + PEIH_TERMADH, msi->msi_addr_hi);
> -	out_be32(msi->msi_regs + PEIH_TERMADL, msi->msi_addr_lo);
> -
> -	/* Program MSI Expected data and Mask bits */
> -	out_be32(msi->msi_regs + PEIH_MSIED, *msi_data);
> -	out_be32(msi->msi_regs + PEIH_MSIMK, *msi_mask);
> -
> -	dma_free_coherent(&dev->dev, 64, msi_virt, msi_phys);
> -
> -	return 0;
> -
> -iounmap:
> -	iounmap(msi->msi_regs);
> -node_put:
> -	of_node_put(msi->msi_dev);
> -	return err;
> -}
> -
> -static int ppc4xx_of_msi_remove(struct platform_device *dev)
> -{
> -	struct ppc4xx_msi *msi = dev->dev.platform_data;
> -	int i;
> -	int virq;
> -
> -	for (i = 0; i < msi_irqs; i++) {
> -		virq = msi->msi_virqs[i];
> -		if (virq)
> -			irq_dispose_mapping(virq);
> -	}
> -
> -	if (msi->bitmap.bitmap)
> -		msi_bitmap_free(&msi->bitmap);
> -	iounmap(msi->msi_regs);
> -	of_node_put(msi->msi_dev);
> -
> -	return 0;
> -}
> -
> -static int ppc4xx_msi_probe(struct platform_device *dev)
> -{
> -	struct ppc4xx_msi *msi;
> -	struct resource res;
> -	int err = 0;
> -	struct pci_controller *phb;
> -
> -	dev_dbg(&dev->dev, "PCIE-MSI: Setting up MSI support...\n");
> -
> -	msi = devm_kzalloc(&dev->dev, sizeof(*msi), GFP_KERNEL);
> -	if (!msi)
> -		return -ENOMEM;
> -	dev->dev.platform_data = msi;
> -
> -	/* Get MSI ranges */
> -	err = of_address_to_resource(dev->dev.of_node, 0, &res);
> -	if (err) {
> -		dev_err(&dev->dev, "%pOF resource error!\n", dev->dev.of_node);
> -		return err;
> -	}
> -
> -	msi_irqs = of_irq_count(dev->dev.of_node);
> -	if (!msi_irqs)
> -		return -ENODEV;
> -
> -	err = ppc4xx_setup_pcieh_hw(dev, res, msi);
> -	if (err)
> -		return err;
> -
> -	err = ppc4xx_msi_init_allocator(dev, msi);
> -	if (err) {
> -		dev_err(&dev->dev, "Error allocating MSI bitmap\n");
> -		goto error_out;
> -	}
> -	ppc4xx_msi = *msi;
> -
> -	list_for_each_entry(phb, &hose_list, list_node) {
> -		phb->controller_ops.setup_msi_irqs = ppc4xx_setup_msi_irqs;
> -		phb->controller_ops.teardown_msi_irqs = ppc4xx_teardown_msi_irqs;
> -	}
> -	return 0;
> -
> -error_out:
> -	ppc4xx_of_msi_remove(dev);
> -	return err;
> -}
> -static const struct of_device_id ppc4xx_msi_ids[] = {
> -	{
> -		.compatible = "amcc,ppc4xx-msi",
> -	},
> -	{}
> -};
> -static struct platform_driver ppc4xx_msi_driver = {
> -	.probe = ppc4xx_msi_probe,
> -	.remove = ppc4xx_of_msi_remove,
> -	.driver = {
> -		   .name = "ppc4xx-msi",
> -		   .of_match_table = ppc4xx_msi_ids,
> -		   },
> -
> -};
> -
> -static __init int ppc4xx_msi_init(void)
> -{
> -	return platform_driver_register(&ppc4xx_msi_driver);
> -}
> -
> -subsys_initcall(ppc4xx_msi_init);
> --- a/arch/powerpc/sysdev/Kconfig
> +++ b/arch/powerpc/sysdev/Kconfig
> @@ -12,17 +12,11 @@ config PPC4xx_HSTA_MSI
>   	depends on PCI_MSI
>   	depends on PCI && 4xx
>   
> -config PPC4xx_MSI
> -	bool
> -	depends on PCI_MSI
> -	depends on PCI && 4xx
> -
>   config PPC_MSI_BITMAP
>   	bool
>   	depends on PCI_MSI
>   	default y if MPIC
>   	default y if FSL_PCI
> -	default y if PPC4xx_MSI
>   	default y if PPC_POWERNV
>   
>   source "arch/powerpc/sysdev/xics/Kconfig"
> 

