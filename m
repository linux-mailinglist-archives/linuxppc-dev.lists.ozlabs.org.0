Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 327FD150730
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 14:29:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48B7vn16BzzDqN7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 00:29:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=185.176.76.210; helo=huawei.com;
 envelope-from=jonathan.cameron@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=Huawei.com
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48B7nq6N9PzDqN7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2020 00:23:59 +1100 (AEDT)
Received: from LHREML713-CAH.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id 3971D3B08E4F640B95FD;
 Mon,  3 Feb 2020 13:23:55 +0000 (GMT)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 LHREML713-CAH.china.huawei.com (10.201.108.36) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 3 Feb 2020 13:23:54 +0000
Received: from localhost (10.202.226.57) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 3 Feb 2020
 13:23:53 +0000
Date: Mon, 3 Feb 2020 13:23:51 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Alastair D'Silva <alastair@au1.ibm.com>
Subject: Re: [PATCH v2 12/27] nvdimm/ocxl: Read the capability registers &
 wait for device ready
Message-ID: <20200203132351.00005281@Huawei.com>
In-Reply-To: <20191203034655.51561-13-alastair@au1.ibm.com>
References: <20191203034655.51561-1-alastair@au1.ibm.com>
 <20191203034655.51561-13-alastair@au1.ibm.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.57]
X-ClientProxiedBy: lhreml745-chm.china.huawei.com (10.201.108.195) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Keith Busch <keith.busch@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Rob
 Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, Krzysztof
 Kozlowski <krzk@kernel.org>, Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 alastair@d-silva.org, Andrew Donnellan <ajd@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, =?ISO-8859-1?Q?C=E9dric?=
 Le Goater <clg@kaod.org>, Dan Williams <dan.j.williams@intel.com>, Hari
 Bathini <hbathini@linux.ibm.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 3 Dec 2019 14:46:40 +1100
Alastair D'Silva <alastair@au1.ibm.com> wrote:

> From: Alastair D'Silva <alastair@d-silva.org>
> 
> This patch reads timeouts & firmware version from the controller, and
> uses those timeouts to wait for the controller to report that it is ready
> before handing the memory over to libnvdimm.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  drivers/nvdimm/ocxl/Makefile       |  2 +-
>  drivers/nvdimm/ocxl/scm.c          | 84 ++++++++++++++++++++++++++++++
>  drivers/nvdimm/ocxl/scm_internal.c | 19 +++++++
>  drivers/nvdimm/ocxl/scm_internal.h | 24 +++++++++
>  4 files changed, 128 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/nvdimm/ocxl/scm_internal.c
> 
> diff --git a/drivers/nvdimm/ocxl/Makefile b/drivers/nvdimm/ocxl/Makefile
> index 74a1bd98848e..9b6e31f0eb3e 100644
> --- a/drivers/nvdimm/ocxl/Makefile
> +++ b/drivers/nvdimm/ocxl/Makefile
> @@ -4,4 +4,4 @@ ccflags-$(CONFIG_PPC_WERROR)	+= -Werror
>  
>  obj-$(CONFIG_OCXL_SCM) += ocxlscm.o
>  
> -ocxlscm-y := scm.o
> +ocxlscm-y := scm.o scm_internal.o
> diff --git a/drivers/nvdimm/ocxl/scm.c b/drivers/nvdimm/ocxl/scm.c
> index 571058a9e7b8..8088f65c289e 100644
> --- a/drivers/nvdimm/ocxl/scm.c
> +++ b/drivers/nvdimm/ocxl/scm.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/module.h>
>  #include <misc/ocxl.h>
> +#include <linux/delay.h>
>  #include <linux/ndctl.h>
>  #include <linux/mm_types.h>
>  #include <linux/memory_hotplug.h>
> @@ -266,6 +267,30 @@ static int scm_register_lpc_mem(struct scm_data *scm_data)
>  	return 0;
>  }
>  
> +/**
> + * scm_is_usable() - Is a controller usable?
> + * @scm_data: a pointer to the SCM device data
> + * Return: true if the controller is usable
> + */
> +static bool scm_is_usable(const struct scm_data *scm_data)
> +{
> +	u64 chi = 0;
> +	int rc = scm_chi(scm_data, &chi);
> +
> +	if (!(chi & GLOBAL_MMIO_CHI_CRDY)) {
> +		dev_err(&scm_data->dev, "SCM controller is not ready.\n");
> +		return false;
> +	}
> +
> +	if (!(chi & GLOBAL_MMIO_CHI_MA)) {
> +		dev_err(&scm_data->dev,
> +			"SCM controller does not have memory available.\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  /**
>   * allocate_scm_minor() - Allocate a minor number to use for an SCM device
>   * @scm_data: The SCM device to associate the minor with
> @@ -380,6 +405,48 @@ static void scm_remove(struct pci_dev *pdev)
>  	}
>  }
>  
> +/**
> + * read_device_metadata() - Retrieve config information from the AFU and save it for future use
> + * @scm_data: the SCM metadata
> + * Return: 0 on success, negative on failure
> + */
> +static int read_device_metadata(struct scm_data *scm_data)
> +{
> +	u64 val;
> +	int rc;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu, GLOBAL_MMIO_CCAP0,
> +				     OCXL_LITTLE_ENDIAN, &val);
> +	if (rc)
> +		return rc;
> +
> +	scm_data->scm_revision = val & 0xFFFF;
> +	scm_data->read_latency = (val >> 32) & 0xFF;
> +	scm_data->readiness_timeout = (val >> 48) & 0xff;
> +	scm_data->memory_available_timeout = val >> 52;

This overlaps with the masked region for readiness_timeout.  I'll guess the maks
on that should be 0xF.

> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu, GLOBAL_MMIO_CCAP1,
> +				     OCXL_LITTLE_ENDIAN, &val);
> +	if (rc)
> +		return rc;
> +
> +	scm_data->max_controller_dump_size = val & 0xFFFFFFFF;
> +
> +	// Extract firmware version text
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu, GLOBAL_MMIO_FWVER,
> +				     OCXL_HOST_ENDIAN, (u64 *)scm_data->fw_version);
> +	if (rc)
> +		return rc;
> +
> +	scm_data->fw_version[8] = '\0';
> +
> +	dev_info(&scm_data->dev,
> +		 "Firmware version '%s' SCM revision %d:%d\n", scm_data->fw_version,
> +		 scm_data->scm_revision >> 4, scm_data->scm_revision & 0x0F);
> +
> +	return 0;
> +}
> +
>  /**
>   * scm_probe_function_0 - Set up function 0 for an OpenCAPI Storage Class Memory device
>   * This is important as it enables templates higher than 0 across all other functions,
> @@ -420,6 +487,8 @@ static int scm_probe_function_0(struct pci_dev *pdev)
>  static int scm_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  {
>  	struct scm_data *scm_data = NULL;
> +	int elapsed;
> +	u16 timeout;
>  
>  	if (PCI_FUNC(pdev->devfn) == 0)
>  		return scm_probe_function_0(pdev);
> @@ -469,6 +538,21 @@ static int scm_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		goto err;
>  	}
>  
> +	if (read_device_metadata(scm_data)) {
> +		dev_err(&pdev->dev, "Could not read SCM device metadata\n");
> +		goto err;
> +	}
> +
> +	elapsed = 0;
> +	timeout = scm_data->readiness_timeout + scm_data->memory_available_timeout;
> +	while (!scm_is_usable(scm_data)) {
> +		if (elapsed++ > timeout) {
> +			dev_warn(&scm_data->dev, "SCM ready timeout.\n");
> +			goto err;
> +		}
> +
> +		msleep(1000);
> +	}
>  	if (scm_register_lpc_mem(scm_data)) {
>  		dev_err(&pdev->dev, "Could not register OCXL SCM memory with libnvdimm\n");
>  		goto err;
> diff --git a/drivers/nvdimm/ocxl/scm_internal.c b/drivers/nvdimm/ocxl/scm_internal.c
> new file mode 100644
> index 000000000000..72d3c0e7d846
> --- /dev/null
> +++ b/drivers/nvdimm/ocxl/scm_internal.c
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright 2019 IBM Corp.
> +
> +#include <misc/ocxl.h>
> +#include <linux/delay.h>
> +#include "scm_internal.h"
> +
> +int scm_chi(const struct scm_data *scm_data, u64 *chi)
> +{
> +	u64 val;
> +	int rc = ocxl_global_mmio_read64(scm_data->ocxl_afu, GLOBAL_MMIO_CHI,
> +					 OCXL_LITTLE_ENDIAN, &val);
> +	if (rc)
> +		return rc;
> +
> +	*chi = val;
> +
> +	return 0;
> +}
> diff --git a/drivers/nvdimm/ocxl/scm_internal.h b/drivers/nvdimm/ocxl/scm_internal.h
> index d6ab361f5de9..584450f55e30 100644
> --- a/drivers/nvdimm/ocxl/scm_internal.h
> +++ b/drivers/nvdimm/ocxl/scm_internal.h
> @@ -97,4 +97,28 @@ struct scm_data {
>  	void *metadata_addr;
>  	struct resource scm_res;
>  	struct nd_region *nd_region;
> +	char fw_version[8+1];
> +
> +	u32 max_controller_dump_size;
> +	u16 scm_revision; // major/minor
> +	u8 readiness_timeout;  /* The worst case time (in seconds) that the host shall
> +				* wait for the controller to become operational following a reset (CHI.CRDY).
> +				*/
> +	u8 memory_available_timeout;   /* The worst case time (in seconds) that the host shall
> +					* wait for memory to become available following a reset (CHI.MA).
> +					*/
> +
> +	u16 read_latency; /* The nominal measure of latency (in nanoseconds)
> +			   * associated with an unassisted read of a memory block.
> +			   * This represents the capability of the raw media technology without assistance
> +			   */
>  };
> +
> +/**
> + * scm_chi() - Get the value of the CHI register
> + * @scm_data: The SCM metadata
> + * @chi: returns the CHI value
> + *
> + * Returns 0 on success, negative on error
> + */
> +int scm_chi(const struct scm_data *scm_data, u64 *chi);


