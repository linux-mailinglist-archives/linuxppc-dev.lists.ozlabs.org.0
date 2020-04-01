Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED2919A854
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 11:11:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sgRW0GThzDqTF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 20:11:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=mMv5Bd4Z; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sfzB4gxnzDqM9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 19:50:14 +1100 (AEDT)
Received: by mail-ed1-x543.google.com with SMTP id cw6so27959684edb.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 01:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XHgLLXEovhdQ8/FrF8h4eEHtV+U2H4hcr760FZzz/74=;
 b=mMv5Bd4ZB72cHpMckZb72EwMnAQhOCBe2UrER2FchcovkVBDLp5XaiCvgv85nn36It
 By8IuWO/GFNC/wRHAAApy4RYqGDZhMy7JV/bO/U/DPl3qG2WFQGE+aY1cqfknXx0dxpk
 dRObsf7RuJ1Tv1WGmr7GBYG4Ten4GrtPbaD3KU72cOYMERtODlZeoEvWxq0AqnWN5hZA
 baQ4tDI0urNNxMqf91Z98S2A+xecjeUdyrQrzwBuEsdNrBIqfo+4v3oXEOXE5tnq46lf
 QQt59hQW2YV08tr+SIgIYdVBaacdlYCzSWkKEEX0ms3WRyq9/wFH8X87ppF3y+UJyrvR
 +Rog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XHgLLXEovhdQ8/FrF8h4eEHtV+U2H4hcr760FZzz/74=;
 b=N/c72UrSpvGrYWWxC5l4S5611iqsOTnFNOTKWZJjf99v2ONDvkIHzo0u0zMULEzW5e
 w1T3+bnCzmTTKDuMrzF69UeRUWvzkEMEfO28zPV/3PMZlLmTwhPBJNPH+W6mHCJLzQvU
 1dUN9gtLPIo6c40jA8a6x17FWU9jNcmK/i7Ub2j3Pr6VlkEOwGJTpl9sPxNLp12PTsVU
 mC5bjeFsRMk1jWOCXldPoA+RbtyKkfFTKQn59MxI2B3yLP7nsoyVi9JX+kSpdIBaOaZR
 EQ8W9VvJ0o++WqR7Uh+Ct5el+eYsna3Y6NhbJBJggbBK4N1ndFGKumXiM7uwKqf+lG4Z
 a3Cg==
X-Gm-Message-State: ANhLgQ33b14LJo+7m2f/Lp3tY2fFTLm8ieJUBeUfW6v3DiBSlMnbWoZP
 PwfJIT//2IhHzBsc0U9wZSa1iGPeXJL7rYr9/1WyGw==
X-Google-Smtp-Source: ADFU+vv7lPeVqcsX3B9gMak8Zz7MsSupEtSpk5ipSG14Lr8260+Oyuh770AifA0Ls/fyq6qgPb31JxxkPJywwf+ERI8=
X-Received: by 2002:a17:906:1697:: with SMTP id
 s23mr19738792ejd.211.1585731010236; 
 Wed, 01 Apr 2020 01:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200327071202.2159885-1-alastair@d-silva.org>
 <20200327071202.2159885-11-alastair@d-silva.org>
In-Reply-To: <20200327071202.2159885-11-alastair@d-silva.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 1 Apr 2020 01:49:59 -0700
Message-ID: <CAPcyv4gQVuHLHy7YuEEk7uTtknTugwrDzosiVQm5bMoB9udPng@mail.gmail.com>
Subject: Re: [PATCH v4 10/25] nvdimm: Add driver for OpenCAPI Persistent Memory
To: "Alastair D'Silva" <alastair@d-silva.org>
Content-Type: text/plain; charset="UTF-8"
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
 Ira Weiny <ira.weiny@intel.com>, Rob Herring <robh@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 Linux MM <linux-mm@kvack.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Mar 29, 2020 at 10:23 PM Alastair D'Silva <alastair@d-silva.org> wrote:
