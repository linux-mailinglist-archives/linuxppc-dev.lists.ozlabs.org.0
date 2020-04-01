Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 170C119A822
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 11:00:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sgC05JWzzDqNs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 20:00:28 +1100 (AEDT)
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
 header.s=20150623 header.b=nKT1PI4l; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sfxh6S55zDr0B
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 19:48:56 +1100 (AEDT)
Received: by mail-ed1-x542.google.com with SMTP id o1so10454677edv.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 01:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nO7NvYL5YbGkypKxGoWuwxxFk6qjRVPvgK2ifgde8ys=;
 b=nKT1PI4lZjRkGXA0qoVt39rD6dCkioi4T1wOtFKczerqB7xR37+SXrexLXVaxyRoRZ
 P/MQ9KkylbCIRFpuT/z2h482ouR713/nq6B9H5/rP7dskLnqLtnramvo665NSX0DmbN8
 77xpnQ9Sm/oZOinLBRsbN0Aq/CY0nAN421P4ND2RoGjW6GiHNbw4u7zITADs4vFdTR7w
 mr9q4JNLEUMY3rKgONFt7/nL5sDfFJp+oXDZsgjhTLd41jLz9ChU3YKFsf9/4GiELmlO
 DUygUUNqRx08PsUj63TKvtq0MTZCMgb+awXdTOjVXo/0Y7HZa/5sHB1KmL2ZXuKtyS1S
 oDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nO7NvYL5YbGkypKxGoWuwxxFk6qjRVPvgK2ifgde8ys=;
 b=BzIfptyzRmojTdd3E8GZ07CvafTAXXUjQpWoTG5+XWgTOavbTrVOmkTHfY8ugSzuzW
 jUbknN6a34k9R7AHLC4QWMOtGTI2MIOl3v7KH3jDFy64jZAEMTb4XCTlJhCmMe8PsSTf
 erY+ZlBsxtGg32LtDwF0new4NJUi9JvTXcc29ofwx9qPh3DXYhfPO/8lnJlDPuKyjdlG
 sHN+O0EkoJvB5r3ejeqgvH0U2Wi2oIbBkxzDaAy97q0xr8PMg/MOZpL3Uz+iAYlZMPw2
 80gpiizAErPXM7CJXGQ6xUVIJhkelSAZwShGwg+ODq/1FKZAHNCt7AV2zb3hQtFblgSq
 liBg==
X-Gm-Message-State: ANhLgQ1GPq/cNNbFdayJMfVa6dvbx4dWbeygTNB92rumfMe/IWoYBzAk
 7k3w2QPLFu+bKMIa83ymdmbiY53/QieQmQ0K7dOzOg==
X-Google-Smtp-Source: ADFU+vufccZcs61ZBlmuOm7ukHfWC6ZhrwNFAphauzXSa/puB0SAYGjCUbhdXtkYuKjFSx5h5oNBplH8yyO/gpHPw6E=
X-Received: by 2002:a17:906:4bc4:: with SMTP id
 x4mr14096929ejv.201.1585730934033; 
 Wed, 01 Apr 2020 01:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200327071202.2159885-1-alastair@d-silva.org>
 <20200327071202.2159885-5-alastair@d-silva.org>
In-Reply-To: <20200327071202.2159885-5-alastair@d-silva.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 1 Apr 2020 01:48:42 -0700
Message-ID: <CAPcyv4hs=4-0UF+bvFFuJb=n-VeMV62-DM_=3LUgMkro6nh2=w@mail.gmail.com>
Subject: Re: [PATCH v4 04/25] ocxl: Remove unnecessary externs
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
> Function declarations don't need externs, remove the existing ones
> so they are consistent with newer code
>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> Acked-by: Andrew Donnellan <ajd@linux.ibm.com>
> Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>

Looks good.


