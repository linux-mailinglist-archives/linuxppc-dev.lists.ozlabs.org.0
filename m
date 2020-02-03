Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF24150723
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 14:25:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48B7qV1TVLzDqNv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 00:25:26 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48B7k46QDfzDqMv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2020 00:20:42 +1100 (AEDT)
Received: from LHREML710-CAH.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id BEC5736B1BA6CE389ACA;
 Mon,  3 Feb 2020 13:20:38 +0000 (GMT)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 LHREML710-CAH.china.huawei.com (10.201.108.33) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 3 Feb 2020 13:20:38 +0000
Received: from localhost (10.202.226.57) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 3 Feb 2020
 13:20:37 +0000
Date: Mon, 3 Feb 2020 13:20:36 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Alastair D'Silva <alastair@au1.ibm.com>
Subject: Re: [PATCH v2 10/27] nvdimm: Add driver for OpenCAPI Storage Class
 Memory
Message-ID: <20200203132036.00000040@Huawei.com>
In-Reply-To: <20191203034655.51561-11-alastair@au1.ibm.com>
References: <20191203034655.51561-1-alastair@au1.ibm.com>
 <20191203034655.51561-11-alastair@au1.ibm.com>
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

On Tue, 3 Dec 2019 14:46:38 +1100
Alastair D'Silva <alastair@au1.ibm.com> wrote:

> From: Alastair D'Silva <alastair@d-silva.org>
> 
> This driver exposes LPC memory on OpenCAPI SCM cards
> as an NVDIMM, allowing the existing nvram infrastructure
> to be used.
> 
> Namespace metadata is stored on the media itself, so
> scm_reserve_metadata() maps 1 section's worth of PMEM storage
> at the start to hold this. The rest of the PMEM range is registered
> with libnvdimm as an nvdimm. scm_ndctl_config_read/write/size() provide
> callbacks to libnvdimm to access the metadata.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
Hi Alastair,

A few bits and bobs inline.

Thanks,

Jonathan