>
> This driver exposes LPC memory on OpenCAPI pmem cards
> as an NVDIMM, allowing the existing nvram infrastructure
> to be used.
>
> Namespace metadata is stored on the media itself, so
> scm_reserve_metadata() maps 1 section's worth of PMEM storage
> at the start to hold this. The rest of the PMEM range is registered
> with libnvdimm as an nvdimm. ndctl_config_read/write/size() provide
> callbacks to libnvdimm to access the metadata.
>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  drivers/nvdimm/Kconfig         |   2 +
>  drivers/nvdimm/Makefile        |   1 +
>  drivers/nvdimm/ocxl/Kconfig    |  15 ++
>  drivers/nvdimm/ocxl/Makefile   |   7 +
>  drivers/nvdimm/ocxl/main.c     | 476 +++++++++++++++++++++++++++++++++
>  drivers/nvdimm/ocxl/ocxlpmem.h |  23 ++
>  6 files changed, 524 insertions(+)
>  create mode 100644 drivers/nvdimm/ocxl/Kconfig
>  create mode 100644 drivers/nvdimm/ocxl/Makefile
>  create mode 100644 drivers/nvdimm/ocxl/main.c
>  create mode 100644 drivers/nvdimm/ocxl/ocxlpmem.h
>
> diff --git a/drivers/nvdimm/Kconfig b/drivers/nvdimm/Kconfig
> index b7d1eb38b27d..368328637182 100644
> --- a/drivers/nvdimm/Kconfig
> +++ b/drivers/nvdimm/Kconfig
> @@ -131,4 +131,6 @@ config NVDIMM_TEST_BUILD
>           core devm_memremap_pages() implementation and other
>           infrastructure.
>
> +source "drivers/nvdimm/ocxl/Kconfig"
> +
>  endif
> diff --git a/drivers/nvdimm/Makefile b/drivers/nvdimm/Makefile
> index 29203f3d3069..bc02be11c794 100644
> --- a/drivers/nvdimm/Makefile
> +++ b/drivers/nvdimm/Makefile
> @@ -33,3 +33,4 @@ libnvdimm-$(CONFIG_NVDIMM_KEYS) += security.o
>  TOOLS := ../../tools
>  TEST_SRC := $(TOOLS)/testing/nvdimm/test
>  obj-$(CONFIG_NVDIMM_TEST_BUILD) += $(TEST_SRC)/iomap.o
> +obj-$(CONFIG_LIBNVDIMM) += ocxl/
> diff --git a/drivers/nvdimm/ocxl/Kconfig b/drivers/nvdimm/ocxl/Kconfig
> new file mode 100644
> index 000000000000..c5d927520920
> --- /dev/null
> +++ b/drivers/nvdimm/ocxl/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +if LIBNVDIMM
> +
> +config OCXL_PMEM
> +       tristate "OpenCAPI Persistent Memory"
> +       depends on LIBNVDIMM && PPC_POWERNV && PCI && EEH && ZONE_DEVICE && OCXL

Does OXCL_PMEM itself have any CONFIG_ZONE_DEVICE dependencies? That's
more a function of CONFIG_DEV_DAX and CONFIG_FS_DAX. Doesn't OCXL
already depend on CONFIG_PCI?


