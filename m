Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC97AF881F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 06:39:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BxQZ1F5czF4jW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 16:39:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="ZI6CLsXQ"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BxNJ4k64zDq5k
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 16:37:45 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id u13so13315786ote.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 21:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+JJW6t4caCXBPxsq25LNTBPSBL2CNrm0vmKvx9+LwrY=;
 b=ZI6CLsXQu3zEkQZxwzQ+6BsDZXlYoVBe9Lu4OIUOw+E+bUwWzEM4t51bLqldoaXJ1+
 k0h6b/WX4e0YPb8/8/M2r3Npl1s3vQZrUHBHICzasfNPVRR8nSIxJMK6sRcUH8/ENKp3
 dQ+AqJG7Lbp5lrlpeTKPClgJ5dYfZeGxSh5PE0oJ9/9O1lZOI9Y/w36kyg399QHINaov
 6Perpm8oeTXNkmNVVYwydY0gmy9eTBUWpaV4XQrgCn2qeLdXSHdyLoNiMK3t0XHSHo+C
 X/1aOaPfs95DmW2xD+6yOxp8bzfFxmzPiLxjFuZJlSvojoeEdg2eR5Bux2mzBrsAbOP+
 UKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+JJW6t4caCXBPxsq25LNTBPSBL2CNrm0vmKvx9+LwrY=;
 b=JnTTAAgfAvACOC9R35grHBLIf7jqPb1ekUy0d8oP5ZshYe9PAHOtLV/mwQ93mFCdHN
 7vLqkPyfI1YO6uB7j5X48j0iuvYBN++OiBVVLsem6Iv4wbDLHNS2cF0jrL65OB5EmZje
 OFLBXjNbqDIuifZHQQDgsamV8g5nJzlfOV6y7SSJCurT3LcTNCI3akHSdzh1mqh1bcbF
 uw1SwZ+QsNhlWdexugv9w3R19CGov3kwrmQ865V9rp9bB7O7sEmSn5g691bsrL5qzZQO
 TqI5XeSkE8bcXox009LAy6S2xITkuWzbrtDVXVGoy1Lrr9cZjT+5StcLSNjh1ctv00t7
 scFA==
X-Gm-Message-State: APjAAAWQyZp7k+7hXJNx5nJ10FydhSYlOyOIJmUNxSNrDidhj+TnytbA
 xsfoJNONuToAiGFGkjZm2oAFvW1b7H4l/uKh/TTUkg==
X-Google-Smtp-Source: APXvYqy/fo54DOqRX6YfeVRTY8GF4MQlAeYOIL9x7N1MBmJpgK08n1Apx5hHV/CSKzze3naQyQCgzX/2Fqzdb9aIWVA=
X-Received: by 2002:a05:6830:1b70:: with SMTP id
 d16mr10777869ote.71.1573537062072; 
 Mon, 11 Nov 2019 21:37:42 -0800 (PST)
MIME-Version: 1.0
References: <20191025044721.16617-1-alastair@au1.ibm.com>
 <20191025044721.16617-9-alastair@au1.ibm.com>
 <87woc6wtpw.fsf@linux.ibm.com>