> ---
>  drivers/nvdimm/Kconfig             |   2 +
>  drivers/nvdimm/Makefile            |   2 +-
>  drivers/nvdimm/ocxl/Kconfig        |  15 +
>  drivers/nvdimm/ocxl/Makefile       |   7 +
>  drivers/nvdimm/ocxl/scm.c          | 519 +++++++++++++++++++++++++++++
>  drivers/nvdimm/ocxl/scm_internal.h |  28 ++
>  6 files changed, 572 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/nvdimm/ocxl/Kconfig
>  create mode 100644 drivers/nvdimm/ocxl/Makefile
>  create mode 100644 drivers/nvdimm/ocxl/scm.c
>  create mode 100644 drivers/nvdimm/ocxl/scm_internal.h
> 
> diff --git a/drivers/nvdimm/Kconfig b/drivers/nvdimm/Kconfig
> index 36af7af6b7cf..d1bab36da61c 100644
> --- a/drivers/nvdimm/Kconfig
> +++ b/drivers/nvdimm/Kconfig
> @@ -130,4 +130,6 @@ config NVDIMM_TEST_BUILD
>  	  core devm_memremap_pages() implementation and other
>  	  infrastructure.
>  
> +source "drivers/nvdimm/ocxl/Kconfig"
> +
>  endif
> diff --git a/drivers/nvdimm/Makefile b/drivers/nvdimm/Makefile
> index 29203f3d3069..e33492128042 100644
> --- a/drivers/nvdimm/Makefile
> +++ b/drivers/nvdimm/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_LIBNVDIMM) += libnvdimm.o
> +obj-$(CONFIG_LIBNVDIMM) += libnvdimm.o ocxl/
>  obj-$(CONFIG_BLK_DEV_PMEM) += nd_pmem.o
>  obj-$(CONFIG_ND_BTT) += nd_btt.o
>  obj-$(CONFIG_ND_BLK) += nd_blk.o
> diff --git a/drivers/nvdimm/ocxl/Kconfig b/drivers/nvdimm/ocxl/Kconfig
> new file mode 100644
> index 000000000000..24099b300f5e
> --- /dev/null
> +++ b/drivers/nvdimm/ocxl/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +if LIBNVDIMM
> +
> +config OCXL_SCM
> +	tristate "OpenCAPI Storage Class Memory"
> +	depends on LIBNVDIMM && PPC_POWERNV && PCI && EEH
> +	select ZONE_DEVICE
> +	select OCXL
> +	help
> +	  Exposes devices that implement the OpenCAPI Storage Class Memory
> +	  specification as persistent memory regions.
> +
> +	  Select N if unsure.
> +
> +endif
> diff --git a/drivers/nvdimm/ocxl/Makefile b/drivers/nvdimm/ocxl/Makefile
> new file mode 100644
> index 000000000000..74a1bd98848e
> --- /dev/null
> +++ b/drivers/nvdimm/ocxl/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +ccflags-$(CONFIG_PPC_WERROR)	+= -Werror
> +
> +obj-$(CONFIG_OCXL_SCM) += ocxlscm.o
> +
> +ocxlscm-y := scm.o
> diff --git a/drivers/nvdimm/ocxl/scm.c b/drivers/nvdimm/ocxl/scm.c
> new file mode 100644
> index 000000000000..571058a9e7b8
> --- /dev/null
> +++ b/drivers/nvdimm/ocxl/scm.c
> @@ -0,0 +1,519 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright 2019 IBM Corp.
> +
> +/*
> + * A driver for Storage Class Memory, connected via OpenCAPI
> + */
> +
> +#include <linux/module.h>
> +#include <misc/ocxl.h>
> +#include <linux/ndctl.h>
> +#include <linux/mm_types.h>
> +#include <linux/memory_hotplug.h>
> +#include "scm_internal.h"
> +
> +
> +static const struct pci_device_id scm_pci_tbl[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_IBM, 0x0625), },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(pci, scm_pci_tbl);
> +
> +#define SCM_NUM_MINORS 256 // Total to reserve
> +
> +static dev_t scm_dev;
> +static struct class *scm_class;
> +static struct mutex minors_idr_lock;
> +static struct idr minors_idr;
> +
> +static const struct attribute_group *scm_pmem_attribute_groups[] = {
> +	&nvdimm_bus_attribute_group,
> +	NULL,
> +};
> +
> +static const struct attribute_group *scm_pmem_region_attribute_groups[] = {
> +	&nd_region_attribute_group,
> +	&nd_device_attribute_group,
> +	&nd_mapping_attribute_group,
> +	&nd_numa_attribute_group,
> +	NULL,
> +};
> +
> +/**
> + * scm_ndctl_config_write() - Handle a ND_CMD_SET_CONFIG_DATA command from ndctl
> + * @scm_data: the SCM metadata
> + * @command: the incoming data to write
> + * Return: 0 on success, negative on failure
> + */
> +static int scm_ndctl_config_write(struct scm_data *scm_data,
> +				  struct nd_cmd_set_config_hdr *command)
> +{
> +	if (command->in_offset + command->in_length > SCM_LABEL_AREA_SIZE)
> +		return -EINVAL;
> +
> +	memcpy_flushcache(scm_data->metadata_addr + command->in_offset, command->in_buf,
> +			  command->in_length);
> +
> +	return 0;
> +}
> +
> +/**
> + * scm_ndctl_config_read() - Handle a ND_CMD_GET_CONFIG_DATA command from ndctl
> + * @scm_data: the SCM metadata
> + * @command: the read request
> + * Return: 0 on success, negative on failure
> + */
> +static int scm_ndctl_config_read(struct scm_data *scm_data,
> +				 struct nd_cmd_get_config_data_hdr *command)
> +{
> +	if (command->in_offset + command->in_length > SCM_LABEL_AREA_SIZE)
> +		return -EINVAL;
> +
> +	memcpy_mcsafe(command->out_buf, scm_data->metadata_addr + command->in_offset,
> +		      command->in_length);
> +
> +	return 0;
> +}
> +
> +/**
> + * scm_ndctl_config_size() - Handle a ND_CMD_GET_CONFIG_SIZE command from ndctl
> + * @scm_data: the SCM metadata
> + * @command: the read request
> + * Return: 0 on success, negative on failure
> + */
> +static int scm_ndctl_config_size(struct nd_cmd_get_config_size *command)
> +{
> +	command->status = 0;
> +	command->config_size = SCM_LABEL_AREA_SIZE;
> +	command->max_xfer = PAGE_SIZE;
> +
> +	return 0;
> +}
> +
> +static int scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
> +		     struct nvdimm *nvdimm,
> +		     unsigned int cmd, void *buf, unsigned int buf_len, int *cmd_rc)
> +{
> +	struct scm_data *scm_data = container_of(nd_desc, struct scm_data, bus_desc);
> +
> +	switch (cmd) {
> +	case ND_CMD_GET_CONFIG_SIZE:
> +		*cmd_rc = scm_ndctl_config_size(buf);
> +		return 0;
> +
> +	case ND_CMD_GET_CONFIG_DATA:
> +		*cmd_rc = scm_ndctl_config_read(scm_data, buf);
> +		return 0;
> +
> +	case ND_CMD_SET_CONFIG_DATA:
> +		*cmd_rc = scm_ndctl_config_write(scm_data, buf);
> +		return 0;
> +
> +	default:
> +		return -ENOTTY;
> +	}
> +}
> +
> +static ssize_t serial_show(struct device *dev,
> +			   struct device_attribute *attr, char *buf)
> +{
> +	struct nvdimm *nvdimm = to_nvdimm(dev);
> +	struct scm_data *scm_data = nvdimm_provider_data(nvdimm);
> +	const struct ocxl_fn_config *config = ocxl_function_config(scm_data->ocxl_fn);
> +
> +	return sprintf(buf, "0x%llx\n", config->serial);
> +}
> +static DEVICE_ATTR_RO(serial);
> +
> +static struct attribute *scm_dimm_attributes[] = {
> +	&dev_attr_serial.attr,
> +	NULL,
> +};
> +
> +static umode_t scm_dimm_attr_visible(struct kobject *kobj,
> +				     struct attribute *a, int n)
> +{
> +	return a->mode;
> +}
> +
> +static const struct attribute_group scm_dimm_attribute_group = {
> +	.name = "ocxl",
> +	.attrs = scm_dimm_attributes,
> +	.is_visible = scm_dimm_attr_visible,
> +};
> +
> +static const struct attribute_group *scm_dimm_attribute_groups[] = {
> +	&nvdimm_attribute_group,
> +	&nd_device_attribute_group,
> +	&scm_dimm_attribute_group,
> +	NULL,
> +};
> +
> +/**
> + * scm_reserve_metadata() - Reserve space for nvdimm metadata
> + * @scm_data: The SCM device data
> + * @lpc_mem: The resource representing the LPC memory of the SCM device
> + */
> +static int scm_reserve_metadata(struct scm_data *scm_data,
> +				struct resource *lpc_mem)
> +{
> +	scm_data->metadata_addr = devm_memremap(&scm_data->dev, lpc_mem->start,
> +						SCM_LABEL_AREA_SIZE, MEMREMAP_WB);
> +	if (IS_ERR(scm_data->metadata_addr))
> +		return PTR_ERR(scm_data->metadata_addr);
> +
> +	return 0;
> +}
> +
> +/**
> + * scm_register_lpc_mem() - Discover persistent memory on a device and register it with the NVDIMM subsystem
> + * @scm_data: The SCM device data
> + * Return: 0 on success
> + */
> +static int scm_register_lpc_mem(struct scm_data *scm_data)
> +{
> +	struct nd_region_desc region_desc;
> +	struct nd_mapping_desc nd_mapping_desc;
> +	struct resource *lpc_mem;
> +	const struct ocxl_afu_config *config;
> +	const struct ocxl_fn_config *fn_config;
> +	int rc;
> +	unsigned long nvdimm_cmd_mask = 0;
> +	unsigned long nvdimm_flags = 0;
> +	int target_node;
> +	char serial[16+1];
> +
> +	// Set up the reserved metadata area
> +	rc = ocxl_afu_map_lpc_mem(scm_data->ocxl_afu);
> +	if (rc < 0)
> +		return rc;
> +
> +	lpc_mem = ocxl_afu_lpc_mem(scm_data->ocxl_afu);
> +	if (lpc_mem == NULL || lpc_mem->start == 0)
> +		return -EINVAL;
> +
> +	config = ocxl_afu_config(scm_data->ocxl_afu);
> +	fn_config = ocxl_function_config(scm_data->ocxl_fn);
> +
> +	rc = scm_reserve_metadata(scm_data, lpc_mem);
> +	if (rc)
> +		return rc;
> +
> +	scm_data->bus_desc.attr_groups = scm_pmem_attribute_groups;
> +	scm_data->bus_desc.provider_name = "ocxl-scm";
> +	scm_data->bus_desc.ndctl = scm_ndctl;
> +	scm_data->bus_desc.module = THIS_MODULE;
> +
> +	scm_data->nvdimm_bus = nvdimm_bus_register(&scm_data->dev,
> +			       &scm_data->bus_desc);

odd alignment.

> +	if (!scm_data->nvdimm_bus)
> +		return -EINVAL;
> +
> +	scm_data->scm_res.start = (u64)lpc_mem->start + SCM_LABEL_AREA_SIZE;
> +	scm_data->scm_res.end = (u64)lpc_mem->start + config->lpc_mem_size - 1;
> +	scm_data->scm_res.name = "SCM persistent memory";
> +
> +	set_bit(ND_CMD_GET_CONFIG_SIZE, &nvdimm_cmd_mask);
> +	set_bit(ND_CMD_GET_CONFIG_DATA, &nvdimm_cmd_mask);
> +	set_bit(ND_CMD_SET_CONFIG_DATA, &nvdimm_cmd_mask);
> +
> +	set_bit(NDD_ALIASING, &nvdimm_flags);
> +
> +	snprintf(serial, sizeof(serial), "%llx", fn_config->serial);
> +	nd_mapping_desc.nvdimm = nvdimm_create(scm_data->nvdimm_bus, scm_data,
> +				 scm_dimm_attribute_groups,
> +				 nvdimm_flags, nvdimm_cmd_mask,
> +				 0, NULL);
> +	if (!nd_mapping_desc.nvdimm)
> +		return -ENOMEM;
> +
> +	if (nvdimm_bus_check_dimm_count(scm_data->nvdimm_bus, 1))
> +		return -EINVAL;
> +
> +	nd_mapping_desc.start = scm_data->scm_res.start;
> +	nd_mapping_desc.size = resource_size(&scm_data->scm_res);
> +	nd_mapping_desc.position = 0;
> +
> +	scm_data->nd_set.cookie1 = fn_config->serial + 1; // allow for empty serial
> +	scm_data->nd_set.cookie2 = fn_config->serial + 1;
> +
> +	target_node = of_node_to_nid(scm_data->pdev->dev.of_node);
> +
> +	memset(&region_desc, 0, sizeof(region_desc));
> +	region_desc.res = &scm_data->scm_res;
> +	region_desc.attr_groups = scm_pmem_region_attribute_groups;
> +	region_desc.numa_node = NUMA_NO_NODE;
> +	region_desc.target_node = target_node;
> +	region_desc.num_mappings = 1;
> +	region_desc.mapping = &nd_mapping_desc;
> +	region_desc.nd_set = &scm_data->nd_set;
> +
> +	set_bit(ND_REGION_PAGEMAP, &region_desc.flags);
> +	/*
> +	 * NB: libnvdimm copies the data from ndr_desc into it's own
> +	 * structures so passing a stack pointer is fine.
> +	 */
> +	scm_data->nd_region = nvdimm_pmem_region_create(scm_data->nvdimm_bus,
> +			      &region_desc);
> +	if (!scm_data->nd_region)
> +		return -EINVAL;
> +
> +	dev_info(&scm_data->dev,
> +		 "Onlining %lluMB of persistent memory\n",
> +		 nd_mapping_desc.size / SZ_1M);
> +
> +	return 0;
> +}
> +
> +/**
> + * allocate_scm_minor() - Allocate a minor number to use for an SCM device
> + * @scm_data: The SCM device to associate the minor with
> + * Return: the allocated minor number
> + */
> +static int allocate_scm_minor(struct scm_data *scm_data)
> +{
> +	int minor;
> +
> +	mutex_lock(&minors_idr_lock);
> +	minor = idr_alloc(&minors_idr, scm_data, 0, SCM_NUM_MINORS, GFP_KERNEL);
> +	mutex_unlock(&minors_idr_lock);
> +	return minor;
> +}
> +
> +static void free_scm_minor(struct scm_data *scm_data)
> +{
> +	mutex_lock(&minors_idr_lock);
> +	idr_remove(&minors_idr, MINOR(scm_data->dev.devt));
> +	mutex_unlock(&minors_idr_lock);
> +}
> +
> +/**
> + * free_scm() - Free all members of an SCM struct
> + * @scm_data: the SCM metadata to clear
> + */
> +static void free_scm(struct scm_data *scm_data)
> +{
> +	int rc;
> +
> +	if (scm_data->nvdimm_bus)
> +		nvdimm_bus_unregister(scm_data->nvdimm_bus);
> +
> +	free_scm_minor(scm_data);
> +
> +	if (scm_data->metadata_addr)
> +		devm_memunmap(&scm_data->dev, scm_data->metadata_addr);
> +
> +	if (scm_data->ocxl_context) {
> +		rc = ocxl_context_detach(scm_data->ocxl_context);
> +		if (rc == -EBUSY)
> +			dev_warn(&scm_data->dev, "Timeout detaching ocxl context\n");
> +		else
> +			ocxl_context_free(scm_data->ocxl_context);
> +
> +	}
> +
> +	if (scm_data->ocxl_afu)
> +		ocxl_afu_put(scm_data->ocxl_afu);
> +
> +	if (scm_data->ocxl_fn)
> +		ocxl_function_close(scm_data->ocxl_fn);
> +
> +	kfree(scm_data);
> +}
> +
> +/**
> + * free_scm_dev - Free an SCM device
> + * @dev: The device struct
> + */
> +static void free_scm_dev(struct device *dev)
> +{
> +	struct scm_data *scm_data = container_of(dev, struct scm_data, dev);
> +
> +	free_scm(scm_data);
> +}
> +
> +/**
> + * scm_register - Register an SCM device with the kernel
> + * @scm_data: the SCM metadata
> + * Return: 0 on success, negative on failure
> + */
> +static int scm_register(struct scm_data *scm_data)
> +{
> +	int rc;
> +	int minor = allocate_scm_minor(scm_data);
> +
> +	if (minor < 0)
> +		return minor;
> +
> +	scm_data->dev.release = free_scm_dev;
> +	rc = dev_set_name(&scm_data->dev, "ocxl-scm%d", minor);
> +	if (rc < 0)
> +		return rc;
> +
> +	scm_data->dev.devt = MKDEV(MAJOR(scm_dev), minor);
> +	scm_data->dev.class = scm_class;
> +	scm_data->dev.parent = &scm_data->pdev->dev;
> +
> +	rc = device_register(&scm_data->dev);
> +	return rc;
	return device_register(&scm_data->dev);

Assuming nothing else is added inbetween in later patches...
If it is then ignore this one.

> +}
> +
> +/**
> + * scm_remove() - Free an OpenCAPI Storage Class Memory device
> + * @pdev: the PCI device information struct
> + */
> +static void scm_remove(struct pci_dev *pdev)
> +{
> +	if (PCI_FUNC(pdev->devfn) == 0) {
> +		struct scm_function_0 *scm_func_0 = pci_get_drvdata(pdev);
> +
> +		if (scm_func_0) {
> +			ocxl_function_close(scm_func_0->ocxl_fn);
> +			scm_func_0->ocxl_fn = NULL;
> +		}
> +	} else {
> +		struct scm_data *scm_data = pci_get_drvdata(pdev);
> +
> +		if (scm_data)
> +			device_unregister(&scm_data->dev);
> +	}
> +}
> +
> +/**
> + * scm_probe_function_0 - Set up function 0 for an OpenCAPI Storage Class Memory device
Overly long line + not consistent on () after function name.

IIRC either () or not is fine, but should be consistent in a gven file.

> + * This is important as it enables templates higher than 0 across all other functions,
> + * which in turn enables higher bandwidth accesses
> + * which in turn enables higher bandwidth accesses

Repeated line.

> + * @pdev: the PCI device information struct
> + * Return: 0 on success, negative on failure
> + */
> +static int scm_probe_function_0(struct pci_dev *pdev)
> +{
> +	struct scm_function_0 *scm_func_0 = NULL;
> +	struct ocxl_fn *fn;
> +
> +	scm_func_0 = kzalloc(sizeof(*scm_func_0), GFP_KERNEL);
> +	if (!scm_func_0)
> +		return -ENOMEM;
> +
> +	scm_func_0->pdev = pdev;
> +	fn = ocxl_function_open(pdev);
> +	if (IS_ERR(fn)) {
> +		kfree(scm_func_0);
> +		dev_err(&pdev->dev, "failed to open OCXL function\n");
> +		return PTR_ERR(fn);
> +	}
> +	scm_func_0->ocxl_fn = fn;
> +
> +	pci_set_drvdata(pdev, scm_func_0);
> +
> +	return 0;
> +}
> +
> +/**
> + * scm_probe - Init an OpenCAPI Storage Class Memory device
> + * @pdev: the PCI device information struct
> + * @ent: The entry from scm_pci_tbl
> + * Return: 0 on success, negative on failure
> + */
> +static int scm_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> +{
> +	struct scm_data *scm_data = NULL;

Always set in paths that use it.

> +
> +	if (PCI_FUNC(pdev->devfn) == 0)
> +		return scm_probe_function_0(pdev);
> +	else if (PCI_FUNC(pdev->devfn) != 1)
> +		return 0;
> +
> +	scm_data = kzalloc(sizeof(*scm_data), GFP_KERNEL);
> +	if (!scm_data) {
> +		dev_err(&pdev->dev, "Could not allocate SCM metadata\n");
> +		goto err;
> +	}
> +	scm_data->pdev = pdev;
> +
> +	pci_set_drvdata(pdev, scm_data);
> +
> +	scm_data->ocxl_fn = ocxl_function_open(pdev);
> +	if (IS_ERR(scm_data->ocxl_fn)) {
> +		kfree(scm_data);
> +		scm_data = NULL;

Doesn't seem like scm_data is used anywhere in the rror path..

> +		pci_set_drvdata(pdev, NULL);
> +		dev_err(&pdev->dev, "failed to open OCXL function\n");
> +		goto err;
> +	}
> +
> +	scm_data->ocxl_afu = ocxl_function_fetch_afu(scm_data->ocxl_fn, 0);
> +	if (scm_data->ocxl_afu == NULL) {
> +		dev_err(&pdev->dev, "Could not get OCXL AFU from function\n");
> +		goto err;

The comment below suggests to me that free_scm will only be called if we succeed
in scm_register?  If so isn't there more error handling to be done until that
happens?

> +	}
> +
> +	ocxl_afu_get(scm_data->ocxl_afu);
> +
> +	if (scm_register(scm_data) < 0) {
> +		dev_err(&pdev->dev, "Could not register SCM device with the kernel\n");
> +		goto err;
> +	}
> +
> +	// Resources allocated below here are cleaned up in the release handler
> +
> +	if (ocxl_context_alloc(&scm_data->ocxl_context, scm_data->ocxl_afu, NULL)) {
> +		dev_err(&pdev->dev, "Could not allocate OCXL context\n");
> +		goto err;
> +	}
> +
> +	if (ocxl_context_attach(scm_data->ocxl_context, 0, NULL)) {
> +		dev_err(&pdev->dev, "Could not attach ocxl context\n");
> +		goto err;
> +	}
> +
> +	if (scm_register_lpc_mem(scm_data)) {
> +		dev_err(&pdev->dev, "Could not register OCXL SCM memory with libnvdimm\n");
> +		goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	/*
> +	 * Further cleanup is done in the release handler via free_scm()
> +	 * This allows us to keep the character device live to handle IOCTLs to
> +	 * investigate issues if the card has an error
> +	 */
> +
> +	dev_err(&pdev->dev,
> +		"Error detected, will not register storage class memory\n");
> +	return -ENXIO;

Probably better to return more specific errors from the various error paths.
-ENOMEM etc.


> +}
> +
> +static struct pci_driver scm_pci_driver = {
> +	.name = "ocxl-scm",
> +	.id_table = scm_pci_tbl,
> +	.probe = scm_probe,
> +	.remove = scm_remove,
> +	.shutdown = scm_remove,
> +};
> +
> +static int __init scm_init(void)
> +{
> +	int rc = 0;
> +
> +	rc = pci_register_driver(&scm_pci_driver);
> +	if (rc)
> +		return rc;
> +
> +	return 0;
> +}
> +
> +static void scm_exit(void)
> +{
> +	pci_unregister_driver(&scm_pci_driver);
> +}
> +
> +module_init(scm_init);
> +module_exit(scm_exit);
> +
> +MODULE_DESCRIPTION("Storage Class Memory");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/nvdimm/ocxl/scm_internal.h b/drivers/nvdimm/ocxl/scm_internal.h
> new file mode 100644
> index 000000000000..6340012e0f8a
> --- /dev/null
> +++ b/drivers/nvdimm/ocxl/scm_internal.h
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright 2019 IBM Corp.
> +
> +#include <linux/pci.h>
> +#include <misc/ocxl.h>
> +#include <linux/libnvdimm.h>
> +#include <linux/mm.h>
> +
> +#define SCM_LABEL_AREA_SIZE	(1UL << PA_SECTION_SHIFT)
> +
> +struct scm_function_0 {
> +	struct pci_dev *pdev;
> +	struct ocxl_fn *ocxl_fn;
> +};
> +
> +struct scm_data {
> +	struct device dev;
> +	struct pci_dev *pdev;
> +	struct ocxl_fn *ocxl_fn;
> +	struct nd_interleave_set nd_set;
> +	struct nvdimm_bus_descriptor bus_desc;
> +	struct nvdimm_bus *nvdimm_bus;
> +	struct ocxl_afu *ocxl_afu;
> +	struct ocxl_context *ocxl_context;
> +	void *metadata_addr;
> +	struct resource scm_res;
> +	struct nd_region *nd_region;
> +};