> ---
>  arch/powerpc/include/asm/pnv-ocxl.h | 40 ++++++++++++++---------------
>  include/misc/ocxl.h                 |  6 ++---
>  2 files changed, 22 insertions(+), 24 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/pnv-ocxl.h b/arch/powerpc/include/asm/pnv-ocxl.h
> index 560a19bb71b7..205efc41a33c 100644
> --- a/arch/powerpc/include/asm/pnv-ocxl.h
> +++ b/arch/powerpc/include/asm/pnv-ocxl.h
> @@ -9,29 +9,27 @@
>  #define PNV_OCXL_TL_BITS_PER_RATE       4
>  #define PNV_OCXL_TL_RATE_BUF_SIZE       ((PNV_OCXL_TL_MAX_TEMPLATE+1) * PNV_OCXL_TL_BITS_PER_RATE / 8)
>
> -extern int pnv_ocxl_get_actag(struct pci_dev *dev, u16 *base, u16 *enabled,
> -                       u16 *supported);
> -extern int pnv_ocxl_get_pasid_count(struct pci_dev *dev, int *count);
> +int pnv_ocxl_get_actag(struct pci_dev *dev, u16 *base, u16 *enabled, u16 *supported);
> +int pnv_ocxl_get_pasid_count(struct pci_dev *dev, int *count);
>
> -extern int pnv_ocxl_get_tl_cap(struct pci_dev *dev, long *cap,
> +int pnv_ocxl_get_tl_cap(struct pci_dev *dev, long *cap,
>                         char *rate_buf, int rate_buf_size);
> -extern int pnv_ocxl_set_tl_conf(struct pci_dev *dev, long cap,
> -                       uint64_t rate_buf_phys, int rate_buf_size);
> -
> -extern int pnv_ocxl_get_xsl_irq(struct pci_dev *dev, int *hwirq);
> -extern void pnv_ocxl_unmap_xsl_regs(void __iomem *dsisr, void __iomem *dar,
> -                               void __iomem *tfc, void __iomem *pe_handle);
> -extern int pnv_ocxl_map_xsl_regs(struct pci_dev *dev, void __iomem **dsisr,
> -                               void __iomem **dar, void __iomem **tfc,
> -                               void __iomem **pe_handle);
> -
> -extern int pnv_ocxl_spa_setup(struct pci_dev *dev, void *spa_mem, int PE_mask,
> -                       void **platform_data);
> -extern void pnv_ocxl_spa_release(void *platform_data);
> -extern int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle);
> -
> -extern int pnv_ocxl_alloc_xive_irq(u32 *irq, u64 *trigger_addr);
> -extern void pnv_ocxl_free_xive_irq(u32 irq);
> +int pnv_ocxl_set_tl_conf(struct pci_dev *dev, long cap,
> +                        uint64_t rate_buf_phys, int rate_buf_size);
> +
> +int pnv_ocxl_get_xsl_irq(struct pci_dev *dev, int *hwirq);
> +void pnv_ocxl_unmap_xsl_regs(void __iomem *dsisr, void __iomem *dar,
> +                            void __iomem *tfc, void __iomem *pe_handle);
> +int pnv_ocxl_map_xsl_regs(struct pci_dev *dev, void __iomem **dsisr,
> +                         void __iomem **dar, void __iomem **tfc,
> +                         void __iomem **pe_handle);
> +
> +int pnv_ocxl_spa_setup(struct pci_dev *dev, void *spa_mem, int PE_mask, void **platform_data);
> +void pnv_ocxl_spa_release(void *platform_data);
> +int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle);
> +
> +int pnv_ocxl_alloc_xive_irq(u32 *irq, u64 *trigger_addr);
> +void pnv_ocxl_free_xive_irq(u32 irq);
>  u64 pnv_ocxl_platform_lpc_setup(struct pci_dev *pdev, u64 size);
>  void pnv_ocxl_platform_lpc_release(struct pci_dev *pdev);
>
> diff --git a/include/misc/ocxl.h b/include/misc/ocxl.h
> index 06dd5839e438..0a762e387418 100644
> --- a/include/misc/ocxl.h
> +++ b/include/misc/ocxl.h
> @@ -173,7 +173,7 @@ int ocxl_context_detach(struct ocxl_context *ctx);
>   *
>   * Returns 0 on success, negative on failure
>   */
> -extern int ocxl_afu_irq_alloc(struct ocxl_context *ctx, int *irq_id);
> +int ocxl_afu_irq_alloc(struct ocxl_context *ctx, int *irq_id);
>
>  /**
>   * Frees an IRQ associated with an AFU context
> @@ -182,7 +182,7 @@ extern int ocxl_afu_irq_alloc(struct ocxl_context *ctx, int *irq_id);
>   *
>   * Returns 0 on success, negative on failure
>   */
> -extern int ocxl_afu_irq_free(struct ocxl_context *ctx, int irq_id);
> +int ocxl_afu_irq_free(struct ocxl_context *ctx, int irq_id);
>
>  /**
>   * Gets the address of the trigger page for an IRQ
> @@ -193,7 +193,7 @@ extern int ocxl_afu_irq_free(struct ocxl_context *ctx, int irq_id);
>   *
>   * returns the trigger page address, or 0 if the IRQ is not valid
>   */
> -extern u64 ocxl_afu_irq_get_addr(struct ocxl_context *ctx, int irq_id);
> +u64 ocxl_afu_irq_get_addr(struct ocxl_context *ctx, int irq_id);
>
>  /**
>   * Provide a callback to be called when an IRQ is triggered
> --
> 2.24.1
>