In-Reply-To: <87woc6wtpw.fsf@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 11 Nov 2019 21:37:30 -0800
Message-ID: <CAPcyv4iaWN9R5u_2OBjqGt7nirxXKVZ=mCZnDkzyc5np8UCe=A@mail.gmail.com>
Subject: Re: [PATCH 08/10] nvdimm: Add driver for OpenCAPI Storage Class Memory
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alastair D'Silva <alastair@au1.ibm.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 11, 2019 at 3:34 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> "Alastair D'Silva" <alastair@au1.ibm.com> writes:
>
> > From: Alastair D'Silva <alastair@d-silva.org>
> >
> > This driver exposes LPC memory on OpenCAPI SCM cards
> > as an NVDIMM, allowing the existing nvram infrastructure
> > to be used.
> >
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > ---
> >  drivers/nvdimm/Kconfig             |   17 +
> >  drivers/nvdimm/Makefile            |    3 +
> >  drivers/nvdimm/ocxl-scm.c          | 2210 ++++++++++++++++++++++++++++
> >  drivers/nvdimm/ocxl-scm_internal.c |  232 +++
> >  drivers/nvdimm/ocxl-scm_internal.h |  331 +++++
> >  drivers/nvdimm/ocxl-scm_sysfs.c    |  219 +++
> >  include/uapi/linux/ocxl-scm.h      |  128 ++
> >  mm/memory_hotplug.c                |    2 +-
> >  8 files changed, 3141 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/nvdimm/ocxl-scm.c
> >  create mode 100644 drivers/nvdimm/ocxl-scm_internal.c
> >  create mode 100644 drivers/nvdimm/ocxl-scm_internal.h
> >  create mode 100644 drivers/nvdimm/ocxl-scm_sysfs.c
> >  create mode 100644 include/uapi/linux/ocxl-scm.h
> >
> > diff --git a/drivers/nvdimm/Kconfig b/drivers/nvdimm/Kconfig
> > index 36af7af6b7cf..e4f7b6b08efd 100644
> > --- a/drivers/nvdimm/Kconfig
> > +++ b/drivers/nvdimm/Kconfig
> > @@ -130,4 +130,21 @@ config NVDIMM_TEST_BUILD
> >         core devm_memremap_pages() implementation and other
> >         infrastructure.
> >
> > +config OCXL_SCM
> > +     tristate "OpenCAPI Storage Class Memory"
> > +     depends on LIBNVDIMM
> > +     select ZONE_DEVICE
> > +     select OCXL
> > +     help
> > +       Exposes devices that implement the OpenCAPI Storage Class Memory
> > +       specification as persistent memory regions.
> > +
> > +       Select N if unsure.
> > +
> > +config OCXL_SCM_DEBUG
> > +     bool "OpenCAPI Storage Class Memory debugging"
> > +     depends on OCXL_SCM
> > +     help
> > +       Enables low level IOCTLs for OpenCAPI SCM firmware development
> > +
> >  endif
> > diff --git a/drivers/nvdimm/Makefile b/drivers/nvdimm/Makefile
> > index 29203f3d3069..43d826397bfc 100644
> > --- a/drivers/nvdimm/Makefile
> > +++ b/drivers/nvdimm/Makefile
> > @@ -6,6 +6,9 @@ obj-$(CONFIG_ND_BLK) += nd_blk.o
> >  obj-$(CONFIG_X86_PMEM_LEGACY) += nd_e820.o
> >  obj-$(CONFIG_OF_PMEM) += of_pmem.o
> >  obj-$(CONFIG_VIRTIO_PMEM) += virtio_pmem.o nd_virtio.o
> > +obj-$(CONFIG_OCXL_SCM) += ocxlscm.o
> > +
> > +ocxlscm-y := ocxl-scm.o ocxl-scm_internal.o ocxl-scm_sysfs.o
> >
> >  nd_pmem-y := pmem.o
> >
> > diff --git a/drivers/nvdimm/ocxl-scm.c b/drivers/nvdimm/ocxl-scm.c
> > new file mode 100644
> > index 000000000000..f4e6cc022de8
> > --- /dev/null
> > +++ b/drivers/nvdimm/ocxl-scm.c
>
> how about drivers/nvdimm/ocxl/scm.c ? Or may be place the driver as an
> ocxl driver.
>
>
> > @@ -0,0 +1,2210 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +// Copyright 2019 IBM Corp.
> > +
> > +/*
> > + * A driver for Storage Class Memory, connected via OpenCAPI
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <misc/ocxl.h>
> > +#include <linux/delay.h>
> > +#include <linux/ndctl.h>
> > +#include <linux/eventfd.h>
> > +#include <linux/fs.h>
> > +#include <linux/mm_types.h>
> > +#include <linux/memory_hotplug.h>
> > +#include "ocxl-scm_internal.h"
> > +
> > +
> > +static const struct pci_device_id scm_pci_tbl[] = {
> > +     { PCI_DEVICE(PCI_VENDOR_ID_IBM, 0x0625), },
> > +     { }
> > +};
> > +
> > +MODULE_DEVICE_TABLE(pci, scm_pci_tbl);
> > +
> > +#define SCM_NUM_MINORS 256 // Total to reserve
> > +#define SCM_USABLE_TIMEOUT 120 // seconds
> > +
> > +static dev_t scm_dev;
> > +static struct class *scm_class;
> > +static struct mutex minors_idr_lock;
> > +static struct idr minors_idr;
> > +
> > +static const struct attribute_group *scm_pmem_attribute_groups[] = {
> > +     &nvdimm_bus_attribute_group,
> > +     NULL,
> > +};
> > +
> > +static const struct attribute_group *scm_pmem_region_attribute_groups[] = {
> > +     &nd_region_attribute_group,
> > +     &nd_device_attribute_group,
> > +     &nd_mapping_attribute_group,
> > +     &nd_numa_attribute_group,
> > +     NULL,
> > +};
> > +
>
>
> There is another patch series that is moving this from device driver to
> nvdimm core.
>
> https://lore.kernel.org/linux-mm/157309899529.1582359.15358067933360719580.stgit@dwillia2-desk3.amr.corp.intel.com
>
>
> > +/**
> > + * scm_ndctl_config_write() - Handle a ND_CMD_SET_CONFIG_DATA command from ndctl
> > + * @scm_data: the SCM metadata
> > + * @command: the incoming data to write
> > + * Return: 0 on success, negative on failure
> > + */
> > +static int scm_ndctl_config_write(struct scm_data *scm_data,
> > +                               struct nd_cmd_set_config_hdr *command)
> > +{
> > +     if (command->in_offset + command->in_length > SCM_LABEL_AREA_SIZE)
> > +             return -EINVAL;
> > +
> > +     memcpy_flushcache(scm_data->metadata_addr + command->in_offset, command->in_buf,
> > +                       command->in_length);
> > +
> > +     return 0;
> > +}
> > +
> > +/**
> > + * scm_ndctl_config_read() - Handle a ND_CMD_GET_CONFIG_DATA command from ndctl
> > + * @scm_data: the SCM metadata
> > + * @command: the read request
> > + * Return: 0 on success, negative on failure
> > + */
> > +static int scm_ndctl_config_read(struct scm_data *scm_data,
> > +                              struct nd_cmd_get_config_data_hdr *command)
> > +{
> > +     if (command->in_offset + command->in_length > SCM_LABEL_AREA_SIZE)
> > +             return -EINVAL;
> > +
> > +     memcpy(command->out_buf, scm_data->metadata_addr + command->in_offset,
> > +            command->in_length);
> > +
>
> memcpy_mcsafe()?
>
> > +     return 0;
> > +}
> > +
> > +/**
> > + * scm_ndctl_config_size() - Handle a ND_CMD_GET_CONFIG_SIZE command from ndctl
> > + * @scm_data: the SCM metadata
> > + * @command: the read request
> > + * Return: 0 on success, negative on failure
> > + */
> > +static int scm_ndctl_config_size(struct nd_cmd_get_config_size *command)
> > +{
> > +     command->status = 0;
> > +     command->config_size = SCM_LABEL_AREA_SIZE;
> > +     command->max_xfer = PAGE_SIZE;
> > +
> > +     return 0;
> > +}
> > +
> > +static int read_smart_attrib(struct scm_data *scm_data, u16 offset,
> > +                          struct scm_smart_attribs *attribs)
> > +{
> > +     u64 val;
> > +     int rc;
> > +     struct scm_smart_attrib *attrib;
> > +     u8 attrib_id;
> > +
> > +     rc = ocxl_global_mmio_read64(scm_data->ocxl_afu, offset, OCXL_LITTLE_ENDIAN,
> > +                                  &val);
> > +     if (rc)
> > +             return rc;
> > +
> > +     attrib_id = (val >> 56) & 0xff;
> > +     switch (attrib_id) {
> > +     case SCM_SMART_ATTR_POWER_ON_HOURS:
> > +             attrib = &attribs->power_on_hours;
> > +             break;
> > +
> > +     case SCM_SMART_ATTR_TEMPERATURE:
> > +             attrib = &attribs->temperature;
> > +             break;
> > +
> > +     case SCM_SMART_ATTR_LIFE_REMAINING:
> > +             attrib = &attribs->life_remaining;
> > +             break;
> > +
> > +     default:
> > +             dev_err(&scm_data->dev, "Unknown smart attrib '%d'", attrib_id);
> > +             return -EFAULT;
> > +     }
> > +
> > +     attrib->id = attrib_id;
> > +     attrib->attribute_flags = (val >> 40) & 0xffff;
> > +     attrib->current_val = (val >> 32) & 0xff;
> > +     attrib->threshold_val = (val >> 24) & 0xff;
> > +     attrib->worst_val = (val >> 16) & 0xff;
> > +
> > +     rc = ocxl_global_mmio_read64(scm_data->ocxl_afu, offset + 0x08,
> > +                                  OCXL_LITTLE_ENDIAN, &val);
> > +     if (rc)
> > +             return rc;
> > +
> > +     attrib->raw_val = val;
> > +
> > +     return 0;
> > +}
> > +
> > +static int scm_smart_offset_0x00(struct scm_data *scm_data, u32 *length)
> > +'
>
> What is special about _0x00?
>
> {
> > +     int rc;
> > +     u64 val;
> > +
> > +     u16 data_identifier;
> > +     u32 data_length;
> > +
> > +     rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> > +                                  scm_data->admin_command.data_offset,
> > +                                  OCXL_LITTLE_ENDIAN, &val);
> > +     if (rc)
> > +             return rc;
> > +
> > +     data_identifier = val >> 48;
> > +     data_length = val & 0xFFFFFFFF;
> > +
> > +     if (data_identifier != 0x534D) {
> > +             dev_err(&scm_data->dev,
> > +                     "Bad data identifier for smart data, expected 'SM', got '%-.*s'\n",
> > +                     2, (char *)&data_identifier);
> > +             return -EFAULT;
> > +     }
> > +
> > +     *length = data_length;
> > +     return 0;
> > +}
> > +
> > +static int scm_smart_update(struct scm_data *scm_data)
> > +{
> > +     u32 length, i;
> > +     int rc;
> > +
> > +     mutex_lock(&scm_data->admin_command.lock);
> > +
> > +     rc = scm_admin_command_request(scm_data, ADMIN_COMMAND_SMART);
> > +     if (rc)
> > +             goto out;
> > +
> > +     rc = scm_admin_command_execute(scm_data);
> > +     if (rc)
> > +             goto out;
> > +
> > +     rc = scm_admin_command_complete_timeout(scm_data, ADMIN_COMMAND_SMART);
> > +     if (rc < 0) {
> > +             dev_err(&scm_data->dev, "SMART timeout\n");
> > +             goto out;
> > +     }
> > +
> > +     rc = scm_admin_response(scm_data);
> > +     if (rc < 0)
> > +             goto out;
> > +     if (rc != STATUS_SUCCESS) {
> > +             scm_warn_status(scm_data, "Unexpected status from SMART", rc);
> > +             goto out;
> > +     }
> > +
> > +     rc = scm_smart_offset_0x00(scm_data, &length);
> > +     if (rc)
> > +             goto out;
> > +
> > +     length /= 0x10; // Length now contains the number of attributes
> > +
> > +     for (i = 0; i < length; i++)
> > +             read_smart_attrib(scm_data,
> > +                               scm_data->admin_command.data_offset + 0x08 + i * 0x10,
> > +                               &scm_data->smart);
> > +
> > +     rc = scm_admin_response_handled(scm_data);
> > +     if (rc)
> > +             goto out;
> > +
> > +     rc = 0;
> > +     goto out;
> > +
> > +out:
> > +     mutex_unlock(&scm_data->admin_command.lock);
> > +     return rc;
> > +}
> > +
> > +static int scm_ndctl_smart(struct scm_data *scm_data, void *buf,
> > +                        unsigned int buf_len)
> > +{
> > +     int rc;
> > +
> > +     if (buf_len != sizeof(scm_data->smart))
> > +             return -EINVAL;
> > +
> > +     rc = scm_smart_update(scm_data);
> > +     if (rc)
> > +             return rc;
> > +
> > +     memcpy(buf, &scm_data->smart, buf_len);
> > +
> > +     return 0;
> > +}
> > +
> > +
> > +static int scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
> > +                  struct nvdimm *nvdimm,
> > +                  unsigned int cmd, void *buf, unsigned int buf_len, int *cmd_rc)
> > +{
> > +     struct scm_data *scm_data = container_of(nd_desc, struct scm_data, bus_desc);
> > +
> > +     switch (cmd) {
> > +     case ND_CMD_SMART:
> > +             *cmd_rc = scm_ndctl_smart(scm_data, buf, buf_len);
> > +             return 0;
> > +
> > +     case ND_CMD_GET_CONFIG_SIZE:
> > +             *cmd_rc = scm_ndctl_config_size(buf);
> > +             return 0;
> > +
> > +     case ND_CMD_GET_CONFIG_DATA:
> > +             *cmd_rc = scm_ndctl_config_read(scm_data, buf);
> > +             return 0;
> > +
> > +     case ND_CMD_SET_CONFIG_DATA:
> > +             *cmd_rc = scm_ndctl_config_write(scm_data, buf);
> > +             return 0;
> > +
> > +     default:
> > +             return -ENOTTY;
> > +     }
> > +}
> > +
> > +static ssize_t serial_show(struct device *dev,
> > +                        struct device_attribute *attr, char *buf)
> > +{
> > +     struct nvdimm *nvdimm = to_nvdimm(dev);
> > +     struct scm_data *scm_data = nvdimm_provider_data(nvdimm);
> > +     const struct ocxl_fn_config *config = ocxl_function_config(scm_data->ocxl_fn);
> > +
> > +     return sprintf(buf, "0x%llx\n", config->serial);
> > +}
> > +static DEVICE_ATTR_RO(serial);
> > +
> > +static struct attribute *scm_dimm_attributes[] = {
> > +     &dev_attr_serial.attr,
> > +     NULL,
> > +};
> > +
> > +static umode_t scm_dimm_attr_visible(struct kobject *kobj,
> > +                                  struct attribute *a, int n)
> > +{
> > +     return a->mode;
> > +}
> > +
> > +static const struct attribute_group scm_dimm_attribute_group = {
> > +     .name = "scm",
> > +     .attrs = scm_dimm_attributes,
> > +     .is_visible = scm_dimm_attr_visible,
> > +};
> > +
>
> That is a generic name for dimm attribute
>
> > +static const struct attribute_group *scm_dimm_attribute_groups[] = {
> > +     &nvdimm_attribute_group,
> > +     &nd_device_attribute_group,
> > +     &scm_dimm_attribute_group,
> > +     NULL,
> > +};
> > +
> > +/**
> > + * scm_reserve_metadata() - Reserve space for nvdimm metadata
> > + * @scm_data: The SCM device data
> > + * @lpc_mem: The resource representing the LPC memory of the SCM device
> > + */
> > +static int scm_reserve_metadata(struct scm_data *scm_data,
> > +                             struct resource *lpc_mem)
> > +{
> > +     scm_data->metadata_addr = devm_memremap(&scm_data->dev, lpc_mem->start,
> > +                                             SCM_LABEL_AREA_SIZE, MEMREMAP_WB);
> > +     if (IS_ERR(scm_data->metadata_addr))
> > +             return PTR_ERR(scm_data->metadata_addr);
> > +
> > +     return 0;
> > +}
> > +
> > +/**
> > + * scm_overwrite() - Overwrite all data on the card
> > + * @scm_data: The SCM device data
> > + * Return: 0 on success
> > + */
> > +int scm_overwrite(struct scm_data *scm_data)
> > +{
> > +     int rc;
> > +
> > +     mutex_lock(&scm_data->ns_command.lock);
> > +
> > +     rc = scm_ns_command_request(scm_data, NS_COMMAND_SECURE_ERASE);
> > +     if (rc)
> > +             goto out;
> > +
> > +     rc = scm_ns_command_execute(scm_data);
> > +     if (rc)
> > +             goto out;
> > +
> > +     scm_data->overwrite_state = SCM_OVERWRITE_BUSY;
> > +
> > +     return 0;
> > +
> > +out:
> > +     mutex_unlock(&scm_data->ns_command.lock);
> > +     return rc;
> > +}
> > +
> > +/**
> > + * scm_secop_overwrite() - Overwrite all data on the card
> > + * @nvdimm: The nvdimm representation of the SCM device to start the overwrite on
> > + * @key_data: Unused (no security key implementation)
> > + * Return: 0 on success
> > + */
> > +static int scm_secop_overwrite(struct nvdimm *nvdimm,
> > +                            const struct nvdimm_key_data *key_data)
> > +{
> > +     struct scm_data *scm_data = nvdimm_provider_data(nvdimm);
> > +
> > +     return scm_overwrite(scm_data);
> > +}
> > +
> > +/**
> > + * scm_secop_query_overwrite() - Get the current overwrite state
> > + * @nvdimm: The nvdimm representation of the SCM device to start the overwrite on
> > + * Return: 0 if successful or idle, -EBUSY if busy, -EFAULT if failed
> > + */
> > +static int scm_secop_query_overwrite(struct nvdimm *nvdimm)
> > +{
> > +     struct scm_data *scm_data = nvdimm_provider_data(nvdimm);
> > +
> > +     if (scm_data->overwrite_state == SCM_OVERWRITE_BUSY)
> > +             return -EBUSY;
> > +
> > +     if (scm_data->overwrite_state == SCM_OVERWRITE_FAILED)
> > +             return -EFAULT;
> > +
> > +     return 0;
> > +}
> > +
> > +/**
> > + * scm_secop_get_flags() - return the security flags for the SCM device
> > + */
> > +static unsigned long scm_secop_get_flags(struct nvdimm *nvdimm,
> > +             enum nvdimm_passphrase_type ptype)
> > +{
> > +     struct scm_data *scm_data = nvdimm_provider_data(nvdimm);
> > +
> > +     if (scm_data->overwrite_state == SCM_OVERWRITE_BUSY)
> > +             return BIT(NVDIMM_SECURITY_OVERWRITE);
> > +
> > +     return BIT(NVDIMM_SECURITY_DISABLED);
> > +}
> > +
> > +static const struct nvdimm_security_ops sec_ops  = {
> > +     .get_flags = scm_secop_get_flags,
> > +     .overwrite = scm_secop_overwrite,
> > +     .query_overwrite = scm_secop_query_overwrite,
> > +};
> > +
> > +/**
> > + * scm_register_lpc_mem() - Discover persistent memory on a device and register it with the NVDIMM subsystem
> > + * @scm_data: The SCM device data
> > + * Return: 0 on success
> > + */
> > +static int scm_register_lpc_mem(struct scm_data *scm_data)
> > +{
> > +     struct nd_region_desc region_desc;
> > +     struct nd_mapping_desc nd_mapping_desc;
> > +     struct resource *lpc_mem;
> > +     const struct ocxl_afu_config *config;
> > +     const struct ocxl_fn_config *fn_config;
> > +     int rc;
> > +     unsigned long nvdimm_cmd_mask = 0;
> > +     unsigned long nvdimm_flags = 0;
> > +     int target_node;
> > +     char serial[16+1];
> > +
> > +     // Set up the reserved metadata area
> > +     rc = ocxl_afu_map_lpc_mem(scm_data->ocxl_afu);
> > +     if (rc < 0)
> > +             return rc;
> > +
> > +     lpc_mem = ocxl_afu_lpc_mem(scm_data->ocxl_afu);
> > +     if (lpc_mem == NULL)
> > +             return -EINVAL;
> > +
> > +     config = ocxl_afu_config(scm_data->ocxl_afu);
> > +     fn_config = ocxl_function_config(scm_data->ocxl_fn);
> > +
> > +     rc = scm_reserve_metadata(scm_data, lpc_mem);
> > +     if (rc)
> > +             return rc;
> > +
> > +     scm_data->bus_desc.attr_groups = scm_pmem_attribute_groups;
> > +     scm_data->bus_desc.provider_name = "scm";
> > +     scm_data->bus_desc.ndctl = scm_ndctl;
> > +     scm_data->bus_desc.module = THIS_MODULE;
> > +
> > +     scm_data->nvdimm_bus = nvdimm_bus_register(&scm_data->dev,
> > +                            &scm_data->bus_desc);
> > +     if (!scm_data->nvdimm_bus)
> > +             return -EINVAL;
> > +
> > +     scm_data->scm_res.start = (u64)lpc_mem->start + SCM_LABEL_AREA_SIZE;
> > +     scm_data->scm_res.end = (u64)lpc_mem->start + config->lpc_mem_size - 1;
> > +     scm_data->scm_res.name = "SCM persistent memory";
> > +
> > +     set_bit(ND_CMD_GET_CONFIG_SIZE, &nvdimm_cmd_mask);
> > +     set_bit(ND_CMD_GET_CONFIG_DATA, &nvdimm_cmd_mask);
> > +     set_bit(ND_CMD_SET_CONFIG_DATA, &nvdimm_cmd_mask);
> > +     set_bit(ND_CMD_SMART, &nvdimm_cmd_mask);
> > +
> > +     set_bit(NDD_ALIASING, &nvdimm_flags);
> > +
> > +     snprintf(serial, sizeof(serial), "%llx", fn_config->serial);
> > +     nd_mapping_desc.nvdimm = __nvdimm_create(scm_data->nvdimm_bus, scm_data,
> > +                              scm_dimm_attribute_groups,
> > +                              nvdimm_flags, nvdimm_cmd_mask,
> > +                              0, NULL, serial, &sec_ops);
>
>
> nvdimm_create()?
>
> > +     if (!nd_mapping_desc.nvdimm)
> > +             return -ENOMEM;
> > +
> > +     if (nvdimm_bus_check_dimm_count(scm_data->nvdimm_bus, 1))
> > +             return -EINVAL;
> > +
> > +     nd_mapping_desc.start = scm_data->scm_res.start;
> > +     nd_mapping_desc.size = resource_size(&scm_data->scm_res);
> > +     nd_mapping_desc.position = 0;
> > +
> > +     scm_data->nd_set.cookie1 = fn_config->serial + 1; // allow for empty serial
> > +     scm_data->nd_set.cookie2 = fn_config->serial + 1;
> > +
> > +     target_node = of_node_to_nid(scm_data->pdev->dev.of_node);
> > +
> > +     memset(&region_desc, 0, sizeof(region_desc));
> > +     region_desc.res = &scm_data->scm_res;
> > +     region_desc.attr_groups = scm_pmem_region_attribute_groups;
> > +     region_desc.numa_node = NUMA_NO_NODE;
> > +     region_desc.target_node = target_node;
> > +     region_desc.num_mappings = 1;
> > +     region_desc.mapping = &nd_mapping_desc;
> > +     region_desc.nd_set = &scm_data->nd_set;
> > +
> > +     set_bit(ND_REGION_PAGEMAP, &region_desc.flags);
> > +     /*
> > +      * NB: libnvdimm copies the data from ndr_desc into it's own
> > +      * structures so passing a stack pointer is fine.
> > +      */
> > +     scm_data->nd_region = nvdimm_pmem_region_create(scm_data->nvdimm_bus,
> > +                           &region_desc);
> > +     if (!scm_data->nd_region)
> > +             return -EINVAL;
> > +
> > +     dev_info(&scm_data->dev,
> > +              "Onlining %lluMB of persistent memory\n",
> > +              nd_mapping_desc.size / SZ_1M);
> > +
> > +     return 0;
> > +}
> > +
>
> Would it be possible to split the driver such that we add features like
> security ops in later patch? Can this patch be a baisc dirver that just get
> the nvdimm initialized. Any attribute specific to ocxl can be exported
> in follow up patches?

Yes, please. This diffstat:

8 files changed, 3141 insertions(+), 1 deletion(-)

...is too big for a single patch, and one sentence of changelog for
that diffstat is too small.

You might look at the early history of driver/nvdimm/
drivers/acpi/nfit* to get some ideas on how to break this up into
smaller pieces that just do one theme per patch.
