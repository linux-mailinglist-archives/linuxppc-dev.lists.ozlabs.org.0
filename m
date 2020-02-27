Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F501729AC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 21:48:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48T4WB2TfKzDr86
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 07:48:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48T4Rw1SrbzDrMr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 07:45:15 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01RKjCoL114693
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 15:45:13 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydcnv73hu-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 15:45:13 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Thu, 27 Feb 2020 20:44:53 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 27 Feb 2020 20:44:45 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01RKihpi60620978
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Feb 2020 20:44:43 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66D85A4040;
 Thu, 27 Feb 2020 20:44:43 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D19DA404D;
 Thu, 27 Feb 2020 20:44:42 +0000 (GMT)
Received: from pic2.home (unknown [9.145.9.51])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Feb 2020 20:44:42 +0000 (GMT)
Subject: Re: [PATCH v3 10/27] powerpc: Add driver for OpenCAPI Persistent
 Memory
To: "Alastair D'Silva" <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-11-alastair@au1.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Thu, 27 Feb 2020 21:44:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200221032720.33893-11-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022720-4275-0000-0000-000003A61EC8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022720-4276-0000-0000-000038BA7C15
Message-Id: <da02a596-ce4e-f004-5072-cb3dff0a7484@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-27_07:2020-02-26,
 2020-02-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 spamscore=0 suspectscore=2 mlxscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002270141
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
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Vishal Verma <vishal.l.verma@intel.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/02/2020 à 04:27, Alastair D'Silva a écrit :
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> This driver exposes LPC memory on OpenCAPI pmem cards
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
> ---
>   arch/powerpc/platforms/powernv/Kconfig        |   3 +
>   arch/powerpc/platforms/powernv/Makefile       |   1 +
>   arch/powerpc/platforms/powernv/pmem/Kconfig   |  15 +
>   arch/powerpc/platforms/powernv/pmem/Makefile  |   7 +
>   arch/powerpc/platforms/powernv/pmem/ocxl.c    | 473 ++++++++++++++++++
>   .../platforms/powernv/pmem/ocxl_internal.h    |  28 ++
>   6 files changed, 527 insertions(+)
>   create mode 100644 arch/powerpc/platforms/powernv/pmem/Kconfig
>   create mode 100644 arch/powerpc/platforms/powernv/pmem/Makefile
>   create mode 100644 arch/powerpc/platforms/powernv/pmem/ocxl.c
>   create mode 100644 arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
> 
> diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
> index 938803eab0ad..fc8976af0e52 100644
> --- a/arch/powerpc/platforms/powernv/Kconfig
> +++ b/arch/powerpc/platforms/powernv/Kconfig
> @@ -50,3 +50,6 @@ config PPC_VAS
>   config SCOM_DEBUGFS
>   	bool "Expose SCOM controllers via debugfs"
>   	depends on DEBUG_FS
> +
> +source "arch/powerpc/platforms/powernv/pmem/Kconfig"
> +
> diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
> index c0f8120045c3..0bbd72988b6f 100644
> --- a/arch/powerpc/platforms/powernv/Makefile
> +++ b/arch/powerpc/platforms/powernv/Makefile
> @@ -21,3 +21,4 @@ obj-$(CONFIG_PPC_VAS)	+= vas.o vas-window.o vas-debug.o
>   obj-$(CONFIG_OCXL_BASE)	+= ocxl.o
>   obj-$(CONFIG_SCOM_DEBUGFS) += opal-xscom.o
>   obj-$(CONFIG_PPC_SECURE_BOOT) += opal-secvar.o
> +obj-$(CONFIG_LIBNVDIMM) += pmem/
> diff --git a/arch/powerpc/platforms/powernv/pmem/Kconfig b/arch/powerpc/platforms/powernv/pmem/Kconfig
> new file mode 100644
> index 000000000000..c5d927520920
> --- /dev/null
> +++ b/arch/powerpc/platforms/powernv/pmem/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +if LIBNVDIMM
> +
> +config OCXL_PMEM
> +	tristate "OpenCAPI Persistent Memory"
> +	depends on LIBNVDIMM && PPC_POWERNV && PCI && EEH && ZONE_DEVICE && OCXL
> +	help
> +	  Exposes devices that implement the OpenCAPI Storage Class Memory
> +	  specification as persistent memory regions. You may also want
> +	  DEV_DAX, DEV_DAX_PMEM & FS_DAX if you plan on using DAX devices
> +	  stacked on top of this driver.
> +
> +	  Select N if unsure.
> +
> +endif
> diff --git a/arch/powerpc/platforms/powernv/pmem/Makefile b/arch/powerpc/platforms/powernv/pmem/Makefile
> new file mode 100644
> index 000000000000..1c55c4193175
> --- /dev/null
> +++ b/arch/powerpc/platforms/powernv/pmem/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +ccflags-$(CONFIG_PPC_WERROR)	+= -Werror
> +
> +obj-$(CONFIG_OCXL_PMEM) += ocxlpmem.o
> +
> +ocxlpmem-y := ocxl.o
> diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl.c b/arch/powerpc/platforms/powernv/pmem/ocxl.c
> new file mode 100644
> index 000000000000..3c4eeb5dcc0f
> --- /dev/null
> +++ b/arch/powerpc/platforms/powernv/pmem/ocxl.c
> @@ -0,0 +1,473 @@
> +// SPDX-License-Id
> +// Copyright 2019 IBM Corp.
> +
> +/*
> + * A driver for OpenCAPI devices that implement the Storage Class
> + * Memory specification.
> + */
> +
> +#include <linux/module.h>
> +#include <misc/ocxl.h>
> +#include <linux/ndctl.h>
> +#include <linux/mm_types.h>
> +#include <linux/memory_hotplug.h>
> +#include "ocxl_internal.h"
> +
> +
> +static const struct pci_device_id ocxlpmem_pci_tbl[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_IBM, 0x0625), },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(pci, ocxlpmem_pci_tbl);
> +
> +#define NUM_MINORS 256 // Total to reserve
> +
> +static dev_t ocxlpmem_dev;
> +static struct class *ocxlpmem_class;
> +static struct mutex minors_idr_lock;
> +static struct idr minors_idr;
> +
> +/**
> + * ndctl_config_write() - Handle a ND_CMD_SET_CONFIG_DATA command from ndctl
> + * @ocxlpmem: the device metadata
> + * @command: the incoming data to write
> + * Return: 0 on success, negative on failure
> + */
> +static int ndctl_config_write(struct ocxlpmem *ocxlpmem,
> +			      struct nd_cmd_set_config_hdr *command)
> +{
> +	if (command->in_offset + command->in_length > LABEL_AREA_SIZE)
> +		return -EINVAL;
> +
> +	memcpy_flushcache(ocxlpmem->metadata_addr + command->in_offset, command->in_buf,
> +			  command->in_length);
> +
> +	return 0;
> +}
> +
> +/**
> + * ndctl_config_read() - Handle a ND_CMD_GET_CONFIG_DATA command from ndctl
> + * @ocxlpmem: the device metadata
> + * @command: the read request
> + * Return: 0 on success, negative on failure
> + */
> +static int ndctl_config_read(struct ocxlpmem *ocxlpmem,
> +			     struct nd_cmd_get_config_data_hdr *command)
> +{
> +	if (command->in_offset + command->in_length > LABEL_AREA_SIZE)
> +		return -EINVAL;
> +
> +	memcpy_mcsafe(command->out_buf, ocxlpmem->metadata_addr + command->in_offset,
> +		      command->in_length);
> +
> +	return 0;
> +}
> +
> +/**
> + * ndctl_config_size() - Handle a ND_CMD_GET_CONFIG_SIZE command from ndctl
> + * @command: the read request
> + * Return: 0 on success, negative on failure
> + */
> +static int ndctl_config_size(struct nd_cmd_get_config_size *command)
> +{
> +	command->status = 0;
> +	command->config_size = LABEL_AREA_SIZE;
> +	command->max_xfer = PAGE_SIZE;
> +
> +	return 0;
> +}
> +
> +static int ndctl(struct nvdimm_bus_descriptor *nd_desc,
> +		 struct nvdimm *nvdimm,
> +		 unsigned int cmd, void *buf, unsigned int buf_len, int *cmd_rc)
> +{
> +	struct ocxlpmem *ocxlpmem = container_of(nd_desc, struct ocxlpmem, bus_desc);
> +
> +	switch (cmd) {
> +	case ND_CMD_GET_CONFIG_SIZE:
> +		*cmd_rc = ndctl_config_size(buf);
> +		return 0;
> +
> +	case ND_CMD_GET_CONFIG_DATA:
> +		*cmd_rc = ndctl_config_read(ocxlpmem, buf);
> +		return 0;
> +
> +	case ND_CMD_SET_CONFIG_DATA:
> +		*cmd_rc = ndctl_config_write(ocxlpmem, buf);
> +		return 0;
> +
> +	default:
> +		return -ENOTTY;
> +	}
> +}
> +
> +/**
> + * reserve_metadata() - Reserve space for nvdimm metadata
> + * @ocxlpmem: the device metadata
> + * @lpc_mem: The resource representing the LPC memory of the OpenCAPI device
> + */
> +static int reserve_metadata(struct ocxlpmem *ocxlpmem,
> +			    struct resource *lpc_mem)
> +{
> +	ocxlpmem->metadata_addr = devm_memremap(&ocxlpmem->dev, lpc_mem->start,
> +						LABEL_AREA_SIZE, MEMREMAP_WB);
> +	if (IS_ERR(ocxlpmem->metadata_addr))
> +		return PTR_ERR(ocxlpmem->metadata_addr);
> +
> +	return 0;
> +}
> +
> +/**
> + * register_lpc_mem() - Discover persistent memory on a device and register it with the NVDIMM subsystem
> + * @ocxlpmem: the device metadata
> + * Return: 0 on success
> + */
> +static int register_lpc_mem(struct ocxlpmem *ocxlpmem)
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
> +	rc = ocxl_afu_map_lpc_mem(ocxlpmem->ocxl_afu);
> +	if (rc < 0)
> +		return rc;
> +
> +	lpc_mem = ocxl_afu_lpc_mem(ocxlpmem->ocxl_afu);
> +	if (lpc_mem == NULL || lpc_mem->start == 0)
> +		return -EINVAL;
> +
> +	config = ocxl_afu_config(ocxlpmem->ocxl_afu);
> +	fn_config = ocxl_function_config(ocxlpmem->ocxl_fn);
> +
> +	rc = reserve_metadata(ocxlpmem, lpc_mem);
> +	if (rc)
> +		return rc;
> +
> +	ocxlpmem->bus_desc.provider_name = "ocxl-pmem";
> +	ocxlpmem->bus_desc.ndctl = ndctl;
> +	ocxlpmem->bus_desc.module = THIS_MODULE;
> +
> +	ocxlpmem->nvdimm_bus = nvdimm_bus_register(&ocxlpmem->dev,
> +						   &ocxlpmem->bus_desc);
> +	if (!ocxlpmem->nvdimm_bus)
> +		return -EINVAL;
> +
> +	ocxlpmem->pmem_res.start = (u64)lpc_mem->start + LABEL_AREA_SIZE;
> +	ocxlpmem->pmem_res.end = (u64)lpc_mem->start + config->lpc_mem_size - 1;
> +	ocxlpmem->pmem_res.name = "OpenCAPI persistent memory";
> +
> +	set_bit(ND_CMD_GET_CONFIG_SIZE, &nvdimm_cmd_mask);
> +	set_bit(ND_CMD_GET_CONFIG_DATA, &nvdimm_cmd_mask);
> +	set_bit(ND_CMD_SET_CONFIG_DATA, &nvdimm_cmd_mask);
> +
> +	set_bit(NDD_ALIASING, &nvdimm_flags);
> +
> +	snprintf(serial, sizeof(serial), "%llx", fn_config->serial);
> +	nd_mapping_desc.nvdimm = nvdimm_create(ocxlpmem->nvdimm_bus, ocxlpmem,
> +				 NULL, nvdimm_flags, nvdimm_cmd_mask,
> +				 0, NULL);
> +	if (!nd_mapping_desc.nvdimm)
> +		return -ENOMEM;
> +
> +	if (nvdimm_bus_check_dimm_count(ocxlpmem->nvdimm_bus, 1))
> +		return -EINVAL;
> +
> +	nd_mapping_desc.start = ocxlpmem->pmem_res.start;
> +	nd_mapping_desc.size = resource_size(&ocxlpmem->pmem_res);
> +	nd_mapping_desc.position = 0;
> +
> +	ocxlpmem->nd_set.cookie1 = fn_config->serial + 1; // allow for empty serial
> +	ocxlpmem->nd_set.cookie2 = fn_config->serial + 1;
> +
> +	target_node = of_node_to_nid(ocxlpmem->pdev->dev.of_node);
> +
> +	memset(&region_desc, 0, sizeof(region_desc));
> +	region_desc.res = &ocxlpmem->pmem_res;
> +	region_desc.numa_node = NUMA_NO_NODE;
> +	region_desc.target_node = target_node;
> +	region_desc.num_mappings = 1;
> +	region_desc.mapping = &nd_mapping_desc;
> +	region_desc.nd_set = &ocxlpmem->nd_set;
> +
> +	set_bit(ND_REGION_PAGEMAP, &region_desc.flags);
> +	/*
> +	 * NB: libnvdimm copies the data from ndr_desc into it's own
> +	 * structures so passing a stack pointer is fine.
> +	 */
> +	ocxlpmem->nd_region = nvdimm_pmem_region_create(ocxlpmem->nvdimm_bus,
> +							&region_desc);
> +	if (!ocxlpmem->nd_region)
> +		return -EINVAL;
> +
> +	dev_info(&ocxlpmem->dev,
> +		 "Onlining %lluMB of persistent memory\n",
> +		 nd_mapping_desc.size / SZ_1M);
> +
> +	return 0;
> +}
> +
> +/**
> + * allocate_minor() - Allocate a minor number to use for an OpenCAPI pmem device
> + * @ocxlpmem: the device metadata
> + * Return: the allocated minor number
> + */
> +static int allocate_minor(struct ocxlpmem *ocxlpmem)
> +{
> +	int minor;
> +
> +	mutex_lock(&minors_idr_lock);
> +	minor = idr_alloc(&minors_idr, ocxlpmem, 0, NUM_MINORS, GFP_KERNEL);
> +	mutex_unlock(&minors_idr_lock);
> +	return minor;
> +}
> +
> +static void free_minor(struct ocxlpmem *ocxlpmem)
> +{
> +	mutex_lock(&minors_idr_lock);
> +	idr_remove(&minors_idr, MINOR(ocxlpmem->dev.devt));
> +	mutex_unlock(&minors_idr_lock);
> +}
> +
> +/**
> + * free_ocxlpmem() - Free all members of an ocxlpmem struct
> + * @ocxlpmem: the device struct to clear
> + */
> +static void free_ocxlpmem(struct ocxlpmem *ocxlpmem)
> +{
> +	int rc;
> +
> +	if (ocxlpmem->nvdimm_bus)
> +		nvdimm_bus_unregister(ocxlpmem->nvdimm_bus);
> +
> +	free_minor(ocxlpmem);
> +
> +	if (ocxlpmem->metadata_addr)
> +		devm_memunmap(&ocxlpmem->dev, ocxlpmem->metadata_addr);
> +
> +	if (ocxlpmem->ocxl_context) {
> +		rc = ocxl_context_detach(ocxlpmem->ocxl_context);
> +		if (rc == -EBUSY)
> +			dev_warn(&ocxlpmem->dev, "Timeout detaching ocxl context\n");
> +		else
> +			ocxl_context_free(ocxlpmem->ocxl_context);
> +
> +	}
> +
> +	if (ocxlpmem->ocxl_afu)
> +		ocxl_afu_put(ocxlpmem->ocxl_afu);
> +
> +	if (ocxlpmem->ocxl_fn)
> +		ocxl_function_close(ocxlpmem->ocxl_fn);
> +
> +	kfree(ocxlpmem);
> +}
> +
> +/**
> + * free_ocxlpmem_dev() - Free an OpenCAPI persistent memory device
> + * @dev: The device struct
> + */
> +static void free_ocxlpmem_dev(struct device *dev)
> +{
> +	struct ocxlpmem *ocxlpmem = container_of(dev, struct ocxlpmem, dev);
> +
> +	free_ocxlpmem(ocxlpmem);
> +}
> +
> +/**
> + * ocxlpmem_register() - Register an OpenCAPI pmem device with the kernel
> + * @ocxlpmem: the device metadata
> + * Return: 0 on success, negative on failure
> + */
> +static int ocxlpmem_register(struct ocxlpmem *ocxlpmem)
> +{
> +	int rc;
> +	int minor = allocate_minor(ocxlpmem);
> +
> +	if (minor < 0)
> +		return minor;
> +
> +	ocxlpmem->dev.release = free_ocxlpmem_dev;
> +	rc = dev_set_name(&ocxlpmem->dev, "ocxlpmem%d", minor);
> +	if (rc < 0)
> +		return rc;
> +
> +	ocxlpmem->dev.devt = MKDEV(MAJOR(ocxlpmem_dev), minor);
> +	ocxlpmem->dev.class = ocxlpmem_class;



This function, as well as allocate_minor() and free_minor() above 
reference resources (the IDR, the file class, ...) which are not 
initialized yet. The function file_init() is coming in a later patch.



> +	ocxlpmem->dev.parent = &ocxlpmem->pdev->dev;
> +
> +	return device_register(&ocxlpmem->dev);
> +}
> +
> +/**
> + * ocxlpmem_remove() - Free an OpenCAPI persistent memory device
> + * @pdev: the PCI device information struct
> + */
> +static void ocxlpmem_remove(struct pci_dev *pdev)
> +{
> +	if (PCI_FUNC(pdev->devfn) == 0) {
> +		struct ocxlpmem_function0 *func0 = pci_get_drvdata(pdev);
> +
> +		if (func0) {
> +			ocxl_function_close(func0->ocxl_fn);
> +			func0->ocxl_fn = NULL;
> +		}



The struct ocxlpmem_function0 allocated on probe() should be freed.



> +	} else {
> +		struct ocxlpmem *ocxlpmem = pci_get_drvdata(pdev);
> +
> +		if (ocxlpmem)
> +			device_unregister(&ocxlpmem->dev);
> +	}
> +}
> +
> +/**
> + * probe_function0() - Set up function 0 for an OpenCAPI persistent memory device
> + * This is important as it enables templates higher than 0 across all other functions,
> + * which in turn enables higher bandwidth accesses
> + * @pdev: the PCI device information struct
> + * Return: 0 on success, negative on failure
> + */
> +static int probe_function0(struct pci_dev *pdev)
> +{
> +	struct ocxlpmem_function0 *func0 = NULL;
> +	struct ocxl_fn *fn;
> +
> +	func0 = kzalloc(sizeof(*func0), GFP_KERNEL);
> +	if (!func0)
> +		return -ENOMEM;
> +
> +	func0->pdev = pdev;



Storing the struct pci_dev for function 0 appears to be useless.



> +	fn = ocxl_function_open(pdev);
> +	if (IS_ERR(fn)) {
> +		kfree(func0);
> +		dev_err(&pdev->dev, "failed to open OCXL function\n");
> +		return PTR_ERR(fn);
> +	}
> +	func0->ocxl_fn = fn;
> +
> +	pci_set_drvdata(pdev, func0);
> +
> +	return 0;
> +}
> +
> +/**
> + * probe() - Init an OpenCAPI persistent memory device
> + * @pdev: the PCI device information struct
> + * @ent: The entry from ocxlpmem_pci_tbl
> + * Return: 0 on success, negative on failure
> + */
> +static int probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> +{
> +	struct ocxlpmem *ocxlpmem;
> +	int rc;
> +
> +	if (PCI_FUNC(pdev->devfn) == 0)
> +		return probe_function0(pdev);
> +	else if (PCI_FUNC(pdev->devfn) != 1)
> +		return 0;
> +
> +	ocxlpmem = kzalloc(sizeof(*ocxlpmem), GFP_KERNEL);
> +	if (!ocxlpmem) {
> +		dev_err(&pdev->dev, "Could not allocate OpenCAPI persistent memory metadata\n");
> +		rc = -ENOMEM;
> +		goto err;
> +	}
> +	ocxlpmem->pdev = pdev;


We should probably call pci_dev_get() here if we store the struct 
pci_dev pointer. We could debate how useful it really is, considering 
we're registering a device, which will also take a reference, but it 
looks like the safe thing to do considering all those resources don't 
have exactly the same life cycle and it is standard practice to 
guarantee that we won't have a dangling pointer.



> +
> +	pci_set_drvdata(pdev, ocxlpmem);
> +
> +	ocxlpmem->ocxl_fn = ocxl_function_open(pdev);
> +	if (IS_ERR(ocxlpmem->ocxl_fn)) {
> +		kfree(ocxlpmem);


ocxlpmem is freed...


> +		pci_set_drvdata(pdev, NULL);
> +		dev_err(&pdev->dev, "failed to open OCXL function\n");
> +		rc = PTR_ERR(ocxlpmem->ocxl_fn);


... and then referenced.



> +		goto err;
> +	}
> +
> +	ocxlpmem->ocxl_afu = ocxl_function_fetch_afu(ocxlpmem->ocxl_fn, 0);
> +	if (ocxlpmem->ocxl_afu == NULL) {
> +		dev_err(&pdev->dev, "Could not get OCXL AFU from function\n");


The error path here should match the above, to free struct ocxlpmem.


> +		rc = -ENXIO;
> +		goto err;
> +	}
> +
> +	ocxl_afu_get(ocxlpmem->ocxl_afu);
> +
> +	// Resources allocated below here are cleaned up in the release handler
> +
> +	rc = ocxlpmem_register(ocxlpmem);
> +	if (rc) {
> +		dev_err(&pdev->dev, "Could not register OpenCAPI persistent memory device with the kernel\n");
> +		goto err;
> +	}
> +
> +	rc = ocxl_context_alloc(&ocxlpmem->ocxl_context, ocxlpmem->ocxl_afu, NULL);
> +	if (rc) {
> +		dev_err(&pdev->dev, "Could not allocate OCXL context\n");
> +		goto err;
> +	}
> +
> +	rc = ocxl_context_attach(ocxlpmem->ocxl_context, 0, NULL);
> +	if (rc) {
> +		dev_err(&pdev->dev, "Could not attach ocxl context\n");
> +		goto err;
> +	}
> +
> +	rc = register_lpc_mem(ocxlpmem);
> +	if (rc) {
> +		dev_err(&pdev->dev, "Could not register OpenCAPI persistent memory with libnvdimm\n");
> +		goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	/*
> +	 * Further cleanup is done in the release handler via free_ocxlpmem()
> +	 * This allows us to keep the character device live to handle IOCTLs to
> +	 * investigate issues if the card has an error
> +	 */


If we fail probe, we don't call device_unregister() and the data 
structures will never be freed. The comment seems to indicate it's done 
on purpose but that looks suprising and wrong. If we fail probe, the 
kernel thinks the driver it _not_ handling the device, so we need to 
exit probe() cleanly. We're not supposed to be able to make some debug 
ioctl calls. Once we fail probe, the kernel is free to do whatever it 
wants with the pci device. If you manage to extract some debug info 
during development, then fine, but it's not something we can rely on and 
upstream.
If the card enters an error state after probe(), then we don't need that 
anyway. We have all the time in the world to call ioctl's, as long as we 
don't call the remove callback of the driver.




> +
> +	dev_err(&pdev->dev,
> +		"Error detected, will not register OpenCAPI persistent memory\n");
> +	return rc;
> +}
> +
> +static struct pci_driver pci_driver = {
> +	.name = "ocxl-pmem",
> +	.id_table = ocxlpmem_pci_tbl,
> +	.probe = probe,
> +	.remove = ocxlpmem_remove,
> +	.shutdown = ocxlpmem_remove,



nitpick: why doesn't the probe callback follow the same naming 
convention? It's all static and doesn't really matter, but...

   Fred



> +};
> +
> +static int __init ocxlpmem_init(void)
> +{
> +	int rc = 0;
> +
> +	rc = pci_register_driver(&pci_driver);
> +	if (rc)
> +		return rc;
> +
> +	return 0;
> +}
> +
> +static void ocxlpmem_exit(void)
> +{
> +	pci_unregister_driver(&pci_driver);
> +}
> +
> +module_init(ocxlpmem_init);
> +module_exit(ocxlpmem_exit);
> +
> +MODULE_DESCRIPTION("OpenCAPI Persistent Memory");
> +MODULE_LICENSE("GPL");
> diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
> new file mode 100644
> index 000000000000..0faf3740e9b8
> --- /dev/null
> +++ b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright 2019 IBM Corp.
> +
> +#include <linux/pci.h>
> +#include <misc/ocxl.h>
> +#include <linux/libnvdimm.h>
> +#include <linux/mm.h>
> +
> +#define LABEL_AREA_SIZE	(1UL << PA_SECTION_SHIFT)
> +
> +struct ocxlpmem_function0 {
> +	struct pci_dev *pdev;
> +	struct ocxl_fn *ocxl_fn;
> +};
> +
> +struct ocxlpmem {
> +	struct device dev;
> +	struct pci_dev *pdev;
> +	struct ocxl_fn *ocxl_fn;
> +	struct nd_interleave_set nd_set;
> +	struct nvdimm_bus_descriptor bus_desc;
> +	struct nvdimm_bus *nvdimm_bus;
> +	struct ocxl_afu *ocxl_afu;
> +	struct ocxl_context *ocxl_context;
> +	void *metadata_addr;
> +	struct resource pmem_res;
> +	struct nd_region *nd_region;
> +};
> 

