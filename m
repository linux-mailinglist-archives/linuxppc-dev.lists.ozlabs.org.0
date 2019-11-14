Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 044E1FC835
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 14:56:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DNM95jmnzF3R6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 00:56:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DN1z6QcDzF33j
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 00:41:59 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xAEDWNfN015268
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 08:41:50 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2w9749jmdj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 08:41:48 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Thu, 14 Nov 2019 13:41:45 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 14 Nov 2019 13:41:37 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAEDfZDD48955474
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Nov 2019 13:41:35 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A15F0A404D;
 Thu, 14 Nov 2019 13:41:35 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BD14A4040;
 Thu, 14 Nov 2019 13:41:34 +0000 (GMT)
Received: from pic2.home (unknown [9.145.79.162])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 14 Nov 2019 13:41:34 +0000 (GMT)
Subject: Re: [PATCH 08/10] nvdimm: Add driver for OpenCAPI Storage Class Memory
To: "Alastair D'Silva" <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20191025044721.16617-1-alastair@au1.ibm.com>
 <20191025044721.16617-9-alastair@au1.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Thu, 14 Nov 2019 14:41:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191025044721.16617-9-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19111413-0016-0000-0000-000002C39DF6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111413-0017-0000-0000-00003325400F
Message-Id: <8232c1a6-d52a-6c32-6178-de082174a92a@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-14_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911140125
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
Cc: Oscar Salvador <osalvador@suse.com>, Michal Hocko <mhocko@suse.com>,
 David Hildenbrand <david@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Wei Yang <richard.weiyang@gmail.com>, Keith Busch <keith.busch@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 Dave Jiang <dave.jiang@intel.com>, linux-nvdimm@lists.01.org,
 Vishal Verma <vishal.l.verma@intel.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 Qian Cai <cai@lca.pw>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Alastair,

The patch is huge and could/should probably be split in smaller pieces 
to ease the review. However, having sinned on that same topic in the 
past, I made a first pass anyway. I haven't covered everything but tried 
to focus on the general setup of the driver for now.
Since the patch is very long, I'm writing all the comments in one chunk 
here instead of spreading them over a few thousand lines, where some 
would be easy to miss.


Update MAINTAINERS for the new files

Have you discussed with the directory owner if it's ok to split the 
driver over several files?


Kconfig
=======
Does it make sense to keep OCXL_SCM_DEBUG separate? Why not enabling it 
by default?


ocxl_scm.c
==========

scm_file_init()
---------------
on error paths, should call idr_destroy() (same pb found in base ocxl 
driver)


scm_probe() and _function_0()
-----------------------------

The different init between function 0 and 1 looks a bit off and it seems 
they could be unified. Function 1 does the same thing as function 0 
(call ocxl_function_open()) then some AFU-specific init, which we could 
skip if there's no AFU found on the function. And log a WARN if we find 
an AFU on something else than function 1, since, unlike ocxl, we know 
exactly what the device is like for SCM. But keep an common probe() 
function. It would also simplify the flow on scm_remove() and avoid 
problems (currently ocxl_function_close() is not called for function 1).

scm-data->timeouts: array of size 9 declared, we only init 7 members. 
With the zalloc() the others are at 0, is that correct?


Something looks wrong regarding data release in the error path(s). IIUC, 
we register the device early and rely on the release callback of the 
device to free all resources (in free_scm_dev()). We should probably 
have a comment in probe() to make it obvious. Or maybe better, have a 
subfunction to keep doing the rest of the inits which are dependent on 
the device release to be cleaned up. In the subsequent error paths in 
scm_probe(), we are missing a device_unregister()

Could log 120 times the same "Waiting for SCM to become usable" message, 
which is not really helping much.


free_scm()
---------
Related to above comment in probe(), it would help to be able to easily 
match the what's done in probe vs. undone here. For example, in probe(), 
there's scm_setup_irq(), where we do all things related to interrupts. 
But we don't have a subfunction to clean the interrupts state. It would 
help for readability and track potential misses. I didn't tried to match 
all of them, but the following calls seem missing:

ocxl_context_detach()
ocxl_afu_irq_free()


ocxl_remove()
-------------
see comment above about unifying function 0 and 1 case.
Why is nvdimm_bus_unregister() treated separately? Can't it be part of 
the "normal" freeing of resources done implicitly when calling 
device_unregister() in the free_scm() callback?


scm_setup_device_metadata()
---------------------------
function doesn't do any setup, so the name is misleading.

	for (i = 0; i < 8; i++)
		scm_data->fw_version[i] = (val >> (i * 8)) & 0xff;
=> looks like an endianess conversion? Can't we use the OCXL_BIG_ENDIAN 
when doing the mmio read?


scm_setup_irq()
---------------
if ocxl_afu_irq_get_addr(irq 1) or the ioremap(irq 1) fail, we jump to 
the label 'out_irq0' and will exit the function with rc = 0, instead of 
failing.



scm_setup_command_metadata()
----------------------------
it would make sense to initialize the mutex in the struct 
command_metadata in this function instead of the top of scm_probe(), to 
group all the related data inits.



scm_probe_function_0()
----------------------
comment above function:
  * This is important as it enables higher than 0 across all other 
functions,
  * which in turn enables higher bandwidth accesses

"higher than 0"?
I'm guessing you want to say function 0 configures the link, to ensure 
maximum bandwidth

EFAULT is usually reserved for an invalid memory access. Why not 
PTR_ERR() of the returned value from ocxl_function_open()?



struct scm_fops has a wrong indentation (spaces between .open and '=')



scm_heartbeat()
---------------
the "goto out" at the end of the good path is useless and unusual in the 
kernel, I think.


scm_register_lpc_mem()
----------------------
lpc_mem = ocxl_afu_lpc_mem(scm_data->ocxl_afu);
=> lpc_mem is allocated as part of the afu structure in ocxl, so that 
shouldn't be NULL. Still worth keeping, but I think lpc_mem->start is 
what really needs testing


scm_imn0_handler()
-----------------
I don't think we should return IRQ_NONE. As far as the kernel is 
concerned, an interrupt was raised. So it should be acknowledged, even 
if the fgpa is somehow in an incorrect state. So the IRQ_NONE should be 
IRQ_HANDLED


scm_imn1_handler()
------------------
for the sake of clarity, the potential error when calling scm_chi() 
should be treated the same in the 2 handlers.
What's the effect of nvdimm_bus_unregister() on any application using 
the memory?


#ifdef CONFIG_OCXL_SCM_DEBUG
It's usual and it helps navigate the code, to comment the config macro 
on the else and endif lines:
#endif /* CONFIG_OCXL_SCM_DEBUG */




ocxl-scm_internal.c
====================

scm_admin_command_request
-------------------------
Hardening: would it make sense to test and error out if the ACRA bit 
(used to test command is complete) is at 0 before submitting a new request?


scm_admin_command_complete_timeout
----------------------------------
A delay of 32ms is not that usual. A comment explaining why would be 
interesting.

Why timeout++ ?



ocxl-scm_sysfs.c
================
No reason to export the scm_sysfs_add symbol



ocxl_scm.h
==========
struct scm_ioctl_error_log:
char  fw_revision[8+1]
exposed to uncontrolled padding, which is a problem for a KABI
Remove the extra char?



memory_hotplug.c
================
whitespace diff shouldn't be here


   Fred


