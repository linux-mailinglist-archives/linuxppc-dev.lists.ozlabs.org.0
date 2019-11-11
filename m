Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96435F6D83
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 05:19:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BHhq11zdzF32H
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 15:19:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="tNrvLbiS"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BHfp4jgBzF1SS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 15:18:08 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id s5so9755617pfh.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Nov 2019 20:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=v1Y1KnE+pb0G+nZFOJzBW0n9Uka60gzaIglDisqG1BU=;
 b=tNrvLbiSUG3gLu/ITRVKFhtcd+A2B2pli1ylQzEf2K6bk37ynpNXf4B+klQs3AA94U
 TFtFtjEqB6x59Bb8X6kNwzcPzvSRkUGSpAtCGrU6t2gQRGOy5r2/mBiKU5vL4+c/uUyg
 /kN82djZXjswlLVLhPoI0KC9NV5ahgGeBXGP55RbVg/HKZlSKnBkyTFIeXXGH7bsQvhd
 FiFHDiVSENGS+rV7D7xeWwaKRsnxXH3MJP5TTP7yMC8dUoJE11fYmoNkyomCfKN1fMaF
 GjdW6pyY8nbxdjivgakINZSENSkU9B0SS9+K0dfZZfOU2TyTNtNVZ0kMyBXeZtLIgeai
 RRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v1Y1KnE+pb0G+nZFOJzBW0n9Uka60gzaIglDisqG1BU=;
 b=B6DDpE7htBxrjGPKv0UtHDZGC6Zl175o6Z3WsYH5e7YErcTrd98irElpLKjIN+TO8L
 OkfRnCGD0dN/4I6U7F3202HpU9xHy5UmNbOeYWSh4a9RfwhNlIm9+CVtR0wm/IDRiijp
 +14RVauw/R2Y1fUZ/XsJLfw3uEEN3nAS9+JFCS3bH2e5vCZ4agWzPjX+iRhwA0GnpYT4
 XA/G9oW8Vh83j16e2Wwcao4kYzTHrssBcHnqFFzBtfae3MeM4CB3fgP8TmItJboqlx6b
 3gHyqlrD5bUPZdJ6VhVUJC80W7StJ7vlxnT04EFE7PLBiqHsJCkl/PkHadLigTHpfrIw
 BWHw==
X-Gm-Message-State: APjAAAWfNngN/ZSNagXBSU1Nf5WququustSPWtkL68Fe1KN3MujDRYtJ
 KmyVjMTICxiafXYDdxj+tP8hZw==
X-Google-Smtp-Source: APXvYqzbSOO00A63zGq+HxRG4blcF5lGsyiN9+LC8V/VTp3r30Br62ZuvhotJuJJD82MnW/U0yqlNQ==
X-Received: by 2002:a63:b502:: with SMTP id y2mr26101550pge.133.1573445884600; 
 Sun, 10 Nov 2019 20:18:04 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id y2sm13003245pfe.126.2019.11.10.20.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Nov 2019 20:18:03 -0800 (PST)
Subject: Re: [PATCH 2/2] vfio/pci: Introduce OpenCAPI devices support.
To: christophe lombard <clombard@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com, groug@kaod.org, clg@kaod.org
References: <20191024132805.30701-1-clombard@linux.vnet.ibm.com>
 <20191024132805.30701-3-clombard@linux.vnet.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <10424e1f-1b65-9ce7-a690-efaa3ccc5b37@ozlabs.ru>
Date: Mon, 11 Nov 2019 15:17:59 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191024132805.30701-3-clombard@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 25/10/2019 00:28, christophe lombard wrote:
> This patch adds new IOCTL commands for VFIO PCI driver to support
> configuration and management for OpenCAPI devices, which have been passed
> through from host to QEMU VFIO.

So far we managed to keep all IBM POWER specific inside the IOMMU
subdriver, why is this case different? You really have to outline what
OpenCAPI does and why simple passing through does not work and how the
guest will trigger these ioctls() in QEMU, are you adding hypercalls?

What driver do you expect to work with this in the guest?
arch/powerpc/platforms/powernv/ocxl.c is a powernv-tied driver which
calls into OPAL so it won't work on pseries.


