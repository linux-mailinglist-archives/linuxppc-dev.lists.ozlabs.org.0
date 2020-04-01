Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E148119A82B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 11:02:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sgFZ0VkDzDr3t
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 20:02:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Nox6OXWG; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sfxr0gprzDr0k
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 19:49:04 +1100 (AEDT)
Received: by mail-ed1-x542.google.com with SMTP id a43so28679878edf.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 01:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jG4wOYVYC+k6uIDCHQ8wcXaTiCDZtncKRBQcnse1vfY=;
 b=Nox6OXWGA798Cr52xBMr6YHpFOgZ7GP4CUrcEL/TAjbaMmfb/e8Zq882nUJlst3xBC
 lRz42jYj7FddMpixYXtQgSC96iREDWwS/FzvP3U4+2OMv3r9/9omUEZ8lHaLCPchiKOQ
 QPvUwGlYZT0Xon0Q/LupecuVEt+A1WIAhR6LeV/v1+xa4/C9wpYDQUb4Fv+rb9x00T9h
 ED5TXU8f8rgLSSIXyzx2rP22L7pZXROOGddOLANi4qfl6m48TCJTIzm/F0kJ1jhGQZKu
 oW5Tpq7m5kP0iB3iChoW//Mw34MO1wRRyqjxvkSy5ucVyDc2vYNXewxaxLLT1YUg7VkA
 /78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jG4wOYVYC+k6uIDCHQ8wcXaTiCDZtncKRBQcnse1vfY=;
 b=iAUnuIPFa+/8Qs1pXw8TMoSSyLnrBoMFXhLbUgHgkGPlFzCok4w9QhnUnR36U9mS3l
 6Tjyiq3sS0UY0SAvPvvAtk2yEgiaMuzl7s7YRsCvMU3k3A5zgc9xsZe7gP1zZc+/vfsX
 mIZryjMNEOeEbtT0mvDKK32hJ3VGVBwd/agDVtnEQXxKFvb8rtxUvo9rH/B719V2XVS1
 7d+PqFPLFphcMsjYCGkWGJigZXKwEp0GHfxIwqnUcXNbN+fdoaL539goq+V2mFdp6ohj
 ppr0Yqd04sDVnwJJ6Dm4BDORAjm7MNOneiHbRy4lh+B+N84p+huFO4wTSnqyl+O0mtwb
 znwg==
X-Gm-Message-State: ANhLgQ3zrDcIVnHWlyqUk+izOx7N7B2CpmWB7r99cJsyjMWuuBg7W9sz
 vJZVk/86I0t8XDBrJYpLst883mUlVEqZEubxa4d29r0/
X-Google-Smtp-Source: ADFU+vtYDJ13Duz6ckwhGdZm21tZ+Kg6VHjBFgfaPtTtPJACd+l6/VGlHTLDhLEcu8EYuwx1H1IWNeYptubQg4xr5hI=
X-Received: by 2002:a05:6402:22b7:: with SMTP id
 cx23mr19203222edb.383.1585730941065; 
 Wed, 01 Apr 2020 01:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200327071202.2159885-1-alastair@d-silva.org>
 <20200327071202.2159885-7-alastair@d-silva.org>
In-Reply-To: <20200327071202.2159885-7-alastair@d-silva.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 1 Apr 2020 01:48:50 -0700
Message-ID: <CAPcyv4jyFQa5BDPCSQ6kmFY8CvWgbydePcn8B4M_Zyc1c7MGpg@mail.gmail.com>
Subject: Re: [PATCH v4 06/25] ocxl: Tally up the LPC memory on a link & allow
 it to be mapped
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

On Sun, Mar 29, 2020 at 10:53 PM Alastair D'Silva <alastair@d-silva.org> wrote:
>
> OpenCAPI LPC memory is allocated per link, but each link supports
> multiple AFUs, and each AFU can have LPC memory assigned to it.

Is there an OpenCAPI primer to decode these objects and their
associations that I can reference?


