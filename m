Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E27819CDFA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 02:56:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48thN162x2zDqHX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 11:56:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=CszzwIBn; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48thL83MngzDr9w
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 11:55:12 +1100 (AEDT)
Received: by mail-ed1-x541.google.com with SMTP id i16so7028593edy.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 17:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0Q8gQM+v8ylTPEY0VXsKwuAxOV0GazSw0N3IZJZGJxY=;
 b=CszzwIBnsFLWhy9UWF9/wjuFCTrH+LDT/+UuIM3cikMWVvGRPZqxcmHkpC2wqHkMTj
 H8q/QWYad4nPvB5svj6bwUNZvPbwbqlB3jVFbE53HNUa8qyz4f+u/H8Q51U31AXupxmT
 mMHOW0STBVpg6yiA/ObBjMCdoLd6nl4tFBkBpvPZo9CyT4S4RX3M1YoAvTW+zTJcYg8X
 6oaCFovx8ss5P2P7jZYMqnDVySEBY6Lursgtl/8uoXC7i1HNCEQgB9DWWBjso/lb9POp
 fwCRQtStu2gXCBVenmlXaGgvHVtjyUP/kfq10Dhcp1dzVJvezE9nguefUpwNXKile1ni
 Rtkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0Q8gQM+v8ylTPEY0VXsKwuAxOV0GazSw0N3IZJZGJxY=;
 b=f3EAqkvP47JU+KPaNTqzKCqo4sw5mTG4RxPS1rrJgN945XuE3JAdt0vAtWs5Q1it+T
 lRnxFdqYM7IXUpT3OIXtiPowFFbNoF/KrLpiX0pxGxhaKPEaZJytuQIX/tvqbmEVmzLN
 IYK7pxJKqO4SAbNd+l8rMT8cMGOyHk+3lbBmIdUpB4qf0NuzCLDwKtTtBpMvHLAmJPtj
 yIpM1EiWoKA/cpDQvyri+Ec/4AIEqpNkxyI4ZoyHN4jym3bnw9GLBmdzvDbtiJ7LvuZW
 FfHaIyH8U6fcq70ZSuQDdDenk9d3wH9byIyqpkF9tS6hIW0oG5fQbbVH9W1ehy2poquE
 /n0w==
X-Gm-Message-State: AGi0PuaF92C7I52+Dt4JsI4IDGMMW0Dm+j1AmNupJo8UMcKONrpS2FK4
 FKLRRLphdOhkMW7G/OYO4365BF5PDFbKn/zGokf6+A==
X-Google-Smtp-Source: APiQypJWHCo/tePpMHqtx/MA87Dzetjb0+DbzFWz4GRGYzPnjPE9RhAlbvBvy84CKVacRRQPyVG3e0nX/W/PD7N4RIU=
X-Received: by 2002:a05:6402:b17:: with SMTP id
 bm23mr5529895edb.165.1585875307230; 
 Thu, 02 Apr 2020 17:55:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200327071202.2159885-1-alastair@d-silva.org>
 <20200327071202.2159885-17-alastair@d-silva.org>
In-Reply-To: <20200327071202.2159885-17-alastair@d-silva.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 2 Apr 2020 17:54:56 -0700
Message-ID: <CAPcyv4go3Ufv91E4yuVJ8x9eRU+rdOBZLC2SM9FVr-2o5iRZDw@mail.gmail.com>
Subject: Re: [PATCH v4 16/25] nvdimm/ocxl: Implement the Read Error Log command
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

On Tue, Mar 31, 2020 at 1:59 AM Alastair D'Silva <alastair@d-silva.org> wrote:
>
> The read error log command extracts information from the controller's
> internal error log.
>
> This patch exposes this information in 2 ways:
> - During probe, if an error occurs & a log is available, print it to the
>   console
> - After probe, make the error log available to userspace via an IOCTL.
>   Userspace is notified of pending error logs in a later patch
>   ("powerpc/powernv/pmem: Forward events to userspace")

So, have a look at the recent papr_scm patches to add health flags and
smart data retrieval. I'd prefer to extend existing nvdimm device
retrieval mechanisms than invent new ones.


