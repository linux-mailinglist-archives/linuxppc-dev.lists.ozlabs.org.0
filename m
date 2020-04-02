Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D842219B982
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 02:22:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t3gJ3CMvzDrF5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 11:22:52 +1100 (AEDT)
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
 header.s=20150623 header.b=VYBVid+R; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48t3cs1zHzzDqfq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 11:20:43 +1100 (AEDT)
Received: by mail-ed1-x541.google.com with SMTP id dj7so180453edb.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 17:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cy8vIQz2yaGK0zk3nTridT+PraSHoSgW6yCapUf+4BA=;
 b=VYBVid+R4R8MHVRoNK3oxU0Lzu3hLgOII+La6r+cIfCwIQqnZflVXrRIHHz3tvE2MI
 Aipae//AdtnRp9Lo0oX5nPWKOSjVuNPljOolfSg1mo8XFeQAstf0SzReIZuxx/SgZUaX
 gk8Xnfw/bW83bJMD7hQvFG9+InhhKSxonYtWIdBInrkdtiHyceDumbkLNf4IRrBAiCk/
 FPd7nfxIEdCkXgN2khixYdOUJP/wPWkjzfolriu2S/f/DpiK0bnQGrS1s1bOizz72xf/
 S3e4cF0Iw4vjDOmyt0tV2Aa418KcITIvZWvNZ0mMWw0RbbT5eVQjx812WB+KBYvLivNc
 oL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cy8vIQz2yaGK0zk3nTridT+PraSHoSgW6yCapUf+4BA=;
 b=Et3PAOSQL1wlPbdNor1fWbTRVQiUB5vltj87SNm1D5r3ub51QCqsfk3tY+whMyhWeb
 IKOf/5kh0uyUyfkZ/PAo+oTybd1KtnhwcEYidXqRrEbltqLMkbLbG2JUGo/3g/YbjU97
 qwV+kByMeFkorqU0gwcHjkscyl/Q6UNbYA1oOS4G3+lJfIUebMhtsqfWu9X8RslnxqdB
 56M4l+4rFxdGwLFIMDgrqBgiI4xoMdhc5jr97M3JYSq6JuKYfZ/xsbrCaQ3uNjyRfCFS
 ocnmkr75JlB4kh+xCMZjVja7EpzIqGP3lpBhGnsvvfGOLG1LaGysrfKX+si1EDcvGNNt
 arLQ==
X-Gm-Message-State: AGi0PuZx7xp/ruB9dgFZHLMbkWMTXM7yIDsS1nQIGgS+iUlNB/8hq/yq
 RwNq0oKpEF9+wUeVyzZH5+CeojkU3x+KptPYU2tvkA==
X-Google-Smtp-Source: APiQypKIqAXTv1ZZqKusrDKPxIGUrlYDyh3RjXfcsVx2S/ORtEczOYfOG4HxYoW0mRUMSHKh8Zriab2quE4xCKlv/60=
X-Received: by 2002:a05:6402:3044:: with SMTP id
 bu4mr501326edb.123.1585786837024; 
 Wed, 01 Apr 2020 17:20:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200327071202.2159885-1-alastair@d-silva.org>
 <20200327071202.2159885-14-alastair@d-silva.org>