> OpenCAPI (Open Coherent Accelerator Processor Interface) is an interface
> between processors and accelerators.
> 
> The main IOCTL command is:
>  VFIO_DEVICE_OCXL_OP 	Handles devices, which supports the OpenCAPI
>  			interface, using the ocxl pnv_* interface.
> 
> The following commands are supported, based on the hcalls defined
> in ocxl/pseries.c that implements the guest-specific callbacks.
> VFIO_DEVICE_OCXL_CONFIG_ADAPTER   Used to configure OpenCAPI adapter
> 			     	  characteristics.
> 
> VFIO_DEVICE_OCXL_CONFIG_SPA       Used to configure the schedule process
> 			     	  area (SPA) table for an OpenCAPI device.
> 
> VFIO_DEVICE_OCXL_GET_FAULT_STATE  Used to retrieve fault information
> 				  from an OpenCAPI device.
> 
> VFIO_DEVICE_OCXL_HANDLE_FAULT     Used to respond to an OpenCAPI fault.
> 
> The platform data is declared in the vfio_pci_ocxl_link which is common
> for each devices sharing the same domain, same bus and same slot.


So this can be IOMMU attributes, no?


> The lpid value, requested to configure the process element in the
> Scheduled Process Area, is not available in the QEMU environment.
> This implies getting it from the host through the iommu group.


lpid does not change after the device is assigned so you can just do
what drivers/vfio/pci/vfio_pci_nvlink2.c does (set it once per IOMMU
group when KVM is attached to a group) and skip the vfio_dev_get_kvm()
part. Thanks,



> Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
> ---
>  drivers/vfio/pci/Kconfig         |   7 +
>  drivers/vfio/pci/Makefile        |   1 +
>  drivers/vfio/pci/vfio_pci.c      |  19 ++
>  drivers/vfio/pci/vfio_pci_ocxl.c | 287 +++++++++++++++++++++++++++++++
>  drivers/vfio/vfio.c              |  25 +++
>  include/linux/vfio.h             |  13 ++
>  include/uapi/linux/vfio.h        |  22 +++
>  7 files changed, 374 insertions(+)
>  create mode 100644 drivers/vfio/pci/vfio_pci_ocxl.c
> 
> diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
> index ac3c1dd3edef..fd3716d10ded 100644
> --- a/drivers/vfio/pci/Kconfig
> +++ b/drivers/vfio/pci/Kconfig
> @@ -45,3 +45,10 @@ config VFIO_PCI_NVLINK2
>  	depends on VFIO_PCI && PPC_POWERNV
>  	help
>  	  VFIO PCI support for P9 Witherspoon machine with NVIDIA V100 GPUs
> +
> +config VFIO_PCI_OCXL
> +	depends on VFIO_PCI
> +	def_bool y if OCXL_BASE
> +	help
> +	  VFIO PCI support for devices which handle the Open Coherent
> +	  Accelerator Processor Interface.
> diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
> index f027f8a0e89c..6d55a5fee4b0 100644
> --- a/drivers/vfio/pci/Makefile
> +++ b/drivers/vfio/pci/Makefile
> @@ -3,5 +3,6 @@
>  vfio-pci-y := vfio_pci.o vfio_pci_intrs.o vfio_pci_rdwr.o vfio_pci_config.o
>  vfio-pci-$(CONFIG_VFIO_PCI_IGD) += vfio_pci_igd.o
>  vfio-pci-$(CONFIG_VFIO_PCI_NVLINK2) += vfio_pci_nvlink2.o
> +vfio-pci-$(CONFIG_VFIO_PCI_OCXL) += vfio_pci_ocxl.o
>  
>  obj-$(CONFIG_VFIO_PCI) += vfio-pci.o
> diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
> index 703948c9fbe1..4f9741bbe790 100644
> --- a/drivers/vfio/pci/vfio_pci.c
> +++ b/drivers/vfio/pci/vfio_pci.c
> @@ -1128,6 +1128,25 @@ static long vfio_pci_ioctl(void *device_data,
>  
>  		return vfio_pci_ioeventfd(vdev, ioeventfd.offset,
>  					  ioeventfd.data, count, ioeventfd.fd);
> +	} else if (cmd == VFIO_DEVICE_OCXL_OP) {
> +		struct vfio_device_ocxl_op ocxl_op;
> +		int ret = 0;
> +
> +		minsz = offsetofend(struct vfio_device_ocxl_op, data);
> +
> +		if (copy_from_user(&ocxl_op, (void __user *)arg, minsz))
> +			return -EFAULT;
> +
> +		if (ocxl_op.argsz < minsz)
> +			return -EINVAL;
> +
> +		ret = vfio_pci_ocxl_ioctl(vdev->pdev, &ocxl_op);
> +
> +		if (!ret) {
> +			if (copy_to_user((void __user *)arg, &ocxl_op, minsz))
> +				ret = -EFAULT;
> +		}
> +		return ret;
>  	}
>  
>  	return -ENOTTY;
> diff --git a/drivers/vfio/pci/vfio_pci_ocxl.c b/drivers/vfio/pci/vfio_pci_ocxl.c
> new file mode 100644
> index 000000000000..cb5cd4fb416d
> --- /dev/null
> +++ b/drivers/vfio/pci/vfio_pci_ocxl.c
> @@ -0,0 +1,287 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright 2019 IBM Corp.
> +
> +#include <asm/kvm_ppc.h>
> +#include <asm/pnv-ocxl.h>
> +#include <linux/vfio.h>
> +#include <linux/slab.h>
> +#include <linux/pci.h>
> +#include <linux/kvm_host.h>
> +
> +struct vfio_device_ocxl_link {
> +	struct list_head list;
> +	int domain;
> +	int bus;
> +	int slot;
> +	void *platform_data;
> +};
> +static struct list_head links_list = LIST_HEAD_INIT(links_list);
> +static DEFINE_MUTEX(links_list_lock);
> +
> +#define VFIO_DEVICE_OCXL_CONFIG_ADAPTER		1
> +#define   VFIO_DEVICE_OCXL_CONFIG_ADAPTER_SETUP		1
> +#define   VFIO_DEVICE_OCXL_CONFIG_ADAPTER_RELEASE	2
> +#define   VFIO_DEVICE_OCXL_CONFIG_ADAPTER_GET_ACTAG	3
> +#define   VFIO_DEVICE_OCXL_CONFIG_ADAPTER_GET_PASID	4
> +#define   VFIO_DEVICE_OCXL_CONFIG_ADAPTER_SET_TL	5
> +#define   VFIO_DEVICE_OCXL_CONFIG_ADAPTER_ALLOC_IRQ	6
> +#define   VFIO_DEVICE_OCXL_CONFIG_ADAPTER_FREE_IRQ	7
> +
> +#define VFIO_DEVICE_OCXL_CONFIG_SPA		2
> +#define   VFIO_DEVICE_OCXL_CONFIG_SPA_SET		1
> +#define   VFIO_DEVICE_OCXL_CONFIG_SPA_UPDATE		2
> +#define   VFIO_DEVICE_OCXL_CONFIG_SPA_REMOVE		3
> +
> +#define VFIO_DEVICE_OCXL_GET_FAULT_STATE	3
> +#define VFIO_DEVICE_OCXL_HANDLE_FAULT		4
> +
> +static struct vfio_device_ocxl_link *find_link(struct pci_dev *pdev)
> +{
> +	struct vfio_device_ocxl_link *link;
> +
> +	list_for_each_entry(link, &links_list, list) {
> +		/* The functions of a device all share the same link */
> +		if (link->domain == pci_domain_nr(pdev->bus) &&
> +			link->bus == pdev->bus->number &&
> +			link->slot == PCI_SLOT(pdev->devfn)) {
> +			return link;
> +		}
> +	}
> +
> +	/* link doesn't exist yet. Allocate one */
> +	link = kzalloc(sizeof(struct vfio_device_ocxl_link), GFP_KERNEL);
> +	if (!link)
> +		return NULL;
> +	link->domain = pci_domain_nr(pdev->bus);
> +	link->bus = pdev->bus->number;
> +	link->slot = PCI_SLOT(pdev->devfn);
> +	list_add(&link->list, &links_list);
> +	return link;
> +}
> +
> +static long irq_mapped(struct pci_dev *pdev,
> +		       int host_irq, int guest_irq, bool set)
> +{
> +	struct irq_desc *desc;
> +	struct kvm *kvm;
> +	int ret = 0, virq;
> +
> +	virq = irq_create_mapping(NULL, host_irq);
> +	if (!virq) {
> +		dev_err(&pdev->dev,
> +			"irq_create_mapping failed for translation interrupt\n");
> +		return -EINVAL;
> +	}
> +
> +	desc = irq_to_desc(virq);
> +	if (!desc) {
> +		dev_err(&pdev->dev,
> +			"irq_to_desc failed (host_irq: %d, virq: %d)\n",
> +			host_irq, virq);
> +		return -EIO;
> +	}
> +
> +	kvm = vfio_dev_get_kvm(&pdev->dev);
> +	if (!kvm)
> +		return -ENODEV;
> +
> +	mutex_lock(&kvm->lock);
> +	if (xics_on_xive()) {
> +		if (set)
> +			ret = kvmppc_xive_set_mapped(kvm, guest_irq, desc);
> +		else
> +			ret = kvmppc_xive_clr_mapped(kvm, guest_irq, desc);
> +	} else {
> +		if (set)
> +			kvmppc_xics_set_mapped(kvm, guest_irq, host_irq);
> +		else
> +			kvmppc_xics_clr_mapped(kvm, guest_irq, host_irq);
> +	}
> +	mutex_unlock(&kvm->lock);
> +	kvm_put_kvm(kvm);
> +
> +	return ret;
> +}
> +
> +static long config_adapter(struct pci_dev *pdev,
> +			   struct vfio_device_ocxl_op *ocxl_op,
> +			   struct vfio_device_ocxl_link *link)
> +{
> +	int PE_mask, host_irq, guest_irq, count, tl_dvsec;
> +	u16 base, enabled, supported;
> +	u64 cmd;
> +	int ret = 0;
> +
> +	cmd = ocxl_op->data[2];
> +	switch (cmd) {
> +	case VFIO_DEVICE_OCXL_CONFIG_ADAPTER_SETUP:
> +		PE_mask = ocxl_op->data[3];
> +		ret = pnv_ocxl_platform_setup(pdev, PE_mask,
> +					      &host_irq,
> +					      &link->platform_data);
> +		if (!ret) {
> +			guest_irq = ocxl_op->data[4];
> +			ret = irq_mapped(pdev, host_irq, guest_irq, true);
> +			if (!ret)
> +				ocxl_op->data[0] = host_irq;
> +		}
> +		break;
> +
> +	case VFIO_DEVICE_OCXL_CONFIG_ADAPTER_RELEASE:
> +		pnv_ocxl_platform_release(link->platform_data);
> +
> +		host_irq = ocxl_op->data[3];
> +		guest_irq = ocxl_op->data[4];
> +		if (host_irq && guest_irq)
> +			ret = irq_mapped(pdev, host_irq, guest_irq, false);
> +		break;
> +
> +	case VFIO_DEVICE_OCXL_CONFIG_ADAPTER_GET_ACTAG:
> +		ret = pnv_ocxl_get_actag(pdev, &base, &enabled,
> +					 &supported);
> +		if (!ret) {
> +			ocxl_op->data[0] = base;
> +			ocxl_op->data[1] = enabled;
> +			ocxl_op->data[2] = supported;
> +		}
> +		break;
> +
> +	case VFIO_DEVICE_OCXL_CONFIG_ADAPTER_GET_PASID:
> +		ret = pnv_ocxl_get_pasid_count(pdev, &count);
> +		if (!ret)
> +			ocxl_op->data[0] = count;
> +		break;
> +
> +	case VFIO_DEVICE_OCXL_CONFIG_ADAPTER_SET_TL:
> +		tl_dvsec = ocxl_op->data[3];
> +		ret = pnv_ocxl_set_TL(pdev, tl_dvsec);
> +		break;
> +
> +	default:
> +		ret = -EINVAL;
> +	}
> +
> +	if (ret)
> +		dev_err(&pdev->dev, "Failed to configure the adapter "
> +				    "(cmd: %#llx, ret: %d)\n",
> +				    cmd, ret);
> +
> +	return ret;
> +}
> +
> +static long config_spa(struct pci_dev *pdev,
> +		       struct vfio_device_ocxl_op *ocxl_op,
> +		       struct vfio_device_ocxl_link *link)
> +{
> +	int lpid, pid, tid, pasid;
> +	int pe_handle, ret = 0;
> +	u32 pidr, tidr, amr;
> +	struct kvm *kvm;
> +	u64 cmd;
> +
> +	cmd = ocxl_op->data[2];
> +	switch (cmd) {
> +	case VFIO_DEVICE_OCXL_CONFIG_SPA_SET:
> +		kvm = vfio_dev_get_kvm(&pdev->dev);
> +		if (!kvm)
> +			return -ENODEV;
> +		lpid = kvm->arch.lpid;
> +		kvm_put_kvm(kvm);
> +
> +		pasid = ocxl_op->data[3];
> +		pidr  = ocxl_op->data[4];
> +		tidr  = ocxl_op->data[5];
> +		amr   = ocxl_op->data[6];
> +
> +		ret = pnv_ocxl_set_pe(link->platform_data, lpid, pasid,
> +				      pidr, tidr, amr, &pe_handle);
> +		if (!ret)
> +			ocxl_op->data[0] = pe_handle;
> +		break;
> +
> +	case VFIO_DEVICE_OCXL_CONFIG_SPA_UPDATE:
> +		pasid = ocxl_op->data[3];
> +		tid   = ocxl_op->data[4];
> +
> +		pnv_ocxl_update_pe(link->platform_data, pasid, tid);
> +		break;
> +
> +	case VFIO_DEVICE_OCXL_CONFIG_SPA_REMOVE:
> +		pasid = ocxl_op->data[3];
> +
> +		ret = pnv_ocxl_remove_pe(link->platform_data, pasid,
> +					 &pid, &tid, &pe_handle);
> +		if (!ret) {
> +			ocxl_op->data[0] = pid;
> +			ocxl_op->data[1] = tid;
> +			ocxl_op->data[2] = pe_handle;
> +		}
> +		break;
> +
> +	default:
> +		ret = -EINVAL;
> +	}
> +
> +	if (ret)
> +		dev_err(&pdev->dev, "Failed to configure the SPA "
> +				    "(cmd: %#llx, ret: %d)\n",
> +				    cmd, ret);
> +
> +	return ret;
> +}
> +
> +static void get_fault_state(struct vfio_device_ocxl_op *ocxl_op,
> +			    struct vfio_device_ocxl_link *link)
> +{
> +	u64 dsisr, dar, pe_handle;
> +	int pid;
> +
> +	pnv_ocxl_get_fault_state(link->platform_data, &dsisr, &dar,
> +				 &pe_handle, &pid);
> +
> +	ocxl_op->data[0] = dsisr;
> +	ocxl_op->data[1] = dar;
> +	ocxl_op->data[2] = pe_handle;
> +	ocxl_op->data[3] = pid;
> +}
> +
> +static void handle_fault(struct vfio_device_ocxl_op *ocxl_op,
> +			 struct vfio_device_ocxl_link *link)
> +{
> +	u64 tfc;
> +
> +	tfc = ocxl_op->data[2];
> +	pnv_ocxl_handle_fault(link->platform_data, tfc);
> +}
> +
> +long vfio_pci_ocxl_ioctl(struct pci_dev *pdev,
> +			 struct vfio_device_ocxl_op *ocxl_op)
> +{
> +	struct vfio_device_ocxl_link *link;
> +	int ret = 0;
> +
> +	/* The functions of a device all share the same link */
> +	mutex_lock(&links_list_lock);
> +	link = find_link(pdev);
> +
> +	switch (ocxl_op->op) {
> +	case VFIO_DEVICE_OCXL_CONFIG_ADAPTER:
> +		ret = config_adapter(pdev, ocxl_op, link);
> +		break;
> +	case VFIO_DEVICE_OCXL_CONFIG_SPA:
> +		ret = config_spa(pdev, ocxl_op, link);
> +		break;
> +	case VFIO_DEVICE_OCXL_GET_FAULT_STATE:
> +		get_fault_state(ocxl_op, link);
> +		break;
> +	case VFIO_DEVICE_OCXL_HANDLE_FAULT:
> +		handle_fault(ocxl_op, link);
> +		break;
> +	default:
> +		ret = -EINVAL;
> +	}
> +
> +	mutex_unlock(&links_list_lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(vfio_pci_ocxl_ioctl);
> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index 388597930b64..31d64ecac690 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -18,6 +18,7 @@
>  #include <linux/fs.h>
>  #include <linux/idr.h>
>  #include <linux/iommu.h>
> +#include <linux/kvm_host.h>
>  #include <linux/list.h>
>  #include <linux/miscdevice.h>
>  #include <linux/module.h>
> @@ -2051,6 +2052,30 @@ void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm)
>  }
>  EXPORT_SYMBOL_GPL(vfio_group_set_kvm);
>  
> +struct kvm *vfio_dev_get_kvm(struct device *dev)
> +{
> +	struct iommu_group *iommu_group;
> +	struct vfio_group *group;
> +	struct kvm *kvm;
> +
> +	iommu_group = iommu_group_get(dev);
> +	if (!iommu_group)
> +		return NULL;
> +
> +	group = vfio_group_get_from_iommu(iommu_group);
> +	if (!group) {
> +		iommu_group_put(iommu_group);
> +		return NULL;
> +	}
> +
> +	kvm_get_kvm(kvm = group->kvm);
> +	iommu_group_put(iommu_group);
> +	vfio_group_put(group);
> +
> +	return kvm;
> +}
> +EXPORT_SYMBOL_GPL(vfio_dev_get_kvm);
> +
>  static int vfio_register_group_notifier(struct vfio_group *group,
>  					unsigned long *events,
>  					struct notifier_block *nb)
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index e42a711a2800..22ee8d007353 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -129,6 +129,7 @@ extern int vfio_unregister_notifier(struct device *dev,
>  
>  struct kvm;
>  extern void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm);
> +extern struct kvm *vfio_dev_get_kvm(struct device *dev);
>  
>  /*
>   * Sub-module helpers
> @@ -195,4 +196,16 @@ extern int vfio_virqfd_enable(void *opaque,
>  			      void *data, struct virqfd **pvirqfd, int fd);
>  extern void vfio_virqfd_disable(struct virqfd **pvirqfd);
>  
> +/* OpenCAPI */
> +#if IS_ENABLED(CONFIG_OCXL_BASE)
> +extern long vfio_pci_ocxl_ioctl(struct pci_dev *pdev,
> +				struct vfio_device_ocxl_op *ocxl_op);
> +#else
> +static inline long vfio_pci_ocxl_ioctl(struct pci_dev *pdev,
> +				       struct vfio_device_ocxl_op *ocxl_op)
> +{
> +	return -ENOTTY;
> +}
> +#endif /* CONFIG_OCXL_BASE */
> +
>  #endif /* VFIO_H */
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 8f10748dac79..4432593c2e65 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -912,6 +912,28 @@ struct vfio_iommu_spapr_tce_remove {
>  };
>  #define VFIO_IOMMU_SPAPR_TCE_REMOVE	_IO(VFIO_TYPE, VFIO_BASE + 20)
>  
> +/**
> + * VFIO_DEVICE_OCXL_OP - _IOW(VFIO_TYPE, VFIO_BASE + 22, struct vfio_device_ocxl_op)
> + *
> + * Handles devices, which supports the OpenCAPI interface, using the
> + * ocxl pnv_* interface.
> + */
> +struct vfio_device_ocxl_op {
> +	__u32 argsz;
> +	__u32 flags;
> +	__u32 op;
> +	__u64 data[9];
> +		/* data to be read and written
> +		 * data[0] = buid
> +		 * data[1] = config_addr
> +		 * data[2] = cmd or data[2] = p1, data[3] = p2, ...
> +		 * data[3] = p1, params[4] = p2, ...
> +		 *
> +		 * data[x] = outx ...
> +		 */
> +};
> +#define VFIO_DEVICE_OCXL_OP		_IO(VFIO_TYPE, VFIO_BASE + 22)
> +
>  /* ***************************************************************** */
>  
>  #endif /* _UAPIVFIO_H */
> 

-- 
Alexey