>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  .../userspace-api/ioctl/ioctl-number.rst      |   1 +
>  drivers/nvdimm/ocxl/main.c                    | 240 ++++++++++++++++++
>  include/uapi/nvdimm/ocxlpmem.h                |  46 ++++
>  3 files changed, 287 insertions(+)
>  create mode 100644 include/uapi/nvdimm/ocxlpmem.h
>
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
> index 9425377615ce..ba0ce7dca643 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -340,6 +340,7 @@ Code  Seq#    Include File                                           Comments
>  0xC0  00-0F  linux/usb/iowarrior.h
>  0xCA  00-0F  uapi/misc/cxl.h
>  0xCA  10-2F  uapi/misc/ocxl.h
> +0xCA  30-3F  uapi/nvdimm/ocxlpmem.h                                  OpenCAPI Persistent Memory
>  0xCA  80-BF  uapi/scsi/cxlflash_ioctl.h
>  0xCB  00-1F                                                          CBM serial IEC bus in development:
>                                                                       <mailto:michael.klein@puffin.lb.shuttle.de>
> diff --git a/drivers/nvdimm/ocxl/main.c b/drivers/nvdimm/ocxl/main.c
> index 9b85fcd3f1c9..e6be0029f658 100644
> --- a/drivers/nvdimm/ocxl/main.c
> +++ b/drivers/nvdimm/ocxl/main.c
> @@ -13,6 +13,7 @@
>  #include <linux/fs.h>
>  #include <linux/mm_types.h>
>  #include <linux/memory_hotplug.h>
> +#include <uapi/nvdimm/ocxlpmem.h>
>  #include "ocxlpmem.h"
>
>  static const struct pci_device_id pci_tbl[] = {
> @@ -401,10 +402,190 @@ static int file_release(struct inode *inode, struct file *file)
>         return 0;
>  }
>
> +/**
> + * error_log_header_parse() - Parse the first 64 bits of the error log command response
> + * @ocxlpmem: the device metadata
> + * @length: out, returns the number of bytes in the response (excluding the 64 bit header)
> + */
> +static int error_log_header_parse(struct ocxlpmem *ocxlpmem, u16 *length)
> +{
> +       int rc;
> +       u64 val;
> +       u16 data_identifier;
> +       u32 data_length;
> +
> +       rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> +                                    ocxlpmem->admin_command.data_offset,
> +                                    OCXL_LITTLE_ENDIAN, &val);
> +       if (rc)
> +               return rc;
> +
> +       data_identifier = val >> 48;
> +       data_length = val & 0xFFFF;
> +
> +       if (data_identifier != 0x454C) { // 'EL'
> +               dev_err(&ocxlpmem->dev,
> +                       "Bad data identifier for error log data, expected 'EL', got '%2s' (%#x), data_length=%u\n",
> +                       (char *)&data_identifier,
> +                       (unsigned int)data_identifier, data_length);
> +               return -EINVAL;
> +       }
> +
> +       *length = data_length;
> +       return 0;
> +}
> +
> +static int read_error_log(struct ocxlpmem *ocxlpmem,
> +                         struct ioctl_ocxlpmem_error_log *log,
> +                         bool buf_is_user)
> +{
> +       u64 val;
> +       u16 user_buf_length;
> +       u16 buf_length;
> +       u64 *buf = (u64 *)log->buf_ptr;
> +       u16 i;
> +       int rc;
> +
> +       if (log->buf_size % 8)
> +               return -EINVAL;
> +
> +       rc = ocxlpmem_chi(ocxlpmem, &val);
> +       if (rc)
> +               return rc;
> +
> +       if (!(val & GLOBAL_MMIO_CHI_ELA))
> +               return -EAGAIN;
> +
> +       user_buf_length = log->buf_size;
> +
> +       mutex_lock(&ocxlpmem->admin_command.lock);
> +
> +       rc = admin_command_execute(ocxlpmem, ADMIN_COMMAND_ERRLOG);
> +       if (rc != STATUS_SUCCESS) {
> +               warn_status(ocxlpmem,
> +                           "Unexpected status from retrieve error log", rc);
> +               goto out;
> +       }
> +
> +       rc = error_log_header_parse(ocxlpmem, &log->buf_size);
> +       if (rc)
> +               goto out;
> +       // log->buf_size now contains the returned buffer size, not the user size
> +
> +       rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> +                                    ocxlpmem->admin_command.data_offset + 0x08,
> +                                    OCXL_LITTLE_ENDIAN, &val);
> +       if (rc)
> +               goto out;
> +
> +       log->log_identifier = val >> 32;
> +       log->program_reference_code = val & 0xFFFFFFFF;
> +
> +       rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> +                                    ocxlpmem->admin_command.data_offset + 0x10,
> +                                    OCXL_LITTLE_ENDIAN, &val);
> +       if (rc)
> +               goto out;
> +
> +       log->error_log_type = val >> 56;
> +       log->action_flags = (log->error_log_type == OCXLPMEM_ERROR_LOG_TYPE_GENERAL) ?
> +                           (val >> 32) & 0xFFFFFF : 0;
> +       log->power_on_seconds = val & 0xFFFFFFFF;
> +
> +       rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> +                                    ocxlpmem->admin_command.data_offset + 0x18,
> +                                    OCXL_LITTLE_ENDIAN, &log->timestamp);
> +       if (rc)
> +               goto out;
> +
> +       rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> +                                    ocxlpmem->admin_command.data_offset + 0x20,
> +                                    OCXL_LITTLE_ENDIAN, &log->wwid[0]);
> +       if (rc)
> +               goto out;
> +
> +       rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> +                                    ocxlpmem->admin_command.data_offset + 0x28,
> +                                    OCXL_LITTLE_ENDIAN, &log->wwid[1]);
> +       if (rc)
> +               goto out;
> +
> +       rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> +                                    ocxlpmem->admin_command.data_offset + 0x30,
> +                                    OCXL_HOST_ENDIAN, (u64 *)log->fw_revision);
> +       if (rc)
> +               goto out;
> +       log->fw_revision[8] = '\0';
> +
> +       buf_length = (user_buf_length < log->buf_size) ?
> +                     user_buf_length : log->buf_size;
> +       for (i = 0; i < buf_length / (sizeof(u64)); i++) {
> +               rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> +                                            ocxlpmem->admin_command.data_offset +
> +                                                       i * sizeof(u64),
> +                                            OCXL_HOST_ENDIAN, &val);
> +               if (rc)
> +                       goto out;
> +
> +               if (buf_is_user) {
> +                       if (copy_to_user((u64 __user *)&buf[i], &val,
> +                                        sizeof(u64))) {
> +                               rc = -EFAULT;
> +                               goto out;
> +                       }
> +               } else {
> +                       buf[i] = val;
> +               }
> +       }
> +
> +       rc = admin_response_handled(ocxlpmem);
> +       if (rc)
> +               goto out;
> +
> +out:
> +       mutex_unlock(&ocxlpmem->admin_command.lock);
> +       return rc;
> +}
> +
> +static int ioctl_error_log(struct ocxlpmem *ocxlpmem,
> +                          struct ioctl_ocxlpmem_error_log __user *uarg)
> +{
> +       struct ioctl_ocxlpmem_error_log args;
> +       int rc;
> +
> +       if (copy_from_user(&args, uarg, sizeof(args)))
> +               return -EFAULT;
> +
> +       rc = read_error_log(ocxlpmem, &args, true);
> +       if (rc)
> +               return rc;
> +
> +       if (copy_to_user(uarg, &args, sizeof(args)))
> +               return -EFAULT;
> +
> +       return 0;
> +}
> +
> +static long file_ioctl(struct file *file, unsigned int cmd, unsigned long args)
> +{
> +       struct ocxlpmem *ocxlpmem = file->private_data;
> +       int rc = -EINVAL;
> +
> +       switch (cmd) {
> +       case IOCTL_OCXLPMEM_ERROR_LOG:
> +               rc = ioctl_error_log(ocxlpmem,
> +                                    (struct ioctl_ocxlpmem_error_log __user *)args);
> +               break;
> +       }
> +       return rc;
> +}
> +
>  static const struct file_operations fops = {
>         .owner          = THIS_MODULE,
>         .open           = file_open,
>         .release        = file_release,
> +       .unlocked_ioctl = file_ioctl,
> +       .compat_ioctl   = file_ioctl,
>  };
>
>  /**
> @@ -493,6 +674,60 @@ static int read_device_metadata(struct ocxlpmem *ocxlpmem)
>         return 0;
>  }
>
> +static const char *decode_error_log_type(u8 error_log_type)
> +{
> +       switch (error_log_type) {
> +       case 0x00:
> +               return "general";
> +       case 0x01:
> +               return "predictive failure";
> +       case 0x02:
> +               return "thermal warning";
> +       case 0x03:
> +               return "data loss";
> +       case 0x04:
> +               return "health & performance";
> +       default:
> +               return "unknown";
> +       }
> +}
> +
> +static void dump_error_log(struct ocxlpmem *ocxlpmem)
> +{
> +       struct ioctl_ocxlpmem_error_log log;
> +       u32 buf_size;
> +       u8 *buf;
> +       int rc;
> +
> +       if (ocxlpmem->admin_command.data_size == 0)
> +               return;
> +
> +       buf_size = ocxlpmem->admin_command.data_size - 0x48;
> +       buf = kzalloc(buf_size, GFP_KERNEL);
> +       if (!buf)
> +               return;
> +
> +       log.buf_ptr = (u64)buf;
> +       log.buf_size = buf_size;
> +
> +       rc = read_error_log(ocxlpmem, &log, false);
> +       if (rc < 0)
> +               goto out;
> +
> +       dev_warn(&ocxlpmem->dev,
> +                "OCXL PMEM Error log: WWID=0x%016llx%016llx LID=0x%x PRC=%x type=0x%x %s, Uptime=%u seconds timestamp=0x%llx\n",
> +                log.wwid[0], log.wwid[1],
> +                log.log_identifier, log.program_reference_code,
> +                log.error_log_type,
> +                decode_error_log_type(log.error_log_type),
> +                log.power_on_seconds, log.timestamp);
> +       print_hex_dump(KERN_WARNING, "buf", DUMP_PREFIX_OFFSET, 16, 1, buf,
> +                      log.buf_size, false);
> +
> +out:
> +       kfree(buf);
> +}
> +
>  /**
>   * probe_function0() - Set up function 0 for an OpenCAPI persistent memory device
>   * This is important as it enables templates higher than 0 across all other
> @@ -656,6 +891,11 @@ static int probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>         pci_set_drvdata(pdev, NULL);
>
>  err:
> +       if (ocxlpmem &&
> +           (ocxlpmem_chi(ocxlpmem, &chi) == 0) &&
> +           (chi & GLOBAL_MMIO_CHI_ELA))
> +               dump_error_log(ocxlpmem);
> +
>         /*
>          * Further cleanup is done in the release handler via free_ocxlpmem()
>          * This allows us to keep the character device live to handle IOCTLs to
> diff --git a/include/uapi/nvdimm/ocxlpmem.h b/include/uapi/nvdimm/ocxlpmem.h
> new file mode 100644
> index 000000000000..5d3a03ea1e08
> --- /dev/null
> +++ b/include/uapi/nvdimm/ocxlpmem.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
> +/* Copyright 2020 IBM Corp. */
> +#ifndef _UAPI_OCXL_SCM_H
> +#define _UAPI_OCXL_SCM_H
> +
> +#include <linux/types.h>
> +#include <linux/ioctl.h>
> +
> +#define OCXLPMEM_ERROR_LOG_ACTION_RESET        (1 << (32 - 32))
> +#define OCXLPMEM_ERROR_LOG_ACTION_CHKFW        (1 << (53 - 32))
> +#define OCXLPMEM_ERROR_LOG_ACTION_REPLACE      (1 << (54 - 32))
> +#define OCXLPMEM_ERROR_LOG_ACTION_DUMP         (1 << (55 - 32))
> +
> +#define OCXLPMEM_ERROR_LOG_TYPE_GENERAL                (0x00)
> +#define OCXLPMEM_ERROR_LOG_TYPE_PREDICTIVE_FAILURE     (0x01)
> +#define OCXLPMEM_ERROR_LOG_TYPE_THERMAL_WARNING        (0x02)
> +#define OCXLPMEM_ERROR_LOG_TYPE_DATA_LOSS              (0x03)
> +#define OCXLPMEM_ERROR_LOG_TYPE_HEALTH_PERFORMANCE     (0x04)
> +
> +struct ioctl_ocxlpmem_error_log {
> +       __u32 log_identifier; /* out */
> +       __u32 program_reference_code; /* out */
> +       __u32 action_flags; /* out, recommended course of action */
> +       __u32 power_on_seconds; /* out, Number of seconds the controller has been on when the error occurred */
> +       __u64 timestamp; /* out, relative time since the current IPL */
> +       __u64 wwid[2]; /* out, the NAA formatted WWID associated with the controller */
> +       char  fw_revision[8 + 1]; /* out, firmware revision as null terminated text */
> +       __u8  reserved0[7];
> +       __u16 buf_size; /* in/out, buffer size provided/required.
> +                        * If required is greater than provided, the buffer
> +                        * will be truncated to the amount provided. If its
> +                        * less, then only the required bytes will be populated.
> +                        * If it is 0, then there are no more error log entries.
> +                        */
> +       __u8  error_log_type;
> +       __u8  reserved1[5];
> +       __u64 buf_ptr; /* coerced pointer to output buffer */
> +       __u64 reserved2[2];
> +};
> +
> +/* ioctl numbers */
> +#define OCXLPMEM_MAGIC 0xCA
> +/* OpenCAPI Persistent memory devices */
> +#define IOCTL_OCXLPMEM_ERROR_LOG                       _IOWR(OCXLPMEM_MAGIC, 0x30, struct ioctl_ocxlpmem_error_log)
> +
> +#endif /* _UAPI_OCXL_SCM_H */
> --
> 2.24.1
>