In-Reply-To: <20200327071202.2159885-14-alastair@d-silva.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 1 Apr 2020 17:20:25 -0700
Message-ID: <CAPcyv4jO_U-EOhdErFw9A+h0iai69jq8ni5w_8wUX-B4vS8JDA@mail.gmail.com>
Subject: Re: [PATCH v4 13/25] nvdimm/ocxl: Read the capability registers &
 wait for device ready
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
> This patch reads timeouts & firmware version from the controller, and
> uses those timeouts to wait for the controller to report that it is ready
> before handing the memory over to libnvdimm.
>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  drivers/nvdimm/ocxl/Makefile            |  2 +-
>  drivers/nvdimm/ocxl/main.c              | 85 +++++++++++++++++++++++++
>  drivers/nvdimm/ocxl/ocxlpmem.h          | 29 +++++++++
>  drivers/nvdimm/ocxl/ocxlpmem_internal.c | 19 ++++++
>  4 files changed, 134 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/nvdimm/ocxl/ocxlpmem_internal.c
>
> diff --git a/drivers/nvdimm/ocxl/Makefile b/drivers/nvdimm/ocxl/Makefile
> index e0e8ade1987a..bab97082e062 100644
> --- a/drivers/nvdimm/ocxl/Makefile
> +++ b/drivers/nvdimm/ocxl/Makefile
> @@ -4,4 +4,4 @@ ccflags-$(CONFIG_PPC_WERROR)    += -Werror
>
>  obj-$(CONFIG_OCXL_PMEM) += ocxlpmem.o
>
> -ocxlpmem-y := main.o
> \ No newline at end of file
> +ocxlpmem-y := main.o ocxlpmem_internal.o
> diff --git a/drivers/nvdimm/ocxl/main.c b/drivers/nvdimm/ocxl/main.c
> index c0066fedf9cc..be76acd33d74 100644
> --- a/drivers/nvdimm/ocxl/main.c
> +++ b/drivers/nvdimm/ocxl/main.c
> @@ -8,6 +8,7 @@
>
>  #include <linux/module.h>
>  #include <misc/ocxl.h>
> +#include <linux/delay.h>
>  #include <linux/ndctl.h>
>  #include <linux/mm_types.h>
>  #include <linux/memory_hotplug.h>
> @@ -327,6 +328,50 @@ static void remove(struct pci_dev *pdev)
>         }
>  }
>
> +/**
> + * read_device_metadata() - Retrieve config information from the AFU and save it for future use
> + * @ocxlpmem: the device metadata
> + * Return: 0 on success, negative on failure
> + */
> +static int read_device_metadata(struct ocxlpmem *ocxlpmem)
> +{
> +       u64 val;
> +       int rc;
> +
> +       rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_CCAP0,
> +                                    OCXL_LITTLE_ENDIAN, &val);

This calling convention would seem to defeat the ability of sparse to
validate endian correctness. That's independent of this series, but I
wonder how does someone review why this argument is sometimes
OCXL_LITTLE_ENDIAN and sometimes OCXL_HOST_ENDIAN?

> +       if (rc)
> +               return rc;
> +
> +       ocxlpmem->scm_revision = val & 0xFFFF;
> +       ocxlpmem->read_latency = (val >> 32) & 0xFFFF;
> +       ocxlpmem->readiness_timeout = (val >> 48) & 0x0F;
> +       ocxlpmem->memory_available_timeout = val >> 52;

Maybe some macros to parse out these register fields?

> +
> +       rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_CCAP1,
> +                                    OCXL_LITTLE_ENDIAN, &val);
> +       if (rc)
> +               return rc;
> +
> +       ocxlpmem->max_controller_dump_size = val & 0xFFFFFFFF;
> +
> +       // Extract firmware version text
> +       rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_FWVER,
> +                                    OCXL_HOST_ENDIAN,
> +                                    (u64 *)ocxlpmem->fw_version);
> +       if (rc)
> +               return rc;
> +
> +       ocxlpmem->fw_version[8] = '\0';
> +
> +       dev_info(&ocxlpmem->dev,
> +                "Firmware version '%s' SCM revision %d:%d\n",
> +                ocxlpmem->fw_version, ocxlpmem->scm_revision >> 4,
> +                ocxlpmem->scm_revision & 0x0F);

Does the driver need to be chatty here. If this data is relevant
should it appear in sysfs by default?