Le 25/10/2019 à 06:47, Alastair D'Silva a écrit :
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> This driver exposes LPC memory on OpenCAPI SCM cards
> as an NVDIMM, allowing the existing nvram infrastructure
> to be used.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>   drivers/nvdimm/Kconfig             |   17 +
>   drivers/nvdimm/Makefile            |    3 +
>   drivers/nvdimm/ocxl-scm.c          | 2210 ++++++++++++++++++++++++++++
>   drivers/nvdimm/ocxl-scm_internal.c |  232 +++
>   drivers/nvdimm/ocxl-scm_internal.h |  331 +++++
>   drivers/nvdimm/ocxl-scm_sysfs.c    |  219 +++
>   include/uapi/linux/ocxl-scm.h      |  128 ++
>   mm/memory_hotplug.c                |    2 +-
>   8 files changed, 3141 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/nvdimm/ocxl-scm.c
>   create mode 100644 drivers/nvdimm/ocxl-scm_internal.c
>   create mode 100644 drivers/nvdimm/ocxl-scm_internal.h
>   create mode 100644 drivers/nvdimm/ocxl-scm_sysfs.c
>   create mode 100644 include/uapi/linux/ocxl-scm.h
> 
> diff --git a/drivers/nvdimm/Kconfig b/drivers/nvdimm/Kconfig
> index 36af7af6b7cf..e4f7b6b08efd 100644
> --- a/drivers/nvdimm/Kconfig
> +++ b/drivers/nvdimm/Kconfig
> @@ -130,4 +130,21 @@ config NVDIMM_TEST_BUILD
>   	  core devm_memremap_pages() implementation and other
>   	  infrastructure.
>   
> +config OCXL_SCM
> +	tristate "OpenCAPI Storage Class Memory"
> +	depends on LIBNVDIMM
> +	select ZONE_DEVICE
> +	select OCXL
> +	help
> +	  Exposes devices that implement the OpenCAPI Storage Class Memory
> +	  specification as persistent memory regions.
> +
> +	  Select N if unsure.
> +
> +config OCXL_SCM_DEBUG
> +	bool "OpenCAPI Storage Class Memory debugging"
> +	depends on OCXL_SCM
> +	help
> +	  Enables low level IOCTLs for OpenCAPI SCM firmware development
> +
>   endif
> diff --git a/drivers/nvdimm/Makefile b/drivers/nvdimm/Makefile
> index 29203f3d3069..43d826397bfc 100644
> --- a/drivers/nvdimm/Makefile
> +++ b/drivers/nvdimm/Makefile
> @@ -6,6 +6,9 @@ obj-$(CONFIG_ND_BLK) += nd_blk.o
>   obj-$(CONFIG_X86_PMEM_LEGACY) += nd_e820.o
>   obj-$(CONFIG_OF_PMEM) += of_pmem.o
>   obj-$(CONFIG_VIRTIO_PMEM) += virtio_pmem.o nd_virtio.o
> +obj-$(CONFIG_OCXL_SCM) += ocxlscm.o
> +
> +ocxlscm-y := ocxl-scm.o ocxl-scm_internal.o ocxl-scm_sysfs.o
>   
>   nd_pmem-y := pmem.o
>   
> diff --git a/drivers/nvdimm/ocxl-scm.c b/drivers/nvdimm/ocxl-scm.c
> new file mode 100644
> index 000000000000..f4e6cc022de8
> --- /dev/null
> +++ b/drivers/nvdimm/ocxl-scm.c
> @@ -0,0 +1,2210 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright 2019 IBM Corp.
> +
> +/*
> + * A driver for Storage Class Memory, connected via OpenCAPI
> + */
> +
> +#include <linux/module.h>
> +#include <misc/ocxl.h>
> +#include <linux/delay.h>
> +#include <linux/ndctl.h>
> +#include <linux/eventfd.h>
> +#include <linux/fs.h>
> +#include <linux/mm_types.h>
> +#include <linux/memory_hotplug.h>
> +#include "ocxl-scm_internal.h"
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
> +#define SCM_USABLE_TIMEOUT 120 // seconds
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
> +	memcpy(command->out_buf, scm_data->metadata_addr + command->in_offset,
> +	       command->in_length);
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
> +static int read_smart_attrib(struct scm_data *scm_data, u16 offset,
> +			     struct scm_smart_attribs *attribs)
> +{
> +	u64 val;
> +	int rc;
> +	struct scm_smart_attrib *attrib;
> +	u8 attrib_id;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu, offset, OCXL_LITTLE_ENDIAN,
> +				     &val);
> +	if (rc)
> +		return rc;
> +
> +	attrib_id = (val >> 56) & 0xff;
> +	switch (attrib_id) {
> +	case SCM_SMART_ATTR_POWER_ON_HOURS:
> +		attrib = &attribs->power_on_hours;
> +		break;
> +
> +	case SCM_SMART_ATTR_TEMPERATURE:
> +		attrib = &attribs->temperature;
> +		break;
> +
> +	case SCM_SMART_ATTR_LIFE_REMAINING:
> +		attrib = &attribs->life_remaining;
> +		break;
> +
> +	default:
> +		dev_err(&scm_data->dev, "Unknown smart attrib '%d'", attrib_id);
> +		return -EFAULT;
> +	}
> +
> +	attrib->id = attrib_id;
> +	attrib->attribute_flags = (val >> 40) & 0xffff;
> +	attrib->current_val = (val >> 32) & 0xff;
> +	attrib->threshold_val = (val >> 24) & 0xff;
> +	attrib->worst_val = (val >> 16) & 0xff;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu, offset + 0x08,
> +				     OCXL_LITTLE_ENDIAN, &val);
> +	if (rc)
> +		return rc;
> +
> +	attrib->raw_val = val;
> +
> +	return 0;
> +}
> +
> +static int scm_smart_offset_0x00(struct scm_data *scm_data, u32 *length)
> +{
> +	int rc;
> +	u64 val;
> +
> +	u16 data_identifier;
> +	u32 data_length;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +				     scm_data->admin_command.data_offset,
> +				     OCXL_LITTLE_ENDIAN, &val);
> +	if (rc)
> +		return rc;
> +
> +	data_identifier = val >> 48;
> +	data_length = val & 0xFFFFFFFF;
> +
> +	if (data_identifier != 0x534D) {
> +		dev_err(&scm_data->dev,
> +			"Bad data identifier for smart data, expected 'SM', got '%-.*s'\n",
> +			2, (char *)&data_identifier);
> +		return -EFAULT;
> +	}
> +
> +	*length = data_length;
> +	return 0;
> +}
> +
> +static int scm_smart_update(struct scm_data *scm_data)
> +{
> +	u32 length, i;
> +	int rc;
> +
> +	mutex_lock(&scm_data->admin_command.lock);
> +
> +	rc = scm_admin_command_request(scm_data, ADMIN_COMMAND_SMART);
> +	if (rc)
> +		goto out;
> +
> +	rc = scm_admin_command_execute(scm_data);
> +	if (rc)
> +		goto out;
> +
> +	rc = scm_admin_command_complete_timeout(scm_data, ADMIN_COMMAND_SMART);
> +	if (rc < 0) {
> +		dev_err(&scm_data->dev, "SMART timeout\n");
> +		goto out;
> +	}
> +
> +	rc = scm_admin_response(scm_data);
> +	if (rc < 0)
> +		goto out;
> +	if (rc != STATUS_SUCCESS) {
> +		scm_warn_status(scm_data, "Unexpected status from SMART", rc);
> +		goto out;
> +	}
> +
> +	rc = scm_smart_offset_0x00(scm_data, &length);
> +	if (rc)
> +		goto out;
> +
> +	length /= 0x10; // Length now contains the number of attributes
> +
> +	for (i = 0; i < length; i++)
> +		read_smart_attrib(scm_data,
> +				  scm_data->admin_command.data_offset + 0x08 + i * 0x10,
> +				  &scm_data->smart);
> +
> +	rc = scm_admin_response_handled(scm_data);
> +	if (rc)
> +		goto out;
> +
> +	rc = 0;
> +	goto out;
> +
> +out:
> +	mutex_unlock(&scm_data->admin_command.lock);
> +	return rc;
> +}
> +
> +static int scm_ndctl_smart(struct scm_data *scm_data, void *buf,
> +			   unsigned int buf_len)
> +{
> +	int rc;
> +
> +	if (buf_len != sizeof(scm_data->smart))
> +		return -EINVAL;
> +
> +	rc = scm_smart_update(scm_data);
> +	if (rc)
> +		return rc;
> +
> +	memcpy(buf, &scm_data->smart, buf_len);
> +
> +	return 0;
> +}
> +
> +
> +static int scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
> +		     struct nvdimm *nvdimm,
> +		     unsigned int cmd, void *buf, unsigned int buf_len, int *cmd_rc)
> +{
> +	struct scm_data *scm_data = container_of(nd_desc, struct scm_data, bus_desc);
> +
> +	switch (cmd) {
> +	case ND_CMD_SMART:
> +		*cmd_rc = scm_ndctl_smart(scm_data, buf, buf_len);
> +		return 0;
> +
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
> +	.name = "scm",
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
> + * scm_overwrite() - Overwrite all data on the card
> + * @scm_data: The SCM device data
> + * Return: 0 on success
> + */
> +int scm_overwrite(struct scm_data *scm_data)
> +{
> +	int rc;
> +
> +	mutex_lock(&scm_data->ns_command.lock);
> +
> +	rc = scm_ns_command_request(scm_data, NS_COMMAND_SECURE_ERASE);
> +	if (rc)
> +		goto out;
> +
> +	rc = scm_ns_command_execute(scm_data);
> +	if (rc)
> +		goto out;
> +
> +	scm_data->overwrite_state = SCM_OVERWRITE_BUSY;
> +
> +	return 0;
> +
> +out:
> +	mutex_unlock(&scm_data->ns_command.lock);
> +	return rc;
> +}
> +
> +/**
> + * scm_secop_overwrite() - Overwrite all data on the card
> + * @nvdimm: The nvdimm representation of the SCM device to start the overwrite on
> + * @key_data: Unused (no security key implementation)
> + * Return: 0 on success
> + */
> +static int scm_secop_overwrite(struct nvdimm *nvdimm,
> +			       const struct nvdimm_key_data *key_data)
> +{
> +	struct scm_data *scm_data = nvdimm_provider_data(nvdimm);
> +
> +	return scm_overwrite(scm_data);
> +}
> +
> +/**
> + * scm_secop_query_overwrite() - Get the current overwrite state
> + * @nvdimm: The nvdimm representation of the SCM device to start the overwrite on
> + * Return: 0 if successful or idle, -EBUSY if busy, -EFAULT if failed
> + */
> +static int scm_secop_query_overwrite(struct nvdimm *nvdimm)
> +{
> +	struct scm_data *scm_data = nvdimm_provider_data(nvdimm);
> +
> +	if (scm_data->overwrite_state == SCM_OVERWRITE_BUSY)
> +		return -EBUSY;
> +
> +	if (scm_data->overwrite_state == SCM_OVERWRITE_FAILED)
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +/**
> + * scm_secop_get_flags() - return the security flags for the SCM device
> + */
> +static unsigned long scm_secop_get_flags(struct nvdimm *nvdimm,
> +		enum nvdimm_passphrase_type ptype)
> +{
> +	struct scm_data *scm_data = nvdimm_provider_data(nvdimm);
> +
> +	if (scm_data->overwrite_state == SCM_OVERWRITE_BUSY)
> +		return BIT(NVDIMM_SECURITY_OVERWRITE);
> +
> +	return BIT(NVDIMM_SECURITY_DISABLED);
> +}
> +
> +static const struct nvdimm_security_ops sec_ops  = {
> +	.get_flags = scm_secop_get_flags,
> +	.overwrite = scm_secop_overwrite,
> +	.query_overwrite = scm_secop_query_overwrite,
> +};
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
> +	if (lpc_mem == NULL)
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
> +	scm_data->bus_desc.provider_name = "scm";
> +	scm_data->bus_desc.ndctl = scm_ndctl;
> +	scm_data->bus_desc.module = THIS_MODULE;
> +
> +	scm_data->nvdimm_bus = nvdimm_bus_register(&scm_data->dev,
> +			       &scm_data->bus_desc);
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
> +	set_bit(ND_CMD_SMART, &nvdimm_cmd_mask);
> +
> +	set_bit(NDD_ALIASING, &nvdimm_flags);
> +
> +	snprintf(serial, sizeof(serial), "%llx", fn_config->serial);
> +	nd_mapping_desc.nvdimm = __nvdimm_create(scm_data->nvdimm_bus, scm_data,
> +				 scm_dimm_attribute_groups,
> +				 nvdimm_flags, nvdimm_cmd_mask,
> +				 0, NULL, serial, &sec_ops);
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
> + * scm_is_memory_available() - Does the controller have memory available?
> + * @scm_data: a pointer to the SCM device data
> + * Return: true if the controller has memory available
> + */
> +static bool scm_is_memory_available(const struct scm_data *scm_data)
> +{
> +	u64 val = 0;
> +	int rc = scm_chi(scm_data, &val);
> +
> +	WARN_ON(rc < 0);
> +
> +	return (val & GLOBAL_MMIO_CHI_MA) != 0;
> +}
> +
> +/**
> + * scm_extract_command_metadata() - Extract command data from MMIO & save it for further use
> + * @scm_data: a pointer to the SCM device data
> + * @offset: The base address of the command data structures (address of CREQO)
> + * @command_metadata: A pointer to the command metadata to populate
> + * Return: 0 on success, negative on failure
> + */
> +static int scm_extract_command_metadata(struct scm_data *scm_data, u32 offset,
> +					struct command_metadata *command_metadata)
> +{
> +	int rc;
> +	u64 tmp;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu, offset, OCXL_LITTLE_ENDIAN,
> +				     &tmp);
> +	if (rc)
> +		return rc;
> +
> +	command_metadata->request_offset = tmp >> 32;
> +	command_metadata->response_offset = tmp & 0xFFFFFFFF;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu, offset + 8, OCXL_LITTLE_ENDIAN,
> +				     &tmp);
> +	if (rc)
> +		return rc;
> +
> +	command_metadata->data_offset = tmp >> 32;
> +	command_metadata->data_size = tmp & 0xFFFFFFFF;
> +
> +	command_metadata->id = 0;
> +
> +	return 0;
> +}
> +
> +/**
> + * scm_setup_command_metadata() - Set up the command metadata
> + * @scm_data: a pointer to the SCM device data
> + */
> +static int scm_setup_command_metadata(struct scm_data *scm_data)
> +{
> +	int rc;
> +
> +	rc = scm_extract_command_metadata(scm_data, GLOBAL_MMIO_ACMA_CREQO,
> +					  &scm_data->admin_command);
> +	if (rc)
> +		return rc;
> +
> +	rc = scm_extract_command_metadata(scm_data, GLOBAL_MMIO_NSCMA_CREQO,
> +					  &scm_data->ns_command);
> +	if (rc)
> +		return rc;
> +
> +	return 0;
> +}
> +
> +/**
> + * scm_heartbeat() - Issue a heartbeat command to the controller
> + * @scm_data: a pointer to the SCM device data
> + * Return: 0 if the controller responded correctly, negative on error
> + */
> +static int scm_heartbeat(struct scm_data *scm_data)
> +{
> +	int rc;
> +
> +	mutex_lock(&scm_data->admin_command.lock);
> +
> +	rc = scm_admin_command_request(scm_data, ADMIN_COMMAND_HEARTBEAT);
> +	if (rc)
> +		goto out;
> +
> +	rc = scm_admin_command_execute(scm_data);
> +	if (rc)
> +		goto out;
> +
> +	rc = scm_admin_command_complete_timeout(scm_data, ADMIN_COMMAND_HEARTBEAT);
> +	if (rc < 0) {
> +		dev_err(&scm_data->dev, "Heartbeat timeout\n");
> +		goto out;
> +	}
> +
> +	rc = scm_admin_response(scm_data);
> +	if (rc < 0)
> +		goto out;
> +	if (rc != STATUS_SUCCESS)
> +		scm_warn_status(scm_data, "Unexpected status from heartbeat", rc);
> +
> +	rc = scm_admin_response_handled(scm_data);
> +
> +	goto out;
> +
> +out:
> +	mutex_unlock(&scm_data->admin_command.lock);
> +	return rc;
> +}
> +
> +/**
> + * scm_is_usable() - Is a controller usable?
> + * @scm_data: a pointer to the SCM device data
> + * Return: true if the controller is usable
> + */
> +static bool scm_is_usable(const struct scm_data *scm_data)
> +{
> +	if (!scm_controller_is_ready(scm_data)) {
> +		dev_err(&scm_data->dev, "SCM controller is not ready.\n");
> +		return false;
> +	}
> +
> +	if (!scm_is_memory_available(scm_data)) {
> +		dev_err(&scm_data->dev,
> +			"SCM controller does not have memory available.\n");
> +		return false;
> +	}
> +
> +	return true;
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
> +	// Disable doorbells
> +	(void)ocxl_global_mmio_set64(scm_data->ocxl_afu, GLOBAL_MMIO_CHIEC,
> +				     OCXL_LITTLE_ENDIAN,
> +				     GLOBAL_MMIO_CHI_ALL);
> +
> +	free_scm_minor(scm_data);
> +
> +	if (scm_data->irq_addr[1])
> +		iounmap(scm_data->irq_addr[1]);
> +
> +	if (scm_data->irq_addr[0])
> +		iounmap(scm_data->irq_addr[0]);
> +
> +	if (scm_data->cdev.owner)
> +		cdev_del(&scm_data->cdev);
> +
> +	if (scm_data->metadata_addr)
> +		devm_memunmap(&scm_data->dev, scm_data->metadata_addr);
> +
> +	if (scm_data->ocxl_context)
> +		ocxl_context_free(scm_data->ocxl_context);
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
> +	rc = dev_set_name(&scm_data->dev, "scm%d", minor);
> +	if (rc < 0)
> +		return rc;
> +
> +	scm_data->dev.devt = MKDEV(MAJOR(scm_dev), minor);
> +	scm_data->dev.class = scm_class;
> +	scm_data->dev.parent = &scm_data->pdev->dev;
> +
> +	rc = device_register(&scm_data->dev);
> +	return rc;
> +}
> +
> +static void scm_put(struct scm_data *scm_data)
> +{
> +	put_device(&scm_data->dev);
> +}
> +
> +struct scm_data *scm_get(struct scm_data *scm_data)
> +{
> +	return (get_device(&scm_data->dev) == NULL) ? NULL : scm_data;
> +}
> +
> +static struct scm_data *find_and_get_scm(dev_t devno)
> +{
> +	struct scm_data *scm_data;
> +	int minor = MINOR(devno);
> +	/*
> +	 * We don't declare an RCU critical section here, as our AFU
> +	 * is protected by a reference counter on the device. By the time the
> +	 * minor number of a device is removed from the idr, the ref count of
> +	 * the device is already at 0, so no user API will access that AFU and
> +	 * this function can't return it.
> +	 */
> +	scm_data = idr_find(&minors_idr, minor);
> +	if (scm_data)
> +		scm_get(scm_data);
> +	return scm_data;
> +}
> +
> +static int scm_file_open(struct inode *inode, struct file *file)
> +{
> +	struct scm_data *scm_data;
> +
> +	scm_data = find_and_get_scm(inode->i_rdev);
> +	if (!scm_data)
> +		return -ENODEV;
> +
> +	file->private_data = scm_data;
> +	return 0;
> +}
> +
> +static int scm_file_release(struct inode *inode, struct file *file)
> +{
> +	struct scm_data *scm_data = file->private_data;
> +
> +	if (scm_data->ev_ctx) {
> +		eventfd_ctx_put(scm_data->ev_ctx);
> +		scm_data->ev_ctx = NULL;
> +	}
> +
> +	scm_put(scm_data);
> +	return 0;
> +}
> +
> +static int scm_ioctl_buffer_info(struct scm_data *scm_data,
> +				 struct scm_ioctl_buffer_info __user *uarg)
> +{
> +	struct scm_ioctl_buffer_info args;
> +
> +	args.admin_command_buffer_size = scm_data->admin_command.data_size;
> +	args.near_storage_buffer_size = scm_data->ns_command.data_size;
> +
> +	if (copy_to_user(uarg, &args, sizeof(args)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +static int scm_error_log_offset_0x00(struct scm_data *scm_data, u16 *length)
> +{
> +	int rc;
> +	u64 val;
> +
> +	u16 data_identifier;
> +	u32 data_length;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +				     scm_data->admin_command.data_offset,
> +				     OCXL_LITTLE_ENDIAN, &val);
> +	if (rc)
> +		return rc;
> +
> +	data_identifier = val >> 48;
> +	data_length = val & 0xFFFF;
> +
> +	if (data_identifier != 0x454C) {
> +		dev_err(&scm_data->dev,
> +			"Bad data identifier for error log data, expected 'EL', got '%2s' (%#x), data_length=%u\n",
> +			(char *)&data_identifier,
> +			(unsigned int)data_identifier, data_length);
> +		return -EFAULT;
> +	}
> +
> +	*length = data_length;
> +	return 0;
> +}
> +
> +static int scm_error_log_offset_0x08(struct scm_data *scm_data,
> +				     u32 *log_identifier, u32 *program_ref_code)
> +{
> +	int rc;
> +	u64 val;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +				     scm_data->admin_command.data_offset + 0x08,
> +				     OCXL_LITTLE_ENDIAN, &val);
> +	if (rc)
> +		return rc;
> +
> +	*log_identifier = val >> 32;
> +	*program_ref_code = val & 0xFFFFFFFF;
> +
> +	return 0;
> +}
> +
> +static int scm_read_error_log(struct scm_data *scm_data,
> +			      struct scm_ioctl_error_log *log, bool buf_is_user)
> +{
> +	u64 val;
> +	u16 user_buf_length;
> +	u16 buf_length;
> +	u16 i;
> +	int rc;
> +
> +	if (log->buf_size % 8)
> +		return -EINVAL;
> +
> +	rc = scm_chi(scm_data, &val);
> +	if (rc)
> +		goto out;
> +
> +	if (!(val & GLOBAL_MMIO_CHI_ELA))
> +		return -EAGAIN;
> +
> +	user_buf_length = log->buf_size;
> +
> +	mutex_lock(&scm_data->admin_command.lock);
> +
> +	rc = scm_admin_command_request(scm_data, ADMIN_COMMAND_ERRLOG);
> +	if (rc)
> +		goto out;
> +
> +	rc = scm_admin_command_execute(scm_data);
> +	if (rc)
> +		goto out;
> +
> +	rc = scm_admin_command_complete_timeout(scm_data, ADMIN_COMMAND_ERRLOG);
> +	if (rc < 0) {
> +		dev_warn(&scm_data->dev, "Read error log timed out\n");
> +		goto out;
> +	}
> +
> +	rc = scm_admin_response(scm_data);
> +	if (rc < 0)
> +		goto out;
> +	if (rc != STATUS_SUCCESS) {
> +		scm_warn_status(scm_data, "Unexpected status from retrieve error log", rc);
> +		goto out;
> +	}
> +
> +
> +	rc = scm_error_log_offset_0x00(scm_data, &log->buf_size);
> +	if (rc)
> +		goto out;
> +	// log->buf_size now contains the scm buffer size, not the user size
> +
> +	rc = scm_error_log_offset_0x08(scm_data, &log->log_identifier,
> +				       &log->program_reference_code);
> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +				     scm_data->admin_command.data_offset + 0x10,
> +				     OCXL_LITTLE_ENDIAN, &val);
> +	if (rc)
> +		goto out;
> +
> +	log->error_log_type = val >> 56;
> +	log->action_flags = (log->error_log_type == SCM_ERROR_LOG_TYPE_GENERAL) ?
> +			    (val >> 32) & 0xFFFFFF : 0;
> +	log->power_on_seconds = val & 0xFFFFFFFF;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +				     scm_data->admin_command.data_offset + 0x18,
> +				     OCXL_LITTLE_ENDIAN, &log->timestamp);
> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +				     scm_data->admin_command.data_offset + 0x20,
> +				     OCXL_HOST_ENDIAN, &log->wwid[0]);
> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +				     scm_data->admin_command.data_offset + 0x28,
> +				     OCXL_HOST_ENDIAN, &log->wwid[1]);
> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +				     scm_data->admin_command.data_offset + 0x30,
> +				     OCXL_HOST_ENDIAN, (u64 *)log->fw_revision);
> +	if (rc)
> +		goto out;
> +	log->fw_revision[8] = '\0';
> +
> +	buf_length = (user_buf_length < log->buf_size) ?
> +		     user_buf_length : log->buf_size;
> +	for (i = 0; i < buf_length + 0x48; i += 8) {
> +		u64 val;
> +
> +		rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +					     scm_data->admin_command.data_offset + i,
> +					     OCXL_HOST_ENDIAN, &val);
> +		if (rc)
> +			goto out;
> +
> +		if (buf_is_user) {
> +			if (copy_to_user(&log->buf[i], &val, sizeof(u64))) {
> +				rc = -EFAULT;
> +				goto out;
> +			}
> +		} else
> +			log->buf[i] = val;
> +	}
> +
> +	rc = scm_admin_response_handled(scm_data);
> +	if (rc)
> +		goto out;
> +
> +out:
> +	mutex_unlock(&scm_data->admin_command.lock);
> +	return rc;
> +
> +}
> +
> +static int scm_ioctl_error_log(struct scm_data *scm_data,
> +			       struct scm_ioctl_error_log __user *uarg)
> +{
> +	struct scm_ioctl_error_log args;
> +	int rc;
> +
> +	if (copy_from_user(&args, uarg, sizeof(args)))
> +		return -EFAULT;
> +
> +	rc = scm_read_error_log(scm_data, &args, true);
> +	if (rc)
> +		return rc;
> +
> +	if (copy_to_user(uarg, &args, sizeof(args)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +static int scm_ioctl_controller_dump_data(struct scm_data *scm_data,
> +	struct scm_ioctl_controller_dump_data __user *uarg)
> +{
> +	struct scm_ioctl_controller_dump_data args;
> +	u16 i;
> +	u64 val;
> +	int rc;
> +
> +	if (copy_from_user(&args, uarg, sizeof(args)))
> +		return -EFAULT;
> +
> +	if (args.buf_size % 8)
> +		return -EINVAL;
> +
> +	if (args.buf_size > scm_data->admin_command.data_size)
> +		return -EINVAL;
> +
> +	mutex_lock(&scm_data->admin_command.lock);
> +
> +	rc = scm_admin_command_request(scm_data, ADMIN_COMMAND_CONTROLLER_DUMP);
> +	if (rc)
> +		goto out;
> +
> +	val = ((u64)args.offset) << 32;
> +	val |= args.buf_size;
> +	rc = ocxl_global_mmio_write64(scm_data->ocxl_afu,
> +				      scm_data->admin_command.request_offset + 0x08,
> +				      OCXL_LITTLE_ENDIAN, val);
> +	if (rc)
> +		goto out;
> +
> +	rc = scm_admin_command_execute(scm_data);
> +	if (rc)
> +		goto out;
> +
> +	rc = scm_admin_command_complete_timeout(scm_data,
> +						ADMIN_COMMAND_CONTROLLER_DUMP);
> +	if (rc < 0) {
> +		dev_warn(&scm_data->dev, "Controller dump timed out\n");
> +		goto out;
> +	}
> +
> +	rc = scm_admin_response(scm_data);
> +	if (rc < 0)
> +		goto out;
> +	if (rc != STATUS_SUCCESS) {
> +		scm_warn_status(scm_data,
> +				"Unexpected status from retrieve error log",
> +				rc);
> +		goto out;
> +	}
> +
> +	for (i = 0; i < args.buf_size; i += 8) {
> +		u64 val;
> +
> +		rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +					     scm_data->admin_command.data_offset + i,
> +					     OCXL_HOST_ENDIAN, &val);
> +		if (rc)
> +			goto out;
> +
> +		if (copy_to_user(&args.buf[i], &val, sizeof(u64))) {
> +			rc = -EFAULT;
> +			goto out;
> +		}
> +	}
> +
> +	if (copy_to_user(uarg, &args, sizeof(args))) {
> +		rc = -EFAULT;
> +		goto out;
> +	}
> +
> +	rc = scm_admin_response_handled(scm_data);
> +	if (rc)
> +		goto out;
> +
> +out:
> +	mutex_unlock(&scm_data->admin_command.lock);
> +	return rc;
> +}
> +
> +int scm_request_controller_dump(struct scm_data *scm_data)
> +{
> +	int rc;
> +	u64 busy = 1;
> +
> +	rc = ocxl_global_mmio_set64(scm_data->ocxl_afu, GLOBAL_MMIO_CHIC,
> +				    OCXL_LITTLE_ENDIAN,
> +				    GLOBAL_MMIO_CHI_CDA);
> +
> +
> +	rc = ocxl_global_mmio_set64(scm_data->ocxl_afu, GLOBAL_MMIO_HCI,
> +				    OCXL_LITTLE_ENDIAN,
> +				    GLOBAL_MMIO_HCI_CONTROLLER_DUMP);
> +	if (rc)
> +		return rc;
> +
> +	while (busy) {
> +		rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +					     GLOBAL_MMIO_HCI,
> +					     OCXL_LITTLE_ENDIAN, &busy);
> +		if (rc)
> +			return rc;
> +
> +		busy &= GLOBAL_MMIO_HCI_CONTROLLER_DUMP;
> +		cond_resched();
> +	}
> +
> +	return 0;
> +}
> +
> +static int scm_ioctl_controller_dump_complete(struct scm_data *scm_data)
> +{
> +	int rc;
> +
> +	rc = ocxl_global_mmio_set64(scm_data->ocxl_afu, GLOBAL_MMIO_HCI,
> +				    OCXL_LITTLE_ENDIAN,
> +				    GLOBAL_MMIO_HCI_CONTROLLER_DUMP_COLLECTED);
> +
> +	if (rc)
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +static int scm_controller_stats_offset_0x00(struct scm_data *scm_data,
> +	u32 *length)
> +{
> +	int rc;
> +	u64 val;
> +
> +	u16 data_identifier;
> +	u32 data_length;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +				     scm_data->admin_command.data_offset,
> +				     OCXL_LITTLE_ENDIAN, &val);
> +	if (rc)
> +		return rc;
> +
> +	data_identifier = val >> 48;
> +	data_length = val & 0xFFFFFFFF;
> +
> +	if (data_identifier != 0x4353) {
> +		dev_err(&scm_data->dev,
> +			"Bad data identifier for controller stats, expected 'CS', got '%-.*s'\n",
> +			2, (char *)&data_identifier);
> +		return -EFAULT;
> +	}
> +
> +	*length = data_length;
> +	return 0;
> +}
> +
> +static int scm_ioctl_controller_stats(struct scm_data *scm_data,
> +				      struct scm_ioctl_controller_stats __user *uarg)
> +{
> +	struct scm_ioctl_controller_stats args;
> +	u32 length;
> +	int rc;
> +	u64 val;
> +
> +	memset(&args, '\0', sizeof(args));
> +
> +	mutex_lock(&scm_data->admin_command.lock);
> +
> +	rc = scm_admin_command_request(scm_data, ADMIN_COMMAND_CONTROLLER_STATS);
> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_write64(scm_data->ocxl_afu,
> +				      scm_data->admin_command.request_offset + 0x08,
> +				      OCXL_LITTLE_ENDIAN, 0);
> +	if (rc)
> +		goto out;
> +
> +	rc = scm_admin_command_execute(scm_data);
> +	if (rc)
> +		goto out;
> +
> +
> +	rc = scm_admin_command_complete_timeout(scm_data,
> +						ADMIN_COMMAND_CONTROLLER_STATS);
> +	if (rc < 0) {
> +		dev_warn(&scm_data->dev, "Controller stats timed out\n");
> +		goto out;
> +	}
> +
> +	rc = scm_admin_response(scm_data);
> +	if (rc < 0)
> +		goto out;
> +	if (rc != STATUS_SUCCESS) {
> +		scm_warn_status(scm_data,
> +				"Unexpected status from controller stats", rc);
> +		goto out;
> +	}
> +
> +	rc = scm_controller_stats_offset_0x00(scm_data, &length);
> +	if (rc)
> +		goto out;
> +
> +	if (length != 0x140)
> +		scm_warn_status(scm_data,
> +				"Unexpected length for controller stats data, expected 0x140, got 0x%x",
> +				length);
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +				     scm_data->admin_command.data_offset + 0x08 + 0x08,
> +				     OCXL_LITTLE_ENDIAN, &val);
> +	if (rc)
> +		goto out;
> +
> +	args.reset_count = val >> 32;
> +	args.reset_uptime = val & 0xFFFFFFFF;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +				     scm_data->admin_command.data_offset + 0x08 + 0x10,
> +				     OCXL_LITTLE_ENDIAN, &val);
> +	if (rc)
> +		goto out;
> +
> +	args.power_on_uptime = val >> 32;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +				     scm_data->admin_command.data_offset + 0x08 + 0x40 + 0x08,
> +				     OCXL_LITTLE_ENDIAN, &args.host_load_count);
> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +				     scm_data->admin_command.data_offset + 0x08 + 0x40 + 0x10,
> +				     OCXL_LITTLE_ENDIAN, &args.host_store_count);
> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +				     scm_data->admin_command.data_offset + 0x08 + 0x40 + 0x18,
> +				     OCXL_LITTLE_ENDIAN, &args.media_read_count);
> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +				     scm_data->admin_command.data_offset + 0x08 + 0x40 + 0x20,
> +				     OCXL_LITTLE_ENDIAN, &args.media_write_count);
> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +				     scm_data->admin_command.data_offset + 0x08 + 0x40 + 0x28,
> +				     OCXL_LITTLE_ENDIAN, &args.cache_hit_count);
> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +				     scm_data->admin_command.data_offset + 0x08 + 0x40 + 0x30,
> +				     OCXL_LITTLE_ENDIAN, &args.cache_miss_count);
> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +				     scm_data->admin_command.data_offset + 0x08 + 0x40 + 0x38,
> +				     OCXL_LITTLE_ENDIAN, &args.media_read_latency);
> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +				     scm_data->admin_command.data_offset + 0x08 + 0x40 + 0x40,
> +				     OCXL_LITTLE_ENDIAN, &args.media_write_latency);
> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +				     scm_data->admin_command.data_offset + 0x08 + 0x40 + 0x48,
> +				     OCXL_LITTLE_ENDIAN, &args.cache_read_latency);
> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +				     scm_data->admin_command.data_offset + 0x08 + 0x40 + 0x50,
> +				     OCXL_LITTLE_ENDIAN, &args.cache_write_latency);
> +	if (rc)
> +		goto out;
> +
> +	if (copy_to_user(uarg, &args, sizeof(args))) {
> +		rc = -EFAULT;
> +		goto out;
> +	}
> +
> +	rc = scm_admin_response_handled(scm_data);
> +	if (rc)
> +		goto out;
> +
> +	rc = 0;
> +	goto out;
> +
> +out:
> +	mutex_unlock(&scm_data->admin_command.lock);
> +	return rc;
> +}
> +
> +static int scm_ioctl_eventfd(struct scm_data *scm_data,
> +			     struct scm_ioctl_eventfd __user *uarg)
> +{
> +	struct scm_ioctl_eventfd args;
> +
> +	if (copy_from_user(&args, uarg, sizeof(args)))
> +		return -EFAULT;
> +
> +	if (scm_data->ev_ctx)
> +		return -EFAULT;
> +
> +	scm_data->ev_ctx = eventfd_ctx_fdget(args.eventfd);
> +	if (!scm_data->ev_ctx)
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +static int scm_ioctl_event_check(struct scm_data *scm_data, u64 __user *uarg)
> +{
> +	u64 val = 0;
> +	int rc;
> +	u64 chi = 0;
> +
> +	rc = scm_chi(scm_data, &chi);
> +	if (rc < 0)
> +		return -EFAULT;
> +
> +	if (chi & GLOBAL_MMIO_CHI_ELA)
> +		val |= SCM_IOCTL_EVENT_ERROR_LOG_AVAILABLE;
> +
> +	if (chi & GLOBAL_MMIO_CHI_CDA)
> +		val |= SCM_IOCTL_EVENT_CONTROLLER_DUMP_AVAILABLE;
> +
> +	if (chi & GLOBAL_MMIO_CHI_CFFS)
> +		val |= SCM_IOCTL_EVENT_FIRMWARE_FATAL;
> +
> +	if (chi & GLOBAL_MMIO_CHI_CHFS)
> +		val |= SCM_IOCTL_EVENT_HARDWARE_FATAL;
> +
> +	rc = copy_to_user((u64 __user *) uarg, &val, sizeof(val));
> +
> +	return rc;
> +}
> +
> +/**
> + * scm_req_controller_health_perf() - Request controller health & performance data
> + * @scm_data: the SCM metadata
> + * Return: 0 on success, negative on failure
> + */
> +int scm_req_controller_health_perf(struct scm_data *scm_data)
> +{
> +	return ocxl_global_mmio_set64(scm_data->ocxl_afu, GLOBAL_MMIO_HCI,
> +				      OCXL_LITTLE_ENDIAN,
> +				      GLOBAL_MMIO_HCI_REQ_HEALTH_PERF);
> +}
> +
> +#ifdef CONFIG_OCXL_SCM_DEBUG
> +/**
> + * scm_enable_fwdebug() - Enable FW debug on the controller
> + * @scm_data: a pointer to the SCM device data
> + * Return: 0 on success, negative on failure
> + */
> +static int scm_enable_fwdebug(const struct scm_data *scm_data)
> +{
> +	return ocxl_global_mmio_set64(scm_data->ocxl_afu, GLOBAL_MMIO_HCI,
> +				      OCXL_LITTLE_ENDIAN,
> +				      GLOBAL_MMIO_HCI_FW_DEBUG);
> +}
> +
> +/**
> + * scm_disable_fwdebug() - Disable FW debug on the controller
> + * @scm_data: a pointer to the SCM device data
> + * Return: 0 on success, negative on failure
> + */
> +static int scm_disable_fwdebug(const struct scm_data *scm_data)
> +{
> +	return ocxl_global_mmio_set64(scm_data->ocxl_afu, GLOBAL_MMIO_HCIC,
> +				      OCXL_LITTLE_ENDIAN,
> +				      GLOBAL_MMIO_HCI_FW_DEBUG);
> +}
> +
> +static int scm_ioctl_fwdebug(struct scm_data *scm_data,
> +			     struct scm_ioctl_fwdebug __user *uarg)
> +{
> +	struct scm_ioctl_fwdebug args;
> +	u64 val;
> +	int i;
> +	int rc;
> +
> +	if (copy_from_user(&args, uarg, sizeof(args)))
> +		return -EFAULT;
> +
> +	// Buffer size must be a multiple of 8
> +	if ((args.buf_size & 0x07))
> +		return -EINVAL;
> +
> +	if (args.buf_size > scm_data->admin_command.data_size)
> +		return -EINVAL;
> +
> +	mutex_lock(&scm_data->admin_command.lock);
> +
> +	rc = scm_enable_fwdebug(scm_data);
> +	if (rc)
> +		goto out;
> +
> +	rc = scm_admin_command_request(scm_data, ADMIN_COMMAND_FW_DEBUG);
> +	if (rc)
> +		goto out;
> +
> +	// Write DebugAction & FunctionCode
> +	val = ((u64)args.debug_action << 56) | ((u64)args.function_code << 40);
> +
> +	rc = ocxl_global_mmio_write64(scm_data->ocxl_afu,
> +				      scm_data->admin_command.request_offset + 0x08,
> +				      OCXL_LITTLE_ENDIAN, val);
> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_write64(scm_data->ocxl_afu,
> +				      scm_data->admin_command.request_offset + 0x10,
> +				      OCXL_LITTLE_ENDIAN, args.debug_parameter_1);
> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_write64(scm_data->ocxl_afu,
> +				      scm_data->admin_command.request_offset + 0x18,
> +				      OCXL_LITTLE_ENDIAN, args.debug_parameter_2);
> +	if (rc)
> +		goto out;
> +
> +	for (i = 0x20; i < 0x38; i += 0x08)
> +		rc = ocxl_global_mmio_write64(scm_data->ocxl_afu,
> +					      scm_data->admin_command.request_offset + i,
> +					      OCXL_LITTLE_ENDIAN, 0);
> +	if (rc)
> +		goto out;
> +
> +
> +	// Populate admin command buffer
> +	if (args.buf_size) {
> +		for (i = 0; i < args.buf_size; i += sizeof(u64)) {
> +			u64 val;
> +
> +			if (copy_from_user(&val, &args.buf[i], sizeof(u64)))
> +				return -EFAULT;
> +
> +			rc = ocxl_global_mmio_write64(scm_data->ocxl_afu,
> +						      scm_data->admin_command.data_offset + i,
> +						      OCXL_HOST_ENDIAN, val);
> +			if (rc)
> +				goto out;
> +		}
> +	}
> +
> +	rc = scm_admin_command_execute(scm_data);
> +	if (rc)
> +		goto out;
> +
> +	rc = scm_admin_command_complete_timeout(scm_data,
> +						scm_data->timeouts[ADMIN_COMMAND_FW_DEBUG]);
> +	if (rc < 0)
> +		goto out;
> +
> +	rc = scm_admin_response(scm_data);
> +	if (rc < 0)
> +		goto out;
> +	if (rc != STATUS_SUCCESS) {
> +		scm_warn_status(scm_data, "Unexpected status from FW Debug", rc);
> +		goto out;
> +	}
> +
> +	if (args.buf_size) {
> +		for (i = 0; i < args.buf_size; i += sizeof(u64)) {
> +			u64 val;
> +
> +			rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +						     scm_data->admin_command.data_offset + i,
> +						     OCXL_HOST_ENDIAN, &val);
> +			if (rc)
> +				goto out;
> +
> +			if (copy_to_user(&args.buf[i], &val, sizeof(u64))) {
> +				rc = -EFAULT;
> +				goto out;
> +			}
> +		}
> +	}
> +
> +	rc = scm_admin_response_handled(scm_data);
> +	if (rc)
> +		goto out;
> +
> +	rc = scm_disable_fwdebug(scm_data);
> +	if (rc)
> +		goto out;
> +
> +out:
> +	mutex_unlock(&scm_data->admin_command.lock);
> +	return rc;
> +}
> +
> +static int scm_ioctl_shutdown(struct scm_data *scm_data)
> +{
> +	int rc;
> +
> +	mutex_lock(&scm_data->admin_command.lock);
> +
> +	rc = scm_admin_command_request(scm_data, ADMIN_COMMAND_SHUTDOWN);
> +	if (rc)
> +		goto out;
> +
> +	rc = scm_admin_command_execute(scm_data);
> +	if (rc)
> +		goto out;
> +
> +	rc = scm_admin_command_complete_timeout(scm_data, ADMIN_COMMAND_SHUTDOWN);
> +	if (rc < 0) {
> +		dev_warn(&scm_data->dev, "Shutdown timed out\n");
> +		goto out;
> +	}
> +
> +	rc = 0;
> +	goto out;
> +
> +out:
> +	mutex_unlock(&scm_data->admin_command.lock);
> +	return rc;
> +}
> +
> +static int scm_ioctl_mmio_write(struct scm_data *scm_data,
> +				struct scm_ioctl_mmio __user *uarg)
> +{
> +	struct scm_ioctl_mmio args;
> +
> +	if (copy_from_user(&args, uarg, sizeof(args)))
> +		return -EFAULT;
> +
> +	return ocxl_global_mmio_write64(scm_data->ocxl_afu, args.address,
> +					OCXL_LITTLE_ENDIAN, args.val);
> +}
> +
> +static int scm_ioctl_mmio_read(struct scm_data *scm_data,
> +			       struct scm_ioctl_mmio __user *uarg)
> +{
> +	struct scm_ioctl_mmio args;
> +	int rc;
> +
> +	if (copy_from_user(&args, uarg, sizeof(args)))
> +		return -EFAULT;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu, args.address,
> +				     OCXL_LITTLE_ENDIAN, &args.val);
> +	if (rc)
> +		return rc;
> +
> +	if (copy_to_user(uarg, &args, sizeof(args)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +#else
> +static int scm_ioctl_fwdebug(struct scm_data *scm_data,
> +			     struct scm_ioctl_fwdebug __user *uarg)
> +{
> +	return -EPERM;
> +}
> +
> +static int scm_ioctl_shutdown(struct scm_data *scm_data)
> +{
> +	return -EPERM;
> +}
> +
> +static int scm_ioctl_mmio_write(struct scm_data *scm_data,
> +				struct scm_ioctl_mmio __user *uarg)
> +{
> +	return -EPERM;
> +}
> +
> +static int scm_ioctl_mmio_read(struct scm_data *scm_data,
> +			       struct scm_ioctl_mmio __user *uarg)
> +{
> +	return -EPERM;
> +}
> +#endif
> +
> +static long scm_file_ioctl(struct file *file, unsigned int cmd,
> +			   unsigned long args)
> +{
> +	struct scm_data *scm_data = file->private_data;
> +	int rc = -EINVAL;
> +
> +	switch (cmd) {
> +	case SCM_IOCTL_BUFFER_INFO:
> +		rc = scm_ioctl_buffer_info(scm_data,
> +					   (struct scm_ioctl_buffer_info __user *)args);
> +		break;
> +
> +	case SCM_IOCTL_ERROR_LOG:
> +		rc = scm_ioctl_error_log(scm_data,
> +					 (struct scm_ioctl_error_log __user *)args);
> +		break;
> +
> +	case SCM_IOCTL_CONTROLLER_DUMP:
> +		rc = scm_request_controller_dump(scm_data);
> +		break;
> +
> +	case SCM_IOCTL_CONTROLLER_DUMP_DATA:
> +		rc = scm_ioctl_controller_dump_data(scm_data,
> +						    (struct scm_ioctl_controller_dump_data __user *)args);
> +		break;
> +
> +	case SCM_IOCTL_CONTROLLER_DUMP_COMPLETE:
> +		rc = scm_ioctl_controller_dump_complete(scm_data);
> +		break;
> +
> +	case SCM_IOCTL_CONTROLLER_STATS:
> +		rc = scm_ioctl_controller_stats(scm_data,
> +						(struct scm_ioctl_controller_stats __user *)args);
> +		break;
> +
> +	case SCM_IOCTL_EVENTFD:
> +		rc = scm_ioctl_eventfd(scm_data,
> +				       (struct scm_ioctl_eventfd __user *)args);
> +		break;
> +
> +	case SCM_IOCTL_EVENT_CHECK:
> +		rc = scm_ioctl_event_check(scm_data, (u64 __user *)args);
> +		break;
> +
> +	case SCM_IOCTL_REQUEST_HEALTH:
> +		rc = scm_req_controller_health_perf(scm_data);
> +		break;
> +
> +	case SCM_IOCTL_FWDEBUG:
> +		rc = scm_ioctl_fwdebug(scm_data,
> +				       (struct scm_ioctl_fwdebug __user *)args);
> +		break;
> +
> +	case SCM_IOCTL_SHUTDOWN:
> +		rc = scm_ioctl_shutdown(scm_data);
> +		break;
> +
> +	case SCM_IOCTL_MMIO_WRITE:
> +		rc = scm_ioctl_mmio_write(scm_data,
> +					  (struct scm_ioctl_mmio __user *)args);
> +		break;
> +
> +	case SCM_IOCTL_MMIO_READ:
> +		rc = scm_ioctl_mmio_read(scm_data,
> +					 (struct scm_ioctl_mmio __user *)args);
> +		break;
> +
> +	}
> +
> +	return rc;
> +}
> +
> +static const struct file_operations scm_fops = {
> +	.owner		= THIS_MODULE,
> +	.open	   = scm_file_open,
> +	.release	= scm_file_release,
> +	.unlocked_ioctl = scm_file_ioctl,
> +	.compat_ioctl   = scm_file_ioctl,
> +};
> +
> +/**
> + * scm_create_cdev() - Create the chardev in /dev for this scm device
> + * @scm_data: the SCM metadata
> + * Return: 0 on success, negative on failure
> + */
> +static int scm_create_cdev(struct scm_data *scm_data)
> +{
> +	int rc;
> +
> +	cdev_init(&scm_data->cdev, &scm_fops);
> +	rc = cdev_add(&scm_data->cdev, scm_data->dev.devt, 1);
> +	if (rc) {
> +		dev_err(&scm_data->dev, "Unable to add afu char device: %d\n", rc);
> +		return rc;
> +	}
> +	return 0;
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
> +		if (scm_data) {
> +			if (scm_data->nvdimm_bus)
> +				nvdimm_bus_unregister(scm_data->nvdimm_bus);
> +
> +			device_unregister(&scm_data->dev);
> +		}
> +	}
> +}
> +
> +/**
> + * scm_setup_device_metadata() - Retrieve config information from the AFU and save it for future use
> + * @scm_data: the SCM metadata
> + * Return: 0 on success, negative on failure
> + */
> +static int scm_setup_device_metadata(struct scm_data *scm_data)
> +{
> +	u64 val;
> +	int rc;
> +	int i;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu, GLOBAL_MMIO_CCAP0,
> +				     OCXL_LITTLE_ENDIAN, &val);
> +	if (rc)
> +		return rc;
> +
> +	scm_data->scm_revision = val & 0xFFFF;
> +	scm_data->read_latency = (val >> 32) & 0xFF;
> +	scm_data->readiness_timeout = val >> 48;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu, GLOBAL_MMIO_CCAP1,
> +				     OCXL_LITTLE_ENDIAN, &val);
> +	if (rc)
> +		return rc;
> +
> +	scm_data->max_controller_dump_size = val & 0xFFFFFFFF;
> +
> +	rc = ocxl_global_mmio_read64(scm_data->ocxl_afu, GLOBAL_MMIO_FWVER,
> +				     OCXL_LITTLE_ENDIAN, &val);
> +	if (rc)
> +		return rc;
> +
> +	for (i = 0; i < 8; i++)
> +		scm_data->fw_version[i] = (val >> (i * 8)) & 0xff;
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
> +static const char *scm_decode_error_log_type(u8 error_log_type)
> +{
> +	switch (error_log_type) {
> +	case 0x00:
> +		return "general";
> +	case 0x01:
> +		return "predictive failure";
> +	case 0x02:
> +		return "thermal warning";
> +	case 0x03:
> +		return "data loss";
> +	case 0x04:
> +		return "health & performance";
> +	default:
> +		return "unknown";
> +	}
> +}
> +
> +static void scm_dump_error_log(struct scm_data *scm_data)
> +{
> +	struct scm_ioctl_error_log log;
> +	u32 buf_size;
> +	u8 *buf;
> +	int rc;
> +
> +	if (scm_data->admin_command.data_size == 0)
> +		return;
> +
> +	buf_size = scm_data->admin_command.data_size - 0x48;
> +	buf = kzalloc(buf_size, GFP_KERNEL);
> +	if (!buf)
> +		return;
> +
> +	log.buf = buf;
> +	log.buf_size = buf_size;
> +
> +	rc = scm_read_error_log(scm_data, &log, false);
> +	if (rc < 0)
> +		goto out;
> +
> +	dev_warn(&scm_data->dev,
> +		 "SCM Error log: WWID=0x%016llx%016llx LID=0x%x PRC=%x type=0x%x %s, Uptime=%u seconds timestamp=0x%llx\n",
> +		 log.wwid[0], log.wwid[1],
> +		 log.log_identifier, log.program_reference_code,
> +		 log.error_log_type,
> +		 scm_decode_error_log_type(log.error_log_type),
> +		 log.power_on_seconds, log.timestamp);
> +	print_hex_dump(KERN_WARNING, "buf", DUMP_PREFIX_OFFSET, 16, 1, buf,
> +		       log.buf_size, false);
> +
> +out:
> +	kfree(buf);
> +}
> +
> +static void scm_handle_nscra_doorbell(struct scm_data *scm_data)
> +{
> +	int rc;
> +
> +	if (scm_data->ns_command.op_code == NS_COMMAND_SECURE_ERASE) {
> +		u64 success, attempted;
> +
> +
> +		rc = scm_ns_response(scm_data);
> +		if (rc < 0) {
> +			scm_data->overwrite_state = SCM_OVERWRITE_FAILED;
> +			mutex_unlock(&scm_data->ns_command.lock);
> +			return;
> +		}
> +		if (rc != STATUS_SUCCESS)
> +			scm_warn_status(scm_data, "Unexpected status from overwrite", rc);
> +
> +		rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +					     scm_data->ns_command.response_offset +
> +					     NS_RESPONSE_SECURE_ERASE_ACCESSIBLE_SUCCESS,
> +					     OCXL_HOST_ENDIAN, &success);
> +		if (rc) {
> +			scm_data->overwrite_state = SCM_OVERWRITE_FAILED;
> +			mutex_unlock(&scm_data->ns_command.lock);
> +			return;
> +		}
> +
> +		rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +					     scm_data->ns_command.response_offset +
> +					     NS_RESPONSE_SECURE_ERASE_ACCESSIBLE_ATTEMPTED,
> +					     OCXL_HOST_ENDIAN, &attempted);
> +		if (rc) {
> +			scm_data->overwrite_state = SCM_OVERWRITE_FAILED;
> +			mutex_unlock(&scm_data->ns_command.lock);
> +			return;
> +		}
> +
> +		scm_data->overwrite_state = SCM_OVERWRITE_SUCCESS;
> +		if (success != attempted)
> +			scm_data->overwrite_state = SCM_OVERWRITE_FAILED;
> +
> +		dev_info(&scm_data->dev,
> +			 "Overwritten %llu/%llu accessible pages", success, attempted);
> +
> +		rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +					     scm_data->ns_command.response_offset +
> +					     NS_RESPONSE_SECURE_ERASE_DEFECTIVE_SUCCESS,
> +					     OCXL_HOST_ENDIAN, &success);
> +		if (rc) {
> +			scm_data->overwrite_state = SCM_OVERWRITE_FAILED;
> +			mutex_unlock(&scm_data->ns_command.lock);
> +			return;
> +		}
> +
> +		rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +					     scm_data->ns_command.response_offset +
> +					     NS_RESPONSE_SECURE_ERASE_DEFECTIVE_ATTEMPTED,
> +					     OCXL_HOST_ENDIAN, &attempted);
> +		if (rc) {
> +			scm_data->overwrite_state = SCM_OVERWRITE_FAILED;
> +			mutex_unlock(&scm_data->ns_command.lock);
> +			return;
> +		}
> +
> +		if (success != attempted)
> +			scm_data->overwrite_state = SCM_OVERWRITE_FAILED;
> +
> +		dev_info(&scm_data->dev,
> +			 "Overwritten %llu/%llu defective pages", success, attempted);
> +
> +		scm_ns_response_handled(scm_data);
> +
> +		mutex_unlock(&scm_data->ns_command.lock);
> +		return;
> +	}
> +}
> +
> +static irqreturn_t scm_imn0_handler(void *private)
> +{
> +	struct scm_data *scm_data = private;
> +	int rc;
> +	u64 chi = 0;
> +
> +	rc = scm_chi(scm_data, &chi);
> +	if (rc < 0)
> +		return IRQ_NONE;
> +
> +	if (chi & GLOBAL_MMIO_CHI_NSCRA)
> +		scm_handle_nscra_doorbell(scm_data);
> +
> +	if (chi & GLOBAL_MMIO_CHI_ELA) {
> +		dev_warn(&scm_data->dev, "Error log is available\n");
> +
> +		if (scm_data->ev_ctx)
> +			eventfd_signal(scm_data->ev_ctx, 1);
> +	}
> +
> +	if (chi & GLOBAL_MMIO_CHI_CDA) {
> +		dev_warn(&scm_data->dev, "Controller dump is available\n");
> +
> +		if (scm_data->ev_ctx)
> +			eventfd_signal(scm_data->ev_ctx, 1);
> +	}
> +
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t scm_imn1_handler(void *private)
> +{
> +	struct scm_data *scm_data = private;
> +	u64 chi = 0;
> +
> +	(void)scm_chi(scm_data, &chi);
> +
> +	if (chi & (GLOBAL_MMIO_CHI_CFFS | GLOBAL_MMIO_CHI_CHFS)) {
> +		dev_err(&scm_data->dev,
> +			"Controller status is fatal, chi=0x%llx, going offline\n", chi);
> +
> +		if (scm_data->nvdimm_bus) {
> +			nvdimm_bus_unregister(scm_data->nvdimm_bus);
> +			scm_data->nvdimm_bus = NULL;
> +		}
> +
> +		if (scm_data->ev_ctx)
> +			eventfd_signal(scm_data->ev_ctx, 1);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +
> +/**
> + * scm_setup_irq() - Set up the IRQs for the SCM device
> + * @scm_data: the SCM metadata
> + * Return: 0 on success, negative on failure
> + */
> +static int scm_setup_irq(struct scm_data *scm_data)
> +{
> +	int rc;
> +	u64 irq_addr;
> +
> +	rc = ocxl_afu_irq_alloc(scm_data->ocxl_context, &scm_data->irq_id[0]);
> +	if (rc)
> +		return rc;
> +
> +	rc = ocxl_irq_set_handler(scm_data->ocxl_context, scm_data->irq_id[0],
> +				  scm_imn0_handler, NULL, scm_data);
> +
> +	irq_addr = ocxl_afu_irq_get_addr(scm_data->ocxl_context, scm_data->irq_id[0]);
> +	if (!irq_addr)
> +		return -EFAULT;
> +
> +	scm_data->irq_addr[0] = ioremap(irq_addr, PAGE_SIZE);
> +	if (!scm_data->irq_addr[0])
> +		return -EINVAL;
> +
> +	rc = ocxl_global_mmio_write64(scm_data->ocxl_afu, GLOBAL_MMIO_IMA0_OHP,
> +				      OCXL_LITTLE_ENDIAN,
> +				      (u64)scm_data->irq_addr[0]);
> +	if (rc)
> +		goto out_irq0;
> +
> +	rc = ocxl_global_mmio_write64(scm_data->ocxl_afu, GLOBAL_MMIO_IMA0_CFP,
> +				      OCXL_LITTLE_ENDIAN, 0);
> +	if (rc)
> +		goto out_irq0;
> +
> +	rc = ocxl_afu_irq_alloc(scm_data->ocxl_context, &scm_data->irq_id[1]);
> +	if (rc)
> +		goto out_irq0;
> +
> +
> +	rc = ocxl_irq_set_handler(scm_data->ocxl_context, scm_data->irq_id[1],
> +				  scm_imn1_handler, NULL, scm_data);
> +	if (rc)
> +		goto out_irq0;
> +
> +	irq_addr = ocxl_afu_irq_get_addr(scm_data->ocxl_context, scm_data->irq_id[1]);
> +	if (!irq_addr)
> +		goto out_irq0;
> +
> +	scm_data->irq_addr[1] = ioremap(irq_addr, PAGE_SIZE);
> +	if (!scm_data->irq_addr[1])
> +		goto out_irq0;
> +
> +	rc = ocxl_global_mmio_write64(scm_data->ocxl_afu, GLOBAL_MMIO_IMA1_OHP,
> +				      OCXL_LITTLE_ENDIAN,
> +				      (u64)scm_data->irq_addr[1]);
> +	if (rc)
> +		goto out_irq1;
> +
> +	rc = ocxl_global_mmio_write64(scm_data->ocxl_afu, GLOBAL_MMIO_IMA1_CFP,
> +				      OCXL_LITTLE_ENDIAN, 0);
> +	if (rc)
> +		goto out_irq1;
> +
> +	// Enable doorbells
> +	rc = ocxl_global_mmio_set64(scm_data->ocxl_afu, GLOBAL_MMIO_CHIE,
> +				    OCXL_LITTLE_ENDIAN,
> +				    GLOBAL_MMIO_CHI_ELA | GLOBAL_MMIO_CHI_CDA |
> +				    GLOBAL_MMIO_CHI_CFFS | GLOBAL_MMIO_CHI_CHFS |
> +				    GLOBAL_MMIO_CHI_NSCRA);
> +	if (rc)
> +		goto out_irq1;
> +
> +	return 0;
> +
> +out_irq1:
> +	iounmap(scm_data->irq_addr[1]);
> +	scm_data->irq_addr[1] = NULL;
> +
> +out_irq0:
> +	iounmap(scm_data->irq_addr[0]);
> +	scm_data->irq_addr[0] = NULL;
> +
> +	return rc;
> +}
> +
> +/**
> + * scm_probe_function_0 - Set up function 0 for an OpenCAPI Storage Class Memory device
> + * This is important as it enables higher than 0 across all other functions,
> + * which in turn enables higher bandwidth accesses
> + * @pdev: the PCI device information struct
> + * Return: 0 on success, negative on failure
> + */
> +static int scm_probe_function_0(struct pci_dev *pdev)
> +{
> +	struct scm_function_0 *scm_func_0 = NULL;
> +
> +	scm_func_0 = kzalloc(sizeof(*scm_func_0), GFP_KERNEL);
> +	if (!scm_func_0)
> +		return -ENOMEM;
> +
> +	scm_func_0->pdev = pdev;
> +	scm_func_0->ocxl_fn = ocxl_function_open(pdev);
> +	if (IS_ERR(scm_func_0->ocxl_fn)) {
> +		kfree(scm_func_0);
> +		dev_err(&pdev->dev, "failed to open OCXL function\n");
> +		return -EFAULT;
> +	}
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
> +	int elapsed;
> +	u64 chi;
> +
> +	if (PCI_FUNC(pdev->devfn) == 0)
> +		return scm_probe_function_0(pdev);
> +	else if (PCI_FUNC(pdev->devfn) != 1)
> +		return 0;
> +
> +	scm_data = kzalloc(sizeof(*scm_data), GFP_KERNEL);
> +	if (!scm_data)
> +		goto err;
> +	scm_data->pdev = pdev;
> +	mutex_init(&scm_data->admin_command.lock);
> +	mutex_init(&scm_data->ns_command.lock);
> +
> +
> +	scm_data->timeouts[ADMIN_COMMAND_ERRLOG] = 2000; // ms
> +	scm_data->timeouts[ADMIN_COMMAND_HEARTBEAT] = 100; // ms
> +	scm_data->timeouts[ADMIN_COMMAND_SMART] = 100; // ms
> +	scm_data->timeouts[ADMIN_COMMAND_CONTROLLER_DUMP] = 1000; // ms
> +	scm_data->timeouts[ADMIN_COMMAND_CONTROLLER_STATS] = 100; // ms
> +	scm_data->timeouts[ADMIN_COMMAND_SHUTDOWN] = 1000; // ms
> +	scm_data->timeouts[ADMIN_COMMAND_FW_UPDATE] = 16000; // ms
> +
> +	pci_set_drvdata(pdev, scm_data);
> +
> +	scm_data->ocxl_fn = ocxl_function_open(pdev);
> +	if (IS_ERR(scm_data->ocxl_fn)) {
> +		kfree(scm_data);
> +		scm_data = NULL;
> +		pci_set_drvdata(pdev, NULL);
> +		dev_err(&pdev->dev, "failed to open OCXL function\n");
> +		goto err;
> +	}
> +
> +	scm_data->ocxl_afu = ocxl_function_fetch_afu(scm_data->ocxl_fn, 0);
> +	if (scm_data->ocxl_afu == NULL)
> +		goto err;
> +
> +	ocxl_afu_get(scm_data->ocxl_afu);
> +
> +	if (scm_register(scm_data) < 0)
> +		goto err;
> +
> +	if (ocxl_context_alloc(&scm_data->ocxl_context, scm_data->ocxl_afu, NULL))
> +		goto err;
> +
> +	if (ocxl_context_attach(scm_data->ocxl_context, 0, NULL))
> +		goto err;
> +
> +	if (scm_setup_device_metadata(scm_data))
> +		goto err;
> +
> +	if (scm_setup_irq(scm_data))
> +		goto err;
> +
> +	if (scm_setup_command_metadata(scm_data))
> +		goto err;
> +
> +	if (scm_create_cdev(scm_data))
> +		goto err;
> +
> +	if (scm_sysfs_add(scm_data))
> +		goto err;
> +
> +	if (scm_heartbeat(scm_data))
> +		goto err;
> +
> +	elapsed = 0;
> +	while (!scm_is_usable(scm_data)) {
> +		if (elapsed++ > SCM_USABLE_TIMEOUT) {
> +			dev_warn(&scm_data->dev, "SCM ready timeout.\n");
> +			goto err;
> +		}
> +
> +		dev_warn(&scm_data->dev,
> +			 "Waiting for SCM to become usable (%d/%d seconds)\n",
> +			 elapsed, SCM_USABLE_TIMEOUT);
> +		msleep(1000);
> +	}
> +
> +	if (scm_register_lpc_mem(scm_data))
> +		goto err;
> +
> +	return 0;
> +
> +err:
> +	if (scm_data &&
> +		    (scm_chi(scm_data, &chi) == 0) &&
> +		    (chi & GLOBAL_MMIO_CHI_ELA))
> +		scm_dump_error_log(scm_data);
> +
> +	dev_err(&pdev->dev,
> +		"Error detected, will not register storage class memory\n");
> +	return -ENXIO;
> +}
> +
> +struct pci_driver scm_pci_driver = {
> +	.name = "ocxl-scm",
> +	.id_table = scm_pci_tbl,
> +	.probe = scm_probe,
> +	.remove = scm_remove,
> +	.shutdown = scm_remove,
> +};
> +
> +static int scm_file_init(void)
> +{
> +	int rc;
> +
> +	mutex_init(&minors_idr_lock);
> +	idr_init(&minors_idr);
> +
> +	rc = alloc_chrdev_region(&scm_dev, 0, SCM_NUM_MINORS, "scm");
> +	if (rc) {
> +		pr_err("Unable to allocate scm major number: %d\n", rc);
> +		return rc;
> +	}
> +
> +	scm_class = class_create(THIS_MODULE, "scm");
> +	if (IS_ERR(scm_class)) {
> +		pr_err("Unable to create scm class\n");
> +		unregister_chrdev_region(scm_dev, SCM_NUM_MINORS);
> +		return PTR_ERR(scm_class);
> +	}
> +
> +	return 0;
> +}
> +
> +static void scm_file_exit(void)
> +{
> +	class_destroy(scm_class);
> +	unregister_chrdev_region(scm_dev, SCM_NUM_MINORS);
> +	idr_destroy(&minors_idr);
> +}
> +
> +static int __init scm_init(void)
> +{
> +	int rc = 0;
> +
> +	rc = scm_file_init();
> +	if (rc)
> +		return rc;
> +
> +	rc = pci_register_driver(&scm_pci_driver);
> +	if (rc) {
> +		scm_file_exit();
> +		return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +static void scm_exit(void)
> +{
> +	pci_unregister_driver(&scm_pci_driver);
> +	scm_file_exit();
> +}
> +
> +module_init(scm_init);
> +module_exit(scm_exit);
> +
> +MODULE_DESCRIPTION("Storage Class Memory");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/nvdimm/ocxl-scm_internal.c b/drivers/nvdimm/ocxl-scm_internal.c
> new file mode 100644
> index 000000000000..e7c247835817
> --- /dev/null
> +++ b/drivers/nvdimm/ocxl-scm_internal.c
> @@ -0,0 +1,232 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright 2019 IBM Corp.
> +
> +#include <misc/ocxl.h>
> +#include <linux/delay.h>
> +#include "ocxl-scm_internal.h"
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
> +
> +bool scm_controller_is_ready(const struct scm_data *scm_data)
> +{
> +	u64 val = 0;
> +	int rc = scm_chi(scm_data, &val);
> +
> +	WARN_ON(rc < 0);
> +
> +	return (val & GLOBAL_MMIO_CHI_CRDY) != 0;
> +}
> +
> +static int scm_command_request(const struct scm_data *scm_data,
> +			       struct command_metadata *cmd, u8 op_code)
> +{
> +	u64 val = op_code;
> +	int rc;
> +	u8 i;
> +
> +	if (!scm_controller_is_ready(scm_data))
> +		return -EIO;
> +
> +	cmd->op_code = op_code;
> +	cmd->id++;
> +
> +	val |= ((u64)cmd->id) << 16;
> +
> +	rc = ocxl_global_mmio_write64(scm_data->ocxl_afu, cmd->request_offset,
> +				      OCXL_LITTLE_ENDIAN, val);
> +	if (rc)
> +		return rc;
> +
> +	for (i = 0x08; i <= 0x38; i += 0x08) {
> +		rc = ocxl_global_mmio_write64(scm_data->ocxl_afu,
> +					      cmd->request_offset + i,
> +					      OCXL_LITTLE_ENDIAN, 0);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +int scm_admin_command_request(struct scm_data *scm_data, u8 op_code)
> +{
> +	return scm_command_request(scm_data, &scm_data->admin_command, op_code);
> +}
> +
> +int scm_command_response(const struct scm_data *scm_data,
> +			 const struct command_metadata *cmd)
> +{
> +	u64 val;
> +	u16 id;
> +	u8 status;
> +	int rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +					 cmd->response_offset,
> +					 OCXL_LITTLE_ENDIAN, &val);
> +	if (rc)
> +		return rc;
> +
> +	status = val & 0xff;
> +	id = (val >> 16) & 0xffff;
> +
> +	if (id != cmd->id) {
> +		dev_warn(&scm_data->dev,
> +			 "Expected response for command %d, but received response for command %d instead.\n",
> +			 cmd->id, id);
> +	}
> +
> +	return status;
> +}
> +
> +int scm_admin_response(const struct scm_data *scm_data)
> +{
> +	return scm_command_response(scm_data, &scm_data->admin_command);
> +}
> +
> +
> +int scm_admin_command_execute(const struct scm_data *scm_data)
> +{
> +	return ocxl_global_mmio_set64(scm_data->ocxl_afu, GLOBAL_MMIO_HCI,
> +				      OCXL_LITTLE_ENDIAN, GLOBAL_MMIO_HCI_ACRW);
> +}
> +
> +static bool scm_admin_command_complete(const struct scm_data *scm_data)
> +{
> +	u64 val = 0;
> +
> +	int rc = scm_chi(scm_data, &val);
> +
> +	WARN_ON(rc);
> +
> +	return (val & GLOBAL_MMIO_CHI_ACRA) != 0;
> +}
> +
> +int scm_admin_command_complete_timeout(const struct scm_data *scm_data,
> +				       int command)
> +{
> +	u32 timeout = scm_data->timeouts[command];
> +	timeout++;
> +	timeout /= 32;
> +	if (!timeout)
> +		timeout = SCM_DEFAULT_TIMEOUT / 32;
> +
> +	while (timeout-- > 0) {
> +		if (scm_admin_command_complete(scm_data))
> +			return 0;
> +		msleep(32);
> +	}
> +
> +	return -EBUSY;
> +}
> +
> +int scm_admin_response_handled(const struct scm_data *scm_data)
> +{
> +	return ocxl_global_mmio_set64(scm_data->ocxl_afu, GLOBAL_MMIO_CHIC,
> +				      OCXL_LITTLE_ENDIAN, GLOBAL_MMIO_CHI_ACRA);
> +}
> +
> +int scm_ns_command_request(struct scm_data *scm_data, u8 op_code)
> +{
> +	return scm_command_request(scm_data, &scm_data->ns_command, op_code);
> +}
> +
> +int scm_ns_response(const struct scm_data *scm_data)
> +{
> +	return scm_command_response(scm_data, &scm_data->ns_command);
> +}
> +
> +int scm_ns_command_execute(const struct scm_data *scm_data)
> +{
> +	return ocxl_global_mmio_set64(scm_data->ocxl_afu, GLOBAL_MMIO_HCI,
> +				      OCXL_LITTLE_ENDIAN, GLOBAL_MMIO_HCI_NSCRW);
> +}
> +
> +bool scm_ns_command_complete(const struct scm_data *scm_data)
> +{
> +	u64 val = 0;
> +	int rc = scm_chi(scm_data, &val);
> +
> +	WARN_ON(rc);
> +
> +	return (val & GLOBAL_MMIO_CHI_NSCRA) != 0;
> +}
> +
> +int scm_ns_response_handled(const struct scm_data *scm_data)
> +{
> +	return ocxl_global_mmio_set64(scm_data->ocxl_afu, GLOBAL_MMIO_CHIC,
> +				      OCXL_LITTLE_ENDIAN, GLOBAL_MMIO_CHI_NSCRA);
> +}
> +
> +
> +void scm_warn_status(const struct scm_data *scm_data, const char *message,
> +		     u8 status)
> +{
> +	const char *text = "Unknown";
> +
> +	switch (status) {
> +	case STATUS_SUCCESS:
> +		text = "Success";
> +		break;
> +
> +	case STATUS_MEM_UNAVAILABLE:
> +		text = "Persistent memory unavailable";
> +		break;
> +
> +	case STATUS_BAD_OPCODE:
> +		text = "Bad opcode";
> +		break;
> +
> +	case STATUS_BAD_REQUEST_PARM:
> +		text = "Bad request parameter";
> +		break;
> +
> +	case STATUS_BAD_DATA_PARM:
> +		text = "Bad data parameter";
> +		break;
> +
> +	case STATUS_DEBUG_BLOCKED:
> +		text = "Debug action blocked";
> +		break;
> +
> +	case STATUS_FAIL:
> +		text = "Failed";
> +		break;
> +	}
> +
> +	dev_warn(&scm_data->dev, "%s: %s (%x)\n", message, text, status);
> +}
> +
> +void scm_warn_status_fw_update(const struct scm_data *scm_data,
> +			       const char *message, u8 status)
> +{
> +	const char *text;
> +
> +	switch (status) {
> +	case STATUS_FW_UPDATE_BLOCKED:
> +		text = "Firmware update is blocked, please try again later";
> +		break;
> +
> +	case STATUS_FW_ARG_INVALID:
> +		text = "Internal error in SCM firmware update mechanism";
> +		break;
> +
> +	case STATUS_FW_INVALID:
> +		text = "Firmware content is invalid, please verify firmware update file";
> +		break;
> +
> +	default:
> +		return scm_warn_status(scm_data, message, status);
> +	}
> +
> +	dev_warn(&scm_data->dev, "%s: %s (%x)\n", message, text, status);
> +}
> diff --git a/drivers/nvdimm/ocxl-scm_internal.h b/drivers/nvdimm/ocxl-scm_internal.h
> new file mode 100644
> index 000000000000..c236d8092c6d
> --- /dev/null
> +++ b/drivers/nvdimm/ocxl-scm_internal.h
> @@ -0,0 +1,331 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright 2019 IBM Corp.
> +
> +#include <linux/pci.h>
> +#include <linux/cdev.h>
> +#include <misc/ocxl.h>
> +#include <linux/libnvdimm.h>
> +#include <uapi/linux/ocxl-scm.h>
> +#include <linux/mm.h>
> +
> +#define SCM_DEFAULT_TIMEOUT 100
> +
> +#define GLOBAL_MMIO_CHI		0x000
> +#define GLOBAL_MMIO_CHIC	0x008
> +#define GLOBAL_MMIO_CHIE	0x010
> +#define GLOBAL_MMIO_CHIEC	0x018
> +#define GLOBAL_MMIO_HCI		0x020
> +#define GLOBAL_MMIO_HCIC	0x028
> +#define GLOBAL_MMIO_IMA0_OHP	0x040
> +#define GLOBAL_MMIO_IMA0_CFP	0x048
> +#define GLOBAL_MMIO_IMA1_OHP	0x050
> +#define GLOBAL_MMIO_IMA1_CFP	0x058
> +#define GLOBAL_MMIO_ACMA_CREQO	0x100
> +#define GLOBAL_MMIO_ACMA_CRSPO	0x104
> +#define GLOBAL_MMIO_ACMA_CDBO	0x108
> +#define GLOBAL_MMIO_ACMA_CDBS	0x10c
> +#define GLOBAL_MMIO_NSCMA_CREQO	0x120
> +#define GLOBAL_MMIO_NSCMA_CRSPO	0x124
> +#define GLOBAL_MMIO_NSCMA_CDBO	0x128
> +#define GLOBAL_MMIO_NSCMA_CDBS	0x12c
> +#define GLOBAL_MMIO_CSTS	0x140
> +#define GLOBAL_MMIO_FWVER	0x148
> +#define GLOBAL_MMIO_CCAP0	0x160
> +#define GLOBAL_MMIO_CCAP1	0x168
> +
> +#define GLOBAL_MMIO_CHI_ACRA	BIT_ULL(0)
> +#define GLOBAL_MMIO_CHI_NSCRA	BIT_ULL(1)
> +#define GLOBAL_MMIO_CHI_CRDY	BIT_ULL(4)
> +#define GLOBAL_MMIO_CHI_CFFS	BIT_ULL(5)
> +#define GLOBAL_MMIO_CHI_MA	BIT_ULL(6)
> +#define GLOBAL_MMIO_CHI_ELA	BIT_ULL(7)
> +#define GLOBAL_MMIO_CHI_CDA	BIT_ULL(8)
> +#define GLOBAL_MMIO_CHI_CHFS	BIT_ULL(9)
> +
> +#define GLOBAL_MMIO_CHI_ALL	(GLOBAL_MMIO_CHI_ACRA | \
> +				 GLOBAL_MMIO_CHI_NSCRA | \
> +				 GLOBAL_MMIO_CHI_CRDY | \
> +				 GLOBAL_MMIO_CHI_CFFS | \
> +				 GLOBAL_MMIO_CHI_MA | \
> +				 GLOBAL_MMIO_CHI_ELA | \
> +				 GLOBAL_MMIO_CHI_CDA | \
> +				 GLOBAL_MMIO_CHI_CHFS)
> +
> +#define GLOBAL_MMIO_HCI_ACRW				BIT_ULL(0)
> +#define GLOBAL_MMIO_HCI_NSCRW				BIT_ULL(1)
> +#define GLOBAL_MMIO_HCI_AFU_RESET			BIT_ULL(2)
> +#define GLOBAL_MMIO_HCI_FW_DEBUG			BIT_ULL(3)
> +#define GLOBAL_MMIO_HCI_CONTROLLER_DUMP			BIT_ULL(4)
> +#define GLOBAL_MMIO_HCI_CONTROLLER_DUMP_COLLECTED	BIT_ULL(5)
> +#define GLOBAL_MMIO_HCI_REQ_HEALTH_PERF			BIT_ULL(6)
> +
> +#define ADMIN_COMMAND_HEARTBEAT		0x00u
> +#define ADMIN_COMMAND_SHUTDOWN		0x01u
> +#define ADMIN_COMMAND_FW_UPDATE		0x02u
> +#define ADMIN_COMMAND_FW_DEBUG		0x03u
> +#define ADMIN_COMMAND_ERRLOG		0x04u
> +#define ADMIN_COMMAND_SMART		0x05u
> +#define ADMIN_COMMAND_CONTROLLER_STATS	0x06u
> +#define ADMIN_COMMAND_CONTROLLER_DUMP	0x07u
> +#define ADMIN_COMMAND_CMD_CAPS		0x08u
> +#define ADMIN_COMMAND_MAX		0x08u
> +
> +#define NS_COMMAND_SECURE_ERASE	0x20ull
> +
> +#define NS_RESPONSE_SECURE_ERASE_ACCESSIBLE_SUCCESS 0x20
> +#define NS_RESPONSE_SECURE_ERASE_ACCESSIBLE_ATTEMPTED 0x28
> +#define NS_RESPONSE_SECURE_ERASE_DEFECTIVE_SUCCESS 0x30
> +#define NS_RESPONSE_SECURE_ERASE_DEFECTIVE_ATTEMPTED 0x38
> +
> +
> +
> +#define STATUS_SUCCESS		0x00
> +#define STATUS_MEM_UNAVAILABLE	0x20
> +#define STATUS_BAD_OPCODE	0x50
> +#define STATUS_BAD_REQUEST_PARM	0x51
> +#define STATUS_BAD_DATA_PARM	0x52
> +#define STATUS_DEBUG_BLOCKED	0x70
> +#define STATUS_FAIL		0xFF
> +
> +#define STATUS_FW_UPDATE_BLOCKED 0x21
> +#define STATUS_FW_ARG_INVALID	0x51
> +#define STATUS_FW_INVALID	0x52
> +
> +#define SCM_LABEL_AREA_SIZE	(1UL << PA_SECTION_SHIFT)
> +
> +struct command_metadata {
> +	u32 request_offset;
> +	u32 response_offset;
> +	u32 data_offset;
> +	u32 data_size;
> +	struct mutex lock;
> +	u16 id;
> +	u8 op_code;
> +};
> +
> +struct scm_function_0 {
> +	struct pci_dev *pdev;
> +	struct ocxl_fn *ocxl_fn;
> +};
> +
> +enum overwrite_state {
> +	SCM_OVERWRITE_IDLE = 0,
> +	SCM_OVERWRITE_BUSY,
> +	SCM_OVERWRITE_SUCCESS,
> +	SCM_OVERWRITE_FAILED
> +};
> +
> +#define SCM_SMART_ATTR_POWER_ON_HOURS	0x09
> +#define SCM_SMART_ATTR_TEMPERATURE	0xC2
> +#define SCM_SMART_ATTR_LIFE_REMAINING	0xCA
> +
> +struct scm_smart_attrib {
> +	__u8 id; /* out, See defines above */
> +	__u16 attribute_flags;
> +	__u8 current_val;
> +	__u8 threshold_val;
> +	__u8 worst_val;
> +	__u8 reserved;
> +	__u64 raw_val;
> +};
> +
> +struct scm_smart_attribs {
> +	struct scm_smart_attrib power_on_hours;
> +	struct scm_smart_attrib temperature;
> +	struct scm_smart_attrib life_remaining;
> +};
> +
> +struct scm_data {
> +	struct device dev;
> +	struct pci_dev *pdev;
> +	struct cdev cdev;
> +	struct ocxl_fn *ocxl_fn;
> +#define SCM_IRQ_COUNT 2
> +	int irq_id[SCM_IRQ_COUNT];
> +	struct dev_pagemap irq_pgmap[SCM_IRQ_COUNT];
> +	void *irq_addr[SCM_IRQ_COUNT];
> +	struct nd_interleave_set nd_set;
> +	struct nvdimm_bus_descriptor bus_desc;
> +	struct nvdimm_bus *nvdimm_bus;
> +	struct ocxl_afu *ocxl_afu;
> +	struct ocxl_context *ocxl_context;
> +	void *metadata_addr;
> +	struct scm_global_mmio *global_mmio;
> +	struct command_metadata admin_command;
> +	struct command_metadata ns_command;
> +	enum overwrite_state overwrite_state;
> +	struct resource scm_res;
> +	struct nd_region *nd_region;
> +	struct eventfd_ctx *ev_ctx;
> +	struct scm_smart_attribs smart;
> +	char fw_version[8+1];
> +	u32 timeouts[ADMIN_COMMAND_MAX+1];
> +
> +	u16 scm_revision; // major/minor
> +	u16 readiness_timeout; /* The worst case time (in milliseconds) that the host shall
> +				* wait for the controller to become operational following a reset (CHI.CRDY).
> +				*/
> +	u16 read_latency; /* The nominal measure of latency (in nanoseconds)
> +			   * associated with an unassisted read of a memory block.
> +			   * This represents the capability of the raw media technology without assistance
> +			   */
> +	u32 max_controller_dump_size; // bytes
> +};
> +
> +/**
> + * Create sysfs entries for an SCM device
> + * scm_data: The SCM metadata
> + */
> +int scm_sysfs_add(struct scm_data *scm_data);
> +
> +/**
> + * Get the value of the CHI register:
> + * scm_data: The SCM metadata
> + * chi: returns the CHI value
> + *
> + * Returns 0 on success, negative on error
> + */
> +int scm_chi(const struct scm_data *scm_data, u64 *chi);
> +
> +/**
> + * scm_controller_is_ready - Is the controller ready?
> + * @scm_data: a pointer to the SCM device data
> + * Return true if the controller is ready
> + */
> +bool scm_controller_is_ready(const struct scm_data *scm_data);
> +
> +/**
> + * Issue an admin command request
> + *
> + * scm_data: a pointer to the SCM device data
> + * op_code: The op-code for the command
> + *
> + * Returns an identifier for the command, or negative on error
> + */
> +int scm_admin_command_request(struct scm_data *scm_data, u8 op_code);
> +
> +/**
> + * Validate an admin response
> + *
> + * scm_data: a pointer to the SCM device data
> + *
> + * Returns the status code of the command, or negative on error
> + */
> +int scm_admin_response(const struct scm_data *scm_data);
> +
> +/**
> + * Notify the controller to start processing a pending admin command
> + *
> + * scm_data: a pointer to the SCM device data
> + *
> + * Returns 0 on success, negative on error
> + */
> +int scm_admin_command_execute(const struct scm_data *scm_data);
> +
> +/**
> + * Wait for an admin command to finish executing
> + *
> + * scm_data: a pointer to the SCM device data
> + * command: the admin command to wait for completion (determines the timeout)
> + *
> + * Returns 0 on success, -EBUSY on timeout
> + */
> +int scm_admin_command_complete_timeout(const struct scm_data *scm_data,
> +				       int command);
> +
> +/**
> + * Notify the controller that the admin response has been handled
> + *
> + * scm_data: a pointer to the SCM device data
> + *
> + * Returns 0 on success, negative on failure
> + */
> +int scm_admin_response_handled(const struct scm_data *scm_data);
> +
> +/**
> + * Issue a near storage command request
> + *
> + * scm_data: a pointer to the SCM device data
> + * op_code: The op-code for the command
> + *
> + * Returns an identifier for the command, or negative on error
> + */
> +int scm_ns_command_request(struct scm_data *scm_data, u8 op_code);
> +
> +/**
> + * Validate a near storage response
> + *
> + * scm_data: a pointer to the SCM device data
> + *
> + * Returns the status code of the command, or negative on error
> + */
> +int scm_ns_response(const struct scm_data *scm_data);
> +
> +/**
> + * Notify the controller to start processing a pending near storage command
> + *
> + * scm_data: a pointer to the SCM device data
> + *
> + * Returns 0 on success, negative on error
> + */
> +int scm_ns_command_execute(const struct scm_data *scm_data);
> +
> +/**
> + * Is a near storage command executing
> + *
> + * scm_data: a pointer to the SCM device data
> + *
> + * Returns true if the previous admin command has completed
> + */
> +bool scm_ns_command_complete(const struct scm_data *scm_data);
> +
> +/**
> + * Notify the controller that the near storage response has been handled
> + *
> + * scm_data: a pointer to the SCM device data
> + *
> + * Returns 0 on success, negative on failure
> + */
> +int scm_ns_response_handled(const struct scm_data *scm_data);
> +
> +/**
> + * Emit a kernel warning showing a command status.
> + *
> + * scm_data: a pointer to the SCM device data
> + * message: A message to accompany the warning
> + * status: The command status
> + */
> +void scm_warn_status(const struct scm_data *scm_data, const char *message,
> +		     u8 status);
> +
> +/**
> + * Emit a kernel warning showing a command status.
> + *
> + * scm_data: a pointer to the SCM device data
> + * message: A message to accompany the warning
> + * status: The command status
> + */
> +void scm_warn_status_fw_update(const struct scm_data *scm_data,
> +			       const char *message, u8 status);
> +
> +/**
> + * Request a controller dump
> + *
> + * scm_data: a pointer to the SCM device data
> + */
> +int scm_request_controller_dump(struct scm_data *scm_data);
> +
> +/**
> + * Request health & performance data (this will emit error logs with the information)
> + *
> + * scm_data: a pointer to the SCM device data
> + */
> +int scm_req_controller_health_perf(struct scm_data *scm_data);
> +
> +
> +/**
> + * scm_overwrite() - Overwrite all data on the card
> + * @scm_data: The SCM device data
> + * Return: 0 on success
> + */
> +int scm_overwrite(struct scm_data *scm_data);
> diff --git a/drivers/nvdimm/ocxl-scm_sysfs.c b/drivers/nvdimm/ocxl-scm_sysfs.c
> new file mode 100644
> index 000000000000..080bbdeb0e56
> --- /dev/null
> +++ b/drivers/nvdimm/ocxl-scm_sysfs.c
> @@ -0,0 +1,219 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright 2018 IBM Corp.
> +
> +#include <linux/sysfs.h>
> +#include <linux/capability.h>
> +#include <linux/limits.h>
> +#include <linux/firmware.h>
> +#include "ocxl-scm_internal.h"
> +
> +static ssize_t admin_command_buffer_size_show(struct device *device,
> +	struct device_attribute *attr,
> +	char *buf)
> +{
> +	struct scm_data *scm_data = container_of(device, struct scm_data, dev);
> +
> +	return scnprintf(buf, PAGE_SIZE, "%d\n", scm_data->admin_command.data_size);
> +}
> +
> +static ssize_t fw_version_show(struct device *device,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	struct scm_data *scm_data = container_of(device, struct scm_data, dev);
> +
> +	return scnprintf(buf, PAGE_SIZE, "%s\n", scm_data->fw_version);
> +}
> +
> +#define SCM_FWUPDATE_BLOCK_SIZE	32768
> +
> +/**
> + * scm_update_firmware() - Write a 32kB block of data to firmware
> + * The block may be less than 32kB if it is the last one
> + *
> + * scm_data the SCM device metadata
> + * offset: the offset of the start of the block
> + * buf: the block data
> + * size: the size of the block
> + */
> +static ssize_t scm_update_firmware(struct scm_data *scm_data, size_t offset,
> +				   const char *buf, size_t size)
> +{
> +	int rc;
> +	size_t i;
> +	u64 val;
> +
> +	if (size > SCM_FWUPDATE_BLOCK_SIZE)
> +		return -EINVAL;
> +
> +	rc = scm_admin_command_request(scm_data, ADMIN_COMMAND_FW_UPDATE);
> +	if (rc)
> +		return rc;
> +
> +	val = (((u64)offset) << 32) | size;
> +	rc = ocxl_global_mmio_write64(scm_data->ocxl_afu,
> +				      scm_data->admin_command.request_offset + 8,
> +				      OCXL_LITTLE_ENDIAN, val);
> +	if (rc)
> +		return rc;
> +
> +	for (i = 0; i < size; i += 8) {
> +		val = *(u64 *)(buf + i);
> +		rc = ocxl_global_mmio_write64(scm_data->ocxl_afu,
> +					      scm_data->admin_command.data_offset + i,
> +					      OCXL_HOST_ENDIAN, val);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	rc = scm_admin_command_execute(scm_data);
> +	if (rc)
> +		return rc;
> +
> +	rc = scm_admin_command_complete_timeout(scm_data,
> +						ADMIN_COMMAND_FW_UPDATE);
> +	if (rc < 0) {
> +		dev_err(&scm_data->dev, "Firmware update timeout\n");
> +		return rc;
> +	}
> +
> +	rc = scm_admin_response(scm_data);
> +	if (rc < 0)
> +		return rc;
> +	if (rc != STATUS_SUCCESS) {
> +		scm_warn_status_fw_update(scm_data, "FW Update", rc);
> +		return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Parse out a firmware filename from sysfs, retrieve it's contents and write it
> + * to the SCM device firmware storage
> + */
> +static ssize_t fw_update_filename_store(struct device *device,
> +					struct device_attribute *attr,
> +					const char *buf, size_t size)
> +{
> +	char path[NAME_MAX+1];
> +	const char *end;
> +	const struct firmware *firmware = NULL;
> +	size_t offset;
> +	int rc;
> +	struct scm_data *scm_data = container_of(device, struct scm_data, dev);
> +
> +	if (!capable(CAP_SYS_ADMIN))
> +		return -EACCES;
> +
> +	end = strnchr(buf, size, '\n');
> +	if (end == NULL)
> +		end = buf + strnlen(buf, size);
> +
> +	if ((end - buf) > NAME_MAX) {
> +		dev_err(device, "Firmware filename '%-.*s' too long\n",
> +			(int)(end - buf), buf);
> +		return -EIO;
> +	}
> +
> +	memcpy(path, buf, end - buf);
> +	path[end - buf] = '\0';
> +
> +	if (request_firmware(&firmware, path, device)) {
> +		dev_err(device, "Firmware file %s not found\n", path);
> +		return -EIO;
> +	}
> +
> +	if (firmware->size % 8) {
> +		release_firmware(firmware);
> +		dev_err(device, "Firmware '%s' should be a multiple of 8 bytes", path);
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&scm_data->admin_command.lock);
> +
> +	for (offset = 0; offset < firmware->size; offset += SCM_FWUPDATE_BLOCK_SIZE) {
> +		size_t remainder = firmware->size - offset;
> +		size_t block_size;
> +
> +		block_size = (remainder > SCM_FWUPDATE_BLOCK_SIZE) ?
> +			      SCM_FWUPDATE_BLOCK_SIZE : remainder;
> +		rc = scm_update_firmware(scm_data, offset,
> +					 firmware->data + offset, block_size);
> +		if (rc) {
> +			mutex_unlock(&scm_data->admin_command.lock);
> +			return -EFAULT;
> +		}
> +	}
> +
> +	mutex_unlock(&scm_data->admin_command.lock);
> +
> +	return size;
> +}
> +
> +/*
> + * Trigger a controller dump
> + */
> +static ssize_t controller_dump_store(struct device *device,
> +				     struct device_attribute *attr,
> +				     const char *buf, size_t size)
> +{
> +	struct scm_data *scm_data = container_of(device, struct scm_data, dev);
> +
> +	scm_request_controller_dump(scm_data);
> +
> +	return size;
> +}
> +
> +/*
> + * Request health & performance data
> + */
> +static ssize_t health_request_store(struct device *device,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t size)
> +{
> +	struct scm_data *scm_data = container_of(device, struct scm_data, dev);
> +
> +	scm_req_controller_health_perf(scm_data);
> +
> +	return size;
> +}
> +
> +/*
> + * Overwrite all media
> + */
> +static ssize_t overwrite_store(struct device *device,
> +			       struct device_attribute *attr,
> +			       const char *buf, size_t size)
> +{
> +	struct scm_data *scm_data = container_of(device, struct scm_data, dev);
> +
> +	scm_overwrite(scm_data);
> +
> +	return size;
> +}
> +
> +static struct device_attribute scm_attrs[] = {
> +	__ATTR_RO(admin_command_buffer_size),
> +	__ATTR_RO(fw_version),
> +	__ATTR_WO(fw_update_filename),
> +	__ATTR_WO(controller_dump),
> +	__ATTR_WO(health_request),
> +	__ATTR_WO(overwrite),
> +};
> +
> +int scm_sysfs_add(struct scm_data *scm_data)
> +{
> +	int i, rc;
> +
> +	for (i = 0; i < ARRAY_SIZE(scm_attrs); i++) {
> +		rc = device_create_file(&scm_data->dev, &scm_attrs[i]);
> +		if (rc) {
> +			for (; --i >= 0;)
> +				device_remove_file(&scm_data->dev, &scm_attrs[i]);
> +
> +			return rc;
> +		}
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(scm_sysfs_add);
> diff --git a/include/uapi/linux/ocxl-scm.h b/include/uapi/linux/ocxl-scm.h
> new file mode 100644
> index 000000000000..6dc7e5196da2
> --- /dev/null
> +++ b/include/uapi/linux/ocxl-scm.h
> @@ -0,0 +1,128 @@
> +/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
> +/* Copyright 2017 IBM Corp. */
> +#ifndef _UAPI_OCXL_SCM_H
> +#define _UAPI_OCXL_SCM_H
> +
> +#include <linux/types.h>
> +#include <linux/ioctl.h>
> +
> +enum scm_fwdebug_action {
> +	SCM_FWDEBUG_READ_CONTROLLER_MEMORY = 0x01,
> +	SCM_FWDEBUG_WRITE_CONTROLLER_MEMORY = 0x02,
> +	SCM_FWDEBUG_ENABLE_FUNCTION = 0x03,
> +	SCM_FWDEBUG_DISABLE_FUNCTION = 0x04,
> +	SCM_FWDEBUG_GET_PEL = 0x05, // Retrieve Persistent Error Log
> +};
> +
> +struct scm_ioctl_buffer_info {
> +	__u32	admin_command_buffer_size; // out
> +	__u32	near_storage_buffer_size; // out
> +};
> +
> +struct scm_ioctl_fwdebug { // All args are inputs
> +	enum scm_fwdebug_action debug_action;
> +	__u16 function_code;
> +	__u16 buf_size; // Size of optional data buffer
> +	__u64 debug_parameter_1;
> +	__u64 debug_parameter_2;
> +	__u8 *buf; // Pointer to optional in/out data buffer
> +};
> +
> +#define SCM_ERROR_LOG_ACTION_RESET	(1 << (32-32))
> +#define SCM_ERROR_LOG_ACTION_CHKFW	(1 << (53-32))
> +#define SCM_ERROR_LOG_ACTION_REPLACE	(1 << (54-32))
> +#define SCM_ERROR_LOG_ACTION_DUMP	(1 << (55-32))
> +
> +#define SCM_ERROR_LOG_TYPE_GENERAL		(0x00)
> +#define SCM_ERROR_LOG_TYPE_PREDICTIVE_FAILURE	(0x01)
> +#define SCM_ERROR_LOG_TYPE_THERMAL_WARNING	(0x02)
> +#define SCM_ERROR_LOG_TYPE_DATA_LOSS		(0x03)
> +#define SCM_ERROR_LOG_TYPE_HEALTH_PERFORMANCE	(0x04)
> +
> +struct scm_ioctl_error_log {
> +	__u32 log_identifier; // out
> +	__u32 program_reference_code; // out
> +	__u32 action_flags; //out, recommended course of action
> +	__u32 power_on_seconds; // out, Number of seconds the controller has been on when the error occurred
> +	__u64 timestamp; // out, relative time since the current IPL
> +	__u64 wwid[2]; // out, the NAA formatted WWID associated with the controller
> +	char  fw_revision[8+1]; // out, firmware revision as null terminated text
> +	__u16 buf_size; /* in/out, buffer size provided/required.
> +			 * If required is greater than provided, the buffer
> +			 * will be truncated to the amount provided. If its
> +			 * less, then only the required bytes will be populated.
> +			 * If it is 0, then there are no more error log entries.
> +			 */
> +	__u8  error_log_type;
> +	__u8  reserved1;
> +	__u32 reserved2;
> +	__u64 reserved3[2];
> +	__u8 *buf; // pointer to output buffer
> +};
> +
> +struct scm_ioctl_controller_dump_data {
> +	__u8 *buf; // pointer to output buffer
> +	__u16 buf_size; /* in/out, buffer size provided/required.
> +			 * If required is greater than provided, the buffer
> +			 * will be truncated to the amount provided. If its
> +			 * less, then only the required bytes will be populated.
> +			 * If it is 0, then there is no more dump data available.
> +			 */
> +	__u32 offset; // in, Offset within the dump
> +	__u64 reserved[8];
> +};
> +
> +struct scm_ioctl_controller_stats {
> +	__u32 reset_count;
> +	__u32 reset_uptime; // seconds
> +	__u32 power_on_uptime; // seconds
> +	__u64 host_load_count;
> +	__u64 host_store_count;
> +	__u64 media_read_count;
> +	__u64 media_write_count;
> +	__u64 cache_hit_count;
> +	__u64 cache_miss_count;
> +	__u64 media_read_latency; // nanoseconds
> +	__u64 media_write_latency; // nanoseconds
> +	__u64 cache_read_latency; // nanoseconds
> +	__u64 cache_write_latency; // nanoseconds
> +};
> +
> +struct scm_ioctl_mmio {
> +	__u64 address; // Offset in global MMIO space
> +	__u64 val; // value to write/was read
> +};
> +
> +struct scm_ioctl_eventfd {
> +	__s32 eventfd;
> +	__u32 reserved;
> +};
> +
> +#ifndef BIT_ULL
> +#define BIT_ULL(nr)	(1ULL << (nr))
> +#endif
> +
> +#define SCM_IOCTL_EVENT_CONTROLLER_DUMP_AVAILABLE	BIT_ULL(0)
> +#define SCM_IOCTL_EVENT_ERROR_LOG_AVAILABLE		BIT_ULL(1)
> +#define SCM_IOCTL_EVENT_HARDWARE_FATAL			BIT_ULL(2)
> +#define SCM_IOCTL_EVENT_FIRMWARE_FATAL			BIT_ULL(3)
> +
> +/* ioctl numbers */
> +#define SCM_MAGIC 0x5C
> +/* SCM devices */
> +#define SCM_IOCTL_BUFFER_INFO	_IOR(SCM_MAGIC, 0x00, struct scm_ioctl_buffer_info)
> +#define SCM_IOCTL_ERROR_LOG	_IOWR(SCM_MAGIC, 0x01, struct scm_ioctl_error_log)
> +#define SCM_IOCTL_CONTROLLER_DUMP _IO(SCM_MAGIC, 0x02)
> +#define SCM_IOCTL_CONTROLLER_DUMP_DATA _IOWR(SCM_MAGIC, 0x03, struct scm_ioctl_controller_dump_data)
> +#define SCM_IOCTL_CONTROLLER_DUMP_COMPLETE _IO(SCM_MAGIC, 0x04)
> +#define SCM_IOCTL_CONTROLLER_STATS _IO(SCM_MAGIC, 0x05)
> +#define SCM_IOCTL_EVENTFD	_IOW(SCM_MAGIC, 0x06, struct scm_ioctl_eventfd)
> +#define SCM_IOCTL_EVENT_CHECK	_IOR(SCM_MAGIC, 0x07, __u64)
> +#define SCM_IOCTL_REQUEST_HEALTH _IO(SCM_MAGIC, 0x08)
> +
> +#define SCM_IOCTL_FWDEBUG	_IOWR(SCM_MAGIC, 0xf0, struct scm_ioctl_fwdebug)
> +#define SCM_IOCTL_MMIO_WRITE	_IOW(SCM_MAGIC, 0xf1, struct scm_ioctl_mmio)
> +#define SCM_IOCTL_MMIO_READ	_IOWR(SCM_MAGIC, 0xf2, struct scm_ioctl_mmio)
> +#define SCM_IOCTL_SHUTDOWN	_IO(SCM_MAGIC, 0xf3)
> +
> +#endif /* _UAPI_OCXL_SCM_H */
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index b39827dbd071..376500f4e3a2 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -279,7 +279,7 @@ static int check_pfn_span(unsigned long pfn, unsigned long nr_pages,
>   }
>   
>   int check_hotplug_memory_addressable(unsigned long pfn,
> -					    unsigned long nr_pages)
> +				     unsigned long nr_pages)
>   {
>   	const u64 max_addr = PFN_PHYS(pfn + nr_pages) - 1;
>   
> 

