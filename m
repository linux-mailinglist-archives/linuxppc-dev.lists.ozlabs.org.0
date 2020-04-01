Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A17F619A849
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 11:07:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sgMD01hVzDqZW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 20:07:36 +1100 (AEDT)
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
 header.s=20150623 header.b=hTimd5IY; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sfyQ6qQSzDr10
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 19:49:34 +1100 (AEDT)
Received: by mail-ed1-x541.google.com with SMTP id cf14so28673295edb.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 01:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UN+wHZJTrcu6c2DZIJ8HGRDVBKCDEPMCRCE7ZQEQTH8=;
 b=hTimd5IY+hTrOkh1p7KqZ0axrIUJgA8aekcpldRM6K9XQupypeq6MkUu+ggRqryYZL
 x3rcZjrA+Y0jKfVyqzmVLjKEqr3O6iCBN8GDPJzQJi0cEQ/7ObMmXUtXR9XRnlRU8ZiF
 QkYVKtMu4mENT5W/pzpOUStrq0OytQ5oulJ0UhL1avGRyOevi9/UwPw4Ykxv3wnZ/OwP
 HyQu22Ie3HIn0/IIyicOfJJ+SkzyBj7Hq8Ljhf/QIcUeGPjXdPcMfFQIvRwGIm43aWdr
 ui6jSj1L0yFrnNz0X3pBByQOSEhf24bDK4BDfm5vSnLWL82Bjny7/+HfR7ecl+iDeNj+
 l41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UN+wHZJTrcu6c2DZIJ8HGRDVBKCDEPMCRCE7ZQEQTH8=;
 b=UdWG8pUX7L3+G9Lwi0QVu1tZgCQsrPw9/c5RUSw8OZoZGWkoc3Sevx73UdJX6vh/Sb
 pBpGNwApsskErL4bKYlvFIwCEHRfAII4hiDITHWSUsKBVK8Jn3Z0bgThP8/0jdlU/8rR
 4VfB7x8C0T2Q0janJmRRofPS1RfTbeTYanlZ1c7oC4qVTuRWM5yxWikLC9z610tIgA0R
 ADmx4KtXlzqSxliL6PxuJ/clO9BuqEI0eC1YqJM2m9bZNjXJWohGmNP+YMLLbAjz+mCF
 kGwUF8k4iiNKdCUnOya2ppnC8OeDYN2dA13EGD0vC3hDtl/tuw6M61bZhNxcHtdIEt9j
 x0Ig==
X-Gm-Message-State: ANhLgQ07JsxihSTNJaJhf1rUWBc3DdH02Ky8foJb9+YjKLQ1XUmWceO9
 keDfkBzvFxtUFEJ5HwdA4BRpKULL6flEs36FlezVQQ==
X-Google-Smtp-Source: ADFU+vuTuxIfbgq1b9JfG+WohU6wvy4jaujfdFzqOb3NMAMPXWIOfeafCvEeGwbQtVd/xByPDwh7XT1QdUOquEPXjL8=
X-Received: by 2002:a05:6402:3044:: with SMTP id
 bu4mr20560123edb.123.1585730971200; 
 Wed, 01 Apr 2020 01:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200327071202.2159885-1-alastair@d-silva.org>
 <20200327071202.2159885-8-alastair@d-silva.org>
In-Reply-To: <20200327071202.2159885-8-alastair@d-silva.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 1 Apr 2020 01:49:19 -0700
Message-ID: <CAPcyv4gUU4PbQK1YJLfOToLDmFWsWWLySwkqHuoqGDvKZJGQvg@mail.gmail.com>
Subject: Re: [PATCH v4 07/25] ocxl: Add functions to map/unmap LPC memory
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
> Add functions to map/unmap LPC memory
>

"map memory" is an overloaded term. I'm guessing this patch has
nothing to do with mapping memory in the MMU. Is it updating hardware
resource decoders to start claiming address space that was allocated
previously?

> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
>  drivers/misc/ocxl/core.c          | 51 +++++++++++++++++++++++++++++++
>  drivers/misc/ocxl/ocxl_internal.h |  3 ++
>  include/misc/ocxl.h               | 21 +++++++++++++
>  3 files changed, 75 insertions(+)
>
> diff --git a/drivers/misc/ocxl/core.c b/drivers/misc/ocxl/core.c
> index 2531c6cf19a0..75ff14e3882a 100644
> --- a/drivers/misc/ocxl/core.c
> +++ b/drivers/misc/ocxl/core.c
> @@ -210,6 +210,56 @@ static void unmap_mmio_areas(struct ocxl_afu *afu)
>         release_fn_bar(afu->fn, afu->config.global_mmio_bar);
>  }
>
> +int ocxl_afu_map_lpc_mem(struct ocxl_afu *afu)
> +{
> +       struct pci_dev *dev = to_pci_dev(afu->fn->dev.parent);
> +
> +       if ((afu->config.lpc_mem_size + afu->config.special_purpose_mem_size) == 0)
> +               return 0;
> +
> +       afu->lpc_base_addr = ocxl_link_lpc_map(afu->fn->link, dev);
> +       if (afu->lpc_base_addr == 0)
> +               return -EINVAL;
> +
> +       if (afu->config.lpc_mem_size > 0) {
> +               afu->lpc_res.start = afu->lpc_base_addr + afu->config.lpc_mem_offset;
> +               afu->lpc_res.end = afu->lpc_res.start + afu->config.lpc_mem_size - 1;
> +       }
> +
> +       if (afu->config.special_purpose_mem_size > 0) {
> +               afu->special_purpose_res.start = afu->lpc_base_addr +
> +                                                afu->config.special_purpose_mem_offset;
> +               afu->special_purpose_res.end = afu->special_purpose_res.start +
> +                                              afu->config.special_purpose_mem_size - 1;
> +       }
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(ocxl_afu_map_lpc_mem);
> +
> +struct resource *ocxl_afu_lpc_mem(struct ocxl_afu *afu)
> +{
> +       return &afu->lpc_res;
> +}
> +EXPORT_SYMBOL_GPL(ocxl_afu_lpc_mem);
> +
> +static void unmap_lpc_mem(struct ocxl_afu *afu)
> +{
> +       struct pci_dev *dev = to_pci_dev(afu->fn->dev.parent);
> +
> +       if (afu->lpc_res.start || afu->special_purpose_res.start) {
> +               void *link = afu->fn->link;
> +
> +               // only release the link when the the last consumer calls release
> +               ocxl_link_lpc_release(link, dev);
> +
> +               afu->lpc_res.start = 0;
> +               afu->lpc_res.end = 0;
> +               afu->special_purpose_res.start = 0;
> +               afu->special_purpose_res.end = 0;
> +       }
> +}
> +
>  static int configure_afu(struct ocxl_afu *afu, u8 afu_idx, struct pci_dev *dev)
>  {
>         int rc;
> @@ -251,6 +301,7 @@ static int configure_afu(struct ocxl_afu *afu, u8 afu_idx, struct pci_dev *dev)
>
>  static void deconfigure_afu(struct ocxl_afu *afu)
>  {
> +       unmap_lpc_mem(afu);
>         unmap_mmio_areas(afu);
>         reclaim_afu_pasid(afu);
>         reclaim_afu_actag(afu);
> diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_internal.h
> index 2d7575225bd7..7b975a89db7b 100644
> --- a/drivers/misc/ocxl/ocxl_internal.h
> +++ b/drivers/misc/ocxl/ocxl_internal.h
> @@ -52,6 +52,9 @@ struct ocxl_afu {
>         void __iomem *global_mmio_ptr;
>         u64 pp_mmio_start;
>         void *private;
> +       u64 lpc_base_addr; /* Covers both LPC & special purpose memory */
> +       struct resource lpc_res;
> +       struct resource special_purpose_res;
>  };
>
>  enum ocxl_context_status {
> diff --git a/include/misc/ocxl.h b/include/misc/ocxl.h
> index 357ef1aadbc0..d8b0b4d46bfb 100644
> --- a/include/misc/ocxl.h
> +++ b/include/misc/ocxl.h
> @@ -203,6 +203,27 @@ int ocxl_irq_set_handler(struct ocxl_context *ctx, int irq_id,
>
>  // AFU Metadata
>
> +/**
> + * ocxl_afu_map_lpc_mem() - Map the LPC system & special purpose memory for an AFU
> + * Do not call this during device discovery, as there may me multiple

s/me/be/


> + * devices on a link, and the memory is mapped for the whole link, not
> + * just one device. It should only be called after all devices have
> + * registered their memory on the link.
> + *
> + * @afu: The AFU that has the LPC memory to map
> + *
> + * Returns 0 on success, negative on failure
> + */
> +int ocxl_afu_map_lpc_mem(struct ocxl_afu *afu);
> +
> +/**
> + * ocxl_afu_lpc_mem() - Get the physical address range of LPC memory for an AFU
> + * @afu: The AFU associated with the LPC memory
> + *
> + * Returns a pointer to the resource struct for the physical address range
> + */
> +struct resource *ocxl_afu_lpc_mem(struct ocxl_afu *afu);
> +
>  /**
>   * ocxl_afu_config() - Get a pointer to the config for an AFU
>   * @afu: a pointer to the AFU to get the config for
> --
> 2.24.1
>
