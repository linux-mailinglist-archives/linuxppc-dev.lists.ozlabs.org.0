Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A93419BA2D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 04:09:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t62q0MyVzDrL1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 13:09:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::544;
 helo=mail-ed1-x544.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=H75OHKsz; dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48t6176hwlzDrF5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 13:08:24 +1100 (AEDT)
Received: by mail-ed1-x544.google.com with SMTP id i7so2304888edq.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 19:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0AvdOMxSzudezFDGyo9moOxPb38tn3j7e1IB79LqmiE=;
 b=H75OHKszjQii/JJueg9Otm9JKwkcDmohBHalnBaO+1I9/1u8Cbc5S5my3y64OuzR7H
 eyXkUJ8elmHM3MUgcTl6xMVLx6SYsHqO1tL2LrX7kCAj9ck0mnxhgsL+yAK5bpK1cOyC
 INNXgnKcgHB2uwr3YhuOQofMcrOJDCnfievy8Ttbqiry2VZ9zVPYJkRPzmA3vDJBvgjy
 Q7t6Yd0FJLv+vSoAHhykJX1UeteI37+caO+3+Y0uttzZ4bR+7M4ny47I/9XgOpoYgHhd
 fsFiKYQM0lDh5oZVw9VDLA3WFERxOVGS8KMlA4znSozPjaphuTvkvgrZhccnDWkwWNU2
 JgdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0AvdOMxSzudezFDGyo9moOxPb38tn3j7e1IB79LqmiE=;
 b=dpArXJTE3dH30dCKEukjo/i10OgRh+Sm+yjO3AL00N4o1zmtvK+oUjC6r8iqLRQYz+
 cddhsptVGn+6l5TqNl66h1MU1tkIrcJbBaFl+xg3AgDpDxIigk95GlRIIOwMDAQpC1xm
 T8MqIg6/PRjDed7BD+OkCnYMsmD/MS8DwJYMg01HxBXQ/ptH8feQ7SO5NEpxDH61Lh83
 X1EA8xE7IlipdOA1VPbo3Tg6Bqr0gkH4L8NA6abeHYelPfRtiaBkEDTyYIurPxJoFK4c
 WEE0W5ov/5z/7lY0QBbw06qeCRe9VdkrF0u1drVWaS9FPqyloH5bNuT7ltIr19glq8Lg
 FbBQ==
X-Gm-Message-State: AGi0PuYG3KuSSnysJxIrjRY7pKFu6jBUCIf9ud98ZdBtmB70EgNONshY
 VX+UnEScA+CpA1ExzC7NsDCQikyhHgMZcDDbiR5hLg==
X-Google-Smtp-Source: APiQypK7i6/1gogQZZrKam/dSs5kf8xMYMKt4z1dOA2oInJZ3pB7EdQnaxIYNyyulznwBLR5zfrg8vwqBR07EcHzgjc=
X-Received: by 2002:a17:906:1697:: with SMTP id
 s23mr1019998ejd.211.1585793299540; 
 Wed, 01 Apr 2020 19:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200327071202.2159885-1-alastair@d-silva.org>
 <20200327071202.2159885-20-alastair@d-silva.org>
In-Reply-To: <20200327071202.2159885-20-alastair@d-silva.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 1 Apr 2020 19:08:08 -0700
Message-ID: <CAPcyv4gfDAbABq9wxKd05AWTduDy2udBXS4Y6qcWyUzOBv-xTg@mail.gmail.com>
Subject: Re: [PATCH v4 19/25] nvdimm/ocxl: Forward events to userspace
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
> Some of the interrupts that the card generates are better handled
> by the userspace daemon, in particular:
> Controller Hardware/Firmware Fatal
> Controller Dump Available
> Error Log available
>
> This patch allows a userspace application to register an eventfd with
> the driver via SCM_IOCTL_EVENTFD to receive notifications of these
> interrupts.
>
> Userspace can then identify what events have occurred by calling
> SCM_IOCTL_EVENT_CHECK and checking against the SCM_IOCTL_EVENT_FOO
> masks.