> +
> +       return 0;
> +}
> +
>  /**
>   * probe_function0() - Set up function 0 for an OpenCAPI persistent memory device
>   * This is important as it enables templates higher than 0 across all other
> @@ -359,6 +404,9 @@ static int probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  {
>         struct ocxlpmem *ocxlpmem;
>         int rc;
> +       u64 chi;
> +       u16 elapsed, timeout;
> +       bool ready = false;
>
>         if (PCI_FUNC(pdev->devfn) == 0)
>                 return probe_function0(pdev);
> @@ -413,6 +461,43 @@ static int probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>                 goto err;
>         }
>
> +       rc = read_device_metadata(ocxlpmem);
> +       if (rc) {
> +               dev_err(&pdev->dev, "Could not read metadata\n");
> +               goto err;
> +       }
> +
> +       elapsed = 0;
> +       timeout = ocxlpmem->readiness_timeout +
> +                 ocxlpmem->memory_available_timeout;
> +
> +       while (true) {
> +               rc = ocxlpmem_chi(ocxlpmem, &chi);
> +               ready = (chi & (GLOBAL_MMIO_CHI_CRDY | GLOBAL_MMIO_CHI_MA)) ==
> +                       (GLOBAL_MMIO_CHI_CRDY | GLOBAL_MMIO_CHI_MA);
> +
> +               if (ready)
> +                       break;
> +
> +               if (elapsed++ > timeout) {
> +                       dev_err(&ocxlpmem->dev,
> +                               "OpenCAPI Persistent Memory ready timeout.\n");
> +
> +                       if (!(chi & GLOBAL_MMIO_CHI_CRDY))
> +                               dev_err(&ocxlpmem->dev,
> +                                       "controller is not ready.\n");
> +
> +                       if (!(chi & GLOBAL_MMIO_CHI_MA))
> +                               dev_err(&ocxlpmem->dev,
> +                                       "controller does not have memory available.\n");
> +
> +                       rc = -ENXIO;
> +                       goto err;
> +               }
> +
> +               msleep(1000);

At platform boot this is going to serialize / delay other pci hardware
init. Do you need this determination to be synchronous with the call
to ->probe()? If not, let's move it out of line. For example nvdimm
device registration is asynchronous by default with options to flush
if userspace needs to know that the kernel has finished loading
drivers.

> +       }
> +
>         rc = register_lpc_mem(ocxlpmem);
>         if (rc) {
>                 dev_err(&pdev->dev,
> diff --git a/drivers/nvdimm/ocxl/ocxlpmem.h b/drivers/nvdimm/ocxl/ocxlpmem.h
> index 322387873b4b..3eadbe19f6d0 100644
> --- a/drivers/nvdimm/ocxl/ocxlpmem.h
> +++ b/drivers/nvdimm/ocxl/ocxlpmem.h
> @@ -93,4 +93,33 @@ struct ocxlpmem {
>         void *metadata_addr;
>         struct resource pmem_res;
>         struct nd_region *nd_region;
> +       char fw_version[8 + 1];
> +
> +       u32 max_controller_dump_size;
> +       u16 scm_revision; // major/minor
> +       u8 readiness_timeout;  /* The worst case time (in seconds) that the host
> +                               * shall wait for the controller to become
> +                               * operational following a reset (CHI.CRDY).
> +                               */
> +       u8 memory_available_timeout;  /* The worst case time (in seconds) that
> +                                      * the host shall wait for memory to
> +                                      * become available following a reset
> +                                      * (CHI.MA).
> +                                      */
> +
> +       u16 read_latency; /* The nominal measure of latency (in nanoseconds)
> +                          * associated with an unassisted read of a memory
> +                          * block.
> +                          * This represents the capability of the raw media
> +                          * technology without assistance
> +                          */
>  };
> +
> +/**
> + * ocxlpmem_chi() - Get the value of the CHI register
> + * @ocxlpmem: the device metadata
> + * @chi: returns the CHI value
> + *
> + * Returns 0 on success, negative on error
> + */
> +int ocxlpmem_chi(const struct ocxlpmem *ocxlpmem, u64 *chi);
> diff --git a/drivers/nvdimm/ocxl/ocxlpmem_internal.c b/drivers/nvdimm/ocxl/ocxlpmem_internal.c
> new file mode 100644
> index 000000000000..5578169b7515
> --- /dev/null
> +++ b/drivers/nvdimm/ocxl/ocxlpmem_internal.c
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright 2020 IBM Corp.
> +
> +#include <misc/ocxl.h>
> +#include <linux/delay.h>
> +#include "ocxlpmem.h"
> +
> +int ocxlpmem_chi(const struct ocxlpmem *ocxlpmem, u64 *chi)
> +{
> +       u64 val;
> +       int rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_CHI,
> +                                        OCXL_LITTLE_ENDIAN, &val);
> +       if (rc)
> +               return rc;
> +
> +       *chi = val;
> +
> +       return 0;
> +}
> --
> 2.24.1
>