> +       help
> +         Exposes devices that implement the OpenCAPI Storage Class Memory
> +         specification as persistent memory regions. You may also want
> +         DEV_DAX, DEV_DAX_PMEM & FS_DAX if you plan on using DAX devices
> +         stacked on top of this driver.
> +
> +         Select N if unsure.
> +
> +endif
> diff --git a/drivers/nvdimm/ocxl/Makefile b/drivers/nvdimm/ocxl/Makefile
> new file mode 100644
> index 000000000000..e0e8ade1987a
> --- /dev/null
> +++ b/drivers/nvdimm/ocxl/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +ccflags-$(CONFIG_PPC_WERROR)   += -Werror
> +
> +obj-$(CONFIG_OCXL_PMEM) += ocxlpmem.o
> +
> +ocxlpmem-y := main.o
> \ No newline at end of file
> diff --git a/drivers/nvdimm/ocxl/main.c b/drivers/nvdimm/ocxl/main.c
> new file mode 100644
> index 000000000000..c0066fedf9cc
> --- /dev/null
> +++ b/drivers/nvdimm/ocxl/main.c
> @@ -0,0 +1,476 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright 2020 IBM Corp.
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
> +#include "ocxlpmem.h"
> +
> +static const struct pci_device_id pci_tbl[] = {
> +       { PCI_DEVICE(PCI_VENDOR_ID_IBM, 0x0625), },
> +       { }
> +};
> +
> +MODULE_DEVICE_TABLE(pci, pci_tbl);
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
> +                             struct nd_cmd_set_config_hdr *command)
> +{
> +       if (command->in_offset + command->in_length > LABEL_AREA_SIZE)
> +               return -EINVAL;
> +
> +       memcpy_flushcache(ocxlpmem->metadata_addr + command->in_offset,
> +                         command->in_buf, command->in_length);
> +
> +       return 0;
> +}
> +
> +/**
> + * ndctl_config_read() - Handle a ND_CMD_GET_CONFIG_DATA command from ndctl
> + * @ocxlpmem: the device metadata
> + * @command: the read request
> + * Return: 0 on success, negative on failure
> + */
> +static int ndctl_config_read(struct ocxlpmem *ocxlpmem,
> +                            struct nd_cmd_get_config_data_hdr *command)
> +{
> +       if (command->in_offset + command->in_length > LABEL_AREA_SIZE)
> +               return -EINVAL;
> +
> +       memcpy_mcsafe(command->out_buf,
> +                     ocxlpmem->metadata_addr + command->in_offset,
> +                     command->in_length);
> +
> +       return 0;
> +}
> +
> +/**
> + * ndctl_config_size() - Handle a ND_CMD_GET_CONFIG_SIZE command from ndctl
> + * @command: the read request
> + * Return: 0 on success, negative on failure
> + */
> +static int ndctl_config_size(struct nd_cmd_get_config_size *command)
> +{
> +       command->status = 0;
> +       command->config_size = LABEL_AREA_SIZE;
> +       command->max_xfer = PAGE_SIZE;
> +
> +       return 0;
> +}
> +
> +static int ndctl(struct nvdimm_bus_descriptor *nd_desc,
> +                struct nvdimm *nvdimm,
> +                unsigned int cmd, void *buf, unsigned int buf_len, int *cmd_rc)
> +{
> +       struct ocxlpmem *ocxlpmem = container_of(nd_desc,
> +                                                struct ocxlpmem, bus_desc);
> +
> +       switch (cmd) {
> +       case ND_CMD_GET_CONFIG_SIZE:
> +               *cmd_rc = ndctl_config_size(buf);
> +               return 0;
> +
> +       case ND_CMD_GET_CONFIG_DATA:
> +               *cmd_rc = ndctl_config_read(ocxlpmem, buf);
> +               return 0;
> +
> +       case ND_CMD_SET_CONFIG_DATA:
> +               *cmd_rc = ndctl_config_write(ocxlpmem, buf);
> +               return 0;
> +
> +       default:
> +               return -ENOTTY;
> +       }
> +}
> +
> +/**
> + * reserve_metadata() - Reserve space for nvdimm metadata
> + * @ocxlpmem: the device metadata
> + * @lpc_mem: The resource representing the LPC memory of the OpenCAPI device
> + */
> +static int reserve_metadata(struct ocxlpmem *ocxlpmem,
> +                           struct resource *lpc_mem)
> +{
> +       ocxlpmem->metadata_addr = devm_memremap(&ocxlpmem->dev, lpc_mem->start,
> +                                               LABEL_AREA_SIZE, MEMREMAP_WB);
> +       if (IS_ERR(ocxlpmem->metadata_addr))
> +               return PTR_ERR(ocxlpmem->metadata_addr);
> +
> +       return 0;
> +}
> +
> +/**
> + * register_lpc_mem() - Discover persistent memory on a device and register it with the NVDIMM subsystem
> + * @ocxlpmem: the device metadata
> + * Return: 0 on success
> + */
> +static int register_lpc_mem(struct ocxlpmem *ocxlpmem)
> +{
> +       struct nd_region_desc region_desc;
> +       struct nd_mapping_desc nd_mapping_desc;
> +       struct resource *lpc_mem;
> +       const struct ocxl_afu_config *config;
> +       const struct ocxl_fn_config *fn_config;
> +       int rc;
> +       unsigned long nvdimm_cmd_mask = 0;
> +       unsigned long nvdimm_flags = 0;
> +       int target_node;
> +       char serial[16 + 1];
> +
> +       // Set up the reserved metadata area
> +       rc = ocxl_afu_map_lpc_mem(ocxlpmem->ocxl_afu);
> +       if (rc < 0)
> +               return rc;
> +
> +       lpc_mem = ocxl_afu_lpc_mem(ocxlpmem->ocxl_afu);
> +       if (!lpc_mem || !lpc_mem->start)
> +               return -EINVAL;
> +
> +       config = ocxl_afu_config(ocxlpmem->ocxl_afu);
> +       fn_config = ocxl_function_config(ocxlpmem->ocxl_fn);
> +
> +       rc = reserve_metadata(ocxlpmem, lpc_mem);
> +       if (rc)
> +               return rc;
> +
> +       ocxlpmem->bus_desc.provider_name = "ocxlpmem";
> +       ocxlpmem->bus_desc.ndctl = ndctl;
> +       ocxlpmem->bus_desc.module = THIS_MODULE;
> +
> +       ocxlpmem->nvdimm_bus = nvdimm_bus_register(&ocxlpmem->dev,
> +                                                  &ocxlpmem->bus_desc);
> +       if (!ocxlpmem->nvdimm_bus)
> +               return -EINVAL;
> +
> +       ocxlpmem->pmem_res.start = (u64)lpc_mem->start + LABEL_AREA_SIZE;
> +       ocxlpmem->pmem_res.end = (u64)lpc_mem->start + config->lpc_mem_size - 1;
> +       ocxlpmem->pmem_res.name = "OpenCAPI persistent memory";
> +
> +       set_bit(ND_CMD_GET_CONFIG_SIZE, &nvdimm_cmd_mask);
> +       set_bit(ND_CMD_GET_CONFIG_DATA, &nvdimm_cmd_mask);
> +       set_bit(ND_CMD_SET_CONFIG_DATA, &nvdimm_cmd_mask);
> +
> +       set_bit(NDD_ALIASING, &nvdimm_flags);
> +
> +       snprintf(serial, sizeof(serial), "%llx", fn_config->serial);
> +       nd_mapping_desc.nvdimm = nvdimm_create(ocxlpmem->nvdimm_bus, ocxlpmem,
> +                                              NULL, nvdimm_flags,
> +                                              nvdimm_cmd_mask, 0, NULL);
> +       if (!nd_mapping_desc.nvdimm)
> +               return -ENOMEM;
> +
> +       if (nvdimm_bus_check_dimm_count(ocxlpmem->nvdimm_bus, 1))
> +               return -EINVAL;
> +
> +       nd_mapping_desc.start = ocxlpmem->pmem_res.start;
> +       nd_mapping_desc.size = resource_size(&ocxlpmem->pmem_res);
> +       nd_mapping_desc.position = 0;
> +
> +       ocxlpmem->nd_set.cookie1 = fn_config->serial;
> +       ocxlpmem->nd_set.cookie2 = fn_config->serial;
> +
> +       target_node = of_node_to_nid(ocxlpmem->pdev->dev.of_node);
> +
> +       memset(&region_desc, 0, sizeof(region_desc));
> +       region_desc.res = &ocxlpmem->pmem_res;
> +       region_desc.numa_node = NUMA_NO_NODE;
> +       region_desc.target_node = target_node;
> +       region_desc.num_mappings = 1;
> +       region_desc.mapping = &nd_mapping_desc;
> +       region_desc.nd_set = &ocxlpmem->nd_set;
> +
> +       set_bit(ND_REGION_PAGEMAP, &region_desc.flags);
> +       /*
> +        * NB: libnvdimm copies the data from ndr_desc into it's own
> +        * structures so passing a stack pointer is fine.
> +        */
> +       ocxlpmem->nd_region = nvdimm_pmem_region_create(ocxlpmem->nvdimm_bus,
> +                                                       &region_desc);
> +       if (!ocxlpmem->nd_region)
> +               return -EINVAL;
> +
> +       dev_info(&ocxlpmem->dev,
> +                "Onlining %lluMB of persistent memory\n",
> +                nd_mapping_desc.size / SZ_1M);
> +
> +       return 0;
> +}
> +
> +/**
> + * allocate_minor() - Allocate a minor number to use for an OpenCAPI pmem device
> + * @ocxlpmem: the device metadata
> + * Return: the allocated minor number
> + */
> +static int allocate_minor(struct ocxlpmem *ocxlpmem)
> +{
> +       int minor;
> +
> +       mutex_lock(&minors_idr_lock);
> +       minor = idr_alloc(&minors_idr, ocxlpmem, 0, NUM_MINORS, GFP_KERNEL);
> +       mutex_unlock(&minors_idr_lock);
> +       return minor;
> +}
> +
> +static void free_minor(struct ocxlpmem *ocxlpmem)
> +{
> +       mutex_lock(&minors_idr_lock);
> +       idr_remove(&minors_idr, MINOR(ocxlpmem->dev.devt));
> +       mutex_unlock(&minors_idr_lock);
> +}
> +
> +/**
> + * free_ocxlpmem() - Free all members of an ocxlpmem struct
> + * @ocxlpmem: the device struct to clear
> + */
> +static void free_ocxlpmem(struct ocxlpmem *ocxlpmem)
> +{
> +       int rc;
> +
> +       free_minor(ocxlpmem);
> +
> +       if (ocxlpmem->ocxl_context) {
> +               rc = ocxl_context_detach(ocxlpmem->ocxl_context);
> +               if (rc == -EBUSY)
> +                       dev_warn(&ocxlpmem->dev, "Timeout detaching ocxl context\n");
> +               else
> +                       ocxl_context_free(ocxlpmem->ocxl_context);
> +       }
> +
> +       if (ocxlpmem->ocxl_afu)
> +               ocxl_afu_put(ocxlpmem->ocxl_afu);
> +
> +       if (ocxlpmem->ocxl_fn)
> +               ocxl_function_close(ocxlpmem->ocxl_fn);
> +
> +       pci_dev_put(ocxlpmem->pdev);
> +
> +       kfree(ocxlpmem);
> +}
> +
> +/**
> + * free_ocxlpmem_dev() - Free an OpenCAPI persistent memory device
> + * @dev: The device struct
> + */
> +static void free_ocxlpmem_dev(struct device *dev)
> +{
> +       struct ocxlpmem *ocxlpmem = container_of(dev, struct ocxlpmem, dev);
> +
> +       free_ocxlpmem(ocxlpmem);
> +}
> +
> +/**
> + * ocxlpmem_register() - Register an OpenCAPI pmem device with the kernel
> + * @ocxlpmem: the device metadata
> + * Return: 0 on success, negative on failure
> + */
> +static int ocxlpmem_register(struct ocxlpmem *ocxlpmem)
> +{
> +       int rc;
> +       int minor = allocate_minor(ocxlpmem);
> +
> +       if (minor < 0)
> +               return minor;
> +
> +       ocxlpmem->dev.release = free_ocxlpmem_dev;
> +       rc = dev_set_name(&ocxlpmem->dev, "ocxlpmem%d", minor);
> +       if (rc < 0)
> +               return rc;
> +
> +       ocxlpmem->dev.devt = MKDEV(MAJOR(ocxlpmem_dev), minor);
> +       ocxlpmem->dev.class = ocxlpmem_class;
> +       ocxlpmem->dev.parent = &ocxlpmem->pdev->dev;
> +
> +       return device_register(&ocxlpmem->dev);

You lost me, why does this need it's own ioctl path and device node?
I'd expect you you'd tunnel the commands you need through the existing
infrastructure ideally with an eye for cross-arch compatibility. This
is a fundamental concern that probably has significant implications
for what follows.



> +}
> +
> +/**
> + * ocxlpmem_remove() - Free an OpenCAPI persistent memory device
> + * @pdev: the PCI device information struct
> + */
> +static void remove(struct pci_dev *pdev)
> +{
> +       if (PCI_FUNC(pdev->devfn) == 0) {
> +               struct ocxl_fn *func0 = pci_get_drvdata(pdev);
> +
> +               if (func0)
> +                       ocxl_function_close(func0);
> +       } else {
> +               struct ocxlpmem *ocxlpmem = pci_get_drvdata(pdev);
> +
> +               if (!ocxlpmem)
> +                       return;
> +
> +               if (ocxlpmem->nvdimm_bus)
> +                       nvdimm_bus_unregister(ocxlpmem->nvdimm_bus);
> +
> +               device_unregister(&ocxlpmem->dev);
> +       }
> +}
> +
> +/**
> + * probe_function0() - Set up function 0 for an OpenCAPI persistent memory device
> + * This is important as it enables templates higher than 0 across all other
> + * functions, which in turn enables higher bandwidth accesses
> + * @pdev: the PCI device information struct
> + * Return: 0 on success, negative on failure
> + */
> +static int probe_function0(struct pci_dev *pdev)
> +{
> +       struct ocxl_fn *fn;
> +
> +       fn = ocxl_function_open(pdev);
> +       if (IS_ERR(fn)) {
> +               dev_err(&pdev->dev, "failed to open OCXL function\n");
> +               return PTR_ERR(fn);
> +       }
> +
> +       pci_set_drvdata(pdev, fn);
> +
> +       return 0;
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
> +       struct ocxlpmem *ocxlpmem;
> +       int rc;
> +
> +       if (PCI_FUNC(pdev->devfn) == 0)
> +               return probe_function0(pdev);
> +       else if (PCI_FUNC(pdev->devfn) != 1)
> +               return 0;
> +
> +       ocxlpmem = kzalloc(sizeof(*ocxlpmem), GFP_KERNEL);
> +       if (!ocxlpmem) {
> +               rc = -ENOMEM;
> +               goto err;
> +       }
> +
> +       ocxlpmem->pdev = pci_dev_get(pdev);
> +
> +       pci_set_drvdata(pdev, ocxlpmem);
> +
> +       ocxlpmem->ocxl_fn = ocxl_function_open(pdev);
> +       if (IS_ERR(ocxlpmem->ocxl_fn)) {
> +               rc = PTR_ERR(ocxlpmem->ocxl_fn);
> +               dev_err(&pdev->dev, "failed to open OCXL function\n");
> +               goto err_unregistered;
> +       }
> +
> +       ocxlpmem->ocxl_afu = ocxl_function_fetch_afu(ocxlpmem->ocxl_fn, 0);
> +       if (!ocxlpmem->ocxl_afu) {
> +               rc = -ENXIO;
> +               dev_err(&pdev->dev, "Could not get OCXL AFU from function\n");
> +               goto err_unregistered;
> +       }
> +
> +       ocxl_afu_get(ocxlpmem->ocxl_afu);
> +
> +       // Resources allocated below here are cleaned up in the release handler
> +
> +       rc = ocxlpmem_register(ocxlpmem);
> +       if (rc) {
> +               dev_err(&pdev->dev,
> +                       "Could not register OpenCAPI persistent memory device with the kernel\n");
> +               goto err;
> +       }
> +
> +       rc = ocxl_context_alloc(&ocxlpmem->ocxl_context, ocxlpmem->ocxl_afu,
> +                               NULL);
> +       if (rc) {
> +               dev_err(&pdev->dev, "Could not allocate OCXL context\n");
> +               goto err;
> +       }
> +
> +       rc = ocxl_context_attach(ocxlpmem->ocxl_context, 0, NULL);
> +       if (rc) {
> +               dev_err(&pdev->dev, "Could not attach ocxl context\n");
> +               goto err;
> +       }
> +
> +       rc = register_lpc_mem(ocxlpmem);
> +       if (rc) {
> +               dev_err(&pdev->dev,
> +                       "Could not register OpenCAPI persistent memory with libnvdimm\n");
> +               goto err;
> +       }
> +
> +       return 0;
> +
> +err_unregistered:
> +       if (!IS_ERR(ocxlpmem->ocxl_fn))
> +               ocxl_function_close(ocxlpmem->ocxl_fn);
> +       pci_dev_put(ocxlpmem->pdev);
> +       kfree(ocxlpmem);
> +       pci_set_drvdata(pdev, NULL);
> +
> +err:
> +       /*
> +        * Further cleanup is done in the release handler via free_ocxlpmem()
> +        * This allows us to keep the character device live to handle IOCTLs to
> +        * investigate issues if the card has an error
> +        */
> +
> +       dev_err(&pdev->dev,
> +               "Error detected, will not register OpenCAPI persistent memory\n");
> +       return 0;
> +}
> +
> +static struct pci_driver pci_driver = {
> +       .name = "ocxlpmem",
> +       .id_table = pci_tbl,
> +       .probe = probe,
> +       .remove = remove,
> +       .shutdown = remove,
> +};
> +
> +static int __init ocxlpmem_init(void)
> +{
> +       int rc;
> +
> +       mutex_init(&minors_idr_lock);
> +       idr_init(&minors_idr);
> +
> +       rc = pci_register_driver(&pci_driver);
> +       if (rc)
> +               return rc;
> +
> +       return 0;
> +}
> +
> +static void ocxlpmem_exit(void)
> +{
> +       pci_unregister_driver(&pci_driver);
> +}
> +
> +module_init(ocxlpmem_init);
> +module_exit(ocxlpmem_exit);
> +
> +MODULE_DESCRIPTION("OpenCAPI Persistent Memory");
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Alastair D'Silva <alastair@d-silva.org>");
> diff --git a/drivers/nvdimm/ocxl/ocxlpmem.h b/drivers/nvdimm/ocxl/ocxlpmem.h
> new file mode 100644
> index 000000000000..03fe7a264281
> --- /dev/null
> +++ b/drivers/nvdimm/ocxl/ocxlpmem.h
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright 2020 IBM Corp.
> +
> +#include <linux/pci.h>
> +#include <misc/ocxl.h>
> +#include <linux/libnvdimm.h>
> +#include <linux/mm.h>
> +
> +#define LABEL_AREA_SIZE        BIT_ULL(PA_SECTION_SHIFT)
> +
> +struct ocxlpmem {
> +       struct device dev;
> +       struct pci_dev *pdev;
> +       struct ocxl_fn *ocxl_fn;
> +       struct nd_interleave_set nd_set;
> +       struct nvdimm_bus_descriptor bus_desc;
> +       struct nvdimm_bus *nvdimm_bus;
> +       struct ocxl_afu *ocxl_afu;
> +       struct ocxl_context *ocxl_context;
> +       void *metadata_addr;
> +       struct resource pmem_res;
> +       struct nd_region *nd_region;
> +};
> --
> 2.24.1
>