>
> This patch tallys the memory for all AFUs on a link, allowing it
> to be mapped in a single operation after the AFUs have been
> enumerated.
>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  drivers/misc/ocxl/core.c          | 10 ++++++
>  drivers/misc/ocxl/link.c          | 60 +++++++++++++++++++++++++++++++
>  drivers/misc/ocxl/ocxl_internal.h | 33 +++++++++++++++++
>  3 files changed, 103 insertions(+)
>
> diff --git a/drivers/misc/ocxl/core.c b/drivers/misc/ocxl/core.c
> index b7a09b21ab36..2531c6cf19a0 100644
> --- a/drivers/misc/ocxl/core.c
> +++ b/drivers/misc/ocxl/core.c
> @@ -230,8 +230,18 @@ static int configure_afu(struct ocxl_afu *afu, u8 afu_idx, struct pci_dev *dev)
>         if (rc)
>                 goto err_free_pasid;
>
> +       if (afu->config.lpc_mem_size || afu->config.special_purpose_mem_size) {
> +               rc = ocxl_link_add_lpc_mem(afu->fn->link, afu->config.lpc_mem_offset,
> +                                          afu->config.lpc_mem_size +
> +                                          afu->config.special_purpose_mem_size);
> +               if (rc)
> +                       goto err_free_mmio;
> +       }
> +
>         return 0;
>
> +err_free_mmio:
> +       unmap_mmio_areas(afu);
>  err_free_pasid:
>         reclaim_afu_pasid(afu);
>  err_free_actag:
> diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
> index 58d111afd9f6..af119d3ef79a 100644
> --- a/drivers/misc/ocxl/link.c
> +++ b/drivers/misc/ocxl/link.c
> @@ -84,6 +84,11 @@ struct ocxl_link {
>         int dev;
>         atomic_t irq_available;
>         struct spa *spa;
> +       struct mutex lpc_mem_lock; /* protects lpc_mem & lpc_mem_sz */
> +       u64 lpc_mem_sz; /* Total amount of LPC memory presented on the link */
> +       u64 lpc_mem;
> +       int lpc_consumers;
> +
>         void *platform_data;
>  };
>  static struct list_head links_list = LIST_HEAD_INIT(links_list);
> @@ -396,6 +401,8 @@ static int alloc_link(struct pci_dev *dev, int PE_mask, struct ocxl_link **out_l
>         if (rc)
>                 goto err_spa;
>
> +       mutex_init(&link->lpc_mem_lock);
> +
>         /* platform specific hook */
>         rc = pnv_ocxl_spa_setup(dev, link->spa->spa_mem, PE_mask,
>                                 &link->platform_data);
> @@ -711,3 +718,56 @@ void ocxl_link_free_irq(void *link_handle, int hw_irq)
>         atomic_inc(&link->irq_available);
>  }
>  EXPORT_SYMBOL_GPL(ocxl_link_free_irq);
> +
> +int ocxl_link_add_lpc_mem(void *link_handle, u64 offset, u64 size)
> +{
> +       struct ocxl_link *link = (struct ocxl_link *)link_handle;
> +
> +       // Check for overflow
> +       if (offset > (offset + size))
> +               return -EINVAL;
> +
> +       mutex_lock(&link->lpc_mem_lock);
> +       link->lpc_mem_sz = max(link->lpc_mem_sz, offset + size);
> +
> +       mutex_unlock(&link->lpc_mem_lock);
> +
> +       return 0;
> +}
> +
> +u64 ocxl_link_lpc_map(void *link_handle, struct pci_dev *pdev)
> +{
> +       struct ocxl_link *link = (struct ocxl_link *)link_handle;
> +
> +       mutex_lock(&link->lpc_mem_lock);
> +
> +       if (!link->lpc_mem)
> +               link->lpc_mem = pnv_ocxl_platform_lpc_setup(pdev, link->lpc_mem_sz);
> +
> +       if (link->lpc_mem)
> +               link->lpc_consumers++;
> +       mutex_unlock(&link->lpc_mem_lock);
> +
> +       return link->lpc_mem;
> +}
> +
> +void ocxl_link_lpc_release(void *link_handle, struct pci_dev *pdev)
> +{
> +       struct ocxl_link *link = (struct ocxl_link *)link_handle;
> +
> +       mutex_lock(&link->lpc_mem_lock);
> +
> +       if (!link->lpc_mem) {
> +               mutex_unlock(&link->lpc_mem_lock);
> +               return;
> +       }
> +
> +       WARN_ON(--link->lpc_consumers < 0);
> +
> +       if (link->lpc_consumers == 0) {
> +               pnv_ocxl_platform_lpc_release(pdev);
> +               link->lpc_mem = 0;
> +       }
> +
> +       mutex_unlock(&link->lpc_mem_lock);
> +}
> diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_internal.h
> index 198e4e4bc51d..2d7575225bd7 100644
> --- a/drivers/misc/ocxl/ocxl_internal.h
> +++ b/drivers/misc/ocxl/ocxl_internal.h
> @@ -142,4 +142,37 @@ int ocxl_irq_offset_to_id(struct ocxl_context *ctx, u64 offset);
>  u64 ocxl_irq_id_to_offset(struct ocxl_context *ctx, int irq_id);
>  void ocxl_afu_irq_free_all(struct ocxl_context *ctx);
>
> +/**
> + * ocxl_link_add_lpc_mem() - Increment the amount of memory required by an OpenCAPI link
> + *
> + * @link_handle: The OpenCAPI link handle
> + * @offset: The offset of the memory to add
> + * @size: The number of bytes to increment memory on the link by
> + *
> + * Returns 0 on success, -EINVAL on overflow
> + */
> +int ocxl_link_add_lpc_mem(void *link_handle, u64 offset, u64 size);
> +
> +/**
> + * ocxl_link_lpc_map() - Map the LPC memory for an OpenCAPI device
> + * Since LPC memory belongs to a link, the whole LPC memory available
> + * on the link must be mapped in order to make it accessible to a device.
> + * @link_handle: The OpenCAPI link handle
> + * @pdev: A device that is on the link
> + *
> + * Returns the address of the mapped LPC memory, or 0 on error
> + */
> +u64 ocxl_link_lpc_map(void *link_handle, struct pci_dev *pdev);
> +
> +/**
> + * ocxl_link_lpc_release() - Release the LPC memory device for an OpenCAPI device
> + *
> + * Offlines LPC memory on an OpenCAPI link for a device. If this is the
> + * last device on the link to release the memory, unmap it from the link.
> + *
> + * @link_handle: The OpenCAPI link handle
> + * @pdev: A device that is on the link
> + */
> +void ocxl_link_lpc_release(void *link_handle, struct pci_dev *pdev);
> +
>  #endif /* _OCXL_INTERNAL_H_ */
> --
> 2.24.1
>