The amount new ioctl's in this driver is too high, it seems much of
this data can be exported via sysfs attributes which are more
maintainable that ioctls. Then sysfs also has the ability to signal
events on sysfs attributes, see sys_notify_dirent.

Can you step back and review the ABI exposure of the driver and what
can be moved to sysfs? If you need to have bus specific attributes
ordered underneath the libnvdimm generic attributes you can create a
sysfs attribute subdirectory.

In general a roadmap document of all the proposed ABI is needed to
make sure it is both sufficient and necessary. See the libnvdimm
document that introduced the initial libnvdimm ABI:

https://www.kernel.org/doc/Documentation/nvdimm/nvdimm.txt

>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  drivers/nvdimm/ocxl/main.c     | 220 +++++++++++++++++++++++++++++++++
>  drivers/nvdimm/ocxl/ocxlpmem.h |   4 +
>  include/uapi/nvdimm/ocxlpmem.h |  12 ++
>  3 files changed, 236 insertions(+)
>
> diff --git a/drivers/nvdimm/ocxl/main.c b/drivers/nvdimm/ocxl/main.c
> index 0040fc09cceb..cb6cdc9eb899 100644
> --- a/drivers/nvdimm/ocxl/main.c
> +++ b/drivers/nvdimm/ocxl/main.c
> @@ -10,6 +10,7 @@
>  #include <misc/ocxl.h>
>  #include <linux/delay.h>
>  #include <linux/ndctl.h>
> +#include <linux/eventfd.h>
>  #include <linux/fs.h>
>  #include <linux/mm_types.h>
>  #include <linux/memory_hotplug.h>
> @@ -301,8 +302,19 @@ static void free_ocxlpmem(struct ocxlpmem *ocxlpmem)
>  {
>         int rc;
>
> +       // Disable doorbells
> +       (void)ocxl_global_mmio_set64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_CHIEC,
> +                                    OCXL_LITTLE_ENDIAN,
> +                                    GLOBAL_MMIO_CHI_ALL);
> +
>         free_minor(ocxlpmem);
>
> +       if (ocxlpmem->irq_addr[1])
> +               iounmap(ocxlpmem->irq_addr[1]);
> +
> +       if (ocxlpmem->irq_addr[0])
> +               iounmap(ocxlpmem->irq_addr[0]);
> +
>         if (ocxlpmem->ocxl_context) {
>                 rc = ocxl_context_detach(ocxlpmem->ocxl_context);
>                 if (rc == -EBUSY)
> @@ -398,6 +410,11 @@ static int file_release(struct inode *inode, struct file *file)
>  {
>         struct ocxlpmem *ocxlpmem = file->private_data;
>
> +       if (ocxlpmem->ev_ctx) {
> +               eventfd_ctx_put(ocxlpmem->ev_ctx);
> +               ocxlpmem->ev_ctx = NULL;
> +       }
> +
>         ocxlpmem_put(ocxlpmem);
>         return 0;
>  }
> @@ -928,6 +945,52 @@ static int ioctl_controller_stats(struct ocxlpmem *ocxlpmem,
>         return rc;
>  }
>
> +static int ioctl_eventfd(struct ocxlpmem *ocxlpmem,
> +                        struct ioctl_ocxlpmem_eventfd __user *uarg)
> +{
> +       struct ioctl_ocxlpmem_eventfd args;
> +
> +       if (copy_from_user(&args, uarg, sizeof(args)))
> +               return -EFAULT;
> +
> +       if (ocxlpmem->ev_ctx)
> +               return -EBUSY;
> +
> +       ocxlpmem->ev_ctx = eventfd_ctx_fdget(args.eventfd);
> +       if (IS_ERR(ocxlpmem->ev_ctx))
> +               return PTR_ERR(ocxlpmem->ev_ctx);
> +
> +       return 0;
> +}
> +
> +static int ioctl_event_check(struct ocxlpmem *ocxlpmem, u64 __user *uarg)
> +{
> +       u64 val = 0;
> +       int rc;
> +       u64 chi = 0;
> +
> +       rc = ocxlpmem_chi(ocxlpmem, &chi);
> +       if (rc < 0)
> +               return rc;
> +
> +       if (chi & GLOBAL_MMIO_CHI_ELA)
> +               val |= IOCTL_OCXLPMEM_EVENT_ERROR_LOG_AVAILABLE;
> +
> +       if (chi & GLOBAL_MMIO_CHI_CDA)
> +               val |= IOCTL_OCXLPMEM_EVENT_CONTROLLER_DUMP_AVAILABLE;
> +
> +       if (chi & GLOBAL_MMIO_CHI_CFFS)
> +               val |= IOCTL_OCXLPMEM_EVENT_FIRMWARE_FATAL;
> +
> +       if (chi & GLOBAL_MMIO_CHI_CHFS)
> +               val |= IOCTL_OCXLPMEM_EVENT_HARDWARE_FATAL;
> +
> +       if (copy_to_user((u64 __user *)uarg, &val, sizeof(val)))
> +               return -EFAULT;
> +
> +       return rc;
> +}
> +
>  static long file_ioctl(struct file *file, unsigned int cmd, unsigned long args)
>  {
>         struct ocxlpmem *ocxlpmem = file->private_data;
> @@ -956,6 +1019,15 @@ static long file_ioctl(struct file *file, unsigned int cmd, unsigned long args)
>                 rc = ioctl_controller_stats(ocxlpmem,
>                                             (struct ioctl_ocxlpmem_controller_stats __user *)args);
>                 break;
> +
> +       case IOCTL_OCXLPMEM_EVENTFD:
> +               rc = ioctl_eventfd(ocxlpmem,
> +                                  (struct ioctl_ocxlpmem_eventfd __user *)args);
> +               break;
> +
> +       case IOCTL_OCXLPMEM_EVENT_CHECK:
> +               rc = ioctl_event_check(ocxlpmem, (u64 __user *)args);
> +               break;
>         }
>
>         return rc;
> @@ -1109,6 +1181,148 @@ static void dump_error_log(struct ocxlpmem *ocxlpmem)
>         kfree(buf);
>  }
>
> +static irqreturn_t imn0_handler(void *private)
> +{
> +       struct ocxlpmem *ocxlpmem = private;
> +       u64 chi = 0;
> +
> +       (void)ocxlpmem_chi(ocxlpmem, &chi);
> +
> +       if (chi & GLOBAL_MMIO_CHI_ELA) {
> +               dev_warn(&ocxlpmem->dev, "Error log is available\n");
> +
> +               if (ocxlpmem->ev_ctx)
> +                       eventfd_signal(ocxlpmem->ev_ctx, 1);
> +       }
> +
> +       if (chi & GLOBAL_MMIO_CHI_CDA) {
> +               dev_warn(&ocxlpmem->dev, "Controller dump is available\n");
> +
> +               if (ocxlpmem->ev_ctx)
> +                       eventfd_signal(ocxlpmem->ev_ctx, 1);
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t imn1_handler(void *private)
> +{
> +       struct ocxlpmem *ocxlpmem = private;
> +       u64 chi = 0;
> +
> +       (void)ocxlpmem_chi(ocxlpmem, &chi);
> +
> +       if (chi & (GLOBAL_MMIO_CHI_CFFS | GLOBAL_MMIO_CHI_CHFS)) {
> +               dev_err(&ocxlpmem->dev,
> +                       "Controller status is fatal, chi=0x%llx, going offline\n",
> +                       chi);
> +
> +               if (ocxlpmem->nvdimm_bus) {
> +                       nvdimm_bus_unregister(ocxlpmem->nvdimm_bus);
> +                       ocxlpmem->nvdimm_bus = NULL;
> +               }
> +
> +               if (ocxlpmem->ev_ctx)
> +                       eventfd_signal(ocxlpmem->ev_ctx, 1);
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
> +/**
> + * ocxlpmem_setup_irq() - Set up the IRQs for the OpenCAPI Persistent Memory device
> + * @ocxlpmem: the device metadata
> + * Return: 0 on success, negative on failure
> + */
> +static int setup_irqs(struct ocxlpmem *ocxlpmem)
> +{
> +       int rc;
> +       u64 irq_addr;
> +
> +       rc = ocxl_afu_irq_alloc(ocxlpmem->ocxl_context,
> +                               &ocxlpmem->irq_id[0]);
> +       if (rc)
> +               return rc;
> +
> +       rc = ocxl_irq_set_handler(ocxlpmem->ocxl_context, ocxlpmem->irq_id[0],
> +                                 imn0_handler, NULL, ocxlpmem);
> +
> +       irq_addr = ocxl_afu_irq_get_addr(ocxlpmem->ocxl_context,
> +                                        ocxlpmem->irq_id[0]);
> +       if (!irq_addr)
> +               return -EFAULT;
> +
> +       ocxlpmem->irq_addr[0] = ioremap(irq_addr, PAGE_SIZE);
> +       if (!ocxlpmem->irq_addr[0])
> +               return -ENODEV;
> +
> +       rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_IMA0_OHP,
> +                                     OCXL_LITTLE_ENDIAN,
> +                                     (u64)ocxlpmem->irq_addr[0]);
> +       if (rc)
> +               goto out_irq0;
> +
> +       rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_IMA0_CFP,
> +                                     OCXL_LITTLE_ENDIAN, 0);
> +       if (rc)
> +               goto out_irq0;
> +
> +       rc = ocxl_afu_irq_alloc(ocxlpmem->ocxl_context, &ocxlpmem->irq_id[1]);
> +       if (rc)
> +               goto out_irq0;
> +
> +       rc = ocxl_irq_set_handler(ocxlpmem->ocxl_context, ocxlpmem->irq_id[1],
> +                                 imn1_handler, NULL, ocxlpmem);
> +       if (rc)
> +               goto out_irq0;
> +
> +       irq_addr = ocxl_afu_irq_get_addr(ocxlpmem->ocxl_context,
> +                                        ocxlpmem->irq_id[1]);
> +       if (!irq_addr) {
> +               rc = -EFAULT;
> +               goto out_irq0;
> +       }
> +
> +       ocxlpmem->irq_addr[1] = ioremap(irq_addr, PAGE_SIZE);
> +       if (!ocxlpmem->irq_addr[1]) {
> +               rc = -ENODEV;
> +               goto out_irq0;
> +       }
> +
> +       rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_IMA1_OHP,
> +                                     OCXL_LITTLE_ENDIAN,
> +                                     (u64)ocxlpmem->irq_addr[1]);
> +       if (rc)
> +               goto out_irq1;
> +
> +       rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_IMA1_CFP,
> +                                     OCXL_LITTLE_ENDIAN, 0);
> +       if (rc)
> +               goto out_irq1;
> +
> +       // Enable doorbells
> +       rc = ocxl_global_mmio_set64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_CHIE,
> +                                   OCXL_LITTLE_ENDIAN,
> +                                   GLOBAL_MMIO_CHI_ELA |
> +                                   GLOBAL_MMIO_CHI_CDA |
> +                                   GLOBAL_MMIO_CHI_CFFS |
> +                                   GLOBAL_MMIO_CHI_CHFS);
> +       if (rc)
> +               goto out_irq1;
> +
> +       return 0;
> +
> +out_irq1:
> +       iounmap(ocxlpmem->irq_addr[1]);
> +       ocxlpmem->irq_addr[1] = NULL;
> +
> +out_irq0:
> +       iounmap(ocxlpmem->irq_addr[0]);
> +       ocxlpmem->irq_addr[0] = NULL;
> +
> +       return rc;
> +}
> +
>  /**
>   * probe_function0() - Set up function 0 for an OpenCAPI persistent memory device
>   * This is important as it enables templates higher than 0 across all other
> @@ -1212,6 +1426,12 @@ static int probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>                 goto err;
>         }
>
> +       rc = setup_irqs(ocxlpmem);
> +       if (rc) {
> +               dev_err(&pdev->dev, "Could not set up OCXL IRQs\n");
> +               goto err;
> +       }
> +
>         rc = setup_command_metadata(ocxlpmem);
>         if (rc) {
>                 dev_err(&pdev->dev, "Could not read command metadata\n");
> diff --git a/drivers/nvdimm/ocxl/ocxlpmem.h b/drivers/nvdimm/ocxl/ocxlpmem.h
> index ee3bd651f254..01721596f982 100644
> --- a/drivers/nvdimm/ocxl/ocxlpmem.h
> +++ b/drivers/nvdimm/ocxl/ocxlpmem.h
> @@ -106,6 +106,9 @@ struct ocxlpmem {
>         struct pci_dev *pdev;
>         struct cdev cdev;
>         struct ocxl_fn *ocxl_fn;
> +#define SCM_IRQ_COUNT 2
> +       int irq_id[SCM_IRQ_COUNT];
> +       void __iomem *irq_addr[SCM_IRQ_COUNT];
>         struct nd_interleave_set nd_set;
>         struct nvdimm_bus_descriptor bus_desc;
>         struct nvdimm_bus *nvdimm_bus;
> @@ -117,6 +120,7 @@ struct ocxlpmem {
>         struct nd_region *nd_region;
>         char fw_version[8 + 1];
>         u32 timeouts[ADMIN_COMMAND_MAX + 1];
> +       struct eventfd_ctx *ev_ctx;
>         u32 max_controller_dump_size;
>         u16 scm_revision; // major/minor
>         u8 readiness_timeout;  /* The worst case time (in seconds) that the host
> diff --git a/include/uapi/nvdimm/ocxlpmem.h b/include/uapi/nvdimm/ocxlpmem.h
> index ca3a7098fa9d..d573bd307e35 100644
> --- a/include/uapi/nvdimm/ocxlpmem.h
> +++ b/include/uapi/nvdimm/ocxlpmem.h
> @@ -71,6 +71,16 @@ struct ioctl_ocxlpmem_controller_stats {
>         __u64 fast_write_count;
>  };
>
> +struct ioctl_ocxlpmem_eventfd {
> +       __s32 eventfd;
> +       __u32 reserved;
> +};
> +
> +#define IOCTL_OCXLPMEM_EVENT_CONTROLLER_DUMP_AVAILABLE (1ULL << (0))
> +#define IOCTL_OCXLPMEM_EVENT_ERROR_LOG_AVAILABLE       (1ULL << (1))
> +#define IOCTL_OCXLPMEM_EVENT_HARDWARE_FATAL            (1ULL << (2))
> +#define IOCTL_OCXLPMEM_EVENT_FIRMWARE_FATAL            (1ULL << (3))
> +
>  /* ioctl numbers */
>  #define OCXLPMEM_MAGIC 0xCA
>  /* OpenCAPI Persistent memory devices */
> @@ -79,5 +89,7 @@ struct ioctl_ocxlpmem_controller_stats {
>  #define IOCTL_OCXLPMEM_CONTROLLER_DUMP_DATA            _IOWR(OCXLPMEM_MAGIC, 0x32, struct ioctl_ocxlpmem_controller_dump_data)
>  #define IOCTL_OCXLPMEM_CONTROLLER_DUMP_COMPLETE                _IO(OCXLPMEM_MAGIC, 0x33)
>  #define IOCTL_OCXLPMEM_CONTROLLER_STATS                        _IO(OCXLPMEM_MAGIC, 0x34)
> +#define IOCTL_OCXLPMEM_EVENTFD                         _IOW(OCXLPMEM_MAGIC, 0x35, struct ioctl_ocxlpmem_eventfd)
> +#define IOCTL_OCXLPMEM_EVENT_CHECK                     _IOR(OCXLPMEM_MAGIC, 0x36, __u64)
>
>  #endif /* _UAPI_OCXL_SCM_H */
> --
> 2.24.1
>
